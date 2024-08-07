package com.integrosys.cms.ui.tatdoc;

import java.util.Date;

import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.cms.batch.MockBatchSpringTransactionManager;

public class TatDocSolicitorInstructionActionTest extends AbstractTransactionalDataSourceSpringContextTests {
	protected String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	public void onSetUp() throws Exception {
		super.onSetUp();

		// insert AA
		jdbcTemplate.update("insert into sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, los_bca_ref_num) values (?, ?)",
				new Object[] { new Long(123), "LOS-123" });

		// insert Actual TAT
		jdbcTemplate.update("insert into cms_tat_document (tat_id, cms_lsp_lmt_profile_id) values (?, ?)",
				new Object[] { new Long(456), new Long(123) });

		// insert Stage TAT
		jdbcTemplate.update("insert into cms_stage_tat_document (tat_id, cms_lsp_lmt_profile_id) values (?, ?)",
				new Object[] { new Long(457), new Long(123) });

		// insert Transaction for TAT
		jdbcTemplate.update("insert into transaction (transaction_id, "
				+ "reference_id, staging_reference_id, transaction_type) values (?, ?, ?, ?)", new Object[] { "12345",
				new Long(456), new Long(457), "TAT_DOC" });
	}

	public void testRequestUpdateInstructionDate() {
		TatDocSolicitorInstructionAction action = new TatDocSolicitorInstructionAction();
		action.setJdbcTemplate(jdbcTemplate);
		action.setTransactionTemplate(new TransactionTemplate(new MockBatchSpringTransactionManager()));

		MockHttpServletRequest request = new MockHttpServletRequest();
		request.setParameter("LosLimitProfileReference", "LOS-123");

		try {
			action.execute(null, null, request, null);
		}
		catch (Exception ex) {
			fail("failed to execute instruction date update action, nested exception is " + ex);
		}

		Date actualTatInstructedDate = (Date) jdbcTemplate.queryForObject(
				"select solicitor_instruction_date FROM cms_tat_document WHERE tat_id = ?",
				new Object[] { new Long(456) }, Date.class);

		Date stagingTatInstructedDate = (Date) jdbcTemplate.queryForObject(
				"select solicitor_instruction_date FROM cms_stage_tat_document WHERE tat_id = ?",
				new Object[] { new Long(457) }, Date.class);

		assertEquals(actualTatInstructedDate, stagingTatInstructedDate);
	}

	public void testUpdateFacilityMasterQuery() {
		StringBuffer facBuf = new StringBuffer();
		facBuf.append("UPDATE cms_facility_master SET date_instructed = ? ");
		facBuf.append("WHERE cms_lsp_appr_lmts_id IN (SELECT cms_lsp_appr_lmts_id ");
		facBuf.append("FROM sci_lsp_appr_lmts WHERE cms_limit_profile_id = ?)");

		jdbcTemplate.update(facBuf.toString(), new Object[] { new Date(), new Long(123) });

		facBuf = new StringBuffer();
		facBuf.append("UPDATE cms_stg_facility_master SET date_instructed = ? ");
		facBuf.append("WHERE id IN (SELECT staging_reference_id ");
		facBuf.append("FROM transaction WHERE reference_id IN ( ");
		facBuf.append("SELECT id FROM cms_facility_master WHERE cms_lsp_appr_lmts_id IN ( ");
		facBuf.append("SELECT cms_lsp_appr_lmts_id FROM sci_lsp_appr_lmts ");
		facBuf.append("WHERE cms_limit_profile_id = ?)) AND transaction_type = ?)");

		jdbcTemplate.update(facBuf.toString(), new Object[] { new Date(), new Long(123), "FACILITY" });
	}

}
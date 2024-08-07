package com.integrosys.cms.app.transaction;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.AbstractTransactionalSpringContextTests;

import com.integrosys.base.businfra.search.SearchResult;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.common.constant.ICMSConstant;

/**
 * Integration test for {@link CMSTransactionDAO}, Database server must be
 * started.
 * 
 * @author Chong Jun Yong
 * 
 */
public class CMSTransactionDAOIntegrationTest extends AbstractTransactionalSpringContextTests {
	CMSTransactionDAO dao;

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();
	}

	protected String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml" };
	}

	public void testGetTransactionCount() {
		DataSource ds = (DataSource) getApplicationContext().getBean("ofaPool");

		dao = new CMSTransactionDAO();
		dao.setDataSource(ds);

		CMSTrxSearchCriteria criteria = new CMSTrxSearchCriteria();

		int count = dao.getAllTransactionCount(criteria);
		assertTrue(count > 0);
	}

	public void testSearchWorkflowTransactions() {
		DataSource ds = (DataSource) getApplicationContext().getBean("ofaPool");

		dao = new CMSTransactionDAO();
		dao.setDataSource(ds);

		CMSTrxSearchCriteria criteria = new CMSTrxSearchCriteria();
		criteria.setAaNumber("ARBS-0001");

		SearchResult sr = dao.searchWorkflowTransactions(criteria);
		assertNotNull(sr);
		assertTrue(sr.getResultList().size() == 0);
	}

	public void testSearchAllTodoTransactions() {
		DataSource ds = (DataSource) getApplicationContext().getBean("ofaPool");

		dao = new CMSTransactionDAO();
		dao.setDataSource(ds);

		CMSTrxSearchCriteria criteria = new CMSTrxSearchCriteria();
		criteria.setSearchIndicator(ICMSConstant.TODO_ACTION);
		criteria.setOnlyMembershipRecords(false);

		SearchResult sr = dao.searchTransactions(criteria);
		assertNotNull(sr);
		assertTrue(sr.getResultList().size() > 0);
	}

	public void testSearchToTrackTransactions() {
		DataSource ds = (DataSource) getApplicationContext().getBean("ofaPool");

		dao = new CMSTransactionDAO();
		dao.setDataSource(ds);

		CMSTrxSearchCriteria criteria = new CMSTrxSearchCriteria();
		criteria.setSearchIndicator(ICMSConstant.TOTRACK_ACTION);
		criteria.setOnlyMembershipRecords(false);

		SearchResult sr = dao.searchTransactions(criteria);
		assertNotNull(sr);
		assertTrue(sr.getResultList().size() == 0);
	}

	public void testSearchPendingPerfectCreditFolder() {
		DataSource ds = (DataSource) getApplicationContext().getBean("ofaPool");

		dao = new CMSTransactionDAO();
		dao.setDataSource(ds);

		JdbcTemplate jdbc = new JdbcTemplate(ds);
		jdbc.update("insert into sci_le_sub_profile (cms_le_sub_profile_id, lsp_short_name) values (?, ?)",
				new Object[] { new Long(20080918000111222l), "LEHMAN BROTHERS" });

		jdbc.update("insert into sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, cms_customer_id, llp_le_id, "
				+ " llp_bca_ref_num, los_bca_ref_num, llp_bca_ref_appr_date, source_id, cms_orig_country, "
				+ " cms_orig_organisation, cms_bca_status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", new Object[] {
				new Long(20080918000222333l), new Long(20080918000111222l), "CIF-00001", "SIBS-100-2345",
				"RLOS-HP-1234", new Date(), "SIBS", "MY", "50", "ACTIVE" });

		jdbc.update("insert into cms_team_country_code (code_id, country_code, team_id) values (?, ?, ?)",
				new Object[] { new Long(20080918111333555l), "MY", new Long(20080918222444666l) });

		jdbc.update("insert into cms_team_organisation_code (code_id, organisation_code, team_id) values (?, ?, ?)",
				new Object[] { new Long(20080918111333555l), "50", new Long(20080918222444666l) });

		int count = jdbc.queryForInt("select count(*) from sci_lsp_lmt_profile where cms_lsp_lmt_profile_id = ?",
				new Object[] { new Long(20080918000222333l) });
		assertEquals(1, count);

		CMSTrxSearchCriteria criteria = new CMSTrxSearchCriteria();
		criteria.setPendingTask(ICMSConstant.CREDIT_FOLDER);
		criteria.setTeamID(20080918222444666l);
		criteria.setNItems(1);

		SearchResult sr = dao.searchPendingCases(criteria);
		assertNotNull(sr);
		assertTrue(sr.getResultList().size() == 1);

		OBPendingCasesSearchResult result = (OBPendingCasesSearchResult) ((List) sr.getResultList()).get(0);
		assertEquals("SIBS-100-2345", result.getBcaRefNum());
		assertEquals("RLOS-HP-1234", result.getLosBcaRefNum());

		criteria.setAaNumber("SIBS-100-2345");
		sr = dao.searchPendingCases(criteria);
		assertNotNull(sr);
		assertTrue(sr.getResultList().size() == 1);

		criteria.setLegalID("CIF-00001");
		sr = dao.searchPendingCases(criteria);
		assertNotNull(sr);
		assertTrue(sr.getResultList().size() == 1);

		result = (OBPendingCasesSearchResult) ((List) sr.getResultList()).get(0);
		assertEquals("SIBS-100-2345", result.getBcaRefNum());
		assertEquals("RLOS-HP-1234", result.getLosBcaRefNum());

		criteria.setCustomerName("LEHM");
		sr = dao.searchPendingCases(criteria);
		assertNotNull(sr);
		assertTrue(sr.getResultList().size() == 1);

		result = (OBPendingCasesSearchResult) ((List) sr.getResultList()).get(0);
		assertEquals("SIBS-100-2345", result.getBcaRefNum());
		assertEquals("RLOS-HP-1234", result.getLosBcaRefNum());
		assertEquals("New", result.getTrxStatus());

		jdbc.update("insert into cms_tat_document (tat_id, cms_lsp_lmt_profile_id) values (?, ?)", new Object[] {
				new Long(20080918999444333l), new Long(20080918000222333l) });

		sr = dao.searchPendingCases(criteria);
		assertNotNull(sr);
		assertTrue(sr.getResultList().size() == 1);

		result = (OBPendingCasesSearchResult) ((List) sr.getResultList()).get(0);
		assertEquals("SIBS-100-2345", result.getBcaRefNum());
		assertEquals("RLOS-HP-1234", result.getLosBcaRefNum());
		assertEquals("In Progress", result.getTrxStatus());

		jdbc.update("update cms_tat_document set doc_completion_date = ? where tat_id = ?", new Object[] { new Date(),
				new Long(20080918999444333l) });

		sr = dao.searchPendingCases(criteria);
		assertTrue(sr.getResultList().isEmpty());
	}
}

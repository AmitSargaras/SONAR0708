package com.integrosys.cms.app.eventmonitor.documentexpiry;

import java.util.Date;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.eventmonitor.common.OBDateRuleParam;

/**
 * @author Chong Jun Yong
 * 
 */
public class ExpiredDocumentDAOIntegrationTest extends AbstractTransactionalDataSourceSpringContextTests {

	protected String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	protected void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();
	}

	public void testInsertOneRecordAndQueryOnly() {

		ExpiredDocumentDAO dao = new ExpiredDocumentDAO();
		dao.setJdbcTemplate(getJdbcTemplate());

		getJdbcTemplate().update(
				"insert into cms_checklist_item (doc_item_id, status, doc_item_ref, expiry_date, checklist_id) "
						+ "values (?, ?, ?, ?, ?)",
				new Object[] { new Long(20090114000111222l), "COMPLETED", new Long(20090114000111222l),
						DateUtils.addDays(new Date(), -1), new Long(20090114000333444l) });

		getJdbcTemplate().update(
				"insert into stage_checklist_item (doc_item_id, status, doc_item_ref, expiry_date, checklist_id) "
						+ "values (?, ?, ?, ?, ?)",
				new Object[] { new Long(20090114000111223l), "COMPLETED", new Long(20090114000111222l),
						DateUtils.addDays(new Date(), -1), new Long(20090114000333445l) });

		getJdbcTemplate().update(
				"insert into stage_checklist (checklist_id, doc_orig_country, version_time) values (?, ?, ?)",
				new Object[] { new Long(20090114000333445l), "MY", new Long(1) });

		getJdbcTemplate().update(
				"insert into transaction (transaction_id, reference_id, staging_reference_id, transaction_type, status) "
						+ "values (?, ?, ?, ?, ?)",
				new Object[] { "20090114666777888", new Long(20090114000333444l), new Long(20090114000333445l),
						"CHECKLIST", "ACTIVE" });

		OBDateRuleParam ruleParam = new OBDateRuleParam();
		ruleParam.setNumOfDays(1);

		DocExpiryDAOResult result = (DocExpiryDAOResult) dao.getInitialSet(ruleParam);
		assertNotNull(result);
		assertTrue(result.hasNextElement());
	}
}

package com.integrosys.cms.app.limit.bus;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.cms.app.transaction.ICMSTrxValue;

/**
 * Integration Test case for LimitDAO
 * @author Chong Jun Yong
 * 
 */
public class LimitDAOIntegrationTest extends AbstractTransactionalDataSourceSpringContextTests {
	public String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	public void testRetrieveListOfAARequiredResponseSqlQuery() {
		LimitDAO limitJdbcDao = new LimitDAO();
		limitJdbcDao.setJdbcTemplate(getJdbcTemplate());

		List list = limitJdbcDao.retrieveListOfCmsLimitProfileIdNoResponseToSource();
		assertNotNull(list);
	}

	public void testInsertAndRetrieveRecordsFromAAResponseLog() {
		getJdbcTemplate().update(
				"INSERT INTO cms_eai_aa_response_log ("
						+ "cms_lsp_lmt_profile_id, host_bca_ref_num, los_bca_ref_num, response_fire_date"
						+ ") values (?, ?, ?, ?) ",
				new Object[] { new Long(12345l), "HOST-AA-12345", "RLOS-AA-56789", new Date() });

		LimitDAO limitJdbcDao = new LimitDAO();
		limitJdbcDao.setJdbcTemplate(getJdbcTemplate());

		boolean hasResponse = limitJdbcDao.checkLimitProfileHasResponseToSource(12345l);
		assertTrue(hasResponse);
	}

	public void testInsertAndRemoveRecordsFromAAResponseLog() {
		getJdbcTemplate().update(
				"INSERT INTO cms_eai_aa_response_log ("
						+ "cms_lsp_lmt_profile_id, host_bca_ref_num, los_bca_ref_num, response_fire_date"
						+ ") values (?, ?, ?, ?) ",
				new Object[] { new Long(12345l), "HOST-AA-12345", "RLOS-AA-56789", new Date() });

		LimitDAO limitJdbcDao = new LimitDAO();
		limitJdbcDao.setJdbcTemplate(getJdbcTemplate());

		boolean hasResponse = limitJdbcDao.checkLimitProfileHasResponseToSource(12345l);
		assertTrue(hasResponse);

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimitProfileID(12345l);
		limitProfile.setBCAReference("HOST-AA-12345");
		limitProfile.setLosLimitProfileReference("RLOS-AA-56789");
	}

	public void testRetrieveLatestTrxValueForOneCollateralAndOneFacility() {
		Date todayDate = new Date();

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)", new Object[] { "999888", todayDate, "COL", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)",
				new Object[] { "999889", DateUtils.addDays(todayDate, -2), "FACILITY", new Long(12345) });

		LimitDAO jdbc = new LimitDAO();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		ICMSTrxValue latestTrxValue = jdbc.retrieveLatestCollateralOrFacilityTrxValueByCmsLimitProfileId(12345);
		assertNotNull(latestTrxValue);
		assertEquals("999888", latestTrxValue.getTransactionID());
	}

	public void testRetrieveLatestTrxValueForTwoCollateralAndTwoFacility() {
		Date todayDate = new Date();

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)", new Object[] { "999888", todayDate, "COL", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)",
				new Object[] { "999889", DateUtils.addDays(todayDate, -2), "FACILITY", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)",
				new Object[] { "999890", DateUtils.addDays(todayDate, 1), "COL", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)",
				new Object[] { "999891", DateUtils.addDays(todayDate, 2), "FACILITY", new Long(12345) });

		LimitDAO jdbc = new LimitDAO();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		ICMSTrxValue latestTrxValue = jdbc.retrieveLatestCollateralOrFacilityTrxValueByCmsLimitProfileId(12345);
		assertNotNull(latestTrxValue);
		assertEquals("999891", latestTrxValue.getTransactionID());
	}

	public void testRetrieveLatestTrxValueForTwoCollateralAndTwoFacilityWithTwoSameLatestDate() {
		Date todayDate = new Date();

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)", new Object[] { "999888", todayDate, "COL", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)",
				new Object[] { "999889", DateUtils.addDays(todayDate, -2), "FACILITY", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)",
				new Object[] { "999890", DateUtils.addDays(todayDate, -3), "COL", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, transaction_date, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)", new Object[] { "999891", todayDate, "FACILITY", new Long(12345) });

		LimitDAO jdbc = new LimitDAO();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		ICMSTrxValue latestTrxValue = jdbc.retrieveLatestCollateralOrFacilityTrxValueByCmsLimitProfileId(12345);
		assertNotNull(latestTrxValue);
		assertEquals("999891", latestTrxValue.getTransactionID());
	}

	public void testInsertResponseLog() {
		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimitProfileID(12345);
		limitProfile.setBCAReference("HOST-AA-12345");
		limitProfile.setLosLimitProfileReference("RLOS-AA-12345");

		LimitDAO jdbc = new LimitDAO();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		jdbc.insertOrUpdateLimitProfileResponseLog(limitProfile);

		boolean hasResponse = jdbc.checkLimitProfileHasResponseToSource(12345l);
		assertTrue(hasResponse);

		jdbc.updateLimitProfileResponseLogAfterFired(limitProfile);
	}

	public void testRetrieveListOfLimitProfileRequiredResponse() {
		LimitDAO jdbc = new LimitDAO();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		try {
			jdbc.retrieveListOfCmsLimitProfileIdNoResponseToSource();
		}
		catch (Throwable ex) {
			fail("should not have throw any error" + ex);
		}
	}

	public void testCheckLimitProfileStpComplete() {
		getJdbcTemplate().update("insert into cms_facility_master (id, cms_lsp_appr_lmts_id) values(?, ?)",
				new Object[] { new Long(123), new Long(1234) });

		getJdbcTemplate().update(
				"insert into sci_lsp_appr_lmts (cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_fac_type_value, "
						+ "cms_limit_status) values(?, ?, ?, ?)",
				new Object[] { new Long(1234), new Long(12345), "TRY", "DELETED" });

		getJdbcTemplate().update(
				"insert into cms_limit_security_map (charge_id, cms_lsp_appr_lmts_id, cms_collateral_id, cms_lsp_lmt_profile_id) "
						+ "values(?, ?, ?, ?)",
				new Object[] { new Long(5678), new Long(1234), new Long(56789), new Long(12345) });

		getJdbcTemplate().update(
				"insert into cms_limit_security_map (charge_id, cms_lsp_appr_lmts_id, cms_collateral_id, "
						+ "cms_lsp_lmt_profile_id, update_status_ind) values(?, ?, ?, ?, ?)",
				new Object[] { new Long(5679), new Long(1234), new Long(56790), new Long(12345), "D" });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, reference_id, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)", new Object[] { "3344", new Long(123), "FACILITY", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO stp_master_trans (master_trx_id, transaction_id, reference_id, transaction_type, status) "
						+ "values (?, ?, ?, ?, ?)",
				new Object[] { new Long(5354), "3344", new Long(123), "FACILITY", "COMPLETE" });

		getJdbcTemplate().update(
				"INSERT INTO stp_master_trans (master_trx_id, transaction_id, reference_id, transaction_type, status) "
						+ "values (?, ?, ?, ?, ?)",
				new Object[] { new Long(5355), "3345", new Long(56789), "COL", "COMPLETE" });

		LimitDAO jdbc = new LimitDAO();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimitProfileID(12345);

		assertTrue(jdbc.checkLimitProfileStpComplete(limitProfile));

		getJdbcTemplate().update("DELETE FROM stp_master_trans WHERE master_trx_id = ?",
				new Object[] { new Long(5355) });

		getJdbcTemplate().update("update cms_limit_security_map set update_status_ind = 'I' where charge_id = ? ",
				new Object[] { new Long(5679) });

		assertFalse(jdbc.checkLimitProfileStpComplete(limitProfile));
	}

	public void testCheckLimitProfileStpCompleteWithTradingFacilities() {
		getJdbcTemplate().update("insert into cms_facility_master (id, cms_lsp_appr_lmts_id) values(?, ?)",
				new Object[] { new Long(123), new Long(1234) });

		getJdbcTemplate().update(
				"insert into sci_lsp_appr_lmts (cms_lsp_appr_lmts_id, cms_limit_profile_id, "
						+ "cms_limit_status, lmt_fac_type_value) values(?, ?, ?, ?)",
				new Object[] { new Long(1234), new Long(12345), "DELETED", "261" });

		getJdbcTemplate().update(
				"insert into cms_limit_security_map (charge_id, cms_lsp_appr_lmts_id, cms_collateral_id, cms_lsp_lmt_profile_id) "
						+ "values(?, ?, ?, ?)",
				new Object[] { new Long(5678), new Long(1234), new Long(56789), new Long(12345) });

		getJdbcTemplate().update(
				"insert into cms_limit_security_map (charge_id, cms_lsp_appr_lmts_id, cms_collateral_id, "
						+ "cms_lsp_lmt_profile_id, update_status_ind) values(?, ?, ?, ?, ?)",
				new Object[] { new Long(5679), new Long(1234), new Long(56790), new Long(12345), "D" });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, reference_id, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)", new Object[] { "3344", new Long(123), "FACILITY", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO stp_master_trans (master_trx_id, transaction_id, reference_id, transaction_type, status) "
						+ "values (?, ?, ?, ?, ?)",
				new Object[] { new Long(5354), "3344", new Long(123), "FACILITY", "COMPLETE" });

		getJdbcTemplate().update(
				"INSERT INTO stp_master_trans (master_trx_id, transaction_id, reference_id, transaction_type, status) "
						+ "values (?, ?, ?, ?, ?)",
				new Object[] { new Long(5355), "3345", new Long(56789), "COL", "RESET" });

		LimitDAO jdbc = new LimitDAO();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimitProfileID(12345);

		assertTrue(jdbc.checkLimitProfileStpComplete(limitProfile));

		assertTrue(jdbc.retrieveUniqueCmsCollateralIdListbyLimitProfileId(12345, new String[] { "261" }).isEmpty());

		assertFalse(jdbc.retrieveUniqueCmsCollateralIdListbyLimitProfileId(12345, null).isEmpty());
	}

	public void testCheckLimitProfileStpCompleteWithoutCollateral() {
		getJdbcTemplate().update("insert into cms_facility_master (id, cms_lsp_appr_lmts_id) values(?, ?)",
				new Object[] { new Long(123), new Long(1234) });

		getJdbcTemplate().update(
				"insert into sci_lsp_appr_lmts (cms_lsp_appr_lmts_id, cms_limit_profile_id, "
						+ "cms_limit_status) values(?, ?, ?)",
				new Object[] { new Long(1234), new Long(12345), "DELETED" });

		getJdbcTemplate().update(
				"insert into cms_limit_security_map (charge_id, cms_lsp_appr_lmts_id, cms_collateral_id, "
						+ "cms_lsp_lmt_profile_id, update_status_ind) values(?, ?, ?, ?, ?)",
				new Object[] { new Long(5679), new Long(1234), new Long(56790), new Long(12345), "D" });

		getJdbcTemplate().update(
				"INSERT INTO transaction (transaction_id, reference_id, transaction_type, limit_profile_id) "
						+ "values (?, ?, ?, ?)", new Object[] { "3344", new Long(123), "FACILITY", new Long(12345) });

		getJdbcTemplate().update(
				"INSERT INTO stp_master_trans (master_trx_id, transaction_id, reference_id, transaction_type, status) "
						+ "values (?, ?, ?, ?, ?)",
				new Object[] { new Long(5354), "3344", new Long(123), "FACILITY", "COMPLETE" });

		LimitDAO jdbc = new LimitDAO();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimitProfileID(12345);

		assertTrue(jdbc.checkLimitProfileStpComplete(limitProfile));
	}

	public void testRetrieveAABasicInformation() {
		LimitDAO jdbc = new LimitDAO();
		jdbc.setJdbcTemplate(getJdbcTemplate());

		ILimitProfile limitProfile = jdbc.retrieveLimitProfileByCmsLimitProfileId(new Long(20070101000001l));
		System.out.println(limitProfile);
	}
}

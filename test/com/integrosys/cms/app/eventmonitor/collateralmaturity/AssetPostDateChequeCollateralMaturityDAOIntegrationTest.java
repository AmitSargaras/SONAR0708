package com.integrosys.cms.app.eventmonitor.collateralmaturity;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.test.AbstractTransactionalSpringContextTests;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

/**
 * @author Chong Jun Yong
 * 
 */
public class AssetPostDateChequeCollateralMaturityDAOIntegrationTest extends AbstractTransactionalSpringContextTests {
	AssetPostDateChequeCollateralMaturityDAO collateralMaturityDao;

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		collateralMaturityDao = new AssetPostDateChequeCollateralMaturityDAO();

		super.onSetUp();
	}

	public String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	public void testPdcExpiredTodayWithoutAccount() {
		DataSource ofaDataSource = (DataSource) getApplicationContext().getBean("ofaPool");

		String query = collateralMaturityDao.getSQLStatement(false);

		List argList = new ArrayList();
		argList.add(new Date(System.currentTimeMillis()));
		argList.add(new Date(System.currentTimeMillis()));
		argList.add(new Integer(0));
		argList.add(new Date(System.currentTimeMillis()));
		argList.add(new Date(System.currentTimeMillis()));
		argList.add(new Integer(0));

		JdbcTemplate jdbc = new JdbcTemplate(ofaDataSource);

		jdbc.update("insert into sci_le_main_profile (cms_le_main_profile_id, lmp_short_name, lmp_top_1000_bank_ind) "
				+ " values (?, ?, ?)", new Object[] { new Long(20081103000222444l), "LEHMAN BROTHERS", "N" });

		jdbc.update("insert into sci_le_sub_profile (cms_le_sub_profile_id, cms_le_main_profile_id, lsp_short_name) "
				+ " values (?, ?, ?)", new Object[] { new Long(20081103000111222l), new Long(20081103000222444l),
				"LEHMAN BROTHERS" });

		jdbc.update("insert into sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, cms_customer_id, llp_le_id, "
				+ " llp_bca_ref_num, los_bca_ref_num, llp_bca_ref_appr_date, source_id, cms_orig_country, "
				+ " cms_orig_organisation, cms_bca_status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", new Object[] {
				new Long(20081103000222333l), new Long(20081103000111222l), "CIF-00001", "SIBS-100-2345",
				"RLOS-HP-1234", new java.util.Date(), "SIBS", "MY", "50", "ACTIVE" });

		jdbc.update(
				"insert into sci_lsp_appr_lmts (cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_prd_type_num, lmt_prd_type_value) "
						+ " values (?, ?, ?, ?)", new Object[] { new Long(20081103111222111l),
						new Long(20081103000222333l), "27", "HP" });

		jdbc.update(
				"insert into cms_security (cms_collateral_id, sci_security_dtl_id, security_location, security_sub_type_id, status) "
						+ " values (?, ?, ?, ?, ?)", new Object[] { new Long(2008110333355566l), "HP-JP-8893", "MY",
						"AB108", "ACITVE" });

		jdbc.update("insert into cms_valuation(valuation_id, cms_collateral_id, valuation_date) values (?, ?, ?) ",
				new Object[] { new Long(20081103333555999l), new Long(2008110333355566l), new java.util.Date() });

		jdbc.update("insert into cms_security_source (cms_security_source_id, cms_collateral_id) values (?, ?)",
				new Object[] { new Long(2008110333555777l), new Long(2008110333355566l) });

		jdbc.update("insert into cms_asset_pdc (asset_pdc_id, cms_collateral_id, expiry_date) values (?, ?, ?)",
				new Object[] { new Long(200811033355888l), new Long(2008110333355566l),
						new Date(System.currentTimeMillis()) });

		jdbc.update(
				"insert into cms_limit_security_map (charge_id, cms_lsp_appr_lmts_id, cms_collateral_id, customer_category) "
						+ " values (?, ?, ?, ?)", new Object[] { new Long(20081103333444999l),
						new Long(20081103111222111l), new Long(2008110333355566l), "MB" });

		jdbc.query(query, argList.toArray(), new ResultSetExtractor() {

			public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
				assertTrue(rs.next());
				return null;
			}
		});
	}

	public void testPdcExpiryTodayWithAccountInfoPopulated() {
		DataSource ofaDataSource = (DataSource) getApplicationContext().getBean("ofaPool");

		String query = collateralMaturityDao.getSQLStatement(false);

		List argList = new ArrayList();
		argList.add(new Date(System.currentTimeMillis()));
		argList.add(new Date(System.currentTimeMillis()));
		argList.add(new Integer(0));
		argList.add(new Date(System.currentTimeMillis()));
		argList.add(new Date(System.currentTimeMillis()));
		argList.add(new Integer(0));

		JdbcTemplate jdbc = new JdbcTemplate(ofaDataSource);

		jdbc.update("insert into sci_le_main_profile (cms_le_main_profile_id, lmp_short_name, lmp_top_1000_bank_ind) "
				+ " values (?, ?, ?)", new Object[] { new Long(20081103000222444l), "LEHMAN BROTHERS", "N" });

		jdbc.update("insert into sci_le_sub_profile (cms_le_sub_profile_id, cms_le_main_profile_id, lsp_short_name) "
				+ " values (?, ?, ?)", new Object[] { new Long(20081103000111222l), new Long(20081103000222444l),
				"LEHMAN BROTHERS" });

		jdbc.update("insert into sci_lsp_lmt_profile (cms_lsp_lmt_profile_id, cms_customer_id, llp_le_id, "
				+ " llp_bca_ref_num, los_bca_ref_num, llp_bca_ref_appr_date, source_id, cms_orig_country, "
				+ " cms_orig_organisation, cms_bca_status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", new Object[] {
				new Long(20081103000222333l), new Long(20081103000111222l), "CIF-00001", "SIBS-100-2345",
				"RLOS-HP-1234", new java.util.Date(), "SIBS", "MY", "50", "ACTIVE" });

		jdbc.update(
				"insert into sci_lsp_appr_lmts (cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_prd_type_num, lmt_prd_type_value) "
						+ " values (?, ?, ?, ?)", new Object[] { new Long(20081103111222111l),
						new Long(20081103000222333l), "27", "HP" });

		jdbc.update(
				"insert into cms_security (cms_collateral_id, sci_security_dtl_id, security_location, security_sub_type_id, status) "
						+ " values (?, ?, ?, ?, ?)", new Object[] { new Long(2008110333355566l), "HP-JP-8893", "MY",
						"AB108", "ACITVE" });

		jdbc.update("insert into cms_valuation(valuation_id, cms_collateral_id, valuation_date) values (?, ?, ?) ",
				new Object[] { new Long(20081103333555999l), new Long(2008110333355566l), new java.util.Date() });

		jdbc.update("insert into cms_security_source (cms_security_source_id, cms_collateral_id) values (?, ?)",
				new Object[] { new Long(2008110333555777l), new Long(2008110333355566l) });

		jdbc.update("insert into cms_asset_pdc (asset_pdc_id, cms_collateral_id, expiry_date) values (?, ?, ?)",
				new Object[] { new Long(200811033355888l), new Long(2008110333355566l),
						new Date(System.currentTimeMillis()) });

		jdbc.update(
				"insert into cms_limit_security_map (charge_id, cms_lsp_appr_lmts_id, cms_collateral_id, customer_category) "
						+ " values (?, ?, ?, ?)", new Object[] { new Long(20081103333444999l),
						new Long(20081103111222111l), new Long(2008110333355566l), "MB" });

		jdbc.update(
				"insert into sci_lsp_lmts_xref_map (cms_lsp_lmts_xref_map_id, cms_lsp_appr_lmts_id) values (?, ?) ",
				new Object[] { new Long(20081103111222555l), new Long(20081103111222111l) });

		jdbc.query(query, argList.toArray(), new ResultSetExtractor() {

			public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
				assertTrue(rs.next());
				return null;
			}
		});
	}
}

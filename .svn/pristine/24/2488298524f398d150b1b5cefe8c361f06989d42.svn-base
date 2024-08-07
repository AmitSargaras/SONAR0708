package com.integrosys.cms.batch.valuation;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.easymock.MockControl;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.test.AbstractTransactionalSpringContextTests;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.collateral.bus.valuation.ValuationHandler;
import com.integrosys.cms.app.collateral.bus.valuation.dao.GenericValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.dao.MarketableRunningTotalValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.support.MktFeedSingleton;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.MarketableRunningTotalValuator;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.factory.BatchParameterValidator;

/**
 * Created by IntelliJ IDEA. User: Cynthia Date: Nov 4, 2008 Time: 6:43:50 PM To
 * change this template use File | Settings | File Templates.
 */
public class ValuationMSRunningTotalTest extends AbstractTransactionalSpringContextTests {

	MockControl batchParameterValidatorControl;

	ApplicationContext context = getApplicationContext();

	DataSource dataSource;

	ValuationMain main;

	ValuationMainDAO dao;

	ValuationHandler valHandler;

	Map valuationDaoMap;

	Map valuatorMap;

	GenericValuationDAO genericValuationDao;

	MarketableRunningTotalValuator valuator;

	protected String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	protected void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();
		super.onSetUp();
	}

	public void testQuery() {

		configure();
		runMainTest();
		// runMaxPriceCapTest();
		verifyTestData();
		System.out.println("========== Test Case Done ============ ");

	}

	public void runMainTest() {
		insertTestData();
		valuator.getMarketableProfileSingleton().reloadData();

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");
		paramMap.put("sectype", "MS");
		// paramMap.put("secid", "MS602-Test01");

		List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
		long noOfSec = dao.getNoOfSecurities(paramMap);

		DefaultLogger.debug(this, "Executed Test Case");
		System.out.println("Number of Securities = " + noOfSec + "\n\n");
		// System.out.println("Executed Test Case \n" + resultList);

		main.processValuationModelList(resultList);
	}

	public void runMaxPriceCapTest() {
		insertTestDataShareMinPricePolicyCap();
		valuator.getMarketableProfileSingleton().reloadData();

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");
		paramMap.put("sectype", "MS");
		paramMap.put("secid", "MS600-Test06");

		List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
		long noOfSec = dao.getNoOfSecurities(paramMap);

		DefaultLogger.debug(this, "Executed Test Case");
		System.out.println("Number of Securities = " + noOfSec + "\n\n");
		// System.out.println("Executed Test Case \n" + resultList);

		main.processValuationModelList(resultList);

	}

	private void configure() {
		batchParameterValidatorControl = MockControl.createControl(BatchParameterValidator.class);
		BatchParameterValidator mockBatchParamHandler = (BatchParameterValidator) batchParameterValidatorControl
				.getMock();
		dataSource = (DataSource) context.getBean("ofaPool");

		dao = new ValuationMainDAO();
		dao.setDataSource(dataSource);

		setupValuationHandler();
		valHandler = new ValuationHandler();
		genericValuationDao = new GenericValuationDAO();
		genericValuationDao.setDataSource(dataSource);
		genericValuationDao.setSequenceFormatter(new DateSequencerFormatter());

		valHandler.setValuationDaoMap(valuationDaoMap);
		valHandler.setValuatorMap(valuatorMap);
		valHandler.setGenericValuationDao(genericValuationDao);

		main = new ValuationMain();
		main.setValuationHandler(valHandler);
		main.setValuationMainDao(dao);
		main.setValuationParameterValidator(mockBatchParamHandler);
		main.setTransactionTemplate(new TransactionTemplate(new MockBatchSpringTransactionManager()));

	}

	private void setupValuationHandler() {

		valuationDaoMap = new HashMap();
		valuatorMap = new HashMap();

		MarketableRunningTotalValuationDAO jdbcDao = new MarketableRunningTotalValuationDAO();
		jdbcDao.setDataSource(dataSource);
		jdbcDao.setSequenceFormatter(new DateSequencerFormatter());

		valuationDaoMap.put("MS600", jdbcDao);
		valuationDaoMap.put("MS601", jdbcDao);
		valuationDaoMap.put("MS602", jdbcDao);
		valuationDaoMap.put("MS603", jdbcDao);
		valuationDaoMap.put("MS605", jdbcDao);
		valuationDaoMap.put("MS606", jdbcDao);
		valuationDaoMap.put("MS607", jdbcDao);
		valuationDaoMap.put("MS610", jdbcDao);
		valuationDaoMap.put("MS611", jdbcDao);

		valuator = new MarketableRunningTotalValuator();
		MktFeedSingleton mktFeedSingleton = MktFeedSingleton.getInstance();
		mktFeedSingleton.setMarketableValuationDao(jdbcDao);
		mktFeedSingleton.init();
		valuator.setMarketableProfileSingleton(mktFeedSingleton);

		valuatorMap.put("MS600", valuator);
		valuatorMap.put("MS601", valuator);
		valuatorMap.put("MS602", valuator);
		valuatorMap.put("MS603", valuator);
		valuatorMap.put("MS605", valuator);
		valuatorMap.put("MS606", valuator);
		valuatorMap.put("MS607", valuator);
		valuatorMap.put("MS610", valuator);
		valuatorMap.put("MS611", valuator);
	}

	private void insertTestData() {

		insertTestDataShareNormal();
		insertTestDataUnitTrust();
		insertTestDataShareDelist();
		insertTestDataShareNewlyLaunch();
		insertTestDataShareMinPriceMthlyRunning();
		insertTestDataSecondBoard();
		insertTestDataGov();
		insertTestDataBond();

		// ========= Security Parameter ==========//
		dao.getJdbcTemplate().update(
				"update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', "
						+ "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 "
						+ "where SECURITY_SUB_TYPE_ID like 'MS%' and country_iso_code = 'MY'");

	}

	public void insertTestDataShareNormal() {
		// ========= Test 1: Shares: status - normal (not PN4/relisted etc)
		// ==========//
		// ========= CMV=840.0, FSV=756.0
		// ============================================//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) "
								+ "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test01', 'MY', subtype_name, "
								+ "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' "
								+ "from cms_security_sub_type where security_sub_type_id = 'MS600'");

		dao.getJdbcTemplate().update(
				"insert into cms_marketable_sec (cms_collateral_id) "
						+ "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) "
								+ "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'ISIN01', 'S', 1000 "
								+ "from cms_security where sci_security_dtl_id = 'MS600-Test01'");

		// dao.getJdbcTemplate().update("update cms_portfolio_item " +
		// "set cms_ref_id = item_id " +
		// "where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01')");

		// dao.getJdbcTemplate().update("insert into cms_portfolio_item_dtl (item_dtl_id, item_id, number_of_units, share_type, status, transaction_date, unit_sign) "
		// +
		// "select 20070101000000 + next value for MARKETABLE_EQUITY_DETAIL_SEQ, p.item_id, 1000, 'F', 'ACTIVE', current timestamp, '-' "
		// +
		// "from cms_portfolio_item p, cms_security s " +
		// "where p.cms_collateral_id = s.cms_collateral_id " +
		// "and s.sci_security_dtl_id = 'MS600-Test01'");

		// ========= Feeds Info ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_PRICE_FEED (FEED_ID, TYPE, ISIN_CODE, RIC, STOCK_CODE, TICKER, BOARD_TYPE, UNIT_PRICE, "
								+ "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, '001', STOCK_CODE, 'RIC001', STOCK_CODE, STOCK_CODE, '1', 15, "
								+ "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ "
								+ "from cms_portfolio_item where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01')");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_CREDIT_RISK_PARAM (PARAM_ID, FEED_ID, PARAM_REF, BOARD_TYPE, "
								+ "SHARE_STATUS, PREV_SHARE_STATUS, IS_INT_SUSPEND) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, FEED_ID, FEED_ID, BOARD_TYPE, '1', '1', 'N' "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01'))");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_VALUATION_MKT_SEC_SUMMARY (TICKER, BOARD_TYPE, "
								+ "RUNNING_TOTAL_CURRENCY, RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, "
								+ "RUNNING_MONTH_END_TOTAL, MONTHS_FOR_MONTH_END_TOTAL, START_DATE_OF_TOTAL, END_DATE_OF_TOTAL) "
								+ "select STOCK_CODE, BOARD_TYPE, CURRENCY, 120, 100, "
								+ "5.5, 3, current date - 3 months, current date "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01'))");

		dao.getJdbcTemplate().update("update CMS_POLICY_CAP set MAX_CAP_PRICE = 10 where BOARD = '1'");

	}

	public void insertTestDataUnitTrust() {

		// ========= Test 2: Unit Trust ==========//
		// ========= Unit price * number of units = CMV:15,000 ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) "
								+ "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test02', 'MY', subtype_name, "
								+ "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' "
								+ "from cms_security_sub_type where security_sub_type_id = 'MS600'");

		dao.getJdbcTemplate().update(
				"insert into cms_marketable_sec (cms_collateral_id) "
						+ "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test02'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) "
								+ "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'UT001', 'U', 1000 "
								+ "from cms_security where sci_security_dtl_id = 'MS600-Test02'");

		// ========= Feeds Info ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_PRICE_FEED (FEED_ID, TYPE, ISIN_CODE, RIC, STOCK_CODE, TICKER, BOARD_TYPE, UNIT_PRICE, "
								+ "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, '006', STOCK_CODE, 'RIC001', STOCK_CODE, STOCK_CODE, '1', 15, "
								+ "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ "
								+ "from cms_portfolio_item where cms_collateral_id = "
								+ "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test02')");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_VALUATION_MKT_SEC_SUMMARY (TICKER, BOARD_TYPE, "
								+ "RUNNING_TOTAL_CURRENCY, RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, "
								+ "RUNNING_MONTH_END_TOTAL, MONTHS_FOR_MONTH_END_TOTAL, START_DATE_OF_TOTAL, END_DATE_OF_TOTAL) "
								+ "select STOCK_CODE, BOARD_TYPE, CURRENCY, 120, 100, "
								+ "150, 3, current date - 3 months, current date "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test02'))");

	}

	public void insertTestDataShareDelist() {

		// ========= Test 3: Shares: status - PN4 [Delisted, cmv=0] ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) "
								+ "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test03', 'MY', subtype_name, "
								+ "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' "
								+ "from cms_security_sub_type where security_sub_type_id = 'MS600'");

		dao.getJdbcTemplate().update(
				"insert into cms_marketable_sec (cms_collateral_id) "
						+ "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test03'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) "
								+ "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'ISIN002', 'S', 1000 "
								+ "from cms_security where sci_security_dtl_id = 'MS600-Test03'");

		// ========= Feeds Info ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_PRICE_FEED (FEED_ID, TYPE, ISIN_CODE, RIC, STOCK_CODE, TICKER, BOARD_TYPE,  UNIT_PRICE, "
								+ "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, '001', STOCK_CODE, 'RIC001', STOCK_CODE, STOCK_CODE, '1', 15, "
								+ "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ "
								+ "from cms_portfolio_item where cms_collateral_id = "
								+ "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test03')");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_CREDIT_RISK_PARAM (PARAM_ID, FEED_ID, PARAM_REF, BOARD_TYPE, "
								+ "SHARE_STATUS, PREV_SHARE_STATUS, IS_INT_SUSPEND) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, FEED_ID, FEED_ID, BOARD_TYPE, '2', '1', 'Y' "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test03'))");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_VALUATION_MKT_SEC_SUMMARY (TICKER, BOARD_TYPE, "
								+ "RUNNING_TOTAL_CURRENCY, RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, "
								+ "RUNNING_MONTH_END_TOTAL, MONTHS_FOR_MONTH_END_TOTAL, START_DATE_OF_TOTAL, END_DATE_OF_TOTAL) "
								+ "select STOCK_CODE, BOARD_TYPE, CURRENCY, 120, 100, "
								+ "150, 3, current date - 3 months, current date "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test03'))");

		dao.getJdbcTemplate().update("update CMS_POLICY_CAP set MAX_CAP_PRICE = 10 where BOARD = '1'");

	}

	public void insertTestDataShareNewlyLaunch() {
		// ========= Test 4: Shares Newly Launch < 6 months ==========//
		// ========= 50% of unit price * number of units, cmv = (50% of $15,
		// *1000) = $7500 ===============//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) "
								+ "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test04', 'MY', subtype_name, "
								+ "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' "
								+ "from cms_security_sub_type where security_sub_type_id = 'MS600'");

		dao.getJdbcTemplate().update(
				"insert into cms_marketable_sec (cms_collateral_id) "
						+ "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test04'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) "
								+ "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'ISIN02', 'S', 1000 "
								+ "from cms_security where sci_security_dtl_id = 'MS600-Test04'");

		// ========= Feeds Info ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_PRICE_FEED (FEED_ID, TYPE, ISIN_CODE, RIC, STOCK_CODE, TICKER, BOARD_TYPE, UNIT_PRICE, "
								+ "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF, DATE_LAUNCHED) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, '001', STOCK_CODE, 'RIC001', STOCK_CODE, STOCK_CODE, '1', 15, "
								+ "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ, current timestamp "
								+ "from cms_portfolio_item where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test04')");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_CREDIT_RISK_PARAM (PARAM_ID, FEED_ID, PARAM_REF, BOARD_TYPE, "
								+ "SHARE_STATUS, PREV_SHARE_STATUS, IS_INT_SUSPEND) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, FEED_ID, FEED_ID, BOARD_TYPE, '1', '1', 'N' "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test04'))");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_VALUATION_MKT_SEC_SUMMARY (TICKER, BOARD_TYPE, "
								+ "RUNNING_TOTAL_CURRENCY, RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, "
								+ "RUNNING_MONTH_END_TOTAL, MONTHS_FOR_MONTH_END_TOTAL, START_DATE_OF_TOTAL, END_DATE_OF_TOTAL) "
								+ "select STOCK_CODE, BOARD_TYPE, CURRENCY, 120, 100, "
								+ "5.5, 3, current date - 3 months, current date "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test04'))");

		dao.getJdbcTemplate().update("update CMS_POLICY_CAP set MAX_CAP_PRICE = 10 where BOARD = '1'");

	}

	public void insertTestDataShareMinPriceMthlyRunning() {
		// ========= Test 1: Shares: status - normal (not PN4/relisted etc)
		// ==========//
		// ========= CMV=770, FSV=693.0
		// ============================================//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) "
								+ "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test05', 'MY', subtype_name, "
								+ "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' "
								+ "from cms_security_sub_type where security_sub_type_id = 'MS600'");

		dao.getJdbcTemplate().update(
				"insert into cms_marketable_sec (cms_collateral_id) "
						+ "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test05'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) "
								+ "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'ISIN03', 'S', 1000 "
								+ "from cms_security where sci_security_dtl_id = 'MS600-Test05'");

		// dao.getJdbcTemplate().update("update cms_portfolio_item " +
		// "set cms_ref_id = item_id " +
		// "where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01')");

		// dao.getJdbcTemplate().update("insert into cms_portfolio_item_dtl (item_dtl_id, item_id, number_of_units, share_type, status, transaction_date, unit_sign) "
		// +
		// "select 20070101000000 + next value for MARKETABLE_EQUITY_DETAIL_SEQ, p.item_id, 1000, 'F', 'ACTIVE', current timestamp, '-' "
		// +
		// "from cms_portfolio_item p, cms_security s " +
		// "where p.cms_collateral_id = s.cms_collateral_id " +
		// "and s.sci_security_dtl_id = 'MS600-Test01'");

		// ========= Feeds Info ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_PRICE_FEED (FEED_ID, TYPE, ISIN_CODE, RIC, STOCK_CODE, TICKER, BOARD_TYPE, UNIT_PRICE, "
								+ "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, '001', STOCK_CODE, 'RIC001', STOCK_CODE, STOCK_CODE, '1', 15, "
								+ "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ "
								+ "from cms_portfolio_item where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test05')");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_CREDIT_RISK_PARAM (PARAM_ID, FEED_ID, PARAM_REF, BOARD_TYPE, "
								+ "SHARE_STATUS, PREV_SHARE_STATUS, IS_INT_SUSPEND) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, FEED_ID, FEED_ID, BOARD_TYPE, '1', '1', 'N' "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test05'))");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_VALUATION_MKT_SEC_SUMMARY (TICKER, BOARD_TYPE, "
								+ "RUNNING_TOTAL_CURRENCY, RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, "
								+ "RUNNING_MONTH_END_TOTAL, MONTHS_FOR_MONTH_END_TOTAL, START_DATE_OF_TOTAL, END_DATE_OF_TOTAL) "
								+ "select STOCK_CODE, BOARD_TYPE, CURRENCY, 120, 100, "
								+ "3.3, 3, current date - 3 months, current date "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test05'))");

		dao.getJdbcTemplate().update("update CMS_POLICY_CAP set MAX_CAP_PRICE = 10 where BOARD = '1'");

	}

	public void insertTestDataShareMinPricePolicyCap() {
		// ========= Test 1: Shares: status - normal (not PN4/relisted etc)
		// ==========//
		// ========= CMV=600.0, FSV=540.0
		// ============================================//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) "
								+ "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test06', 'MY', subtype_name, "
								+ "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' "
								+ "from cms_security_sub_type where security_sub_type_id = 'MS600'");

		dao.getJdbcTemplate().update(
				"insert into cms_marketable_sec (cms_collateral_id) "
						+ "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test06'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) "
								+ "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'ISIN04', 'S', 1000 "
								+ "from cms_security where sci_security_dtl_id = 'MS600-Test06'");

		// dao.getJdbcTemplate().update("update cms_portfolio_item " +
		// "set cms_ref_id = item_id " +
		// "where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01')");

		// dao.getJdbcTemplate().update("insert into cms_portfolio_item_dtl (item_dtl_id, item_id, number_of_units, share_type, status, transaction_date, unit_sign) "
		// +
		// "select 20070101000000 + next value for MARKETABLE_EQUITY_DETAIL_SEQ, p.item_id, 1000, 'F', 'ACTIVE', current timestamp, '-' "
		// +
		// "from cms_portfolio_item p, cms_security s " +
		// "where p.cms_collateral_id = s.cms_collateral_id " +
		// "and s.sci_security_dtl_id = 'MS600-Test01'");

		// ========= Feeds Info ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_PRICE_FEED (FEED_ID, TYPE, ISIN_CODE, RIC, STOCK_CODE, TICKER, BOARD_TYPE, UNIT_PRICE, "
								+ "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, '001', STOCK_CODE, 'RIC001', STOCK_CODE, STOCK_CODE, '1', 15, "
								+ "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ "
								+ "from cms_portfolio_item where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test06')");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_CREDIT_RISK_PARAM (PARAM_ID, FEED_ID, PARAM_REF, BOARD_TYPE, "
								+ "SHARE_STATUS, PREV_SHARE_STATUS, IS_INT_SUSPEND) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, FEED_ID, FEED_ID, BOARD_TYPE, '1', '1', 'N' "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test06'))");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_VALUATION_MKT_SEC_SUMMARY (TICKER, BOARD_TYPE, "
								+ "RUNNING_TOTAL_CURRENCY, RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, "
								+ "RUNNING_MONTH_END_TOTAL, MONTHS_FOR_MONTH_END_TOTAL, START_DATE_OF_TOTAL, END_DATE_OF_TOTAL) "
								+ "select STOCK_CODE, BOARD_TYPE, CURRENCY, 120, 100, "
								+ "3.3, 3, current date - 3 months, current date "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test06'))");

		dao.getJdbcTemplate().update("update CMS_POLICY_CAP set MAX_CAP_PRICE = 0.6 where BOARD = '1'");

	}

	public void insertTestDataSecondBoard() {
		// ========= Test 1: Shares: status - normal (not PN4/relisted etc)
		// ==========//
		// ========= CMV=500, FSV=
		// ============================================//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) "
								+ "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test07', 'MY', subtype_name, "
								+ "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' "
								+ "from cms_security_sub_type where security_sub_type_id = 'MS600'");

		dao.getJdbcTemplate().update(
				"insert into cms_marketable_sec (cms_collateral_id) "
						+ "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test07'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) "
								+ "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'ISIN07', 'S', 1000 "
								+ "from cms_security where sci_security_dtl_id = 'MS600-Test07'");

		// ========= Feeds Info ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_PRICE_FEED (FEED_ID, TYPE, ISIN_CODE, RIC, STOCK_CODE, TICKER, BOARD_TYPE, UNIT_PRICE, "
								+ "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, '001', STOCK_CODE, 'RIC001', STOCK_CODE, STOCK_CODE, '2', 15, "
								+ "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ "
								+ "from cms_portfolio_item where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test07')");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_CREDIT_RISK_PARAM (PARAM_ID, FEED_ID, PARAM_REF, BOARD_TYPE, "
								+ "SHARE_STATUS, PREV_SHARE_STATUS, IS_INT_SUSPEND) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, FEED_ID, FEED_ID, BOARD_TYPE, '1', '1', 'N' "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test07'))");

		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_VALUATION_MKT_SEC_SUMMARY (TICKER, BOARD_TYPE, "
								+ "RUNNING_TOTAL_CURRENCY, RUNNING_DAILY_TOTAL, DAYS_FOR_DAILY_TOTAL, "
								+ "RUNNING_MONTH_END_TOTAL, MONTHS_FOR_MONTH_END_TOTAL, START_DATE_OF_TOTAL, END_DATE_OF_TOTAL) "
								+ "select STOCK_CODE, BOARD_TYPE, CURRENCY, 100, 100, "
								+ "6, 3, current date - 3 months, current date "
								+ "from CMS_PRICE_FEED where STOCK_CODE = "
								+ "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id "
								+ "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test07'))");

		dao.getJdbcTemplate().update("update CMS_POLICY_CAP set MAX_CAP_PRICE = 8 where BOARD = '2'");

	}

	public void insertTestDataGov() {
		// ========= Test 1: Shares: status - normal (not PN4/relisted etc)
		// ==========//
		// ========= CMV=2150.0, FSV=1935.0
		// ============================================//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) "
								+ "select 20070101000000 + next value for collateral_seq, 'MS602', 'MS602-Test01', 'MY', subtype_name, "
								+ "security_type_name, 'MS602', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' "
								+ "from cms_security_sub_type where security_sub_type_id = 'MS602'");

		dao.getJdbcTemplate().update(
				"insert into cms_marketable_sec (cms_collateral_id) "
						+ "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS602-Test01'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS, UNIT_PRICE_CURRENCY, UNIT_PRICE) "
								+ "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, '', 'GOV', 'S', 1000, 'MYR', 2.15 "
								+ "from cms_security where sci_security_dtl_id = 'MS602-Test01'");

	}

	private void insertTestDataBond() {
		// ========= Test 1: Shares: status - normal (not PN4/relisted etc)
		// ==========//
		// ========= CMV=12000, FSV=10800
		// ============================================//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) "
								+ "select 20070101000000 + next value for collateral_seq, 'MS610', 'MS610-Test01', 'MY', subtype_name, "
								+ "security_type_name, 'MS610', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' "
								+ "from cms_security_sub_type where security_sub_type_id = 'MS610'");

		dao.getJdbcTemplate().update(
				"insert into cms_marketable_sec (cms_collateral_id) "
						+ "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS610-Test01'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, ISIN_CODE, TYPE, NO_OF_UNITS) "
								+ "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'BOND01', 'S', 1000 "
								+ "from cms_security where sci_security_dtl_id = 'MS610-Test01'");

		// ========= Feeds Info ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into CMS_PRICE_FEED (FEED_ID, TYPE, ISIN_CODE, RIC, STOCK_CODE, TICKER, BOARD_TYPE, UNIT_PRICE, "
								+ "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) "
								+ "select 100000 + next value for CMS_PRICE_FEED_SEQ, '005', ISIN_CODE, 'RIC001', ISIN_CODE, ISIN_CODE, '', 12, "
								+ "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ "
								+ "from cms_portfolio_item where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS610-Test01')");

	}

	private void verifyTestData() {
		String query = "SELECT sec.*, pf.UNIT_PRICE, pf.UNIT_PRICE_CURRENCY "
				+ "from CMS_SECURITY sec, CMS_PORTFOLIO_ITEM pf "
				+ "WHERE sec.cms_collateral_id = pf.cms_collateral_id " + "AND sci_security_dtl_id Like 'MS%-Test%'";

		Object result = dao.getJdbcTemplate().query(query, new Object[] {}, new ResultSetExtractor() {

			public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					String collateralId = rs.getString("CMS_COLLATERAL_ID");
					String secDtlId = rs.getString("sci_security_dtl_id");
					Date valuationDate = rs.getDate("LAST_REMARGIN_DATE");
					Date nextValDate = rs.getDate("NEXT_REMARGIN_DATE");
					String valuationType = rs.getString("VALUATION_TYPE");
					String cmvCurr = rs.getString("CMV_CURRENCY");
					double cmvAmt = rs.getDouble("CMV");
					String fsvCurr = rs.getString("FSV_CURRENCY");
					double fsvAmt = rs.getDouble("FSV");

					String unitPriceStr = rs.getString("UNIT_PRICE");
					String unitPriceCcy = rs.getString("UNIT_PRICE_CURRENCY");

					System.out.println("****************************************");
					System.out.println("sci_security_dtl_id = " + secDtlId);
					System.out.println("CMS_COLLATERAL_ID = " + collateralId);
					System.out.println("LAST_REMARGIN_DATE = " + valuationDate);
					System.out.println("NEXT_REMARGIN_DATE = " + nextValDate);
					System.out.println("VALUATION_TYPE = " + valuationType);
					System.out.println("CMV_CURRENCY = " + cmvCurr);
					System.out.println("CMV = " + cmvAmt);
					System.out.println("FSV_CURRENCY = " + fsvCurr);
					System.out.println("FSV = " + fsvAmt);
					System.out.println("UNIT_PRICE = " + unitPriceStr);
					System.out.println("UNIT_PRICE_CURRENCY = " + unitPriceCcy);

					// assertNotNull(valuationDate);
					// assertNotNull(nextValDate);
					// assertNotNull(valuationType);
					// assertNotNull(cmvCurr);
					// assertNotNull(fsvCurr);
					// if(("MS600-Test03").equals(secDtlId)) {
					// assertTrue("CMV is Not 0", cmvAmt == 0);
					// assertTrue("FSV is Not 0", fsvAmt == 0);
					// } else {
					// assertTrue("CMV is Not 0", cmvAmt != 0);
					// assertTrue("FSV is Not 0", fsvAmt != 0);
					// }

				}

				return null;
			}

		});

	}

}

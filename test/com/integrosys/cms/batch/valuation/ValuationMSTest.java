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
import com.integrosys.cms.app.collateral.bus.valuation.dao.MarketableValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.support.StockPriceCapSingleton;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.MarketableValuator;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.factory.BatchParameterValidator;

/**
 * Created by IntelliJ IDEA.
 * User: Cynthia
 * Date: Nov 4, 2008
 * Time: 6:43:50 PM
 * To change this template use File | Settings | File Templates.
 */
public class ValuationMSTest extends AbstractTransactionalSpringContextTests {

    MockControl batchParameterValidatorControl;
    ApplicationContext context = getApplicationContext();
    DataSource dataSource;
    ValuationMain main;
    ValuationMainDAO dao;
    ValuationHandler valHandler;
    Map valuationDaoMap;
    Map valuatorMap;
    GenericValuationDAO genericValuationDao;
    MarketableValuator valuator;


    protected String[] getConfigLocations() {
        return new String[] {"/AppContext_TrxDataSource_Test.xml"};
    }


    protected void onSetUp() throws Exception {
        Log4jConfigTestPlugin.configure();
        super.onSetUp();
    }



    public void testQuery() {

        configure();
        insertTestData();
        valuator.getStockPriceCapSingleton().reloadData();

        Map paramMap = new HashMap();
        paramMap.put("country", "MY");
        paramMap.put("sectype", "MS");

        List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
        long noOfSec = dao.getNoOfSecurities(paramMap);

        DefaultLogger.debug(this, "Executed Test Case");
        System.out.println("Number of Securities = " + noOfSec + "\n\n");
        //System.out.println("Executed Test Case \n" + resultList);

        main.processValuationModelList(resultList);
        verifyTestData();
        System.out.println("========== Test Case Done ============ ");

    }


    private void configure() {
        batchParameterValidatorControl = MockControl.createControl(BatchParameterValidator.class);
		BatchParameterValidator mockBatchParamHandler = (BatchParameterValidator) batchParameterValidatorControl.getMock();
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

        MarketableValuationDAO jdbcDao = new MarketableValuationDAO();
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

        valuator = new MarketableValuator();
        StockPriceCapSingleton stkPriceCapSingleton = StockPriceCapSingleton.getInstance();
        stkPriceCapSingleton.setMarketableValuationDao(jdbcDao);
        stkPriceCapSingleton.init();
        valuator.setStockPriceCapSingleton(stkPriceCapSingleton);
        
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
        insertTestDataShareRelist();

        //========= Security Parameter ==========//
        dao.getJdbcTemplate().update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', " +
                "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 " +
                "where SECURITY_SUB_TYPE_ID like 'MS%' and country_iso_code = 'MY'");

    }



    public void insertTestDataShareNormal() {
        //========= Test 1: Shares: status - normal (not PN4/relisted etc) ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) " +
                   "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test01', 'MY', subtype_name, " +
                   "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' " +
                   "from cms_security_sub_type where security_sub_type_id = 'MS600'");

        dao.getJdbcTemplate().update("insert into cms_marketable_sec (cms_collateral_id) " +
                "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01'");

        dao.getJdbcTemplate().update("insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) " +
                "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'ISIN001', 'S', 1000 " +
                "from cms_security where sci_security_dtl_id = 'MS600-Test01'");

//        dao.getJdbcTemplate().update("update cms_portfolio_item " +
//                "set cms_ref_id = item_id " +
//                "where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01')");

//        dao.getJdbcTemplate().update("insert into cms_portfolio_item_dtl (item_dtl_id, item_id, number_of_units, share_type, status, transaction_date, unit_sign) " +
//                "select 20070101000000 + next value for MARKETABLE_EQUITY_DETAIL_SEQ, p.item_id, 1000, 'F', 'ACTIVE', current timestamp, '-' " +
//                "from cms_portfolio_item p, cms_security s " +
//                "where p.cms_collateral_id = s.cms_collateral_id " +
//                "and s.sci_security_dtl_id = 'MS600-Test01'");


        //========= Feeds Info ==========//
        dao.getJdbcTemplate().update("insert into CMS_PRICE_FEED (FEED_ID, RIC, STOCK_CODE, UNIT_PRICE, " +
                "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) " +
                "select 100000 + next value for CMS_PRICE_FEED_SEQ, 'RIC001', STOCK_CODE, 15, " +
                "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ " +
                "from cms_portfolio_item where cms_collateral_id = (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01')");

        dao.getJdbcTemplate().update("insert into CMS_CREDIT_RISK_PARAM (PARAM_ID, FEED_ID, PARAM_REF, BOARD_TYPE, " +
                "SHARE_STATUS, PREV_SHARE_STATUS, IS_INT_SUSPEND) " +
                "select 100000 + next value for CMS_PRICE_FEED_SEQ, FEED_ID, FEED_ID, '1', '1', '1', 'N' " +
                "from CMS_PRICE_FEED where STOCK_CODE = " +
                    "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id " +
                    "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test01'))");

        dao.getJdbcTemplate().update("update CMS_POLICY_CAP set MAX_CAP_PRICE = 10 where BOARD = '1'");

    }


    public void insertTestDataUnitTrust() {
        
        //========= Test 2: Unit Trust ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) " +
                   "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test02', 'MY', subtype_name, " +
                   "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' " +
                   "from cms_security_sub_type where security_sub_type_id = 'MS600'");

        dao.getJdbcTemplate().update("insert into cms_marketable_sec (cms_collateral_id) " +
                "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test02'");

        dao.getJdbcTemplate().update("insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) " +
                "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'UT001', 'U', 1000 " +
                "from cms_security where sci_security_dtl_id = 'MS600-Test02'");

        //========= Feeds Info ==========//
        dao.getJdbcTemplate().update("insert into CMS_PRICE_FEED (FEED_ID, RIC, STOCK_CODE, UNIT_PRICE, " +
                "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) " +
                "select 100000 + next value for CMS_PRICE_FEED_SEQ, 'RIC001', STOCK_CODE, 15, " +
                "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ " +
                "from cms_portfolio_item where cms_collateral_id = " +
                    "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test02')");

    }


    public void insertTestDataShareDelist() {

        //========= Test 3: Shares: status - PN4 ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) " +
                   "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test03', 'MY', subtype_name, " +
                   "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' " +
                   "from cms_security_sub_type where security_sub_type_id = 'MS600'");

        dao.getJdbcTemplate().update("insert into cms_marketable_sec (cms_collateral_id) " +
                "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test03'");

        dao.getJdbcTemplate().update("insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) " +
                "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'ISIN002', 'S', 1000 " +
                "from cms_security where sci_security_dtl_id = 'MS600-Test03'");


        //========= Feeds Info ==========//
        dao.getJdbcTemplate().update("insert into CMS_PRICE_FEED (FEED_ID, RIC, STOCK_CODE, UNIT_PRICE, " +
                "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) " +
                "select 100000 + next value for CMS_PRICE_FEED_SEQ, 'RIC001', STOCK_CODE, 15, " +
                "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ " +
                "from cms_portfolio_item where cms_collateral_id = " +
                "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test03')");

        dao.getJdbcTemplate().update("insert into CMS_CREDIT_RISK_PARAM (PARAM_ID, FEED_ID, PARAM_REF, BOARD_TYPE, " +
                "SHARE_STATUS, PREV_SHARE_STATUS, IS_INT_SUSPEND) " +
                "select 100000 + next value for CMS_PRICE_FEED_SEQ, FEED_ID, FEED_ID, '1', '2', '1', 'Y' " +
                "from CMS_PRICE_FEED where STOCK_CODE = " +
                    "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id " +
                    "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test03'))");

        dao.getJdbcTemplate().update("update CMS_POLICY_CAP set MAX_CAP_PRICE = 10 where BOARD = '1'");

    }

    public void insertTestDataShareRelist() {

        //========= Test 3: Shares: status - PN4 ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) " +
                   "select 20070101000000 + next value for collateral_seq, 'MS600', 'MS600-Test04', 'MY', subtype_name, " +
                   "security_type_name, 'MS600', 'MS', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' " +
                   "from cms_security_sub_type where security_sub_type_id = 'MS600'");

        dao.getJdbcTemplate().update("insert into cms_marketable_sec (cms_collateral_id) " +
                "select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test04'");

        dao.getJdbcTemplate().update("insert into cms_portfolio_item (item_id, cms_collateral_id, source_id, STOCK_CODE, TYPE, NO_OF_UNITS) " +
                "select 20070101000000 + next value for MARKETABLE_EQUITY_SEQ, cms_collateral_id, 'STBG', 'ISIN003', 'S', 10000 " +
                "from cms_security where sci_security_dtl_id = 'MS600-Test04'");


        //========= Feeds Info ==========//
        dao.getJdbcTemplate().update("insert into CMS_PRICE_FEED (FEED_ID, RIC, STOCK_CODE, UNIT_PRICE, " +
                "PREV_QUARTER_PRICE, CURRENCY, EXPIRY_DATE, FEED_REF) " +
                "select 100000 + next value for CMS_PRICE_FEED_SEQ, 'RIC001', STOCK_CODE, 15, " +
                "12, 'MYR', current timestamp + 1 month,  next value for CMS_PRICE_FEED_SEQ " +
                "from cms_portfolio_item where cms_collateral_id = " +
                "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test04')");

        dao.getJdbcTemplate().update("insert into CMS_CREDIT_RISK_PARAM (PARAM_ID, FEED_ID, PARAM_REF, BOARD_TYPE, " +
                "SHARE_STATUS, PREV_SHARE_STATUS, IS_INT_SUSPEND) " +
                "select 100000 + next value for CMS_PRICE_FEED_SEQ, FEED_ID, FEED_ID, '1', '1', '2', 'N' " +
                "from CMS_PRICE_FEED where STOCK_CODE = " +
                    "(select STOCK_CODE from cms_portfolio_item where cms_collateral_id " +
                    "= (select cms_collateral_id from cms_security where sci_security_dtl_id = 'MS600-Test04'))");

        dao.getJdbcTemplate().update("update CMS_POLICY_CAP set MAX_CAP_PRICE = 10 where BOARD = '1'");

    }

    private void verifyTestData() {
        String query = "SELECT * from CMS_SECURITY WHERE sci_security_dtl_id Like 'MS%-Test%'";

        Object result = dao.getJdbcTemplate().query(query, new Object[] { },
				new ResultSetExtractor() {

					public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
                            String secDtlId = rs.getString("sci_security_dtl_id");
                            Date valuationDate = rs.getDate("LAST_REMARGIN_DATE");
                            Date nextValDate = rs.getDate("NEXT_REMARGIN_DATE");
                            String valuationType = rs.getString("VALUATION_TYPE");
                            String cmvCurr = rs.getString("CMV_CURRENCY");
                            double cmvAmt = rs.getDouble("CMV");
                            String fsvCurr = rs.getString("FSV_CURRENCY");
                            double fsvAmt = rs.getDouble("FSV");

                            System.out.println("****************************************");
                            System.out.println("sci_security_dtl_id = " + secDtlId);
                            System.out.println("LAST_REMARGIN_DATE = " + valuationDate);
                            System.out.println("NEXT_REMARGIN_DATE = " + nextValDate);
                            System.out.println("VALUATION_TYPE = " + valuationType);
                            System.out.println("CMV_CURRENCY = " + cmvCurr);
                            System.out.println("CMV = " + cmvAmt);
                            System.out.println("FSV_CURRENCY = " + fsvCurr);
                            System.out.println("FSV = " + fsvAmt);

                            assertNotNull(valuationDate);
                            assertNotNull(nextValDate);
                            assertNotNull(valuationType);
                            assertNotNull(cmvCurr);
                            assertNotNull(fsvCurr);
                            if(("MS600-Test03").equals(secDtlId)) {
                                assertTrue("CMV is Not 0", cmvAmt == 0);
                                assertTrue("FSV is Not 0", fsvAmt == 0);
                            } else {
                                assertTrue("CMV is Not 0", cmvAmt != 0);
                                assertTrue("FSV is Not 0", fsvAmt != 0);
                            }

                        }

						return null;
					}

				});


    }


}

package com.integrosys.cms.batch.valuation;

import org.springframework.test.AbstractTransactionalSpringContextTests;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.dao.DataAccessException;
import org.easymock.MockControl;

import javax.sql.DataSource;

import com.integrosys.cms.app.collateral.bus.valuation.ValuationHandler;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.StrtLineValuator;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.VehicleValuator;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.GoldValuator;
import com.integrosys.cms.app.collateral.bus.valuation.support.VehicleFeedProfileSingleton;
import com.integrosys.cms.app.collateral.bus.valuation.dao.GenericValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.dao.StrtLineValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.dao.VehicleValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.dao.GoldValuationDAO;
import com.integrosys.cms.batch.factory.BatchParameterValidator;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;

import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by IntelliJ IDEA.
 * User: Cynthia
 * Date: Nov 4, 2008
 * Time: 6:43:50 PM
 * To change this template use File | Settings | File Templates.
 */
public class ValuationAB102P55aFeedTest extends AbstractTransactionalSpringContextTests {

    MockControl batchParameterValidatorControl;
    ApplicationContext context = getApplicationContext();
    DataSource dataSource;
    ValuationMain main;
    ValuationMainDAO dao;
    ValuationHandler valHandler;
    Map valuationDaoMap;
    Map valuatorMap;
    GenericValuationDAO genericValuationDao;
    VehicleFeedProfileSingleton feedProfileSingleton;


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

        Map paramMap = new HashMap();

        paramMap.put("country", "MY");
        paramMap.put("sectype", "AB");
        paramMap.put("secid", "AB102-Test02");
        feedProfileSingleton.init();

        List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
        long noOfSec = dao.getNoOfSecurities(paramMap);
        DefaultLogger.debug(this, "Executed Test Case");
        System.out.println("Number of Securities = " + noOfSec + "\n\n");
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

        StrtLineValuationDAO jdbcDao = new StrtLineValuationDAO();
        jdbcDao.setDataSource(dataSource);
        jdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        VehicleValuationDAO vehJdbcDao = new VehicleValuationDAO();
        vehJdbcDao.setDataSource(dataSource);
        vehJdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        feedProfileSingleton = VehicleFeedProfileSingleton.getInstance();
        feedProfileSingleton.setVehicleValuationDao(vehJdbcDao);

        GoldValuationDAO goldJdbcDao = new GoldValuationDAO();
        goldJdbcDao.setDataSource(dataSource);
        goldJdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        valuationDaoMap.put("AB101", jdbcDao);
        valuationDaoMap.put("AB102", vehJdbcDao);
        valuationDaoMap.put("AB109", jdbcDao);
        valuationDaoMap.put("AB110", goldJdbcDao);
        valuationDaoMap.put("AB111", jdbcDao);

        StrtLineValuator valuator = new StrtLineValuator();
        VehicleValuator vehValuator = new VehicleValuator();
        vehValuator.setVehicleFeedProfileSingleton(feedProfileSingleton);
        GoldValuator goldValuator = new GoldValuator();
        valuatorMap.put("AB101", valuator);
        valuatorMap.put("AB102", vehValuator);
        valuatorMap.put("AB109", valuator);
        valuatorMap.put("AB110", goldValuator);
        valuatorMap.put("AB111", valuator);

    }


    private void insertTestData() {

         //insertTestCase1();
         insertTestCase2();


        //========= Security Parameter ==========//
        dao.getJdbcTemplate().update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', " +
                "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 " +
                "where SECURITY_SUB_TYPE_ID like 'AB%' and country_iso_code = 'MY'");


        //========= CMS_SECURITY_ASSET_LIFE ==========//
        dao.getJdbcTemplate().update("update CMS_SECURITY_ASSET_LIFE set LIFESPAN = 15 where SECURITY_SUB_TYPE_ID = 'AB102'");

    }


    private void insertTestCase1() {

        //========= AB102: using feeds ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, " +
                   "IS_SECURITY_PERFECTED) " +
                   "select 20070101000000 + next value for collateral_seq, 'AB102', 'AB102-Test01', 'MY', subtype_name, " +
                   "security_type_name, 'AB102', 'AB', 'MYR', 'ACTIVE', 'MYR', '2016', 'CMS', 'N', 'N' " +
                   "from cms_security_sub_type where security_sub_type_id = 'AB102'");

        dao.getJdbcTemplate().update("insert into cms_asset (cms_collateral_id, PURCHASE_PRICE, SCRAP_VALUE, GOOD_STATUS, " +
                "MANUFACTURE_YEAR, DEPRECIATE_RATE, BRAND, MODEL_NO ) " +
                "select cms_collateral_id, 553666, 12000, 'G', 2007, " +
                "0, 'HONDA', 'ACCORD 1.8' " +
                "from cms_security where sci_security_dtl_id = 'AB102-Test01'");


//        dao.getJdbcTemplate().update("insert into cms_vehicle_price_feed (COMPOSITE_ID, REGION, " +
//                "CAR_MAKE, CAR_MODEL, CAR_YEAR, CAR_FSV, PURCHASE_CURRENCY, LAST_UPDATE_DATE) " +
//                "select char(ast.cms_collateral_id), 'EM', BRAND, MODEL_NO, ast.MANUFACTURE_YEAR, 12000, 'MYR', current timestamp " +
//                "from cms_asset ast, cms_security sec " +
//                "where ast.cms_collateral_id = sec.cms_collateral_id " +
//                "and sec.sci_security_dtl_id = 'AB102-Test02'");

        dao.getJdbcTemplate().update("insert into cms_vehicle_price_feed (COMPOSITE_ID, REGION, " +
                "CAR_MAKE, CAR_MODEL, CAR_YEAR, CAR_FSV, PURCHASE_CURRENCY, LAST_UPDATE_DATE) " +
                "select to_char(ast.cms_collateral_id), 'EM', 'HONDA', 'ACCORD 1.8', 2007, 87000, 'MYR', current timestamp " +
                "from cms_asset ast, cms_security sec " +
                "where ast.cms_collateral_id = sec.cms_collateral_id " +
                "and sec.sci_security_dtl_id = 'AB102-Test01'");

        dao.getJdbcTemplate().update("update common_code_category_entry set REF_ENTRY_CODE = 'EM' " +
                "where category_code = 'CENTRE' and entry_code = '77'");

    }


    private void insertTestCase2() {

        //========= AB102: using feeds ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, " +
                   "IS_SECURITY_PERFECTED) " +
                   "select 20070101000000 + next value for collateral_seq, 'AB102', 'AB102-Test02', 'MY', subtype_name, " +
                   "security_type_name, 'AB102', 'AB', 'MYR', 'ACTIVE', 'MYR', '2', 'CMS', 'N', 'N' " +
                   "from cms_security_sub_type where security_sub_type_id = 'AB102'");

        dao.getJdbcTemplate().update("insert into cms_asset (cms_collateral_id, PURCHASE_PRICE, SCRAP_VALUE, GOOD_STATUS, " +
                "MANUFACTURE_YEAR, DEPRECIATE_RATE, BRAND, MODEL_NO ) " +
                "select cms_collateral_id, 120000, 1000, 'U', 2006, " +
                "0, 'FORD', '728I' " +
                "from cms_security where sci_security_dtl_id = 'AB102-Test02'");


//        dao.getJdbcTemplate().update("insert into cms_vehicle_price_feed (COMPOSITE_ID, REGION, " +
//                "CAR_MAKE, CAR_MODEL, CAR_YEAR, CAR_FSV, PURCHASE_CURRENCY, LAST_UPDATE_DATE) " +
//                "select char(ast.cms_collateral_id), 'EM', BRAND, MODEL_NO, ast.MANUFACTURE_YEAR, 12000, 'MYR', current timestamp " +
//                "from cms_asset ast, cms_security sec " +
//                "where ast.cms_collateral_id = sec.cms_collateral_id " +
//                "and sec.sci_security_dtl_id = 'AB102-Test02'");

        dao.getJdbcTemplate().update("insert into cms_vehicle_price_feed (COMPOSITE_ID, REGION, " +
                "CAR_MAKE, CAR_MODEL, CAR_YEAR, CAR_FSV, PURCHASE_CURRENCY, LAST_UPDATE_DATE) " +
                "select to_char(ast.cms_collateral_id), 'WM', 'FORD', '728I', 2006, 88000, 'MYR', current timestamp " +
                "from cms_asset ast, cms_security sec " +
                "where ast.cms_collateral_id = sec.cms_collateral_id " +
                "and sec.sci_security_dtl_id = 'AB102-Test02'");

        dao.getJdbcTemplate().update("update common_code_category_entry set REF_ENTRY_CODE = 'WM' " +
                "where category_code = 'CENTRE' and entry_code = '2'");

    }


    private void verifyTestData() {
        String query = "SELECT * from CMS_SECURITY WHERE sci_security_dtl_id like 'AB%-Test%'";

        Object result = dao.getJdbcTemplate().query(query, new Object[] { },
				new ResultSetExtractor() {

					public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
                            long collateralID = rs.getLong("CMS_COLLATERAL_ID");
							String subtype = rs.getString("SECURITY_SUB_TYPE_ID");
                            Date valuationDate = rs.getDate("LAST_REMARGIN_DATE");
                            Date nextValDate = rs.getDate("NEXT_REMARGIN_DATE");
                            String valSourceType = rs.getString("VALUATION_TYPE");
                            String cmvCurr = rs.getString("CMV_CURRENCY");
                            double cmvAmt = rs.getDouble("CMV");
                            String fsvCurr = rs.getString("FSV_CURRENCY");
                            double fsvAmt = rs.getDouble("FSV");


                            System.out.println("*********************** " + subtype + "*********************** ");
                            System.out.println("CMS_COLLATERAL_ID = " + collateralID);
                            System.out.println("LAST_REMARGIN_DATE = " + valuationDate);
                            System.out.println("NEXT_REMARGIN_DATE = " + nextValDate);
                            System.out.println("VALUATION_TYPE = " + valSourceType);
                            System.out.println("CMV_CURRENCY = " + cmvCurr);
                            System.out.println("CMV = " + cmvAmt);
                            System.out.println("FSV_CURRENCY = " + fsvCurr);
                            System.out.println("FSV = " + fsvAmt);

                            assertNotNull(valuationDate);
                            assertNotNull(nextValDate);
                            assertNotNull(valSourceType);
                            assertNotNull(cmvCurr);
                            assertTrue("CMV is Not 0", cmvAmt > 0);
                            assertNotNull(fsvCurr);
                            assertTrue("FSV is Not 0", fsvAmt > 0);

                        }

						return null;
					}

				});


    }


}

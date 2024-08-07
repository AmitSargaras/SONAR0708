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
import com.integrosys.cms.app.collateral.bus.valuation.dao.GoldValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.dao.StrtLineValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.dao.VehicleValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.support.GoldFeedProfileSingleton;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.GoldValuator;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.StrtLineValuator;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.VehicleValuator;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.factory.BatchParameterValidator;

/**
 * Created by IntelliJ IDEA.
 * User: Cynthia
 * Date: Nov 4, 2008
 * Time: 6:43:50 PM
 * To change this template use File | Settings | File Templates.
 */
public class ValuationABTest extends AbstractTransactionalSpringContextTests {

    MockControl batchParameterValidatorControl;
    ApplicationContext context = getApplicationContext();
    DataSource dataSource;
    ValuationMain main;
    ValuationMainDAO dao;
    ValuationHandler valHandler;
    Map valuationDaoMap;
    Map valuatorMap;
    GenericValuationDAO genericValuationDao;
    GoldFeedProfileSingleton goldFeedProfileSingleton;



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
        goldFeedProfileSingleton.init();

        Map paramMap = new HashMap();
        paramMap.put("country", "MY");
        paramMap.put("sectype", "AB");
        paramMap.put("secid", "AB110-Test01");

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

        StrtLineValuationDAO jdbcDao = new StrtLineValuationDAO();
        jdbcDao.setDataSource(dataSource);
        jdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        VehicleValuationDAO vehJdbcDao = new VehicleValuationDAO();
        vehJdbcDao.setDataSource(dataSource);
        vehJdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        GoldValuationDAO goldJdbcDao = new GoldValuationDAO();
        goldJdbcDao.setDataSource(dataSource);
        goldJdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        goldFeedProfileSingleton = GoldFeedProfileSingleton.getInstance();
        goldFeedProfileSingleton.setGoldValuationDao(goldJdbcDao);

        valuationDaoMap.put("AB101", jdbcDao);
        valuationDaoMap.put("AB102", vehJdbcDao);
        valuationDaoMap.put("AB109", jdbcDao);
        valuationDaoMap.put("AB110", goldJdbcDao);
        valuationDaoMap.put("AB111", jdbcDao);

        StrtLineValuator valuator = new StrtLineValuator();
        VehicleValuator vehValuator = new VehicleValuator();
        GoldValuator goldValuator = new GoldValuator();
        goldValuator.setGoldFeedProfileSingleton(goldFeedProfileSingleton);

        valuatorMap.put("AB101", valuator);
        valuatorMap.put("AB102", vehValuator);
        valuatorMap.put("AB109", valuator);
        valuatorMap.put("AB110", goldValuator);
        valuatorMap.put("AB111", valuator);

    }


    private void insertTestData() {
        //========= AB101 ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, " +
                   "IS_SECURITY_PERFECTED)" + //, SECURITY_PERFECTION_DATE) " +
                   "select 20070101000000 + next value for collateral_seq, 'AB101', 'AB101-Test01', 'MY', subtype_name, " +
                   "security_type_name, 'AB101', 'AB', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y' " + //, current timestamp - 2 years " +
                   "from cms_security_sub_type where security_sub_type_id = 'AB101'");

        dao.getJdbcTemplate().update("insert into cms_asset (cms_collateral_id, PURCHASE_PRICE, PURCHASE_DATE, " +
                "SCRAP_VALUE, GOOD_STATUS, " +
                "MANUFACTURE_YEAR, INIT_RESIDUAL_ASSET_LIFE, INIT_RESIDUAL_ASSET_LIFE_UOM, INIT_RESIDUAL_ASSET_LIFE_DATE, " +
                "DEPRECIABLE_ASSET_VALUE, DEPRECIABLE_ASSET_VALUE_DATE, DEPRECIATE_RATE ) " +
                "select cms_collateral_id, 50000, current timestamp - 4 year, " +
                "5000, 'U', " +
                "1998, 10, 'Y', current date - 10 year, 40000, current date - 10 year, 100 " +
                "from cms_security where sci_security_dtl_id = 'AB101-Test01'");


        dao.getJdbcTemplate().update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, " +
                "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) " +
                "select 20070101000000 + next value for VALUATION_SEQ, cms_collateral_id, 20000, 2000, 'MYR', " +
                "current timestamp - 1 year, current timestamp - 1 year, 'S' " +
                "from cms_security where sci_security_dtl_id = 'AB101-Test01' ");



        //========= AB109 ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, " +
                   "IS_SECURITY_PERFECTED, SECURITY_PERFECTION_DATE) " +
                   "select 20070101000000 + next value for collateral_seq, 'AB109', 'AB109-Test01', 'MY', subtype_name, " +
                   "security_type_name, 'AB109', 'AB', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp " +
                   "from cms_security_sub_type where security_sub_type_id = 'AB109'");

        dao.getJdbcTemplate().update("insert into cms_asset (cms_collateral_id, PURCHASE_PRICE, PURCHASE_DATE, " +
                "SCRAP_VALUE, GOOD_STATUS, " +
                "MANUFACTURE_YEAR, INIT_RESIDUAL_ASSET_LIFE, INIT_RESIDUAL_ASSET_LIFE_UOM, INIT_RESIDUAL_ASSET_LIFE_DATE, " +
                "DEPRECIABLE_ASSET_VALUE, DEPRECIABLE_ASSET_VALUE_DATE, DEPRECIATE_RATE ) " +
                "select cms_collateral_id, 50000, current timestamp - 4 year, " +
                "5000, 'U', " +
                "1998, 10, 'Y', current date - 10 year, 40000, current date - 10 year, 100 " +
                "from cms_security where sci_security_dtl_id = 'AB109-Test01'");



        //========= AB111 ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, " +
                   "IS_SECURITY_PERFECTED, SECURITY_PERFECTION_DATE) " +
                   "select 20070101000000 + next value for collateral_seq, 'AB111', 'AB111-Test01', 'MY', subtype_name, " +
                   "security_type_name, 'AB111', 'AB', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp " +
                   "from cms_security_sub_type where security_sub_type_id = 'AB111'");

//        dao.getJdbcTemplate().update("insert into cms_asset (cms_collateral_id, PURCHASE_PRICE, PURCHASE_DATE, " +
//                "SCRAP_VALUE, GOOD_STATUS, " +
//                "MANUFACTURE_YEAR, INIT_RESIDUAL_ASSET_LIFE, INIT_RESIDUAL_ASSET_LIFE_UOM, INIT_RESIDUAL_ASSET_LIFE_DATE, " +
//                "DEPRECIABLE_ASSET_VALUE, DEPRECIABLE_ASSET_VALUE_DATE, DEPRECIATE_RATE ) " +
//                "select cms_collateral_id, 50000, current timestamp - 4 year, 2000, 'N', " +
//                "2000, 10, 'Y', current date - 2 year, 40000, current date - 2 year, 100 " +
//                "from cms_security where sci_security_dtl_id = 'AB111-Test01'");


        dao.getJdbcTemplate().update("insert into cms_asset (cms_collateral_id, PURCHASE_PRICE, PURCHASE_DATE, " +
                "SCRAP_VALUE, GOOD_STATUS, MANUFACTURE_YEAR  ) " +
                "select cms_collateral_id, 50000, current timestamp - 4 year, 10000, 'N', 2000 " +
                "from cms_security where sci_security_dtl_id = 'AB111-Test01'");


        //========= Security Parameter ==========//
        dao.getJdbcTemplate().update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', " +
                "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 " +
                "where SECURITY_SUB_TYPE_ID like 'AB%' and country_iso_code = 'MY'");


        //========= CMS_SECURITY_ASSET_LIFE ==========//
        dao.getJdbcTemplate().update("update CMS_SECURITY_ASSET_LIFE set LIFESPAN = 20 where SECURITY_SUB_TYPE_ID like 'AB%'");


    }




    private void verifyTestData() {
        String query = "SELECT * from CMS_SECURITY sec, CMS_ASSET ast " +
                "WHERE sec.cms_collateral_id = ast.cms_collateral_id " +
                "AND sec.sci_security_dtl_id like 'AB%-Test%'";

        Object result = dao.getJdbcTemplate().query(query, new Object[] { },
				new ResultSetExtractor() {

					public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
                            long collateralID = rs.getLong("CMS_COLLATERAL_ID");
                            String secId = rs.getString("sci_security_dtl_id");
							String subtype = rs.getString("SECURITY_SUB_TYPE_ID");
                            Date valuationDate = rs.getDate("LAST_REMARGIN_DATE");
                            Date nextValDate = rs.getDate("NEXT_REMARGIN_DATE");
                            String valSourceType = rs.getString("VALUATION_TYPE");
                            String cmvCurr = rs.getString("CMV_CURRENCY");
                            double cmvAmt = rs.getDouble("CMV");
                            String fsvCurr = rs.getString("FSV_CURRENCY");
                            double fsvAmt = rs.getDouble("FSV");
                            String initialResidualAssetLife = rs.getString("INIT_RESIDUAL_ASSET_LIFE");
                            String initialResidualAssetLifeDate = rs.getString("INIT_RESIDUAL_ASSET_LIFE_DATE");
                            String depAssetValue = rs.getString("DEPRECIABLE_ASSET_VALUE");
                            String depAssetValueDate = rs.getString("DEPRECIABLE_ASSET_VALUE_DATE");
                            String depRate = rs.getString("DEPRECIATE_RATE");


                            System.out.println("*********************** " + subtype + "*********************** ");
                            System.out.println("CMS_COLLATERAL_ID = " + collateralID);
                            System.out.println("SEC ID = " + secId);
                            System.out.println("LAST_REMARGIN_DATE = " + valuationDate);
                            System.out.println("NEXT_REMARGIN_DATE = " + nextValDate);
                            System.out.println("VALUATION_TYPE = " + valSourceType);
                            System.out.println("CMV_CURRENCY = " + cmvCurr);
                            System.out.println("CMV = " + cmvAmt);
                            System.out.println("FSV_CURRENCY = " + fsvCurr);
                            System.out.println("FSV = " + fsvAmt);

                            System.out.println("initialResidualAssetLife = " + initialResidualAssetLife);
                            System.out.println("initialResidualAssetLifeDate = " + initialResidualAssetLifeDate);
                            System.out.println("depAssetValue = " + depAssetValue);
                            System.out.println("depAssetValueDate = " + depAssetValueDate);
                            System.out.println("depRate = " + depRate);

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

package com.integrosys.cms.batch.valuation;

import org.springframework.test.AbstractTransactionalSpringContextTests;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.dao.DataAccessException;
import org.easymock.MockControl;

import javax.sql.DataSource;

import com.integrosys.cms.app.collateral.bus.valuation.ValuationHandler;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.GuaranteeValuator;
import com.integrosys.cms.app.collateral.bus.valuation.dao.GenericValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.dao.GuaranteeValuationDAO;
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
public class ValuationGTUATTest extends AbstractTransactionalSpringContextTests {

    MockControl batchParameterValidatorControl;
    ApplicationContext context = getApplicationContext();
    DataSource dataSource;
    ValuationMain main;
    ValuationMainDAO dao;
    ValuationHandler valHandler;
    Map valuationDaoMap;
    Map valuatorMap;
    GenericValuationDAO genericValuationDao;


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
        paramMap.put("sectype", "GT");
        paramMap.put("secId", "20081112000000016");


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

        GuaranteeValuationDAO jdbcDao = new GuaranteeValuationDAO();
        jdbcDao.setDataSource(dataSource);
        jdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        valuationDaoMap.put("GT400", jdbcDao);
        valuationDaoMap.put("GT402", jdbcDao);
        valuationDaoMap.put("GT404", jdbcDao);
        valuationDaoMap.put("GT405", jdbcDao);
        valuationDaoMap.put("GT406", jdbcDao);
        valuationDaoMap.put("GT407", jdbcDao);
        valuationDaoMap.put("GT408", jdbcDao);
        valuationDaoMap.put("GT410", jdbcDao);

        GuaranteeValuator valuator = new GuaranteeValuator();
        valuatorMap.put("GT400", valuator);
        valuatorMap.put("GT402", valuator);
        valuatorMap.put("GT404", valuator);
        valuatorMap.put("GT405", valuator);
        valuatorMap.put("GT406", valuator);
        valuatorMap.put("GT407", valuator);
        valuatorMap.put("GT408", valuator);
        valuatorMap.put("GT410", valuator);

    }


    private void insertTestData() {

        //========= GT402 ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) " +
                   "select 20070101000000 + next value for collateral_seq, 'GT402', '20081112000000016', 'MY', subtype_name, " +
                   "security_type_name, 'GT402', 'GT', 'AUD', 'ACTIVE', 'MYR', '90', 'SIBS', 'N' " +
                   "from cms_security_sub_type where security_sub_type_id = 'GT402'");

//        dao.getJdbcTemplate().update("insert into cms_security " +
//                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
//                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, " +
//                   "sci_orig_security_currency, security_organisation, is_migrated_ind) " +
//                   "select 20070101000000 + next value for collateral_seq, 'GT402', '20081112000000016', 'MY', subtype_name, " +
//                   "security_type_name, 'GT402', 'GT', 'AUD', 'MYR', '90', 'N' " +
//                   "from cms_security_sub_type where security_sub_type_id = 'GT402'");

        dao.getJdbcTemplate().update("insert into cms_guarantee (cms_collateral_id, GUARANTEE_AMT, CURRENCY_CODE) " +
                "select cms_collateral_id, 1000000, 'AUD' from cms_security where sci_security_dtl_id = '20081112000000016'");


//        dao.getJdbcTemplate().update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, " +
//                "VALUATION_CURRENCY, VALUATION_DATE, SOURCE_TYPE ) " +
//                "select 20070101000000 + next value for VALUATION_SEQ, cms_collateral_id, 'AUD', " +
//                "timestamp('2008-11-12-2.29.01.000000'), 'M' " +
//                "from cms_security where sci_security_dtl_id = '20081112000000016' ");


        //test if CMV is provided, then this value should be copied over
        dao.getJdbcTemplate().update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, " +
                "VALUATION_CURRENCY, VALUATION_DATE, SOURCE_TYPE ) " +
                "select 20070101000000 + next value for VALUATION_SEQ, cms_collateral_id, 5000, 'AUD', " +
                "timestamp('2008-11-12-2.29.01.000000'), 'M' " +
                "from cms_security where sci_security_dtl_id = '20081112000000016' ");

        //========= Security Parameter ==========//
        //Valuation only valid for 1 day
//        dao.getJdbcTemplate().update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '1', " +
//                "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 0 " +
//                "where SECURITY_SUB_TYPE_ID like 'GT%' and country_iso_code = 'MY'");

        //Valuation only valid for 1 year
        dao.getJdbcTemplate().update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '1', " +
                "VALUATION_FREQUENCY = 4, THRESHOLD_PERCENT = 20 " +
                "where SECURITY_SUB_TYPE_ID like 'GT%' and country_iso_code = 'MY'");

    }


    private void verifyTestData() {
        String query = "SELECT * from CMS_SECURITY WHERE sci_security_dtl_id = '20081112000000016'";

        Object result = dao.getJdbcTemplate().query(query, new Object[] { },
				new ResultSetExtractor() {

					public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
							String subtype = rs.getString("SECURITY_SUB_TYPE_ID");
                            Date valuationDate = rs.getDate("LAST_REMARGIN_DATE");
                            Date nextValDate = rs.getDate("NEXT_REMARGIN_DATE");
                            String valuationType = rs.getString("VALUATION_TYPE");
                            String cmvCurr = rs.getString("CMV_CURRENCY");
                            double cmvAmt = rs.getDouble("CMV");
                            String fsvCurr = rs.getString("FSV_CURRENCY");
                            double fsvAmt = rs.getDouble("FSV");


                            System.out.println("SECURITY_SUB_TYPE_ID = " + subtype);
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
                            //assertTrue("CMV is Not 0", cmvAmt != 0);
                            assertNotNull(fsvCurr);
                            //assertTrue("FSV is Not 0", fsvAmt != 0);

                        }

						return null;
					}

				});


    }


}

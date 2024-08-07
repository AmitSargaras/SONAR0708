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
import com.integrosys.cms.app.collateral.bus.valuation.dao.InsuranceValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.InsuranceValuator;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.factory.BatchParameterValidator;

/**
 * Created by IntelliJ IDEA.
 * User: Cynthia
 * Date: Nov 4, 2008
 * Time: 6:43:50 PM
 * To change this template use File | Settings | File Templates.
 */
public class ValuationINTest extends AbstractTransactionalSpringContextTests {

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
        paramMap.put("sectype", "IN");

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

        InsuranceValuationDAO jdbcDao = new InsuranceValuationDAO();
        jdbcDao.setDataSource(dataSource);
        jdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        valuationDaoMap.put("IN500", jdbcDao);
        valuationDaoMap.put("IN501", jdbcDao);
        valuationDaoMap.put("IN502", jdbcDao);
        valuationDaoMap.put("IN503", jdbcDao);

        InsuranceValuator valuator = new InsuranceValuator();
        valuatorMap.put("IN500", valuator);
        valuatorMap.put("IN501", valuator);
        valuatorMap.put("IN502", valuator);
        valuatorMap.put("IN503", valuator);

    }


    private void insertTestData() {
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) " +
                   "select 20070101000000 + next value for collateral_seq, 'IN500', 'IN500-Test01', 'MY', subtype_name, " +
                   "security_type_name, 'IN500', 'IN', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' " +
                   "from cms_security_sub_type where security_sub_type_id = 'IN500'");

        dao.getJdbcTemplate().update("insert into cms_insurance (cms_collateral_id, INSURED_AMOUNT, INSURED_AMT_CURR) " +
                "select cms_collateral_id, 20000, 'MYR' from cms_security where sci_security_dtl_id = 'IN500-Test01'");


        dao.getJdbcTemplate().update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', " +
                "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 " +
                "where SECURITY_SUB_TYPE_ID like 'IN%' and country_iso_code = 'MY'");

    }


    private void verifyTestData() {
        String query = "SELECT * from CMS_SECURITY WHERE sci_security_dtl_id = 'IN500-Test01'";

        Object result = dao.getJdbcTemplate().query(query, new Object[] { },
				new ResultSetExtractor() {

					public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
						if (rs.next()) {
							Date valuationDate = rs.getDate("LAST_REMARGIN_DATE");
                            Date nextValDate = rs.getDate("NEXT_REMARGIN_DATE");
                            String valuationType = rs.getString("VALUATION_TYPE");
                            String cmvCurr = rs.getString("CMV_CURRENCY");
                            double cmvAmt = rs.getDouble("CMV");
                            String fsvCurr = rs.getString("FSV_CURRENCY");
                            double fsvAmt = rs.getDouble("FSV");

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
                            assertTrue("CMV is Not 0", cmvAmt != 0);
                            assertNotNull(fsvCurr);
                            assertTrue("FSV is Not 0", fsvAmt != 0);

                        }

						return null;
					}

				});


    }


}

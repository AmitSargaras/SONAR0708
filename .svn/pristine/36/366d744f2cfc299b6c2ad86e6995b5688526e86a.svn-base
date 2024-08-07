package com.integrosys.cms.batch.valuation;

import org.springframework.test.AbstractTransactionalSpringContextTests;
import org.springframework.context.ApplicationContext;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.dao.DataAccessException;
import org.easymock.MockControl;

import javax.sql.DataSource;

import com.integrosys.cms.app.collateral.bus.valuation.ValuationHandler;
import com.integrosys.cms.app.collateral.bus.valuation.support.PropertyProfileSingleton;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.*;
import com.integrosys.cms.app.collateral.bus.valuation.dao.*;
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
public class ValuationGT409Test extends AbstractTransactionalSpringContextTests {

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
        DefaultLogger.debug(this, "Executed Test Case");


        System.out.println("========== Test AB Case ============ ");
        paramMap.put("country", "MY");
        paramMap.put("sectype", "AB");

        List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
        long noOfSec = dao.getNoOfSecurities(paramMap);
        System.out.println("Number of Securities = " + noOfSec + "\n\n");
        main.processValuationModelList(resultList);


        System.out.println("========== Test PT Case ============ ");
        paramMap.put("country", "MY");
        paramMap.put("sectype", "PT");

        resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
        noOfSec = dao.getNoOfSecurities(paramMap);
        System.out.println("Number of Securities = " + noOfSec + "\n\n");
        main.processValuationModelList(resultList);

        System.out.println("========== Test GT Case ============ ");
        paramMap.put("country", "MY");
        paramMap.put("sectype", "GT");
        paramMap.put("specialhandle", "GT409");

        resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
        noOfSec = dao.getNoOfSecurities(paramMap);
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
        setupValuationHandlerAB();
        setupValuationHandlerPT();
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

        CGCValuationDAO jdbcDao = new CGCValuationDAO();
        jdbcDao.setDataSource(dataSource);
        jdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        valuationDaoMap.put("GT409", jdbcDao);

        CGCValuator valuator = new CGCValuator();
        valuator.setCgcValuationDAO(jdbcDao);
        valuatorMap.put("GT409", valuator);

    }


    private void setupValuationHandlerAB() {

        StrtLineValuationDAO jdbcDao = new StrtLineValuationDAO();
        jdbcDao.setDataSource(dataSource);
        jdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        VehicleValuationDAO vehJdbcDao = new VehicleValuationDAO();
        vehJdbcDao.setDataSource(dataSource);
        vehJdbcDao.setSequenceFormatter(new DateSequencerFormatter());

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
        GoldValuator goldValuator = new GoldValuator();
        valuatorMap.put("AB101", valuator);
        valuatorMap.put("AB102", vehValuator);
        valuatorMap.put("AB109", valuator);
        valuatorMap.put("AB110", goldValuator);
        valuatorMap.put("AB111", valuator);

    }

    private void setupValuationHandlerPT() {

        PropertyValuationDAO jdbcDao = new PropertyValuationDAO();
        jdbcDao.setDataSource(dataSource);
        jdbcDao.setSequenceFormatter(new DateSequencerFormatter());

        PropertyProfileSingleton profileSingleton = PropertyProfileSingleton.getInstance();
        profileSingleton.setPropertyValuationDao(jdbcDao);
        profileSingleton.init();

        valuationDaoMap.put("PT700", jdbcDao);
        valuationDaoMap.put("PT701", jdbcDao);
        valuationDaoMap.put("PT702", jdbcDao);
        valuationDaoMap.put("PT703", jdbcDao);
        valuationDaoMap.put("PT704", jdbcDao);
        valuationDaoMap.put("PT706", jdbcDao);
        valuationDaoMap.put("PT707", jdbcDao);
        valuationDaoMap.put("PT709", jdbcDao);
        valuationDaoMap.put("PT710", jdbcDao);

        PropertyIndexValuator valuator = new PropertyIndexValuator();
        valuator.setPropertyProfileSingleton(profileSingleton);


        valuatorMap.put("PT700", valuator);
        valuatorMap.put("PT701", valuator);
        valuatorMap.put("PT702", valuator);
        valuatorMap.put("PT703", valuator);
        valuatorMap.put("PT704", valuator);
        valuatorMap.put("PT706", valuator);
        valuatorMap.put("PT707", valuator);
        valuatorMap.put("PT708", valuator);
        valuatorMap.put("PT709", valuator);
        valuatorMap.put("PT710", valuator);

    }



    private void insertTestData() {

        insertTestDataCustomer();
        insertTestDataLimit();
        insertTestDataOtherSecurityAB();
        insertTestDataOtherSecurityPT();
        insertTestDataOtherLSM();
        insertTestDataGT409();

    }

    private void insertTestDataCustomer() {
         dao.getJdbcTemplate().update("insert into sci_le_main_profile  " +
                 "(cms_le_main_profile_id, lmp_le_id, lmp_long_name, lmp_short_name, " +
                 "lmp_legal_const_num, lmp_legal_const_value, LMP_INC_CNTRY_ISO_CODE, LMP_INC_NUM_TEXT, " +
                 "lmp_sgmnt_code_num, lmp_sgmnt_code_value, source_id) " +
                 "values " +
                 "(10000000 + next value for customer_seq, 'CUSTOMER-Test01', 'AAA Supermarket', 'AAA Supermarket',  " +
                 "'56', 'C', 'MY', 'CUSTOMER-VAL01', '', '', 'SIBS')");
        
        dao.getJdbcTemplate().update("insert into sci_le_sub_profile " +
                "(cms_le_sub_profile_id, lsp_id, lsp_le_id, lsp_short_name, lsp_dmcl_cntry_iso_code, " +
                "cms_le_main_profile_id, cms_sub_orig_country, cms_sub_orig_organisation, cms_non_borrower_ind) " +
                "select 10000000 + next value for profile_seq, 1, lmp_le_id, lmp_short_name, 'MY', " +
                "cms_le_main_profile_id, 'MY', '2', 'N' " +
                "from sci_le_main_profile where lmp_le_id = 'CUSTOMER-Test01'");

        dao.getJdbcTemplate().update("insert into sci_lsp_lmt_profile " +
                "(cms_lsp_lmt_profile_id, llp_le_id, llp_lsp_id, llp_bca_ref_num,  " +
                "cms_customer_id, cms_bca_status, cms_orig_country, cms_orig_organisation, source_id, " +
                "cms_bca_joint_ind, lmt_profile_type, cms_create_ind, is_migrated_ind, " +
                "llp_segment_code_num, llp_segment_code_value, application_type) " +
                "select 10000000 + next value for limit_profile_seq, lsp_le_id, lsp_id, 'AA-Test01', " +
                "cms_le_sub_profile_id, 'ACTIVE', 'MY', '2', 'SIBS', 'N', 'BANKING', 'Y', 'Y', " +
                "'', '', 'CO' " +
                "from sci_le_sub_profile where lsp_le_id = 'CUSTOMER-Test01'");
    }


    private void insertTestDataLimit() {
        dao.getJdbcTemplate().update("insert into sci_lsp_appr_lmts " +
                "(cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value, " +
                "lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, " +
                "cms_limit_status, cms_bkg_country, cms_bkg_organisation, source_id, " +
                "lmt_fac_type_num, lmt_fac_type_value, CMS_OUTSTANDING_AMT) " +
                "select 10000000 + next value for limit_seq, cms_lsp_lmt_profile_id, 'FAC-Test01', '27', 'HP', " +
                "'25', 'OUTER', 150000000, 'MYR', llp_le_id, llp_lsp_id, " +
                "'ACTIVE', cms_orig_country, cms_orig_organisation, 'SIBS', " +
                "'26', '110', 300000 " +
                "from sci_lsp_lmt_profile where llp_le_id = 'CUSTOMER-Test01'");


        dao.getJdbcTemplate().update("insert into sci_lsp_appr_lmts " +
                "(cms_lsp_appr_lmts_id, cms_limit_profile_id, lmt_id, lmt_prd_type_num, lmt_prd_type_value, " +
                "lmt_type_num, lmt_type_value, lmt_amt, lmt_crrncy_iso_code, lmt_le_id, lmt_lsp_id, " +
                "cms_limit_status, cms_bkg_country, cms_bkg_organisation, source_id, " +
                "lmt_fac_type_num, lmt_fac_type_value, CMS_OUTSTANDING_AMT) " +
                "select 10000000 + next value for limit_seq, cms_lsp_lmt_profile_id, 'FAC-Test02', '27', 'FK', " +
                "'25', 'OUTER', 50000000, 'MYR', llp_le_id, llp_lsp_id, " +
                "'ACTIVE', cms_orig_country, cms_orig_organisation, 'SIBS', " +
                "'26', '111', 200000 " +
                "from sci_lsp_lmt_profile where llp_le_id = 'CUSTOMER-Test01'");
    }


    private void insertTestDataOtherSecurityAB() {

        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, " +
                   "IS_SECURITY_PERFECTED, SECURITY_PERFECTION_DATE, IS_CGC_PLEDGED) " +
                   "select 10000000 + next value for collateral_seq, 'AB111', 'AB111-Test01', 'MY', subtype_name, " +
                   "security_type_name, 'AB111', 'AB', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp, 'Y' " +
                   "from cms_security_sub_type where security_sub_type_id = 'AB111'");

        dao.getJdbcTemplate().update("insert into cms_asset (cms_collateral_id, PURCHASE_PRICE, SCRAP_VALUE, GOOD_STATUS, " +
                "MANUFACTURE_YEAR, INIT_RESIDUAL_ASSET_LIFE, INIT_RESIDUAL_ASSET_LIFE_UOM, " +
                "DEPRECIABLE_ASSET_VALUE, DEPRECIABLE_ASSET_VALUE_DATE, DEPRECIATE_RATE ) " +
                "select cms_collateral_id, 50000, 5000, 'N', 2000, 10, 'Y', 10, current date, 10 " +
                "from cms_security where sci_security_dtl_id = 'AB111-Test01'");

        //========= Security Parameter ==========//
        dao.getJdbcTemplate().update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', " +
                "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 " +
                "where SECURITY_SUB_TYPE_ID like 'AB%' and country_iso_code = 'MY'");


        //========= CMS_SECURITY_ASSET_LIFE ==========//
        dao.getJdbcTemplate().update("update CMS_SECURITY_ASSET_LIFE set LIFESPAN = 20 where SECURITY_SUB_TYPE_ID like 'AB%'");

        
    }

    private void insertTestDataOtherSecurityPT() {

        //========= PT704: using prev valuation ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, " +
                   "IS_SECURITY_PERFECTED, SECURITY_PERFECTION_DATE, IS_CGC_PLEDGED) " +
                   "select 10000000 + next value for collateral_seq, 'PT704', 'PT704-Test01', 'MY', subtype_name, " +
                   "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp - 2 years, 'Y' " +
                   "from cms_security_sub_type where security_sub_type_id = 'PT704'");

        dao.getJdbcTemplate().update("insert into cms_property (cms_collateral_id, POSTCODE, STATE, DISTRICT, MUKIM, " +
                "LAND_AREA, LAND_AREA_UOM, BUILTUP_AREA, BUILTUP_AREA_UOM, " +
                "SALE_PURCHASE_VALUE, SALE_PURCHASE_DATE, PROPERTY_TYPE, PROPERTY_COMPLETION_STATUS ) " +
                "select cms_collateral_id, '999', '01', '0107', 'MY04089', " +
                "3200, 'SQM', 4800, 'SQM', " +
                "20000, current timestamp, 'RES', '1' " +
                "from cms_security where sci_security_dtl_id = 'PT704-Test01'");


        //========= CMS_PROPERTY_PARAMETERS ==========//
        dao.getJdbcTemplate().update("insert into CMS_PROPERTY_PARAMETERS (PARAMETER_ID, OMV_TYPE, VARIATION_OMV, "
                + "COLLATERAL_SUBTYPE, COUNTRY_CODE, STATE_CODE, "
                + "DISTRICT_CODE, MUKIM_CODE, POST_CODE, MINIMUM_CURRENT_OMV, "
                + "LAND_AREA_VALUE_FROM, LAND_AREA_UNIT_FROM, LAND_AREA_VALUE_TO, LAND_AREA_UNIT_TO, "
                + "BUILDUP_AREA_VALUE_FROM, BUILDUP_AREA_UNIT_FROM, "
                + "BUILDUP_AREA_VALUE_TO, BUILDUP_AREA_UNIT_TO) "
                + "select 1000, 'INC', '2', 'PT704', 'MY', '01', "
                + "'0107', 'MY04089', '999', 1000000, "
                + "3000, 'SQM', 5000, 'SQM', "
                + "3000, 'SQM', 5000, 'SQM' "
                + "from dual");


        //========= Security Parameter ==========//
        dao.getJdbcTemplate().update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', " +
                "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 " +
                "where SECURITY_SUB_TYPE_ID like 'PT%' and country_iso_code = 'MY'");



        //========= CMS_PROPERTY_IDX p, CMS_PROPERTY_IDX_SEC_SUBTYPE s, CMS_PROPERTY_IDX_ITEM, CMS_PROPERTY_IDX_MUKIM_CODE, CMS_PROPERTY_IDX_PROPERTY_TYPE ==========//
        dao.getJdbcTemplate().update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, " +
                "VERSION_TIME, STATUS) " +
                "select 1001, 'ISTP', 'MY', 0, 'ACTIVE' from dual");

        dao.getJdbcTemplate().update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, " +
                "SECURITY_SUB_TYPE_ID, STATUS) " +
                "select 1002, 1001, 'PT704', 'ACTIVE' from dual");

        dao.getJdbcTemplate().update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, " +
                "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATE_CODE, STATUS, CMS_REF_ID) " +
                "select 2001, 1001, 2008, 'ANNUAL', 100, '01', 'ACTIVE', 2002 from dual");

        dao.getJdbcTemplate().update("insert into CMS_PROPERTY_IDX_MUKIM_CODE (PROPERTY_IDX_MUKIM_CODE_ID, " +
                "PROPERTY_IDX_ITEM_ID, MUKIM_CODE, STATUS) " +
                "select 3001, 2001, 'MY04089', 'ACTIVE' from dual");

        dao.getJdbcTemplate().update("insert into CMS_PROPERTY_IDX_DISTRICT_CODE (PROPERTY_IDX_DISTRICT_CODE_ID, " +
                "PROPERTY_IDX_ITEM_ID, DISTRICT_CODE, STATUS) " +
                "select 3001, 2001, '0107', 'ACTIVE' from dual");

        dao.getJdbcTemplate().update("insert into CMS_PROPERTY_IDX_PROPERTY_TYPE (PROPERTY_IDX_PROPERTY_TYPE_ID, " +
                "PROPERTY_IDX_ITEM_ID, PROPERTY_TYPE_ID, STATUS) " +
                "select 3001, 2001, 'RES', 'ACTIVE' from dual");
    }

    private void insertTestDataOtherLSM(){
        dao.getJdbcTemplate().update("insert into cms_limit_security_map " +
                "(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, " +
                "cms_lsp_lmt_profile_id, customer_category, create_date) " +
                "select 10000000 + next value for col_limit_map_seq, " +
                "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'AB111-Test01'), 'AB111-Test01', " +
                "cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp " +
                "from sci_lsp_appr_lmts where lmt_id = 'FAC-Test01'");

        dao.getJdbcTemplate().update("insert into cms_limit_security_map " +
                "(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, " +
                "cms_lsp_lmt_profile_id, customer_category, create_date) " +
                "select 10000000 + next value for col_limit_map_seq, " +
                "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'PT704-Test01'), 'PT704-Test01', " +
                "cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp " +
                "from sci_lsp_appr_lmts where lmt_id = 'FAC-Test01'");

        dao.getJdbcTemplate().update("insert into cms_limit_security_map " +
                "(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, " +
                "cms_lsp_lmt_profile_id, customer_category, create_date) " +
                "select 10000000 + next value for col_limit_map_seq, " +
                "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'PT704-Test01'), 'PT704-Test01', " +
                "cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp " +
                "from sci_lsp_appr_lmts where lmt_id = 'FAC-Test02'");
    }

    private void insertTestDataGT409() {
        //========= GT409 ==========//
        dao.getJdbcTemplate().update("insert into cms_security " +
                   "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, " +
                   "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, " +
                   "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) " +
                   "select 20070101000000 + next value for collateral_seq, 'GT409', 'GT409-Test01', 'MY', subtype_name, " +
                   "security_type_name, 'GT409', 'GT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y' " +
                   "from cms_security_sub_type where security_sub_type_id = 'GT409'");

        dao.getJdbcTemplate().update("insert into cms_guarantee (cms_collateral_id, GUARANTEE_AMT, CURRENCY_CODE, " +
                "SECURED_PORTION, UNSECURED_PORTION, UNSECURED_AMOUNT_ORIGIN) " +
                "select cms_collateral_id, 10000, 'MYR', 20, 40, 800000 from cms_security where sci_security_dtl_id = 'GT409-Test01'");

        dao.getJdbcTemplate().update("insert into cms_limit_security_map " +
                "(charge_id, cms_collateral_id, sci_las_sec_id, cms_lsp_appr_lmts_id, sci_las_lmt_id, " +
                "cms_lsp_lmt_profile_id, customer_category, create_date) " +
                "select 10000000 + next value for col_limit_map_seq, " +
                "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'GT409-Test01'), 'GT409-Test01', " +
                "cms_lsp_appr_lmts_id, lmt_id, cms_limit_profile_id, 'MB', current timestamp " +
                "from sci_lsp_appr_lmts where lmt_id = 'FAC-Test02'");

        //========= Security Parameter ==========//
        dao.getJdbcTemplate().update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', " +
                "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 " +
                "where SECURITY_SUB_TYPE_ID like 'GT%' and country_iso_code = 'MY'");
        
    }


    private void verifyTestData() {
        checkOutStanding();
        String query = "SELECT * from CMS_SECURITY WHERE sci_security_dtl_id like '%-Test%'";

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


                            System.out.println("*********************** " + subtype + "*********************** ");
                            System.out.println("LAST_REMARGIN_DATE = " + valuationDate);
                            System.out.println("NEXT_REMARGIN_DATE = " + nextValDate);
                            System.out.println("VALUATION_TYPE = " + valuationType);
                            System.out.println("CMV_CURRENCY = " + cmvCurr);
                            System.out.println("CMV = " + cmvAmt);
                            System.out.println("FSV_CURRENCY = " + fsvCurr);
                            System.out.println("FSV = " + fsvAmt);

                            //assertNotNull(valuationDate);
                            //assertNotNull(nextValDate);
                            //assertNotNull(valuationType);
                            //assertNotNull(cmvCurr);
                            //assertTrue("CMV is Not 0", cmvAmt != 0);
                            //assertNotNull(fsvCurr);
                            //assertTrue("FSV is Not 0", fsvAmt != 0);

                        }

						return null;
					}

				});


    }


    private void checkOutStanding() {

        String query ="SELECT SUM(CONVERT_AMT(DISTINCT_SEC.CMV, DISTINCT_SEC.CMV_CURRENCY, 'MYR')) TOTAL_OMV FROM " +
                        "(SELECT distinct SEC.CMS_COLLATERAL_ID, SEC.CMV, SEC.CMV_CURRENCY " +
                        "FROM CMS_SECURITY SEC, CMS_LIMIT_SECURITY_MAP LSM " +
                        "WHERE SEC.CMS_COLLATERAL_ID = LSM.CMS_COLLATERAL_ID " +
                        "AND SEC.STATUS = 'ACTIVE' " +
                        "AND IS_CGC_PLEDGED = 'Y' " +
                        "AND SECURITY_SUB_TYPE_ID <> 'GT409' " +
                        "AND (LSM.UPDATE_STATUS_IND IS NULL OR LSM.UPDATE_STATUS_IND <> 'D') " +
                        "AND EXISTS (SELECT 1 FROM CMS_LIMIT_SECURITY_MAP LSM2 " +
                        "              WHERE LSM2.CMS_COLLATERAL_ID = " +
                                            "(select cms_collateral_id from cms_security where sci_security_dtl_id = 'GT409-Test01' ) " +
                        "              AND LSM.CMS_LSP_LMT_PROFILE_ID = LSM2.CMS_LSP_LMT_PROFILE_ID " +
                        "              AND (LSM2.UPDATE_STATUS_IND IS NULL OR LSM2.UPDATE_STATUS_IND <> 'D'))) DISTINCT_SEC";


        Object result = dao.getJdbcTemplate().query(query, new Object[] { },
				new ResultSetExtractor() {

					public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
						while (rs.next()) {
                            //long collateralId = rs.getLong("CMS_COLLATERAL_ID");
                            //String secDtlId = rs.getString("sci_security_dtl_id");
                            double cmvAmt = rs.getDouble("TOTAL_OMV");

                            //System.out.println("~~~~~~~~~~~~~~~~" + collateralId + "~~~~~~~~~~~~~~~~");
                            //System.out.println("LAST_REMARGIN_DATE = " + secDtlId);
                            System.out.println("~~~~~~~~~~ TOTAL_OMV = " + cmvAmt);

                        }

                        return null;
                    }
                });
    }


}

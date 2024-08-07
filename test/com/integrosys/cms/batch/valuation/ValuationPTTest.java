package com.integrosys.cms.batch.valuation;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.easymock.MockControl;
import org.springframework.context.ApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.collateral.bus.valuation.ValuationHandler;
import com.integrosys.cms.app.collateral.bus.valuation.dao.GenericValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.dao.PropertyValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.support.PropertyProfileSingleton;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.PropertyIndexValuator;
import com.integrosys.cms.batch.factory.BatchParameterValidator;

/**
 * Created by IntelliJ IDEA. User: Cynthia Date: Nov 4, 2008 Time: 6:43:50 PM To
 * change this template use File | Settings | File Templates.
 */
public class ValuationPTTest extends AbstractTransactionalDataSourceSpringContextTests {

	MockControl batchParameterValidatorControl;

	ApplicationContext context = getApplicationContext();

	ValuationMain main;

	ValuationMainDAO dao;

	ValuationHandler valHandler;

	Map valuationDaoMap;

	Map valuatorMap;

	GenericValuationDAO genericValuationDao;

	PropertyProfileSingleton profileSingleton;

	protected String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	protected void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();
		super.onSetUp();
	}

	public void testQuery() {
		insertTestData();
		configure();
		// insertTestDataValuation();

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");
		paramMap.put("sectype", "PT");
		paramMap.put("secid", "PT704-Test01");

		List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
		long noOfSec = dao.getNoOfSecurities(paramMap);

		System.out.println("Executed Test Case");
		System.out.println("Number of Securities = " + noOfSec + "\n\n");

		main.processValuationModelList(resultList);
		verifyTestData();
		System.out.println("========== Test Case Done ============ ");
	}

	public void testValuatePropertyWithZeroSalePurchaseValueAndNoPropertyIndex() {
		endTransaction();
		startNewTransaction();
		insertTestData();

		jdbcTemplate
				.update("insert into cms_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, "
						+ "IS_SECURITY_PERFECTED, SECURITY_PERFECTION_DATE) "
						+ "select 20070101000000555, 'PT704', 'PT704-Test02', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into cms_property (cms_collateral_id, POSTCODE, STATE, DISTRICT, MUKIM, "
						+ "LAND_AREA, LAND_AREA_UOM, BUILTUP_AREA, BUILTUP_AREA_UOM, "
						+ "SALE_PURCHASE_VALUE, SALE_PURCHASE_DATE, PROPERTY_TYPE, PROPERTY_COMPLETION_STATUS, CATEGORY_OF_LAND_USE ) "
						+ "select cms_collateral_id, '999', '01', '0107', 'MY04089', 3200, 'SQM', 4800, 'SQM', "
						+ "0, TIMESTAMP ('2009-10-20 12:00:00'), 'RES', 'C', 'B08' "
						+ "from cms_security where sci_security_dtl_id = 'PT704-Test02'");
		jdbcTemplate.update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, "
				+ "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) "
				+ "values( 20070101000000999, 20070101000000555, 100000, 90000, 'MYR', "
				+ "(current timestamp - 5 year), (current timestamp - 5 year), 'S' )");

		configure();

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");
		paramMap.put("sectype", "PT");
		paramMap.put("secid", "PT704-Test02");

		List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
		long noOfSec = dao.getNoOfSecurities(paramMap);

		System.out.println("Executed Test Case");
		System.out.println("Number of Securities = " + noOfSec + "\n\n");

		Map previousValuationInfoMap = genericValuationDao.retrievePrevValuationInfo(20070101000000555l, null);
		assertFalse(previousValuationInfoMap.isEmpty());

		main.processValuationModelList(resultList);

		BigDecimal cmv = (BigDecimal) jdbcTemplate.queryForObject(
				"SELECT cmv from cms_security where cms_collateral_id = 20070101000000555", BigDecimal.class);
		System.out.println("cmv=" + cmv);
		assertNotNull(cmv);

		System.out.println("========== Valuated CMV ============ " + cmv);
		System.out.println("========== Test Case Done ============ ");
	}

	public void testValuatePropertyWithZeroSalePurchaseValueAndOldPropertyIndex() {
		endTransaction();
		startNewTransaction();
		insertTestData();

		jdbcTemplate
				.update("insert into cms_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, "
						+ "IS_SECURITY_PERFECTED, SECURITY_PERFECTION_DATE) "
						+ "select 20070101000000666, 'PT704', 'PT704-Test03', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into cms_stage_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, "
						+ "IS_SECURITY_PERFECTED, SECURITY_PERFECTION_DATE) "
						+ "select 20030101000000777, 'PT704', 'PT704-Test02', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into transaction (transaction_id, reference_id, staging_reference_id, transaction_type) "
						+ "values ('20030917000333222', 20070101000000666, 20030101000000777, 'COL')");

		jdbcTemplate
				.update("insert into cms_property (cms_collateral_id, POSTCODE, STATE, DISTRICT, MUKIM, "
						+ "LAND_AREA, LAND_AREA_UOM, BUILTUP_AREA, BUILTUP_AREA_UOM, "
						+ "SALE_PURCHASE_VALUE, SALE_PURCHASE_DATE, PROPERTY_TYPE, PROPERTY_COMPLETION_STATUS, CATEGORY_OF_LAND_USE ) "
						+ "select cms_collateral_id, '999', '01', '0107', 'MY04089', 3200, 'SQM', 4800, 'SQM', "
						+ "0, TIMESTAMP ('2009-10-20 12:00:00'), 'RES', 'C', 'B08' "
						+ "from cms_security where sci_security_dtl_id = 'PT704-Test03'");

		jdbcTemplate.update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, "
				+ "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) "
				+ "values( 20070202000000999, 20070101000000666, 100000, 90000, 'MYR', "
				+ "(current timestamp - 5 year), (current timestamp - 5 year), 'S' )");

		jdbcTemplate.update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, "
				+ "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) "
				+ "values( 20070202000001999, 20070101000000666, 80000, 70000, 'MYR', "
				+ "(current timestamp - 6 year), (current timestamp - 6 year), 'S' )");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
				+ "VERSION_TIME, STATUS) " + "select 2001, 'ISTP', 'MY', 0, 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
				+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 2002, 2001, 'PT704', 'ACTIVE' from dual");

		jdbcTemplate
				.update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
						+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATE_CODE, STATUS, CMS_REF_ID) "
						+ "select 3001, 2001, year((current timestamp - 5 year)), 'ANNUAL', 80, '01', 'ACTIVE', 3002 from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_MUKIM_CODE (PROPERTY_IDX_MUKIM_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, MUKIM_CODE, STATUS) " + "select 4001, 3001, 'MY04089', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_DISTRICT_CODE (PROPERTY_IDX_DISTRICT_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, DISTRICT_CODE, STATUS) " + "select 4001, 3001, '0107', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_PROPERTY_TYPE (PROPERTY_IDX_PROPERTY_TYPE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, PROPERTY_TYPE_ID, STATUS) " + "select 4001, 3001, 'B08', 'ACTIVE' from dual");

		configure();

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");
		paramMap.put("sectype", "PT");
		paramMap.put("secid", "PT704-Test03");

		List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
		long noOfSec = dao.getNoOfSecurities(paramMap);

		System.out.println("Executed Test Case");
		System.out.println("Number of Securities = " + noOfSec + "\n\n");

		Map previousValuationInfoMap = genericValuationDao.retrievePrevValuationInfo(20070101000000666l, null);
		assertTrue(!previousValuationInfoMap.isEmpty());

		main.processValuationModelList(resultList);

		BigDecimal cmv = (BigDecimal) jdbcTemplate.queryForObject(
				"SELECT cmv from cms_security where cms_collateral_id = 20070101000000666", BigDecimal.class);
		System.out.println("cmv=" + cmv);
		assertEquals(0, new BigDecimal("125000").compareTo(cmv));
		BigDecimal stageCmv = (BigDecimal) jdbcTemplate.queryForObject(
				"SELECT cmv from cms_stage_security where cms_collateral_id = 20030101000000777", BigDecimal.class);
		assertEquals(cmv, stageCmv);

		System.out.println("========== Valuated CMV ============ " + cmv
				+ "========== Stage Valuated CMV ============ " + stageCmv);
		System.out.println("========== Test Case Done ============ ");
	}

	public void testValuatePropertyTakingEarliestPropertyIndex() {
		endTransaction();
		startNewTransaction();
		insertTestData();

		jdbcTemplate
				.update("insert into cms_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, "
						+ "is_security_perfected, security_perfection_date) "
						+ "select 20060101000000666, 'PT704', 'PT704-Test04', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into cms_stage_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, "
						+ "is_security_perfected, security_perfection_date) "
						+ "select 20060101000000777, 'PT704', 'PT704-Test02', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into transaction (transaction_id, reference_id, staging_reference_id, transaction_type) "
						+ "values ('20060917000333222', 20060101000000666, 20060101000000777, 'COL')");

		jdbcTemplate
				.update("insert into cms_property (cms_collateral_id, POSTCODE, STATE, DISTRICT, MUKIM, "
						+ "LAND_AREA, LAND_AREA_UOM, BUILTUP_AREA, BUILTUP_AREA_UOM, "
						+ "SALE_PURCHASE_VALUE, SALE_PURCHASE_DATE, PROPERTY_TYPE, PROPERTY_COMPLETION_STATUS, CATEGORY_OF_LAND_USE ) "
						+ "select cms_collateral_id, '999', '01', '0107', 'MY04089', 3200, 'SQM', 4800, 'SQM', "
						+ "0, TIMESTAMP ('2009-10-20 12:00:00'), 'RES', 'C', 'B08' "
						+ "from cms_security where sci_security_dtl_id = 'PT704-Test04'");

		jdbcTemplate.update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, "
				+ "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) "
				+ "values( 20070202000000999, 20060101000000666, 100000, 90000, 'MYR', "
				+ "(current timestamp - 7 year), (current timestamp - 7 year), 'S' )");

		jdbcTemplate.update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, "
				+ "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) "
				+ "values( 20070202000001999, 20060101000000666, 80000, 70000, 'MYR', "
				+ "(current timestamp - 6 year), (current timestamp - 6 year), 'S' )");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
				+ "VERSION_TIME, STATUS) " + "select 2001, 'ISTP', 'MY', 0, 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
				+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 2002, 2001, 'PT704', 'ACTIVE' from dual");

		jdbcTemplate
				.update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
						+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATE_CODE, STATUS, CMS_REF_ID) "
						+ "select 3001, 2001, year((current timestamp - 8 year)), 'ANNUAL', 80, '01', 'ACTIVE', 3002 from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_MUKIM_CODE (PROPERTY_IDX_MUKIM_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, MUKIM_CODE, STATUS) " + "select 4001, 3001, 'MY04089', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_DISTRICT_CODE (PROPERTY_IDX_DISTRICT_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, DISTRICT_CODE, STATUS) " + "select 4001, 3001, '0107', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_PROPERTY_TYPE (PROPERTY_IDX_PROPERTY_TYPE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, PROPERTY_TYPE_ID, STATUS) " + "select 4001, 3001, 'B08', 'ACTIVE' from dual");

		configure();

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");
		paramMap.put("sectype", "PT");
		paramMap.put("secid", "PT704-Test04");

		List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
		long noOfSec = dao.getNoOfSecurities(paramMap);

		System.out.println("Executed Test Case");
		System.out.println("Number of Securities = " + noOfSec + "\n\n");

		Map previousValuationInfoMap = genericValuationDao.retrievePrevValuationInfo(20060101000000666l, null);
		assertTrue(!previousValuationInfoMap.isEmpty());

		main.processValuationModelList(resultList);
		System.out.println("profileSingleton.getPiProfilesMap()=" + profileSingleton.getPiProfilesMap());

		BigDecimal cmv = (BigDecimal) jdbcTemplate.queryForObject(
				"SELECT cmv from cms_security where cms_collateral_id = 20060101000000666", BigDecimal.class);
		System.out.println("cmv=" + cmv);
		BigDecimal stageCmv = (BigDecimal) jdbcTemplate.queryForObject(
				"SELECT cmv from cms_stage_security where cms_collateral_id = 20060101000000777", BigDecimal.class);
		assertEquals(cmv, stageCmv);

		System.out.println("========== Valuated CMV ============ " + cmv
				+ "========== Stage Valuated CMV ============ " + stageCmv);
		System.out.println("========== Test Case Done ============ ");
	}

	public void testValuatePropertyDontTakeEarliestPropertyIndexIfNoIndexFound() {
		endTransaction();
		startNewTransaction();
		insertTestData();

		jdbcTemplate
				.update("insert into cms_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, "
						+ "is_security_perfected, security_perfection_date) "
						+ "select 20060222000000666, 'PT704', 'PT704-Test05', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into cms_stage_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, "
						+ "is_security_perfected, security_perfection_date) "
						+ "select 20060222000000777, 'PT704', 'PT704-Test05', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into transaction (transaction_id, reference_id, staging_reference_id, transaction_type) "
						+ "values ('20060917000333876', 20060222000000666, 20060222000000777, 'COL')");

		jdbcTemplate
				.update("insert into cms_property (cms_collateral_id, POSTCODE, STATE, DISTRICT, MUKIM, "
						+ "LAND_AREA, LAND_AREA_UOM, BUILTUP_AREA, BUILTUP_AREA_UOM, "
						+ "SALE_PURCHASE_VALUE, SALE_PURCHASE_DATE, PROPERTY_TYPE, PROPERTY_COMPLETION_STATUS, CATEGORY_OF_LAND_USE ) "
						+ "select cms_collateral_id, '999', '01', '0107', 'MY04089', 3200, 'SQM', 4800, 'SQM', "
						+ "500000, TIMESTAMP ('2009-10-20 12:00:00'), 'RES', 'C', 'B08' "
						+ "from cms_security where sci_security_dtl_id = 'PT704-Test05'");

		jdbcTemplate.update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, "
				+ "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) "
				+ "values( 20070202000000999, 20060222000000666, 100000, 90000, 'MYR', "
				+ "(current timestamp - 7 year), (current timestamp - 7 year), 'S' )");

		jdbcTemplate.update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, "
				+ "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) "
				+ "values( 20070202000001999, 20060222000000666, 80000, 70000, 'MYR', "
				+ "(current timestamp - 6 year), (current timestamp - 6 year), 'M' )");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
				+ "VERSION_TIME, STATUS) " + "select 2001, 'ISTP', 'MY', 0, 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
				+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 2002, 2001, 'PT704', 'ACTIVE' from dual");

		jdbcTemplate
				.update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
						+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATE_CODE, STATUS, CMS_REF_ID) "
						+ "select 3001, 2001, year((current timestamp - 8 year)), 'ANNUAL', 80, '01', 'ACTIVE', 3002 from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_MUKIM_CODE (PROPERTY_IDX_MUKIM_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, MUKIM_CODE, STATUS) " + "select 4001, 3001, 'MY04089', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_DISTRICT_CODE (PROPERTY_IDX_DISTRICT_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, DISTRICT_CODE, STATUS) " + "select 4001, 3001, '0107', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_PROPERTY_TYPE (PROPERTY_IDX_PROPERTY_TYPE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, PROPERTY_TYPE_ID, STATUS) " + "select 4001, 3001, 'B08', 'ACTIVE' from dual");

		configure();

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");
		paramMap.put("sectype", "PT");
		paramMap.put("secid", "PT704-Test05");

		List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
		long noOfSec = dao.getNoOfSecurities(paramMap);

		System.out.println("Executed Test Case");
		System.out.println("Number of Securities = " + noOfSec + "\n\n");

		Map previousValuationInfoMap = genericValuationDao.retrievePrevValuationInfo(20060222000000666l, null);
		assertTrue(!previousValuationInfoMap.isEmpty());

		main.processValuationModelList(resultList);

		BigDecimal cmv = (BigDecimal) jdbcTemplate.queryForObject(
				"SELECT cmv from cms_security where cms_collateral_id = 20060222000000666", BigDecimal.class);
		System.out.println("cmv=" + cmv);
		BigDecimal stageCmv = (BigDecimal) jdbcTemplate.queryForObject(
				"SELECT cmv from cms_stage_security where cms_collateral_id = 20060222000000777", BigDecimal.class);
		assertEquals(cmv, stageCmv);

		System.out.println("========== Valuated CMV ============ " + cmv
				+ "========== Stage Valuated CMV ============ " + stageCmv);
		System.out.println("========== Test Case Done ============ ");
	}

	public void testValuatePropertyHavingMoreThanOneMatchedPropertyIndexes() {
		endTransaction();
		startNewTransaction();

		jdbcTemplate
				.update("insert into cms_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, "
						+ "is_security_perfected, security_perfection_date) "
						+ "select 20060222000100666, 'PT704', 'PT704-Test06', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into cms_stage_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, "
						+ "is_security_perfected, security_perfection_date) "
						+ "select 20060222000100777, 'PT704', 'PT704-Test06', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into transaction (transaction_id, reference_id, staging_reference_id, transaction_type) "
						+ "values ('20060917000433876', 20060222000100666, 20060222000100777, 'COL')");

		jdbcTemplate
				.update("insert into cms_property (cms_collateral_id, POSTCODE, STATE, DISTRICT, MUKIM, "
						+ "LAND_AREA, LAND_AREA_UOM, BUILTUP_AREA, BUILTUP_AREA_UOM, "
						+ "SALE_PURCHASE_VALUE, SALE_PURCHASE_DATE, PROPERTY_TYPE, PROPERTY_COMPLETION_STATUS, CATEGORY_OF_LAND_USE ) "
						+ "select cms_collateral_id, '999', '01', '0107', 'MY04089', 3200, 'SQM', 4800, 'SQM', "
						+ "500000, TIMESTAMP ('2005-10-20 12:00:00'), 'RES', 'C', 'B08' "
						+ "from cms_security where sci_security_dtl_id = 'PT704-Test06'");

		jdbcTemplate.update("insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, "
				+ "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) "
				+ "values( 20070202000101999, 20060222000100666, 80000, 70000, 'MYR', "
				+ "(current timestamp - 6 year), (current timestamp - 6 year), 'M' )");
		
		removeAllExistingIndexes();

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
				+ "VERSION_TIME, STATUS) " + "select 2001, 'ID', 'MY', 0, 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
				+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 2002, 2001, 'PT704', 'ACTIVE' from dual");

		jdbcTemplate
				.update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
						+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATE_CODE, STATUS, CMS_REF_ID) "
						+ "select 3001, 2001, year(TIMESTAMP ('2005-10-20 12:00:00')), 'ANNUAL', 80, '01', 'ACTIVE', 3002 from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_MUKIM_CODE (PROPERTY_IDX_MUKIM_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, MUKIM_CODE, STATUS) " + "select 4001, 3001, 'MY04089', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_DISTRICT_CODE (PROPERTY_IDX_DISTRICT_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, DISTRICT_CODE, STATUS) " + "select 4001, 3001, '0107', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_PROPERTY_TYPE (PROPERTY_IDX_PROPERTY_TYPE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, PROPERTY_TYPE_ID, STATUS) " + "select 4001, 3001, 'B08', 'ACTIVE' from dual");

		// another index

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
				+ "VERSION_TIME, STATUS) " + "select 22001, 'IS', 'MY', 0, 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
				+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 22002, 22001, 'PT704', 'ACTIVE' from dual");

		jdbcTemplate
				.update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
						+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATE_CODE, STATUS, CMS_REF_ID) "
						+ "select 23001, 22001, year(TIMESTAMP ('2005-10-20 12:00:00')), 'ANNUAL', 112.3, '01', 'ACTIVE', 23002 from dual");

//		// another index
//
//		jdbcTemplate.update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
//				+ "VERSION_TIME, STATUS) " + "select 32001, 'ITP', 'MY', 0, 'ACTIVE' from dual");
//
//		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
//				+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 32002, 32001, 'PT704', 'ACTIVE' from dual");
//
//		jdbcTemplate
//				.update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
//						+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATUS, CMS_REF_ID) "
//						+ "select 33001, 32001, year(TIMESTAMP ('2005-10-20 12:00:00')), 'ANNUAL', 101.3, 'ACTIVE', 33002 from dual");
//		
//		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_PROPERTY_TYPE (PROPERTY_IDX_PROPERTY_TYPE_ID, "
//				+ "PROPERTY_IDX_ITEM_ID, PROPERTY_TYPE_ID, STATUS) " + "select 34001, 33001, 'B08', 'ACTIVE' from dual");
		
		// for the current index

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
				+ "VERSION_TIME, STATUS) " + "select 42001, 'ITP', 'MY', 0, 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
				+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 42002, 42001, 'PT704', 'ACTIVE' from dual");

		jdbcTemplate
				.update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
						+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATUS, CMS_REF_ID) "
						+ "select 43001, 42001, year(TIMESTAMP ('2008-10-20 12:00:00')), 'ANNUAL', 123.3, 'ACTIVE', 43002 from dual");
		
		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_PROPERTY_TYPE (PROPERTY_IDX_PROPERTY_TYPE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, PROPERTY_TYPE_ID, STATUS) " + "select 44001, 43001, 'B08', 'ACTIVE' from dual");
		

		// another current index

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
				+ "VERSION_TIME, STATUS) " + "select 52001, 'IS', 'MY', 0, 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
				+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 52002, 52001, 'PT704', 'ACTIVE' from dual");

		jdbcTemplate
				.update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
						+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATE_CODE, STATUS, CMS_REF_ID) "
						+ "select 53001, 52001, year(TIMESTAMP ('2008-10-20 12:00:00')), 'ANNUAL', 91.3, '01', 'ACTIVE', 53002 from dual");
		


		configure();

		Map paramMap = new HashMap();
		paramMap.put("country", "MY");
		paramMap.put("sectype", "PT");
		paramMap.put("secid", "PT704-Test06");

		List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
		long noOfSec = dao.getNoOfSecurities(paramMap);

		System.out.println("Executed Test Case");
		System.out.println("Number of Securities = " + noOfSec + "\n\n");
		System.out.println(profileSingleton.getPiProfilesMap());

		Map previousValuationInfoMap = genericValuationDao.retrievePrevValuationInfo(20060222000100666l, null);
		assertTrue(!previousValuationInfoMap.isEmpty());

		main.processValuationModelList(resultList);

		BigDecimal cmv = (BigDecimal) jdbcTemplate.queryForObject(
				"SELECT cmv from cms_security where cms_collateral_id = 20060222000100666", BigDecimal.class);
		System.out.println("cmv=" + cmv);
		BigDecimal stageCmv = (BigDecimal) jdbcTemplate.queryForObject(
				"SELECT cmv from cms_stage_security where cms_collateral_id = 20060222000100777", BigDecimal.class);
		assertEquals(cmv, stageCmv);

		System.out.println("========== Valuated CMV ============ " + cmv
				+ "========== Stage Valuated CMV ============ " + stageCmv);
		System.out.println("========== Test Case Done ============ ");
	}

	private void configure() {
		batchParameterValidatorControl = MockControl.createControl(BatchParameterValidator.class);
		BatchParameterValidator mockBatchParamHandler = (BatchParameterValidator) batchParameterValidatorControl
				.getMock();

		dao = new ValuationMainDAO();
		dao.setJdbcTemplate(jdbcTemplate);

		setupValuationHandler();
		valHandler = new ValuationHandler();
		genericValuationDao = new GenericValuationDAO();
		genericValuationDao.setJdbcTemplate(jdbcTemplate);
		genericValuationDao.setSequenceFormatter(new DateSequencerFormatter());

		valHandler.setValuationDaoMap(valuationDaoMap);
		valHandler.setValuatorMap(valuatorMap);
		valHandler.setGenericValuationDao(genericValuationDao);

		main = new ValuationMain();
		main.setValuationHandler(valHandler);
		main.setValuationMainDao(dao);
		main.setValuationParameterValidator(mockBatchParamHandler);
		main.setTransactionTemplate(new TransactionTemplate(this.transactionManager));
	}

	private void setupValuationHandler() {

		valuationDaoMap = new HashMap();
		valuatorMap = new HashMap();

		PropertyValuationDAO jdbcDao = new PropertyValuationDAO();
		jdbcDao.setJdbcTemplate(jdbcTemplate);
		jdbcDao.setSequenceFormatter(new DateSequencerFormatter());

		profileSingleton = PropertyProfileSingleton.getInstance();
		profileSingleton.setPropertyValuationDao(jdbcDao);
		profileSingleton.init();
		profileSingleton.reloadProfiles();
		profileSingleton.reloadPIProfiles();

		valuationDaoMap.put("PT700", jdbcDao);
		valuationDaoMap.put("PT701", jdbcDao);
		valuationDaoMap.put("PT702", jdbcDao);
		valuationDaoMap.put("PT703", jdbcDao);
		valuationDaoMap.put("PT704", jdbcDao);
		valuationDaoMap.put("PT706", jdbcDao);
		valuationDaoMap.put("PT707", jdbcDao);
		valuationDaoMap.put("PT709", jdbcDao);
		valuationDaoMap.put("PT710", jdbcDao);

		PropertyIndexValuator valuator = new PropertyIndexValuator(true, true);
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
		// ========= PT704: using property index ==========//
		jdbcTemplate
				.update("insert into cms_security "
						+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
						+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
						+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, "
						+ "IS_SECURITY_PERFECTED, SECURITY_PERFECTION_DATE) "
						+ "select 20070102000000445, 'PT704', 'PT704-Test01', 'MY', subtype_name, "
						+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp - 2 years "
						+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		jdbcTemplate
				.update("insert into cms_property (cms_collateral_id, POSTCODE, STATE, DISTRICT, MUKIM, "
						+ "LAND_AREA, LAND_AREA_UOM, BUILTUP_AREA, BUILTUP_AREA_UOM, "
						+ "SALE_PURCHASE_VALUE, SALE_PURCHASE_DATE, PROPERTY_TYPE, PROPERTY_COMPLETION_STATUS, CATEGORY_OF_LAND_USE ) "
						+ "select cms_collateral_id, '999', '01', '0107', 'MY04089', " + "3200, 'SQM', 4800, 'SQM', "
						+ "200000, TIMESTAMP ('2009-10-20 12:00:00'), 'RES', 'C', 'B08' "
						+ "from cms_security where sci_security_dtl_id = 'PT704-Test01'");

		// ========= CMS_PROPERTY_PARAMETERS ==========//
		jdbcTemplate.update("insert into CMS_PROPERTY_PARAMETERS (PARAMETER_ID, OMV_TYPE, VARIATION_OMV, "
				+ "COLLATERAL_SUBTYPE, COUNTRY_CODE, STATE_CODE, "
				+ "DISTRICT_CODE, MUKIM_CODE, POST_CODE, MINIMUM_CURRENT_OMV, "
				+ "LAND_AREA_VALUE_FROM, LAND_AREA_UNIT_FROM, LAND_AREA_VALUE_TO, LAND_AREA_UNIT_TO, "
				+ "BUILDUP_AREA_VALUE_FROM, BUILDUP_AREA_UNIT_FROM, " + "BUILDUP_AREA_VALUE_TO, BUILDUP_AREA_UNIT_TO) "
				+ "select 1000, 'INC', '2', 'PT704', 'MY', '01', " + "'0107', 'MY04089', '999', 1000000, "
				+ "3000, 'SQM', 5000, 'SQM', " + "3000, 'SQM', 5000, 'SQM' " + "from dual");

		// ========= Security Parameter ==========//
		jdbcTemplate.update("update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', "
				+ "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 "
				+ "where SECURITY_SUB_TYPE_ID like 'PT%' and country_iso_code = 'MY'");

		removeAllExistingIndexes();

		// ========= CMS_PROPERTY_IDX p, CMS_PROPERTY_IDX_SEC_SUBTYPE s,
		// CMS_PROPERTY_IDX_ITEM, CMS_PROPERTY_IDX_MUKIM_CODE,
		// CMS_PROPERTY_IDX_PROPERTY_TYPE ==========//
		jdbcTemplate.update("insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
				+ "VERSION_TIME, STATUS) " + "select 1001, 'ISTP', 'MY', 0, 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
				+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 1002, 1001, 'PT704', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
				+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATE_CODE, STATUS, CMS_REF_ID) "
				+ "select 2001, 1001, 2008, 'ANNUAL', 100, '01', 'ACTIVE', 2002 from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_MUKIM_CODE (PROPERTY_IDX_MUKIM_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, MUKIM_CODE, STATUS) " + "select 3001, 2001, 'MY04089', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_DISTRICT_CODE (PROPERTY_IDX_DISTRICT_CODE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, DISTRICT_CODE, STATUS) " + "select 3001, 2001, '0107', 'ACTIVE' from dual");

		jdbcTemplate.update("insert into CMS_PROPERTY_IDX_PROPERTY_TYPE (PROPERTY_IDX_PROPERTY_TYPE_ID, "
				+ "PROPERTY_IDX_ITEM_ID, PROPERTY_TYPE_ID, STATUS) " + "select 3001, 2001, 'B08', 'ACTIVE' from dual");

	}

	private void removeAllExistingIndexes() {
		jdbcTemplate.update("delete from CMS_PROPERTY_IDX");
		jdbcTemplate.update("delete from CMS_PROPERTY_IDX_SEC_SUBTYPE");
		jdbcTemplate.update("delete from CMS_PROPERTY_IDX_ITEM");
		jdbcTemplate.update("delete from CMS_PROPERTY_IDX_MUKIM_CODE");
		jdbcTemplate.update("delete from CMS_PROPERTY_IDX_DISTRICT_CODE");
		jdbcTemplate.update("delete from CMS_PROPERTY_IDX_PROPERTY_TYPE");
	}

	private void insertTestDataValuation() {

		// ========= Expected results: CMV: 100000, FSV: 90000 ==========//
		// ========= PT704: no sale & purchase price, using prev valuation as
		// initial omv ==========//
		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_security "
								+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
								+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
								+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind, "
								+ "IS_SECURITY_PERFECTED, SECURITY_PERFECTION_DATE) "
								+ "select 20070101000000 + next value for collateral_seq, 'PT704', 'PT704-Test01', 'MY', subtype_name, "
								+ "security_type_name, 'PT704', 'PT', 'MYR', 'ACTIVE', 'MYR', '166', 'SIBS', 'Y', 'Y', current timestamp - 2 years "
								+ "from cms_security_sub_type where security_sub_type_id = 'PT704'");

		dao.getJdbcTemplate().update(
				"insert into cms_property (cms_collateral_id, POSTCODE, STATE, DISTRICT, MUKIM, "
						+ "LAND_AREA, LAND_AREA_UOM, BUILTUP_AREA, BUILTUP_AREA_UOM, "
						+ "PROPERTY_TYPE, PROPERTY_COMPLETION_STATUS, CATEGORY_OF_LAND_USE ) "
						+ "select cms_collateral_id, '999', '01', '0107', 'MY04089', " + "3200, 'SQM', 4800, 'SQM', "
						+ "'RES', 'C', 'B08' " + "from cms_security where sci_security_dtl_id = 'PT704-Test01'");

		dao
				.getJdbcTemplate()
				.update(
						"insert into cms_valuation (VALUATION_ID, CMS_COLLATERAL_ID, CMV, FSV, "
								+ "VALUATION_CURRENCY, VALUATION_DATE, UPDATE_DATE, SOURCE_TYPE ) "
								+ "select 20070101000000 + next value for VALUATION_SEQ, cms_collateral_id, 100000, 90000, 'MYR', "
								+ "current timestamp - 1 month, current timestamp - 1 month, 'S' "
								+ "from cms_security where sci_security_dtl_id = 'PT704-Test01' ");

		// ========= CMS_PROPERTY_PARAMETERS ==========//
		dao.getJdbcTemplate().update(
				"insert into CMS_PROPERTY_PARAMETERS (PARAMETER_ID, OMV_TYPE, VARIATION_OMV, "
						+ "COLLATERAL_SUBTYPE, COUNTRY_CODE, STATE_CODE, "
						+ "DISTRICT_CODE, MUKIM_CODE, POST_CODE, MINIMUM_CURRENT_OMV, "
						+ "LAND_AREA_VALUE_FROM, LAND_AREA_UNIT_FROM, LAND_AREA_VALUE_TO, LAND_AREA_UNIT_TO, "
						+ "BUILDUP_AREA_VALUE_FROM, BUILDUP_AREA_UNIT_FROM, "
						+ "BUILDUP_AREA_VALUE_TO, BUILDUP_AREA_UNIT_TO) "
						+ "select 1000, 'INC', '2', 'PT704', 'MY', '01', " + "'0107', 'MY04089', '999', 1000000, "
						+ "3000, 'SQM', 5000, 'SQM', " + "3000, 'SQM', 5000, 'SQM' " + "from dual");

		// ========= Security Parameter ==========//
		dao.getJdbcTemplate().update(
				"update CMS_SECURITY_PARAMETER set VALUATION_FREQUENCY_UNIT = '3', "
						+ "VALUATION_FREQUENCY = 1, THRESHOLD_PERCENT = 10 "
						+ "where SECURITY_SUB_TYPE_ID like 'PT%' and country_iso_code = 'MY'");

		// ========= CMS_PROPERTY_IDX p, CMS_PROPERTY_IDX_SEC_SUBTYPE s,
		// CMS_PROPERTY_IDX_ITEM, CMS_PROPERTY_IDX_MUKIM_CODE,
		// CMS_PROPERTY_IDX_PROPERTY_TYPE ==========//
		dao.getJdbcTemplate().update(
				"insert into CMS_PROPERTY_IDX (PROPERTY_IDX_ID, VAL_DESCR, COUNTRY_CODE, "
						+ "VERSION_TIME, STATUS, CMS_REF_ID) "
						+ "select 1001, 'ISTP', 'MY', 0, 'ACTIVE', 1001 from dual");

		dao.getJdbcTemplate().update(
				"insert into CMS_PROPERTY_IDX_SEC_SUBTYPE (PROPERTY_IDX_SEC_SUBTYPE_ID, PROPERTY_IDX_ID, "
						+ "SECURITY_SUB_TYPE_ID, STATUS) " + "select 1002, 1001, 'PT704', 'ACTIVE' from dual");

		dao.getJdbcTemplate().update(
				"insert into CMS_PROPERTY_IDX_ITEM (PROPERTY_IDX_ITEM_ID, PROPERTY_IDX_ID, "
						+ "IDX_YEAR, IDX_TYPE, IDX_VALUE, STATE_CODE, STATUS, CMS_REF_ID) "
						+ "select 2001, 1001, 2008, 'ANNUAL', 100, '01', 'ACTIVE', 2002 from dual");

		dao.getJdbcTemplate().update(
				"insert into CMS_PROPERTY_IDX_MUKIM_CODE (PROPERTY_IDX_MUKIM_CODE_ID, "
						+ "PROPERTY_IDX_ITEM_ID, MUKIM_CODE, STATUS) "
						+ "select 3001, 2001, 'MY04089', 'ACTIVE' from dual");

		dao.getJdbcTemplate().update(
				"insert into CMS_PROPERTY_IDX_DISTRICT_CODE (PROPERTY_IDX_DISTRICT_CODE_ID, "
						+ "PROPERTY_IDX_ITEM_ID, DISTRICT_CODE, STATUS) "
						+ "select 3001, 2001, '0107', 'ACTIVE' from dual");

		dao.getJdbcTemplate().update(
				"insert into CMS_PROPERTY_IDX_PROPERTY_TYPE (PROPERTY_IDX_PROPERTY_TYPE_ID, "
						+ "PROPERTY_IDX_ITEM_ID, PROPERTY_TYPE_ID, STATUS) "
						+ "select 3001, 2001, 'B08', 'ACTIVE' from dual");

	}

	private void verifyTestData() {
		String query = "SELECT * from CMS_SECURITY WHERE sci_security_dtl_id like 'PT%-Test%'";

		dao.getJdbcTemplate().query(query, new Object[] {}, new ResultSetExtractor() {

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

					assertNull(valuationDate);
					assertNull(nextValDate);
					assertNull(valSourceType);
					assertNull(cmvCurr);
					assertTrue("CMV is Not 0", cmvAmt == 0);
					assertNull(fsvCurr);
					assertTrue("FSV is Not 0", fsvAmt == 0);

				}

				return null;
			}

		});

	}

}

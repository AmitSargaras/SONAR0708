package com.integrosys.cms.app.collateral.bus.valuation;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.AbstractTransactionalSpringContextTests;

import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.collateral.bus.valuation.dao.GoldValuationDAO;
import com.integrosys.cms.app.collateral.bus.valuation.model.GenericValuationModel;
import com.integrosys.cms.app.collateral.bus.valuation.support.GoldFeedProfileSingleton;
import com.integrosys.cms.app.collateral.bus.valuation.support.ValuationFrequency;
import com.integrosys.cms.app.collateral.bus.valuation.valuator.GoldValuator;

/**
 * Created by IntelliJ IDEA. User: Cynthia Date: Sep 19, 2008 Time: 10:59:01 AM
 * To change this template use File | Settings | File Templates.
 */
public class GoldValuationBizImplTest extends AbstractTransactionalSpringContextTests {

	private JdbcTemplate jdbc;

	private HashMap testValueMap = new HashMap();

	private final static String COLLATERAL_ID_KEY = "collateralID";

	private final static String SEC_TYPE_KEY = "secType";

	private final static String SEC_SUBTYPE_KEY = "secSubType";

	private final static String SEC_COUNTRY_KEY = "country";

	private final static String GOLD_GRADE_KEY = "goldGrade";

	private final static String GOLD_UOM_KEY = "goldUOM";

	private final static String CURRENCY_KEY = "currency";

	private final static String GOLD_UNIT_PRICE_KEY = "goldUnitPrice";

	private final static String GOLD_WEIGHT_KEY = "goldWeight";

	private final static String VAL_MARGIN_KEY = "valMargin";

	private final static String VAL_FREQ_KEY = "valFreq";

	private final static String VAL_FREQ_UOM_KEY = "valFreqUOM";

	private final static String VAL_DATE_KEY = "valDate";

	protected String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml" };
	}

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();

		jdbc = new JdbcTemplate((DataSource) getApplicationContext().getBean("ofaPool"));

	}

	public void testGoldValuation() {

		ValuationHandler handler = new ValuationHandler();

		GoldValuationDAO goldValuationDao = new GoldValuationDAO();
		goldValuationDao.setDataSource((DataSource) getApplicationContext().getBean("ofaPool"));
		goldValuationDao.setSequenceFormatter(new DateSequencerFormatter());

		GoldFeedProfileSingleton goldFeedProfileSingleton = GoldFeedProfileSingleton.getInstance();
		goldFeedProfileSingleton.setGoldValuationDao(goldValuationDao);
		goldFeedProfileSingleton.init();

		GoldValuator valuator = new GoldValuator();
		valuator.setGoldFeedProfileSingleton(goldFeedProfileSingleton);

		Map valuationDaoMap = new HashMap();
		valuationDaoMap.put("AB110", goldValuationDao);

		Map valuatorMap = new HashMap();
		valuatorMap.put("AB110", valuator);

		handler.setValuationDaoMap(valuationDaoMap);
		handler.setValuatorMap(valuatorMap);
		handler.setGenericValuationDao(goldValuationDao);

		initTestValue();
		IValuationModel testModel = prepareValuationModelTestData();
		prepGoldFeedTestData();
		goldFeedProfileSingleton.reloadProfiles();
		IValuationModel updatedValuation = handler.performSystemValuation(testModel);
		DefaultLogger.debug(this, ">>>>>>>>>>>>>>>>>>> valuation result = \n" + updatedValuation);

        assertResult(updatedValuation);

    }

	private void initTestValue() {
		Long collateralID = new Long(2005010100000001L);
		String securityType = "Asset Based";
		String secSubType = "AB110";
		String secCountry = "MY";
		String goldGrade = "G18";
		String goldUOM = "1";
		String currency = "MYR";
		double goldUnitPrice = 100.01;
		double goldWeight = 100.500000;

		double valuationMargin = 80.0;
		int valFreq = 1;
		String valFreqUnit = "3";

		Calendar cal = Calendar.getInstance();
		cal.set(2008, 05, 01); // June 01 2008 (month starts from 0)

		testValueMap.put(COLLATERAL_ID_KEY, collateralID);
		testValueMap.put(SEC_TYPE_KEY, securityType);
		testValueMap.put(SEC_SUBTYPE_KEY, secSubType);
		testValueMap.put(SEC_COUNTRY_KEY, secCountry);
		testValueMap.put(GOLD_GRADE_KEY, goldGrade);
		testValueMap.put(GOLD_UOM_KEY, goldUOM);
		testValueMap.put(CURRENCY_KEY, currency);
		testValueMap.put(GOLD_UNIT_PRICE_KEY, new Double(goldUnitPrice));
		testValueMap.put(GOLD_WEIGHT_KEY, new Double(goldWeight));
		testValueMap.put(VAL_MARGIN_KEY, new Double(valuationMargin));
		testValueMap.put(VAL_FREQ_KEY, new Integer(valFreq));
		testValueMap.put(VAL_FREQ_UOM_KEY, valFreqUnit);
		testValueMap.put(VAL_DATE_KEY, cal.getTime());
	}

	private IValuationModel prepareValuationModelTestData() {
		GenericValuationModel valuationModel = new GenericValuationModel();
		valuationModel.setCollateralId(((Long) testValueMap.get(COLLATERAL_ID_KEY)).longValue());
		valuationModel.setSecType((String) testValueMap.get(SEC_TYPE_KEY));
		valuationModel.setSecSubtype((String) testValueMap.get(SEC_SUBTYPE_KEY));
		valuationModel.setSecurityCountry((String) testValueMap.get(SEC_COUNTRY_KEY));
		valuationModel.setSecCurrency((String) testValueMap.get(CURRENCY_KEY));
		valuationModel.setValuationMargin(((Double) testValueMap.get(VAL_MARGIN_KEY)).doubleValue());
		ValuationFrequency freq = new ValuationFrequency();
		freq.setFreq(((Integer) testValueMap.get(VAL_FREQ_KEY)).intValue());
		freq.setFreqUnit((String) testValueMap.get(VAL_FREQ_UOM_KEY)); // month
		valuationModel.setValuationFrequency(freq);
		valuationModel.setPrevValuationDate((Date) testValueMap.get(VAL_DATE_KEY));
		valuationModel.setValuationDate((Date) testValueMap.get(VAL_DATE_KEY));
		return valuationModel;
	}

	private void prepGoldFeedTestData() {

		// insert gold feed data
		String goldFeedSql = "INSERT INTO CMS_GOLD_FEED(GOLD_FEED_ID, CMS_VERSION_TIME, GOLD_GRADE_CODE_NUM, GOLD_UOM_CODE_NUM, "
				+ "CURRENCY, PRICE, LAST_UPDATED_DATE, FEED_GROUP_ID, CMS_REF_ID) "
				+ "VALUES(1, 1, ?, ?, ?, ?, current timestamp, 1, 1)";

		ArrayList feedSqlParamList = new ArrayList();
		feedSqlParamList.add(testValueMap.get(GOLD_GRADE_KEY)); // G18
		feedSqlParamList.add(testValueMap.get(GOLD_UOM_KEY)); // 1
		feedSqlParamList.add(testValueMap.get(CURRENCY_KEY)); // MYR
		feedSqlParamList.add(testValueMap.get(GOLD_UNIT_PRICE_KEY)); // 100.01
		jdbc.update(goldFeedSql, feedSqlParamList.toArray(new Object[0]));

		// insert security - gold data
		String secSql = "insert into cms_security "
				+ "(cms_collateral_id, security_sub_type_id, sci_security_dtl_id, security_location, subtype_name, "
				+ "type_name, sci_security_subtype_value, sci_security_type_value, sci_security_currency, status, "
				+ "sci_orig_security_currency, security_organisation, source_id, is_migrated_ind) " + "select "
				+ testValueMap.get(COLLATERAL_ID_KEY) + ", 'AB110', 'AB110-T0001', 'MY', subtype_name, "
				+ "security_type_name, 'AB110', 'AB', 'MYR', 'ACTIVE', 'MYR', '029', 'ARBS', 'Y' "
				+ "from cms_security_sub_type where security_sub_type_id = 'AB110' ";

		ArrayList secSqlParamList = new ArrayList();
		secSqlParamList.add(testValueMap.get(COLLATERAL_ID_KEY));
		// jdbc.update(secSql, secSqlParamList.toArray(new Object[0]));
		jdbc.update(secSql);

		// insert into cms_asset table
		String assetSql = "insert into cms_asset (cms_collateral_id) values (?)";
		jdbc.update(assetSql, secSqlParamList.toArray(new Object[0]));

		// insert gold details data
		String goldSql = "INSERT INTO CMS_ASSET_GOLD(CMS_COLLATERAL_ID, GOLD_GRADE, GOLD_WEIGHT, GOLD_UOM) "
				+ "VALUES(?, ?, ?, ?)";

		ArrayList goldSqlParamList = new ArrayList();
		goldSqlParamList.add(testValueMap.get(COLLATERAL_ID_KEY));
		goldSqlParamList.add(testValueMap.get(GOLD_GRADE_KEY)); // G18
		goldSqlParamList.add(testValueMap.get(GOLD_WEIGHT_KEY)); // 100.0000
		goldSqlParamList.add(testValueMap.get(GOLD_UOM_KEY)); // 1
		jdbc.update(goldSql, goldSqlParamList.toArray(new Object[0]));
	}

	private void assertResult(IValuationModel resultData) {

		// assert results
		assertNotNull(resultData);

		// ignore checks on UOM and currency must be the same - already setup to
		// be the same
		double correctOMV = ((Double) testValueMap.get(GOLD_WEIGHT_KEY)).doubleValue()
				* ((Double) testValueMap.get(GOLD_UNIT_PRICE_KEY)).doubleValue();

		double correctFSV = correctOMV * ((Double) testValueMap.get(VAL_MARGIN_KEY)).doubleValue() / 100;

		DefaultLogger.debug(this, "Expected OMV = " + correctOMV);
		DefaultLogger.debug(this, "Calculated OMV = " + resultData.getValOMV().getAmount());

		DefaultLogger.debug(this, "Expected FSV = " + correctFSV);
		DefaultLogger.debug(this, "Calculated FSV = " + resultData.getValFSV().getAmount());

		Map secResultMap = jdbc.queryForMap("select CMV, FSV from cms_security where cms_collateral_id = "
				+ testValueMap.get(COLLATERAL_ID_KEY));

		Iterator it = secResultMap.values().iterator();
		while (it.hasNext()) {
			DefaultLogger.debug(this, "cmv/fsv = " + it.next());
		}

        assertEquals("valuation omv = ", resultData.getValOMV().getAmount(), correctOMV, 2);
        assertEquals("valuation fsv = ", resultData.getValFSV().getAmount(),correctFSV, 2);

        
    }

}

package com.integrosys.cms.batch.mimb.collateral;

import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class HibernateMIMBCollateralTest extends CustomHibernateTestCase {

	private HibernateTemplate hibernateTemplate;

	private JdbcTemplate jdbcTemplate;

	public void setUp() {
		super.setUp();

		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}

	protected String[] getMappingResources() {
		return new String[] { "Batch-Feed-MIMB.hbm.xml" };
	}

	public void testCashFile() {
		Date todayDate = new Date();

		ICash cash = new OBCash();

		cash.setAaNo("qq");
		cash.setBranchDescription("ww");
		cash.setBranchName("name");
		cash.setCmsSecurityCurrency("ee");
		cash.setDepositAmount(Double.valueOf("100"));
		cash.setDepositCurrency("rr");
		cash.setDepositOrSourceReferenceNumber("tt");
		cash.setExchangeControlApprovalObtained("yy");
		cash.setLegalEnforceability("q");
		cash.setLegalEnforceabilityDate(todayDate);
		cash.setOriginatingSecurityCurrency("dd");
		cash.setRecordType("ff");
		cash.setSecurityCustodianType("aa");
		cash.setSecurityCustodianValue("ss");
		cash.setSecurityLocation("cc");
		cash.setSecurityPerfectionDate(todayDate);
		cash.setSecurityPledgorID("gg");
		cash.setSecurityPledgorName("vv");
		cash.setSecurityPledgorRelationship("zz");
		cash.setSecuritySubType("kk");
		cash.setSecurityType("bb");
		cash.setSourceLimitID("mm");
		cash.setSourceSecurityID("nn");

		Long id = (Long) hibernateTemplate.save("actualOBCash", cash);
		assertNotNull(id);

		int count = jdbcTemplate.queryForInt("select count(*) from SI_TEMP_MIMB_CO004");
		assertEquals(1, count);

		ICash storedcash = (OBCash) hibernateTemplate.get("actualOBCash", id);

		assertEquals("qq", storedcash.getAaNo());
		assertEquals("ww", storedcash.getBranchDescription());
		assertEquals("name", storedcash.getBranchName());
		assertEquals("ee", storedcash.getCmsSecurityCurrency());
		assertEquals(Double.valueOf("100"), storedcash.getDepositAmount());
		assertEquals("rr", storedcash.getDepositCurrency());
		assertEquals("tt", storedcash.getDepositOrSourceReferenceNumber());
		assertEquals("yy", storedcash.getExchangeControlApprovalObtained());
		assertEquals("q", storedcash.getLegalEnforceability());
		assertEquals(todayDate, storedcash.getLegalEnforceabilityDate());
		assertEquals("dd", storedcash.getOriginatingSecurityCurrency());
		assertEquals("ff", storedcash.getRecordType());
		assertEquals("aa", storedcash.getSecurityCustodianType());
		assertEquals("ss", storedcash.getSecurityCustodianValue());
		assertEquals("cc", storedcash.getSecurityLocation());
		assertEquals(todayDate, storedcash.getSecurityPerfectionDate());
		assertEquals("gg", storedcash.getSecurityPledgorID());
		assertEquals("vv", storedcash.getSecurityPledgorName());
		assertEquals("zz", storedcash.getSecurityPledgorRelationship());
		assertEquals("kk", storedcash.getSecuritySubType());
		assertEquals("bb", storedcash.getSecurityType());
		assertEquals("mm", storedcash.getSourceLimitID());
		assertEquals("nn", storedcash.getSourceSecurityID());

	}

	public void testCollateralMarketableFile() {
		Date todayDate = new Date();

		ICollateralMarketable collateralMarketable = new OBCollateralMarketable();

		collateralMarketable.setAaNo("q");
		collateralMarketable.setAmountOfCharge(Double.valueOf("100"));
		collateralMarketable.setBaselCompliantUnitTrustCollateral("w");
		collateralMarketable.setBranchDescription("e");
		collateralMarketable.setBranchName("r");
		collateralMarketable.setCdsNumber("s");
		collateralMarketable.setChargeType("x");
		collateralMarketable.setCmsSecurityCurrency("aa");
		collateralMarketable.setCountryOfStockExchange("bb");
		collateralMarketable.setDateLegallyCharged(todayDate);
		collateralMarketable.setEquityType("nn");
		collateralMarketable.setExchangeControlApprovalObtained("tt");
		collateralMarketable.setLegalEnforceability("hh");
		collateralMarketable.setLegalEnforceabilityDate(todayDate);
		collateralMarketable.setNatureOfCharge("l");
		collateralMarketable.setNomineeName("k");
		collateralMarketable.setNumberOfUnits(12);
		collateralMarketable.setOriginatingSecurityCurrency("dd");
		collateralMarketable.setRecognizeExchange("mm");
		collateralMarketable.setRecordType("kk");
		collateralMarketable.setRegisteredOwner("vv");
		collateralMarketable.setSecurityCustodianType("oo");
		collateralMarketable.setSecurityCustodianValue("ll");
		collateralMarketable.setSecurityLocation("jj");
		collateralMarketable.setSecurityMaturityDate(todayDate);
		collateralMarketable.setSecurityPerfectionDate(todayDate);
		collateralMarketable.setSecurityPledgorID("as");
		collateralMarketable.setSecurityPledgorName("mk");
		collateralMarketable.setSecurityPledgorRelationship("zx");
		collateralMarketable.setSecurityType("er");
		collateralMarketable.setSourceLimitID("qw");
		collateralMarketable.setSourceSecurityID("mn");
		collateralMarketable.setStockCode("af");
		collateralMarketable.setStockExchange("ht");
		collateralMarketable.setUnitPrice(Double.valueOf("200"));

		Long id = (Long) hibernateTemplate.save("actualOBCollateralMarketable", collateralMarketable);
		assertNotNull(id);

		int count = jdbcTemplate.queryForInt("select count(*) from SI_TEMP_MIMB_CO003");
		assertEquals(1, count);

		ICollateralMarketable storedCollateralMarketable = (OBCollateralMarketable) hibernateTemplate.get(
				"actualOBCollateralMarketable", id);

		assertEquals("q", storedCollateralMarketable.getAaNo());
		assertEquals((Double.valueOf("100")), storedCollateralMarketable.getAmountOfCharge());
		assertEquals("w", storedCollateralMarketable.getBaselCompliantUnitTrustCollateral());
		assertEquals("e", storedCollateralMarketable.getBranchDescription());
		assertEquals("r", storedCollateralMarketable.getBranchName());
		assertEquals("s", storedCollateralMarketable.getCdsNumber());
		assertEquals("x", storedCollateralMarketable.getChargeType());
		assertEquals("aa", storedCollateralMarketable.getCmsSecurityCurrency());
		assertEquals("bb", storedCollateralMarketable.getCountryOfStockExchange());
		assertEquals(todayDate, storedCollateralMarketable.getDateLegallyCharged());
		assertEquals("nn", storedCollateralMarketable.getEquityType());
		assertEquals("tt", storedCollateralMarketable.getExchangeControlApprovalObtained());
		assertEquals("hh", storedCollateralMarketable.getLegalEnforceability());
		assertEquals(todayDate, storedCollateralMarketable.getLegalEnforceabilityDate());
		assertEquals("l", storedCollateralMarketable.getNatureOfCharge());
		assertEquals("k", storedCollateralMarketable.getNomineeName());
		assertEquals(12, storedCollateralMarketable.getNumberOfUnits());
		assertEquals("dd", storedCollateralMarketable.getOriginatingSecurityCurrency());
		assertEquals("mm", storedCollateralMarketable.getRecognizeExchange());
		assertEquals("kk", storedCollateralMarketable.getRecordType());
		assertEquals("vv", storedCollateralMarketable.getRegisteredOwner());
		assertEquals("oo", storedCollateralMarketable.getSecurityCustodianType());
		assertEquals("ll", storedCollateralMarketable.getSecurityCustodianValue());
		assertEquals("jj", storedCollateralMarketable.getSecurityLocation());
		assertEquals(todayDate, storedCollateralMarketable.getSecurityMaturityDate());
		assertEquals(todayDate, storedCollateralMarketable.getSecurityPerfectionDate());
		assertEquals("as", storedCollateralMarketable.getSecurityPledgorID());
		assertEquals("mk", storedCollateralMarketable.getSecurityPledgorName());
		assertEquals("zx", storedCollateralMarketable.getSecurityPledgorRelationship());
		assertEquals("er", storedCollateralMarketable.getSecurityType());
		assertEquals("qw", storedCollateralMarketable.getSourceLimitID());
		assertEquals("mn", storedCollateralMarketable.getSourceSecurityID());
		assertEquals("af", storedCollateralMarketable.getStockCode());
		assertEquals("ht", storedCollateralMarketable.getStockExchange());
		assertEquals(Double.valueOf("200"), storedCollateralMarketable.getUnitPrice());

	}
}

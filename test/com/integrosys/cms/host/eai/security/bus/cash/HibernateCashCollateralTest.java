package com.integrosys.cms.host.eai.security.bus.cash;

import org.springframework.jdbc.core.JdbcTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernateCashCollateralTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-Cash.hbm.xml" };
	}

	public void testStoreCashCollateral() {
		CashSecurity cash = new CashSecurity();
		cash.setCMSSecurityId(20080820000000001l);
		cash.setHoldingPeriod(new Double(5));

		StandardCode holdingPeriodUnit = new StandardCode();
		holdingPeriodUnit.setStandardCodeNumber("HOLDING_PERIOD_UNIT");
		holdingPeriodUnit.setStandardCodeValue("Y");

		cash.setHoldingPeriodUnit(holdingPeriodUnit);

		Long id = (Long) getHibernateTemplate().save(cash);
		assertNotNull(id);

		CashSecurity storedCash = (CashSecurity) getHibernateTemplate().get(CashSecurity.class, id);
		assertNotNull(storedCash);
		assertEquals(new Long(20080820000000001l), new Long(storedCash.getCMSSecurityId()));
		assertEquals("Y", storedCash.getHoldingPeriodUnit().getStandardCodeValue());
	}

	public void testStoreStageCashCollateral() {
		StageCashSecurity cash = new StageCashSecurity();
		cash.setCMSSecurityId(20080820000000002l);
		cash.setHoldingPeriod(new Double(5));

		StandardCode holdingPeriodUnit = new StandardCode();
		holdingPeriodUnit.setStandardCodeNumber("HOLDING_PERIOD_UNIT");
		holdingPeriodUnit.setStandardCodeValue("Y");

		cash.setHoldingPeriodUnit(holdingPeriodUnit);

		Long id = (Long) getHibernateTemplate().save(cash);
		assertNotNull(id);

		StageCashSecurity storedCash = (StageCashSecurity) getHibernateTemplate().get(StageCashSecurity.class, id);
		assertNotNull(storedCash);
		assertEquals(20080820000000002l, storedCash.getCMSSecurityId(), 0);

		Object storedCashObj = getHibernateTemplate().get(CashSecurity.class, id);
		assertNull(storedCashObj);
	}

	public void testStoreCashDepositCollateral() {
		CashSecurity cash = new CashSecurity();
		cash.setCMSSecurityId(200808200000000003l);
		cash.setHoldingPeriod(new Double(5));

		StandardCode holdingPeriodUnit = new StandardCode();
		holdingPeriodUnit.setStandardCodeNumber("HOLDING_PERIOD_UNIT");
		holdingPeriodUnit.setStandardCodeValue("Y");

		cash.setHoldingPeriodUnit(holdingPeriodUnit);

		Long id = (Long) getHibernateTemplate().save(cash);
		assertNotNull(id);

		CashDeposit deposit = new CashDeposit();
		deposit.setCollateralId(id.longValue());
		deposit.setAmount(new Double(2000000d));
		deposit.setAmountCurrency("SGD");
		deposit.setReferenceNo("OCBC-123456789");

		Long depositId = (Long) getHibernateTemplate().save(deposit);
		assertNotNull(depositId);

		CashDeposit storedDeposit = (CashDeposit) getHibernateTemplate().get(CashDeposit.class, depositId);
		assertNotNull(storedDeposit);
		assertEquals("OCBC-123456789", storedDeposit.getReferenceNo());

		JdbcTemplate jdbc = new JdbcTemplate(getDataSource());
		int count = jdbc.queryForInt("select count(*) from cms_cash_deposit where deposit_receipt_number = ?",
				new Object[] { "OCBC-123456789" });
		assertEquals(1, count);
	}

}

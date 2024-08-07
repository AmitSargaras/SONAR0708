package com.integrosys.cms.host.eai.security.bus.insurance;

import java.util.Date;

import org.apache.commons.lang.time.DateUtils;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernateInsuranceCollateralTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-Insurance.hbm.xml" };
	}

	public void testStoreInsuranceCollateral() {
		InsuranceSecurity insurance = new InsuranceSecurity();
		insurance.setCMSSecurityId(20080820000000001l);
		insurance.setJDOExpiryDate(DateUtils.addYears(new Date(), 10));

		StandardCode insrType = new StandardCode();
		insrType.setStandardCodeValue("LIFE");

		insurance.setInsuranceType(insrType);
		//insurance.setInsuranceName("AIA");
		insurance.setPolicyNo("AIA-LIFE-123456789");
		insurance.setJDOEffectiveDate(DateUtils.addYears(new Date(), -1));

		Long id = (Long) getHibernateTemplate().save(insurance);
		assertEquals(new Long(20080820000000001l), id);

		InsuranceSecurity storedInsurance = (InsuranceSecurity) getHibernateTemplate().get(InsuranceSecurity.class, id);

		assertEquals(insurance.getJDOExpiryDate(), storedInsurance.getJDOExpiryDate());
		assertEquals("AIA", storedInsurance.getInsuranceName());
		assertEquals("AIA-LIFE-123456789", storedInsurance.getPolicyNo());
	}

	public void testStoreStageInsuranceCreditDefaultSwapCollateral() {
		StageInsuranceSecurity insurance = new StageInsuranceSecurity();
		insurance.setCMSSecurityId(20080820000000002l);
		insurance.setJDOExpiryDate(DateUtils.addYears(new Date(), 10));

		StandardCode insrType = new StandardCode();
		insrType.setStandardCodeValue("LIFE");

		insurance.setInsuranceType(insrType);
		//insurance.setInsuranceName("AIA");
		insurance.setPolicyNo("AIA-LIFE-123456789");
		insurance.setJDOEffectiveDate(DateUtils.addYears(new Date(), -1));

		Long id = (Long) getHibernateTemplate().save(insurance);
		assertEquals(new Long(20080820000000002l), id);

		StageCreditDefaultSwapsDetail cds = new StageCreditDefaultSwapsDetail();
		cds.setCollateralId(id.longValue());
		cds.setJDOCDSMaturityDate(insurance.getJDOExpiryDate());
		cds.setCDSReference("AIA-LIFE-CDS-12345");
		cds.setIssuer("NTUC");

		Long cdsId = (Long) getHibernateTemplate().save(cds);
		assertNotNull(cds);

		StageCreditDefaultSwapsDetail storedCds = (StageCreditDefaultSwapsDetail) getHibernateTemplate().get(
				CreditDefaultSwapsDetail.class, cdsId);
		assertNull(storedCds);
	}
}

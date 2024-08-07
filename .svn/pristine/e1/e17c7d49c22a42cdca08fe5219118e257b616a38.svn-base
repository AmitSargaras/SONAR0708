package com.integrosys.cms.host.eai.security.bus;

import java.util.Date;

import org.apache.commons.lang.time.DateUtils;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernateCollateralTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral.hbm.xml" };
	}

	public void testStorePureCollateral() {
		ApprovedSecurity col = new ApprovedSecurity();
		col.setLOSSecurityId("AB100-00001");
		col.setCurrency("SGD");
		col.setFsv(new Double(1000000d));
		col.setForcedSaleValue(new Double(1000000d));

		StandardCode subtype = new StandardCode();
		subtype.setStandardCodeValue("AB100");
		subtype.setStandardCodeDescription("Asset Based - General Charge");

		StandardCode type = new StandardCode();
		type.setStandardCodeValue("AB");
		type.setStandardCodeDescription("Asset Based");

		col.setSecuritySubType(subtype);
		col.setSecurityType(type);

		col.setSourceId("RLOS");

		SecurityLocation location = new SecurityLocation();
		location.setLocationCountry("SG");
		location.setLocationOrganisation("TAMP");

		col.setSecurityLocation(location);

		Long id = (Long) getHibernateTemplate().save(col);
		assertNotNull(id);

		ApprovedSecurity storedCol = (ApprovedSecurity) getHibernateTemplate().get(ApprovedSecurity.class, id);
		assertNotNull(storedCol);
		assertEquals(subtype, storedCol.getSecuritySubType());
		assertEquals(type, storedCol.getSecurityType());
		assertEquals("RLOS", storedCol.getSourceId());
	}

	public void testStorePledgorAndPledgorMap() {
		Pledgor pledgor = new Pledgor();
		pledgor.setPledgorId("CUST-12345");
		pledgor.setPledgorRelTypeNumber("15");
		pledgor.setPledgorRelTypeValue("1st Party");
		pledgor.setIncorporatedCountry("SG");

		StandardCode idType = new StandardCode();
		idType.setStandardCodeNumber("ID_TYPE");
		idType.setStandardCodeValue("IC");

		pledgor.setIdType(idType);
		pledgor.setIncorporationNumber("S123456789");

		Long pledgorId = (Long) getHibernateTemplate().save(pledgor);
		assertNotNull(pledgorId);

		SecurityPledgorMap map = new SecurityPledgorMap();
		map.setCMSSecurityId(new Long(20080820000000001l));
		map.setCMSPledgorId(pledgorId);
		map.setPledgorId(new Long(12345l));
		map.setSecurityId("AB102-00001");

		Long mapId = (Long) getHibernateTemplate().save(map);
		assertNotNull(mapId);
	}

	public void testStoreStageChargeDetailAndChargeMap() {
		StageSecurityCharge charge = new StageSecurityCharge();
		charge.setCMSSecurityId(20080820000000001l);
		charge.setChargeAmount(new Double(2000000d));
		charge.setChargeType("GENERAL");
		charge.setJDOLegallyChargedDate(DateUtils.addMonths(new Date(), -2));

		Long chargeDetailId = (Long) getHibernateTemplate().save(charge);
		assertNotNull(chargeDetailId);
	}

	public void testStoreInsurancePolicy() {
		SecurityInsurancePolicy insr = new SecurityInsurancePolicy();
		insr.setCMSSecurityId(20080820000000001l);
		insr.setInsurableAmount(new Double(2000000d));
		insr.setInsurancePolicyCurrency("HKD");
		insr.setInsuredAgainst("HOUSING IN VANCI AREA");
		insr.setJDOEffectiveDate(DateUtils.addMonths(new Date(), -5));
		insr.setPolicyNumber("HOUSE-FIRE-000001");

		StandardCode insuranceType = new StandardCode();
		// insuranceType.setStandardCodeNumber("INSR_TYPE");
		insuranceType.setStandardCodeValue("FIRE");

		insr.setInsuranceType(insuranceType);

		Long insrId = (Long) getHibernateTemplate().save(insr);
		assertNotNull(insrId);

		SecurityInsurancePolicy storedInsr = (SecurityInsurancePolicy) getHibernateTemplate().get(
				SecurityInsurancePolicy.class, insrId);
		assertNotNull(storedInsr);
		assertEquals(insuranceType, storedInsr.getInsuranceType());
	}

	public void testStoreStageValuation() {
		StageSecurityValuation valuation = new StageSecurityValuation();
		valuation.setCMSSecurityId(20080820000000001l);
		valuation.setCMV(new Double(2000000d));
		valuation.setFSV(new Double(1500000d));
		valuation.setJDOValuationDate(DateUtils.addDays(new Date(), -1));
		valuation.setSourceType("S");
		valuation.setSourceId("RLOS");

		Long valuationId = (Long) getHibernateTemplate().save(valuation);
		assertNotNull(valuationId);

		valuation = (StageSecurityValuation) getHibernateTemplate().get(StageSecurityValuation.class, valuationId);
		assertEquals("S", valuation.getSourceType());
		assertEquals("RLOS", valuation.getSourceId());
	}
}

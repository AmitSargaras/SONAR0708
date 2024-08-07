package com.integrosys.cms.app.limit.bus;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.jdbc.core.JdbcTemplate;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.businfra.currency.CurrencyCode;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.common.bus.OBBookingLocation;
import com.integrosys.cms.app.customer.bus.OBCMSLegalEntity;

public class HibernateFacilityTest extends CustomHibernateTestCase {

	JdbcTemplate jdbc;

	protected String[] getMappingResources() {
		return new String[] { "Facility.hbm.xml", "Limit.hbm.xml" };
	}

	public void setUp() {
		super.setUp();

		jdbc = new JdbcTemplate(getDataSource());

		OBLimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setAAType("HP");
		limitProfile.setBCAReference("RLOS-HP-0001");
		limitProfile.setApprovalDate(new Date());
		limitProfile.setActualSecurityCoverage(99.7d);
		limitProfile.setRenewalInd(true);
		limitProfile.setOriginatingLocation(new OBBookingLocation("SG", "TAMP"));
		limitProfile.setCustomerID(12345l);

		Long id = (Long) getHibernateTemplate().save("actualLimitProfile", limitProfile);
		assertNotNull(id);

		OBLimitProfile storedLimitProfile = (OBLimitProfile) getHibernateTemplate().get("actualLimitProfile", id);
		assertEquals(limitProfile.getOriginatingLocation().getCountryCode(), storedLimitProfile
				.getOriginatingLocation().getCountryCode());
		assertEquals("TAMP", storedLimitProfile.getOriginatingLocation().getOrganisationCode());
		assertTrue(storedLimitProfile.getRenewalInd());
		assertEquals(limitProfile.getApprovalDate(), storedLimitProfile.getApprovalDate());

		Set limitSet = new HashSet();

		OBLimit limit = new OBLimit();
		limit.setLimitRef("LMT-1100221");
		limit.setSourceId("SIBS");
		limit.setApprovedLimitAmount(new Amount(10000, "MYR"));
		limit.setProductDesc("Study Loan");

		limitSet.add(limit);

		limit = new OBLimit();
		limit.setLimitRef("LMT-1100222");
		limit.setSourceId("SIBS");
		limit.setApprovedLimitAmount(new Amount(10000, "MYR"));
		limit.setProductDesc("Daily Expense Loan");

		limitSet.add(limit);
		storedLimitProfile.setLimitsSet(limitSet);

		getHibernateTemplate().update("actualLimitProfile", storedLimitProfile);
	}

	protected OBLimitProfile getDefaultStoredLimitProfile() {
		Map parameters = new HashMap();
		parameters.put("BCAReference", "RLOS-HP-0001");
		OBLimitProfile storedLimitProfile = (OBLimitProfile) getHibernateTemplate().findByCriteria(
				DetachedCriteria.forEntityName("actualLimitProfile").add(Restrictions.allEq(parameters))).get(0);

		return storedLimitProfile;
	}

	protected OBFacilityMaster createDefaultFacilityMaster() {
		Date todayDate = new Date();

		OBLimitProfile storedLimitProfile = getDefaultStoredLimitProfile();

		OBFacilityMaster facMaster = new OBFacilityMaster();
		facMaster.setLimit(getLimitByLimitRef(storedLimitProfile.getLimits(), "LMT-1100222"));
		facMaster.setAllowIncentive(Boolean.TRUE);
		facMaster.setApplicationSourceCategoryCode("FAC_APPL_SOURCE");
		facMaster.setApplicationSourceEntryCode("HQ");
		facMaster.setAvailPeriodInDays(new Integer(5));
		facMaster.setCgcBnmApprovedDate(DateUtils.addMonths(todayDate, -10));
		facMaster.setDepartmentCodeCategoryCode("FAC_DEPARTMENT");
		facMaster.setDepartmentCodeEntryCode("P_LOAN");
		facMaster.setEffectiveCostOfFund(Boolean.FALSE);
		facMaster.setFacilityAvailDate(DateUtils.addDays(todayDate, 14));
		facMaster.setIntInSuspense(new BigDecimal(10.32));
		facMaster.setRevolvingIndicator("N");
		facMaster.setSolicitorName("YB SHIN KAI");

		Long facMasterId = (Long) getHibernateTemplate().save("actualFacilityMaster", facMaster);

		OBFacilityMaster storedFac = (OBFacilityMaster) getHibernateTemplate().get("actualFacilityMaster", facMasterId);

		return storedFac;
	}

	public void testCreateFacilityMasterOnly() {
		OBFacilityMaster storedFac = createDefaultFacilityMaster();
		OBLimitProfile storedLimitProfile = getDefaultStoredLimitProfile();

		assertEquals("HQ", storedFac.getApplicationSourceEntryCode());
		assertEquals("P_LOAN", storedFac.getDepartmentCodeEntryCode());
		assertEquals(new Integer(5), storedFac.getAvailPeriodInDays());

		int count = jdbc.queryForInt(
				"SELECT COUNT(*) FROM CMS_FACILITY_MASTER WHERE id = ? and cms_lsp_appr_lmts_id = ?", new Object[] {
						new Long(storedFac.getId()),
						new Long(getLimitByLimitRef(storedLimitProfile.getLimits(), "LMT-1100222").getLimitID()) });
		assertEquals(1, count);

	}

	public void testCreateFacilityMasterWithFacGeneral() {
		Date todayDate = new Date();

		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		OBFacilityGeneral fac = new OBFacilityGeneral();
		fac.setApplicationDate(DateUtils.addMonths(todayDate, -2));
		fac.setApprovedDate(DateUtils.addDays(fac.getApplicationDate(), 5));
		fac.setCarCodeFlag(Boolean.TRUE);
		fac.setCurrencyCode("MYR");
		fac.setLimitStatusCategoryCode("LIMIT_STATUS");
		fac.setLimitStatusEntryCode("CUSTOMER_ACCEPTED");
		fac.setFinancedAmount(new Amount(10000, "MYR"));
		fac.setLoanPurposeCategoryCode("LOAN_PURPOSE");
		fac.setLoanPurposeEntryCode("DAILY_EXPENSE");
		fac.setOfferAcceptedDate(DateUtils.addDays(fac.getApplicationDate(), 10));
		fac.setOfferDate(DateUtils.addDays(fac.getApplicationDate(), 8));
		fac.setOfficerCategoryCode("OFFICER");
		fac.setOfficerEntryCode("CLK");
		fac.setOriginalAmount(new Amount(20000, "MYR"));
		fac.setOustandingBalanceAmount(new Amount(600, "MYR"));
		fac.setTerm(new Integer(2));
		fac.setTermCodeCategoryCode("FAC_TERM");
		fac.setTermCodeEntryCode("M");

		storedFac.setFacilityGeneral(fac);
		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().load("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityGeneral());

		OBFacilityGeneral storedFacGen = (OBFacilityGeneral) storedFac.getFacilityGeneral();
		assertEquals(10000, storedFacGen.getFinancedAmount().getAmount(), 0);
		assertEquals("MYR", storedFacGen.getCurrencyCode());
		assertEquals("DAILY_EXPENSE", storedFacGen.getLoanPurposeEntryCode());
		assertEquals("CLK", storedFacGen.getOfficerEntryCode());
		assertEquals("M", storedFacGen.getTermCodeEntryCode());

	}

	public void testCreateFacilityMasterWithFacInterest() {
		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		OBFacilityInterest facInterest = new OBFacilityInterest();
		facInterest.setInterestRate(new Double(2.5));
		facInterest.setInterestRateTypeCategoryCode("INT_RATE_TYPE");
		facInterest.setInterestRateTypeEntryCode("FLAT");
		facInterest.setPrimeReviewTerm(new Integer(0));
		facInterest.setSpread(new Double(0.002));
		facInterest.setSpreadSign(new Character('+'));

		storedFac.setFacilityInterest(facInterest);

		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().load("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityInterest());

		OBFacilityInterest storedFacInt = (OBFacilityInterest) storedFac.getFacilityInterest();
		assertEquals(new Double(2.5), storedFacInt.getInterestRate());
		assertEquals("FLAT", storedFacInt.getInterestRateTypeEntryCode());
		assertEquals(new Character('+'), storedFacInt.getSpreadSign());

	}

	public void testCreateFacilityMasterWithFacBnm() {
		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		OBFacilityBnmCodes facBnm = new OBFacilityBnmCodes();
		facBnm.setBumiOrNrccCodeCategoryCode("BUMI_NRCC");
		facBnm.setBumiOrNrccCodeEntryCode("BUMI");
		facBnm.setIndustryCodeCategoryCode("INDUSTRY");
		facBnm.setIndustryCodeEntryCode("COCOA");

		storedFac.setFacilityBnmCodes(facBnm);

		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().load("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityBnmCodes());

		OBFacilityBnmCodes storedFacBnm = (OBFacilityBnmCodes) storedFac.getFacilityBnmCodes();
		assertEquals("BUMI", storedFacBnm.getBumiOrNrccCodeEntryCode());
		assertEquals("COCOA", storedFacBnm.getIndustryCodeEntryCode());

	}

	public void testCreateFacilityMasterWithFacFeeCharge() {
		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		OBFacilityFeeCharge facFeeCharge = new OBFacilityFeeCharge();
		facFeeCharge.setCurrencyCode("MYR");
		facFeeCharge.setCommissionRate(new Double(2.5));
		facFeeCharge.setCommissionBasisCategoryCode("CMSSN_BASIS");
		facFeeCharge.setCommissionBasisEntryCode("1ST_PAYMENT");
		facFeeCharge.setHandlingFeesAmount(new Amount(125, "MYR"));
		facFeeCharge.setOthersFeeAmount(new Amount(50, "MYR"));

		storedFac.setFacilityFeeCharge(facFeeCharge);

		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().load("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityFeeCharge());

		OBFacilityFeeCharge storedFacFeeCharge = (OBFacilityFeeCharge) storedFac.getFacilityFeeCharge();
		assertEquals(new Double(2.5), storedFacFeeCharge.getCommissionRate());
		assertEquals("1ST_PAYMENT", storedFacFeeCharge.getCommissionBasisEntryCode());

	}

	public void testCreateFacilityMasterWithFacPayment() {
		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		OBFacilityPayment facPayment = new OBFacilityPayment();
		facPayment.setGracePeriodCategoryCode("GRACE_PERIOD");
		facPayment.setGracePeriodEntryCode("50");
		facPayment.setGracePeriodCodeCategoryCode("GRACE_PERIOD_CODE");
		facPayment.setGracePeriodCodeEntryCode("D");
		facPayment.setInterestPaymentFrequencyCategoryCode("PAY_INTEREST");
		facPayment.setInterestPaymentFrequencyEntryCode("YEARLY");

		storedFac.setFacilityPayment(facPayment);

		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().load("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityPayment());

		OBFacilityPayment storedFacPayment = (OBFacilityPayment) storedFac.getFacilityPayment();
		assertEquals("50", storedFacPayment.getGracePeriodEntryCode());
		assertEquals("YEARLY", storedFacPayment.getInterestPaymentFrequencyEntryCode());

	}
	
	public void testCreateFacilityMasterWithFacIslamicMaster() {
		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		OBFacilityIslamicMaster facIslamicMaster = new OBFacilityIslamicMaster();
		facIslamicMaster.setGppTerm(new Short("1"));
		facIslamicMaster.setGppTermCode(new Character('A'));
		
		
		facIslamicMaster.setGppPaymentModeNum("12");
		facIslamicMaster.setGppPaymentModeValue("12Value");
		facIslamicMaster.setSellingPriceAmount(new Amount(2000.00, CurrencyCode.MYR));
		facIslamicMaster.setCommissionExpiryDate(new Date());

		storedFac.setFacilityIslamicMaster(facIslamicMaster);
		
		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().load("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityIslamicMaster());

		OBFacilityIslamicMaster storedFacIslamicMaster = (OBFacilityIslamicMaster) storedFac.getFacilityIslamicMaster();
		assertEquals(new Short("1"), storedFacIslamicMaster.getGppTerm());
		assertEquals("12Value", storedFacIslamicMaster.getGppPaymentModeValue());
		assertEquals((double)2000, storedFacIslamicMaster.getSellingPriceAmount().getAmount(), 0.01);
	}
	
	public void testCreateFacilityMasterWithFacIslamicBbaVariPackage() {
		OBFacilityMaster storedFac = createDefaultFacilityMaster();
		
		OBFacilityIslamicBbaVariPackage bbaVariPackage = new OBFacilityIslamicBbaVariPackage();
		bbaVariPackage.setCustProfRate(new Double(2.0));
		bbaVariPackage.setFullReleaseProfit(new Boolean("false"));
		bbaVariPackage.setSellingPrice(new Amount(9000, CurrencyCode.MYR));
		
		storedFac.setFacilityIslamicBbaVariPackage(bbaVariPackage);
		
		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().load("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityIslamicBbaVariPackage());
		
		OBFacilityIslamicBbaVariPackage storedBba = (OBFacilityIslamicBbaVariPackage)storedFac.getFacilityIslamicBbaVariPackage();
		assertEquals((double)2.0, storedBba.getCustProfRate().doubleValue(), 0.01);
		assertFalse(storedBba.getFullReleaseProfit().booleanValue());
		assertEquals((double)9000, storedBba.getSellingPrice().getAmount(), 0.01);
		
	}
	
	public void testCreateFacilityMasterWithFacMultiTierFinancing() {
		Date todayDate = new Date();

		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		Set facilityMultiTierFinancingSet = new HashSet();

		OBFacilityMultiTierFinancing ob = new OBFacilityMultiTierFinancing();
		ob.setRate(new Double("4000"));
		ob.setStatus("New");
		ob.setTierSeqNo(new Short("1"));
		ob.setTierTerm(new Short("5"));
		ob.setTierTermCode(new Character('5'));
		facilityMultiTierFinancingSet.add(ob);
		
		ob = new OBFacilityMultiTierFinancing();
		ob.setRate(new Double("6000"));
		ob.setStatus("Old");
		ob.setTierSeqNo(new Short("2"));
		ob.setTierTerm(new Short("6"));
		ob.setTierTermCode(new Character('6'));
		facilityMultiTierFinancingSet.add(ob);

		storedFac.setFacilityMultiTierFinancingSet(facilityMultiTierFinancingSet);

		getHibernateTemplate().update("actualFacilityMaster", storedFac);
		assertNotNull(storedFac);
		assertNotNull(storedFac.getFacilityMultiTierFinancingSet());
		assertEquals(2, storedFac.getFacilityMultiTierFinancingSet().size());
		
		Set storedFacMultiTierFinancingSet = storedFac.getFacilityMultiTierFinancingSet();
		OBFacilityMultiTierFinancing storedOb = getFacilityMultiTierFinancing(storedFacMultiTierFinancingSet, new Short("1").shortValue());
		assertEquals((double)4000, storedOb.getRate().doubleValue(), 0.01);
		assertEquals("New", storedOb.getStatus());
		
		storedOb = getFacilityMultiTierFinancing(storedFacMultiTierFinancingSet, new Short("2").shortValue());
		assertEquals((double)6000, storedOb.getRate().doubleValue(), 0.01);
		assertEquals("Old", storedOb.getStatus());		
	}
	

	public void testCreateFacilityMasterWithInsurances() {
		Date todayDate = new Date();

		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		Set insuranceSet = new HashSet();

		OBFacilityInsurance insr = new OBFacilityInsurance();
		insr.setCoverageTypeCategoryCode("COVERAGE");
		insr.setCoverageTypeEntryCode("LIFE");
		insr.setCurrencyCode("MYR");
		insr.setEffectiveDate(DateUtils.addDays(todayDate, -10));
		insr.setExpiryDate(DateUtils.addYears(todayDate, 5));
		insr.setInsuranceCompanyCategoryCode("INSR_COMPANY");
		insr.setInsuranceCompanyEntryCode("AIA");
		insr.setIssuedDate(DateUtils.addDays(todayDate, -13));
		insr.setPolicyNumber("AIA-LIFE-JB-000011111");
		insuranceSet.add(insr);

		insr = new OBFacilityInsurance();
		insr.setCoverageTypeCategoryCode("COVERAGE");
		insr.setCoverageTypeEntryCode("MEDI");
		insr.setCurrencyCode("MYR");
		insr.setEffectiveDate(DateUtils.addDays(todayDate, -12));
		insr.setExpiryDate(DateUtils.addYears(todayDate, 8));
		insr.setInsuranceCompanyCategoryCode("INSR_COMPANY");
		insr.setInsuranceCompanyEntryCode("AIG");
		insr.setIssuedDate(DateUtils.addDays(todayDate, -16));
		insr.setPolicyNumber("AIA-MED-JB-000011112");
		insuranceSet.add(insr);

		storedFac.setFacilityInsuranceSet(insuranceSet);

		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().load("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityInsuranceSet());
		assertEquals(2, storedFac.getFacilityInsuranceSet().size());

		OBFacilityInsurance storedInsr = getFacilityInsuranceByPolicyNumber(storedFac.getFacilityInsuranceSet(),
				"AIA-MED-JB-000011112");
		insr = getFacilityInsuranceByPolicyNumber(insuranceSet, "AIA-MED-JB-000011112");
		assertEquals(insr, storedInsr);

		storedInsr = getFacilityInsuranceByPolicyNumber(storedFac.getFacilityInsuranceSet(), "AIA-LIFE-JB-000011111");
		insr = getFacilityInsuranceByPolicyNumber(insuranceSet, "AIA-LIFE-JB-000011111");
		assertEquals(insr, storedInsr);

	}

	public void testCreateFacilityMasterWithOfficers() {
		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		Set officerSet = new HashSet();

		OBFacilityOfficer officer = new OBFacilityOfficer();
		officer.setOfficerCategoryCode("OFFICER");
		officer.setOfficerEntryCode("LKY");
		officer.setOfficerTypeCategoryCode("OFFICER_TYPE");
		officer.setOfficerTypeEntryCode("CLERK");
		officer.setRelationshipCodeCategoryCode("OFFICER_REL");
		officer.setRelationshipCodeEntryCode("CLIENT");

		officerSet.add(officer);

		officer = new OBFacilityOfficer();
		officer.setOfficerCategoryCode("OFFICER");
		officer.setOfficerEntryCode("LCW");
		officer.setOfficerTypeCategoryCode("OFFICER_TYPE");
		officer.setOfficerTypeEntryCode("TL");
		officer.setRelationshipCodeCategoryCode("OFFICER_REL");
		officer.setRelationshipCodeEntryCode("CLIENT");
		officerSet.add(officer);

		storedFac.setFacilityOfficerSet(officerSet);

		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().load("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityOfficerSet());
		assertEquals(2, storedFac.getFacilityOfficerSet().size());

		OBFacilityOfficer storedOfficer = getFacilityOfficerByOfficerCode(storedFac.getFacilityOfficerSet(), "LKY");
		officer = getFacilityOfficerByOfficerCode(officerSet, "LKY");
		assertEquals(officer, storedOfficer);

		storedOfficer = getFacilityOfficerByOfficerCode(storedFac.getFacilityOfficerSet(), "LCW");
		officer = getFacilityOfficerByOfficerCode(officerSet, "LCW");
		assertEquals(officer, storedOfficer);
	}

	public void testCreateFacilityMasterWithRelationships() {
		OBFacilityMaster storedFac = createDefaultFacilityMaster();

		Set relationshipSet = new HashSet();

		OBFacilityRelationship relationship = new OBFacilityRelationship();
		relationship.setAccountRelationshipCategoryCode("ACCT_REL");
		relationship.setAccountRelationshipEntryCode("MB");

		OBCMSLegalEntity legalEntity = new OBCMSLegalEntity();
		legalEntity.setLEReference("CIF-00001");
		legalEntity.setLegalName("LKK PTE LTD");
		legalEntity.setLEID(20090117222333555l);

		relationship.setCifNumber("CIF-00001");
		relationship.setCmsLegalEntity(legalEntity);
		relationship.setCurrencyCode("MYR");
		relationship.setCustomerName("LKK PTE LTD");
		relationship.setGuaranteeAmount(new Amount(20000, "MYR"));
		relationship.setGuaranteeTypeIndicator(new Character('A'));
		relationship.setProfitRatio(new Double(0.03));
		relationship.setReceiveMailCode(Boolean.TRUE);

		relationshipSet.add(relationship);

		OBFacilityRelationship relationship1 = new OBFacilityRelationship();
		relationship1.setAccountRelationshipCategoryCode("ACCT_REL");
		relationship1.setAccountRelationshipEntryCode("JB");

		OBCMSLegalEntity legalEntity1 = new OBCMSLegalEntity();
		legalEntity1.setLEReference("CIF-00002");
		legalEntity1.setLegalName("LKY PTE LTD");
		legalEntity1.setLEID(20090117222333444l);

		relationship1.setCifNumber("CIF-00002");
		relationship1.setCmsLegalEntity(legalEntity1);
		relationship1.setCurrencyCode("MYR");
		relationship1.setCustomerName("LKY PTE LTD");
		relationship1.setGuaranteePercentage(new Double(0.05));
		relationship1.setGuaranteeTypeIndicator(new Character('P'));
		relationship1.setProfitRatio(new Double(0.01));
		relationship1.setReceiveMailCode(Boolean.FALSE);

		relationshipSet.add(relationship1);

		storedFac.setFacilityRelationshipSet(relationshipSet);

		getHibernateTemplate().update("actualFacilityMaster", storedFac);

		storedFac = (OBFacilityMaster) getHibernateTemplate().get("actualFacilityMaster", new Long(storedFac.getId()));
		assertNotNull(storedFac.getFacilityRelationshipSet());
		assertEquals(2, storedFac.getFacilityRelationshipSet().size());
		
		OBFacilityRelationship storedRelationship = getFacilityRelationshipByCifNumber(storedFac
				.getFacilityRelationshipSet(), "CIF-00001");
		relationship = getFacilityRelationshipByCifNumber(relationshipSet, "CIF-00001");
		assertEquals(relationship, storedRelationship);
		assertEquals(storedRelationship, relationship);

		storedRelationship = getFacilityRelationshipByCifNumber(storedFac.getFacilityRelationshipSet(), "CIF-00002");
		relationship = getFacilityRelationshipByCifNumber(relationshipSet, "CIF-00002");
		assertEquals(relationship, storedRelationship);
		assertEquals(storedRelationship, relationship);
	}

	protected OBFacilityRelationship getFacilityRelationshipByCifNumber(Set relationshipSet, String cifNumber) {
		for (Iterator itr = relationshipSet.iterator(); itr.hasNext();) {
			OBFacilityRelationship relationship = (OBFacilityRelationship) itr.next();
			if (cifNumber.equals(relationship.getCifNumber())) {
				return relationship;
			}
		}

		throw new IllegalArgumentException("cannot find facility relationship having cifNumber [" + cifNumber + "]");
	}

	protected OBFacilityOfficer getFacilityOfficerByOfficerCode(Set officerSet, String officerCode) {
		for (Iterator itr = officerSet.iterator(); itr.hasNext();) {
			OBFacilityOfficer officer = (OBFacilityOfficer) itr.next();
			if (officerCode.equals(officer.getOfficerEntryCode())) {
				return officer;
			}
		}

		throw new IllegalArgumentException("cannot find facility officer having officerCode [" + officerCode + "]");
	}

	protected OBFacilityInsurance getFacilityInsuranceByPolicyNumber(Set insuranceSet, String policyNumber) {
		for (Iterator itr = insuranceSet.iterator(); itr.hasNext();) {
			OBFacilityInsurance insr = (OBFacilityInsurance) itr.next();
			if (policyNumber.equals(insr.getPolicyNumber())) {
				return insr;
			}
		}

		throw new IllegalArgumentException("cannot find facility insurance having policyNumber [" + policyNumber + "]");
	}

	protected ILimit getLimitByLimitRef(ILimit[] limits, String limitRef) {
		for (int i = 0; i < limits.length; i++) {
			if (limits[i].getLimitRef().equals(limitRef)) {
				return limits[i];
			}
		}

		throw new IllegalArgumentException("cannot find limit having limitRef [" + limitRef + "]");
	}
	
	protected OBFacilityMultiTierFinancing getFacilityMultiTierFinancing(Set financingMultiTierFinancingSet, short seqNo) {
		for (Iterator itr = financingMultiTierFinancingSet.iterator(); itr.hasNext();) {
			OBFacilityMultiTierFinancing ob = (OBFacilityMultiTierFinancing) itr.next();
			if (seqNo == ob.getTierSeqNo().shortValue()) {
				return ob;
			}
		}

		throw new IllegalArgumentException("cannot find facility multi tier financing having sequence no [" + seqNo + "]");
	}
}

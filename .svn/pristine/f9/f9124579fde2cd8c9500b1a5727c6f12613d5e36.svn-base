package com.integrosys.cms.app.limit.bus;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import junit.framework.TestCase;

import org.apache.commons.lang.time.DateUtils;
import org.easymock.MockControl;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.util.ReplicateUtils;

public class FacilityBusManagerImplTest extends TestCase {

	public void setUp() {
		Log4jConfigTestPlugin.configure();
	}

	public void testUpdateToWorkingCopyUsingOneSetAndOneDependency() throws Exception {
		Date todayDate = new Date();

		MockFacilityDaoImpl dao = new MockFacilityDaoImpl();

		IFacilityJdbc mockFacilityJdbc = (IFacilityJdbc) Proxy.newProxyInstance(Thread.currentThread()
				.getContextClassLoader(), new Class[] { IFacilityJdbc.class }, new InvocationHandler() {

			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				return null;
			}
		});

		FacilityBusManagerImpl busMgr = new FacilityBusManagerImpl();
		busMgr.setFacilityDao(dao);
		busMgr.setFacilityJdbc(mockFacilityJdbc);

		OBFacilityMaster facMaster = new OBFacilityMaster();
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
		// facMaster.setRevolvingIndicator('N');
		facMaster.setSolicitorName("YB SHIN KAI");

		OBFacilityGeneral facGeneral = new OBFacilityGeneral();
		facGeneral.setApplicationDate(DateUtils.addMonths(todayDate, -2));
		facGeneral.setApprovedDate(DateUtils.addDays(facGeneral.getApplicationDate(), 5));
		facGeneral.setCarCodeFlag(Boolean.TRUE);
		facGeneral.setCurrencyCode("MYR");
		facGeneral.setLimitStatusCategoryCode("LIMIT_STATUS");
		facGeneral.setLimitStatusEntryCode("CUSTOMER_ACCEPTED");
		facGeneral.setFinancedAmount(new Amount(10000, "MYR"));
		facGeneral.setLoanPurposeCategoryCode("LOAN_PURPOSE");
		facGeneral.setLoanPurposeEntryCode("DAILY_EXPENSE");
		facGeneral.setOfferAcceptedDate(DateUtils.addDays(facGeneral.getApplicationDate(), 10));
		facGeneral.setOfferDate(DateUtils.addDays(facGeneral.getApplicationDate(), 8));
		facGeneral.setOfficerCategoryCode("OFFICER");
		facGeneral.setOfficerEntryCode("CLK");
		facGeneral.setOriginalAmount(new Amount(20000, "MYR"));
		facGeneral.setOustandingBalanceAmount(new Amount(600, "MYR"));
		facGeneral.setTerm(new Integer(2));
		facGeneral.setTermCodeCategoryCode("FAC_TERM");
		facGeneral.setTermCodeEntryCode("M");

		facMaster.setFacilityGeneral(facGeneral);

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

		facMaster.setFacilityInsuranceSet(insuranceSet);

		OBFacilityMaster stageFacMaster = (OBFacilityMaster) ReplicateUtils.replicateObject(facMaster, null);
		OBFacilityGeneral stageFacGeneneral = (OBFacilityGeneral) ReplicateUtils.replicateObject(facGeneral, null);
		stageFacMaster.setFacilityGeneral(stageFacGeneneral);

		Long actualKey = (Long) dao.createFacilityMaster("ACTUAL", facMaster);
		assertNotNull(actualKey);

		Set stageInsuranceSet = new HashSet();
		for (Iterator itr = insuranceSet.iterator(); itr.hasNext();) {
			OBFacilityInsurance actualInsr = (OBFacilityInsurance) itr.next();
			actualInsr.setCmsRefId(new Long(actualInsr.getId()));
			OBFacilityInsurance stageInsr = (OBFacilityInsurance) ReplicateUtils.replicateObject(actualInsr, null);
			stageInsuranceSet.add(stageInsr);
		}
		stageFacMaster.setFacilityInsuranceSet(stageInsuranceSet);

		Long stageKey = (Long) dao.createFacilityMaster("STAGE", stageFacMaster);
		assertNotNull(stageKey);

		assertNotSame(actualKey, stageKey);
		IFacilityMaster stageFacilityMaster = dao.retrieveFacilityMasterByPrimaryKey("STAGE", stageKey);
		assertEquals(stageKey, new Long(stageFacilityMaster.getId()));

		stageFacilityMaster.getFacilityGeneral().setTerm(new Integer(3));
		for (Iterator itr = stageFacilityMaster.getFacilityInsuranceSet().iterator(); itr.hasNext();) {
			OBFacilityInsurance storedInsr = (OBFacilityInsurance) itr.next();
			if (storedInsr.getPolicyNumber().equals("AIA-LIFE-JB-000011111")) {
				assertNotNull(storedInsr);
				assertEquals("LIFE", storedInsr.getCoverageTypeEntryCode());
				storedInsr.setInsuredAmount(new Amount(30000, "MYR"));
			}
		}

		stageFacilityMaster.setSolicitorName("KOK LAW FIRM");

		IFacilityMaster actualFacilityMaster = dao.retrieveFacilityMasterByPrimaryKey("ACTUAL", actualKey);
		assertEquals(actualKey, new Long(actualFacilityMaster.getId()));

		IFacilityMaster updatedCopy = busMgr.updateToWorkingCopy(actualFacilityMaster, stageFacilityMaster);
		assertEquals(actualKey, new Long(updatedCopy.getId()));
		assertEquals(actualKey, new Long(updatedCopy.getFacilityGeneral().getFacilityMasterId()));
		assertEquals(new Integer(3), updatedCopy.getFacilityGeneral().getTerm());
		assertEquals("KOK LAW FIRM", updatedCopy.getSolicitorName());

		for (Iterator itr = updatedCopy.getFacilityInsuranceSet().iterator(); itr.hasNext();) {
			OBFacilityInsurance storedInsr = (OBFacilityInsurance) itr.next();
			if (storedInsr.getPolicyNumber().equals("AIA-LIFE-JB-000011111")) {
				assertNotNull(storedInsr);
				assertEquals("LIFE", storedInsr.getCoverageTypeEntryCode());
				assertEquals(new Amount(30000, "MYR"), storedInsr.getInsuredAmount());
				assertEquals(storedInsr.getCmsRefId(), new Long(storedInsr.getId()));
			}
		}
	}

	public void testCreateWorkingCopyUsingOneSetAndOneDependency() throws Exception {
		Date todayDate = new Date();

		OBLimit limit = new OBLimit();
		limit.setLimitID(20080903000111222l);

		MockFacilityDaoImpl dao = new MockFacilityDaoImpl();

		MockControl facilityJdbcControl = MockControl.createControl(IFacilityJdbc.class);
		IFacilityJdbc facilityJdbc = (IFacilityJdbc) facilityJdbcControl.getMock();
		facilityJdbc.getBasicLimitInfoByCmsLimitId(1234l, true);
		facilityJdbcControl.setDefaultReturnValue(limit);

		FacilityBusManagerImpl busMgr = new FacilityBusManagerImpl();
		busMgr.setFacilityDao(dao);
		busMgr.setFacilityJdbc(facilityJdbc);

		OBFacilityMaster facMaster = new OBFacilityMaster();
		facMaster.setAllowIncentive(Boolean.TRUE);
		facMaster.setLimit(limit);
		facMaster.setApplicationSourceCategoryCode("FAC_APPL_SOURCE");
		facMaster.setApplicationSourceEntryCode("HQ");
		facMaster.setAvailPeriodInDays(new Integer(5));
		facMaster.setCgcBnmApprovedDate(DateUtils.addMonths(todayDate, -10));
		facMaster.setDepartmentCodeCategoryCode("FAC_DEPARTMENT");
		facMaster.setDepartmentCodeEntryCode("P_LOAN");
		facMaster.setEffectiveCostOfFund(Boolean.FALSE);
		facMaster.setFacilityAvailDate(DateUtils.addDays(todayDate, 14));
		facMaster.setIntInSuspense(new BigDecimal(10.32));
		// facMaster.setRevolvingIndicator('N');
		facMaster.setSolicitorName("YB SHIN KAI");

		facilityJdbc.updateLimitInfo(facMaster);
		facilityJdbcControl.setDefaultVoidCallable();
		facilityJdbcControl.replay();

		OBFacilityGeneral facGeneral = new OBFacilityGeneral();
		facGeneral.setApplicationDate(DateUtils.addMonths(todayDate, -2));
		facGeneral.setApprovedDate(DateUtils.addDays(facGeneral.getApplicationDate(), 5));
		facGeneral.setCarCodeFlag(Boolean.TRUE);
		facGeneral.setCurrencyCode("MYR");
		facGeneral.setLimitStatusCategoryCode("LIMIT_STATUS");
		facGeneral.setLimitStatusEntryCode("CUSTOMER_ACCEPTED");
		facGeneral.setFinancedAmount(new Amount(10000, "MYR"));
		facGeneral.setLoanPurposeCategoryCode("LOAN_PURPOSE");
		facGeneral.setLoanPurposeEntryCode("DAILY_EXPENSE");
		facGeneral.setOfferAcceptedDate(DateUtils.addDays(facGeneral.getApplicationDate(), 10));
		facGeneral.setOfferDate(DateUtils.addDays(facGeneral.getApplicationDate(), 8));
		facGeneral.setOfficerCategoryCode("OFFICER");
		facGeneral.setOfficerEntryCode("CLK");
		facGeneral.setOriginalAmount(new Amount(20000, "MYR"));
		facGeneral.setOustandingBalanceAmount(new Amount(600, "MYR"));
		facGeneral.setTerm(new Integer(2));
		facGeneral.setTermCodeCategoryCode("FAC_TERM");
		facGeneral.setTermCodeEntryCode("M");

		facMaster.setFacilityGeneral(facGeneral);

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

		facMaster.setFacilityInsuranceSet(insuranceSet);

		Long stageKey = (Long) dao.createFacilityMaster("STAGE", facMaster);
		assertNotNull(stageKey);

		IFacilityMaster stageFacilityMaster = dao.retrieveFacilityMasterByPrimaryKey("STAGE", stageKey);
		assertEquals(stageKey, new Long(stageFacilityMaster.getId()));

		stageFacilityMaster.getFacilityGeneral().setTerm(new Integer(3));
		for (Iterator itr = stageFacilityMaster.getFacilityInsuranceSet().iterator(); itr.hasNext();) {
			OBFacilityInsurance storedInsr = (OBFacilityInsurance) itr.next();
			if (storedInsr.getPolicyNumber().equals("AIA-LIFE-JB-000011111")) {
				assertNotNull(storedInsr);
				assertEquals("LIFE", storedInsr.getCoverageTypeEntryCode());
				storedInsr.setInsuredAmount(new Amount(30000, "MYR"));
			}
		}

		IFacilityMaster updatedCopy = busMgr.updateToWorkingCopy(null, stageFacilityMaster);
		assertNotNull(new Long(updatedCopy.getId()));
		assertEquals(new Integer(3), updatedCopy.getFacilityGeneral().getTerm());
		assertEquals("YB SHIN KAI", updatedCopy.getSolicitorName());

		for (Iterator itr = updatedCopy.getFacilityInsuranceSet().iterator(); itr.hasNext();) {
			OBFacilityInsurance storedInsr = (OBFacilityInsurance) itr.next();
			if (storedInsr.getPolicyNumber().equals("AIA-LIFE-JB-000011111")) {
				assertNotNull(storedInsr);
				assertEquals("LIFE", storedInsr.getCoverageTypeEntryCode());
				assertEquals(new Amount(30000, "MYR"), storedInsr.getInsuredAmount());
			}
		}

		facilityJdbcControl.verify();

	}
}
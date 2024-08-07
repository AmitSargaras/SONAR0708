package com.integrosys.cms.app.limit.bus;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.common.bus.OBBookingLocation;

/**
 * @author Chong Jun Yong
 * @since 03.09.2008
 */
public class FacilityDaoImplTest extends CustomHibernateTestCase {

	FacilityDaoImpl dao;

	public void setUp() {
		super.setUp();

		dao = new FacilityDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

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

	protected OBFacilityMaster createDefaultFacilityMaster(String limitRef) {
		Date todayDate = new Date();

		OBLimitProfile storedLimitProfile = getDefaultStoredLimitProfile();

		OBFacilityMaster facMaster = new OBFacilityMaster();
		facMaster.setLimit(getLimitByLimitRef(storedLimitProfile.getLimits(), limitRef));
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

	protected String[] getMappingResources() {
		return new String[] { "Limit.hbm.xml", "Facility.hbm.xml" };
	}

	public void testFindFacilityMasterByCmsLimitId() {
		OBFacilityMaster facMaster = createDefaultFacilityMaster("LMT-1100221");

		OBFacilityMaster foundFacMaster = (OBFacilityMaster) dao.findFacilityMasterByCmsLimitId(
				IFacilityDao.ACTUAL_FACILITY_MASTER, facMaster.getLimit().getLimitID());
		assertEquals(foundFacMaster.getId(), facMaster.getId());
	}

	public void testFindFacilityMasterByLimitRef() {
		OBFacilityMaster facMaster = createDefaultFacilityMaster("LMT-1100221");

		OBFacilityMaster foundFacMaster = (OBFacilityMaster) dao.findFacilityMasterByLimitRef(
				IFacilityDao.ACTUAL_FACILITY_MASTER, facMaster.getLimit().getLimitRef());
		assertEquals(foundFacMaster.getId(), facMaster.getId());
	}

	public void testFindFacilityMasterByCmsLimitIdList() {
		OBFacilityMaster studyLoanFacMaster = createDefaultFacilityMaster("LMT-1100221");
		OBFacilityMaster dailyExpenseLoanFacMaster = createDefaultFacilityMaster("LMT-1100222");

		List cmsLimitIdList = new ArrayList();
		cmsLimitIdList.add(new Long(studyLoanFacMaster.getLimit().getLimitID()));
		cmsLimitIdList.add(new Long(dailyExpenseLoanFacMaster.getLimit().getLimitID()));

		List foundFacMasterList = dao.findFacilityMasterByCmsLimitIdList(IFacilityDao.ACTUAL_FACILITY_MASTER,
				cmsLimitIdList);
		assertEquals(2, foundFacMasterList.size());
	}

	public void testFindFacilityMasterByLimitRefList() {
		OBFacilityMaster studyLoanFacMaster = createDefaultFacilityMaster("LMT-1100221");
		OBFacilityMaster dailyExpenseLoanFacMaster = createDefaultFacilityMaster("LMT-1100222");

		List limitRefList = new ArrayList();
		limitRefList.add(studyLoanFacMaster.getLimit().getLimitRef());
		limitRefList.add(dailyExpenseLoanFacMaster.getLimit().getLimitRef());

		List foundFacMasterList = dao.findFacilityMasterByLimitRefList(IFacilityDao.ACTUAL_FACILITY_MASTER,
				limitRefList);
		assertEquals(2, foundFacMasterList.size());
	}

	protected ILimit getLimitByLimitRef(ILimit[] limits, String limitRef) {
		for (int i = 0; i < limits.length; i++) {
			if (limits[i].getLimitRef().equals(limitRef)) {
				return limits[i];
			}
		}

		throw new IllegalArgumentException("cannot find limit having limitRef [" + limitRef + "]");
	}
}

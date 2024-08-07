package com.integrosys.cms.app.limit.bus;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.common.bus.OBBookingLocation;

/**
 * @author Chong Jun Yong
 * 
 */
public class FacilityJdbcImplTest extends CustomHibernateTestCase {

	FacilityJdbcImpl jdbc;

	public void setUp() {
		super.setUp();

		jdbc = new FacilityJdbcImpl();
		jdbc.setDataSource(getDataSource());

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

	public void testGetListOfCmsLimitIdByCmsLimitProfileId() {
		OBLimitProfile limitProfile = getDefaultStoredLimitProfile();
		List cmsLimitIdList = jdbc.getListOfCmsLimitIdByCmsLimitProfileId(limitProfile.getLimitProfileID(), true);
		assertEquals(2, cmsLimitIdList.size());
	}

	public void testGetListOfCmsLimitIdByLimitProfileReference() {
		OBLimitProfile limitProfile = getDefaultStoredLimitProfile();
		List cmsLimitIdList = jdbc.getListOfCmsLimitIdByLimitProfileReference(limitProfile.getBCAReference(), true);
		assertEquals(2, cmsLimitIdList.size());
	}

	protected String[] getMappingResources() {
		return new String[] { "Limit.hbm.xml" };
	}
}

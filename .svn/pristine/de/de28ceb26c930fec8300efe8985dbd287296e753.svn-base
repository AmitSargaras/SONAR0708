package com.integrosys.cms.app.limit.bus;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.exception.ChainedException;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.base.techinfra.util.ReplicateUtils;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.cms.app.common.bus.OBBookingLocation;

/**
 * Test Case to test Limit Hbm Mapping file.
 * 
 * @author Chong Jun Yong
 * 
 */
public class HibernateLimitTest extends CustomHibernateTestCase {
	
	private HibernateTemplate hibernateTemplate;
	
	public void setUp() {
		super.setUp();
		
		this.hibernateTemplate = new HibernateTemplate(getSessionFactory());
	}

	protected String[] getMappingResources() {
		return new String[] { "Limit.hbm.xml" };
	}

	public void testCreateNewLimitProfile() throws ChainedException {

		OBLimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setAAType("HP");
		limitProfile.setApprovalDate(new Date());
		limitProfile.setActualSecurityCoverage(99.7d);
		limitProfile.setRenewalInd(true);
		limitProfile.setOriginatingLocation(new OBBookingLocation("SG", "TAMP"));
		limitProfile.setCustomerID(12345l);

		Long id = (Long) hibernateTemplate.save("actualLimitProfile", limitProfile);
		assertNotNull(id);

		OBLimitProfile storedLimitProfile = (OBLimitProfile) hibernateTemplate.get("actualLimitProfile", id);
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

		hibernateTemplate.update("actualLimitProfile", storedLimitProfile);

		storedLimitProfile = (OBLimitProfile) hibernateTemplate.get("actualLimitProfile", id);
		assertEquals(2, storedLimitProfile.getLimits().length);

		ILimit[] limits = storedLimitProfile.getLimits();
		for (int i = 0; i < limits.length; i++) {
			limits[i].setActivatedLimitAmount(limits[i].getApprovedLimitAmount().subtract(new Amount(1000, "MYR")));
		}

		hibernateTemplate.update("actualLimitProfile", storedLimitProfile);
		storedLimitProfile = (OBLimitProfile) hibernateTemplate.get("actualLimitProfile", id);
		limits = storedLimitProfile.getLimits();
		for (int i = 0; i < limits.length; i++) {
			assertEquals(9000d, limits[i].getActivatedLimitAmount().getAmountAsDouble(), 0);
		}
	}

	public void testCreateNewLimitProfileWithTATs() {

		OBLimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setAAType("HP");
		limitProfile.setApprovalDate(new Date());
		limitProfile.setActualSecurityCoverage(99.7d);
		limitProfile.setRenewalInd(true);
		limitProfile.setOriginatingLocation(new OBBookingLocation("SG", "TAMP"));
		limitProfile.setCustomerID(12345l);

		Long id = (Long) hibernateTemplate.save("actualLimitProfile", limitProfile);
		assertNotNull(id);

		OBLimitProfile storedLimitProfile = (OBLimitProfile) hibernateTemplate.get("actualLimitProfile", id);
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

		hibernateTemplate.update("actualLimitProfile", storedLimitProfile);

		storedLimitProfile = (OBLimitProfile) hibernateTemplate.get("actualLimitProfile", id);
		assertEquals(2, storedLimitProfile.getLimits().length);

		OBTATEntry startTat = new OBTATEntry();
		startTat.setTATStamp(new Date());
		startTat.setTATServiceCode("Create TAT");
		startTat.setRemarks("Start Work");

		OBTATEntry draftBflTat = new OBTATEntry();
		draftBflTat.setTATStamp(new Date());
		draftBflTat.setTATServiceCode("Draft BFL");
		draftBflTat.setRemarks("Draft BFL sent");

		storedLimitProfile.setTATEntries(new ITATEntry[] { startTat, draftBflTat });
		hibernateTemplate.update("actualLimitProfile", storedLimitProfile);

		storedLimitProfile = (OBLimitProfile) hibernateTemplate.get("actualLimitProfile", id);
		assertEquals(2, storedLimitProfile.getTATEntries().length);

	}

	public void testCreateNewLimitProfileWithCollateralAllocation() {

		OBLimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setAAType("HP");
		limitProfile.setApprovalDate(new Date());
		limitProfile.setActualSecurityCoverage(99.7d);
		limitProfile.setRenewalInd(true);
		limitProfile.setOriginatingLocation(new OBBookingLocation("SG", "TAMP"));
		limitProfile.setCustomerID(12345l);

		Long id = (Long) hibernateTemplate.save("actualLimitProfile", limitProfile);
		assertNotNull(id);

		OBLimitProfile storedLimitProfile = (OBLimitProfile) hibernateTemplate.get("actualLimitProfile", id);
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

		hibernateTemplate.update("actualLimitProfile", storedLimitProfile);

		storedLimitProfile = (OBLimitProfile) hibernateTemplate.get("actualLimitProfile", id);
		assertEquals(2, storedLimitProfile.getLimits().length);

		OBCollateral col = new OBCollateral();
		col.setCollateralID(20080722000000001l);
		OBCollateralAllocation colAlloc = new OBCollateralAllocation();
		colAlloc.setCollateral(col);
		colAlloc.setSourceID("SIBS");
		colAlloc.setHostStatus("U");

		ILimit[] limits = storedLimitProfile.getLimits();
		limits[0].setCollateralAllocations(new ICollateralAllocation[] { colAlloc });

		ICollateralAllocation newColAlloc = (ICollateralAllocation) ReplicateUtils.replicateObject(colAlloc, null);
		newColAlloc.setCollateral(col);

		limits[1].setCollateralAllocations(new ICollateralAllocation[] { newColAlloc });

		hibernateTemplate.update("actualLimitProfile", storedLimitProfile);

		storedLimitProfile = (OBLimitProfile) hibernateTemplate.get("actualLimitProfile", id);

		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		int count = jdbcTemplate.queryForInt("select count(*) from cms_limit_security_map where cms_collateral_id = 20080722000000001");
		assertEquals(2, count);

	}

}

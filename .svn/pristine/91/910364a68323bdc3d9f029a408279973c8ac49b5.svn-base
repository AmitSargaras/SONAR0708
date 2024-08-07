package com.integrosys.cms.app.limit.bus;

import java.util.Date;

import org.apache.commons.lang.time.DateUtils;

import com.integrosys.base.techinfra.test.MockContextTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class EBLimitProfileBeanTest extends MockContextTestCase {
	public void onSetUp() throws Exception {
		deploy("EBLimitProfileHome", EBLimitProfileHome.class, EBLimitProfile.class, EBLimitProfileBean.class);
	}

	public void testCreateLimitProfileWithBothLosAndHostReferenceNumberSet() throws Exception {
		Date todayDate = new Date();

		OBLimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setBCAReference("AA-12345");
		limitProfile.setLosLimitProfileReference("LOS-HP-123456");
		limitProfile.setApprovalDate(DateUtils.addMonths(todayDate, -1));
		limitProfile.setBCAStatus("NEW");
		limitProfile.setApplicationType("HP");
		limitProfile.setLEReference("CIF-12345");
		limitProfile.setCustomerID(20080910000111222l);

		EBLimitProfileHome home = (EBLimitProfileHome) get("EBLimitProfileHome");
		EBLimitProfile ebLimitProfile = home.create(limitProfile);
		assertNotNull(ebLimitProfile);

		ILimitProfile storedLimitProfile = ebLimitProfile.getValue(false);
		assertTrue(storedLimitProfile.getLimitProfileID() > 0);
		assertEquals(limitProfile.getLosLimitProfileReference(), storedLimitProfile.getLosLimitProfileReference());
		assertEquals(limitProfile.getBCAReference(), storedLimitProfile.getBCAReference());
	}
}

package com.integrosys.cms.host.eai.limit.support;

import java.util.ArrayList;
import java.util.List;

import junit.framework.TestCase;

import com.integrosys.cms.host.eai.StandardCode;
import com.integrosys.cms.host.eai.limit.bus.FacilityBNM;
import com.integrosys.cms.host.eai.limit.bus.FacilityMaster;

/**
 * @author Chong Jun Yong
 *
 */
public class CommonHelperPropertyUtilsTest extends TestCase {
	public void testCopyNestedPropertiesToNullParentObject() {
		List properties = new ArrayList();
		properties.add("facilityBnmCodes.BNMSectorCode");

		StandardCode sector = new StandardCode();
		sector.setStandardCodeNumber("17");
		sector.setStandardCodeValue("349");

		FacilityBNM bnm = new FacilityBNM();
		bnm.setBNMSectorCode(sector);

		FacilityMaster fac = new FacilityMaster();
		fac.setFacilityBnmCodes(bnm);

		FacilityMaster fac1 = new FacilityMaster();
		CommonHelper helper = new CommonHelper();
		helper.copyVariationProperties(fac, fac1, properties);

		assertEquals(fac.getFacilityBnmCodes().getBNMSectorCode(), fac1.getFacilityBnmCodes().getBNMSectorCode());
	}

	public void testCopyNestedPropertiesToNonNullParentObject() {
		List properties = new ArrayList();
		properties.add("facilityBnmCodes.BNMSectorCode");

		StandardCode sector = new StandardCode();
		sector.setStandardCodeNumber("17");
		sector.setStandardCodeValue("349");

		FacilityBNM bnm = new FacilityBNM();
		bnm.setBNMSectorCode(sector);

		FacilityMaster fac = new FacilityMaster();
		fac.setFacilityBnmCodes(bnm);

		FacilityMaster fac1 = new FacilityMaster();

		StandardCode sector1 = new StandardCode();
		sector1.setStandardCodeNumber("17");
		sector1.setStandardCodeValue("350");

		FacilityBNM bnm1 = new FacilityBNM();
		bnm1.setBNMSectorCode(sector1);
		fac1.setFacilityBnmCodes(bnm1);

		CommonHelper helper = new CommonHelper();
		helper.copyVariationProperties(fac, fac1, properties);

		assertEquals(fac.getFacilityBnmCodes().getBNMSectorCode(), fac1.getFacilityBnmCodes().getBNMSectorCode());
	}
}

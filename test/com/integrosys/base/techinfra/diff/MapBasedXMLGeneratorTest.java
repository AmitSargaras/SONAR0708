package com.integrosys.base.techinfra.diff;

import junit.framework.TestCase;

import com.integrosys.cms.app.limit.bus.OBLimitProfile;

public class MapBasedXMLGeneratorTest extends TestCase {

	public void testGetXmlStringForLimitProfileObject() throws Exception {
		OBLimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setBCAReference("AA-HP-12345");
		limitProfile.setSourceID("SIBS");

		MapBasedXMLGenerator xmlGenerator = MapBasedXMLGenerator.getInstance();

		String xml = xmlGenerator.getXMLString(limitProfile);
		assertNotNull(xml);
		assertTrue("should have 'SourceID' text", xml.indexOf("SourceID") >= 0);
		assertTrue("should have 'BCAReference' text", xml.indexOf("BCAReference") >= 0);
	}

	public void testGetIdXmlStringForLimitProfileObject() throws Exception {
		OBLimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setBCAReference("AA-HP-12345");
		limitProfile.setSourceID("SIBS");

		MapBasedXMLGenerator xmlGenerator = MapBasedXMLGenerator.getInstance();

		String xml = xmlGenerator.getIdXMLString(limitProfile);
		assertNotNull(xml);
		assertTrue("should have 'LimitProfileID' text", xml.indexOf("LimitProfileID") >= 0);
	}
}

package com.integrosys.cms.host.eai.limit.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;

public class HibernateFacilityOfficerTest extends CustomHibernateTestCase{
	
	protected String[] getMappingResources() {
		return new String[] { "EAI-Facility.hbm.xml" };
	}
	public void testFacilityOffier()
	{
		FacilityOfficer off = new FacilityOfficer();
		off.setFacilityMasterId(20081207000000177l);
		StandardCode relaCode = new StandardCode();
		relaCode.setStandardCodeNumber("OFFICER_RELATIONSHIP");
		relaCode.setStandardCodeValue("BR");
		StandardCode officerCode = new StandardCode();
		relaCode.setStandardCodeNumber("OFFICER");
		relaCode.setStandardCodeValue("000001");
		StandardCode typeCode= new StandardCode();
		relaCode.setStandardCodeNumber("OFFICER_TYPE");
		relaCode.setStandardCodeValue("F01");
		off.setRelationshipCode(relaCode);
		off.setOfficer(officerCode);
		off.setOfficerType(typeCode);
		
		Long off_id = (Long)getHibernateTemplate().save("actualFacOfficer",off);
		FacilityOfficer officer =(FacilityOfficer) getHibernateTemplate().get("actualFacOfficer", off_id);
		
		assertTrue(officer.getFacilityMasterId()==12345l);
		assertTrue(officer.getCMSOfficerId()==55555l);
		assertNotNull(officer.getRelationshipCode().getStandardCodeNumber());
		assertNotNull(officer.getRelationshipCode().getStandardCodeValue());
		assertNotNull(officer.getOfficer().getStandardCodeNumber());
		assertNotNull(officer.getOfficer().getStandardCodeValue());
		assertNotNull(officer.getOfficerType().getStandardCodeNumber());
		assertNotNull(officer.getOfficerType().getStandardCodeValue());
		
		assertTrue(officer.getRelationshipCode().getStandardCodeValue().equals("BR"));
		assertTrue(officer.getOfficer().getStandardCodeValue().equals("000001"));
		assertTrue(officer.getOfficerType().getStandardCodeValue().equals("F01"));
	}

}

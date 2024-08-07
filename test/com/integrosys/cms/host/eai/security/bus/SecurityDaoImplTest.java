package com.integrosys.cms.host.eai.security.bus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;
import com.integrosys.cms.host.eai.customer.bus.CustomerIdInfo;

public class SecurityDaoImplTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral.hbm.xml", "EAI-Collateral-Insurance.hbm.xml" };
	}

	public void testSearchCollateralWithOneSecToOnePledgor() {
		ApprovedSecurity sec = new ApprovedSecurity();

		StandardCode secType = new StandardCode();
		secType.setStandardCodeNumber("31");
		secType.setStandardCodeValue("PT");

		StandardCode secSubType = new StandardCode();
		secSubType.setStandardCodeNumber("54");
		secSubType.setStandardCodeValue("PT701");

		SecurityLocation location = new SecurityLocation();
		location.setLocationCountry("MY");

		sec.setSecurityType(secType);
		sec.setSecuritySubType(secSubType);
		sec.setSecurityLocation(location);

		Long seckey = (Long) getHibernateTemplate().save(sec);
		assertNotNull(seckey);

		Pledgor pledgor = new Pledgor();
		pledgor.setCIF("12345");
		pledgor.setPledgorLegalName("AH TAN");
		pledgor.setPledgorCIFSource("HOST");

		CustomerIdInfo idInfo = new CustomerIdInfo();
		idInfo.setIdNumber("88798");

		pledgor.setIdInfo(idInfo);

		Long pledgorKey = (Long) getHibernateTemplate().save(pledgor);
		assertNotNull(pledgorKey);

		SecurityPledgorMap secPledgorMap = new SecurityPledgorMap();
		secPledgorMap.setCMSPledgorId(pledgorKey);
		secPledgorMap.setCMSSecurityId(seckey);

		getHibernateTemplate().save(secPledgorMap);

		SecurityDaoImpl dao = new SecurityDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		Map securityParameters = new HashMap();
		securityParameters.put("securityType.standardCodeValue", "PT");
		securityParameters.put("securitySubType.standardCodeValue", "PT701");
		securityParameters.put("securityLocation.locationCountry", "MY");

		Map pledgorParameters = new HashMap();
		pledgorParameters.put("pledgorLegalName", "AH TAN");
		pledgorParameters.put("idInfo.idNumber", "88798");

		List securityMessageBodyList = dao
				.searchCollateralByCollateralAndPledgor(securityParameters, pledgorParameters);
		assertNotNull(securityMessageBodyList);
		assertEquals(1, securityMessageBodyList.size());
	}

	public void testSearchCollateralWithTwoSecToOnePledgor() {
		// security 1
		ApprovedSecurity sec = new ApprovedSecurity();
		sec.setLOSSecurityId("VL-1234");

		StandardCode secType = new StandardCode();
		secType.setStandardCodeNumber("31");
		secType.setStandardCodeValue("PT");

		StandardCode secSubType = new StandardCode();
		secSubType.setStandardCodeNumber("54");
		secSubType.setStandardCodeValue("PT707");

		SecurityLocation location = new SecurityLocation();
		location.setLocationCountry("MY");

		sec.setSecurityType(secType);
		sec.setSecuritySubType(secSubType);
		sec.setSecurityLocation(location);

		Long seckey = (Long) getHibernateTemplate().save(sec);
		assertNotNull(seckey);

		Pledgor pledgor = new Pledgor();
		pledgor.setCIF("12345");
		pledgor.setPledgorLegalName("AH TAN");
		pledgor.setPledgorCIFSource("HOST");

		CustomerIdInfo idInfo = new CustomerIdInfo();
		idInfo.setIdNumber("88798");

		pledgor.setIdInfo(idInfo);

		Long pledgorKey = (Long) getHibernateTemplate().save(pledgor);
		assertNotNull(pledgorKey);

		SecurityPledgorMap secPledgorMap = new SecurityPledgorMap();
		secPledgorMap.setCMSPledgorId(pledgorKey);
		secPledgorMap.setCMSSecurityId(seckey);

		getHibernateTemplate().save(secPledgorMap);

		// security 2
		ApprovedSecurity sec2 = new ApprovedSecurity();
		sec.setLOSSecurityId("VL-4421");

		sec2.setSecurityType(secType);
		sec2.setSecuritySubType(secSubType);
		sec2.setSecurityLocation(location);

		seckey = (Long) getHibernateTemplate().save(sec2);
		assertNotNull(seckey);

		secPledgorMap = new SecurityPledgorMap();
		secPledgorMap.setCMSPledgorId(pledgorKey);
		secPledgorMap.setCMSSecurityId(seckey);

		getHibernateTemplate().save(secPledgorMap);

		SecurityDaoImpl dao = new SecurityDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		Map securityParameters = new HashMap();
		securityParameters.put("securityType.standardCodeValue", "PT");
		securityParameters.put("securitySubType.standardCodeValue", "PT707");
		securityParameters.put("securityLocation.locationCountry", "MY");

		Map pledgorParameters = new HashMap();
		pledgorParameters.put("pledgorLegalName", "AH TAN");
		pledgorParameters.put("idInfo.idNumber", "88798");

		List securityMessageBodyList = dao
				.searchCollateralByCollateralAndPledgor(securityParameters, pledgorParameters);
		assertNotNull(securityMessageBodyList);
		assertEquals(2, securityMessageBodyList.size());
	}

	public void testSearchCollateralWithOneSecWithoutPledgor() {
		ApprovedSecurity sec = new ApprovedSecurity();

		StandardCode secType = new StandardCode();
		secType.setStandardCodeNumber("31");
		secType.setStandardCodeValue("PT");

		StandardCode secSubType = new StandardCode();
		secSubType.setStandardCodeNumber("54");
		secSubType.setStandardCodeValue("PT701");

		SecurityLocation location = new SecurityLocation();
		location.setLocationCountry("MY");

		sec.setSecurityType(secType);
		sec.setSecuritySubType(secSubType);
		sec.setSecurityLocation(location);

		Long seckey = (Long) getHibernateTemplate().save(sec);
		assertNotNull(seckey);

		SecurityDaoImpl dao = new SecurityDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		Map securityParameters = new HashMap();
		securityParameters.put("securityType.standardCodeValue", "PT");
		securityParameters.put("securitySubType.standardCodeValue", "PT701");
		securityParameters.put("securityLocation.locationCountry", "MY");

		List securityMessageBodyList = dao.searchCollateralByCollateralAndPledgor(securityParameters, null);
		assertNotNull(securityMessageBodyList);
		assertEquals(1, securityMessageBodyList.size());
	}

	public void testSearchNonExistCollateral() {
		SecurityDaoImpl dao = new SecurityDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		Map securityParameters = new HashMap();
		securityParameters.put("securityType.standardCodeValue", "PT");
		securityParameters.put("securitySubType.standardCodeValue", "PT701");
		securityParameters.put("securityLocation.locationCountry", "MY");

		List securityMessageBodyList = dao.searchCollateralByCollateralAndPledgor(securityParameters, null);
		assertNotNull(securityMessageBodyList);
		assertEquals(0, securityMessageBodyList.size());
	}
}

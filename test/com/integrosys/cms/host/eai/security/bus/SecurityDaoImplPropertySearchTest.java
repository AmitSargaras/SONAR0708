package com.integrosys.cms.host.eai.security.bus;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;
import com.integrosys.cms.host.eai.security.bus.property.PropertySecurity;

public class SecurityDaoImplPropertySearchTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-Property.hbm.xml" };
	}

	public void testSearchProperty() {
		PropertySecurity property = new PropertySecurity();
		property.setCMSSecurityId(20081127000111222l);

		StandardCode state = new StandardCode();
		state.setStandardCodeNumber("STATE");
		state.setStandardCodeValue("JH");

		StandardCode district = new StandardCode();
		district.setStandardCodeNumber("DISTRICT");
		district.setStandardCodeValue("JB");

		StandardCode mukim = new StandardCode();
		mukim.setStandardCodeNumber("MUKIM");
		mukim.setStandardCodeValue("Taman Daya");

		StandardCode titleType = new StandardCode();
		titleType.setStandardCodeNumber("TITLE_TYPE");
		titleType.setStandardCodeValue("M");

		property.setState(state);
		property.setDistrict(district);
		property.setMukim(mukim);
		property.setTitleType(titleType);
		property.setTitleNumber("123456");

		Long key = (Long) getHibernateTemplate().save(property);
		assertNotNull(key);

		List cmsCollateralIdList = new ArrayList();
		cmsCollateralIdList.add(key);

		Map propertyParameters = new HashMap();
		propertyParameters.put("state.standardCodeValue", "JH");
		propertyParameters.put("district.standardCodeValue", "JB");
		propertyParameters.put("mukim.standardCodeValue", "Taman Daya");
		propertyParameters.put("titleType.standardCodeValue", "M");
		propertyParameters.put("titleNumber", "123");

		SecurityDaoImpl dao = new SecurityDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		List propertyList = dao.searchPropertyCollaterals(cmsCollateralIdList, propertyParameters);
		assertNotNull(propertyList);
		assertEquals(1, propertyList.size());
	}

	public void testSearchPropertyWithTitleNumberInputOnly() {
		PropertySecurity property = new PropertySecurity();
		property.setCMSSecurityId(20081127000111224l);

		property.setTitleNumber("123456");

		Long key = (Long) getHibernateTemplate().save(property);
		assertNotNull(key);

		List cmsCollateralIdList = new ArrayList();
		cmsCollateralIdList.add(key);

		Map propertyParameters = new HashMap();
		propertyParameters.put("titleNumber", "123");

		SecurityDaoImpl dao = new SecurityDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		List propertyList = dao.searchPropertyCollaterals(cmsCollateralIdList, propertyParameters);
		assertNotNull(propertyList);
		assertEquals(1, propertyList.size());
	}

	public void testSearchTwoProperty() {
		PropertySecurity property = new PropertySecurity();
		property.setCMSSecurityId(20081127000111222l);

		StandardCode state = new StandardCode();
		state.setStandardCodeNumber("STATE");
		state.setStandardCodeValue("JH");

		StandardCode district = new StandardCode();
		district.setStandardCodeNumber("DISTRICT");
		district.setStandardCodeValue("JB");

		StandardCode mukim = new StandardCode();
		mukim.setStandardCodeNumber("MUKIM");
		mukim.setStandardCodeValue("Taman Daya");

		StandardCode titleType = new StandardCode();
		titleType.setStandardCodeNumber("TITLE_TYPE");
		titleType.setStandardCodeValue("M");

		property.setState(state);
		property.setDistrict(district);
		property.setMukim(mukim);
		property.setTitleType(titleType);
		property.setTitleNumber("123456");

		Long key = (Long) getHibernateTemplate().save(property);
		assertNotNull(key);

		List cmsCollateralIdList = new ArrayList();
		cmsCollateralIdList.add(key);

		PropertySecurity property2 = new PropertySecurity();
		property2.setCMSSecurityId(20081127000111223l);

		StandardCode state2 = new StandardCode();
		state2.setStandardCodeNumber("STATE");
		state2.setStandardCodeValue("JH");

		StandardCode district2 = new StandardCode();
		district2.setStandardCodeNumber("DISTRICT");
		district2.setStandardCodeValue("JB");

		StandardCode mukim2 = new StandardCode();
		mukim2.setStandardCodeNumber("MUKIM");
		mukim2.setStandardCodeValue("Taman Daya");

		StandardCode titleType2 = new StandardCode();
		titleType2.setStandardCodeNumber("TITLE_TYPE");
		titleType2.setStandardCodeValue("M");

		property2.setState(state2);
		property2.setDistrict(district2);
		property2.setMukim(mukim2);
		property2.setTitleType(titleType2);
		property2.setTitleNumber("123456789");

		Long key2 = (Long) getHibernateTemplate().save(property2);
		assertNotNull(key2);

		cmsCollateralIdList.add(key2);

		Map propertyParameters = new HashMap();
		propertyParameters.put("state.standardCodeValue", "JH");
		propertyParameters.put("district.standardCodeValue", "JB");
		propertyParameters.put("mukim.standardCodeValue", "Taman Daya");
		propertyParameters.put("titleType.standardCodeValue", "M");
		propertyParameters.put("titleNumber", "123");

		SecurityDaoImpl dao = new SecurityDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		List propertyList = dao.searchPropertyCollaterals(cmsCollateralIdList, propertyParameters);
		assertNotNull(propertyList);
		assertEquals(2, propertyList.size());
	}
}

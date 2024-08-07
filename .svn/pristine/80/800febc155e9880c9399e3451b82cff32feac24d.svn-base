package com.integrosys.cms.host.eai.security.bus.property;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernatePropertyCollateralTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral-Property.hbm.xml" };
	}

	public void testStoreHousePropertyCollateral() {
		PropertySecurity house = new PropertySecurity();
		house.setCMSSecurityId(20080820000000088l);
		house.setBuiltUpArea(new Double(1500d));
		// house.setBuiltUpAreaUOM("SQUARE FEET");

		StandardCode landCat = new StandardCode();
		landCat.setStandardCodeValue("HOUSING");

		house.setCategoryOfLandUse(landCat);

		StandardCode developer = new StandardCode();
		developer.setStandardCodeValue("CAPITAL LAND");
		house.setDeveloperName(developer);

		house.setLandArea(new Double(1600d));
		// house.setLandAreaUOM("SQUARE FEET");
		house.setLotNo("LOT 123/78");
		house.setPostCode("667788l");
		house.setTitleNumber("HS-1234-A-56789");
		house.setRegisteredHolderOwner("DAVID FINN");

		StandardCode propertyUsage = new StandardCode();
		propertyUsage.setStandardCodeValue("RESIDENTIAL");

		house.setPropertyUsage(propertyUsage);

		StandardCode district = new StandardCode();
		district.setStandardCodeValue("JURONG EAST");

		house.setDistrict(district);

		Long id = (Long) getHibernateTemplate().save(house);
		assertNotNull(id);

		PropertySecurity stored = (PropertySecurity) getHibernateTemplate().get(PropertySecurity.class, id);
		assertNull(stored.getCompletionStage().getStandardCodeValue());

	}

}

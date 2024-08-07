package com.integrosys.cms.app.propertyindex.bus;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.math.BigDecimal;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.common.bus.OBBookingLocation;
import com.integrosys.cms.app.limit.bus.FacilityJdbcImpl;
import com.integrosys.cms.app.limit.bus.OBLimitProfile;
import com.integrosys.cms.app.limit.bus.OBLimit;

/**
 * @author Andy Wong
 */
public class PropertyIdxJdbcImplTest extends CustomHibernateTestCase {

	PropertyIdxJdbcImpl jdbc;

	public void setUp() {
		super.setUp();

		jdbc = new PropertyIdxJdbcImpl();
		jdbc.setDataSource(getDataSource());

        OBPropertyIdx propertyIdx = new OBPropertyIdx();
        propertyIdx.setCountryCode("MY");
        propertyIdx.setStatus("ACTIVE");
        propertyIdx.setValDescr("teringajhsdgad");
        propertyIdx.setVersionTime(764126312);

        Set itemSet = new HashSet();
        OBPropertyIdxItem propertyIdxItem = new OBPropertyIdxItem();
        propertyIdxItem.setCmsRefId(64123111);
        propertyIdxItem.setIdxType("YEARLY");
        propertyIdxItem.setIdxValue(new BigDecimal(12.3));
        propertyIdxItem.setIdxYear(new BigDecimal(1999));
        propertyIdxItem.setStateCode("MLK");
        propertyIdxItem.setStatus("ACTIVE");
        itemSet.add(propertyIdxItem);

        Set districtSet = new HashSet();
        OBPropertyIdxDistrict district = new OBPropertyIdxDistrict();
        district.setDistrictCode("BB");
        district.setStatus("PENDING");
        districtSet.add(district);
        district = new OBPropertyIdxDistrict();
        district.setDistrictCode("BG");
        district.setStatus("ACTIVE");
        districtSet.add(district);

        propertyIdxItem.setDistrictList(districtSet);

        Set secSubtypeSet = new HashSet();
        OBPropertyIdxSecSubType secSubType = new OBPropertyIdxSecSubType();
        secSubType.setSecuritySubTypeId("33");
        secSubType.setStatus("ACTIVE");

        propertyIdx.setPropertyIdxItemList(itemSet);
        propertyIdx.setPropertyIdxSecSubTypeList(secSubtypeSet);

        Long id = (Long) getHibernateTemplate().save("actualPropertyIdx", propertyIdx);
		assertNotNull(id);
	}

	public void testIsSecSubTypeValTypeExist() {
		boolean found = jdbc.isSecSubTypeValTypeExist(0, null, "AD");
        assertFalse(found);
    }

	protected String[] getMappingResources() {
		return new String[] { "PropertyIndex.hbm.xml" };
	}
}
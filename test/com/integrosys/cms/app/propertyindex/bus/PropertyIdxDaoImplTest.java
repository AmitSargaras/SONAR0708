package com.integrosys.cms.app.propertyindex.bus;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.time.DateUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.common.bus.OBBookingLocation;
import com.integrosys.cms.app.limit.bus.*;
import com.integrosys.cms.host.stp.bus.OBStpMasterTrans;

/**
 * @author Andy Wong
 */
public class PropertyIdxDaoImplTest extends CustomHibernateTestCase {

    PropertyIdxDaoImpl propertyIdxDao;

    protected String[] getMappingResources() {
        return new String[]{"PropertyIndex.hbm.xml"};
    }

    public void setUp() {
        super.setUp();

        propertyIdxDao = new PropertyIdxDaoImpl();
        propertyIdxDao.setHibernateTemplate(getHibernateTemplate());
    }

    public void testCreatePropertyIdx() {
        OBPropertyIdx propertyIdx = new OBPropertyIdx();
        propertyIdx.setCountryCode("MY");
        propertyIdx.setStatus("ACTIVE");
        propertyIdx.setValDescr("teringajhsdgad");

        Set itemSet = new HashSet();
        OBPropertyIdxItem propertyIdxItem = new OBPropertyIdxItem();
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
        IPropertyIdx lTest = propertyIdxDao.createPropertyIdx("actualPropertyIdx", propertyIdx);

        Set itemTest = (Set) lTest.getPropertyIdxItemList();
        assertNotNull(itemTest);
        OBPropertyIdxItem idxItem = (OBPropertyIdxItem) itemSet.toArray(new OBPropertyIdxItem[0])[0];
        assertEquals(idxItem.getDistrictList().size(), 2);

    }

    public void testStagePropertyIdx() {
        OBPropertyIdx propertyIdx = new OBPropertyIdx();
        propertyIdx.setCountryCode("MY");
        propertyIdx.setStatus("ACTIVE");
        propertyIdx.setValDescr("teringajhsdgad");

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
        IPropertyIdx lTest = propertyIdxDao.createPropertyIdx("stagePropertyIdx", propertyIdx);

        Set itemTest = (Set) lTest.getPropertyIdxItemList();
        assertNotNull(itemTest);
        OBPropertyIdxItem idxItem = (OBPropertyIdxItem) itemSet.toArray(new OBPropertyIdxItem[0])[0];
        assertEquals(idxItem.getDistrictList().size(), 2);

    }

    public void testGetPropertyIdxByPK(){
        OBPropertyIdx propertyIdx = new OBPropertyIdx();
        propertyIdx.setCountryCode("SG");
        propertyIdx.setStatus("ACTIVE");
        propertyIdx.setValDescr("ahgsdadad");
        propertyIdx.setVersionTime(764126313);

        Set itemSet = new HashSet();
        OBPropertyIdxItem propertyIdxItem = new OBPropertyIdxItem();
        propertyIdxItem.setCmsRefId(65123123);
        propertyIdxItem.setIdxType("MONTHLY");
        propertyIdxItem.setIdxValue(new BigDecimal(19.88));
        propertyIdxItem.setIdxYear(new BigDecimal(2008));
        propertyIdxItem.setStateCode("MLK");
        propertyIdxItem.setStatus("ACTIVE");

        Set districtSet = new HashSet();
        OBPropertyIdxDistrict district = new OBPropertyIdxDistrict();
        district.setDistrictCode("NB");
        district.setStatus("PENDING");
        districtSet.add(district);
        district = new OBPropertyIdxDistrict();
        district.setDistrictCode("UU");
        district.setStatus("ACTIVE");
        districtSet.add(district);

        propertyIdxItem.setDistrictList(districtSet);

        Set secSubtypeSet = new HashSet();
        OBPropertyIdxSecSubType secSubType = new OBPropertyIdxSecSubType();
        secSubType.setSecuritySubTypeId("89");
        secSubType.setStatus("ACTIVE");

        propertyIdx.setPropertyIdxItemList(itemSet);
        propertyIdx.setPropertyIdxSecSubTypeList(secSubtypeSet);
        Long id = (Long) getHibernateTemplate().save("actualPropertyIdx", propertyIdx);

        OBPropertyIdx found = (OBPropertyIdx) propertyIdxDao.getPropertyIdx("actualPropertyIdx", id.longValue());
		assertEquals(propertyIdx.getVersionTime(), 764126313);

    }
}
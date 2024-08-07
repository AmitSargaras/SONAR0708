package com.integrosys.cms.app.entitylimit.bus;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.creditriskparam.bus.entitylimit.EntityLimitDaoImpl;
import com.integrosys.cms.app.creditriskparam.bus.entitylimit.IEntityLimit;
import com.integrosys.cms.app.creditriskparam.bus.entitylimit.IEntityLimitDao;
import com.integrosys.cms.app.creditriskparam.bus.entitylimit.OBEntityLimit;

import java.util.Date;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Jul 23, 2010
 * Time: 2:32:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateEntityLimitDaoImplTest extends CustomHibernateTestCase {

    EntityLimitDaoImpl dao;

    public void setUp() {
        super.setUp();

        dao = new EntityLimitDaoImpl();
        dao.setHibernateTemplate(getHibernateTemplate());
        dao.setSessionFactory(getSessionFactory());
    }

    protected String[] getMappingResources() {
        return new String[]{"CreditRiskParam.hbm.xml"};
    }

    public void testFindAll() {
        OBEntityLimit ob = new OBEntityLimit();
        ob.setCommonRef(100);
        ob.setCustIDSource("ABC");
        ob.setCustomerID(200);
        ob.setCustomerName("CHLim");
        ob.setGroupID(400);
        ob.setLEReference("DEF");
        ob.setLimitCurrency("MYR");
        ob.setLimitAmount(new Amount(123.456, "MYR"));
        ob.setLimitLastReviewDate(new Date());
        ob.setStatus("ACTIVE");
        ob.setVersionTime(500);

        Long id = (Long) dao.getHibernateTemplate().save("actualEntityLimit", ob);

        List results = dao.findAll(IEntityLimitDao.ACTUAL_ENTITY_NAME);

        assertNotNull(results);
        assertEquals(1, results.size());
    }

    public void testFindByGroupId() {
        OBEntityLimit ob = new OBEntityLimit();
        ob.setCommonRef(100);
        ob.setCustIDSource("ABC");
        ob.setCustomerID(200);
        ob.setCustomerName("CHLim");
        ob.setGroupID(400);
        ob.setLEReference("DEF");
        ob.setLimitCurrency("MYR");
        ob.setLimitAmount(new Amount(123.456, "MYR"));
        ob.setLimitLastReviewDate(new Date());
        ob.setStatus("ACTIVE");
        ob.setVersionTime(500);

        Long id = (Long) dao.getHibernateTemplate().save("actualEntityLimit", ob);

        List results = dao.findByGroupID(IEntityLimitDao.ACTUAL_ENTITY_NAME, 400);

        assertNotNull(results);
        assertEquals(1, results.size());
    }

    public void testFindBySubProfileId() {
        OBEntityLimit ob = new OBEntityLimit();
        ob.setCommonRef(100);
        ob.setCustIDSource("ABC");
        ob.setCustomerID(200);
        ob.setCustomerName("CHLim");
        ob.setGroupID(400);
        ob.setLEReference("DEF");
        ob.setLimitCurrency("MYR");
        ob.setLimitAmount(new Amount(123.456, "MYR"));
        ob.setLimitLastReviewDate(new Date());
        ob.setStatus("ACTIVE");
        ob.setVersionTime(500);

        Long id = (Long) dao.getHibernateTemplate().save("actualEntityLimit", ob);

        IEntityLimit entityLimit = dao.findBySubProfileID(IEntityLimitDao.ACTUAL_ENTITY_NAME, 200);

        assertNotNull(entityLimit);
        assertEquals(400, entityLimit.getGroupID());
    }

}
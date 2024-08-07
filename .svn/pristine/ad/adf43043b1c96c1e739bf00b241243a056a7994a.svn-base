package com.integrosys.cms.app.internalcreditrating.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.creditriskparam.bus.internalcreditrating.IInternalCreditRatingDao;
import com.integrosys.cms.app.creditriskparam.bus.internalcreditrating.InternalCreditRatingDaoImpl;
import com.integrosys.cms.app.creditriskparam.bus.internalcreditrating.OBInternalCreditRating;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Jul 23, 2010
 * Time: 2:32:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateInternalCreditRatingDaoImplTest extends CustomHibernateTestCase {

    InternalCreditRatingDaoImpl dao;

    public void setUp() {
        super.setUp();

        dao = new InternalCreditRatingDaoImpl();
        dao.setHibernateTemplate(getHibernateTemplate());
        dao.setSessionFactory(getSessionFactory());
    }

    protected String[] getMappingResources() {
		return new String[] { "CreditRiskParam.hbm.xml" };
	}

    public void testFindAll() {
        OBInternalCreditRating OB = new OBInternalCreditRating();
        OB.setGroupId(100);
        OB.setIntCredRatCode("ABC");
        OB.setIntCredRatId(new Long(200));
        OB.setIntCredRatLmtAmt(10.10);
        OB.setIntCredRatLmtAmtCurCode("MY");
        OB.setRefId(200);
        OB.setStatus("ACTIVE");
        OB.setVersionTime(300);

        Long id = (Long) dao.getHibernateTemplate().save("actualInternalCreditRating", OB);
        
        List results = dao.findAll(IInternalCreditRatingDao.ACTUAL_ENTITY_NAME);

        assertNotNull(results);
        assertEquals(1, results.size());
    }

    public void testFindByGroupId() {
        OBInternalCreditRating OB = new OBInternalCreditRating();
        OB.setGroupId(100);
        OB.setIntCredRatCode("ABC");
        OB.setIntCredRatId(new Long(200));
        OB.setIntCredRatLmtAmt(10.10);
        OB.setIntCredRatLmtAmtCurCode("MY");
        OB.setRefId(200);
        OB.setStatus("ACTIVE");
        OB.setVersionTime(300);

        Long id = (Long) dao.getHibernateTemplate().save("actualInternalCreditRating", OB);

        List results = dao.findByGroupId(IInternalCreditRatingDao.ACTUAL_ENTITY_NAME, 100);

        assertNotNull(results);
        assertEquals(1, results.size());
    }

}

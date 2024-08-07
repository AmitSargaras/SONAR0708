package com.integrosys.cms.app.creditriskparam.bus.internallimit;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.creditriskparam.bus.internallimit.OBInternalLimitParameter;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Aug 11, 2010
 * Time: 3:55:15 PM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateInternalLimitDaoImplTest extends CustomHibernateTestCase {

    InternalLimitParameterDaoImpl dao;

     public void setUp() {
        super.setUp();

        dao = new InternalLimitParameterDaoImpl();
        dao.setHibernateTemplate(getHibernateTemplate());
        dao.setSessionFactory(getSessionFactory());
    }

    protected String[] getMappingResources() {
        return new String[] { "CreditRiskParam.hbm.xml" };
    }

    public void testFindAll() {
        OBInternalLimitParameter OB = new OBInternalLimitParameter();

        OB.setId(200L);
        OB.setDescriptionCode("ABC");
        OB.setCapitalFundAmountCurrencyCode("MYR");
        OB.setCapitalFundAmount(Double.parseDouble("30.30"));
        OB.setTotalLoanAdvanceAmountCurrencyCode("MYR");
        OB.setTotalLoanAdvanceAmount(Double.parseDouble("20.20"));
        OB.setGp5LimitPercentage(Double.parseDouble("10.10"));
        OB.setInternalLimitPercentage(Double.parseDouble("100.00"));
        OB.setGroupID(100L);
        OB.setCommonRef(200L);
        OB.setStatus("ACTIVE");
        OB.setVersionTime(300L);

        Long id = (Long) dao.getHibernateTemplate().save("actualInternalLimitParameter", OB);

        List results = dao.findAll(IInternalLimitParameterDao.ACTUAL_ENTITY_NAME);

        assertNotNull(results);
        assertEquals(1, results.size());
    }

    public void testFindByGroupId() {
        OBInternalLimitParameter OB = new OBInternalLimitParameter();

        OB.setId(200L);
        OB.setDescriptionCode("ABC");
        OB.setCapitalFundAmountCurrencyCode("MYR");
        OB.setCapitalFundAmount(Double.parseDouble("30.30"));
        OB.setTotalLoanAdvanceAmountCurrencyCode("MYR");
        OB.setTotalLoanAdvanceAmount(Double.parseDouble("20.20"));
        OB.setGp5LimitPercentage(Double.parseDouble("10.10"));
        OB.setInternalLimitPercentage(Double.parseDouble("100.00"));
        OB.setGroupID(100L);
        OB.setCommonRef(200L);
        OB.setStatus("ACTIVE");
        OB.setVersionTime(300L);

        Long id = (Long) dao.getHibernateTemplate().save("actualInternalLimitParameter", OB);

        List results = dao.findByGroupId(IInternalLimitParameterDao.ACTUAL_ENTITY_NAME, new Long(200));

        assertNotNull(results);
        assertEquals(1, results.size());
    }
}

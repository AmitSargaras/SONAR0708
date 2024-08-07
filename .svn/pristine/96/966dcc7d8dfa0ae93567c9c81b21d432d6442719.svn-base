package com.integrosys.cms.app.creditriskparam.bus.internallimit;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Aug 10, 2010
 * Time: 11:01:33 AM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateInternalLimitTest extends CustomHibernateTestCase {

    private HibernateTemplate hibernateTemplate;

    public void setUp() {
		super.setUp();

		this.hibernateTemplate = new HibernateTemplate(getSessionFactory());
	}

	protected String[] getMappingResources() {
		return new String[] { "CreditRiskParam.hbm.xml" };
	}

    public void testCreateInternalLimitParameter() {

        OBInternalLimitParameter OB = new OBInternalLimitParameter();
        OB.setId(100);
        OB.setCapitalFundAmount(Double.parseDouble("200.00"));
        OB.setInternalLimitPercentage(Double.parseDouble("300.00"));
        OB.setGroupID(Long.parseLong("100"));
        OB.setCapitalFundAmountCurrencyCode("MYR");
        OB.setDescriptionCode("Foo");
        OB.setGp5LimitPercentage(Double.parseDouble("50.39"));
        OB.setTotalLoanAdvanceAmount(Double.parseDouble("1000.00"));
        OB.setTotalLoanAdvanceAmountCurrencyCode("MYR");
        OB.setCommonRef(Long.parseLong("500"));
        OB.setStatus("ACTIVE");
        OB.setVersionTime(300);

        Long id = (Long) hibernateTemplate.save("actualInternalLimitParameter", OB);
        assertNotNull(id);

        OBInternalLimitParameter storedOB = (OBInternalLimitParameter) hibernateTemplate.get("actualInternalLimitParameter", id);
        assertEquals(OB.getGroupID(), storedOB.getGroupID());
        assertEquals(OB.getId(), storedOB.getId());
        assertEquals(OB.getCapitalFundAmount(), storedOB.getCapitalFundAmount(), 0);
        assertEquals(OB.getInternalLimitPercentage(), storedOB.getInternalLimitPercentage(), 0);
        assertEquals(OB.getGroupID(), storedOB.getGroupID());
        assertEquals(OB.getCapitalFundAmountCurrencyCode(), storedOB.getCapitalFundAmountCurrencyCode());
        assertEquals(OB.getDescriptionCode(), storedOB.getDescriptionCode());
        assertEquals(OB.getGp5LimitPercentage(), storedOB.getGp5LimitPercentage(), 0);
        assertEquals(OB.getTotalLoanAdvanceAmount(), storedOB.getTotalLoanAdvanceAmount(), 0);
        assertEquals(OB.getTotalLoanAdvanceAmountCurrencyCode(), storedOB.getTotalLoanAdvanceAmountCurrencyCode());
        assertEquals(OB.getCommonRef(), storedOB.getCommonRef());
        assertEquals(OB.getStatus(), storedOB.getStatus());
        assertEquals(OB.getVersionTime(), storedOB.getVersionTime());
    }
}

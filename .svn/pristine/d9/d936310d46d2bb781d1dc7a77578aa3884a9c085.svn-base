package com.integrosys.cms.app.entitylimit.bus;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.creditriskparam.bus.entitylimit.OBEntityLimit;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Jul 22, 2010
 * Time: 5:55:33 PM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateEntityLimitTest extends CustomHibernateTestCase {

    private HibernateTemplate hibernateTemplate;

    public void setUp() {
		super.setUp();

		this.hibernateTemplate = new HibernateTemplate(getSessionFactory());
	}

	protected String[] getMappingResources() {
		return new String[] { "CreditRiskParam.hbm.xml" };
	}

    public void testCreateInternalCreditRating() {

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

        Long id = (Long) hibernateTemplate.save("actualEntityLimit", ob);
        assertNotNull(id);

        OBEntityLimit storedOB = (OBEntityLimit) hibernateTemplate.get("actualEntityLimit", id);
        assertEquals(ob.getEntityLimitID(), storedOB.getEntityLimitID());
        assertEquals(ob.getLimitAmount().getAmountAsBigDecimal(), storedOB.getLimitAmount().getAmountAsBigDecimal());
    }

}
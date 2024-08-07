package com.integrosys.cms.app.internalcreditrating.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.creditriskparam.bus.internalcreditrating.OBInternalCreditRating;
import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Jul 22, 2010
 * Time: 5:55:33 PM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateInternalCreditRatingTest extends CustomHibernateTestCase {

    private HibernateTemplate hibernateTemplate;

    public void setUp() {
		super.setUp();

		this.hibernateTemplate = new HibernateTemplate(getSessionFactory());
	}

	protected String[] getMappingResources() {
		return new String[] { "CreditRiskParam.hbm.xml" };
	}

    public void testCreateInternalCreditRating() {

        OBInternalCreditRating OB = new OBInternalCreditRating();
        OB.setGroupId(100);
        OB.setIntCredRatCode("ABC");
        OB.setIntCredRatId(new Long(200));
        OB.setIntCredRatLmtAmt(10.10);
        OB.setIntCredRatLmtAmtCurCode("MY");
        OB.setRefId(200);
        OB.setStatus("ACTIVE");
        OB.setVersionTime(300);

        Long id = (Long) hibernateTemplate.save("actualInternalCreditRating", OB);
        assertNotNull(id);

        OBInternalCreditRating storedOB = (OBInternalCreditRating) hibernateTemplate.get("actualInternalCreditRating", id);
        assertEquals(OB.getIntCredRatCode(), storedOB.getIntCredRatCode());
    }

}

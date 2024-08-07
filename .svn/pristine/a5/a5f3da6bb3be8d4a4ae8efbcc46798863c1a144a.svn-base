package com.integrosys.cms.app.bankentitybranch.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.creditriskparam.bus.bankentitybranch.OBBankEntityBranchParam;
import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Jul 22, 2010
 * Time: 5:55:33 PM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateBankEntityBranchTest extends CustomHibernateTestCase {

    private HibernateTemplate hibernateTemplate;

    public void setUp() {
		super.setUp();

		this.hibernateTemplate = new HibernateTemplate(getSessionFactory());
	}

	protected String[] getMappingResources() {
		return new String[] { "CreditRiskParam.hbm.xml" };
	}

    public void testCreateInternalCreditRating() {

        OBBankEntityBranchParam OB = new OBBankEntityBranchParam();
        OB.setBankEntityId(new Long(100));
        OB.setBranchCode("ABC");
        OB.setBranchCodeSrc("ARBS");
        OB.setCmsRefId(200);
        OB.setEntityType("EFG");
        OB.setEntityTypeDesc("EFGEFG");
        OB.setGroupId(new Long(300));
        OB.setStatus("ACTIVE");

        Long id = (Long) hibernateTemplate.save("actualBankEntityBranch", OB);
        assertNotNull(id);

        OBBankEntityBranchParam storedOB = (OBBankEntityBranchParam) hibernateTemplate.get("actualBankEntityBranch", id);
        assertEquals(OB.getBranchCode(), storedOB.getBranchCode());
    }

}

package com.integrosys.cms.app.bankentitybranch.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.creditriskparam.bus.bankentitybranch.BankEntityBranchParamDaoImpl;
import com.integrosys.cms.app.creditriskparam.bus.bankentitybranch.IBankEntityBranchParamDao;
import com.integrosys.cms.app.creditriskparam.bus.bankentitybranch.OBBankEntityBranchParam;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Jul 23, 2010
 * Time: 2:32:21 PM
 * To change this template use File | Settings | File Templates.
 */
public class HibernateBankEntityBranchDaoImplTest extends CustomHibernateTestCase {

    BankEntityBranchParamDaoImpl dao;

    public void setUp() {
        super.setUp();

        dao = new BankEntityBranchParamDaoImpl();
        dao.setHibernateTemplate(getHibernateTemplate());
        dao.setSessionFactory(getSessionFactory());
    }

    protected String[] getMappingResources() {
		return new String[] { "CreditRiskParam.hbm.xml" };
	}

    public void testFindAll() {
        OBBankEntityBranchParam OB = new OBBankEntityBranchParam();
        OB.setBankEntityId(new Long(100));
        OB.setBranchCode("ABC");
        OB.setBranchCodeSrc("ARBS");
        OB.setCmsRefId(200);
        OB.setEntityType("EFG");
        OB.setEntityTypeDesc("EFGEFG");
        OB.setGroupId(new Long(300));
        OB.setStatus("ACTIVE");

        Long id = (Long) dao.getHibernateTemplate().save("actualBankEntityBranch", OB);
        
        List results = dao.findAll(IBankEntityBranchParamDao.ACTUAL_ENTITY_NAME);

        assertNotNull(results);
        assertEquals(1, results.size());
    }

    public void testFindByGroupId() {
        OBBankEntityBranchParam OB = new OBBankEntityBranchParam();
        OB.setBankEntityId(new Long(100));
        OB.setBranchCode("ABC");
        OB.setBranchCodeSrc("ARBS");
        OB.setCmsRefId(200);
        OB.setEntityType("EFG");
        OB.setEntityTypeDesc("EFGEFG");
        OB.setGroupId(new Long(300));
        OB.setStatus("ACTIVE");

        Long id = (Long) dao.getHibernateTemplate().save("actualBankEntityBranch", OB);

        List results = dao.findByGroupId(IBankEntityBranchParamDao.ACTUAL_ENTITY_NAME, 300);

        assertNotNull(results);
        assertEquals(1, results.size());
    }

}

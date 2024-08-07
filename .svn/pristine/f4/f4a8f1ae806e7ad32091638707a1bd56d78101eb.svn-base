package com.integrosys.cms.host.eai.limit.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class LimitDaoImplTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Limit.hbm.xml", "Parameter.hbm.xml", "CommonCode.hbm.xml" };
	}

	public void testRetrieveAccountTypeByProductTypeAndFacilityType() {
		LimitDaoImpl dao = new LimitDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		getJdbcTemplate().update(
				"insert into host_facility_type (facility_code, account_type, status) values (?, ?, ?)",
				new Object[] { "HP", "O", "ACTIVE" });

		getJdbcTemplate().update(
				"insert into host_product_type (source, loan_type, currency, status) values (?, ?, ?, ?)",
				new Object[] { "LNPAR2", "SHARK", "MYR", "ACTIVE" });

		getJdbcTemplate().update(
				"insert into common_code_category_entry "
						+ "(entry_id, version_time, category_code, active_status, entry_code, ref_entry_code) "
						+ "values (?, ?, ?, ?, ?, ?)",
				new Object[] { new Long(1000), new Long(1), "FAC_PRODUCT_MAP", "1", "SHARK", "HP" });

		String accountType = dao.getAccountTypeByLimitProductTypeAndFacilityType("SHARK", "HP");
		assertEquals("O", accountType);
	}

	public void testRetrieveNonAccountTypeByProductTypeAndFacilityType() {
		LimitDaoImpl dao = new LimitDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		String accountType = dao.getAccountTypeByLimitProductTypeAndFacilityType("SHARK", "HP");
		assertNull(accountType);
	}
}

package com.integrosys.cms.batch.mimb.customer;

import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class HibernateMIMBCustomerTest extends CustomHibernateTestCase {

	private HibernateTemplate hibernateTemplate;

	private JdbcTemplate jdbcTemplate;

	public void setUp() {
		super.setUp();

		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}

	protected String[] getMappingResources() {
		return new String[] { "Batch-Feed-MIMB.hbm.xml" };
	}

	public void testReport() {
		Date todayDate = new Date();

		ICustomerInfo customerInfo = new OBCustomerInfo();
		customerInfo.setAaNo("aa");
		customerInfo.setAddress1("cv");
		customerInfo.setAddress2("kk");
		customerInfo.setAddress3("qq");
		customerInfo.setAddress4("pp");
		customerInfo.setAddressType("oo");
		customerInfo.setCifNo("ll");
		customerInfo.setCountry("jj");
		customerInfo.setCustomerLegalCons("ss");
		customerInfo.setCustomerLegalConsDes("ff");
		customerInfo.setCustomerName("tt");
		customerInfo.setCustomerTypeCode("tg");
		customerInfo.setCustomerTypeDes("er");
		customerInfo.setIdNo("sd");
		customerInfo.setIdType("po");
		customerInfo.setLegalName("vc");
		customerInfo.setRecordType("mn");
		customerInfo.setRelationshipStartDate(todayDate);

		Long id = (Long) hibernateTemplate.save("actualOBCustomerInfo", customerInfo);
		assertNotNull(id);

		int count = jdbcTemplate.queryForInt("select count(*) from SI_TEMP_MIMB_CU002");
		assertEquals(1, count);

		OBCustomerInfo storedcustomerInfo = (OBCustomerInfo) hibernateTemplate.get("actualOBCustomerInfo", id);

		assertEquals("aa", storedcustomerInfo.getAaNo());
		assertEquals("cv", storedcustomerInfo.getAddress1());
		assertEquals("kk", storedcustomerInfo.getAddress2());
		assertEquals("qq", storedcustomerInfo.getAddress3());
		assertEquals("pp", storedcustomerInfo.getAddress4());
		assertEquals("oo", storedcustomerInfo.getAddressType());
		assertEquals("ll", storedcustomerInfo.getCifNo());
		assertEquals("jj", storedcustomerInfo.getCountry());
		assertEquals("ss", storedcustomerInfo.getCustomerLegalCons());
		assertEquals("ff", storedcustomerInfo.getCustomerLegalConsDes());
		assertEquals("tt", storedcustomerInfo.getCustomerName());
		assertEquals("tg", storedcustomerInfo.getCustomerTypeCode());
		assertEquals("er", storedcustomerInfo.getCustomerTypeDes());
		assertEquals("sd", storedcustomerInfo.getIdNo());
		assertEquals("po", storedcustomerInfo.getIdType());
		assertEquals("vc", storedcustomerInfo.getLegalName());
		assertEquals("mn", storedcustomerInfo.getRecordType());
		assertEquals(todayDate, storedcustomerInfo.getRelationshipStartDate());

	}

}

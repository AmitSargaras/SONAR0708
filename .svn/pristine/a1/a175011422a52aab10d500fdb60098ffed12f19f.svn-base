package com.integrosys.cms.host.eai.customer.bus;

import java.util.Date;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.CreditGrade;
import com.integrosys.cms.host.eai.StandardCode;

/**
 * Test case for hibernate mapping of customer module
 * 
 * @author Chong Jun Yong
 * 
 */
public class HibernateCustomerTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Customer.hbm.xml" };
	}

	public void testStoreMainProfile() {
		MainProfile mainProfile = new MainProfile();
		mainProfile.setCIFId("RLOS-00001");
		mainProfile.setSource("RLOS");
		mainProfile.setCustomerNameLong("Integro Technologies Pte Ltd");
		mainProfile.setCountry("SG");
		mainProfile.setIdNo("S1234567");
		mainProfile.setJDOCustomerStartDate(new Date());

		StandardCode segmentSc = new StandardCode();
		segmentSc.setStandardCodeNumber("CUST_SEGMENT");
		segmentSc.setStandardCodeValue("PTE_LTD");
		segmentSc.setStandardCodeDescription("Private Limited");

		mainProfile.setCustomerSegment(segmentSc);

		Long id = (Long) getHibernateTemplate().save(mainProfile);
		assertNotNull(id);

		MainProfile storedMainProfile = (MainProfile) getHibernateTemplate().get(MainProfile.class, id);
		assertEquals("PTE_LTD", storedMainProfile.getCustomerSegment().getStandardCodeValue());
		assertEquals("RLOS-00001", storedMainProfile.getCIFId());
	}

	public void testStoreSubProfile() {
		SubProfile subProfile = new SubProfile();
		subProfile.setCifId("RLOS-00001");
		subProfile.setNonBorrowerIndicator('N');
		subProfile.setSubProfileName("Integro Tech");

		Long id = (Long) getHibernateTemplate().save(subProfile);
		assertNotNull(id);

		SubProfile storedSubProfile = (SubProfile) getHibernateTemplate().get(SubProfile.class, id);
		assertNotNull(storedSubProfile);
		assertEquals("RLOS-00001", storedSubProfile.getCifId());
	}

	public void testStoreAddress() {
		CustomerAddress address = new CustomerAddress();
		address.setCIFId("RLOS-00001");
		address.setAddress1("1 Lorong 1, Toa Payoh, Yellow Pages Building");

		Long id = (Long) getHibernateTemplate().save(address);
		assertNotNull(id);

		CustomerAddress storedAddress = (CustomerAddress) getHibernateTemplate().get(CustomerAddress.class, id);
		assertTrue(storedAddress.getAddress1().indexOf("Yellow Pages") >= 0);
	}

	public void testStoreCreditGrade() {
		CreditGrade creditGrade = new CreditGrade();
		creditGrade.setCIFId("RLOS-00001");

		StandardCode type = new StandardCode();
		type.setStandardCodeNumber("CREDIT_GRADE_TYPE");
		type.setStandardCodeValue("STD_POOR");

		StandardCode code = new StandardCode();
		code.setStandardCodeNumber("CREDIT_GRADE_CODE");
		code.setStandardCodeValue("AB");

		creditGrade.setCreditGradeType(type);
		creditGrade.setCreditGradeCode(code);

		creditGrade.setChangeIndicator("Y");
		creditGrade.setUpdateStatusIndicator("I");

		Long id = (Long) getHibernateTemplate().save(creditGrade);
		assertNotNull(id);

		CreditGrade storedCreditGrade = (CreditGrade) getHibernateTemplate().get(CreditGrade.class, id);
		assertNotNull(storedCreditGrade.getCreditGradeType());
		assertEquals("STD_POOR", storedCreditGrade.getCreditGradeType().getStandardCodeValue());
	}

}

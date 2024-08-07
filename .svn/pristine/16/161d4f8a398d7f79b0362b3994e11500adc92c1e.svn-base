package com.integrosys.cms.host.eai.customer.bus;

import java.util.Date;
import java.util.List;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;

public class CustomerDaoImplTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Customer.hbm.xml" };
	}

	public void testStoreAndRetrieveWithOneCustomerIdInfoFullInput() {
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

		CustomerIdInfo idInfo1 = new CustomerIdInfo();
		idInfo1.setCountryIssued("SG");
		idInfo1.setIdNumber("SG-12345");
		idInfo1.setJDOIdStartDate(new Date());

		StandardCode idType = new StandardCode();
		idType.setStandardCodeNumber("ID_TYPE");
		idType.setStandardCodeValue("BR");

		idInfo1.setIdType(idType);

		mainProfile.setIdInfo1(idInfo1);

		StandardCode customerClass = new StandardCode();
		customerClass.setStandardCodeNumber("56");
		customerClass.setStandardCodeValue("IT");

		mainProfile.setCustomerClass(customerClass);

		StandardCode customerType = new StandardCode();
		customerClass.setStandardCodeNumber("8");
		customerClass.setStandardCodeValue("C");

		mainProfile.setCustomerType(customerType);

		getHibernateTemplate().save(mainProfile);

		CustomerDaoImpl dao = new CustomerDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		List customerList = dao.searchCustomerByCustomerIdInfo(idInfo1);
		assertEquals(1, customerList.size());
	}

	public void testStoreAndRetrieveWithOneCustomerIdInfoPartialInput() {
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

		CustomerIdInfo idInfo1 = new CustomerIdInfo();
		idInfo1.setIdNumber("SG-12345");
		idInfo1.setJDOIdStartDate(new Date());

		StandardCode idType = new StandardCode();
		idType.setStandardCodeNumber("ID_TYPE");
		idType.setStandardCodeValue("BR");

		idInfo1.setIdType(idType);

		mainProfile.setIdInfo1(idInfo1);

		StandardCode customerClass = new StandardCode();
		customerClass.setStandardCodeNumber("56");
		customerClass.setStandardCodeValue("IT");

		mainProfile.setCustomerClass(customerClass);

		StandardCode customerType = new StandardCode();
		customerClass.setStandardCodeNumber("8");
		customerClass.setStandardCodeValue("C");

		mainProfile.setCustomerType(customerType);

		getHibernateTemplate().save(mainProfile);

		CustomerDaoImpl dao = new CustomerDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		List customerList = dao.searchCustomerByCustomerIdInfo(idInfo1);
		assertEquals(1, customerList.size());
	}

	public void testStoreAndRetrieveWithTwoCustomerIdInfoFullInput() {
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

		CustomerIdInfo idInfo1 = new CustomerIdInfo();
		idInfo1.setCountryIssued("SG");
		idInfo1.setIdNumber("SG-12345");
		idInfo1.setJDOIdStartDate(new Date());

		StandardCode idType = new StandardCode();
		idType.setStandardCodeNumber("ID_TYPE");
		idType.setStandardCodeValue("BR");

		idInfo1.setIdType(idType);

		mainProfile.setIdInfo1(idInfo1);

		CustomerIdInfo idInfo2 = new CustomerIdInfo();
		idInfo2.setCountryIssued("MY");
		idInfo2.setIdNumber("MY-12345");
		idInfo2.setJDOIdStartDate(new Date());

		StandardCode idType2 = new StandardCode();
		idType2.setStandardCodeNumber("ID_TYPE");
		idType2.setStandardCodeValue("BR");

		idInfo2.setIdType(idType2);

		mainProfile.setIdInfo2(idInfo2);

		StandardCode customerClass = new StandardCode();
		customerClass.setStandardCodeNumber("56");
		customerClass.setStandardCodeValue("IT");

		mainProfile.setCustomerClass(customerClass);

		StandardCode customerType = new StandardCode();
		customerClass.setStandardCodeNumber("8");
		customerClass.setStandardCodeValue("C");

		mainProfile.setCustomerType(customerType);

		getHibernateTemplate().save(mainProfile);

		CustomerDaoImpl dao = new CustomerDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		List customerList = dao.searchCustomerByCustomerIdInfo(idInfo1);
		assertEquals(1, customerList.size());

		customerList = dao.searchCustomerByCustomerIdInfo(idInfo2);
		assertEquals(1, customerList.size());
	}

	public void testStoreAndRetrieveWithCustomerIdInfoShortCustomerNameInput() {
		MainProfile mainProfile = new MainProfile();
		mainProfile.setCIFId("RLOS-00001");
		mainProfile.setSource("RLOS");
		mainProfile.setCustomerNameLong("Integro Technologies Pte Ltd");
		mainProfile.setCustomerNameShort("INTEGRO");
		mainProfile.setCountry("SG");
		mainProfile.setIdNo("S1234567");
		mainProfile.setJDOCustomerStartDate(new Date());

		StandardCode segmentSc = new StandardCode();
		segmentSc.setStandardCodeNumber("CUST_SEGMENT");
		segmentSc.setStandardCodeValue("PTE_LTD");
		segmentSc.setStandardCodeDescription("Private Limited");

		mainProfile.setCustomerSegment(segmentSc);

		CustomerIdInfo idInfo1 = new CustomerIdInfo();
		idInfo1.setCountryIssued("SG");
		idInfo1.setIdNumber("SG-12345");
		idInfo1.setJDOIdStartDate(new Date());

		StandardCode idType = new StandardCode();
		idType.setStandardCodeNumber("ID_TYPE");
		idType.setStandardCodeValue("BR");

		idInfo1.setIdType(idType);

		mainProfile.setIdInfo1(idInfo1);

		StandardCode customerClass = new StandardCode();
		customerClass.setStandardCodeNumber("56");
		customerClass.setStandardCodeValue("IT");

		mainProfile.setCustomerClass(customerClass);

		StandardCode customerType = new StandardCode();
		customerClass.setStandardCodeNumber("8");
		customerClass.setStandardCodeValue("C");

		mainProfile.setCustomerType(customerType);

		Long id = (Long) getHibernateTemplate().save(mainProfile);
		mainProfile.setCmsId(id.longValue());

		CustomerDaoImpl dao = new CustomerDaoImpl();
		dao.setHibernateTemplate(getHibernateTemplate());

		List customerList = dao.searchCustomerByCustomerIdInfoAndShortNameAndCifSource(idInfo1, "INTEGRO", null,
				"RLOS-00001");
		assertEquals(1, customerList.size());

		mainProfile.setSource("SCI");
		getHibernateTemplate().update(mainProfile);

		customerList = dao.searchCustomerByCustomerIdInfoAndShortNameAndCifSource(idInfo1, "INTEGRO", "SCI",
				"RLOS-00001");
		assertEquals(1, customerList.size());

		mainProfile.setCIFId("RLOS-00002");
		getHibernateTemplate().update(mainProfile);

		customerList = dao.searchCustomerByCustomerIdInfoAndShortNameAndCifSource(idInfo1, "INTEGRO", "SCI",
				"RLOS-00001");
		assertEquals(0, customerList.size());

		customerList = dao.searchCustomerByCustomerIdInfoAndShortNameAndCifSource(idInfo1, "INTEGRO", "SCI",
				"RLOS-00002");
		assertEquals(1, customerList.size());

	}
}

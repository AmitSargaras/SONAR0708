package com.integrosys.base.techinfra.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;
import java.util.TreeSet;
import java.util.Vector;

import junit.framework.TestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class ReplicateUtilsTest extends TestCase {

	public void testSimpleBean() {
		SimpleBean bean = new SimpleBean();
		bean.setId(1234);
		bean.setName("Chong Jun Yong");
		bean.setDate(new Date());

		SimpleBean newBean = (SimpleBean) ReplicateUtils.replicateObject(bean, new String[] { "id" });
		assertTrue("should not be the same value", bean.getId() != newBean.getId());
		assertEquals(bean.getName(), newBean.getName());
		assertEquals(bean.getDate(), newBean.getDate());
	}

	public void testSimpleBeanWithSet() {
		AnotherSimpleBean bean = new AnotherSimpleBean();
		bean.setId(4321);
		bean.setName("Chong Jun Yong");
		bean.setDate(new Date());

		Set addressSet = new HashSet();
		SimpleAddress address = new SimpleAddress();
		address.setId(5678);
		address.setHouseNo("29-A");
		address.setStreetNo("Jalan Raja Chulan");
		address.setPostCode(12345);
		addressSet.add(address);

		bean.setAddressSet(addressSet);

		AnotherSimpleBean newBean = (AnotherSimpleBean) ReplicateUtils.replicateObject(bean, new String[] { "id" });
		assertTrue("should not be the same value", bean.getId() != newBean.getId());
		assertEquals(bean.getName(), newBean.getName());
		assertEquals(bean.getDate(), newBean.getDate());
		assertNull(newBean.getAddressSet());

		Set newAddressSet = (Set) ReplicateUtils.replicateCollectionObject(bean.getAddressSet(), new String[] { "id" });
		SimpleAddress[] newSimpleAddress = (SimpleAddress[]) newAddressSet.toArray(new SimpleAddress[0]);
		assertTrue("should not be the same value", newSimpleAddress[0].getId() != address.getId());
		assertEquals(address.getHouseNo(), newSimpleAddress[0].getHouseNo());
		assertEquals(address.getStreetNo(), newSimpleAddress[0].getStreetNo());
	}

	public void testSimpleBeanWithSetAndList() {
		AnotherSimpleBean bean = new AnotherSimpleBean();
		bean.setId(4321);
		bean.setName("Chong Jun Yong");
		bean.setDate(new Date());

		Set addressSet = new HashSet();
		SimpleAddress address = new SimpleAddress();
		address.setId(5678);
		address.setHouseNo("29-A");
		address.setStreetNo("Jalan Raja Chulan");
		address.setPostCode(12345);
		addressSet.add(address);

		bean.setAddressSet(addressSet);

		List contactList = new ArrayList();
		SimpleContact contact = new SimpleContact();
		contact.setId(1234);
		contact.setNumber(69607330);
		contact.setCountryCode(65);
		contactList.add(contact);

		bean.setContactList(contactList);

		AnotherSimpleBean newBean = (AnotherSimpleBean) ReplicateUtils.replicateObject(bean, new String[] { "id" });
		assertTrue("should not be the same value", bean.getId() != newBean.getId());
		assertEquals(bean.getName(), newBean.getName());
		assertEquals(bean.getDate(), newBean.getDate());
		assertNull(newBean.getAddressSet());
		assertNull(newBean.getContactList());

		Set newAddressSet = (Set) ReplicateUtils.replicateCollectionObject(bean.getAddressSet(), new String[] { "id" });
		SimpleAddress[] newSimpleAddress = (SimpleAddress[]) newAddressSet.toArray(new SimpleAddress[0]);
		assertTrue("should not be the same value", newSimpleAddress[0].getId() != address.getId());
		assertEquals(address.getHouseNo(), newSimpleAddress[0].getHouseNo());
		assertEquals(address.getStreetNo(), newSimpleAddress[0].getStreetNo());

		List newContactList = (List) ReplicateUtils.replicateCollectionObject(bean.getContactList(),
				new String[] { "id" });
		SimpleContact[] newSimpleContacts = (SimpleContact[]) newContactList.toArray(new SimpleContact[0]);
		assertTrue("should not be the same value", newSimpleContacts[0].getId() != contact.getId());
		assertEquals(contact.getCountryCode(), newSimpleContacts[0].getCountryCode());
		assertEquals(contact.getNumber(), newSimpleContacts[0].getNumber());

	}

	public void testComplextBean() {
		SimpleBean simpleBean = new SimpleBean();
		simpleBean.setId(1234);
		simpleBean.setDate(new Date());
		simpleBean.setName("Chong Jun Yong");

		ComplexBean bean = new ComplexBean();
		bean.setSimpleBean(simpleBean);
		bean.setNumberOfBeans(10);
		bean.setType("COMPLEX");
		bean.setPocketMoney(new BigDecimal(50.50d));

		ComplexBean newBean = (ComplexBean) ReplicateUtils.replicateObject(bean, null);
		assertNull(newBean.getSimpleBean());
		assertEquals(bean.getType(), newBean.getType());
		assertEquals(bean.getNumberOfBeans(), newBean.getNumberOfBeans());
		assertNotNull(newBean.getPocketMoney());

		newBean.setSimpleBean((SimpleBean) ReplicateUtils.replicateObject(bean.getSimpleBean(), new String[] { "id" }));
		assertNotNull(newBean.getSimpleBean());
		assertTrue("should not be the same value", newBean.getSimpleBean().getId() != simpleBean.getId());
		assertEquals(simpleBean.getDate(), newBean.getSimpleBean().getDate());
		assertEquals(simpleBean.getName(), newBean.getSimpleBean().getName());
	}

	public void testDifferentTypeOfList() {
		List contactList = new LinkedList();
		SimpleContact contact = new SimpleContact();
		contact.setId(1234);
		contact.setNumber(69607330);
		contact.setCountryCode(65);
		contactList.add(contact);

		List newContactList = (List) ReplicateUtils.replicateCollectionObject(contactList, null);
		assertEquals(LinkedList.class, newContactList.getClass());

		contactList = new Vector();
		contactList.add(contact);

		newContactList = (List) ReplicateUtils.replicateCollectionObject(contactList, null);
		assertEquals(Vector.class, newContactList.getClass());

		contactList = new Stack();
		contactList.add(contact);

		newContactList = (List) ReplicateUtils.replicateCollectionObject(contactList, null);
		assertEquals(Stack.class, newContactList.getClass());
	}

	public void testDifferentTypeOfSet() {
		Set contactSet = new LinkedHashSet();
		SimpleContact contact = new SimpleContact();
		contact.setId(1234);
		contact.setNumber(69607330);
		contact.setCountryCode(65);
		contactSet.add(contact);

		Set newContactList = (Set) ReplicateUtils.replicateCollectionObject(contactSet, null);
		assertEquals(LinkedHashSet.class, newContactList.getClass());

		contactSet = new TreeSet();
		contactSet.add(contact);

		newContactList = (Set) ReplicateUtils.replicateCollectionObject(contactSet, null);
		assertEquals(TreeSet.class, newContactList.getClass());
	}

	public void testPreparePropertiesNameTypeMap() {
		Map propertiesNameTypeMap = ReplicateUtils.preparePropertiesNameTypeMap(AnotherSimpleBean.class);

		assertTrue("should have 'date' property", propertiesNameTypeMap.containsKey("date"));
		assertTrue("should have 'contactList' property", propertiesNameTypeMap.containsKey("contactList"));
		assertTrue("should have 'addressSet' property", propertiesNameTypeMap.containsKey("addressSet"));
	}

	public void testGetAllCollectionTypedPropertyNames() {
		Map propertiesNameTypeMap = ReplicateUtils.preparePropertiesNameTypeMap(AnotherSimpleBean.class);

		String[] collectionTypedPropertyNames = ReplicateUtils
				.getAllCollectionTypedPropertyNames(propertiesNameTypeMap);
		Arrays.sort(collectionTypedPropertyNames);

		assertTrue("should have 'contactList' property", Arrays.binarySearch(collectionTypedPropertyNames,
				"contactList") >= 0);
		assertTrue("should have 'addressSet' property",
				Arrays.binarySearch(collectionTypedPropertyNames, "addressSet") >= 0);
		assertTrue("should not have 'date' property", Arrays.binarySearch(collectionTypedPropertyNames, "date") < 0);
	}

	public void testGetAllNonPrimitiveAndNonCollectionTypedPropertyNames() {
		Map propertiesNameTypeMap = ReplicateUtils.preparePropertiesNameTypeMap(AnotherSimpleBean.class);

		String[] collectionTypedPropertyNames = ReplicateUtils.getAllNonPrimitiveAndNonCollectionTypedPropertyNames(
				propertiesNameTypeMap, null);
		Arrays.sort(collectionTypedPropertyNames);

		assertTrue("should not have 'contactList' property", Arrays.binarySearch(collectionTypedPropertyNames,
				"contactList") < 0);
		assertTrue("should not have 'addressSet' property", Arrays.binarySearch(collectionTypedPropertyNames,
				"addressSet") < 0);
		assertTrue("should have 'date' property", Arrays.binarySearch(collectionTypedPropertyNames, "date") >= 0);
	}
}

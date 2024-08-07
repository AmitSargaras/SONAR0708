package com.integrosys.base.techinfra.util;

import java.util.HashSet;
import java.util.Set;

import junit.framework.TestCase;

public class EntityAssociationUtilsTest extends TestCase {

	public void testRetrieveRemovedOneObjectsCollection() {
		Set addressSet = new HashSet();
		Set mergedSet = new HashSet();

		SimpleAddress address = new SimpleAddress();
		address.setId(12345l);
		address.setHouseNo("29");
		address.setPostCode(81100);
		address.setStreetNo("Jalan Rumbia 80");

		addressSet.add(address);
		mergedSet.add(address);

		address = new SimpleAddress();
		address.setId(789l);
		address.setHouseNo("16");
		address.setPostCode(81100);
		address.setStreetNo("Jalan Rumbia 79");

		addressSet.add(address);

		Set removedSet = (Set) EntityAssociationUtils.retrieveRemovedObjectsCollection(addressSet, mergedSet,
				new String[] { "id" });
		assertNotNull(removedSet);
		assertEquals(1, removedSet.size());

		SimpleAddress removedAddress = ((SimpleAddress[]) removedSet.toArray(new SimpleAddress[0]))[0];
		assertEquals("16", removedAddress.getHouseNo());
		assertEquals("Jalan Rumbia 79", removedAddress.getStreetNo());
	}

	public void testRetrieveRemovedAllObjectsCollection() {
		Set addressSet = new HashSet();

		SimpleAddress address = new SimpleAddress();
		address.setId(12345l);
		address.setHouseNo("29");
		address.setPostCode(81100);
		address.setStreetNo("Jalan Rumbia 80");

		addressSet.add(address);

		address = new SimpleAddress();
		address.setId(789l);
		address.setHouseNo("16");
		address.setPostCode(81100);
		address.setStreetNo("Jalan Rumbia 79");

		addressSet.add(address);

		Set removedSet = (Set) EntityAssociationUtils.retrieveRemovedObjectsCollection(addressSet, null,
				new String[] { "id" });
		assertNotNull(removedSet);
		assertEquals(2, removedSet.size());

	}

	public void testSyncCollectionUsingNonExistentPropertyOfBean() {
		Set addressSet = new HashSet();

		SimpleAddress address = new SimpleAddress();
		address.setId(12345l);
		address.setHouseNo("29");
		address.setPostCode(81100);
		address.setStreetNo("Jalan Rumbia 80");

		addressSet.add(address);

		address = new SimpleAddress();
		address.setId(789l);
		address.setHouseNo("16");
		address.setPostCode(81100);
		address.setStreetNo("Jalan Rumbia 79");

		addressSet.add(address);

		try {
			EntityAssociationUtils.synchronizeCollectionsByProperties(null, addressSet, new String[] { "id" },
					new String[] { "nonExistentField" });
			fail("should have throw illegal state exception due 'nonExistent' is not in the simple address bean.");
		}
		catch (Exception e) {
			assertTrue(e instanceof IllegalStateException);
		}

	}
}

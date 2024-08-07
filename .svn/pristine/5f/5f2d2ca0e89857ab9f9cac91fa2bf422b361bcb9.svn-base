package com.integrosys.cms.app.feed.bus.unittrust;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

/**
 * Test Case for {@link UnitTrustDaoImpl}
 * 
 * @author Chong Jun Yong
 * @since 1.1
 */
public class UnitTrustDaoImplTest extends CustomHibernateTestCase {

	UnitTrustDaoImpl dao;

	public void setUp() {
		super.setUp();

		dao = new UnitTrustDaoImpl();
		dao.setSessionFactory(getSessionFactory());
	}

	public void testCreateActualUnitTrustFeedGroup() {
		OBUnitTrustFeedEntry[] feedEntries = new OBUnitTrustFeedEntry[2];
		feedEntries[0] = new OBUnitTrustFeedEntry();
		feedEntries[0].setFundManagerCode("JC1");
		feedEntries[0].setFundManagerName("Jay Chow");
		feedEntries[0].setCurrencyCode("MYR");
		feedEntries[0].setName("Public Mutual Fund A");
		feedEntries[0].setRic("PMF.001");

		feedEntries[1] = new OBUnitTrustFeedEntry();
		feedEntries[1].setFundManagerCode("JC2");
		feedEntries[1].setFundManagerName("John Chow");
		feedEntries[1].setCurrencyCode("MYR");
		feedEntries[1].setName("Public Mutual Fund B");
		feedEntries[1].setRic("PMF.002");

		OBUnitTrustFeedGroup group = new OBUnitTrustFeedGroup();
		group.setType("UNIT_TRUST");
		group.setSubType("MY");
		group.setFeedEntries(feedEntries);

		dao.createUnitTrustFeedGroup(IUnitTrustDao.ACTUAL_UNIT_TRUST_FEED_GROUP_ENTITY_NAME, group);
		IUnitTrustFeedGroup storedGroup = dao.getUnitTrustFeedGroupByTypeAndSubType(
				IUnitTrustDao.ACTUAL_UNIT_TRUST_FEED_GROUP_ENTITY_NAME, "UNIT_TRUST", "MY");

		assertNotNull(storedGroup);
		assertTrue("should have '2' unit trust feed entries", storedGroup.getFeedEntries().length == 2);
	}
	
	public void testCreateStagingUnitTrustFeedGroup() {
		OBUnitTrustFeedEntry[] feedEntries = new OBUnitTrustFeedEntry[2];
		feedEntries[0] = new OBUnitTrustFeedEntry();
		feedEntries[0].setFundManagerCode("JC1");
		feedEntries[0].setFundManagerName("Jay Chow");
		feedEntries[0].setCurrencyCode("MYR");
		feedEntries[0].setName("Public Mutual Fund A");
		feedEntries[0].setRic("PMF.001");

		feedEntries[1] = new OBUnitTrustFeedEntry();
		feedEntries[1].setFundManagerCode("JC2");
		feedEntries[1].setFundManagerName("John Chow");
		feedEntries[1].setCurrencyCode("MYR");
		feedEntries[1].setName("Public Mutual Fund B");
		feedEntries[1].setRic("PMF.002");

		OBUnitTrustFeedGroup group = new OBUnitTrustFeedGroup();
		group.setType("UNIT_TRUST");
		group.setSubType("MY");
		group.setFeedEntries(feedEntries);

		dao.createUnitTrustFeedGroup(IUnitTrustDao.STAGE_UNIT_TRUST_FEED_GROUP_ENTITY_NAME, group);
		IUnitTrustFeedGroup storedGroup = dao.getUnitTrustFeedGroupByTypeAndSubType(
				IUnitTrustDao.ACTUAL_UNIT_TRUST_FEED_GROUP_ENTITY_NAME, "UNIT_TRUST", "MY");

		assertNull(storedGroup);
		
		storedGroup = dao.getUnitTrustFeedGroupByTypeAndSubType(
				IUnitTrustDao.STAGE_UNIT_TRUST_FEED_GROUP_ENTITY_NAME, "UNIT_TRUST", "MY");
		
		assertNotNull(storedGroup);
		assertTrue("should have '2' unit trust feed entries", storedGroup.getFeedEntries().length == 2);
	}

	protected String[] getMappingResources() {
		return new String[] { "Feed-UnitTrust.hbm.xml" };
	}

}

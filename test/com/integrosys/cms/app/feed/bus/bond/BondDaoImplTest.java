package com.integrosys.cms.app.feed.bus.bond;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

/**
 * Test Case for {@link BondDaoImpl}
 * 
 * @author Chong Jun Yong
 * @since 1.1
 */
public class BondDaoImplTest extends CustomHibernateTestCase {

	BondDaoImpl dao;

	public void setUp() {
		super.setUp();

		dao = new BondDaoImpl();
		dao.setSessionFactory(getSessionFactory());
	}

	protected String[] getMappingResources() {
		return new String[] { "Feed-Bond.hbm.xml" };
	}

	public void testCreateActualBondFeedGroupUsingArray() {
		OBBondFeedEntry[] feedEntries = new OBBondFeedEntry[1];
		feedEntries[0] = new OBBondFeedEntry();
		feedEntries[0].setCurrencyCode("MYR");
		feedEntries[0].setName("Msia Gov Bond 3.5%");
		feedEntries[0].setEffectiveDateOfIssueRating(new Date());
		feedEntries[0].setUnitPrice(3.51);

		OBBondFeedGroup group = new OBBondFeedGroup();
		group.setFeedEntries(feedEntries);

		IBondFeedGroup pkSetGroup = dao.createBondFeedGroup(IBondDao.ACTUAL_BOND_FEED_GROUP_ENTITY_NAME, group);
		assertTrue("pk should be greater than 0", pkSetGroup.getBondFeedGroupID() > 0);

		IBondFeedGroup storedGroup = dao.getBondFeedGroupByPrimaryKey(IBondDao.ACTUAL_BOND_FEED_GROUP_ENTITY_NAME,
				new Long(pkSetGroup.getBondFeedGroupID()));
		assertNotNull(storedGroup);
		assertTrue("should have only 1 feed entry", storedGroup.getFeedEntries().length == 1);

		assertEquals("Msia Gov Bond 3.5%", storedGroup.getFeedEntries()[0].getName());
		assertEquals(feedEntries[0].getEffectiveDateOfIssueRating(), storedGroup.getFeedEntries()[0]
				.getEffectiveDateOfIssueRating());

	}

	public void testCreateStagingBondFeedGroupUsingSet() {
		OBBondFeedEntry feedEntry = new OBBondFeedEntry();
		feedEntry.setCurrencyCode("MYR");
		feedEntry.setName("Msia Gov Bond 3.5%");
		feedEntry.setEffectiveDateOfIssueRating(new Date());
		feedEntry.setUnitPrice(3.51);

		Set feedEntriesSet = new HashSet();
		feedEntriesSet.add(feedEntry);

		OBBondFeedGroup group = new OBBondFeedGroup();
		group.setFeedEntriesSet(feedEntriesSet);

		IBondFeedGroup pkSetGroup = dao.createBondFeedGroup(IBondDao.STAGE_BOND_FEED_GROUP_ENTITY_NAME, group);
		assertTrue("pk should be greater than 0", pkSetGroup.getBondFeedGroupID() > 0);

		IBondFeedGroup storedGroup = dao.getBondFeedGroupByPrimaryKey(IBondDao.ACTUAL_BOND_FEED_GROUP_ENTITY_NAME,
				new Long(pkSetGroup.getBondFeedGroupID()));
		assertNull(storedGroup);

		storedGroup = dao.getBondFeedGroupByPrimaryKey(IBondDao.STAGE_BOND_FEED_GROUP_ENTITY_NAME, new Long(pkSetGroup
				.getBondFeedGroupID()));

		assertTrue("should have only 1 feed entry", storedGroup.getFeedEntries().length == 1);

		assertEquals("Msia Gov Bond 3.5%", storedGroup.getFeedEntries()[0].getName());
		assertEquals(feedEntry.getEffectiveDateOfIssueRating(), storedGroup.getFeedEntries()[0]
				.getEffectiveDateOfIssueRating());
	}

}

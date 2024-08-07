package com.integrosys.cms.app.feed.bus.forex;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class ForexDaoImplTest extends CustomHibernateTestCase {

	ForexDaoImpl dao;

	public void setUp() {
		super.setUp();

		dao = new ForexDaoImpl();
		dao.setSessionFactory(getSessionFactory());
	}

	protected String[] getMappingResources() {
		return new String[] { "Feed-Forex.hbm.xml" };
	}

	public void testCreateActualForexFeedGroupUsingArray() {
		OBForexFeedEntry[] feedEntries = new OBForexFeedEntry[2];
		feedEntries[0] = new OBForexFeedEntry();
		feedEntries[0].setBuyRate(new BigDecimal(2.38));
		feedEntries[0].setBuyCurrency("SGD");
		feedEntries[0].setEffectiveDate(new Date());

		feedEntries[1] = new OBForexFeedEntry();
		feedEntries[1].setBuyRate(new BigDecimal(0.56));
		feedEntries[1].setBuyCurrency("RMB");
		feedEntries[0].setEffectiveDate(new Date());

		OBForexFeedGroup group = new OBForexFeedGroup();
		group.setFeedEntries(feedEntries);
		group.setType("FOREX");

		OBForexFeedGroup pkSetGroup = (OBForexFeedGroup) dao.createForexFeedGroup(
				IForexDao.ACTUAL_FOREX_FEED_GROUP_ENTITY_NAME, group);
		OBForexFeedGroup updatedGroup = (OBForexFeedGroup) dao.getForexFeedGroupByPrimaryKey(
				IForexDao.ACTUAL_FOREX_FEED_GROUP_ENTITY_NAME, new Long(pkSetGroup.getForexFeedGroupID()));

		assertNotNull(updatedGroup);
		assertTrue("should have '2' forex feed in the group but [" + updatedGroup.getFeedEntries().length + "]",
				updatedGroup.getFeedEntries().length == 2);
	}

	public void testCreateStageForexFeedGroupUsingSet() {
		Set feedEntriesSet = new HashSet();

		OBForexFeedEntry feedEntry = new OBForexFeedEntry();
		feedEntry = new OBForexFeedEntry();
		feedEntry.setBuyRate(new BigDecimal(2.38));
		feedEntry.setBuyCurrency("SGD");
		feedEntry.setEffectiveDate(new Date());

		feedEntriesSet.add(feedEntry);

		feedEntry = new OBForexFeedEntry();
		feedEntry.setBuyRate(new BigDecimal(0.56));
		feedEntry.setBuyCurrency("RMB");
		feedEntry.setEffectiveDate(new Date());

		feedEntriesSet.add(feedEntry);

		OBForexFeedGroup group = new OBForexFeedGroup();
		group.setFeedEntriesSet(feedEntriesSet);
		group.setType("FOREX");

		OBForexFeedGroup pkSetGroup = (OBForexFeedGroup) dao.createForexFeedGroup(
				IForexDao.STAGE_FOREX_FEED_GROUP_ENTITY_NAME, group);
		OBForexFeedGroup updatedGroup = (OBForexFeedGroup) dao.getForexFeedGroupByPrimaryKey(
				IForexDao.STAGE_FOREX_FEED_GROUP_ENTITY_NAME, new Long(pkSetGroup.getForexFeedGroupID()));

		assertNotNull(updatedGroup);
		assertTrue("should have '2' forex feed in the group but [" + updatedGroup.getFeedEntries().length + "]",
				updatedGroup.getFeedEntries().length == 2);
	}

	public void testCreateStageForexFeedGroupUsingArrayAndSet() {
		Set feedEntriesSet = new HashSet();

		OBForexFeedEntry feedEntry = new OBForexFeedEntry();
		feedEntry = new OBForexFeedEntry();
		feedEntry.setBuyRate(new BigDecimal(2.38));
		feedEntry.setBuyCurrency("SGD");
		feedEntry.setEffectiveDate(new Date());

		feedEntriesSet.add(feedEntry);

		feedEntry = new OBForexFeedEntry();
		feedEntry.setBuyRate(new BigDecimal(0.56));
		feedEntry.setBuyCurrency("RMB");
		feedEntry.setEffectiveDate(new Date());

		feedEntriesSet.add(feedEntry);

		OBForexFeedGroup group = new OBForexFeedGroup();
		group.setFeedEntriesSet(feedEntriesSet);
		group.setType("FOREX");

		OBForexFeedGroup pkSetGroup = (OBForexFeedGroup) dao.createForexFeedGroup(
				IForexDao.STAGE_FOREX_FEED_GROUP_ENTITY_NAME, group);
		OBForexFeedGroup storedGroup = (OBForexFeedGroup) dao.getForexFeedGroupByPrimaryKey(
				IForexDao.STAGE_FOREX_FEED_GROUP_ENTITY_NAME, new Long(pkSetGroup.getForexFeedGroupID()));

		assertNotNull(storedGroup);
		assertTrue("should have '2' forex feed in the group but [" + storedGroup.getFeedEntries().length + "]",
				storedGroup.getFeedEntries().length == 2);

		IForexFeedEntry[] feedEntries = storedGroup.getFeedEntries();
		IForexFeedEntry[] newFeedEntries = new IForexFeedEntry[4];

		for (int i = 0; i < feedEntries.length; i++) {
			newFeedEntries[i] = feedEntries[i];
		}

		newFeedEntries[2] = new OBForexFeedEntry();
		newFeedEntries[2].setBuyRate(new BigDecimal(3.38));
		newFeedEntries[2].setBuyCurrency("USD");
		newFeedEntries[2].setEffectiveDate(new Date());

		newFeedEntries[3] = new OBForexFeedEntry();
		newFeedEntries[3].setBuyRate(new BigDecimal(5.20));
		newFeedEntries[3].setBuyCurrency("EUR");
		newFeedEntries[3].setEffectiveDate(new Date());

		storedGroup.setFeedEntries(newFeedEntries);

		for (int i = 0; i < storedGroup.getFeedEntries().length; i++) {
			assertEquals(newFeedEntries[i], storedGroup.getFeedEntries()[i]);
		}

		storedGroup.setFeedEntries(null);
		dao.updateForexFeedGroup(IForexDao.STAGE_FOREX_FEED_GROUP_ENTITY_NAME, storedGroup);
	}

}

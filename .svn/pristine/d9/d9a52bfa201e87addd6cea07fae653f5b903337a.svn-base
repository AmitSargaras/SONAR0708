package com.integrosys.cms.app.feed.bus.stock;

import java.util.HashSet;
import java.util.Set;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

/**
 * Test Case for {@link StockDaoImpl}
 * 
 * @author Chong Jun Yong
 * @since 1.1
 * 
 */
public class StockDaoImplTest extends CustomHibernateTestCase {

	StockDaoImpl dao;

	protected String[] getMappingResources() {
		return new String[] { "Feed-Stock.hbm.xml" };
	}

	public void setUp() {
		super.setUp();

		dao = new StockDaoImpl();
		dao.setSessionFactory(getSessionFactory());
	}

	public void testCreateActualStockFeedGroupUsingArrays() {
		OBStockFeedEntry feedEntry = new OBStockFeedEntry();
		feedEntry.setName("YTL Cement");
		feedEntry.setCurrencyCode("MYR");
		feedEntry.setUnitPrice(11.23);
		feedEntry.setRic("YTL.1234");
		feedEntry.setIsinCode("YTL1234");
		feedEntry.setTicker("YTL1234");

		OBStockFeedGroup group = new OBStockFeedGroup();
		group.setFeedEntries(new IStockFeedEntry[] { feedEntry });

		group = (OBStockFeedGroup) dao.createStockFeedGroup(IStockDao.ACTUAL_STOCK_FEED_GROUP_ENTITY_NAME, group);
		assertTrue("should have primary key set.", group.getStockFeedGroupID() > 0);

		IStockFeedGroup storedGroup = dao.getStockFeedGroupByPrimaryKey(IStockDao.STAGE_STOCK_FEED_GROUP_ENTITY_NAME,
				new Long(group.getStockFeedGroupID()));
		assertNull(storedGroup);

		storedGroup = dao.getStockFeedGroupByPrimaryKey(IStockDao.ACTUAL_STOCK_FEED_GROUP_ENTITY_NAME, new Long(group
				.getStockFeedGroupID()));
		assertNotNull(storedGroup);
		assertTrue("should have only 1 feed entry", storedGroup.getFeedEntries().length == 1);

		assertTrue("should have primary key set.", group.getFeedEntries()[0].getStockFeedEntryID() > 0);
		assertEquals(feedEntry.getTicker(), group.getFeedEntries()[0].getTicker());
		assertEquals(feedEntry.getIsinCode(), group.getFeedEntries()[0].getIsinCode());
	}

	public void testCreateStagingStockFeedGroupUsingSet() {
		OBStockFeedEntry feedEntry = new OBStockFeedEntry();
		feedEntry.setName("YTL Cement");
		feedEntry.setCurrencyCode("MYR");
		feedEntry.setUnitPrice(11.23);
		feedEntry.setRic("YTL.1234");
		feedEntry.setIsinCode("YTL1234");
		feedEntry.setTicker("YTL1234");

		Set feedEntriesSet = new HashSet();
		feedEntriesSet.add(feedEntry);

		OBStockFeedGroup group = new OBStockFeedGroup();
		group.setFeedEntriesSet(feedEntriesSet);
		group.setType("STOCK");
		group.setSubType("MY");
		group.setStockType("NORMAL_SHARES");

		dao.createStockFeedGroup(IStockDao.STAGE_STOCK_FEED_GROUP_ENTITY_NAME, group);

		IStockFeedGroup storedGroup = dao.getStockFeedGroupByTypeAndSubTypeAndStockType(
				IStockDao.STAGE_STOCK_FEED_GROUP_ENTITY_NAME, "STOCK", "MY", "NORMAL_SHARES");
		assertNotNull(storedGroup);

		assertTrue("should have only 1 feed entry", storedGroup.getFeedEntries().length == 1);

		assertTrue("should have primary key set.", group.getFeedEntries()[0].getStockFeedEntryID() > 0);
		assertEquals(feedEntry.getTicker(), group.getFeedEntries()[0].getTicker());
		assertEquals(feedEntry.getIsinCode(), group.getFeedEntries()[0].getIsinCode());
	}

	public void testFindByIsinCodeTickerCodeRicCode() {
		Set feedEntriesSet = new HashSet();

		OBStockFeedEntry feedEntry = new OBStockFeedEntry();
		feedEntry.setName("YTL Cement");
		feedEntry.setCurrencyCode("MYR");
		feedEntry.setUnitPrice(11.23);
		feedEntry.setRic("YTL.1234");
		feedEntry.setIsinCode("YTL1234");
		feedEntry.setTicker("YTL1234");

		feedEntriesSet.add(feedEntry);

		feedEntry = new OBStockFeedEntry();
		feedEntry.setName("YTL Water");
		feedEntry.setCurrencyCode("MYR");
		feedEntry.setUnitPrice(5.6);
		feedEntry.setRic("YTL.5566");
		feedEntry.setIsinCode("YTL5566");
		feedEntry.setTicker("YTL5566");

		feedEntriesSet.add(feedEntry);

		OBStockFeedGroup group = new OBStockFeedGroup();
		group.setFeedEntriesSet(feedEntriesSet);
		group.setType("STOCK");
		group.setSubType("MY");
		group.setStockType("NORMAL_SHARES");

		dao.createStockFeedGroup(IStockDao.STAGE_STOCK_FEED_GROUP_ENTITY_NAME, group);

		IStockFeedEntry storedFeedEntry = dao.getStockFeedEntryByIsinCode(IStockDao.STAGE_STOCK_FEED_ENTRY_ENTITY_NAME,
				"YTL1234");
		assertNotNull(storedFeedEntry);
		assertEquals("YTL1234", storedFeedEntry.getTicker());
		assertEquals("YTL Cement", storedFeedEntry.getName());

		storedFeedEntry = dao.getStockFeedEntryByRic(IStockDao.STAGE_STOCK_FEED_ENTRY_ENTITY_NAME, "YTL.5566");
		assertNotNull(storedFeedEntry);
		assertEquals("YTL5566", storedFeedEntry.getTicker());
		assertEquals("YTL Water", storedFeedEntry.getName());

		storedFeedEntry = dao.getStockFeedEntryByTicker(IStockDao.STAGE_STOCK_FEED_ENTRY_ENTITY_NAME, "YTL1234");
		assertNotNull(storedFeedEntry);
		assertEquals("YTL1234", storedFeedEntry.getIsinCode());
		assertEquals("YTL Cement", storedFeedEntry.getName());
	}

}

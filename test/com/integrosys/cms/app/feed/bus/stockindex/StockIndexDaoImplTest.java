package com.integrosys.cms.app.feed.bus.stockindex;

import java.util.Set;

import org.springframework.jdbc.core.JdbcTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.base.techinfra.util.EntityAssociationUtils;
import com.integrosys.base.techinfra.util.ReplicateUtils;

/**
 * Test Case for {@link StockIndexDaoImpl}
 * 
 * @author Chong Jun Yong
 * 
 */
public class StockIndexDaoImplTest extends CustomHibernateTestCase {

	StockIndexDaoImpl dao;

	public void setUp() {
		super.setUp();

		dao = new StockIndexDaoImpl();
		dao.setSessionFactory(getSessionFactory());
	}

	public void testCreateActualStockIndexFeedGroup() {
		OBStockIndexFeedEntry[] entries = new OBStockIndexFeedEntry[2];

		entries[0] = new OBStockIndexFeedEntry();
		entries[0].setName("KLCI");
		entries[0].setCountryCode("MY");
		entries[0].setCountryCode("MYR");
		entries[0].setUnitPrice(1310d);
		entries[0].setExchange("KLSE");
		entries[0].setBlackListed("N");

		entries[1] = new OBStockIndexFeedEntry();
		entries[1].setName("MESDAQ");
		entries[1].setCountryCode("MY");
		entries[1].setCountryCode("MYR");
		entries[1].setUnitPrice(256d);
		entries[1].setExchange("KLSE");
		entries[1].setBlackListed("N");

		OBStockIndexFeedGroup feedGroup = new OBStockIndexFeedGroup();
		feedGroup.setFeedEntries(entries);
		feedGroup.setType("STOCK_INDEX");
		feedGroup.setSubType("MY");

		assertNotNull(feedGroup.getFeedEntriesSet());

		IStockIndexFeedGroup storedGroup = dao.createStockIndexFeedGroup(
				IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, feedGroup);
		assertNotNull(storedGroup);
		assertEquals("STOCK_INDEX", storedGroup.getType());
		assertEquals("MY", storedGroup.getSubType());
		assertEquals(2, storedGroup.getFeedEntries().length);
	}

	public void testCreateStageStockIndexFeedGroup() {
		OBStockIndexFeedEntry[] entries = new OBStockIndexFeedEntry[2];

		entries[0] = new OBStockIndexFeedEntry();
		entries[0].setName("KLCI");
		entries[0].setCountryCode("MY");
		entries[0].setCountryCode("MYR");
		entries[0].setUnitPrice(1310d);
		entries[0].setExchange("KLSE");
		entries[0].setBlackListed("N");

		entries[1] = new OBStockIndexFeedEntry();
		entries[1].setName("MESDAQ");
		entries[1].setCountryCode("MY");
		entries[1].setCountryCode("MYR");
		entries[1].setUnitPrice(256d);
		entries[1].setExchange("KLSE");
		entries[1].setBlackListed("N");

		OBStockIndexFeedGroup feedGroup = new OBStockIndexFeedGroup();
		feedGroup.setFeedEntries(entries);
		feedGroup.setType("STOCK_INDEX");
		feedGroup.setSubType("MY");

		assertNotNull(feedGroup.getFeedEntriesSet());

		IStockIndexFeedGroup storedGroup = dao.createStockIndexFeedGroup(
				IStockIndexDao.STAGE_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, feedGroup);
		assertNotNull(storedGroup);
		assertEquals("STOCK_INDEX", storedGroup.getType());
		assertEquals("MY", storedGroup.getSubType());
		assertEquals(2, storedGroup.getFeedEntries().length);

		storedGroup = dao.getStockIndexFeedGroupByPrimaryKey(IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME,
				new Long(storedGroup.getStockIndexFeedGroupID()));
		assertNull(storedGroup);

	}

	public void testGetActualStockIndexFeedEntryByRic() {
		OBStockIndexFeedEntry[] entries = new OBStockIndexFeedEntry[1];

		entries[0] = new OBStockIndexFeedEntry();
		entries[0].setName("KLCI");
		entries[0].setCountryCode("MY");
		entries[0].setCountryCode("MYR");
		entries[0].setUnitPrice(1310d);
		entries[0].setExchange("KLSE");
		entries[0].setBlackListed("N");
		entries[0].setRic("KL.1234");

		OBStockIndexFeedGroup feedGroup = new OBStockIndexFeedGroup();
		feedGroup.setFeedEntries(entries);
		feedGroup.setType("STOCK_INDEX");
		feedGroup.setSubType("MY");

		assertNotNull(feedGroup.getFeedEntriesSet());

		IStockIndexFeedGroup storedGroup = dao.createStockIndexFeedGroup(
				IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, feedGroup);
		assertNotNull(storedGroup);
		assertEquals("STOCK_INDEX", storedGroup.getType());
		assertEquals("MY", storedGroup.getSubType());
		assertEquals(1, storedGroup.getFeedEntries().length);

		IStockIndexFeedEntry feedEntry = dao.getStockIndexFeedEntryByRic(
				IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_ENTRY_ENTITY_NAME, "KL.1234");
		assertNotNull(feedEntry);
		assertEquals("KLSE", feedEntry.getExchange());

		feedEntry = dao
				.getStockIndexFeedEntryByRic(IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_ENTRY_ENTITY_NAME, "KL.1233");
		assertNull(feedEntry);
	}

	public void testGetStageStockIndexFeedGroupByTypeAndSubType() {
		OBStockIndexFeedEntry[] entries = new OBStockIndexFeedEntry[1];

		entries[0] = new OBStockIndexFeedEntry();
		entries[0].setName("KLCI");
		entries[0].setCountryCode("MY");
		entries[0].setCountryCode("MYR");
		entries[0].setUnitPrice(1310d);
		entries[0].setExchange("KLSE");
		entries[0].setBlackListed("N");
		entries[0].setRic("KL.1234");

		OBStockIndexFeedGroup feedGroup = new OBStockIndexFeedGroup();
		feedGroup.setFeedEntries(entries);
		feedGroup.setType("STOCK_INDEX");
		feedGroup.setSubType("MY");

		assertNotNull(feedGroup.getFeedEntriesSet());

		IStockIndexFeedGroup storedGroup = dao.createStockIndexFeedGroup(
				IStockIndexDao.STAGE_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, feedGroup);
		assertNotNull(storedGroup);
		assertEquals("STOCK_INDEX", storedGroup.getType());
		assertEquals("MY", storedGroup.getSubType());
		assertEquals(1, storedGroup.getFeedEntries().length);

		IStockIndexFeedGroup storedFeedGroup = dao.getStockIndexFeedGroupByTypeAndSubType(
				IStockIndexDao.STAGE_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, "STOCK_INDEX", "MY");
		assertNotNull(storedFeedGroup);
		assertEquals(1, storedFeedGroup.getFeedEntries().length);

		storedFeedGroup = dao.getStockIndexFeedGroupByTypeAndSubType(
				IStockIndexDao.STAGE_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, "UNIT_TRUST", "SG");
		assertNull(storedFeedGroup);
	}

	public void testSessionSyncDatabase() {
		OBStockIndexFeedEntry[] entries = new OBStockIndexFeedEntry[1];

		entries[0] = new OBStockIndexFeedEntry();
		entries[0].setName("KLCI");
		entries[0].setCountryCode("MY");
		entries[0].setCountryCode("MYR");
		entries[0].setUnitPrice(1310d);
		entries[0].setExchange("KLSE");
		entries[0].setBlackListed("N");
		entries[0].setRic("KL.1234");

		OBStockIndexFeedGroup feedGroup = new OBStockIndexFeedGroup();
		feedGroup.setFeedEntries(entries);
		feedGroup.setType("STOCK_INDEX");
		feedGroup.setSubType("MY");

		assertNotNull(feedGroup.getFeedEntriesSet());

		IStockIndexFeedGroup storedGroup = dao.createStockIndexFeedGroup(
				IStockIndexDao.STAGE_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, feedGroup);
		assertNotNull(storedGroup);

		IStockIndexFeedGroup storedFeedGroup = dao.getStockIndexFeedGroupByTypeAndSubType(
				IStockIndexDao.STAGE_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, "STOCK_INDEX", "MY");
		assertNotNull(storedFeedGroup);

		OBStockIndexFeedGroup newGroup = (OBStockIndexFeedGroup) ReplicateUtils.replicateObject(storedFeedGroup,
				new String[] { "stockIndexFeedGroupID" });
		newGroup.setFeedEntriesSet((Set) ReplicateUtils.replicateCollectionObjectWithSpecifiedImplClass(storedFeedGroup
				.getFeedEntriesSet(), new String[] { "stockIndexFeedEntryID" }));

		try {
			storedFeedGroup = dao.createStockIndexFeedGroup(IStockIndexDao.STAGE_STOCK_INDEX_FEED_GROUP_ENTITY_NAME,
					newGroup);
		}
		catch (org.springframework.orm.hibernate3.HibernateOptimisticLockingFailureException e) {
			fail("should not have throw hibernate exception");
		}

		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		int count = jdbcTemplate.queryForInt("select count(*) from cms_stage_feed_group");
		assertTrue("should have 2 values in 'cms_stage_feed_group'", (count == 2));

	}

	public void testCreateObjectWithPrimaryKeyValue() {
		OBStockIndexFeedEntry[] entries = new OBStockIndexFeedEntry[1];

		entries[0] = new OBStockIndexFeedEntry();
		entries[0].setStockIndexFeedEntryID(1234);
		entries[0].setName("KLCI");
		entries[0].setCountryCode("MY");
		entries[0].setCountryCode("MYR");
		entries[0].setUnitPrice(1310d);
		entries[0].setExchange("KLSE");
		entries[0].setBlackListed("N");
		entries[0].setRic("KL.1234");

		OBStockIndexFeedGroup feedGroup = new OBStockIndexFeedGroup();
		feedGroup.setStockIndexFeedGroupID(1234);
		feedGroup.setFeedEntries(entries);
		feedGroup.setType("STOCK_INDEX");
		feedGroup.setSubType("MY");

		try {
			dao.createStockIndexFeedGroup(IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, feedGroup);
			fail("should have throw hibernate exception");
		}
		catch (org.springframework.orm.hibernate3.HibernateOptimisticLockingFailureException e) {
			assertEquals(org.hibernate.StaleObjectStateException.class, e.getCause().getClass());
		}

		entries[0].setStockIndexFeedEntryID(0);
		feedGroup.setFeedEntries(entries);

		IStockIndexFeedGroup storedGroup = dao.createStockIndexFeedGroup(
				IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, feedGroup);
		assertTrue("should not having same id but [" + storedGroup.getStockIndexFeedGroupID() + "]", storedGroup
				.getStockIndexFeedGroupID() != 1234);

	}

	public void testUpdateStockIndexFeedEntryInsideFeedGroup() throws Exception {
		OBStockIndexFeedEntry[] entries = new OBStockIndexFeedEntry[1];

		entries[0] = new OBStockIndexFeedEntry();
		entries[0].setName("KLCI");
		entries[0].setCountryCode("MY");
		entries[0].setCountryCode("MYR");
		entries[0].setUnitPrice(1310d);
		entries[0].setExchange("KLSE");
		entries[0].setBlackListed("N");
		entries[0].setRic("KL.1234");

		OBStockIndexFeedGroup feedGroup = new OBStockIndexFeedGroup();
		feedGroup.setStockIndexFeedGroupID(1234);
		feedGroup.setFeedEntries(entries);
		feedGroup.setType("STOCK_INDEX");
		feedGroup.setSubType("MY");

		dao.createStockIndexFeedGroup(IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, feedGroup);

		IStockIndexFeedGroup storedFeedGroup = dao.getStockIndexFeedGroupByTypeAndSubType(
				IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, "STOCK_INDEX", "MY");

		if (storedFeedGroup.getFeedEntriesSet() != null) {
			Set updatedStockIndexFeedEntriesSet = (Set) EntityAssociationUtils.copyReferenceIdUsingPrimaryKey(
					storedFeedGroup.getFeedEntriesSet(), "stockIndexFeedEntryRef", Long.class, "stockIndexFeedEntryID");

			storedFeedGroup.getFeedEntriesSet().clear();
			storedFeedGroup.getFeedEntriesSet().addAll(updatedStockIndexFeedEntriesSet);
		}

		dao.updateStockIndexFeedGroup(IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, storedFeedGroup);

		JdbcTemplate jdbcTemplate = new JdbcTemplate(getDataSource());
		int count = jdbcTemplate.queryForInt("select count(*) from cms_price_feed");
		assertTrue("should have 1 value in 'cms_price_feed'", (count == 1));

		count = jdbcTemplate.queryForInt("select count(*) from cms_price_feed where feed_id = feed_ref");
		assertTrue("should have 1 value in 'cms_price_feed' for 'feed_id' same with 'feed_ref'", (count == 1));

		storedFeedGroup = dao.getStockIndexFeedGroupByTypeAndSubType(
				IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME, "STOCK_INDEX", "MY");

		Set replicatedStockIndexFeedEntriesSet = (Set) ReplicateUtils.replicateCollectionObjectWithSpecifiedImplClass(
				storedFeedGroup.getFeedEntriesSet(), new String[] { "stockIndexFeedEntryID" });

		OBStockIndexFeedEntry newFeedEntry = new OBStockIndexFeedEntry();
		newFeedEntry.setName("MESDAQ");
		newFeedEntry.setIsinCode("MQ12345");
		newFeedEntry.setRic("MQ.12345");
		newFeedEntry.setUnitPrice(360d);
		newFeedEntry.setCurrencyCode("MYR");

		replicatedStockIndexFeedEntriesSet.add(newFeedEntry);

		Set storedStockIndexFeedEntriesSet = storedFeedGroup.getFeedEntriesSet();
		Set newStockIndexFeedEntriesSet = (Set) EntityAssociationUtils.synchronizeCollectionsByProperties(
				storedStockIndexFeedEntriesSet, replicatedStockIndexFeedEntriesSet,
				new String[] { "stockIndexFeedEntryRef" }, new String[] { "stockIndexFeedEntryID" });

		storedFeedGroup.getFeedEntriesSet().clear();
		storedFeedGroup.getFeedEntriesSet().addAll(newStockIndexFeedEntriesSet);

		storedFeedGroup = dao.updateStockIndexFeedGroup(IStockIndexDao.ACTUAL_STOCK_INDEX_FEED_GROUP_ENTITY_NAME,
				storedFeedGroup);

		count = jdbcTemplate.queryForInt("select count(*) from cms_price_feed");
		assertTrue("should have 2 value in 'cms_price_feed' but [" + count + "]", (count == 2));

		count = jdbcTemplate.queryForInt("select count(*) from cms_price_feed where feed_id = feed_ref");
		assertTrue("should have 1 value in 'cms_price_feed' for 'feed_id' same with 'feed_ref'", (count == 1));

	}

	protected String[] getMappingResources() {
		return new String[] { "Feed-StockIndex.hbm.xml" };
	}	
}

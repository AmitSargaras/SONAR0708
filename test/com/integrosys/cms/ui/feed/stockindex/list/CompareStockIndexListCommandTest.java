package com.integrosys.cms.ui.feed.stockindex.list;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import junit.framework.TestCase;

import com.integrosys.base.techinfra.diff.CompareResult;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.cms.app.feed.bus.stockindex.OBStockIndexFeedEntry;
import com.integrosys.cms.app.feed.bus.stockindex.OBStockIndexFeedGroup;
import com.integrosys.cms.app.feed.trx.stockindex.OBStockIndexFeedGroupTrxValue;

/**
 * @author Chong Jun Yong
 * @since 1.1
 */
public class CompareStockIndexListCommandTest extends TestCase {

	public void testCompareCreateOneStockIndexGroup() throws Exception {
		CompareStockIndexListCommand cmd = new CompareStockIndexListCommand();

		OBStockIndexFeedGroupTrxValue trxValue = new OBStockIndexFeedGroupTrxValue();
		OBStockIndexFeedGroup stageFeedGroup = new OBStockIndexFeedGroup();
		OBStockIndexFeedEntry[] entries = new OBStockIndexFeedEntry[1];
		entries[0] = new OBStockIndexFeedEntry();
		entries[0].setName("KLCI");
		entries[0].setCountryCode("MY");
		entries[0].setCurrencyCode("MYR");
		entries[0].setExchange("Bursa");
		entries[0].setUnitPrice(1145d);
		entries[0].setIsinCode("KLCI12345");
		entries[0].setStockIndexFeedEntryID(20080616000001l);

		stageFeedGroup.setStockIndexFeedGroupID(20080616000001l);
		stageFeedGroup.setType("STOCK_INDEX");
		stageFeedGroup.setSubType("MY");
		stageFeedGroup.setFeedEntries(entries);

		trxValue.setStagingStockIndexFeedGroup(stageFeedGroup);
		
		OBStockIndexFeedGroup actualFeedGroup = new OBStockIndexFeedGroup();
		
		trxValue.setStockIndexFeedGroup(actualFeedGroup);

		HashMap context = new HashMap();
		context.put("stockIndexFeedGroupTrxValue", trxValue);
		context.put("offset", new Integer(0));
		context.put("length", new Integer(0));

		HashMap returnMap = cmd.doExecute(context);
		HashMap resultMap = (HashMap) returnMap.get(ICommonEventConstant.COMMAND_RESULT_MAP);

		List comparedResultList = (List) resultMap.get("compareResultsList");

		assertNotNull(comparedResultList);
		assertTrue("should have '1' record in the list but [" + comparedResultList.size() + "]", comparedResultList
				.size() == 1);

		Iterator itrComparedResult = comparedResultList.iterator();
		while (itrComparedResult.hasNext()) {
			CompareResult comparedResult = (CompareResult) itrComparedResult.next();
			OBStockIndexFeedEntry entry = (OBStockIndexFeedEntry) comparedResult.getObj();
			assertEquals("KLCI", entry.getName());
			assertEquals(1145d, entry.getUnitPrice(), 0d);
			assertEquals("KLCI12345", entry.getIsinCode());
			assertTrue("should be a 'add' result", comparedResult.isAdded());
			assertFalse("should not be a 'modified' result", comparedResult.isModified());
			assertFalse("should not be a 'unmodified' result", comparedResult.isUnmodified());
			assertFalse("should not be a 'deleted' result", comparedResult.isDeleted());
		}
	}

}

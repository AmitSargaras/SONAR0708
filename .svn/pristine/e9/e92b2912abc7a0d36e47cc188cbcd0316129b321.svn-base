package com.integrosys.cms.app.transaction;

import java.util.Date;

import com.integrosys.base.businfra.transaction.EBTrxHistory;
import com.integrosys.base.businfra.transaction.EBTrxHistoryHome;
import com.integrosys.base.techinfra.test.MockContextTestCase;

/**
 * Test Case for {@link EBCMSTrxHistoryBean}
 * 
 * @author Chong Jun Yong
 * @since 28.08.2008
 * 
 */
public class EBCMSTrxHistoryBeanTest extends MockContextTestCase {

	public void onSetUp() throws Exception {
		deploy("EBTrxHistoryHome", EBTrxHistoryHome.class, EBTrxHistory.class, EBCMSTrxHistoryBean.class);
	}

	public void testHomeCreateCmsTrxHistory() throws Exception {
		EBTrxHistoryHome trxHistoryHome = (EBTrxHistoryHome) get("EBTrxHistoryHome");

		OBCMSTrxHistoryValue trxHistory = new OBCMSTrxHistoryValue("20080828000000111", new Date());
		trxHistory.setReferenceID("20080828000000111l");
		trxHistory.setStagingReferenceID("200808310000000222");
		trxHistory.setTransactionType("LIMIT_PROFILE");
		trxHistory.setLimitProfileID(20080828000000111l);
		trxHistory.setLimitProfileReferenceNumber("RLOS-HP-AA-56789");
		trxHistory.setFromUser("20080828000111000", "20080828000222000");

		EBTrxHistory ebTrxHistory = trxHistoryHome.create(trxHistory);

		OBCMSTrxHistoryValue storedTrxHistory = (OBCMSTrxHistoryValue) ebTrxHistory.getValue();
		assertNotNull(storedTrxHistory);
		assertEquals("LIMIT_PROFILE", storedTrxHistory.getTransactionType());
		assertEquals("20080828000000111", storedTrxHistory.getTransactionId());
		assertEquals(20080828000000111l, storedTrxHistory.getLimitProfileID(), 0);
		assertEquals("RLOS-HP-AA-56789", storedTrxHistory.getLimitProfileReferenceNumber());

	}
}
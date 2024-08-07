package com.integrosys.cms.app.feed.trx.bond;

import org.easymock.MockControl;

import com.integrosys.cms.app.feed.bus.bond.IBondFeedBusManager;
import com.integrosys.cms.app.feed.bus.bond.OBBondFeedGroup;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

/**
 * Test case for Bond Feed Maker Update Operation
 * 
 * @author Chong Jun Yong
 * 
 */
public class MakerUpdateOperationTest extends TransactionEngineTestCase {

	MockControl busMgrControl;

	public void tearDown() {
		busMgrControl.verify();
	}

	public void testPerformProcessUsingDefaultTrxProcess() throws Exception {
		OBBondFeedGroup group = new OBBondFeedGroup();
		group.setBondFeedGroupID(20080823000000888l);

		OBBondFeedGroupTrxValue trxValue = new OBBondFeedGroupTrxValue();
		trxValue.setStagingBondFeedGroup(group);
		trxValue.setTransactionID("20080823000000001");
		trxValue.setTransactionType("BOND_FEED_GROUP");
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("ACTIVE");
		trxValue.setInstanceName("BOND_FEED_GROUP");

		trxValue = (OBBondFeedGroupTrxValue) createTransaction(trxValue);

		busMgrControl = MockControl.createControl(IBondFeedBusManager.class);
		IBondFeedBusManager stgBusMgr = (IBondFeedBusManager) busMgrControl.getMock();
		stgBusMgr.createBondFeedGroup(group);
		busMgrControl.setDefaultReturnValue(group);
		busMgrControl.replay();

		MakerUpdateOperation op = new MakerUpdateOperation();
		op.setBondFeedBusManagerStaging(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);

		OBBondFeedGroupTrxValue processedTrxValue = (OBBondFeedGroupTrxValue) result.getTrxValue();
		assertEquals("20080823000000888", processedTrxValue.getStagingReferenceID());
		assertEquals("DRAFT", processedTrxValue.getStatus());
	}
}

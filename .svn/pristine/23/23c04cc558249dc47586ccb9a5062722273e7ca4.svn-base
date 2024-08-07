package com.integrosys.cms.app.tatdoc.trx;

import org.easymock.MockControl;

import com.integrosys.cms.app.tatdoc.bus.ITatDocBusManager;
import com.integrosys.cms.app.tatdoc.bus.OBTatDoc;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

/**
 * Test case for Tat Doc Maker Update Operation
 * @author Cynthia
 */

public class MakerSaveUpdateTatDocOperationTest extends TransactionEngineTestCase {

	MockControl busMgrControl;

	public void tearDown() {
		busMgrControl.verify();
	}

	public void testPerformProcessUsingDefaultTrxProcess() throws Exception {
		OBTatDoc tatDoc = new OBTatDoc();
		tatDoc.setTatDocID(20080823000000888l);

		ITatDocTrxValue trxValue = new OBTatDocTrxValue();
		trxValue.setStagingTatDoc(tatDoc);
		trxValue.setTransactionID("20080823000000001");
		trxValue.setTransactionType("TAT_DOC");
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("ACTIVE");
		trxValue.setInstanceName("TAT_DOC");

		trxValue = (OBTatDocTrxValue) createTransaction(trxValue);

		busMgrControl = MockControl.createControl(ITatDocBusManager.class);
		ITatDocBusManager stgBusMgr = (ITatDocBusManager) busMgrControl.getMock();
		stgBusMgr.create(tatDoc);
		busMgrControl.setDefaultReturnValue(tatDoc);
		busMgrControl.replay();

		MakerSaveTatDocOperation op = new MakerSaveTatDocOperation();
		op.setStageTatDocBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);

		OBTatDocTrxValue processedTrxValue = (OBTatDocTrxValue) result.getTrxValue();
		assertEquals("20080823000000888", processedTrxValue.getStagingReferenceID());
		assertEquals("DRAFT", processedTrxValue.getStatus());
	}
}

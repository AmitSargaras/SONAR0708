package com.integrosys.cms.app.limit.trx;

import org.easymock.MockControl;

import com.integrosys.cms.app.limit.bus.IFacilityBusManager;
import com.integrosys.cms.app.limit.bus.OBFacilityMaster;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class MakerCreateFacilityOperationTest extends TransactionEngineTestCase {
	MockControl stgBusMgrControl;

	public void testMakerCreateNewFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		stgBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager stgBusMgr = (IFacilityBusManager) stgBusMgrControl.getMock();
		stgBusMgr.createFacilityMaster(stagingFacilityMaster);
		stgBusMgrControl.setReturnValue(stagingFacilityMaster);
		stgBusMgrControl.replay();

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("ND");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		MakerCreateFacilityOperation op = new MakerCreateFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("ND", trxValue.getFromState());
		assertEquals("PENDING_CREATE", trxValue.getToState());
		assertNotNull(trxValue.getTransactionID());

		stgBusMgrControl.verify();
	}

	public void testMakerCreateDraftedFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		stgBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager stgBusMgr = (IFacilityBusManager) stgBusMgrControl.getMock();
		stgBusMgr.createFacilityMaster(stagingFacilityMaster);
		stgBusMgrControl.setReturnValue(stagingFacilityMaster);
		stgBusMgrControl.replay();

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("ND");
		trxValue.setToState("DRAFT");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerCreateFacilityOperation op = new MakerCreateFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("DRAFT", trxValue.getFromState());
		assertEquals("PENDING_CREATE", trxValue.getToState());

		stgBusMgrControl.verify();
	}

	public void testMakerCreateRejectedFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		stgBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager stgBusMgr = (IFacilityBusManager) stgBusMgrControl.getMock();
		stgBusMgr.createFacilityMaster(stagingFacilityMaster);
		stgBusMgrControl.setReturnValue(stagingFacilityMaster);
		stgBusMgrControl.replay();

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("PENDING_CREATE");
		trxValue.setToState("REJECTED_CREATE");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerCreateFacilityOperation op = new MakerCreateFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("REJECTED_CREATE", trxValue.getFromState());
		assertEquals("PENDING_CREATE", trxValue.getToState());

		stgBusMgrControl.verify();
	}
}

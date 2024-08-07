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
public class MakerSaveFacilityOperationTest extends TransactionEngineTestCase {
	MockControl stgBusMgrControl;

	public void testMakerSaveNewFacilityMaster() throws Exception {
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

		MakerSaveFacilityOperation op = new MakerSaveFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("ND", trxValue.getFromState());
		assertEquals("DRAFT", trxValue.getToState());
		assertNotNull(trxValue.getTransactionID());

		stgBusMgrControl.verify();
	}

	public void testMakerSaveExistingNonApprovedFacilityMaster() throws Exception {
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

		MakerSaveFacilityOperation op = new MakerSaveFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("ND", trxValue.getFromState());
		assertEquals("DRAFT", trxValue.getToState());

		stgBusMgrControl.verify();
	}

	public void testMakerSaveExistingApprovedFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		stgBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager stgBusMgr = (IFacilityBusManager) stgBusMgrControl.getMock();
		stgBusMgr.createFacilityMaster(stagingFacilityMaster);
		stgBusMgrControl.setReturnValue(stagingFacilityMaster);
		stgBusMgrControl.replay();

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("ACTIVE");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerSaveFacilityOperation op = new MakerSaveFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("ACTIVE", trxValue.getFromState());
		assertEquals("DRAFT", trxValue.getToState());
		assertEquals("ACTION_MAKER_SAVE", trxValue.getOpDesc());

		stgBusMgrControl.verify();
	}

	public void testMakerSaveCreateRejectedFacilityMaster() throws Exception {
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

		MakerSaveFacilityOperation op = new MakerSaveFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("REJECTED_CREATE", trxValue.getFromState());
		assertEquals("DRAFT", trxValue.getToState());
		assertEquals("ACTION_MAKER_SAVE", trxValue.getOpDesc());

		stgBusMgrControl.verify();
	}

	public void testMakerSaveUpdateRejectedFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		stgBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager stgBusMgr = (IFacilityBusManager) stgBusMgrControl.getMock();
		stgBusMgr.createFacilityMaster(stagingFacilityMaster);
		stgBusMgrControl.setReturnValue(stagingFacilityMaster);
		stgBusMgrControl.replay();

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("REJECTED_UPDATE");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerSaveFacilityOperation op = new MakerSaveFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("REJECTED_UPDATE", trxValue.getFromState());
		assertEquals("DRAFT", trxValue.getToState());
		assertEquals("ACTION_MAKER_SAVE", trxValue.getOpDesc());

		stgBusMgrControl.verify();
	}
}

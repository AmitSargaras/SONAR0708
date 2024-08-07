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
public class MakerUpdateFacilityOperationTest extends TransactionEngineTestCase {
	MockControl stgBusMgrControl;

	public void testMakerUpdateActiveFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityMaster actualFacilityMaster = new OBFacilityMaster();
		actualFacilityMaster.setId(20080903000000111l);

		stgBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager stgBusMgr = (IFacilityBusManager) stgBusMgrControl.getMock();
		stgBusMgr.createFacilityMaster(stagingFacilityMaster);
		stgBusMgrControl.setReturnValue(stagingFacilityMaster);
		stgBusMgrControl.replay();

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("PENDING_CREATE");
		trxValue.setToState("ACTIVE");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setFacilityMaster(actualFacilityMaster);
		trxValue.setReferenceID(String.valueOf(actualFacilityMaster.getId()));
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerUpdateFacilityOperation op = new MakerUpdateFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("ACTIVE", trxValue.getFromState());
		assertEquals("PENDING_UPDATE", trxValue.getToState());
		assertNotNull(trxValue.getTransactionID());

		stgBusMgrControl.verify();
	}

	public void testMakerUpdateApprovedDraftFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityMaster actualFacilityMaster = new OBFacilityMaster();
		actualFacilityMaster.setId(20080903000000111l);

		stgBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager stgBusMgr = (IFacilityBusManager) stgBusMgrControl.getMock();
		stgBusMgr.createFacilityMaster(stagingFacilityMaster);
		stgBusMgrControl.setReturnValue(stagingFacilityMaster);
		stgBusMgrControl.replay();

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("ACTIVE");
		trxValue.setToState("DRAFT");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setFacilityMaster(actualFacilityMaster);
		trxValue.setReferenceID(String.valueOf(actualFacilityMaster.getId()));
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerUpdateFacilityOperation op = new MakerUpdateFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("DRAFT", trxValue.getFromState());
		assertEquals("PENDING_UPDATE", trxValue.getToState());
		assertNotNull(trxValue.getTransactionID());

		stgBusMgrControl.verify();
	}
	
	public void testMakerUpdateRejectedFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityMaster actualFacilityMaster = new OBFacilityMaster();
		actualFacilityMaster.setId(20080903000000111l);

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
		trxValue.setFacilityMaster(actualFacilityMaster);
		trxValue.setReferenceID(String.valueOf(actualFacilityMaster.getId()));
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerUpdateFacilityOperation op = new MakerUpdateFacilityOperation();
		op.setStagingFacilityBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("REJECTED_UPDATE", trxValue.getFromState());
		assertEquals("PENDING_UPDATE", trxValue.getToState());
		assertNotNull(trxValue.getTransactionID());

		stgBusMgrControl.verify();
	}
}

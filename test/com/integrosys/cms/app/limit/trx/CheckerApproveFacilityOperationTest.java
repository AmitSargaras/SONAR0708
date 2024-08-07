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
public class CheckerApproveFacilityOperationTest extends TransactionEngineTestCase {
	MockControl actBusMgrControl;

	public void testCheckerApproveCreateNewFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		actBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager actBusMgr = (IFacilityBusManager) actBusMgrControl.getMock();
		actBusMgr.updateToWorkingCopy(null, stagingFacilityMaster);
		actBusMgrControl.setReturnValue(stagingFacilityMaster);
		actBusMgrControl.replay();

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("ND");
		trxValue.setToState("PENDING_CREATE");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		CheckerApproveFacilityOperation op = new CheckerApproveFacilityOperation();
		op.setActualFacilityBusManager(actBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("PENDING_CREATE", trxValue.getFromState());
		assertEquals("ACTIVE", trxValue.getToState());
		assertEquals(String.valueOf(20080903000000112l), trxValue.getReferenceID());

		actBusMgrControl.verify();
	}

	public void testCheckerApproveUpdatedFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityMaster actualFacilityMaster = new OBFacilityMaster();
		actualFacilityMaster.setId(20080903000000111l);

		actBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager actBusMgr = (IFacilityBusManager) actBusMgrControl.getMock();
		actBusMgr.updateToWorkingCopy(actualFacilityMaster, stagingFacilityMaster);
		actBusMgrControl.setReturnValue(actualFacilityMaster);
		actBusMgrControl.replay();

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("ACTIVE");
		trxValue.setToState("PENDING_UPDATE");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));
		trxValue.setReferenceID(String.valueOf(actualFacilityMaster.getId()));
		trxValue.setFacilityMaster(actualFacilityMaster);

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		CheckerApproveFacilityOperation op = new CheckerApproveFacilityOperation();
		op.setActualFacilityBusManager(actBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("PENDING_UPDATE", trxValue.getFromState());
		assertEquals("ACTIVE", trxValue.getToState());
		assertEquals(String.valueOf(20080903000000111l), trxValue.getReferenceID());

		actBusMgrControl.verify();
	}
}

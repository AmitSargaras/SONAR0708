package com.integrosys.cms.app.collateral.trx;

import com.integrosys.cms.app.collateral.bus.ICollateralBusManager;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;
import org.easymock.MockControl;

/**
 * @author Andy Wong
 */
public class SystemApproveCollateralOperationTest extends TransactionEngineTestCase {
	MockControl actBusMgrControl;

	MockControl stgBusMgrControl;

	OBCollateral stagingCollateral;

	OBCollateral actualCollateral;

	ICollateralBusManager actBusMgr;

	ICollateralBusManager stgBusMgr;

	public void onSetUp() throws Exception {
		super.onSetUp();

		stagingCollateral = new OBCollateral();
		stagingCollateral.setCollateralID(20080903000000112l);

		actualCollateral = new OBCollateral();
		actualCollateral.setCollateralID(20080903000000111l);

		stgBusMgrControl = MockControl.createControl(ICollateralBusManager.class);
		stgBusMgr = (ICollateralBusManager) stgBusMgrControl.getMock();
		stgBusMgr.createCollateral(stagingCollateral);
		stgBusMgrControl.setReturnValue(stagingCollateral);

		actBusMgrControl = MockControl.createControl(ICollateralBusManager.class);
		actBusMgr = (ICollateralBusManager) actBusMgrControl.getMock();
		actBusMgr.updateCollateral(stagingCollateral);
		actBusMgrControl.setReturnValue(actualCollateral);
	}

	public void testSystemApproveActiveCollateral() throws Exception {
		actBusMgrControl.replay();
		stgBusMgrControl.replay();

		OBCollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("LOADING");
		trxValue.setInstanceName("COL");
		trxValue.setStagingCollateral(stagingCollateral);
		trxValue.setStagingReferenceID(String.valueOf(stagingCollateral.getCollateralID()));
		trxValue.setReferenceID(String.valueOf(actualCollateral.getCollateralID()));
		trxValue.setCollateral(actualCollateral);

		trxValue = (OBCollateralTrxValue) createTransaction(trxValue);

		SystemApproveCollateralOperation op = new SystemApproveCollateralOperation();
		op.setActualCollateralBusManager(actBusMgr);
		op.setStagingCollateralBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBCollateralTrxValue) result.getTrxValue();

		assertEquals("LOADING", trxValue.getFromState());
		assertEquals("ACTIVE", trxValue.getToState());
		assertEquals(String.valueOf(20080903000000111l), trxValue.getReferenceID());

		stgBusMgrControl.verify();
		actBusMgrControl.verify();
	}

	public void testSystemApproveDeleteCollateral() throws Exception {
		actBusMgrControl.replay();
		stgBusMgrControl.replay();

		OBCollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("LOADING_DELETE");
		trxValue.setInstanceName("COL");
		trxValue.setStagingCollateral(stagingCollateral);
		trxValue.setStagingReferenceID(String.valueOf(stagingCollateral.getCollateralID()));
		trxValue.setReferenceID(String.valueOf(actualCollateral.getCollateralID()));
		trxValue.setCollateral(actualCollateral);

		trxValue = (OBCollateralTrxValue) createTransaction(trxValue);

		SystemApproveCollateralOperation op = new SystemApproveCollateralOperation();
		op.setActualCollateralBusManager(actBusMgr);
		op.setStagingCollateralBusManager(stgBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBCollateralTrxValue) result.getTrxValue();

		assertEquals("LOADING_DELETE", trxValue.getFromState());
		assertEquals("DELETED", trxValue.getToState());
		assertEquals(String.valueOf(20080903000000111l), trxValue.getReferenceID());

		stgBusMgrControl.verify();
		actBusMgrControl.verify();
	}
}
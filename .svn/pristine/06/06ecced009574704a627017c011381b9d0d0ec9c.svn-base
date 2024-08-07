package com.integrosys.cms.app.collateral.trx;

import com.integrosys.cms.app.collateral.bus.ICollateralBusManager;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;
import org.easymock.MockControl;

/**
 * @author Andy Wong
 */
public class SystemUpdateCollateralOperationTest extends TransactionEngineTestCase {
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

	public void testSystemUpdateColllateral() throws Exception {

		OBCollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("LOADING");
		trxValue.setInstanceName("COL");
		trxValue.setStagingCollateral(stagingCollateral);
		trxValue.setStagingReferenceID(String.valueOf(stagingCollateral.getCollateralID()));

		trxValue = (OBCollateralTrxValue) createTransaction(trxValue);

		SystemUpdateCollateralOperation op = new SystemUpdateCollateralOperation();
		op.setActualCollateralBusManager(actBusMgr);
		op.setStagingCollateralBusManager(stgBusMgr);
		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBCollateralTrxValue) result.getTrxValue();

		assertEquals("LOADING", trxValue.getFromState());
		assertEquals("PENDING_RETRY", trxValue.getToState());
	}

	public void testSystemRejectCollateral() throws Exception {
		OBCollateral stagingCollateral = new OBCollateral();
		stagingCollateral.setCollateralID(20080903000000112l);

		OBCollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("LOADING");
		trxValue.setInstanceName("COL");
		trxValue.setStagingCollateral(stagingCollateral);
		trxValue.setStagingReferenceID(String.valueOf(stagingCollateral.getCollateralID()));

		trxValue = (OBCollateralTrxValue) createTransaction(trxValue);

		SystemUpdateCollateralOperation op = new SystemUpdateCollateralOperation();
		op.setActualCollateralBusManager(actBusMgr);
		op.setStagingCollateralBusManager(stgBusMgr);
		op.setOperationName(ICMSConstant.ACTION_SYSTEM_REJECT_COL);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBCollateralTrxValue) result.getTrxValue();

		assertEquals("LOADING", trxValue.getFromState());
		assertEquals("PENDING_PERFECTION", trxValue.getToState());
	}
}
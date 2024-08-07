package com.integrosys.cms.app.collateral.trx;

import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.ICMSTrxValue;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

public class HostUpdateCollateralOperationTest extends TransactionEngineTestCase {

	protected void onSetUp() throws Exception {
		super.onSetUp();

		addTrStateMatrix("PENDING_PERFECTION", "PENDING_PERFECTION", "HOST_UPDATE", "COL");
	}

	public void testHostUpdatePendingPerfectionTransaction() throws Exception {
		ICollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setInstanceName("COL");
		trxValue.setToState("PENDING_PERFECTION");
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setStatus("PENDING_PERFECTION");
		trxValue.setReferenceID("1234");
		trxValue.setStagingReferenceID("1235");

		ICMSTrxValue cmsTrxValue = createTransaction(trxValue);
		trxValue = new OBCollateralTrxValue(cmsTrxValue);

		HostUpdateCollateralOperation op = new HostUpdateCollateralOperation();
		op.setRetainedFromStateStatus(new String[] { "PENDING_PERFECTION" });
		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		cmsTrxValue = (ICMSTrxValue) result.getTrxValue();

		assertEquals("PENDING_UPDATE", cmsTrxValue.getFromState());
		assertEquals("PENDING_PERFECTION", cmsTrxValue.getStatus());
		assertEquals("PENDING_PERFECTION", cmsTrxValue.getToState());
	}

	public void testHostUpdateRejectedTransaction() throws Exception {
		ICollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setInstanceName("COL");
		trxValue.setToState("REJECTED");
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setStatus("REJECTED");
		trxValue.setReferenceID("1234");
		trxValue.setStagingReferenceID("1235");

		ICMSTrxValue cmsTrxValue = createTransaction(trxValue);
		trxValue = new OBCollateralTrxValue(cmsTrxValue);

		HostUpdateCollateralOperation op = new HostUpdateCollateralOperation();
		op.setRetainedFromStateStatus(new String[] { "REJECTED" });
		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		cmsTrxValue = (ICMSTrxValue) result.getTrxValue();

		assertEquals("PENDING_UPDATE", cmsTrxValue.getFromState());
		assertEquals("REJECTED", cmsTrxValue.getStatus());
		assertEquals("REJECTED", cmsTrxValue.getToState());
	}
}

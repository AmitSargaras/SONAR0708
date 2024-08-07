package com.integrosys.cms.app.limit.trx;

import com.integrosys.cms.app.limit.bus.OBFacilityMaster;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class MakerCloseFacilityOperationTest extends TransactionEngineTestCase {

	public void testMakerCloseRejectedCreateFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("PENDING_CREATE");
		trxValue.setToState("REJECTED_CREATE");
		trxValue.setInstanceName("FACILITY");

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerCloseFacilityOperation op = new MakerCloseFacilityOperation();
		op.setOperationName("ACTION_MAKER_CLOSE_ND");

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("REJECTED_CREATE", trxValue.getFromState());
		assertEquals("CLOSED", trxValue.getToState());
	}

	public void testMakerCloseOwnNonApprovedSaveFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("ND");
		trxValue.setToState("DRAFT");
		trxValue.setInstanceName("FACILITY");

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerCloseFacilityOperation op = new MakerCloseFacilityOperation();
		op.setOperationName("ACTION_MAKER_CLOSE_ND");

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("DRAFT", trxValue.getFromState());
		assertEquals("CLOSED", trxValue.getToState());
	}

	public void testMakerCloseRejectedUpdateFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("REJECTED_UPDATE");
		trxValue.setInstanceName("FACILITY");

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		MakerCloseFacilityOperation op = new MakerCloseFacilityOperation();

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("REJECTED_UPDATE", trxValue.getFromState());
		assertEquals("ACTIVE", trxValue.getToState());
	}
}

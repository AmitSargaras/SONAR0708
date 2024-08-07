package com.integrosys.cms.app.limit.trx;

import com.integrosys.cms.app.limit.bus.OBFacilityMaster;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class CheckerRejectFacilityOperationTest extends TransactionEngineTestCase {

	public void testCheckerRejectCreatingFacilityMaster() throws Exception {
		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("ND");
		trxValue.setToState("PENDING_CREATE");
		trxValue.setInstanceName("FACILITY");
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		CheckerRejectFacilityOperation op = new CheckerRejectFacilityOperation();

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("PENDING_CREATE", trxValue.getFromState());
		assertEquals("CREATE_REJECTED", trxValue.getToState());
	}

	public void testCheckerRejectUpdatingFacilityMaster() throws Exception {
		OBFacilityMaster actualFacilityMaster = new OBFacilityMaster();
		actualFacilityMaster.setId(20080903000000113l);

		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
		trxValue.setFromState("ACTIVE");
		trxValue.setToState("PENDING_UPDATE");
		trxValue.setInstanceName("FACILITY");
		trxValue.setFacilityMaster(actualFacilityMaster);
		trxValue.setReferenceID(String.valueOf(actualFacilityMaster.getId()));
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		CheckerRejectFacilityOperation op = new CheckerRejectFacilityOperation();

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		trxValue = (OBFacilityTrxValue) result.getTrxValue();

		assertEquals("PENDING_UPDATE", trxValue.getFromState());
		assertEquals("UPDATE_REJECTED", trxValue.getToState());
	}
}

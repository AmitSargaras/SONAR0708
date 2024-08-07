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
public class ReadFacilityOperationTest extends TransactionEngineTestCase {
	MockControl facilityBusMgrControl;

	public void testReadFacilityUsingTransactionId() throws Exception {
		OBFacilityMaster facilityMaster = new OBFacilityMaster();
		facilityMaster.setId(20080903000000111l);

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();

		trxValue.setFacilityMaster(facilityMaster);
		trxValue.setReferenceID(String.valueOf(facilityMaster.getId()));
		trxValue.setTransactionType("FACILITY");
		trxValue.setFromState("PENDING_UPDATE");
		trxValue.setToState("ACTIVE");
		trxValue.setInstanceName("FACILITY");

		trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

		facilityBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager busMgr = (IFacilityBusManager) facilityBusMgrControl.getMock();
		busMgr.retrieveFacilityMasterByPrimaryKey(20080903000000111l);
		facilityBusMgrControl.setReturnValue(facilityMaster);
		facilityBusMgrControl.replay();

		ReadFacilityOperation op = new ReadFacilityOperation();
		op.setActualFacilityBusManager(busMgr);

		OBFacilityTrxValue readTrxValue = new OBFacilityTrxValue();
		readTrxValue.setTransactionID(trxValue.getTransactionID());

		ICMSTrxResult trxResult = operateUsingDefaultReadProcess(op, readTrxValue);
		assertNotNull(trxResult.getTrxValue());

		trxValue = (OBFacilityTrxValue) trxResult.getTrxValue();
		assertEquals(20080903000000111l, Long.parseLong(trxValue.getReferenceID()));
		assertEquals(20080903000000111l, trxValue.getFacilityMaster().getId());

		facilityBusMgrControl.verify();
	}
}

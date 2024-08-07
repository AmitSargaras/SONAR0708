package com.integrosys.cms.app.limit.trx;

import org.easymock.MockControl;

import com.integrosys.cms.app.limit.bus.IFacilityBusManager;
import com.integrosys.cms.app.limit.bus.OBFacilityMaster;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

/**
 * @author Chong Jun Yong
 * @author 03.09.2008
 */
public class ReadFacilityByFacilityIdOperationTest extends TransactionEngineTestCase {
	MockControl facilityBusMgrControl;

	MockControl stagingFacilityBusMgrControl;

	public void testReadFacilityTransactionValueUsingFacilityMasterIdAndTrxType() throws Exception {
		OBFacilityMaster facilityMaster = new OBFacilityMaster();
		facilityMaster.setId(20080903000000111l);

		OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
		stagingFacilityMaster.setId(20080903000000112l);

		OBFacilityTrxValue trxValue = new OBFacilityTrxValue();

		trxValue.setFacilityMaster(facilityMaster);
		trxValue.setStagingFacilityMaster(stagingFacilityMaster);
		trxValue.setReferenceID(String.valueOf(facilityMaster.getId()));
		trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));
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

		stagingFacilityBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
		IFacilityBusManager stgBusMgr = (IFacilityBusManager) stagingFacilityBusMgrControl.getMock();
		stgBusMgr.retrieveFacilityMasterByPrimaryKey(20080903000000112l);
		stagingFacilityBusMgrControl.setReturnValue(stagingFacilityMaster);
		stagingFacilityBusMgrControl.replay();

		ReadFacilityByFacilityIdOperation op = new ReadFacilityByFacilityIdOperation();
		op.setActualFacilityBusManager(busMgr);
		op.setStagingFacilityBusManager(stgBusMgr);

		OBFacilityTrxValue readTrxValue = new OBFacilityTrxValue();
		readTrxValue.setReferenceID(String.valueOf(facilityMaster.getId()));
		readTrxValue.setInstanceName("FACILITY");

		ICMSTrxResult trxResult = operateUsingDefaultReadProcess(op, readTrxValue);
		assertNotNull(trxResult.getTrxValue());

		trxValue = (OBFacilityTrxValue) trxResult.getTrxValue();
		assertEquals(20080903000000111l, Long.parseLong(trxValue.getReferenceID()));
		assertEquals(20080903000000112l, Long.parseLong(trxValue.getStagingReferenceID()));
		assertEquals(20080903000000111l, trxValue.getFacilityMaster().getId());
		assertEquals(20080903000000112l, trxValue.getStagingFacilityMaster().getId());

		facilityBusMgrControl.verify();
		stagingFacilityBusMgrControl.verify();
	}
}

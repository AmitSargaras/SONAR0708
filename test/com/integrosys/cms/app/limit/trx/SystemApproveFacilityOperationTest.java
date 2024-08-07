package com.integrosys.cms.app.limit.trx;

import com.integrosys.cms.app.limit.bus.IFacilityBusManager;
import com.integrosys.cms.app.limit.bus.OBFacilityMaster;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;
import org.easymock.MockControl;

/**
 * @author Andy Wong
 */
public class SystemApproveFacilityOperationTest extends TransactionEngineTestCase {
    MockControl actBusMgrControl;
    MockControl stgBusMgrControl;

    public void testSystemApproveActiveFacilityMaster() throws Exception {
        OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
        stagingFacilityMaster.setId(20080903000000112l);

        OBFacilityMaster actualFacilityMaster = new OBFacilityMaster();
        actualFacilityMaster.setId(20080903000000111l);

        stgBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
        IFacilityBusManager stgBusMgr = (IFacilityBusManager) stgBusMgrControl.getMock();
        stgBusMgr.createFacilityMaster(stagingFacilityMaster);
        stgBusMgrControl.setReturnValue(stagingFacilityMaster);
        stgBusMgrControl.replay();

        actBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
        IFacilityBusManager actBusMgr = (IFacilityBusManager) actBusMgrControl.getMock();
        actBusMgr.updateToWorkingCopy(actualFacilityMaster, stagingFacilityMaster);
        actBusMgrControl.setReturnValue(actualFacilityMaster);
        actBusMgrControl.replay();

        OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
        trxValue.setFromState("PENDING_UPDATE");
        trxValue.setToState("LOADING");
        trxValue.setInstanceName("FACILITY");
        trxValue.setStagingFacilityMaster(stagingFacilityMaster);
        trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));
        trxValue.setReferenceID(String.valueOf(actualFacilityMaster.getId()));
        trxValue.setFacilityMaster(actualFacilityMaster);

        trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

        SystemApproveFacilityOperation op = new SystemApproveFacilityOperation();
        op.setActualFacilityBusManager(actBusMgr);
        op.setStagingFacilityBusManager(stgBusMgr);

        ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
        trxValue = (OBFacilityTrxValue) result.getTrxValue();

        assertEquals("LOADING", trxValue.getFromState());
        assertEquals("ACTIVE", trxValue.getToState());
        assertEquals(String.valueOf(20080903000000111l), trxValue.getReferenceID());

        stgBusMgrControl.verify();
        actBusMgrControl.verify();
    }

    public void testSystemApproveDeleteFacilityMaster() throws Exception {
        OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
        stagingFacilityMaster.setId(20080903000000112l);

        OBFacilityMaster actualFacilityMaster = new OBFacilityMaster();
        actualFacilityMaster.setId(20080903000000111l);

        stgBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
        IFacilityBusManager stgBusMgr = (IFacilityBusManager) stgBusMgrControl.getMock();
        stgBusMgr.createFacilityMaster(stagingFacilityMaster);
        stgBusMgrControl.setReturnValue(stagingFacilityMaster);
        stgBusMgrControl.replay();

        actBusMgrControl = MockControl.createControl(IFacilityBusManager.class);
        IFacilityBusManager actBusMgr = (IFacilityBusManager) actBusMgrControl.getMock();
        actBusMgr.updateToWorkingCopy(actualFacilityMaster, stagingFacilityMaster);
        actBusMgrControl.setReturnValue(actualFacilityMaster);
        actBusMgrControl.replay();

        OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
        trxValue.setFromState("PENDING_UPDATE");
        trxValue.setToState("LOADING_DELETE");
        trxValue.setInstanceName("FACILITY");
        trxValue.setStagingFacilityMaster(stagingFacilityMaster);
        trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));
        trxValue.setReferenceID(String.valueOf(actualFacilityMaster.getId()));
        trxValue.setFacilityMaster(actualFacilityMaster);

        trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

        SystemApproveFacilityOperation op = new SystemApproveFacilityOperation();
        op.setActualFacilityBusManager(actBusMgr);
        op.setStagingFacilityBusManager(stgBusMgr);

        ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
        trxValue = (OBFacilityTrxValue) result.getTrxValue();

        assertEquals("LOADING_DELETE", trxValue.getFromState());
        assertEquals("DELETED", trxValue.getToState());
        assertEquals(String.valueOf(20080903000000111l), trxValue.getReferenceID());

        stgBusMgrControl.verify();
        actBusMgrControl.verify();
    }
}
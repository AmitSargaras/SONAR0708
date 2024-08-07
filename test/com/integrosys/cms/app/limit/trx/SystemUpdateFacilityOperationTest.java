package com.integrosys.cms.app.limit.trx;

import com.integrosys.cms.app.limit.bus.IFacilityBusManager;
import com.integrosys.cms.app.limit.bus.OBFacilityMaster;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;
import org.easymock.MockControl;

/**
 * @author Andy Wong
 */
public class SystemUpdateFacilityOperationTest extends TransactionEngineTestCase {

    public void testSystemUpdateFacilityMaster() throws Exception {
        OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
        stagingFacilityMaster.setId(20080903000000112l);

        OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
        trxValue.setFromState("PENDING_UPDATE");
        trxValue.setToState("LOADING");
        trxValue.setInstanceName("FACILITY");
        trxValue.setStagingFacilityMaster(stagingFacilityMaster);
        trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

        trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

        SystemUpdateFacilityOperation op = new SystemUpdateFacilityOperation();
        ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
        trxValue = (OBFacilityTrxValue) result.getTrxValue();

        assertEquals("LOADING", trxValue.getFromState());
        assertEquals("PENDING_RETRY", trxValue.getToState());
    }

    public void testSystemRejectFacilityMaster() throws Exception {
        OBFacilityMaster stagingFacilityMaster = new OBFacilityMaster();
        stagingFacilityMaster.setId(20080903000000112l);

        OBFacilityTrxValue trxValue = new OBFacilityTrxValue();
        trxValue.setFromState("PENDING_UPDATE");
        trxValue.setToState("LOADING");
        trxValue.setInstanceName("FACILITY");
        trxValue.setStagingFacilityMaster(stagingFacilityMaster);
        trxValue.setStagingReferenceID(String.valueOf(stagingFacilityMaster.getId()));

        trxValue = (OBFacilityTrxValue) createTransaction(trxValue);

        SystemUpdateFacilityOperation op = new SystemUpdateFacilityOperation();
        op.setOperationName(FacilityTrxController.ACTION_SYSTEM_REJECT);

        ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
        trxValue = (OBFacilityTrxValue) result.getTrxValue();

        assertEquals("LOADING", trxValue.getFromState());
        assertEquals("PENDING_PERFECTION", trxValue.getToState());
    }
}
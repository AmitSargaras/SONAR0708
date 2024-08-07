package com.integrosys.cms.app.limitsOfAuthorityMaster.trx;

import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.cms.app.common.constant.ICMSConstant;

public class MakerCloseDraftOperation extends AbstractTrxOperation  {

	 private static final String DEFAULT_OPERATION_NAME = ICMSConstant.LimitsOfAuthorityMaster.ACTION_MAKER_CLOSE_DRAFT_LIMITS_OF_AUTHORITY;
	 private String operationName;
	
	public MakerCloseDraftOperation() {
		operationName = DEFAULT_OPERATION_NAME;
	}
	
	public String getOperationName() {
        return operationName;
    }

    public void setOperationName(String operationName) {
        this.operationName = operationName;
    }
	
    public ITrxResult performProcess(ITrxValue anITrxValue) throws TrxOperationException {
        ILimitsOfAuthorityMasterTrxValue trxValue = getTrxValue(anITrxValue);
        trxValue = updateTrx(trxValue);
        return super.prepareResult(trxValue);
    }

}
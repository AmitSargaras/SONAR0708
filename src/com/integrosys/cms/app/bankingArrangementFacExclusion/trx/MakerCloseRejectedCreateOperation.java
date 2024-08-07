package com.integrosys.cms.app.bankingArrangementFacExclusion.trx;

import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.cms.app.common.constant.ICMSConstant;

public class MakerCloseRejectedCreateOperation extends AbstractTrxOperation{

	 private static final String DEFAULT_OPERATION_NAME = ICMSConstant.ACTION_MAKER_CLOSE_REJECTED_CREATE_BANKING_ARRANGEMENT_FAC_EXCLUSION;
	 private String operationName;
	  
	 public MakerCloseRejectedCreateOperation(){
		 operationName = DEFAULT_OPERATION_NAME;
	 }
	  
	 public String getOperationName() {
		 return operationName;
	 }

	 public void setOperationName(String operationName) {
		 this.operationName = operationName;
	 }
	
  public ITrxResult performProcess(ITrxValue anITrxValue) throws TrxOperationException {
      IBankingArrangementFacExclusionTrxValue trxValue = super.getTrxValue(anITrxValue);
      trxValue = super.updateTrx(trxValue);
      return super.prepareResult(trxValue);
  }

}
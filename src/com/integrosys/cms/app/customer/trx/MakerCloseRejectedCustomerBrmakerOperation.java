package com.integrosys.cms.app.customer.trx;

import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.cms.app.common.constant.ICMSConstant;

	/**
	 * Class created by
	 * @author sandiip.shinde
	 * @since 06-04-2011
	 *
	 */

public class MakerCloseRejectedCustomerBrmakerOperation extends AbstractCustomerTrxOperation{

	public MakerCloseRejectedCustomerBrmakerOperation() {
		super();
	}

	/**
	 * Get the operation name of the current operation
	 * 
	 * @return String - the operation name of the current operation
	 */
	
	public String getOperationName() {
		return ICMSConstant.ACTION_MAKER_CLOSE_CUSTOMER_BRMAKER;
	}
	
	
	public ITrxResult performProcess(ITrxValue value) throws TrxOperationException {
		ICMSCustomerTrxValue trxValue = super.getCustomerTrxValue(value);

		trxValue = super.getCustomerTrxValue(trxValue);
		trxValue = updateCustomerTrx(trxValue);
		return super.prepareResult(trxValue);
	}

}

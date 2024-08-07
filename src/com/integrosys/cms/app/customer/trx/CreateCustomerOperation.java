/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/customer/trx/CreateCustomerOperation.java,v 1.5 2003/09/28 13:55:17 slong Exp $
 */
package com.integrosys.cms.app.customer.trx;

//ofa
import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.cms.app.common.constant.ICMSConstant;

/**
 * This operation creates a customer
 * 
 * @author $Author: slong $
 * @version $Revision: 1.5 $
 * @since $Date: 2003/09/28 13:55:17 $ Tag: $Name: $
 */
public class CreateCustomerOperation extends AbstractCustomerTrxOperation {
	/**
	 * Defaulc Constructor
	 */
	public CreateCustomerOperation() {
		super();
	}

	/**
	 * Get the operation name of the current operation
	 * 
	 * @return String - the operation name of the current operation
	 */
	public String getOperationName() {
		return ICMSConstant.ACTION_CREATE_CUSTOMER;
	}

	/**
	 * The following tasks are performed:
	 * 
	 * 1. create Actual Customer record 2. create Transaction record
	 * 
	 * @param value is of type ITrxValue
	 * @return ITrxResult
	 * @throws TrxOperationException on error
	 */
	public ITrxResult performProcess(ITrxValue value) throws TrxOperationException {
		ICMSCustomerTrxValue trxValue = super.getCustomerTrxValue(value);

		 trxValue = super.createStagingCustomer(trxValue);	
//		trxValue = super.createActualCustomer(trxValue);	/*  Commented By Sandeep Shinde on 23-03-2011 for Doing Maker-Checker*/
		trxValue = super.createTransaction(trxValue);

		return super.prepareResult(trxValue);
	}
}
/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/checklist/trx/MakerDraftCreateRecurrentCheckListOperation.java,v 1.1 2005/04/08 19:53:02 htli Exp $
 */
package com.integrosys.cms.app.recurrent.trx;

//ofa
import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.cms.app.common.constant.ICMSConstant;

/**
 * This operation allows a maker to edit a rejected checklist transaction
 * creation
 * 
 * @author $Author: htli $
 * @version $Revision: 1.1 $
 * @since $Date: 2005/04/08 19:53:02 $ Tag: $Name: $
 */
public class MakerDraftCreateRecurrentCheckListOperation extends AbstractRecurrentCheckListTrxOperation {
	/**
	 * Defaulc Constructor
	 */
	public MakerDraftCreateRecurrentCheckListOperation() {
		super();
	}

	/**
	 * Get the operation name of the current operation
	 * 
	 * @return String - the operation name of the current operation
	 */
	public String getOperationName() {
		return ICMSConstant.ACTION_MAKER_DRAFT_CREATE_RECURRENT_CHECKLIST;
	}

	/**
	 * Process the transaction 1. Update the transaction record
	 * @param anITrxValue - ITrxValue
	 * @return ITrxResult - the transaction result
	 * @throws com.integrosys.base.businfra.transaction.TrxOperationException if
	 *         encounters any error during the processing of the transaction
	 */
	public ITrxResult performProcess(ITrxValue anITrxValue) throws TrxOperationException {
		IRecurrentCheckListTrxValue trxValue = createStagingCheckList(getCheckListTrxValue(anITrxValue));
		trxValue = updateCheckListTransaction(trxValue);
		return super.prepareResult(trxValue);
	}
}
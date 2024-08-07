/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/generatereq/trx/MakerCloseRejectedCreateWaiverRequestOperation.java,v 1.3 2003/09/19 09:31:07 hltan Exp $
 */
package com.integrosys.cms.app.generatereq.trx;

//java
import java.rmi.RemoteException;
import java.util.ArrayList;

import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TransactionException;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.cms.app.checklist.bus.CheckListException;
import com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory;
import com.integrosys.cms.app.checklist.proxy.ICheckListProxyManager;
import com.integrosys.cms.app.checklist.trx.ICheckListTrxValue;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.generatereq.bus.IWaiverRequest;
import com.integrosys.cms.app.generatereq.bus.IWaiverRequestItem;
import com.integrosys.cms.app.transaction.ICMSTrxValue;

/**
 * This operation allows a maker to close a rejected waiver request creation
 * transaction
 * 
 * @author $Author: hltan $
 * @version $Revision: 1.3 $
 * @since $Date: 2003/09/19 09:31:07 $ Tag: $Name: $
 */
public class MakerCloseRejectedCreateWaiverRequestOperation extends AbstractWaiverRequestTrxOperation {
	/**
	 * Defaulc Constructor
	 */
	public MakerCloseRejectedCreateWaiverRequestOperation() {
		super();
	}

	/**
	 * Get the operation name of the current operation
	 * 
	 * @return String - the operation name of the current operation
	 */
	public String getOperationName() {
		return ICMSConstant.ACTION_MAKER_CLOSE_REJECTED_CREATE_GENERATE_WAIVER_REQ;
	}

	/**
	 * Pre process. Prepares the transaction object for persistance Get the
	 * parent transaction ID to be appended as trx parent ref
	 * @param anITrxValue is of type ITrxValue
	 * @return ITrxValue
	 * @throws TrxOperationException on error
	 */
	public ITrxValue preProcess(ITrxValue anITrxValue) throws TrxOperationException {
		anITrxValue = super.preProcess(anITrxValue);
		IWaiverRequestTrxValue trxValue = getWaiverRequestTrxValue(anITrxValue);
		IWaiverRequest staging = trxValue.getStagingWaiverRequest();
		try {
			if (staging != null) {
				if (staging.getLimitProfileID() != com.integrosys.cms.app.common.constant.ICMSConstant.LONG_INVALID_VALUE) {
					ICMSTrxValue parentTrx = getTrxManager().getTrxByRefIDAndTrxType(
							String.valueOf(staging.getLimitProfileID()), ICMSConstant.INSTANCE_LIMIT_PROFILE);
					trxValue.setTrxReferenceID(parentTrx.getTransactionID());
				}
				fireCheckListTrx(staging);
			}
			return trxValue;
		}
		catch (TransactionException ex) {
			throw new TrxOperationException(ex);
		}
		catch (RemoteException ex) {
			throw new TrxOperationException("Exception in preProcess: " + ex.toString());
		}
	}

	private void fireCheckListTrx(IWaiverRequest anIWaiverRequest) throws TrxOperationException {
		IWaiverRequestItem[] itemList = anIWaiverRequest.getWaiverRequestItemList();
		ArrayList checklist = new ArrayList();
		if ((itemList == null) || (itemList.length == 0)) {
			return;
		}

		try {
			ICheckListProxyManager proxy = CheckListProxyManagerFactory.getCheckListProxyManager();
			ICheckListTrxValue checkListTrxValue = null;
			for (int ii = 0; ii < itemList.length; ii++) {
				if (!checklist.contains(new Long(itemList[ii].getCheckListID()))) {
					checklist.add(new Long(itemList[ii].getCheckListID()));
					checkListTrxValue = proxy.getCheckList(itemList[ii].getCheckListID());
					proxy.systemRejectGenerateCheckListWaiver(checkListTrxValue);
				}
			}
		}
		catch (CheckListException ex) {
			throw new TrxOperationException("CheckListException in fireCheckListTrx", ex);
		}
	}

	/**
	 * Process the transaction 1. Update the transaction record
	 * @param anITrxValue - ITrxValue
	 * @return ITrxResult - the transaction result
	 * @throws TrxOperationException if encounters any error during the
	 *         processing of the transaction
	 */
	public ITrxResult performProcess(ITrxValue anITrxValue) throws TrxOperationException {
		IWaiverRequestTrxValue trxValue = super.getWaiverRequestTrxValue(anITrxValue);
		trxValue = updateWaiverRequestTransaction(trxValue);
		return super.prepareResult(trxValue);
	}
}
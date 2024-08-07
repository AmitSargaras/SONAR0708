package com.integrosys.cms.app.propertyparameters.trx;

import java.rmi.RemoteException;

import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TransactionException;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.propertyparameters.bus.IPropertyParameters;
import com.integrosys.cms.app.transaction.ICMSTrxValue;

/**
 * Created by IntelliJ IDEA. User: zhaijian Date: Feb 1, 2007 Time: 10:02:25 AM
 * To change this template use File | Settings | File Templates.
 */
public class MakerCreatePrPaOperation extends AbstractProPaTrxOperation {

	/**
	 * Defaulc Constructor
	 */
	public MakerCreatePrPaOperation() {
		super();
	}

	/**
	 * Get the operation name of the current operation
	 * 
	 * @return String - the operation name of the current operation
	 */
	public String getOperationName() {
		return ICMSConstant.ACTION_MAKER_CREATE_PRPA;
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
		IPrPaTrxValue trxValue = getCCDocumentLocationTrxValue(anITrxValue);
		IPropertyParameters staging = trxValue.getStagingPrPa();
		DefaultLogger.debug(this, "1 === staging value is null ?  :" + (staging == null));

		// IPropertyParameters ob = new OBPropertyParameters();
		// ob.setBuildupAreaValueFrom(1111);
		// trxValue.setStagingPrPa(ob);
		//
		DefaultLogger.debug(this, "1 === staging value is null ?  :" + (staging == null));

		try {
			if (staging != null) {
				ICMSTrxValue parentTrx = null;
				if (staging.getParameterId() != com.integrosys.cms.app.common.constant.ICMSConstant.LONG_INVALID_VALUE) {
					parentTrx = getTrxManager().getTrxByRefIDAndTrxType(String.valueOf(staging.getParameterId()),
							ICMSConstant.INSTANCE_AUTO_VAL_PARAM);
					trxValue.setTrxReferenceID(parentTrx.getTransactionID());
					DefaultLogger.debug(this, "2 ==== staging.getParameterId() ?  :" + staging.getParameterId());
				}

				return trxValue;
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

	/**
	 * Process the transaction 1. Create the staging data 2. Create the
	 * transaction record
	 * @param anITrxValue of ITrxValue type
	 * @return ITrxResult - the transaction result
	 * @throws TrxOperationException if encounters any error during the
	 *         processing of the transaction
	 */
	public ITrxResult performProcess(ITrxValue anITrxValue) throws TrxOperationException {
		IPrPaTrxValue trxValue = super.getCCDocumentLocationTrxValue(anITrxValue);
		DefaultLogger.debug(this, "trxValue is null ? " + (trxValue == null));
		DefaultLogger.debug(this, " ---- trxValue.getStagingPrPa() is null ? ----- "
				+ (trxValue.getStagingPrPa() == null));

		trxValue = createStagingCCDocumentLocation(trxValue);
		trxValue = createCCDocumentLocationTransaction(trxValue);
		return super.prepareResult(trxValue);
	}

	/**
	 * Create a CC document location transaction
	 * @param anICCDocumentLocationTrxValue of ICCDocumentLocationTrxValue type
	 * @return ICCDocumentLocationTrxValue - the CC document location specific
	 *         transaction object created
	 * @throws TrxOperationException if there is any processing errors
	 */
	private IPrPaTrxValue createCCDocumentLocationTransaction(IPrPaTrxValue anICCDocumentLocationTrxValue)
			throws TrxOperationException {
		try {
			anICCDocumentLocationTrxValue = prepareTrxValue(anICCDocumentLocationTrxValue);
			ICMSTrxValue trxValue = createTransaction(anICCDocumentLocationTrxValue);
			OBPrPaTrxValue colDocumentLocationTrxValue = new OBPrPaTrxValue(trxValue);
			colDocumentLocationTrxValue.setStagingPrPa(anICCDocumentLocationTrxValue.getStagingPrPa());
			colDocumentLocationTrxValue.setPrPa(anICCDocumentLocationTrxValue.getPrPa());
			return colDocumentLocationTrxValue;
		}
		catch (TransactionException ex) {
			throw new TrxOperationException(ex);
		}
		catch (Exception ex) {
			throw new TrxOperationException("General Exception: " + ex.toString());
		}
	}

}

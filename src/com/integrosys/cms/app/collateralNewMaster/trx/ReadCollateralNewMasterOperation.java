package com.integrosys.cms.app.collateralNewMaster.trx;

import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TransactionException;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.transaction.ICMSTrxValue;
import com.integrosys.cms.app.transaction.ITrxReadOperation;

/**
 * @author abhijit.rudrakshawar
 * Read System Bank Operation 
 */

public class ReadCollateralNewMasterOperation extends AbstractCollateralNewMasterTrxOperation implements ITrxReadOperation {
    /**
     * Default Constructor
     */
    public ReadCollateralNewMasterOperation() {
        super();
    }

    /**
     * Get the operation name of the current operation
     *
     * @return String - the operation name of the current operation
     */
    public String getOperationName() {
        return ICMSConstant.ACTION_READ_COLLATERAL_NEW_MASTER;
    }

    /**
     * This method is used to read a transaction object
     *
     * @param anITrxValue the ITrxValue object containing the parameters required for
     *                    retrieving a record, such as the transaction ID.
     * @return ITrxValue - containing the requested data.
     * @throws com.integrosys.base.businfra.transaction.TransactionException
     *          if any other errors occur.
     */
    public ITrxValue getTransaction(ITrxValue anITrxValue) throws TransactionException {
    	try {
            ICMSTrxValue trxValue = super.getCMSTrxValue(anITrxValue);
            trxValue = (ICMSTrxValue) getTrxManager().getTrxByRefIDAndTrxType(trxValue.getReferenceID(), trxValue.getTransactionType());
            OBCollateralNewMasterTrxValue newValue = new OBCollateralNewMasterTrxValue(trxValue);

            String stagingRef = trxValue.getStagingReferenceID();
            String actualRef = trxValue.getReferenceID();

            DefaultLogger.debug(this, "Actual Reference: " + actualRef + " , Staging Reference: " + stagingRef);

            if (null != stagingRef) {
                long stagingPK = Long.parseLong(stagingRef);
                newValue.setStagingCollateralNewMaster(getStagingCollateralNewMasterBusManager().getCollateralNewMasterById(stagingPK));
            }else{
            	throw new TrxOperationException("Staging Reference Id is null");
            }

            if (null != actualRef) {
                long actualPK = Long.parseLong(actualRef);

                newValue.setCollateralNewMaster(getCollateralNewMasterBusManager().getCollateralNewMasterById(actualPK));
            }else{
            	throw new TrxOperationException("Actual Reference Id is null");
            }

            return newValue;
        }
        catch (Exception ex) {
            throw new TrxOperationException(ex.getMessage());
        }
    }
}

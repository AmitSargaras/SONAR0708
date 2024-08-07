package com.integrosys.cms.app.geography.city.trx;

import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.geography.city.bus.CityReplicationUtils;
import com.integrosys.cms.app.geography.city.bus.ICity;

public class MakerSaveUpdateCityOperation extends AbstractCityTrxOperation{

	/**
     * Defaulc Constructor
     */
    public MakerSaveUpdateCityOperation() {
        super();
    }

    /**
     * Get the operation name of the current operation
     *
     * @return String - the operation name of the current operation
     */
    public String getOperationName() {
        return ICMSConstant.ACTION_MAKER_UPDATE_SAVE_CITY;
    }

    /**
     * Process the transaction
     * 1.	Create the staging data
     * 2.	Update the transaction record
     *
     * @param anITrxValue of ITrxValue type
     * @return ITrxResult - the transaction result
     * @throws TrxOperationException if encounters any error during the processing of the transaction
     */
    
    public ITrxResult performProcess(ITrxValue anITrxValue) throws TrxOperationException {
    	ICityTrxValue idxTrxValue = getCityTrxValue(anITrxValue);
    	ICity stage = idxTrxValue.getStagingCity();
    	ICity replicatedCity = CityReplicationUtils.replicateCityForCreateStagingCopy(stage);
        idxTrxValue.setStagingCity(replicatedCity);

        ICityTrxValue trxValue = createStagingCity(idxTrxValue);
        trxValue = updateCityTrx(trxValue);
        return super.prepareResult(trxValue);
    }
}

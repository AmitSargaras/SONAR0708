package com.integrosys.cms.app.custgrpi.trx;

import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxOperationException;

public class Maker2SaveOperation extends MakerSaveOperation {

    /**
     * Defaulc Constructor
     */
    public Maker2SaveOperation() {
        super();
    }


    /**
     * Get the operation name of the current operation
     *
     * @return String - the operation name of the current operation
     */
    public String getOperationName() {
        return ICMSConstant.ACTION_MAKER2_SAVE_CUST_GRP_IDENTIFIER;
    }




}

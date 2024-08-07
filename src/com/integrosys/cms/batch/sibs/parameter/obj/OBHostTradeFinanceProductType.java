package com.integrosys.cms.batch.sibs.parameter.obj;

import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.batch.sibs.parameter.IParameterProperty;

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: Cynthia
 * Date: Oct 2, 2008
 * Time: 3:51:13 PM
 * To change this template use File | Settings | File Templates.
 */
public class OBHostTradeFinanceProductType extends OBHostProductType implements IHostProductType, Serializable {
    
//    private static final String[] MATCHING_PROPERTIES = new String[] { "loanType" };
//    private static final String[] IGNORED_PROPERTIES = new String[] { "loanType", "source", "status", "lastUpdatedDate" };

    public void defaultSource() {
        // default reference entry code
        setSource("TFPAR2");
    }

//    public String[] getMatchingProperties() {
//        return MATCHING_PROPERTIES;
//    }
//
//    public String[] getIgnoreProperties() {
//        return IGNORED_PROPERTIES;
//    }


}
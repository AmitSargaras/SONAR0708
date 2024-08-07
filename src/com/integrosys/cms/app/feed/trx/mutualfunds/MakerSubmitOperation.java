/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/feed/trx/bond/MakerSubmitOperation.java,v 1.1 2003/08/06 08:10:08 btchng Exp $
 */
package com.integrosys.cms.app.feed.trx.mutualfunds;

//java

import com.integrosys.cms.app.common.constant.ICMSConstant;

/**
 * This operation allows a maker to submit an bond feed group It is the same as
 * the MakerUpdateOperation except that it transits to a different state and
 * routed to checker for approval, both of which is handled by transaction
 * manager As such, this class just returns a different operation name.
 * 
 * @author $Author: Dattatray Thorat $
 * @version $Revision: 1.4 $
 * @since $Date: 2011/05/10 10:45:20 $ Tag: $Name%
 */
public class MakerSubmitOperation extends MakerUpdateOperation {

	/**
	 * Defaulc Constructor
	 */
	public MakerSubmitOperation() {
		super();
	}

	/**
	 * Get the operation name of the current operation
	 * 
	 * @return String - the operation name of the current operation
	 */
	public String getOperationName() {
		return ICMSConstant.ACTION_MAKER_SUBMIT_MUTUAL_FUNDS_FEED_GROUP;
	}

}
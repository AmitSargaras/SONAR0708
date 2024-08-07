/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/ddn/bus/DDNException.java,v 1.1 2003/08/13 11:27:25 hltan Exp $
 */
package com.integrosys.cms.app.propertyparameters.bus;

//ofa
import com.integrosys.base.techinfra.exception.OFAException;

/**
 * General exception class for the ddn package. It should be thrown when there
 * is any exception encountered in the ddn process that requires no special
 * handling.
 * 
 * @author $Author: hltan $<br>
 * @version $Revision: 1.1 $
 * @since $Date: 2003/08/13 11:27:25 $ Tag: $Name: $
 */

public class PropertyParametersException extends OFAException {
	/**
	 * Default Constructor
	 */
	public PropertyParametersException() {
		super();
	}

	/**
	 * Constructor
	 * @param msg - the message string
	 */
	public PropertyParametersException(String msg) {
		super(msg);
	}

	/**
	 * Constructor
	 * @param t - Throwable
	 */
	public PropertyParametersException(Throwable t) {
		super(t);
	}

	/**
	 * Constructor
	 * @param msg - message String
	 * @param t - Throwable
	 */
	public PropertyParametersException(String msg, Throwable t) {
		super(msg, t);
	}
}

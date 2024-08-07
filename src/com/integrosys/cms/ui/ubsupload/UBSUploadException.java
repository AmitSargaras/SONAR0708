package com.integrosys.cms.ui.ubsupload;

import com.integrosys.base.techinfra.exception.OFAException;

/**
 * General exception class for the UBS Upload package. This exception is thrown
 * for any errors during UBS Upload processing
 * 
 * @author $Author: Abhijeet J 
 * @version 1.0
 * @since $Date: 31/03/2011 02:37:00 
 */

public class UBSUploadException extends OFAException{
	
	/**
	 * Constructor
	 * @param msg - the message string
	 */
	public UBSUploadException(String msg){
		super(msg);
	}
	
	/**
	 * Constructor
	 * @param msg - message String
	 * @param t - Throwable
	 */
	public UBSUploadException(String msg, Throwable t) {
		super(msg, t);
	}


}

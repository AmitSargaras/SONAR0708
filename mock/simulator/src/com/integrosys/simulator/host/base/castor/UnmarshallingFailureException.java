package com.integrosys.simulator.host.base.castor;

import org.exolab.castor.xml.XMLException;

/**
 * Exception to be raised when there is failure on unmarhsall from xml to object
 *
 * @author Chong Jun Yong
 * @author KC Chin
 *
 */
public class UnmarshallingFailureException extends XmlMappingException {

	private static final long serialVersionUID = -8027098811632467236L;

	/**
	 * Default Constructor to provide error message and throwable cause.
	 *
	 * @param msg error message for this exception
	 * @param cause exception that cause this exception to be thrown, the XML
	 *        Exception of the castor
	 */
	public UnmarshallingFailureException(String msg, XMLException cause) {
		super(msg, cause);
	}
}
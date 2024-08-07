package com.integrosys.simulator.host.base.castor;
import com.integrosys.base.techinfra.exception.OFAException;

/**
 * Base class for exception thrown by the framework whenever it encounters a
 * problem related to EAI.
 * 
 * @author marvin
 * @author Chong Jun Yong
 * @author KC Chin
 * @since 1.1
 */
public abstract class MQMessageException extends OFAException {

	private static final long serialVersionUID = -8767767942547842235L;

	/**
	 * Default Constructor to provide error message
	 * 
	 * @param msg error message for this exception
	 */
	public MQMessageException(String msg) {
		super(msg);
	}

	/**
	 * Default Constructor to provide error message and throwable cause.
	 * 
	 * @param msg error message for this exception
	 * @param cause exception that cause this exception to be thrown
	 */
	public MQMessageException(String msg, Throwable cause) {
		super(msg, cause);
	}

}

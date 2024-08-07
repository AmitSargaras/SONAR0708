package com.integrosys.simulator.host.mq;

import javax.jms.ExceptionListener;
import javax.jms.JMSException;

import com.integrosys.base.techinfra.logger.DefaultLogger;

/**
 * @author $Author: marvin $<br>
 * @author KC Chin
 * @version $Id$
 */
public class MQExceptionListener implements ExceptionListener {
	MQMessageCenter parent = null;

	/**
	 * Default Constructor
	 */
	public MQExceptionListener() {
	}

	public MQExceptionListener(MQMessageCenter parent) {
		this.parent = parent;
	}

	/**
	 * Exception
	 */
	public void onException(JMSException e) {
		DefaultLogger.error(this, "Caught JMSException in MQExceptionListener!", e);
		// try to reconnect in reloadable
		if (null != parent) {
			parent.setReconnect(true);
		}
	}
}

package com.integrosys.cms.host.eai.support;

import com.integrosys.cms.host.eai.Message;

/**
 * Mock Message Handler Observer
 * 
 * @author Chong Jun Yong
 * @since 27.08.2008
 * 
 */
public class MockMessageHandlerObserver implements MessageHandlerObserver {

	private String holderMsgId;

	public String getHolderMsgId() {
		return holderMsgId;
	}

	public void setHolderMsgId(String holderMsgId) {
		this.holderMsgId = holderMsgId;
	}

	public MockMessageHandlerObserver(String holderMsgId) {
		this.holderMsgId = holderMsgId;
	}

	public void update(Object object) {
		if (!(object instanceof Message)) {
			throw new IllegalArgumentException("object is not instance of '" + Message.class + "' but ["
					+ object.getClass().getName() + "]");
		}
	}

	public String toString() {
		return "MockMessageHandlerObserver@" + Integer.toHexString(holderMsgId.hashCode()) + ", MsgId [" + holderMsgId
				+ "]";
	}
}

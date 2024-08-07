package com.integrosys.simulator.host.base.castor;

import com.integrosys.simulator.host.stp.STPBody;
import com.integrosys.simulator.host.stp.STPHeader;
/**
 * @author Andy Wong
 * @author KC Chin
 *
 */

public interface IMessage {

    public void setMsgBody(STPBody msgBody);

	public void setMsgHeader(com.integrosys.simulator.host.stp.STPHeader msgHeader);

    public STPBody getMsgBody();

	public STPHeader getMsgHeader();

}
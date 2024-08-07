package com.integrosys.simulator.host.mq;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.simulator.host.base.castor.CastorMessageIdBaseMessageMarshallerFactory;
import com.integrosys.simulator.host.base.castor.STPHeaderHelper;
import com.integrosys.simulator.host.mq.AbstractMessageHandler;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author Chin Kok Cheong
 * @since 1.0
 */
public class MQMessageHandler extends AbstractMessageHandler {

	private static final long serialVersionUID = 4153797472016252171L;

    public MQMessageHandler() {
		DefaultLogger.debug(this, "[mqMessageSettingMap] size: " + getMqMessageSettingMap().size());
        setMessageMarshallerFactory(new CastorMessageIdBaseMessageMarshallerFactory());

	}

    /*
     * This method to dynamically process the message receive
     * Step 1, if it require processByJavaObject, then it will perform castor unmarshall / marshall and process in object method, this is a TODO
     *         if it processByJavaObject = false, it process the message by append / replace the xml string
     * Step 2b, if it have replicate list, then replicate those value from message into the response message.
     * Step 3b, if it have replace list, then replace the response message with the new value
     * Step 4,  reply the response message
     *
     */
    public Object process(Object obj)throws Exception {
        String receivedMessage = (String) obj;
        String responseXML = getFixedResponseXML();

        boolean processByJavaObject = false;
        //current hard core to only process in xml String
        if(processByJavaObject){
            Object receivedObj = unmarshall(receivedMessage);
            Object responseObj = unmarshall(getFixedResponseXML());
            if(getReplicateList() != null && getReplicateList().size() > 0){
                responseObj = replicateProperties(receivedObj, responseObj, getReplicateList());
            }
            if(getReplaceArgMap() != null && getReplaceArgMap().size() > 0){
                responseObj = replaceProperties(responseObj, getReplaceArgMap());
            }
            responseXML = marshall(getMessageId(), responseObj);

        }else{
            if(getReplicateList() != null && getReplicateList().size() > 0){
                for(Iterator i = getReplicateList().iterator(); i.hasNext();){
                    String name = (String) i.next();
                    String value = STPHeaderHelper.getHeaderValue(receivedMessage, name);
                    responseXML = STPHeaderHelper.setHeaderValue(responseXML, name, value);
                }
            }
            if(getReplaceArgMap() != null && getReplaceArgMap().size() > 0){
                for(Iterator i = getReplaceArgMap().keySet().iterator(); i.hasNext();){
                    String name = (String) i.next();
                    responseXML = STPHeaderHelper.setHeaderValue(responseXML, name, (String) getReplaceArgMap().get(name));
                }
            }
        }

        return responseXML;
    }
    private Object replicateProperties(Object receivedObj,Object responseObj, List replicateList){
        //todo need to implement dynamically replicate value from receivedObj to responseObj according the replicateList
        return responseObj;
    }

    private Object replaceProperties(Object responseObj, Map replaceMap){
        //todo need to implement dynamically replace the value in responseObj according by the replaceMap key
        return responseObj;
    }
}
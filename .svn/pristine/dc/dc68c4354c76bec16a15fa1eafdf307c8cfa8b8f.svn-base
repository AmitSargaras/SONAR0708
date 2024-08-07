package com.integrosys.simulator.host.mq;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import org.springframework.jms.JmsException;
import org.springframework.jms.core.JmsTemplate;

import javax.jms.BytesMessage;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.TextMessage;

/**
 * @author Andy Wong
 * @author KC Chin
 * @since 24 April 2010
 */

public class MQJmsReceiver {

    private JmsTemplate jmsTemplate;

    public JmsTemplate getJmsTemplate() {
        return jmsTemplate;
    }

    public void setJmsTemplate(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }

    public Object processMessage(String messageSelector) {
        Message msg = getJmsTemplate().receiveSelected(messageSelector);

        try {
            if (msg instanceof TextMessage) {
                return ((TextMessage) msg).getText();
            } else if (msg instanceof BytesMessage) {
                BytesMessage bytesMessage = (BytesMessage) msg;
                byte[] responseByte = new byte[4096];
                bytesMessage.readBytes(responseByte); // assume readBytes will always return full bytes with MQ
                return responseByte;
            }
        } catch (JMSException e) {
            DefaultLogger.debug(this, "JMSException caught in MQJmsReceiver", e);
        }

        return null;
    }
}

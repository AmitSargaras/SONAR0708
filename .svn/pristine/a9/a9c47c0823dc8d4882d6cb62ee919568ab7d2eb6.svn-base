package com.integrosys.simulator.host.mq;


import com.integrosys.base.techinfra.logger.DefaultLogger;
import org.springframework.jms.JmsException;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

import javax.jms.*;


/**
 * @author Andy Wong
 * @author KC Chin
 * @since 24 April 2010
 */
public class MQJmsSender {
    private JmsTemplate jmsTemplate;
   // private final Logger logger = LoggerFactory.getLogger(getClass());

    public JmsTemplate getJmsTemplate() {
        return jmsTemplate;
    }

    public void setJmsTemplate(JmsTemplate jmsTemplate) {
        this.jmsTemplate = jmsTemplate;
    }

    public void sendMesage(final Object obj, final String correlationId) {
        getJmsTemplate().send(
            new MessageCreator() {
                public Message createMessage(Session session)throws JMSException {
                    Message message = null;
                    if (obj instanceof String) {
                        TextMessage textMessage = session.createTextMessage(obj.toString());
                        message = textMessage;
                    } else if (obj instanceof byte[]) {
                        byte[] byteTemp = (byte[]) obj;
                        BytesMessage bytesMessage = session.createBytesMessage();
                        bytesMessage.writeBytes(byteTemp);
                        message = bytesMessage;
                    } else {
                        DefaultLogger.debug(this, "Unknown object type in MQJmsSender.sendMesage(). Type:  " + obj.getClass());
                    }
                    message.setJMSCorrelationID(correlationId);
                    return message;
                }
            }
        );
    }
}

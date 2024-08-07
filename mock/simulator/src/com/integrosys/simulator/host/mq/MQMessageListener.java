package com.integrosys.simulator.host.mq;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.simulator.host.base.castor.MQJmsReceiver;
import org.springframework.jms.core.JmsTemplate;

import javax.jms.JMSException;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

/**
 * Spring DefaultMessageListener for MQ implementation
 *
 * @author Andy Wong
 * @author KC Chin
 * @since 22 April 2010
 */
public class MQMessageListener implements MessageListener {
  //  private final Logger logger = LoggerFactory.getLogger(getClass());

   // private MemoryMessageFolderImpl messageFolder;
    private IMessageHandler messageHandler;
    private String messageAttributeName;
    private long processWaitingSleepingPeriod;
    private MQJmsSender messageSender;
    private MQJmsReceiver messageReceiver;

    /**
     * Default Constructor
     */
    public MQMessageListener() {}

    public MQMessageListener(JmsTemplate jmsInTemplate, JmsTemplate jmsOutTemplate)throws Exception {
        messageReceiver = new MQJmsReceiver();
        messageReceiver.setJmsTemplate(jmsInTemplate);

        messageSender = new MQJmsSender();
        messageSender.setJmsTemplate(jmsOutTemplate);

        messageHandler = new MQMessageHandler();
    }

    /**
     * This method provides the implementation of the MessageListener interface.
     * When receive the message, first search and load the message setting form config/MQServices.xml
     * then if is dynamic response flag is N, return from the fixed Response Xml
     * if dynamic response flag is Y, perform replicate, replace function on the response xml
     * 
     */
    public void onMessage(javax.jms.Message message) {
        String msgId = null;
        String correlationID = null;

        try {
            correlationID = message.getJMSCorrelationID();
            DefaultLogger.info(this, "** [Text Message CorrelationID]: " + correlationID);
        }
        catch (JMSException ex) {
            DefaultLogger.error(this, "Caught Exception while getJMSCorrelationID", ex);
        }

        if (message instanceof TextMessage) {
            try {
                String responseContent = null;
                String receiveMessage = ((TextMessage) message).getText();

                DefaultLogger.info(this, "\n*** Begin Processing Message");
                DefaultLogger.debug(this, "xml receive is : " + receiveMessage);

                messageHandler.loadMessageSetting(receiveMessage);
                DefaultLogger.debug(this, "messageHandler.isDynamicResponse : " + messageHandler.isDynamicResponse());

                if(messageHandler.isDynamicResponse()){
                    responseContent = (String) messageHandler.process(receiveMessage);
                }else{
                    responseContent = messageHandler.getFixedResponseXML();
                }

                this.messageSender.sendMesage(responseContent, message.getJMSCorrelationID());
            } catch (JMSException e) {
                DefaultLogger.error(this, "JMSException in onMessage! ", e);
                Exception le = e.getLinkedException();

                if (le != null) {
                    DefaultLogger.error(this, "Linked Exception is: ", le);
                }
            } catch (Exception e) {
                DefaultLogger.error("Exception in onMessage! ", e);
            } finally {
                try {
                    message.acknowledge();
                    DefaultLogger.info(this, "\n*** End Processing Message ID: " + messageHandler.getMessageId() + "\n");
                }
                catch (Exception e) {
                    DefaultLogger.error(this, "Caught Exception in finally clause of onMessage!", e);
                }
            }
        } else {
            try {
                message.acknowledge();
            } catch (Exception e) {
                DefaultLogger.error(this, "Caught Exception in finally clause of onMessage!", e);
            } finally {
                DefaultLogger.info(this, "<WARNING>:Message received is not TextMessage!!!");
            }
        }
        DefaultLogger.info(this, "Listener processing onMessage ended");
    }

    public void setMessageAttributeName(String messageAttributeName) {
        this.messageAttributeName = messageAttributeName;
    }

    public String getMessageAttributeName() {
        return messageAttributeName;
    }

    public void setProcessWaitingSleepingPeriod(long processWaitingSleepingPeriod) {
        this.processWaitingSleepingPeriod = processWaitingSleepingPeriod;
    }

    public long getProcessWaitingSleepingPeriod() {
        return processWaitingSleepingPeriod;
    }

    public MQJmsSender getMessageSender() {
        return messageSender;
    }

    public void setMessageSender(MQJmsSender messageSender) {
        this.messageSender = messageSender;
    }
}

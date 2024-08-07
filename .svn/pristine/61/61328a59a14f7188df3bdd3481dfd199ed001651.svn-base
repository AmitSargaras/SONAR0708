package com.integrosys.simulator.host.mq;

import java.net.URL;
import java.util.*;

import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueReceiver;
import javax.jms.QueueSession;
import javax.jms.Session;

//import org.apache.commons.lang.StringUtils;

import com.ibm.mq.jms.JMSC;
import com.ibm.mq.jms.MQQueueConnectionFactory;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.techinfra.propertyfile.PropertyManager;
import com.integrosys.base.techinfra.reloadable.IReloadable;
import com.integrosys.base.techinfra.reloadable.ReloadException;
import com.integrosys.base.techinfra.reloadable.ReloadManager;
import com.integrosys.base.techinfra.startup.IStartupable;
import com.integrosys.base.techinfra.util.PropertyUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.jms.core.JmsTemplate;

/**
 * @author $Author: marvin $<br>
  * @author KC Chin
 * @version $Id$
 */
public class MQMessageCenter extends Thread implements IStartupable, IReloadable {
    boolean runMQListener = true;
	// Used as holder for EAIMessenger to send message
	private static MQMessageCenter instance = null;

    public static final String[] MQ_IN_QUEUE_KEYS = { "mq.trade.in.queue"};

	public static final String[] MQ_OUT_QUEUE_KEYS = { "mq.trade.out.queue"};

	// AT:
	// Message Type
	public final static String MQ_ENQUIRY = "inquiry";

	public final static String MQ_UPDATE = "update";

	private final static String MQ_KEYS = "mq.pair";

	private int ccsid = 0;

	private int port = 0;

	private String queueMgrStr = null;

	private String hostIPStr = null;

	private String inChannelStr = null;

	private String outChannelStr = null;

	private String qInquiryIn = null;

	private String qInquiryOut = null;

	private String qUpdateIn = null;

	private String qUpdateOut = null;

	private boolean reconnect = true; // by default

	private boolean remote = false; // by default its local

	private HashMap listeningQueues = new HashMap();

	MQQueueConnectionFactory factory = null;

	QueueConnection con = null;

	QueueSession session = null;

	// Queue inQueue = null;
	QueueReceiver[] qReceivers = null;

	MQExceptionListener outExListner = null;

	/**
	 * Default Constructor
	 */
	public MQMessageCenter() {
	}

	private static HashMap mqListenerMap = new HashMap();

    public boolean isRunMQListener() {
        return runMQListener;
    }

    public void setRunMQListener(boolean runMQListener) {
        this.runMQListener = runMQListener;
    }

    /**
	 * Initialization method
     * Initial the MessageCenter, load the configure from PropertyManager.
	 */
	public int startup(PropertyUtil prop) {
		DefaultLogger.debug(this, ">>>> in startup <<<<");
		DefaultLogger.debug(this, "Please ensure that the native libraries are placed in the following directories: ");
		DefaultLogger.debug(this, System.getProperty("java.library.path") + "\n");

		ccsid = PropertyManager.getInt("mq.ccsid");
		port = PropertyManager.getInt("mq.port");

		queueMgrStr = PropertyManager.getValue("mq.queue.manager");
		hostIPStr = PropertyManager.getValue("mq.host.ip");
		inChannelStr = PropertyManager.getValue("mq.in.channel.name");
		outChannelStr = PropertyManager.getValue("mq.out.channel.name");
		remote = PropertyManager.getBoolean("mq.server.isremote");

		DefaultLogger.debug(this, "CCSID       : " + ccsid);
		DefaultLogger.debug(this, "queueMgrStr : " + queueMgrStr);
		DefaultLogger.debug(this, "hostIPStr   : " + hostIPStr);
		DefaultLogger.debug(this, "port        : " + port);
		DefaultLogger.debug(this, "is remote?  : " + remote);

		DefaultLogger.debug(this, "Remote: " + remote);
		if (null == queueMgrStr) {
			throw new RuntimeException("Queue Manager is null!");
		}

		for (int i = 0; i < MQ_IN_QUEUE_KEYS.length; i++) {
			String inKey = MQ_IN_QUEUE_KEYS[i];
			String outKey = MQ_OUT_QUEUE_KEYS[i];
			String inQueueStr = PropertyManager.getValue(inKey);

			// If key not found , continue
			if ((inQueueStr == null) || "".equals(inQueueStr)) {
				continue;
			}

			String outQueueStr = PropertyManager.getValue(outKey);

			DefaultLogger.debug(this, "Queue : " + inKey + " IN :" + inQueueStr + " OUT :" + outQueueStr);
			mqListenerMap.put(inKey, new MQPair(inQueueStr, outQueueStr));
		}
		DefaultLogger.debug(this, "mqListenerMap size " + mqListenerMap.size());

		// Use Default In & Out Queue
		if (mqListenerMap.size() == 0) {
            throw new IllegalArgumentException("mqListenerMap is null, no queue had define");
		}

		if (null == hostIPStr) {
			throw new RuntimeException("Host IP is null!");
		}

		try {
			connect();
			instance = this;
		}
		catch (Exception e) {
			e.printStackTrace();
			DefaultLogger.error(this, "Caught Exception in startup! ", e);
		}
		finally {
			try {
				ReloadManager.register(this);
			}
			catch (Exception ee) {
				ee.printStackTrace();
				DefaultLogger.error(this, "Caught Exception in startup! ", ee);
				throw new RuntimeException("Caught Exception in startup! " + ee.toString());
			}
			finally {
				DefaultLogger.debug(this, "in finally clause for ReloadManager.register");
			}
		}
		DefaultLogger.debug(this, "Successful connection, return 0");
		return 0;
	}

	/**
	 * Before clearing cache this method would be invoked.
	 */
	public void clearCache() {
	}

	/*
	 * Reloads
	 * 
	 * @param void
	 * 
	 * @return void
	 * 
	 * @exception ReloadException
	 */
	public void reload() throws ReloadException {
		try {
			if (true == reconnect) {
				DefaultLogger.debug(this, ">>>> in reload <<<<");
				disconnect();
				connect();
			}
		}
		catch (Exception e) {
			DefaultLogger.error(this, "Caught Exception in reload!", e);
			// consume
		}
	}

	/*
	 * Reloads time interval
	 * 
	 * @param currentTime
	 * 
	 * @return next execution time
	 * 
	 * @exception exception
	 */
	public long schedule(long currentTime) throws Exception {
		return (currentTime + 1000);
	}

	/**
	 * Set reconnect flag
	 */
	public void setReconnect(boolean value) {
		reconnect = value;
	}

	/**
	 * Get reconnect flag
	 */
	public boolean getReconnect() {
		return reconnect;
	}

	/**
	 * Method to stop the message listener
	 */
	public void stopListener() {
		try {
			for (int i = 0; i < qReceivers.length; i++) {
				qReceivers[i].setMessageListener(null);
			}

			reconnect = false;
			disconnect();
		}
		catch (Exception e) {
			DefaultLogger.error(this, "Caught Exception in stopListener! ", e);
		}
	}



	public void sendMessage(String msg) throws Exception {

		// default outQueue
		sendMessage(msg, qInquiryOut);
	}

	public void sendMessage(String msg, String outQueueStr) throws Exception {
		sendMessage(msg, outQueueStr, null);
	}


	/**
	 * Method to disconnect
	 */
	private void disconnect() {
		try {
			for (int i = 0; i < qReceivers.length; i++) {
				if (qReceivers[i] != null) {
					qReceivers[i].close();
					qReceivers[i] = null;
				}
			}
		}
		catch (Exception e) {
			// consume
		}
		try {
			if (session != null) {
				session.close();
				session = null;
			}
		}
		catch (Exception e) {
			// consume
		}
		try {
			if (con != null) {
				con.stop();
				con.close();
				con = null;
			}
		}
		catch (Exception e) {
			// consume
		}
	}

	/**
	 * Method to connect queues
     * After startup, it will initial connect.
     * this method create N number of listener base on the mqListenerMap number.
	 */
	private void connect() {

		MQQueueConnectionFactory factory = null;
		QueueConnection con = null;
		QueueSession session = null;
		DefaultLogger.debug(this, "In MQMessageCenter connect \n CCSID       : " + ccsid + "\n queueMgrStr : "
				+ queueMgrStr + "\n hostIPStr   : " + hostIPStr + "\n port        : " + port + "\n is remote?  : "
				+ remote);

		try {
			Iterator ii = this.mqListenerMap.values().iterator();
			DefaultLogger.debug(this, "Iterating mqListenerMap");
			while (ii.hasNext()) {

				DefaultLogger.debug(this, "Create new MQQueueConnectionFactory()");
				factory = new MQQueueConnectionFactory();
				factory.setCCSID(ccsid); // default
				factory.setQueueManager(queueMgrStr);
				factory.setHostName(hostIPStr);
				factory.setPort(port); // default

				if (remote) {
					factory.setTransportType(JMSC.MQJMS_TP_CLIENT_MQ_TCPIP); 
					DefaultLogger.debug(this, "factory.setTransportType(JMSC.MQJMS_TP_CLIENT_MQ_TCPIP)");
				}
				else {
					factory.setTransportType(JMSC.MQJMS_TP_BINDINGS_MQ);
					DefaultLogger.debug(this, "factory.setTransportType(JMSC.MQJMS_TP_BINDINGS_MQ)");
				}

				DefaultLogger.debug(this, "Creating Queue Connection");
				con = factory.createQueueConnection();
				DefaultLogger.debug(this, "Setting exception Listener");
				con.setExceptionListener(new MQExceptionListener(this));
				DefaultLogger.debug(this, "Starting connection");
				con.start();
				DefaultLogger.debug(this, "Connection Started!! - create session");
				session = con.createQueueSession(false, Session.CLIENT_ACKNOWLEDGE); 
				DefaultLogger.debug(this, "Session Created!");

				MQPair mqp = (MQPair) ii.next();
				DefaultLogger.debug(this, "Inqueue : " + mqp.getInQueue());
				String inQueueString = mqp.getInQueue();
				String outQueueString = mqp.getOutQueue();
				Queue inQueue = session.createQueue(inQueueString);

				DefaultLogger.debug(this, "In Queue Name: " + inQueueString);
				DefaultLogger.debug(this, "Out Queue Name: " + outQueueString);

				try {
					if (!listeningQueues.containsKey(inQueueString)) {
						DefaultLogger.debug(this, "Creating receiver");
						QueueReceiver qReceiver = session.createReceiver(inQueue);
						DefaultLogger.debug(this, "Setting listener to receiver");
						qReceiver.setMessageListener(new MQMessageListener(createJMSTemplate(inQueueString), createJMSTemplate(outQueueString)));
						DefaultLogger.debug(this, "Listener set for inQ     : " + inQueue);
						listeningQueues.put(inQueueString, inQueueString);
					}
					else {
						DefaultLogger.debug(this, "Listener for " + inQueue + " is already started. Skip..");
					}
				}
				catch (Exception e) {
					DefaultLogger.debug(this, "Exception found creating receiver..");
					e.printStackTrace();
				}

			}// end while
			DefaultLogger.debug(this, "Done in connecting!!");
			if (listeningQueues.size() == MQ_IN_QUEUE_KEYS.length) {
				reconnect = false;
				DefaultLogger.debug(this, "All listeners are ready.. ");
			}
			else {
				reconnect = true;
				DefaultLogger.debug(this, "Some listeners not ready, schedule reconnection..");
			}
		}
		catch (Throwable t) {
			reconnect = true;
			DefaultLogger.error(this, "IN Throwable 1" + t.getMessage());
			DefaultLogger.error(this, "IN Throwable 2" + t.toString());
			t.printStackTrace();

		}
	}

	private class MQPair {

		MQPair(String in, String out) {
			inQueue = in;
			outQueue = out;
		}

		private String inQueue;

		private String outQueue;

		public final String getInQueue() {
			return inQueue;
		}

		public final void setInQueue(String inQueue) {
			this.inQueue = inQueue;
		}

		public final String getOutQueue() {
			return outQueue;
		}

		public final void setOutQueue(String outQueue) {
			this.outQueue = outQueue;
		}

	}

    public static final void main(String[] args) throws Exception {
        Properties properties = PropertyManager.getProperty();
        Properties prop = new Properties();
        URL fileNameUrl = MQMessageCenter.class.getResource("/mq.properties");

        try{
            prop.load(fileNameUrl.openStream());
        }catch(Exception e){
            DefaultLogger.debug("Fail to load mq.properties, please put it under config folder", e);
        }
        properties.putAll(prop);

        URL fileNameUrl2 = MQMessageCenter.class.getResource("/ofa.properties");

        try{
            prop.load(fileNameUrl2.openStream());
        }catch(Exception e){
            DefaultLogger.debug("Fail to load ofa.properties, please put it under config folder", e);
        }
        properties.putAll(prop);

        MQMessageCenter.getInstance().startup(new PropertyUtil(prop)); //start up prop can take out

        Thread t = new Thread(MQMessageCenter.getInstance());
		t.start();

       // MQMessageCenter.getInstance().sendMessage("<?xml version=\"1.0\" encoding=\"UTF-8\"?><Msg><MsgHeader><MessageId>T001</MessageId><MessageType>CUSTOMER</MessageType><MessageRefNum>120100721000000042</MessageRefNum><PublishType>COVENANT</PublishType><PublishDate>20100721</PublishDate><Source>TRADE</Source></MsgHeader><MsgBody xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:type=\"tradeBody\"><ID>123</ID><CDT_FILE_ID>Y</CDT_FILE_ID><ACCT_NO>1</ACCT_NO><LIMIT_NO>123</LIMIT_NO><FIRST_LINE_FAC_ID>Y</FIRST_LINE_FAC_ID><MAIN_LINE_FAC_ID>123</MAIN_LINE_FAC_ID><MT_FAC_CD>123</MT_FAC_CD><MT_BR_CD>123</MT_BR_CD><MT_CUR_CD>MYR</MT_CUR_CD><LMT_APPR>123456789.1234</LMT_APPR><TENURE_MT_TIME_CD>123</TENURE_MT_TIME_CD><TENURE_APPR>123456789.1234</TENURE_APPR><DT_REVIEW>20100721</DT_REVIEW><IS_TEMP>Y</IS_TEMP><CREATED_BY>123</CREATED_BY><UPDATED_BY>123</UPDATED_BY><DT_CREATED>20100721</DT_CREATED><DT_UPDATED>20100721</DT_UPDATED><VERSION>1</VERSION><INT_RATE>123456789.123456790</INT_RATE><MT_INT_RATE_CD>123</MT_INT_RATE_CD><DT_EXPIRY>20100721</DT_EXPIRY><SPECIAL_REMARK>this is remark</SPECIAL_REMARK><MT_MAINT_STS_CD>123</MT_MAINT_STS_CD><PEN_INT_RATE>123456789.123456790</PEN_INT_RATE><MT_PEN_INT_RATE_CD>123</MT_PEN_INT_RATE_CD><OD_RATE>123456789.123456790</OD_RATE><MT_OD_RATE_CD>123</MT_OD_RATE_CD><IS_AUTO_PURGE>Y</IS_AUTO_PURGE><MT_FAC_ID>123</MT_FAC_ID><LSM_CD>123</LSM_CD><PPS_OF_LOAN>123</PPS_OF_LOAN><LIMIT_DESC>123</LIMIT_DESC><IS_REVOLVING>Y</IS_REVOLVING><IS_CGC>Y</IS_CGC><IS_SECTOR>Y</IS_SECTOR><CGC_SCHEMA>123</CGC_SCHEMA><CGC_REF_NO>123</CGC_REF_NO><COM_RATE>123456789.123456790</COM_RATE><IS_DEL>Y</IS_DEL><APPROVED_DATE>20100721</APPROVED_DATE><IS_MTR>123</IS_MTR><IS_MBG>Y</IS_MBG></MsgBody></Msg>","trade.out","1");
        
	}
   public void run(){
       while (runMQListener) {
           try {
               DefaultLogger.info(this, "************* trend sleep and run every 5 second ***************");
               Thread.sleep(5000);
           } catch (InterruptedException e) {
               e.printStackTrace();
           }
       }
   }

	public static MQMessageCenter getInstance() {
		if (instance == null) {
			synchronized (MQMessageCenter.class) {
				if (instance == null) {
					instance = new MQMessageCenter();
				}
			}
		}
		return instance;
	}

    private JmsTemplate createJMSTemplate(String queue)throws Exception{
        return createJMSTemplate(queue, null);
    }

    private JmsTemplate createJMSTemplate(String queue, String channelName)throws Exception{
        MQQueueConnectionFactory mqQueueFactory = new MQQueueConnectionFactory();
        mqQueueFactory.setHostName(hostIPStr);
        mqQueueFactory.setPort(port);
        mqQueueFactory.setQueueManager(queueMgrStr);

        if (remote) {
			mqQueueFactory.setTransportType(JMSC.MQJMS_TP_CLIENT_MQ_TCPIP);
		}
		else {
			mqQueueFactory.setTransportType(JMSC.MQJMS_TP_BINDINGS_MQ);
		}
        if(channelName != null){
            mqQueueFactory.setChannel(channelName);
        }

        JmsTemplate jtemplate = new JmsTemplate();
        jtemplate.setDefaultDestinationName(queue);
        jtemplate.setReceiveTimeout(30000L);
        jtemplate.setConnectionFactory(mqQueueFactory);
        return jtemplate;
    }
    
    public void sendMessage(String msg, String outQueueStr, String correlationId) throws Exception {
        MQJmsSender jmsSender = new MQJmsSender();
        jmsSender.setJmsTemplate(createJMSTemplate(outQueueStr));
        jmsSender.sendMesage(msg, correlationId);
	}
}

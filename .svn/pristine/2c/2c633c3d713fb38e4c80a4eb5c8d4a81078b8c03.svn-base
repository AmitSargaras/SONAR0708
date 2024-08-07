package com.integrosys.cms.host.eai.log;

import java.util.Date;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

/**
 * @author Chong Jun Yong
 * 
 */
public class LogMessageJdbcImplIntegrationTest extends AbstractTransactionalDataSourceSpringContextTests {

	LogMessageJdbcImpl jdbc;

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();
	}

	protected String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml" };
	}

	public void testInsertOneLogMessage() {
		Date todayDate = new Date();

		jdbc = new LogMessageJdbcImpl();
		jdbc.setJdbcTemplate(getJdbcTemplate());
		jdbc.setSequenceFormatter(new DateSequencerFormatter());

		OBLogMessage logMessage = new OBLogMessage();
		logMessage.setErrorStackTrace("hit null pointer when getting message service");
		logMessage.setPublishDate(todayDate);
		logMessage.setReceivedDate(todayDate);
		logMessage.setReceivedMessage("Empty Message Received");
		logMessage.setSCIMsgId("id = 12345");
		logMessage.setSubscriberAckDate(todayDate);
		logMessage.setSubscriberResponseCode("GOOD");
		logMessage.setSubscriberResponseDesc("Data Persisted for Good");
		logMessage.setSubscriberResponseMessage("Data is persisted for good.");
		logMessage.setSubscriberResponseType('A');

		jdbc.persistLogMessage(logMessage);

		int count = getJdbcTemplate().queryForInt("select count(*) from cms_mq_message_log where sci_message_id = ?",
				new Object[] { "id = 12345" });
		assertEquals(1, count);
	}

	public void testInsertOneEAILogMessage() {
		EAIMessageLog messageLog = new EAIMessageLog();
		messageLog.setMessageReferenceNumber("123456");
		messageLog.setMessageType("TEMPLATE.INQUIRY");
		messageLog.setMessageId("DC001I");
		messageLog.setPublishType("NORMAL");
		messageLog.setPublishDate(new Date());
		messageLog.setSource("RLOS");
		messageLog.setReceivedMessagePath("/abc/def/gef/xx_1122_3344_lll.xml");
		messageLog.setResponseMessageId("DC001R");
		messageLog.setResponseMessagePath("/abc/def/gef/xx_1122_3344_lllR.xml");
		messageLog.setResponseCode("T0001");
		messageLog.setResponseDescription("mandatory field [perl] is missing, please provide");

		jdbc = new LogMessageJdbcImpl();
		jdbc.setJdbcTemplate(getJdbcTemplate());
		jdbc.setSequenceFormatter(new DateSequencerFormatter());

		jdbc.persistEAILogMessage(messageLog);

		int count = getJdbcTemplate().queryForInt("select count(*) from cms_eai_message_log where message_ref_num = ?",
				new Object[] { "123456" });
		assertEquals(1, count);
	}
}

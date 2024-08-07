package com.integrosys.cms.host.eai.support;

import java.util.Properties;

import junit.framework.TestCase;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.test.PropertyFlatFileLoader;

/**
 * @author Chong Jun Yong
 * 
 */
public class FileSystemMessageFolderImplTest extends TestCase {
	public void setUp() {
		Log4jConfigTestPlugin.configure();
	}

	public void testSaveAndRetrieveEaiMessage() {
		Properties ofaEnvProperties = PropertyFlatFileLoader.loadFromClassPath("ofa_env.properties");

		FileSystemMessageFolderImpl messageFolder = new FileSystemMessageFolderImpl();
		messageFolder.setMessageFileDateFormat("yyyyMMddHHmmss");
		messageFolder.setMessageFolder(ofaEnvProperties.getProperty("eai.message.destination.temp.dir"));

		String message = "<Msg><MsgHeader><MessageId>12345</MessageId><MessageType>RESPONSE</MessageType>"
				+ "<MessageRefNum>54321</MessageRefNum></MsgHeader><MsgBody></MsgBody></Msg>";

		String msgId = messageFolder.putMessage(message);
		assertNotNull(msgId);

		MessageHolder msgHolder = (MessageHolder) messageFolder.popMessageByMsgId(msgId);
		assertNotNull(msgHolder);
		assertNotNull(msgHolder.getMessage());
		assertEquals(msgId, msgHolder.getMsgId());
		assertTrue(((String) msgHolder.getMessage()).indexOf(message) >= 0);
		assertTrue(msgHolder.getMessageDescription().indexOf(
				ofaEnvProperties.getProperty("eai.message.destination.temp.dir").replace('/', '\\')) >= 0);
	}
}

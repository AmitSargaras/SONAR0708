package com.integrosys.cms.host.eai.limit.inquiry.limitprofile;

import java.net.URL;

import junit.framework.TestCase;

import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;

public class CreditApplicationInquiryMessageUnmarshallerTest extends TestCase {
	public void testCastorUnmarshallRawMessage() {
		URL messageUrl = getClass().getResource("aa-inquiry-message.xml");
		URL mappingUrl = Thread.currentThread().getContextClassLoader().getResource("aa-inquiry.cm.xml");

		EAIMessage eaiMessage = (EAIMessage) EAICastorHelper.getInstance().unmarshal(mappingUrl, messageUrl,
				EAIMessage.class);
		assertNotNull(eaiMessage);

		assertTrue(eaiMessage.getMsgBody() instanceof CreditApplicationInquiryMessageBody);

		CreditApplicationInquiryMessageBody msgBody = (CreditApplicationInquiryMessageBody) eaiMessage.getMsgBody();
		CreditApplicationCriteria criteria = msgBody.getCreditApplicationCriteria();

		assertEquals("LOS-12345", criteria.getLosAANumber());
		assertEquals("RLOS", criteria.getApplicationSource());
	}
}

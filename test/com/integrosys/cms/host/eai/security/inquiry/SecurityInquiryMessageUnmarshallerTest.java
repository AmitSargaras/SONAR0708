package com.integrosys.cms.host.eai.security.inquiry;

import java.net.URL;

import junit.framework.TestCase;

import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;

public class SecurityInquiryMessageUnmarshallerTest extends TestCase {
	public void testUnmarshallSecurityInquiryMessage() {
		URL xmlMappingUrl = Thread.currentThread().getContextClassLoader().getResource("collateral-inquiry.cm.xml");
		URL xmlMessageUrl = getClass().getResource("Collateral-Inquiry-Skeleton.xml");

		EAICastorHelper castor = EAICastorHelper.getInstance();
		EAIMessage eaiMessage = (EAIMessage) castor.unmarshal(xmlMappingUrl, xmlMessageUrl, EAIMessage.class);

		assertTrue(eaiMessage.getMsgBody() instanceof SecurityInquiryMessageBody);

		SecurityInquiry inquiry = ((SecurityInquiryMessageBody) eaiMessage.getMsgBody()).getSecurityInquiry();
		assertEquals(new Long(123456l), new Long(inquiry.getCmsSecurityId()));
	}
}

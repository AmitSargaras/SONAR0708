package com.integrosys.cms.host.eai.limit.inquiry.listing;

import java.net.URL;

import junit.framework.TestCase;

import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;

/**
 * @author Chong Jun Yong
 * 
 */
public class CreditApplicationListInquiryMessageBodyCastorUnmashallerTest extends TestCase {
	public void testUnmarshallCAListingInquiryMsgBody() {
		URL mappingUrl = Thread.currentThread().getContextClassLoader().getResource("aa-listing-inquiry.cm.xml");
		URL messageUrl = getClass().getResource("aa-listing-msg.xml");

		EAIMessage eaiMessage = (EAIMessage) EAICastorHelper.getInstance().unmarshal(mappingUrl, messageUrl,
				EAIMessage.class);
		assertTrue(eaiMessage.getMsgBody() instanceof CreditApplicationListingInquiryMessageBody);

		CreditApplicationListingInquiryMessageBody msgBody = (CreditApplicationListingInquiryMessageBody) eaiMessage
				.getMsgBody();

		assertEquals("A15898988", msgBody.getCreditApplicationSearchCritiria().getCustomerIdInfo().getIdNumber());
		assertEquals("PP", msgBody.getCreditApplicationSearchCritiria().getCustomerIdInfo().getIdType()
				.getStandardCodeValue());
		assertEquals("SIBS12345", msgBody.getCreditApplicationSearchCritiria().getOtherCriteria().getHostAANumber());
		assertEquals("DAVID", msgBody.getCreditApplicationSearchCritiria().getOtherCriteria().getShortCustomerName());
	}
}

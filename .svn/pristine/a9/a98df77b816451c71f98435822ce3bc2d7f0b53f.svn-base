package com.integrosys.cms.host.eai.limit.response;

import java.net.URL;
import java.util.Date;
import java.util.Vector;

import junit.framework.TestCase;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.host.eai.EAIHeader;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.StandardCode;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;

/**
 * Test case for marshalling AC002, response of AA message
 * 
 * @author Chong Jun Yong
 * 
 */
public class AAResponseMarshallerTest extends TestCase {
	public void setUp() {
		Log4jConfigTestPlugin.configure();
	}

	public void testMarshallAAResponseMessage() throws Exception {
		String mappingFile = "aa-ack-response.cm.xml";

		URL mappingFileUrl = Thread.currentThread().getContextClassLoader().getResource(mappingFile);

		EAIHeader header = new EAIHeader();
		header.setMessageId("AC002");
		header.setMessageType("ACKNOWLEDGMENT");
		header.setPublishDate("20081216");
		header.setPublishType("NORMAL");
		header.setMessageRefNum("REF123456");
		header.setSource("CMS");

		ResponseMessageBody response = new ResponseMessageBody();
		response.setLosAANumber("AA12345");
		response.setStpDate("20081122");
		response.setUserId("UserABC");
		response.setUserName("ABC");

		ResponseFacilityMaster facility = new ResponseFacilityMaster();
		facility.setLosLimitId("LL12345");
		facility.setFacilityStatusEntryCode("A");
		facility.setCancelRejectDate(new Date());

		StandardCode cancelRejectCode = new StandardCode();
		cancelRejectCode.setStandardCodeNumber("CRC");
		cancelRejectCode.setStandardCodeValue("R");

		facility.setCancelRejectCode(cancelRejectCode);

		ResponseFacilityMaster facility2 = new ResponseFacilityMaster();
		facility2.setLosLimitId("LL56789");
		facility2.setFacilityStatusEntryCode("C");
		facility2.setCancelRejectDate(new Date());

		StandardCode cancelRejectCode2 = new StandardCode();
		cancelRejectCode2.setStandardCodeNumber("CRC");
		cancelRejectCode2.setStandardCodeValue("C");

		facility2.setCancelRejectCode(cancelRejectCode2);

		Vector facilityList = new Vector();
		facilityList.add(facility);
		facilityList.add(facility2);

		response.setFacilityList(facilityList);

		EAIMessage message = new EAIMessage();
		message.setMsgHeader(header);
		message.setMsgBody(response);

		String content = EAICastorHelper.getInstance().marshal(mappingFileUrl, message, EAIMessage.class);

		System.out.println("content - " + content);

		assertTrue(content.indexOf("Facility") > 0);
		assertTrue(content.indexOf("LOSLimitId") > 0);
		assertTrue(content.indexOf("FacilityStatus") > 0);
		assertTrue(content.indexOf("LOSAANumber") > 0);
		assertTrue(content.indexOf("STPDate") > 0);
		assertTrue(content.indexOf("UserID") > 0);
		assertTrue(content.indexOf("LL12345") > 0);
		assertTrue(content.indexOf("LL56789") > 0);

	}
}

package com.integrosys.cms.host.eai.limit.inquiry.listing;

import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import junit.framework.TestCase;

import com.integrosys.cms.host.eai.EAIHeader;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.StandardCode;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;
import com.integrosys.cms.host.eai.customer.bus.CustomerIdInfo;
import com.integrosys.cms.host.eai.customer.bus.MainProfile;
import com.integrosys.cms.host.eai.support.IEAIHeaderConstant;
import com.integrosys.cms.host.eai.support.MessageDate;

public class CreditApplicationListingResponseMessageMarshallerTest extends TestCase {
	public void testMarshallerAAListingResponseMessageObjectOne() {
		URL mappingUrl = Thread.currentThread().getContextClassLoader().getResource("aa-listing-response.cm.xml");

		CreditApplication ca = new CreditApplication();
		ca.setHostAANumber("SCI-12345");
		ca.setLosAANumber("LOS-12345");
		ca.setApplicationType("MO");
		ca.setApplicationLawType("COV");
		ca.setApplicationSource("SCI");
		ca.setApplicationApproveDate("20090109");
		ca.setApplicationStatus("APPROVED");

		MainProfile mp = new MainProfile();
		mp.setCIFId("CIF-12345");
		mp.setCustomerNameShort("INTEGRO");
		mp.setCustomerNameLong("INTEGRO TECH");
		mp.setSource("SCI");

		CustomerIdInfo idInfo = new CustomerIdInfo();
		idInfo.setIdNumber("888999000");
		idInfo.setCountryIssued("SG");

		StandardCode idType = new StandardCode();
		idType.setStandardCodeNumber("ID_TYPE");
		idType.setStandardCodeValue("BR");

		idInfo.setIdType(idType);

		mp.setIdInfo1(idInfo);

		ca.setMainProfile(mp);

		List caList = new ArrayList();
		caList.add(ca);

		CreditApplicationListingResponseMessageBody msgBody = new CreditApplicationListingResponseMessageBody();
		msgBody.setCreditApplications(caList);

		EAIHeader responseHeader = new EAIHeader();
		responseHeader.setMessageId("CA002R");
		responseHeader.setMessageRefNum("12345");
		responseHeader.setMessageType("CA.INQUIRY.LISTING");
		responseHeader.setPublishType(IEAIHeaderConstant.PUB_TYPE_NORMAL);
		responseHeader.setSource(IEAIHeaderConstant.MESSAGE_SOURCE_CMS);
		responseHeader.setPublishDate(MessageDate.getInstance().getString(new Date()));

		EAIMessage eaiMessage = new EAIMessage();
		eaiMessage.setMsgHeader(responseHeader);
		eaiMessage.setMsgBody(msgBody);

		String rawMessage = EAICastorHelper.getInstance().marshal(mappingUrl, eaiMessage, EAIMessage.class);
		assertNotNull(rawMessage);

		System.out.println(rawMessage);

		assertTrue(rawMessage.indexOf("INTEGRO") > 1);
	}

	public void testMarshallerAAListingResponseMessageObjectTwo() {
		URL mappingUrl = Thread.currentThread().getContextClassLoader().getResource("aa-listing-response.cm.xml");

		CreditApplication ca = new CreditApplication();
		ca.setHostAANumber("SCI-12345");
		ca.setLosAANumber("LOS-12345");
		ca.setApplicationType("MO");
		ca.setApplicationLawType("COV");
		ca.setApplicationSource("SCI");
		ca.setApplicationApproveDate("20090109");
		ca.setApplicationStatus("APPROVED");

		MainProfile mp = new MainProfile();
		mp.setCIFId("CIF-12345");
		mp.setCustomerNameShort("INTEGRO");
		mp.setCustomerNameLong("INTEGRO TECH");
		mp.setSource("SCI");

		CustomerIdInfo idInfo = new CustomerIdInfo();
		idInfo.setIdNumber("888999000");
		idInfo.setCountryIssued("SG");

		StandardCode idType = new StandardCode();
		idType.setStandardCodeNumber("ID_TYPE");
		idType.setStandardCodeValue("BR");

		idInfo.setIdType(idType);

		mp.setIdInfo1(idInfo);

		ca.setMainProfile(mp);

		List caList = new ArrayList();
		caList.add(ca);

		CreditApplication ca1 = new CreditApplication();
		ca1.setHostAANumber("SCI-88899");
		ca1.setLosAANumber("LOS-88899");
		ca1.setApplicationType("HP");
		ca1.setApplicationLawType("COV");
		ca1.setApplicationSource("SCI");
		ca1.setApplicationApproveDate("20090109");
		ca1.setApplicationStatus("APPROVED");

		MainProfile mp1 = new MainProfile();
		mp1.setCIFId("CIF-88899");
		mp1.setCustomerNameShort("SIS");
		mp1.setCustomerNameLong("SIS BIZ");
		mp1.setSource("SCI");

		CustomerIdInfo idInfo1 = new CustomerIdInfo();
		idInfo1.setIdNumber("111222333");
		idInfo1.setCountryIssued("SG");

		StandardCode idType1 = new StandardCode();
		idType1.setStandardCodeNumber("ID_TYPE");
		idType1.setStandardCodeValue("BR");

		idInfo1.setIdType(idType1);

		mp1.setIdInfo1(idInfo1);

		ca1.setMainProfile(mp1);

		caList.add(ca1);

		CreditApplicationListingResponseMessageBody msgBody = new CreditApplicationListingResponseMessageBody();
		msgBody.setCreditApplications(caList);

		EAIHeader responseHeader = new EAIHeader();
		responseHeader.setMessageId("CA002R");
		responseHeader.setMessageRefNum("12345");
		responseHeader.setMessageType("CA.INQUIRY.LISTING");
		responseHeader.setPublishType(IEAIHeaderConstant.PUB_TYPE_NORMAL);
		responseHeader.setSource(IEAIHeaderConstant.MESSAGE_SOURCE_CMS);
		responseHeader.setPublishDate(MessageDate.getInstance().getString(new Date()));

		EAIMessage eaiMessage = new EAIMessage();
		eaiMessage.setMsgHeader(responseHeader);
		eaiMessage.setMsgBody(msgBody);

		String rawMessage = EAICastorHelper.getInstance().marshal(mappingUrl, eaiMessage, EAIMessage.class);
		assertNotNull(rawMessage);

		System.out.println(rawMessage);

		assertTrue(rawMessage.indexOf("INTEGRO") > 1);
		assertTrue(rawMessage.indexOf("SIS BIZ") > 1);
	}
}

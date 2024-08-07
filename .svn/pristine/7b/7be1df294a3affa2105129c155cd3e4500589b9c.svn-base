package com.integrosys.cms.host.eai.limit.inquiry.listing;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import junit.framework.TestCase;

import org.easymock.MockControl;

import com.integrosys.cms.host.eai.EAIHeader;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.StandardCode;
import com.integrosys.cms.host.eai.customer.bus.CustomerIdInfo;
import com.integrosys.cms.host.eai.customer.bus.ICustomerDao;
import com.integrosys.cms.host.eai.customer.bus.MainProfile;
import com.integrosys.cms.host.eai.customer.bus.SubProfile;
import com.integrosys.cms.host.eai.limit.bus.ILimitDao;
import com.integrosys.cms.host.eai.limit.bus.LimitProfile;

/**
 * @author Chong Jun Yong
 * 
 */
public class CreditApplicationListingInquiryMessageHandlerTest extends TestCase {
	public void testInquiryCaListingWithCustomerIdInfoProvided() {
		CustomerIdInfo idInfo = new CustomerIdInfo();
		idInfo.setCountryIssued("MY");
		idInfo.setIdNumber("12345");

		StandardCode idType = new StandardCode();
		idType.setStandardCodeNumber("ID_TYPE");
		idType.setStandardCodeValue("BR");

		idInfo.setIdType(idType);

		SearchCriteria criteria = new SearchCriteria();
		criteria.setCustomerIdInfo(idInfo);

		CreditApplicationListingInquiryMessageBody inquiryMsgBody = new CreditApplicationListingInquiryMessageBody();
		inquiryMsgBody.setCreditApplicationSearchCritiria(criteria);

		EAIHeader header = new EAIHeader();
		header.setMessageId("CA002I");
		header.setMessageType("CA.LISTING.INQUIRY");
		header.setMessageRefNum("123456");
		header.setPublishDate("20090111");
		header.setPublishDate("NORMAL");
		header.setSource("LOS");

		EAIMessage inquiry = new EAIMessage();
		inquiry.setMsgBody(inquiryMsgBody);
		inquiry.setMsgHeader(header);

		MainProfile searchedMainProfile = new MainProfile();
		searchedMainProfile.setCmsId(20090111000111222l);
		searchedMainProfile.setCIFId("C-98765");
		searchedMainProfile.setSource("SCI");
		searchedMainProfile.setCustomerNameLong("INTEGRO TECH");
		searchedMainProfile.setCustomerNameShort("INTEGRO");
		searchedMainProfile.setIdInfo1(idInfo);

		List customerList = new ArrayList();
		customerList.add(searchedMainProfile);

		Map parameters = new HashMap();
		parameters.put("cmsMainProfileId", new Long(20090111000111222l));

		SubProfile searchedSubProfile = new SubProfile();
		searchedSubProfile.setCmsId(20090111000111333l);
		searchedSubProfile.setCmsMainProfileId(20090111000111222l);

		List cmsSubProfileIdList = new ArrayList();
		cmsSubProfileIdList.add(new Long(20090111000111333l));

		List subProfileList = new ArrayList();
		subProfileList.add(searchedSubProfile);

		MockControl customerDaoControl = MockControl.createControl(ICustomerDao.class);
		ICustomerDao mockCustomerDao = (ICustomerDao) customerDaoControl.getMock();
		mockCustomerDao.searchCustomerByCustomerIdInfo(idInfo);
		customerDaoControl.setReturnValue(customerList);
		mockCustomerDao.retrieveObjectsListByParameters(parameters, SubProfile.class);
		customerDaoControl.setReturnValue(subProfileList);
		customerDaoControl.replay();

		LimitProfile searchedLimitProfile = new LimitProfile();
		searchedLimitProfile.setCmsSubProfileId(20090111000111333l);
		searchedLimitProfile.setAAApproveDate("20090110");
		searchedLimitProfile.setAALawType("COV");
		searchedLimitProfile.setAASource("SCI");
		searchedLimitProfile.setAAStatus("APPROVED");
		searchedLimitProfile.setAAType("MO");
		searchedLimitProfile.setHostAANumber("SCI-12345");
		searchedLimitProfile.setLOSAANumber("LOS-12345");

		List applicationList = new ArrayList();
		applicationList.add(searchedLimitProfile);

		MockControl limitDaoControl = MockControl.createControl(ILimitDao.class);
		ILimitDao mockLimitDao = (ILimitDao) limitDaoControl.getMock();
		mockLimitDao.searchLimitProfileByHostApplicationNumberAndApplicationTypeAndApplicationLawType(null, null, null,
				cmsSubProfileIdList);
		limitDaoControl.setReturnValue(applicationList);
		limitDaoControl.replay();

		CreditApplicationListingInquiryMessageHandler handler = new CreditApplicationListingInquiryMessageHandler();
		handler.setCustomerDao(mockCustomerDao);
		handler.setLimitDao(mockLimitDao);
		EAIMessage response = handler.doProcessInquiryMessage(inquiry);

		assertNotNull(response);
		assertTrue(response.getMsgBody() instanceof CreditApplicationListingResponseMessageBody);

		CreditApplicationListingResponseMessageBody responseMsgBody = (CreditApplicationListingResponseMessageBody) response
				.getMsgBody();
		assertEquals(1, responseMsgBody.getCreditApplications().size());

		CreditApplication creditApplication = (CreditApplication) responseMsgBody.getCreditApplications().get(0);
		assertEquals("20090110", creditApplication.getApplicationApproveDate());
		assertEquals("COV", creditApplication.getApplicationLawType());
		assertEquals("SCI", creditApplication.getApplicationSource());
		assertEquals("APPROVED", creditApplication.getApplicationStatus());
		assertEquals("MO", creditApplication.getApplicationType());
		assertEquals("SCI-12345", creditApplication.getHostAANumber());
		assertEquals("LOS-12345", creditApplication.getLosAANumber());
		assertNotNull(creditApplication.getMainProfile());

		customerDaoControl.verify();
		limitDaoControl.verify();

	}
}

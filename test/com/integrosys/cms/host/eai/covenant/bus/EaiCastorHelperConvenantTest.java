package com.integrosys.cms.host.eai.covenant.bus;

import java.net.URL;
import java.util.Iterator;

import junit.framework.TestCase;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;
import com.integrosys.cms.host.eai.covenant.ConvenantInquireMessageBody;
import com.integrosys.cms.host.eai.covenant.CovenantMessageBody;
import com.integrosys.cms.host.eai.covenant.CovenantResponseMsgBody;

public class EaiCastorHelperConvenantTest extends TestCase {

	public static String losAANo = "MO-TEST";
	public void setUp() {
		Log4jConfigTestPlugin.configure();
	}
	
	public void testCV001Mapping()
	{
		ClassLoader ctxLoder = Thread.currentThread().getContextClassLoader();
		
		URL mappingURL = ctxLoder.getResource("covenant.cm.xml");

		URL messageXMLURL = ctxLoder.getResource("CV001-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();

		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingURL, messageXMLURL.getPath(), EAIMessage.class);

		assertNotNull(a);
		
		CovenantMessageBody covMsg = (CovenantMessageBody) a.getMsgBody();

		assertNotNull(covMsg);

	}

	public void testCV002IMapping() {
		ClassLoader ctxLoder = Thread.currentThread().getContextClassLoader();
		
		URL mappingURL = ctxLoder.getResource("convenant-inquiry.cm.xml");

		URL messageXMLURL = ctxLoder.getResource("CV002I-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();

		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingURL, messageXMLURL.getPath(), EAIMessage.class);

		assertNotNull(a);
		
		ConvenantInquireMessageBody inqMsg = (ConvenantInquireMessageBody) a.getMsgBody();

		assertNotNull(inqMsg.getCovenant());

		assertTrue(inqMsg.getCovenant().getLOSAANumber().equals(losAANo));
	}
	
	public void testCV002RMapping() {
		ClassLoader ctxLoder = Thread.currentThread().getContextClassLoader();

		URL mappingURL = ctxLoder.getResource("convenant-response.cm.xml");

		URL messageXMLURL = ctxLoder.getResource("CV002R-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();

		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingURL, messageXMLURL.getPath(), EAIMessage.class);

		assertNotNull(a);
		
		CovenantResponseMsgBody inqMsg = (CovenantResponseMsgBody) a.getMsgBody();

		assertNotNull(inqMsg.getConvenantItem());

		assertTrue(inqMsg.getConvenantItem().size() == 2);
		
		CovenantItem item =(CovenantItem) inqMsg.getConvenantItem().get(0);
		
		assertNotNull(item);
		
		assertTrue(item.getRemarks().equals("remark1"));
		
		assertTrue(item.getCMSCovenantItemID().longValue()==1l);
	}
}

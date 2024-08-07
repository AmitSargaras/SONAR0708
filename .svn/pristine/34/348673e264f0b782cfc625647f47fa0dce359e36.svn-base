package com.integrosys.cms.host.eai.security.bus.property;

import java.net.URL;

import junit.framework.TestCase;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;
import com.integrosys.cms.host.eai.security.SecurityMessageBody;

public class PropertySecurityCastorTest extends TestCase {

	public void setUp() {
		Log4jConfigTestPlugin.configure();
	}

	public void testUnmarshallPropertyXmlUsingPrimitiveWrapper() {
		URL propertyXmlUrl = getClass().getResource("Property-Skeleton.xml");
		EAICastorHelper helper = EAICastorHelper.getInstance();

		URL xmlMappingUrl = Thread.currentThread().getContextClassLoader().getResource(
				"EaiMapping-collateral_Master.xml");

		EAIMessage msg = (EAIMessage) helper.unmarshal(xmlMappingUrl, propertyXmlUrl, EAIMessage.class);
		System.out.println(msg.getMsgBody().getClass().getName());
		SecurityMessageBody msgBody = (SecurityMessageBody) msg.getMsgBody();
		PropertySecurity property = msgBody.getPropertyDetail();

		assertEquals(new Short((short) 12), property.getPhysicalInspectionFrequencyUnit());
		assertEquals(new Double(230000d), property.getSnpAgreementValue());
		assertEquals(new Long(81100l), property.getPostCode());

		System.out.println(property.getQuitRentAmountPaid());
		assertNull(property.getQuitRentAmountPaid());
	}
}

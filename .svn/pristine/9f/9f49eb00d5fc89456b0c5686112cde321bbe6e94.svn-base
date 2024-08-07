package com.integrosys.cms.host.eai.limit.bus;

import com.integrosys.cms.host.eai.MessageReader;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;

import junit.framework.TestCase;

public class FacilityMultiTierFinancingCastorTest extends TestCase {
	public void testUnmarshallMultitierFin() {
		StringBuffer buf = new StringBuffer("<FacilityMultiTierFinancing>");
		buf.append("<TierTerm>").append("12").append("</TierTerm>");
		buf.append("<TierSeqNo>").append("1").append("</TierSeqNo>");
		buf.append("<TierTermCode>").append("<StandardCodeNum>").append("Term").append("</StandardCodeNum>").append(
				"<StandardCodeValue>").append("Term").append("</StandardCodeValue>").append("</TierTermCode>");
		buf.append("<Rate>").append("0.12").append("</Rate>");
		buf.append("<NewPaymentAmt>").append("333.33").append("</NewPaymentAmt>");
		buf.append("<GPPIndicator>").append("Y").append("</GPPIndicator>");
		buf.append("<UpdateStatusIndicator>").append("I").append("</UpdateStatusIndicator>");
		buf.append("<ChangeIndicator>").append("Y").append("</ChangeIndicator>");
		buf.append("</FacilityMultiTierFinancing>");

		EAICastorHelper unmarshaller = EAICastorHelper.getInstance();
		FacilityMultiTierFinancing multitier = (FacilityMultiTierFinancing) unmarshaller.unmarshal(Thread
				.currentThread().getContextClassLoader().getResource("aa-facility-islamic.cm.xml"), new MessageReader(
				buf.toString()), FacilityMultiTierFinancing.class);

		assertEquals(Integer.valueOf("12"), multitier.getTierTerm());
		assertEquals("Y", multitier.getGppIndicator());
	}
}

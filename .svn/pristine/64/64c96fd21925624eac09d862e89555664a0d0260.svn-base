package com.integrosys.cms.host.eai.limit.bus;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;

import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;
import org.exolab.castor.xml.ValidationException;

import com.integrosys.base.techinfra.test.CustomCastorMarshalUnmarshalTestCase;
import com.integrosys.cms.host.eai.StandardCode;

public class FacilityRelationshipCastorMarshallerAndUnmarshallerTest extends CustomCastorMarshalUnmarshalTestCase {
	public void testUnmarshalFacilityRelationship() {
		addMapping("aa.cm.xml");
		addMapping("common.cm.xml");

		FacilityRelationship relationship = (FacilityRelationship) execute(new UnmarshallerAction() {
			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				StringBuffer buf = new StringBuffer("<FacilityRelationship>");
				buf.append("<CIFId>112233</CIFId>");
				buf.append("<AccountRelationship>");
				buf.append("<StandardCodeNumber>RELATIONSHIP</StandardCodeNumber>");
				buf.append("<StandardCodeValue>GO</StandardCodeValue>");
				buf.append("</AccountRelationship>");
				buf.append("<GuaranteePercentage>22.33</GuaranteePercentage>");
				buf.append("<AddressSeqNum>1</AddressSeqNum>");
				buf.append("<ShareHolderPercentage>11.1</ShareHolderPercentage>");
				buf.append("<ReceiveMailCode>Y</ReceiveMailCode>");
				buf.append("<HoldMailCode>");
				buf.append("<StandardCodeNumber>HOLD_MAIL</StandardCodeNumber>");
				buf.append("<StandardCodeValue>BR</StandardCodeValue>");
				buf.append("</HoldMailCode>");
				buf.append("<NameAssociatedWFacOrder>1</NameAssociatedWFacOrder>");
				buf.append("<NameConjunctionPosition>A</NameConjunctionPosition>");
				buf.append("<NameConjunction>AND</NameConjunction>");
				buf.append("<ProfitRatio>2.33</ProfitRatio>");
				buf.append("<DividendRatio>0.22</DividendRatio>");
				buf.append("</FacilityRelationship>");

				return unmarshaller.unmarshal(new StringReader(buf.toString()));
			}
		});

		assertEquals(new Double("22.33"), relationship.getGuaranteePercentage());
		assertEquals("112233", relationship.getCIFId());
		assertEquals(new StandardCode("RELATIONSHIP", "GO"), relationship.getAccountRelationship());
		assertEquals(new Long(1), relationship.getAddressSeqNum());
		assertEquals(new Double("11.1"), relationship.getShareHolderPercentage());
		assertEquals("Y", relationship.getReceiveMailCode());
		assertEquals(new StandardCode("HOLD_MAIL", "BR"), relationship.getHoldMailCode());
		assertEquals(new Integer(1), relationship.getNameAssociatedWFacOrder());
		assertEquals("A", relationship.getNameConjunctionPosition());
		assertEquals("AND", relationship.getNameConjunction());
		assertEquals(new Double("2.33"), relationship.getProfitRatio());
		assertEquals(new Double("0.22"), relationship.getDividendRatio());
	}

	public void testMarshallFacilityRelationship() {
		addMapping("aa-response.cm.xml");
		addMapping("common-response.cm.xml");

		final FacilityRelationship relationship = new FacilityRelationship();
		relationship.setCIFId("112233");
		relationship.setCmsReferenceId(new Long(12345));
		relationship.setAccountRelationship(new StandardCode("RELATIONSHIP", "GO"));
		relationship.setGuaranteePercentage(new Double("22.33"));
		relationship.setAddressSeqNum(new Long(1));
		relationship.setShareHolderPercentage(new Double("11.1"));
		relationship.setReceiveMailCode("Y");
		relationship.setHoldMailCode(new StandardCode("HOLD_MAIL", "BR"));
		relationship.setNameAssociatedWFacOrder(new Integer(1));
		relationship.setNameConjunctionPosition("A");
		relationship.setNameConjunction("AND");
		relationship.setProfitRatio(new Double("2.33"));
		relationship.setDividendRatio(new Double("0.22"));

		String xml = (String) execute(new MarshallerAction() {
			public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException,
					IOException {
				StringWriter sw = new StringWriter();
				marshaller.setWriter(sw);
				marshaller.marshal(relationship);
				return sw.toString();
			}
		});

		assertTrue(xml.indexOf("<FacilityRelationship>") > 0);
		assertTrue(xml.indexOf("<CIFId>112233</CIFId>") > 0);
		assertTrue(xml.indexOf("<CMSFacilityRelationshipID>12345</CMSFacilityRelationshipID>") > 0);
		assertTrue(xml.indexOf("<AccountRelationship>") > 0);
		assertTrue(xml.indexOf("<StandardCodeNumber>RELATIONSHIP</StandardCodeNumber>") > 0);
		assertTrue(xml.indexOf("<StandardCodeValue>GO</StandardCodeValue>") > 0);
		assertTrue(xml.indexOf("</AccountRelationship>") > 0);
		assertTrue(xml.indexOf("<GuaranteePercentage>22.33</GuaranteePercentage>") > 0);
		assertTrue(xml.indexOf("<AddressSeqNum>1</AddressSeqNum>") > 0);
		assertTrue(xml.indexOf("<ShareHolderPercentage>11.1</ShareHolderPercentage>") > 0);
		assertTrue(xml.indexOf("<ReceiveMailCode>Y</ReceiveMailCode>") > 0);
		assertTrue(xml.indexOf("<HoldMailCode>") > 0);
		assertTrue(xml.indexOf("<StandardCodeNumber>HOLD_MAIL</StandardCodeNumber>") > 0);
		assertTrue(xml.indexOf("<StandardCodeValue>BR</StandardCodeValue>") > 0);
		assertTrue(xml.indexOf("</HoldMailCode>") > 0);
		assertTrue(xml.indexOf("<NameAssociatedWFacOrder>1</NameAssociatedWFacOrder>") > 0);
		assertTrue(xml.indexOf("<NameConjunctionPosition>A</NameConjunctionPosition>") > 0);
		assertTrue(xml.indexOf("<NameConjunction>AND</NameConjunction>") > 0);
		assertTrue(xml.indexOf("<ProfitRatio>2.33</ProfitRatio>") > 0);
		assertTrue(xml.indexOf("<DividendRatio>0.22</DividendRatio>") > 0);
		assertTrue(xml.indexOf("</FacilityRelationship>") > 0);

	}
}

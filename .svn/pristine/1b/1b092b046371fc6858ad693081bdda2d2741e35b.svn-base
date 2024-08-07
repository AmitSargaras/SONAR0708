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

public class FacilityBnmMarshalAndUnmarshalTest extends CustomCastorMarshalUnmarshalTestCase {
	public void testUnmarshalFacilityBnmXml() {
		addMapping("aa.cm.xml");
		addMapping("common.cm.xml");

		FacilityBNM bnm = (FacilityBNM) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				StringBuffer buf = new StringBuffer("<FacilityBNM>");
				buf.append("<BNMIndustryCode>");
				buf.append("<StandardCodeNumber>BNM_INDUSTRY</StandardCodeNumber>");
				buf.append("<StandardCodeValue>8400</StandardCodeValue>");
				buf.append("</BNMIndustryCode>");
				buf.append("<BNMSectorCode>");
				buf.append("<StandardCodeNumber>8</StandardCodeNumber>");
				buf.append("<StandardCodeValue>47</StandardCodeValue>");
				buf.append("</BNMSectorCode>");
				buf.append("<BNMStateCode>");
				buf.append("<StandardCodeNumber>BNM_STATE</StandardCodeNumber>");
				buf.append("<StandardCodeValue>J</StandardCodeValue>");
				buf.append("</BNMStateCode>");
				buf.append("<BNMBumiNRCCCode>");
				buf.append("<StandardCodeNumber>BNM_BUMI_NRCC</StandardCodeNumber>");
				buf.append("<StandardCodeValue>2</StandardCodeValue>");
				buf.append("</BNMBumiNRCCCode>");
				buf.append("<BNMSmallScaleCode>");
				buf.append("<StandardCodeNumber>BNM_SML_SCALE</StandardCodeNumber>");
				buf.append("<StandardCodeValue>0</StandardCodeValue>");
				buf.append("</BNMSmallScaleCode>");
				buf.append("<BNMPrescribedRateCode>");
				buf.append("<StandardCodeNumber>BNM_PRSCB_RT</StandardCodeNumber>");
				buf.append("<StandardCodeValue>00</StandardCodeValue>");
				buf.append("</BNMPrescribedRateCode>");
				buf.append("<BNMRelationshipCode>");
				buf.append("<StandardCodeNumber>BNM_RELSHIP</StandardCodeNumber>");
				buf.append("<StandardCodeValue>0</StandardCodeValue>");
				buf.append("</BNMRelationshipCode>");
				buf.append("<BNMExempt>N</BNMExempt>");
				buf.append(" <BNMExemptCode>");
				buf.append("<StandardCodeNumber>BNM_EXMPT_CODE</StandardCodeNumber>");
				buf.append("<StandardCodeValue/>");
				buf.append("</BNMExemptCode>");
				buf.append("<BNMPurposeCode>");
				buf.append("<StandardCodeNumber>BNM_PURPOSE</StandardCodeNumber>");
				buf.append("<StandardCodeValue>0000</StandardCodeValue>");
				buf.append("<StandardCodeDescription/>");
				buf.append("</BNMPurposeCode>");
				buf.append("<BaselSAFinalised>");
				buf.append("<StandardCodeNumber>BASEL_SA_FINALISED</StandardCodeNumber>");
				buf.append("<StandardCodeValue>BB</StandardCodeValue>");
				buf.append("</BaselSAFinalised>");
				buf.append("<BaselIRB>");
				buf.append("<StandardCodeNumber>BASEL_IRB</StandardCodeNumber>");
				buf.append("<StandardCodeValue>CC</StandardCodeValue>");
				buf.append("</BaselIRB>");
				buf.append("<BaselSAConcept>");
				buf.append("<StandardCodeNumber>BASEL_SA_CONCEPT</StandardCodeNumber>");
				buf.append("<StandardCodeValue>DD</StandardCodeValue>");
				buf.append("</BaselSAConcept>");
				buf.append("<UpdateStatusIndicator>U</UpdateStatusIndicator>");
				buf.append("<ChangeIndicator>Y</ChangeIndicator>");
				buf.append("</FacilityBNM>");

				return (FacilityBNM) unmarshaller.unmarshal(new StringReader(buf.toString()));
			}
		});

		assertEquals(new StandardCode("BNM_PURPOSE", "0000"), bnm.getBNMPurposeCode());
		assertEquals(new StandardCode("BASEL_IRB", "CC"), bnm.getBaselIRB());
		assertEquals(new StandardCode("BASEL_SA_CONCEPT", "DD"), bnm.getBaselSAConcept());
		assertEquals(new StandardCode("BASEL_SA_FINALISED", "BB"), bnm.getBaselSAFinalised());
	}

	public void testMarshalFacilityBnmObject() {
		addMapping("aa-response.cm.xml");
		addMapping("common-response.cm.xml");

		String xml = (String) execute(new MarshallerAction() {

			public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException,
					IOException {
				FacilityBNM bnm = new FacilityBNM();
				bnm.setBaselIRB(new StandardCode("BASEL_IRB", "000"));
				bnm.setBaselSAConcept(new StandardCode("BASEL_SA_CONCEPT", "000"));
				bnm.setBaselSAFinalised(new StandardCode("BASEL_SA_FINALISED", "000"));
				bnm.setBNMBumiNRCCCode(new StandardCode("BUMI_NRCC", "000"));
				bnm.setBNMExempt("Y");
				bnm.setBNMExemptCode(new StandardCode("EXEMPT", "000"));
				bnm.setBNMGoodFinancedCd1(new StandardCode("GOOD_FINANCE", "000"));
				bnm.setBNMGoodFinancedCd2(new StandardCode("GOOD_FINANCE", "000"));
				bnm.setBNMIndustryCode(new StandardCode("INDUSTRY", "000"));
				bnm.setBNMPrescribedRateCode(new StandardCode("PRESCRIBED_RATE", "000"));
				bnm.setBNMPurposeCode(new StandardCode("PURPOSE", "000"));
				bnm.setBNMRelationshipCode(new StandardCode("RELATIONSHIP", "000"));
				bnm.setBNMSectorCode(new StandardCode("SECTOR", "000"));
				bnm.setBNMSmallScaleCode(new StandardCode("IRB", "000"));
				bnm.setBNMStateCode(new StandardCode("IRB", "000"));

				StringWriter sw = new StringWriter();
				marshaller.setWriter(sw);
				marshaller.marshal(bnm);
				return sw.toString();
			}
		});

		assertTrue(xml.indexOf("<StandardCodeNumber>BASEL_SA_FINALISED</StandardCodeNumber>") > 0);
		assertTrue(xml.indexOf("<StandardCodeNumber>BASEL_IRB</StandardCodeNumber>") > 0);
		assertTrue(xml.indexOf("<StandardCodeNumber>BASEL_SA_CONCEPT</StandardCodeNumber>") > 0);

	}
}

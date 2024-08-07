package com.integrosys.cms.host.eai.limit.bus;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.Date;

import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;
import org.exolab.castor.xml.ValidationException;

import com.integrosys.base.techinfra.test.CustomCastorMarshalUnmarshalTestCase;
import com.integrosys.cms.host.eai.StandardCode;

/**
 * @author Chong Jun Yong
 * 
 */
public class FacilityIncrementalAndReductionCastorMarshalUnmarshalTest extends CustomCastorMarshalUnmarshalTestCase {

	public void testUnmarshalFacilityIncrementalXml() {
		addMapping("aa.cm.xml");
		addMapping("common.cm.xml");

		FacilityIncremental inc = (FacilityIncremental) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				StringBuffer buf = new StringBuffer("<FacilityIncremental>");
				buf.append("<IncrementalNumber>1</IncrementalNumber>");
				buf.append("<AmountApplied>333.22</AmountApplied>");
				buf.append("<IncrementalLimit>22.11</IncrementalLimit>");
				buf.append("<ApplicationDate>20090909</ApplicationDate>");
				buf.append("<LoanPurposeCode>");
				buf.append("<StandardCodeNumber>LOAN_PURPOSE</StandardCodeNumber>");
				buf.append("<StandardCodeValue>SHOP</StandardCodeValue>");
				buf.append("</LoanPurposeCode>");
				buf.append("<DateOfOffer>20090909</DateOfOffer>");
				buf.append("<DateOfferAccepted>20090909</DateOfferAccepted>");
				buf.append("<DateApproved>20090909</DateApproved>");
				buf.append("<ApprovedBy>");
				buf.append("<StandardCodeNumber>APPROVED_BY</StandardCodeNumber>");
				buf.append("<StandardCodeValue>CXC</StandardCodeValue>");
				buf.append("</ApprovedBy>");
				buf.append("<CancelRejectCode>");
				buf.append("<StandardCodeNumber>CANCEL_REJECT</StandardCodeNumber>");
				buf.append("<StandardCodeValue>BAD</StandardCodeValue>");
				buf.append("</CancelRejectCode>");
				buf.append("<CancelRejectDate>20090909</CancelRejectDate>");
				buf.append("<FacilityStatus>A</FacilityStatus>");
				buf.append("<DealerLLPCode>");
				buf.append("<StandardCodeNumber>DEALER</StandardCodeNumber>");
				buf.append("<StandardCodeValue>EEE</StandardCodeValue>");
				buf.append("</DealerLLPCode>");
				buf.append("<SolicitorName>Chow Xing Ci</SolicitorName>");
				buf.append("<RequestReason>");
				buf.append("<StandardCodeNumber>REQ_REASON</StandardCodeNumber>");
				buf.append("<StandardCodeValue>BAD</StandardCodeValue>");
				buf.append("</RequestReason>");
				buf.append("<DocumentationStatus>");
				buf.append("<StandardCodeNumber>DOC_STAT</StandardCodeNumber>");
				buf.append("<StandardCodeValue>P</StandardCodeValue>");
				buf.append("</DocumentationStatus>");
				buf.append("<LawyerCode>");
				buf.append("<StandardCodeNumber>LAWYER</StandardCodeNumber>");
				buf.append("<StandardCodeValue>0012</StandardCodeValue>");
				buf.append("</LawyerCode>");
				buf.append("<UpdateStatusIndicator>I</UpdateStatusIndicator>");
				buf.append("<ChangeIndicator>Y</ChangeIndicator>");
				buf.append("</FacilityIncremental>");
				return unmarshaller.unmarshal(new StringReader(buf.toString()));
			}
		});

		assertNotNull(inc);
		assertEquals(new StandardCode("LOAN_PURPOSE", "SHOP"), inc.getLoanPurposeCode());
		assertEquals(new StandardCode("APPROVED_BY", "CXC"), inc.getApprovedBy());
	}

	public void testUnmarshalFacilityReductionXml() {
		addMapping("aa.cm.xml");
		addMapping("common.cm.xml");

		FacilityReduction dec = (FacilityReduction) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				StringBuffer buf = new StringBuffer("<FacilityReduction>");
				buf.append("<IncrementalNumber>1</IncrementalNumber>");
				buf.append("<AmountApplied>333.22</AmountApplied>");
				buf.append("<IncrementalLimit>22.11</IncrementalLimit>");
				buf.append("<ApplicationDate>20090909</ApplicationDate>");
				buf.append("<DateOfferAccepted>20090909</DateOfferAccepted>");
				buf.append("<DateApproved>20090909</DateApproved>");
				buf.append("<ApprovedBy>");
				buf.append("<StandardCodeNumber>APPROVED_BY</StandardCodeNumber>");
				buf.append("<StandardCodeValue>CXC</StandardCodeValue>");
				buf.append("</ApprovedBy>");
				buf.append("<CancelRejectCode>");
				buf.append("<StandardCodeNumber>CANCEL_REJECT</StandardCodeNumber>");
				buf.append("<StandardCodeValue>BAD</StandardCodeValue>");
				buf.append("</CancelRejectCode>");
				buf.append("<CancelRejectDate>20090909</CancelRejectDate>");
				buf.append("<FacilityStatus>A</FacilityStatus>");
				buf.append("<SolicitorName>Chow Xing Ci</SolicitorName>");
				buf.append("<RequestReason>");
				buf.append("<StandardCodeNumber>REQ_REASON</StandardCodeNumber>");
				buf.append("<StandardCodeValue>BAD</StandardCodeValue>");
				buf.append("</RequestReason>");
				buf.append("<DocumentationStatus>");
				buf.append("<StandardCodeNumber>DOC_STAT</StandardCodeNumber>");
				buf.append("<StandardCodeValue>P</StandardCodeValue>");
				buf.append("</DocumentationStatus>");
				buf.append("<LawyerCode>");
				buf.append("<StandardCodeNumber>LAWYER</StandardCodeNumber>");
				buf.append("<StandardCodeValue>0012</StandardCodeValue>");
				buf.append("</LawyerCode>");
				buf.append("<UpdateStatusIndicator>I</UpdateStatusIndicator>");
				buf.append("<ChangeIndicator>Y</ChangeIndicator>");
				buf.append("</FacilityReduction>");
				return unmarshaller.unmarshal(new StringReader(buf.toString()));
			}
		});

		assertNotNull(dec);
		assertEquals(new StandardCode("APPROVED_BY", "CXC"), dec.getApprovedBy());
		assertEquals(new StandardCode("REQ_REASON", "BAD"), dec.getRequestReason());
	}

	public void testMarshalFacilityIncrementalXml() {
		addMapping("aa-response.cm.xml");
		addMapping("common-response.cm.xml");

		final StringWriter sw = new StringWriter();

		execute(new MarshallerAction() {

			public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException,
					IOException {
				Date todayDate = new Date();

				FacilityIncremental inc = new FacilityIncremental();
				inc.setAmountApplied(new Double(2233.22));
				inc.setApplicationDate(todayDate);
				inc.setApprovedBy(new StandardCode("APPROVE_BY", "ME"));
				inc.setCancelRejectCode(new StandardCode("CANCEL_REJECT", "BAD"));
				inc.setCancelRejectDate(todayDate);
				inc.setDateApproved(todayDate);
				inc.setDateOfferAccepted(todayDate);
				inc.setDateOfOffer(todayDate);
				inc.setDealerLLPCode(new StandardCode("DEALER", "001"));
				inc.setDocumentationStatus(new StandardCode("DOC_STAT", "P"));
				inc.setFacilityStatus("A");
				inc.setIncrementalLimit(new Double(1122.11));
				inc.setIncrementalNumber(new Integer(1));
				inc.setLawyerCode(new StandardCode("LAWYER", "CXC"));
				inc.setLoanPurposeCode(new StandardCode("LOAN_PURPOSE", "SHOPPING"));
				inc.setRequestReason(new StandardCode("REQ_REASON", "BAD"));
				inc.setSolicitorName("Chow Xing Chi");

				marshaller.setWriter(sw);
				marshaller.marshal(inc);

				return null;
			}
		});

		String xml = sw.toString();

		assertNotNull(xml);
		assertTrue(xml.indexOf("<StandardCodeValue>SHOPPING</StandardCodeValue>") > 0);
	}
	
	public void testMarshalFacilityReductionXml() {
		addMapping("aa-response.cm.xml");
		addMapping("common-response.cm.xml");

		final StringWriter sw = new StringWriter();

		execute(new MarshallerAction() {

			public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException,
					IOException {
				Date todayDate = new Date();

				FacilityReduction dec = new FacilityReduction();
				dec.setAmountApplied(new Double(2233.22));
				dec.setApplicationDate(todayDate);
				dec.setApprovedBy(new StandardCode("APPROVE_BY", "ME"));
				dec.setCancelRejectCode(new StandardCode("CANCEL_REJECT", "BAD"));
				dec.setCancelRejectDate(todayDate);
				dec.setDateApproved(todayDate);
				dec.setDateOfferAccepted(todayDate);
				dec.setDocumentationStatus(new StandardCode("DOC_STAT", "P"));
				dec.setFacilityStatus("A");
				dec.setIncrementalLimit(new Double(1122.11));
				dec.setIncrementalNumber(new Integer(2));
				dec.setLawyerCode(new StandardCode("LAWYER", "CXC"));
				dec.setRequestReason(new StandardCode("REQ_REASON", "BAD"));
				dec.setSolicitorName("Chow Xing Chi");

				marshaller.setWriter(sw);
				marshaller.marshal(dec);

				return null;
			}
		});

		String xml = sw.toString();

		assertNotNull(xml);
		assertTrue(xml.indexOf("<StandardCodeValue>CXC</StandardCodeValue>") > 0);
		assertTrue(xml.indexOf("<SolicitorName>Chow Xing Chi</SolicitorName>") > 0);
	}
}

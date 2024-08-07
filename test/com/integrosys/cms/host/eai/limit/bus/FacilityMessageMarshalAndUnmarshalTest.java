package com.integrosys.cms.host.eai.limit.bus;

import java.io.IOException;
import java.io.StringWriter;
import java.text.ParseException;
import java.util.Date;

import org.apache.commons.lang.time.DateUtils;
import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;
import org.exolab.castor.xml.ValidationException;
import org.springframework.core.io.ClassPathResource;
import org.xml.sax.InputSource;

import com.integrosys.base.techinfra.test.CustomCastorMarshalUnmarshalTestCase;
import com.integrosys.cms.host.eai.StandardCode;

public class FacilityMessageMarshalAndUnmarshalTest extends CustomCastorMarshalUnmarshalTestCase {

	public void testUnmarshalFacilityMassageXml() {
		addMapping("aa.cm.xml");
		addMapping("common.cm.xml");

		FacilityMessage msg = (FacilityMessage) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				FacilityMessage msg = (FacilityMessage) unmarshaller.unmarshal(new InputSource(new ClassPathResource(
						"FacilityMessage.xml", getClass()).getInputStream()));
				return msg;
			}
		});

		assertEquals("I love Junit Testing", msg.getMessage());
		assertEquals(new StandardCode("MSG_TYPE", "11"), msg.getMessageTypeCode());
		assertEquals(new StandardCode("MSG_SEV", "AA"), msg.getMessageSeverityCode());
		try {
			assertEquals(DateUtils.parseDate("20090911", new String[] { "yyyyMMdd" }), msg.getExpirationDate());
		}
		catch (ParseException e) {
			fail("failed to parse '20090911' as date");
		}
	}

	public void testMarshalFacilityMessageObject() {
		addMapping("aa-response.cm.xml");
		addMapping("common-response.cm.xml");

		String xml = (String) execute(new MarshallerAction() {

			public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException,
					IOException {
				FacilityMessage msg = new FacilityMessage();
				msg.setExpirationDate(new Date());
				msg.setMessage("I love junit test");
				msg.setMessageSeverityCode(new StandardCode("MSG_SEV", "001"));
				msg.setMessageTypeCode(new StandardCode("MSG_TYPE", "002"));
				try {
					msg.setExpirationDate(DateUtils.parseDate("20090911", new String[] { "yyyyMMdd" }));
				}
				catch (ParseException e) {
					throw new ValidationException("failed to parse date '20090911'");
				}

				StringWriter sw = new StringWriter();
				marshaller.setWriter(sw);
				marshaller.marshal(msg);
				return sw.toString();
			}
		});

		assertTrue(xml.indexOf("<Message>I love junit test</Message>") > 0);
		assertTrue(xml.indexOf("<StandardCodeNumber>MSG_SEV</StandardCodeNumber>") > 0);
		assertTrue(xml.indexOf("<StandardCodeValue>001</StandardCodeValue>") > 0);
		assertTrue(xml.indexOf("<StandardCodeNumber>MSG_TYPE</StandardCodeNumber") > 0);
		assertTrue(xml.indexOf("<StandardCodeValue>002</StandardCodeValue>") > 0);
		assertTrue(xml.indexOf("<ExpirationDate>20090911</ExpirationDate>") > 0);
	}
}

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

/**
 * @author Chong Jun Yong
 * 
 */
public class FacilityIslamicRentalRenewalMarshalAndUnmarshalTest extends CustomCastorMarshalUnmarshalTestCase {
	public void testUnmarshalFacilityIslamicRentalRenewalXml() {
		addMapping("aa-facility-islamic.cm.xml");
		addMapping("common.cm.xml");

		FacilityIslamicRentalRenewal renewal = (FacilityIslamicRentalRenewal) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				StringBuffer xml = new StringBuffer();
				xml.append("<FacilityIslamicRentalRenewal>");
				xml.append("<RenewalTerm>64</RenewalTerm>");
				xml.append("<RenewalTermCode>");
				xml.append("<StandardCodeNumber>RENEW</StandardCodeNumber>");
				xml.append("<StandardCodeValue>M</StandardCodeValue>");
				xml.append("</RenewalTermCode>");
				xml.append("<RenewalRate>81.22</RenewalRate>");
				xml.append("<PrimeRateNumber>");
				xml.append("<StandardCodeNumber>PRIME_RATE</StandardCodeNumber>");
				xml.append("<StandardCodeValue>001</StandardCodeValue>");
				xml.append("</PrimeRateNumber>");
				xml.append("<PrimeVariance>13.44</PrimeVariance>");
				xml.append("<PrimeVarianceCode>IJRAH</PrimeVarianceCode>");
				xml.append("<UpdateStatusIndicator>I</UpdateStatusIndicator>");
				xml.append("<ChangeIndicator>Y</ChangeIndicator>");
				xml.append("</FacilityIslamicRentalRenewal>");

				return (FacilityIslamicRentalRenewal) unmarshaller.unmarshal(new StringReader(xml.toString()));
			}
		});

		FacilityIslamicRentalRenewal ren = new FacilityIslamicRentalRenewal();
		ren.setPrimeRateNumber(new StandardCode("PRIME_RATE", "001"));
		ren.setPrimeVariance(new Double(13.44));
		ren.setPrimeVarianceCode("IJRAH");
		ren.setRenewalRate(new Double(81.22));
		ren.setRenewalTerm(new Long(64));
		ren.setRenewalTermCode(new StandardCode("RENEW", "M"));

		assertEquals(ren.getPrimeVarianceCode(), renewal.getPrimeVarianceCode());
		assertEquals(ren.getRenewalRate(), renewal.getRenewalRate());
		assertEquals(ren.getRenewalTermCode(), renewal.getRenewalTermCode());
		assertEquals("I", renewal.getUpdateStatusIndicator());
		assertEquals("Y", renewal.getChangeIndicator());
	}

	public void testMarshalFacilityIslamicRentalRenewalObject() {
		addMapping("aa-response.cm.xml");
		addMapping("common-response.cm.xml");

		String xml = (String) execute(new MarshallerAction() {

			public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException,
					IOException {
				FacilityIslamicRentalRenewal ren = new FacilityIslamicRentalRenewal();
				ren.setPrimeRateNumber(new StandardCode("PRIME_RATE", "001"));
				ren.setPrimeVariance(new Double(13.44));
				ren.setPrimeVarianceCode("IJRAH");
				ren.setRenewalRate(new Double(81.22));
				ren.setRenewalTerm(new Long(64));
				ren.setRenewalTermCode(new StandardCode("RENEW", "M"));
				ren.setStatus("ACTIVE");

				StringWriter sw = new StringWriter();
				marshaller.setWriter(sw);
				marshaller.marshal(ren);
				return sw.toString();
			}
		});

		assertTrue(xml.indexOf("<RenewalTerm>64</RenewalTerm>") > 0);
		assertTrue(xml.indexOf("<StandardCodeNumber>RENEW</StandardCodeNumber>") > 0);
		assertTrue(xml.indexOf("<RenewalRate>81.22</RenewalRate>") > 0);
		assertTrue(xml.indexOf("<StandardCodeValue>001</StandardCodeValue>") > 0);
		assertTrue(xml.indexOf("<PrimeVariance>13.44</PrimeVariance>") > 0);
		assertTrue(xml.indexOf("<PrimeVarianceCode>IJRAH</PrimeVarianceCode>") > 0);
	}
}

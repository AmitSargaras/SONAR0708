package com.integrosys.cms.host.eai.limit.bus;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;

import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;
import org.exolab.castor.xml.ValidationException;

import com.integrosys.base.techinfra.test.CustomCastorMarshalUnmarshalTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class FacilityIslamicSecurityDepositMarshalAndUnmarshalTest extends CustomCastorMarshalUnmarshalTestCase {
	public void testUnmarshalFacilityIslamicSecurityDepositXml() {
		addMapping("aa-facility-islamic.cm.xml");
		addMapping("common.cm.xml");

		FacilityIslamicSecurityDeposit deposit = (FacilityIslamicSecurityDeposit) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				StringBuffer xml = new StringBuffer();
				xml.append("<FacilityIslamicSecurityDeposit>");
				xml.append("<NumberOfMonth>12</NumberOfMonth>");
				xml.append("<SecurityDeposit>791.22</SecurityDeposit>");
				xml.append("<FixSecurityDepositAmt>788.22</FixSecurityDepositAmt>");
				xml.append("<OriginalSecurityDepositAmt>588.33</OriginalSecurityDepositAmt>");
				xml.append("<UpdateStatusIndicator>I</UpdateStatusIndicator>");
				xml.append("<ChangeIndicator>Y</ChangeIndicator>");
				xml.append("</FacilityIslamicSecurityDeposit>");

				return (FacilityIslamicSecurityDeposit) unmarshaller.unmarshal(new StringReader(xml.toString()));
			}
		});

		FacilityIslamicSecurityDeposit dep = new FacilityIslamicSecurityDeposit();
		dep.setFixSecurityDepositAmount(new Double(788.22));
		dep.setNumberOfMonth(new Integer(12));
		dep.setOriginalSecurityDepositAmount(new Double(588.33));
		dep.setSecurityDeposit(new Double(791.22));

		assertEquals(dep.getFixSecurityDepositAmount(), deposit.getFixSecurityDepositAmount());
		assertEquals(dep.getOriginalSecurityDepositAmount(), deposit.getOriginalSecurityDepositAmount());
		assertEquals("I", deposit.getUpdateStatusIndicator());
		assertEquals("Y", deposit.getChangeIndicator());
	}

	public void testMarshalFacilityIslamicSecurityDepositObject() {
		addMapping("aa-response.cm.xml");
		addMapping("common-response.cm.xml");

		String xml = (String) execute(new MarshallerAction() {

			public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException,
					IOException {
				FacilityIslamicSecurityDeposit dep = new FacilityIslamicSecurityDeposit();
				dep.setFixSecurityDepositAmount(new Double(788.22));
				dep.setNumberOfMonth(new Integer(12));
				dep.setOriginalSecurityDepositAmount(new Double(588.33));
				dep.setSecurityDeposit(new Double(791.22));
				dep.setUpdateStatusIndicator("I");
				dep.setChangeIndicator("Y");

				StringWriter sw = new StringWriter();
				marshaller.setWriter(sw);
				marshaller.marshal(dep);
				return sw.toString();
			}
		});

		assertTrue(xml.indexOf("<NumberOfMonth>12</NumberOfMonth>") > 0);
		assertTrue(xml.indexOf("<SecurityDeposit>791.22</SecurityDeposit>") > 0);
		assertTrue(xml.indexOf("<FixSecurityDepositAmt>788.22</FixSecurityDepositAmt>") > 0);
		assertTrue(xml.indexOf("<OriginalSecurityDepositAmt>588.33</OriginalSecurityDepositAmt>") > 0);
		assertTrue(xml.indexOf("<UpdateStatusIndicator>I</UpdateStatusIndicator>") > 0);
		assertTrue(xml.indexOf("<ChangeIndicator>Y</ChangeIndicator>") > 0);
	}
}

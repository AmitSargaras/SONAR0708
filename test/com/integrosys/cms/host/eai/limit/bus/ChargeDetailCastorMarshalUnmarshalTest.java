package com.integrosys.cms.host.eai.limit.bus;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.Arrays;

import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.Unmarshaller;
import org.exolab.castor.xml.ValidationException;

import com.integrosys.base.techinfra.test.CustomCastorMarshalUnmarshalTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class ChargeDetailCastorMarshalUnmarshalTest extends CustomCastorMarshalUnmarshalTestCase {
	public void testMarshalChargeDetailObject() {
		addMapping("aa-response.cm.xml");
		addMapping("common-response.cm.xml");

		String xml = (String) execute(new MarshallerAction() {

			public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException,
					IOException {
				ChargeDetail charge = new ChargeDetail();
				charge.setChangeIndicator("Y");
				charge.setChargeAmount(new Double(55.66));
				charge.setChargeType("S");
				charge.setCMSLimitId(new Long[] { new Long(1234), new Long(5678) });
				charge.setCmsSecurityId(555444);
				charge.setConfirmChargedDate("20081212");
				charge.setExpiryDate("20101212");
				charge.setLegallyChargedDate("20081213");
				charge.setLimitId(new String[] { "2468", "1357" });
				charge.setPartyCharge("1");
				charge.setPriorChargeAmount(new Double(1.2));
				charge.setPriorChargeChargee("WB");
				charge.setPriorChargeCurrency("MYR");
				charge.setPriorChargeType("S");
				charge.setSecurityId("444555");
				charge.setSecurityRanking(new Integer(1));
				charge.setChargePendingRedemption("Y");
				charge.setUpdateStatusIndicator("I");

				StringWriter writer = new StringWriter();
				marshaller.setWriter(writer);
				marshaller.marshal(charge);

				return writer.toString();
			}
		});

		assertTrue(xml.indexOf("<LOSSecurityId>444555</LOSSecurityId>") > 0);
		assertTrue(xml.indexOf("<LimitIDs><LOSLimitId>2468</LOSLimitId><LOSLimitId>1357</LOSLimitId></LimitIDs>") > 0);
		assertTrue(xml.indexOf("<CMSLimitIDs><CMSLimitId>1234</CMSLimitId><CMSLimitId>5678</CMSLimitId></CMSLimitIDs>") > 0);
		assertTrue(xml.indexOf("<ChargeType>S</ChargeType>") > 0);
		assertTrue(xml.indexOf("<ChargeAmt>55.66</ChargeAmt>") > 0);
		assertTrue(xml.indexOf("<PartyCharge>1</PartyCharge>") > 0);
		assertTrue(xml.indexOf("<SecurityRank>1</SecurityRank>") > 0);
		assertTrue(xml.indexOf("<DateLegallyCharge>20081213</DateLegallyCharge>") > 0);
		assertTrue(xml.indexOf("<ConfirmChargeDate>20081212</ConfirmChargeDate>") > 0);
		assertTrue(xml.indexOf("<PriorChargee>WB</PriorChargee>") > 0);
		assertTrue(xml.indexOf("<PriorChargeType>S</PriorChargeType>") > 0);
		assertTrue(xml.indexOf("<DateLegallyCharge>20081213</DateLegallyCharge>") > 0);
		assertTrue(xml.indexOf("<ChargePendingRedemption>Y</ChargePendingRedemption>") > 0);
	}

	public void testUnmarshalChargeDetailXmlString() {
		addMapping("aa.cm.xml");
		addMapping("common.cm.xml");

		ChargeDetail charge = (ChargeDetail) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				StringBuffer xml = new StringBuffer();
				xml.append("<SecurityLimitChargeDetail>");
				xml.append("<LOSSecurityId>444555</LOSSecurityId>");
				xml.append("<LimitIDs>");
				xml.append("<LOSLimitId>2468</LOSLimitId>");
				xml.append("<LOSLimitId>1357</LOSLimitId>");
				xml.append("</LimitIDs>");
				xml.append("<CMSLimitIDs>");
				xml.append("<CMSLimitId>1234</CMSLimitId>");
				xml.append("<CMSLimitId>5678</CMSLimitId>");
				xml.append("</CMSLimitIDs>");
				xml.append("<ChargeType>S</ChargeType>");
				xml.append("<ChargeAmt>55.66</ChargeAmt>");
				xml.append("<SecurityRank>1</SecurityRank>");
				xml.append("<DateLegallyCharge>20081213</DateLegallyCharge>");
				xml.append("<ConfirmChargeDate>20081212</ConfirmChargeDate>");
				xml.append("<PriorChargee>WB</PriorChargee>");
				xml.append("<PriorChargeType>S</PriorChargeType>");
				xml.append("<PartyCharge>1</PartyCharge>");
				xml.append("<ChargePendingRedemption>Y</ChargePendingRedemption>");
				xml.append("<UpdateStatusIndicator>I</UpdateStatusIndicator>");
				xml.append("<ChangeIndicator>Y</ChangeIndicator>");
				xml.append("</SecurityLimitChargeDetail>");

				return unmarshaller.unmarshal(new StringReader(xml.toString()));
			}
		});

		assertEquals("444555", charge.getSecurityId());
		assertTrue(Arrays.equals(new String[] { "2468", "1357" }, charge.getLimitId()));
		assertTrue(Arrays.equals(new Long[] { new Long(1234), new Long(5678) }, charge.getCMSLimitId()));
		assertEquals("S", charge.getChargeType());
		assertEquals(new Double(55.66), charge.getChargeAmount());
		assertEquals(new Integer(1), charge.getSecurityRanking());
		assertEquals("20081213", charge.getLegallyChargedDate());
		assertEquals("20081212", charge.getConfirmChargedDate());
		assertEquals("WB", charge.getPriorChargeChargee());
		assertEquals("S", charge.getPriorChargeType());
		assertEquals("1", charge.getPartyCharge());
		assertEquals("Y", charge.getChargePendingRedemption());
		assertEquals("I", charge.getUpdateStatusIndicator());
		assertEquals("Y", charge.getChangeIndicator());
	}
}

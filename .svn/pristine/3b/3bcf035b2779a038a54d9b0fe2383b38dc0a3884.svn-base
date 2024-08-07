package com.integrosys.cms.host.eai.limit.bus;

import java.net.URL;
import java.text.ParseException;
import java.util.Date;

import junit.framework.TestCase;

import org.apache.commons.lang.time.DateUtils;

import com.integrosys.cms.host.eai.MessageReader;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;

public class SystemXReferenceUnmarshallerTest extends TestCase {
	public void testUnmarshallerSysXRefXmlToObject() {
		String xml = "<?xml version=\"1.0\"?><AccountDetail><CIFId>12345</CIFId>"
				+ "<AccountNumber>555444333</AccountNumber><CMSLimitIDs><CMSLimitID>56789</CMSLimitID></CMSLimitIDs>"
				+ "<AccountSeqNo>999888111</AccountSeqNo><FacilitySeqNo>1122333</FacilitySeqNo>"
				+ "<FirstDisbursementDate>20090421</FirstDisbursementDate></AccountDetail>";

		URL castorXmlMappingUrl = Thread.currentThread().getContextClassLoader()
				.getResource("EaiMapping-aa_Master.xml");

		SystemXReference xref = (SystemXReference) EAICastorHelper.getInstance().unmarshal(castorXmlMappingUrl,
				new MessageReader(xml), SystemXReference.class);

		assertEquals("12345", xref.getCIFId());
		assertNotNull(xref.getCmsLimitIds());
		assertEquals(1, xref.getCmsLimitIds().length);
		assertEquals(Long.valueOf("56789"), xref.getCmsLimitIds()[0]);
		assertEquals(Long.valueOf("999888111"), xref.getAccountSequence());
		assertEquals(Long.valueOf("1122333"), xref.getFacilitySequenceNumber());
		assertNotNull(xref.getFirstDisbursementDate());

		try {
			Date comparedDate = DateUtils.parseDate("20090421", new String[] { "yyyyMMdd" });
			assertTrue(!comparedDate.after(xref.getFirstDisbursementDate())
					&& !comparedDate.before(xref.getFirstDisbursementDate()));
		}
		catch (ParseException e) {
			// impossible
		}

		castorXmlMappingUrl = Thread.currentThread().getContextClassLoader().getResource("aa-response.cm.xml");

		xml = EAICastorHelper.getInstance().marshal(castorXmlMappingUrl, xref, SystemXReference.class);
		System.out.println(xml);
		assertTrue(xml.indexOf("<FirstDisbursementDate>20090421</FirstDisbursementDate>") > 0);

		xref.setFirstDisbursementDate(null);
		xml = EAICastorHelper.getInstance().marshal(castorXmlMappingUrl, xref, SystemXReference.class);
		System.out.println(xml);
		assertFalse(xml.indexOf("<FirstDisbursementDate>20090421</FirstDisbursementDate>") > 0);
	}
}

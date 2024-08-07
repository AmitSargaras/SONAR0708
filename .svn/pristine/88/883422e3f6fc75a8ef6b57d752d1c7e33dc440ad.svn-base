package com.integrosys.cms.host.eai.limit.bus;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Unmarshaller;
import org.exolab.castor.xml.ValidationException;
import org.xml.sax.InputSource;

import com.integrosys.base.techinfra.test.CustomCastorMarshalUnmarshalTestCase;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.limit.AAMessageBody;

/**
 * @author Chong Jun Yong
 */
public class CorporateApplicationXmlUnmarshalTest extends CustomCastorMarshalUnmarshalTestCase {
	/**
	 * Test against <b>CA001-corporate.xml</b> located in the same package with
	 * this class
	 */
	public void testUnmarshalCorporateApplicationXml() {
		addMapping("aa.cm.xml");
		addMapping("aa-facility-islamic.cm.xml");
		addMapping("common.cm.xml");

		EAIMessage msg = (EAIMessage) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				EAIMessage msg = (EAIMessage) unmarshaller.unmarshal(new InputSource(getClass().getResourceAsStream(
						"CA001-corporate.xml")));

				return msg;
			}
		});

		assertTrue(msg.getMsgBody() instanceof AAMessageBody);

		AAMessageBody msgBody = (AAMessageBody) msg.getMsgBody();
		Vector limits = msgBody.getLimits();
		assertEquals(1, limits.size());

		Limits limit = (Limits) limits.get(0);
		LimitGeneral lmt = limit.getLimitGeneral();
		assertNotNull(lmt);
		assertEquals(2, limit.getFacilityMessages().size());
		assertEquals(2, limit.getFacilityIncrementals().size());
		assertEquals(2, limit.getFacilityReductions().size());
		assertNotNull(limit.getFacilityIslamicRentalRenewal());
		assertNotNull(limit.getFacilityIslamicSecurityDeposit());
		assertTrue(limit.getFacilityMessages() instanceof ArrayList);
		assertTrue(limit.getFacilityMessages().get(0) instanceof FacilityMessage);
		assertTrue(limit.getFacilityIslamicRentalRenewal() instanceof FacilityIslamicRentalRenewal);
		assertTrue(limit.getFacilityIslamicSecurityDeposit() instanceof FacilityIslamicSecurityDeposit);
		assertTrue(limit.getFacilityIncrementals() instanceof ArrayList);
		assertTrue(limit.getFacilityIncrementals().get(0) instanceof FacilityIncremental);
		assertTrue(limit.getFacilityReductions() instanceof ArrayList);
		assertTrue(limit.getFacilityReductions().get(0) instanceof FacilityReduction);
		System.out.println(limit.getFacilityMessages());
		System.out.println(limit.getFacilityIslamicRentalRenewal());
		System.out.println(limit.getFacilityIslamicSecurityDeposit());
		System.out.println(limit.getFacilityIncrementals());
		System.out.println(limit.getFacilityReductions());
	}
}

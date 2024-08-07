package com.integrosys.cms.host.eai.limit.validator;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Arrays;

import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Unmarshaller;
import org.exolab.castor.xml.ValidationException;
import org.xml.sax.InputSource;

import com.integrosys.base.techinfra.test.CustomCastorMarshalUnmarshalTestCase;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.EAIMessageException;
import com.integrosys.cms.host.eai.limit.AAMessageBody;
import com.integrosys.cms.host.eai.limit.bus.CorporateApplicationXmlUnmarshalTest;
import com.integrosys.cms.host.stp.bus.IStpTransJdbc;
import com.integrosys.cms.host.stp.common.IStpConstants;
import com.integrosys.component.commondata.app.CommonDataSingletonTestPlugin;

/**
 * <p>
 * Test case for the <tt>CorporateFacilityValidator</tt>, based on the xml
 * message <tt>CA001-corporate.xml</tt>, found in the same package with
 * <tt>CorporateApplicationXmlUnmarshalTest</tt>
 * <p>
 * This test case, for database, by default is using driver class
 * <tt>org.hsqldb.jdbcDriver</tt>, for insert/retrieve common codes
 * @author Chong Jun Yong
 * 
 */
public class CorporateFacilityValidatorTest extends CustomCastorMarshalUnmarshalTestCase {
	private CorporateFacilityValidator theValidator;

	protected void onSetUp() throws Exception {

		theValidator = new CorporateFacilityValidator();
		theValidator.setFacilityNotRequiredAppTypeList(Arrays.asList(new String[] { "CC" }));

		IStpTransJdbc jdbc = (IStpTransJdbc) Proxy.newProxyInstance(Thread.currentThread().getContextClassLoader(),
				new Class[] { IStpTransJdbc.class }, new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("getStpIslamicLoanType")) {
							return IStpConstants.STP_ISLAMIC_LOAN_TYPE_CORPORATE;
						}
						return null;
					}
				});

		theValidator.setStpJdbcDao(jdbc);
		theValidator.setCorporateApplicationTypes(new String[] { "CO" });

		CommonDataSingletonTestPlugin commonCode = new CommonDataSingletonTestPlugin();
		commonCode.addCategoryCode("MESSAGE_TYPE", "Message Type");
		commonCode.addCategoryCode("MESSAGE_SEVERITY", "Message Severity");
		commonCode.addCategoryCode("PRIME_REVIEW_TERM_CODE", "Prime Review Term Code");
		commonCode.addCategoryCode("FAC_RATE", "Facility Interest Rate");
		commonCode.addCategoryCode("LOAN_PURPOSE", "Loan Purpose");
		commonCode.addCategoryCode("APPROVED_BY", "Approved By");
		commonCode.addCategoryCode("FACILITY_STATUS", "Facility Status");
		commonCode.addCategoryCode("REQUEST_REASON", "Request Reason");
		commonCode.addCategoryCode("LMT_STATUS", "Limit Status");
		commonCode.addCategoryCode("SOLICITOR", "Solicitor");
		commonCode.addEntryCode("5SF", "5SF", "MESSAGE_TYPE");
		commonCode.addEntryCode("CCN", "CCN", "MESSAGE_TYPE");
		commonCode.addEntryCode("1", "Low", "MESSAGE_SEVERITY");
		commonCode.addEntryCode("2", "High", "MESSAGE_SEVERITY");
		commonCode.addEntryCode("M", "Month", "PRIME_REVIEW_TERM_CODE");
		commonCode.addEntryCode("73510", "Base Lending Rate", "FAC_RATE");
		commonCode.addEntryCode("SHOP", "SHOP", "LOAN_PURPOSE");
		commonCode.addEntryCode("CXC", "CXC", "APPROVED_BY");
		commonCode.addEntryCode("A", "Approved", "FACILITY_STATUS");
		commonCode.addEntryCode("BAD", "Bad", "REQUEST_REASON");
		commonCode.addEntryCode("P", "Pending", "LMT_STATUS");
		commonCode.addEntryCode("0012", "SOMEONE CRAZY", "SOLICITOR");
	}

	public void testPassAllValidation() {
		addMapping("aa.cm.xml");
		addMapping("aa-facility-islamic.cm.xml");
		addMapping("common.cm.xml");

		EAIMessage msg = (EAIMessage) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				EAIMessage msg = (EAIMessage) unmarshaller.unmarshal(new InputSource(
						CorporateApplicationXmlUnmarshalTest.class.getResourceAsStream("CA001-corporate.xml")));

				return msg;
			}
		});

		try {
			theValidator.validate(msg);
		}
		catch (EAIMessageException ex) {
			fail("shouldn't throw any exception " + ex);
		}
	}

	public void testSomeFailValidation() {
		addMapping("aa.cm.xml");
		addMapping("aa-facility-islamic.cm.xml");
		addMapping("common.cm.xml");

		EAIMessage msg = (EAIMessage) execute(new UnmarshallerAction() {

			public Object doInUnmarshaller(Unmarshaller unmarshaller) throws MarshalException, ValidationException,
					IOException {
				EAIMessage msg = (EAIMessage) unmarshaller.unmarshal(new InputSource(
						CorporateApplicationXmlUnmarshalTest.class.getResourceAsStream("CA001-corporate.xml")));

				return msg;
			}
		});

		IStpTransJdbc jdbc = (IStpTransJdbc) Proxy.newProxyInstance(Thread.currentThread().getContextClassLoader(),
				new Class[] { IStpTransJdbc.class }, new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("getStpIslamicLoanType")) {
							return IStpConstants.STP_ISLAMIC_LOAN_TYPE_MASTER;
						}
						return null;
					}
				});
		theValidator.setStpJdbcDao(jdbc);

		try {
			theValidator.validate(msg);
			fail("should have throw 'InvalidIslamicCorporateFacilitiesException'");
		}
		catch (EAIMessageException ex) {
			// pass
			assertEquals("INV_ISL_CORP_LOAN", ex.getErrorCode());
		}

		AAMessageBody msgBody = (AAMessageBody) msg.getMsgBody();
		msgBody.getLimitProfile().setAAType("MO");

		try {
			theValidator.validate(msg);
			fail("should have throw 'InvalidCorporateFacilitiesException'");
		}
		catch (EAIMessageException ex) {
			// pass
			assertEquals("INV_CORP_LOAN", ex.getErrorCode());
		}
	}
}

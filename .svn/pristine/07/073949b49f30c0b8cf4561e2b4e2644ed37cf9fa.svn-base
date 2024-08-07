package com.integrosys.cms.host.eai.security.inquiry;

import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.URL;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.CharUtils;
import org.exolab.castor.mapping.Mapping;
import org.exolab.castor.xml.Marshaller;

import com.integrosys.base.techinfra.exception.ExceptionUtil;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.base.techinfra.util.AccessorUtil;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;
import com.integrosys.cms.host.eai.security.SecurityMessageBody;
import com.integrosys.cms.host.eai.security.bus.ApprovedSecurity;
import com.integrosys.cms.host.eai.security.bus.property.PropertySecurity;

public class SecurityInputAndInquiryTest extends CustomHibernateTestCase {

	public void testInputAndInquiryPropertySecurity() throws Throwable {
		URL messageUrl = PropertySecurity.class.getResource("Property-Skeleton.xml");
		URL mappingUrl = Thread.currentThread().getContextClassLoader().getResource("EaiMapping-collateral_Master.xml");

		EAIMessage eaiMessage = (EAIMessage) EAICastorHelper.getInstance().unmarshal(mappingUrl, messageUrl,
				EAIMessage.class);
		SecurityMessageBody msgBody = (SecurityMessageBody) eaiMessage.getMsgBody();
		ApprovedSecurity sec = msgBody.getSecurityDetail();

		Long id = (Long) getHibernateTemplate().save(sec);
		sec.setCMSSecurityId(id.longValue());

		PropertySecurity property = msgBody.getPropertyDetail();
		property.setCMSSecurityId(id.longValue());

		getHibernateTemplate().save(property);

		sec = (ApprovedSecurity) getHibernateTemplate().get(ApprovedSecurity.class, id);

		msgBody.setSecurityDetail(sec);

		property = (PropertySecurity) getHibernateTemplate().get(PropertySecurity.class, id);

		msgBody.setPropertyDetail(property);

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ObjectOutputStream oos = new ObjectOutputStream(baos);
		oos.writeObject(eaiMessage);
		System.out.println("object byte array stream : " + ArrayUtils.toString(baos.toByteArray()));

		mappingUrl = Thread.currentThread().getContextClassLoader().getResource(
				"EaiMapping-collateral-response_Master.xml");

		System.out.println(AccessorUtil.printMethodValue(eaiMessage));

		StringWriter outputWriter = new StringWriter();

		Marshaller marshaller = new Marshaller(outputWriter);
		Mapping mapping = new Mapping();
		mapping.loadMapping(mappingUrl);

		StringWriter logWriter = new StringWriter();

		marshaller.setMapping(mapping);
		// marshaller.setEncoding("UTF-8");
		marshaller.setLogWriter(new PrintWriter(logWriter));

		try {
			marshaller.marshal(eaiMessage);
		}
		catch (Throwable t) {
			t.printStackTrace();
			Throwable rootcause = ExceptionUtil.getRootCause((Exception) t);
			String message = rootcause.getMessage();
			for (int i = 0; i < message.length(); i++) {
				System.out.println(i + " : " + message.charAt(i) + " : printable ? "
						+ CharUtils.isAsciiPrintable(message.charAt(i)) + " : unicode escape "
						+ CharUtils.unicodeEscaped(message.charAt(i)) + " : int value " + (int) message.charAt(i));
			}
		}
		finally {
			System.out.println("if there is any log : " + logWriter.toString());
			System.out.println("if there is any output : " + outputWriter.toString());
		}

	}

	protected String[] getMappingResources() {
		return new String[] { "EAI-Collateral.hbm.xml", "EAI-Collateral-Property.hbm.xml" };
	}
}

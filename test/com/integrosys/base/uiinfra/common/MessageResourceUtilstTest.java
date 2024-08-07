package com.integrosys.base.uiinfra.common;

import java.io.FileNotFoundException;

import javax.servlet.jsp.PageContext;

import org.apache.struts.mock.MockPageContext;
import org.apache.struts.mock.MockServletConfig;
import org.apache.struts.mock.MockHttpServletRequest;
import org.apache.struts.mock.MockHttpServletResponse;
import org.apache.struts.util.MessageResources;
import org.apache.struts.util.MessageResourcesFactory;
import org.apache.struts.util.PropertyMessageResourcesFactory;
import org.springframework.util.Log4jConfigurer;

import com.integrosys.base.uiinfra.common.MessageResourceUtils;

import junit.framework.TestCase;

public class MessageResourceUtilstTest extends TestCase {

	private MessageResourcesFactory messageResourceFactory;
	private MessageResources messageResources;
	
	private MockPageContext mockPageContext;

	public void setUp() {
		try {
			Log4jConfigurer.initLogging("classpath:logging.xml");
		}
		catch (FileNotFoundException fnfe) {
			fail("not able to load logging.xml, please check whether this file is in classpath");
		}

		messageResourceFactory = new PropertyMessageResourcesFactory();
		messageResources = messageResourceFactory.createResources("ApplicationResources");
		
		mockPageContext = new MockPageContext(new MockServletConfig(),
				new MockHttpServletRequest(),
				new MockHttpServletResponse());		
	}

	public void testMessageResource() {
		assertFalse("'messageResources' should not be null",
			(messageResources == null));
		assertNotNull(messageResources.getMessage("error.mandatory"));
		assertNotNull(messageResources.getMessage("label.system.title"));
		assertTrue("'label.system.title' should have to be 'Collateral Management System'",
			"Collateral Management System".equals(messageResources.getMessage("label.system.title")));
	}
	

	public void testGetMessage() {
		MessageResourceUtils msgResourcesUtil = MessageResourceUtils.getInstance();

		mockPageContext.setAttribute("message-main",
			messageResources, PageContext.REQUEST_SCOPE);
		
		try {
			String message = msgResourcesUtil.getMessage(null, "label.system.title", null, 
					mockPageContext, null);
	
			assertNotNull(message);
			
			assertTrue("'label.system.title' should have to be 'Collateral Management System'",
					"Collateral Management System".equals(message));
		
		} catch (Exception e) {
			// do nothing
		}
	}	
	
	public void testPresent() {
		MessageResourceUtils msgResourcesUtil = MessageResourceUtils.getInstance();
		
		mockPageContext.setAttribute("message-main",
				messageResources, PageContext.REQUEST_SCOPE);
		try {
			boolean isPresent = msgResourcesUtil.present(mockPageContext, null, null, "label.system.title");
			assertTrue("'label.system.title' should be present", 
					true == isPresent);
		} catch (Exception e) {
			// do nothing
		}
	}
}
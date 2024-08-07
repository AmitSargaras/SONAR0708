package com.integrosys.cms.host.eai.web;

import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.RequestProcessor;
import org.easymock.MockControl;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;

import com.integrosys.base.techinfra.test.CustomStrutsWebTestCase;
import com.integrosys.cms.host.eai.EAIHeader;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.response.Response;
import com.integrosys.cms.host.eai.response.ResponseMessageBody;
import com.integrosys.cms.host.eai.support.IMessageFolder;
import com.integrosys.cms.host.eai.support.MessageHandlerSubject;

/**
 * @author Chong Jun Yong
 * 
 */
public class EaiMessageActionTest extends CustomStrutsWebTestCase {

	public String getStrutsConfigPath() {
		return "/WEB-INF/struts/struts-config-eai.xml";
	}

	public void testExecuteEaiAction() throws Exception {
		MockHttpServletRequest request = new MockHttpServletRequest();
		MockHttpServletResponse response = new MockHttpServletResponse();

		request.setAttribute("msg", "<Msg><MsgBody>Hello World</MsgBody></Msg>");
		request.setPathInfo("/EaiMessage");

		final EaiMessageAction action = new EaiMessageAction();
		action.setServlet(getActionServlet());

		MockControl messageFolderControl = MockControl.createControl(IMessageFolder.class);
		IMessageFolder mockMessageFolder = (IMessageFolder) messageFolderControl.getMock();
		mockMessageFolder.putMessage("<Msg><MsgBody>Hello World</MsgBody></Msg>");
		messageFolderControl.setReturnValue("123");
		messageFolderControl.replay();

		MessageHandlerSubject subject = (MessageHandlerSubject) Proxy.newProxyInstance(MessageHandlerSubject.class
				.getClassLoader(), new Class[] { MessageHandlerSubject.class }, new InvocationHandler() {

			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				if (method.getName().equals("registerAndProcess")) {
					String msgId = (String) args[0];
					assertEquals("123", msgId);
					assertTrue(args[1] instanceof Action);

					EAIMessage responseMessage = new EAIMessage();
					EAIHeader msgHeader = new EAIHeader();
					msgHeader.setMessageId("12345");
					msgHeader.setMessageRefNum("54321");
					msgHeader.setMessageType("ACKNOWLEDGMENT");
					msgHeader.setPublishDate("20081111");
					msgHeader.setPublishType("NORMAL");
					msgHeader.setSource("CMS");

					responseMessage.setMsgHeader(msgHeader);

					Response msgResponse = new Response();
					msgResponse.setResponseCode("TECH0001");
					msgResponse.setResponseMessage("failed to retrieve limit [123]");

					ResponseMessageBody msgBody = new ResponseMessageBody();
					msgBody.setResponse(msgResponse);

					responseMessage.setMsgBody(msgBody);

					action.update(responseMessage);

					return null;
				}
				return null;
			}
		});

		action.setMessageFolder(mockMessageFolder);
		action.setMessageHandlerSubject(subject);

		class MockRequestProcessor extends RequestProcessor {
			protected Action processActionCreate(HttpServletRequest request, HttpServletResponse response,
					ActionMapping mapping) throws IOException {
				return action;
			}
		}

		MockRequestProcessor requestProcessor = new MockRequestProcessor();
		requestProcessor.init(getActionServlet(), getModuleConfigImpl());

		getServletContext().setAttribute("org.apache.struts.action.REQUEST_PROCESSOR", requestProcessor);
		getActionServlet().doGet(request, response);

		String responseString = response.getContentAsString();
		System.out.println("responseString after marshall of message object [" + responseString + "]");
		assertTrue(responseString.indexOf("CMS") >= 0);
		assertTrue(responseString.indexOf("TECH0001") >= 0);
		assertTrue(responseString.indexOf("failed to retrieve limit [123]") >= 0);
		assertTrue(responseString.indexOf("20081111") >= 0);

		messageFolderControl.verify();
	}
}

package com.integrosys.cms.host.eai.service;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import junit.framework.TestCase;
import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import org.easymock.MockControl;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.host.eai.EAIBody;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.Message;
import com.integrosys.cms.host.eai.support.IMessageFolder;
import com.integrosys.cms.host.eai.support.MessageHandlerObserver;
import com.integrosys.cms.host.eai.support.MessageHolder;

public class MessageQueueFiringTaskTest extends TestCase {
	private MessageQueueFiringTask task;

	private MockControl eaiMsgMgrControl;

	private IMessageFolder mockMessageFolder;

	private List processedMessageList = new ArrayList();

	private List messageHolderCountList = new ArrayList();

	private List messageHolderList = new LinkedList();

	public void setUp() {
		Log4jConfigTestPlugin.configure();

		Enhancer enhancer = new Enhancer();
		enhancer.setSuperclass(MessageHandler.class);
		enhancer.setCallback(new MessageHandlerInterceptor());

		eaiMsgMgrControl = MockControl.createControl(IEaiMessageManager.class);
		IEaiMessageManager mockEaiMessageManager = (IEaiMessageManager) eaiMsgMgrControl.getMock();
		mockEaiMessageManager.logMessage(null, null, null);
		eaiMsgMgrControl.setDefaultVoidCallable();
		eaiMsgMgrControl.replay();

		mockMessageFolder = (IMessageFolder) Proxy.newProxyInstance(IMessageFolder.class.getClassLoader(),
				new Class[] { IMessageFolder.class }, new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("putMessage")) {
							final String msgId = String.valueOf(messageHolderCountList.size() + 1);
							MessageHolder holder = new MessageHolder(args[0], msgId, String.valueOf(args[0].hashCode()));
							messageHolderList.add(holder);
							messageHolderCountList.add(new Object() {
								public String toString() {
									return "counter for msgId " + msgId;
								}
							});
							return msgId;
						}

						if (method.getName().equals("popMessage")) {
							if (!messageHolderList.isEmpty()) {
								Object holder = messageHolderList.remove(0);
								return holder;
							}
						}

						return null;
					}
				});

		task = new MessageQueueFiringTask();
		task.setMessageHandler((MessageHandler) enhancer.create());
		task.setEaiMessageManager(mockEaiMessageManager);
		task.setSleepSecondsAfterEachRun(1);
		task.setMessageFolder(mockMessageFolder);
	}

	public void tearDown() {
		eaiMsgMgrControl.verify();
	}

	public void testManyObserversFiringInSequence() {
		Thread taskThread = new Thread() {
			public void run() {
				while (processedMessageList.size() != 20) {
					System.out.println("processedMessageList.size() " + processedMessageList.size());
					task.run();
					try {
						sleep(1000);
					}
					catch (InterruptedException e) {
						// ignored
					}
				}
			}
		};
		taskThread.start();

		for (int i = 1; i <= 20; i++) {
			System.out.println("looping : processedMessageList.size() " + processedMessageList.size());
			Thread observerThread = new Thread("ObserverThread for #" + i) {
				public void run() {
					MessageHandlerObserver observer = (MessageHandlerObserver) Proxy.newProxyInstance(
							MessageHandlerObserver.class.getClassLoader(),
							new Class[] { MessageHandlerObserver.class }, new InvocationHandler() {

								public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
									if (method.getName().equals("update")) {
										Object updateObject = args[0];
										assertTrue(updateObject instanceof Message);
										MockIncomingMessageBody incomingMessage = (MockIncomingMessageBody) ((Message) updateObject)
												.getMsgBody();
										try {
											assertEquals("<Msg><MessageRefNum>" + getName() + "</MessageRefNum></Msg>",
													incomingMessage.getIncomingMsg());
										}
										catch (Throwable ex) {
											ex.printStackTrace();
										}
									}

									if (method.getName().equals("toString")) {
										return "Observer for thread :" + getName();
									}
									return null;
								}

							});
					String msgId = mockMessageFolder.putMessage("<Msg><MessageRefNum>" + getName()
							+ "</MessageRefNum></Msg>");
					task.register(msgId, observer);
				}
			};
			observerThread.start();
			try {
				Thread.sleep(1000);
			}
			catch (InterruptedException e) {
				// ignored
			}
		}

		while (processedMessageList.size() != 20)
			;
		taskThread.stop();
	}

	private class MessageHandlerInterceptor implements MethodInterceptor {

		public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy) throws Throwable {
			if (method.getName().equals("process")) {
				MockIncomingMessageBody body = new MockIncomingMessageBody((String) args[0]);
				EAIMessage message = new EAIMessage();
				message.setMsgBody(body);
				processedMessageList.add(message);
				return message;
			}
			return null;
		}
	}

	private class MockIncomingMessageBody extends EAIBody {
		private static final long serialVersionUID = -6636082318380531087L;

		private String incomingMsg;

		public MockIncomingMessageBody(String msg) {
			this.incomingMsg = msg;
		}

		public String getIncomingMsg() {
			return this.incomingMsg;
		}
	}
}

package com.integrosys.cms.host.stp.proxy.interceptor;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

import org.easymock.MockControl;
import org.springframework.aop.framework.ProxyFactoryBean;
import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.context.support.GenericApplicationContext;

import com.integrosys.base.businfra.transaction.ITrxOperation;
import com.integrosys.base.businfra.transaction.ITrxResult;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxLogException;
import com.integrosys.base.businfra.transaction.TrxNotificationException;
import com.integrosys.base.businfra.transaction.TrxOperationException;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.ICMSTrxValue;
import com.integrosys.cms.app.transaction.ITrxContext;
import com.integrosys.cms.app.transaction.OBCMSTrxResult;
import com.integrosys.cms.app.transaction.OBCMSTrxValue;
import com.integrosys.cms.app.transaction.OBTrxContext;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;
import com.integrosys.cms.host.stp.proxy.IStpAsyncProxy;

/**
 * @author Chong Jun Yong
 * 
 */
public class StpAspectTrxOperationMethodInterceptorTest extends TransactionEngineTestCase {
	public void testPostProcessTrxOperationInvokeStpUsingProxyFactoryBean() throws Exception {
		ITrxOperation mockTrxOperation = new ITrxOperation() {

			public String getOperationName() {
				return "MOCK_APPROVE";
			}

			public ITrxResult logProcess(ITrxResult result) throws TrxLogException {
				return result;
			}

			public ITrxResult notifyProcess(ITrxResult result) throws TrxNotificationException {
				return result;
			}

			public ITrxResult performProcess(ITrxValue value) throws TrxOperationException {
				OBCMSTrxResult result = new OBCMSTrxResult();
				result.setTrxValue(value);
				return result;
			}

			public ITrxResult postProcess(ITrxResult result) throws TrxOperationException {
				return result;
			}

			public ITrxValue preProcess(ITrxValue value) throws TrxOperationException {
				return value;
			}
		};

		addTrStateMatrix("PENDING_UPDATE", "LOADING", "MOCK_APPROVE", "MOCK_TYPE");

		ICMSTrxValue trxValue = new OBCMSTrxValue();
		trxValue.setTransactionID("1234");
		trxValue.setReferenceID("5678");
		trxValue.setTransactionType("MOCK_TYPE");
		trxValue.setStatus("PENDING_UPDATE");
		trxValue.setInstanceName("MOCK_TYPE");

		ITrxContext context = new OBTrxContext();
		context.setStpAllowed(true);
		trxValue.setTrxContext(context);

		List callableStringList = new ArrayList();

		// create mock for IStpAsyncProxy
		MockControl stpAsyncProxyControl = MockControl.createControl(IStpAsyncProxy.class);
		IStpAsyncProxy mockStpAsync = (IStpAsyncProxy) stpAsyncProxyControl.getMock();
		mockStpAsync.submitTask("1234", 5678, "MOCK_TYPE");
		stpAsyncProxyControl.setVoidCallable(1);
		stpAsyncProxyControl.replay();

		// invocation handler for proxy crated for mock IStpAsyncProxy, mainly
		// to create record into callableStringList, to be verified later.
		IStpAsyncProxy stpProxy = (IStpAsyncProxy) Proxy
				.newProxyInstance(IStpAsyncProxy.class.getClassLoader(), new Class[] { IStpAsyncProxy.class },
						new SubmitTaskInvocationHandler(mockStpAsync, callableStringList));

		// create new bean for method interceptor, setting property of stpProxy
		// to be proxy created earlier.
		BeanDefinitionBuilder builder = BeanDefinitionBuilder.rootBeanDefinition(TrxOperationMethodInterceptor.class)
				.addPropertyValue("stpProxy", stpProxy);

		GenericApplicationContext applicationContext = new GenericApplicationContext();
		applicationContext.registerBeanDefinition("stpAspectInterceptor", builder.getBeanDefinition());

		ProxyFactoryBean proxyFactoryBean = new ProxyFactoryBean();
		proxyFactoryBean.setTarget(mockTrxOperation);
		proxyFactoryBean.setBeanFactory(applicationContext);
		proxyFactoryBean.setInterceptorNames(new String[] { "stpAspectInterceptor" });
		logger.info(proxyFactoryBean.toProxyConfigString());

		ICMSTrxResult result = operateUsingDefaultTrxProcess((ITrxOperation) proxyFactoryBean.getObject(), trxValue);

		trxValue = (ICMSTrxValue) result.getTrxValue();
		assertEquals("LOADING", trxValue.getToState());

		Thread.sleep(1000);

		stpAsyncProxyControl.verify();

		assertFalse(callableStringList.isEmpty());
		String callableString = (String) callableStringList.get(0);
		assertTrue(callableString.indexOf("1234") > 0);
		assertTrue(callableString.indexOf("5678") > 0);
		assertTrue(callableString.indexOf("MOCK_TYPE") > 0);
	}

	private class SubmitTaskInvocationHandler implements InvocationHandler {

		IStpAsyncProxy target;

		List callableStringList;

		public SubmitTaskInvocationHandler(IStpAsyncProxy target, List callableStringList) {
			this.target = target;
			this.callableStringList = callableStringList;
		}

		public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
			logger.debug("Thread [" + Thread.currentThread().getName() + "] invoking method [" + method + "]");
			if (method.getName().equals("submitTask")) {
				callableStringList.add("submit task successfully, trx id [" + args[0] + "] ref id [" + args[1]
						+ "] trx type [" + args[2] + "]");
				method.invoke(target, args);
				return null;
			}

			return method.invoke(target, args);
		}

	}
}

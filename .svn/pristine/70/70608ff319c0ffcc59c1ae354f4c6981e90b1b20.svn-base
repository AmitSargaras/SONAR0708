package com.integrosys.cms.batch.sibs.parameter;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import junit.framework.TestCase;

import org.easymock.MockControl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.commoncode.bus.ICommonCodeDao;
import com.integrosys.cms.batch.sibs.parameter.obj.OBCommonCodeEntryWrapper;

/**
 * Created by IntelliJ IDEA. User: Cynthia Date: Oct 8, 2008 Time: 2:43:02 PM To
 * change this template use File | Settings | File Templates.
 */
public class ParameterBusManagerTest extends TestCase {

	protected Logger logger = LoggerFactory.getLogger(getClass());

	MockControl parameterDaoControl;

	IParameterDao parameterDao;

	public void setUp() {

		parameterDaoControl = MockControl.createControl(IParameterDao.class);
		parameterDao = (IParameterDao) parameterDaoControl.getMock();

		OBCommonCodeEntryWrapper vipCodeNew = new OBCommonCodeEntryWrapper();
		vipCodeNew.setEntryCode("IB");
		vipCodeNew.setEntryName("Investment Banking");

		OBCommonCodeEntryWrapper vipCodeUpdate = new OBCommonCodeEntryWrapper();
		vipCodeUpdate.setEntryCode("PR");
		vipCodeUpdate.setEntryName("Prestigious Banking");

		OBCommonCodeEntryWrapper vipCodeDelete = new OBCommonCodeEntryWrapper(); // remove
		// NA
		vipCodeDelete.setEntryCode("NA");
		vipCodeDelete.setEntryName("Not Applicable");

		ArrayList vipParameterEntryList = new ArrayList();
		vipParameterEntryList.add(vipCodeNew);
		vipParameterEntryList.add(vipCodeUpdate);

		parameterDao.getParameterEntryByEntityName("paramVip");
		parameterDaoControl.setReturnValue(vipParameterEntryList);

		Log4jConfigTestPlugin.configure();
	}

	public void testUpdateVipCommonCode() {

		List callableStringList = new ArrayList();
		List resultList = new ArrayList();
		ICommonCodeDao commonCodeDaoProxy = (ICommonCodeDao) Proxy.newProxyInstance(ICommonCodeDao.class
				.getClassLoader(), new Class[] { ICommonCodeDao.class }, new CommonCodeInvocationHandler(
				callableStringList, resultList));

		ParameterBusManagerImpl paramBusMgr = new ParameterBusManagerImpl();

		// paramBusMgr.setParameterSibsDao(parameterDao);
		paramBusMgr.setParameterDao(parameterDao);
		paramBusMgr.setCommonCodeDao(commonCodeDaoProxy);
		paramBusMgr.setBatchParameterFeedSize(3);
		parameterDaoControl.replay();

		paramBusMgr.updateParameter(new String[] { "paramVip" });

		parameterDaoControl.verify();
		assertFalse(callableStringList.isEmpty());
		for (int i = 0; i < callableStringList.size(); i++) {
			logger.debug("Callable String: " + callableStringList.get(i));
		}

		for (int i = 0; i < resultList.size(); i++) {
			logger.debug("Result List: " + resultList.get(i).toString());
			OBCommonCodeEntryWrapper wrapper = (OBCommonCodeEntryWrapper) resultList.get(i);
			logger.debug("getEntryCode = " + wrapper.getEntryCode());
			logger.debug("getEntryName = " + wrapper.getEntryName());
			logger.debug("getCategoryCode = " + wrapper.getCategoryCode());
			logger.debug("getCategoryCodeId = " + wrapper.getCategoryCodeId());
			logger.debug("getActiveStatus = " + wrapper.getActiveStatus());
		}

		// 3 from updating actual, 3 from updating staging (common code)
		assertTrue("Number of records updated (both actual and staging) expected 6, but [" + resultList.size() + "]",
				resultList.size() == 6);

		// String callableString = (String) callableStringList.get(0);
		// assertTrue(callableString.indexOf("1234") > 0);
		// assertTrue(callableString.indexOf("5678") > 0);
		// assertTrue(callableString.indexOf("MOCK_TYPE") > 0);

	}

	private void verifyResults(List callableStringList, List resultList) {

		String methodCalled1 = (String) callableStringList.get(0);
		String methodCalled2 = (String) callableStringList.get(0);
		String methodCalled3 = (String) callableStringList.get(0);
		String methodCalled4 = (String) callableStringList.get(0);

		assertTrue(methodCalled1.indexOf("getCommonCodeEntryByCategorySource") > 0);
		assertTrue(methodCalled2.indexOf("getCategoryCodeId") > 0);
		assertTrue((methodCalled3.indexOf("update") > 0) && (methodCalled3.indexOf("stage") > 0)); // staging
		assertTrue(methodCalled4.indexOf("update") > 0 && methodCalled4.indexOf("actual") > 0); // actual

		OBCommonCodeEntryWrapper updatedCode1 = (OBCommonCodeEntryWrapper) resultList.get(0);
		OBCommonCodeEntryWrapper updatedCode2 = (OBCommonCodeEntryWrapper) resultList.get(0);
		OBCommonCodeEntryWrapper updatedCode3 = (OBCommonCodeEntryWrapper) resultList.get(0);
		OBCommonCodeEntryWrapper updatedCode4 = (OBCommonCodeEntryWrapper) resultList.get(0);
		OBCommonCodeEntryWrapper updatedCode5 = (OBCommonCodeEntryWrapper) resultList.get(0);
		OBCommonCodeEntryWrapper updatedCode6 = (OBCommonCodeEntryWrapper) resultList.get(0);

		assertTrue(updatedCode1.getEntryCode().equals("IB"));
		assertTrue(updatedCode1.getEntryName().equals("Investment Banking"));
		assertTrue(updatedCode1.getCategoryCode().equals("VIP"));
		assertTrue(updatedCode1.getCategoryCodeId() == 320);
		assertTrue(updatedCode1.getActiveStatus() == true);

		assertTrue(updatedCode2.getEntryCode().equals("PR"));
		assertTrue(updatedCode2.getEntryName().equals("Prestigious Bankin"));
		assertTrue(updatedCode2.getCategoryCode().equals("VIP"));
		assertTrue(updatedCode2.getCategoryCodeId() == 320);
		assertTrue(updatedCode2.getActiveStatus() == true);

		assertTrue(updatedCode3.getEntryCode().equals("NA"));
		assertTrue(updatedCode3.getEntryName().equals("Not Applicable"));
		assertTrue(updatedCode3.getCategoryCode().equals("VIP"));
		assertTrue(updatedCode3.getCategoryCodeId() == 320);
		assertTrue(updatedCode3.getActiveStatus() == false);

		assertTrue(updatedCode4.getEntryCode().equals("IB"));
		assertTrue(updatedCode4.getEntryName().equals("Investment Banking"));
		assertTrue(updatedCode4.getCategoryCode().equals("VIP"));
		assertTrue(updatedCode4.getCategoryCodeId() == 320);
		assertTrue(updatedCode4.getActiveStatus() == true);

		assertTrue(updatedCode5.getEntryCode().equals("PR"));
		assertTrue(updatedCode5.getEntryName().equals("Prestigious Bankin"));
		assertTrue(updatedCode5.getCategoryCode().equals("VIP"));
		assertTrue(updatedCode5.getCategoryCodeId() == 320);
		assertTrue(updatedCode5.getActiveStatus() == true);

		assertTrue(updatedCode6.getEntryCode().equals("NA"));
		assertTrue(updatedCode6.getEntryName().equals("Not Applicable"));
		assertTrue(updatedCode6.getCategoryCode().equals("VIP"));
		assertTrue(updatedCode6.getCategoryCodeId() == 320);
		assertTrue(updatedCode6.getActiveStatus() == false);

	}

	private class CommonCodeInvocationHandler implements InvocationHandler {

		List callableStringList;

		List resultList;

		public CommonCodeInvocationHandler(List callableStringList, List resultList) {
			this.callableStringList = callableStringList;
			this.resultList = resultList;
		}

		public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
			logger.debug("Thread [" + Thread.currentThread().getName() + "] invoking method [" + method + "]");
			if (method.getName().equals("getCategoryCodeId")) {
				callableStringList.add("getCategoryCodeId successfully, entityName [" + args[0] + "] categoryCode ["
						+ args[1] + "] ");

				return new Long(320);

			}
			else if (method.getName().equals("getCommonCodeEntryByCategorySource")) {
				callableStringList.add("getCommonCodeEntryByCategorySource successfully, entityName [" + args[0]
						+ "] categoryCode [" + args[1] + "] source [" + args[2] + "]");

				OBCommonCodeEntryWrapper vipEntry1 = new OBCommonCodeEntryWrapper();
				vipEntry1.setEntryCode("PR");
				vipEntry1.setEntryName("Prestige Banking");

				OBCommonCodeEntryWrapper vipEntry2 = new OBCommonCodeEntryWrapper();
				vipEntry2.setEntryCode("NA");
				vipEntry2.setEntryName("Not Applicable");

				ArrayList vipEntryList = new ArrayList();
				vipEntryList.add(vipEntry1);
				vipEntryList.add(vipEntry2);

				return vipEntryList;

			}
			else if (method.getName().equals("update")) {
				callableStringList.add("update successfully, entityName [" + args[0] + "] ");
				resultList.addAll((Collection) args[1]);
				return args[1];
			}
			else if (method.getName().equals("updateStaging")) {
				callableStringList.add("update successfully, entityName [" + args[0] + "] ");

				return args[1];
			}

			return null;
		}

	}

}

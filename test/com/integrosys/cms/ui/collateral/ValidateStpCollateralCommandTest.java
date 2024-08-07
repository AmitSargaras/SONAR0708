package com.integrosys.cms.ui.collateral;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.HashMap;
import java.util.Map;

import junit.framework.TestCase;

import org.apache.struts.action.ActionMessage;

import com.integrosys.base.techinfra.propertyfile.PropertyManager;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.cms.app.collateral.bus.ICollateral;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.cms.app.collateral.bus.OBCollateralSubType;
import com.integrosys.cms.app.collateral.trx.ICollateralTrxValue;
import com.integrosys.cms.app.collateral.trx.OBCollateralTrxValue;
import com.integrosys.cms.app.limit.bus.ICollateralAllocation;
import com.integrosys.cms.app.limit.bus.ILimit;
import com.integrosys.cms.app.limit.bus.ILimitProfile;
import com.integrosys.cms.app.limit.bus.OBCollateralAllocation;
import com.integrosys.cms.app.limit.bus.OBLimit;
import com.integrosys.cms.app.limit.bus.OBLimitProfile;
import com.integrosys.cms.app.limit.proxy.ILimitProxy;
import com.integrosys.cms.app.transaction.ITrxContext;
import com.integrosys.cms.app.transaction.OBTrxContext;
import com.integrosys.cms.ui.common.constant.IGlobalConstant;
import com.integrosys.component.commondata.app.CommonDataSingletonTestPlugin;

/**
 * @author Chong Jun Yong
 * 
 */
public class ValidateStpCollateralCommandTest extends TestCase {

	public void setUp() {
		CommonDataSingletonTestPlugin commonCodes = new CommonDataSingletonTestPlugin();
		commonCodes.addCategoryCode("54", "Collateral Sub Type");
		commonCodes.addEntryCode("AB102", "Vehicle", "54");
		PropertyManager.setProperty("has.access.stp.system", "true");
	}

	public void testMustFireVehicleCollateralFirst() {
		ValidateStpCollateralCommand cmd = new ValidateStpCollateralCommand("HP", "AB102");
		HashMap context = new HashMap();

		ICollateral collateral = new OBCollateral();
		collateral.setCollateralID(12345);
		collateral.setSCISecurityID(null);
		collateral.setCollateralSubType(new OBCollateralSubType("AB102"));

		ICollateralAllocation limitSecMap = new OBCollateralAllocation();
		limitSecMap.setCollateral(collateral);

		ILimit limit = new OBLimit();
		limit.setCollateralAllocations(new ICollateralAllocation[] { limitSecMap });

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setApplicationType("HP");
		limitProfile.setLimits(new ILimit[] { limit });

		context.put(IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ, limitProfile);

		ICollateral approvingCollateral = new OBCollateral();
		approvingCollateral.setCollateralSubType(new OBCollateralSubType("GT409"));

		ICollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(approvingCollateral);

		context.put("serviceColObj", trxValue);

		Map returnMap = cmd.doExecute(context);
		Map exceptionMap = (Map) returnMap.get(ICommonEventConstant.COMMAND_EXCEPTION_MAP);
		assertFalse(exceptionMap.isEmpty());
		ActionMessage msg = (ActionMessage) exceptionMap.get("pendingPerfectError");
		assertEquals("error.collateral.application.type.first.collateral", msg.getKey());
		assertEquals("HP", msg.getValues()[0]);
		assertEquals("Vehicle", msg.getValues()[1]);
		assertEquals("12345", msg.getValues()[2]);
	}

	public void testNotNeedFireVehicleCollateralFirst() {
		ValidateStpCollateralCommand cmd = new ValidateStpCollateralCommand("MO", "AB102");
		HashMap context = new HashMap();

		ICollateral collateral = new OBCollateral();
		collateral.setSCISecurityID(null);
		collateral.setCollateralSubType(new OBCollateralSubType("AB102"));

		ICollateralAllocation limitSecMap = new OBCollateralAllocation();
		limitSecMap.setCollateral(collateral);

		ILimit limit = new OBLimit();
		limit.setCollateralAllocations(new ICollateralAllocation[] { limitSecMap });

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setApplicationType("HP");
		limitProfile.setLimits(new ILimit[] { limit });

		context.put(IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ, limitProfile);

		ICollateral approvingCollateral = new OBCollateral();
		approvingCollateral.setCollateralSubType(new OBCollateralSubType("GT409"));

		ICollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(approvingCollateral);

		context.put("serviceColObj", trxValue);

		Map returnMap = cmd.doExecute(context);
		Map exceptionMap = (Map) returnMap.get(ICommonEventConstant.COMMAND_EXCEPTION_MAP);
		assertTrue(exceptionMap.isEmpty());
	}

	public void testWithoutLimitProfileAtGlobalSession() {
		ValidateStpCollateralCommand cmd = new ValidateStpCollateralCommand("MO", "AB102");
		HashMap context = new HashMap();

		ICollateral approvingCollateral = new OBCollateral();
		approvingCollateral.setCollateralSubType(new OBCollateralSubType("GT409"));

		ICollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(approvingCollateral);

		context.put("serviceColObj", trxValue);

		try {
			cmd.doExecute(context);
			fail("should throw null pointer exception as no limit profile specified in global session");
		}
		catch (NullPointerException ex) {
		}
	}

	public void testWithoutLimitProfileAtGlobalSessionButAtTrxContext() {
		ValidateStpCollateralCommand cmd = new ValidateStpCollateralCommand("HP", "AB102");
		HashMap context = new HashMap();

		ICollateral approvingCollateral = new OBCollateral();
		approvingCollateral.setCollateralSubType(new OBCollateralSubType("GT409"));

		ILimitProfile trxLimitProfile = new OBLimitProfile();
		trxLimitProfile.setLimitProfileID(12345);

		ITrxContext trxCtx = new OBTrxContext();
		trxCtx.setLimitProfile(trxLimitProfile);

		ICollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(approvingCollateral);
		trxValue.setTrxContext(trxCtx);

		context.put("serviceColObj", trxValue);

		ICollateral collateral = new OBCollateral();
		collateral.setCollateralID(12345);
		collateral.setSCISecurityID(null);
		collateral.setCollateralSubType(new OBCollateralSubType("AB102"));

		ICollateralAllocation limitSecMap = new OBCollateralAllocation();
		limitSecMap.setCollateral(collateral);

		ILimit limit = new OBLimit();
		limit.setCollateralAllocations(new ICollateralAllocation[] { limitSecMap });

		final ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setApplicationType("HP");
		limitProfile.setLimits(new ILimit[] { limit });

		cmd.setLimitProxy((ILimitProxy) Proxy.newProxyInstance(Thread.currentThread().getContextClassLoader(),
				new Class[] { ILimitProxy.class }, new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("getLimitProfile") && args[0].equals(new Long(12345))) {
							return limitProfile;
						}
						return null;
					}
				}));

		Map returnMap = cmd.doExecute(context);
		Map exceptionMap = (Map) returnMap.get(ICommonEventConstant.COMMAND_EXCEPTION_MAP);
		assertFalse(exceptionMap.isEmpty());
		ActionMessage msg = (ActionMessage) exceptionMap.get("pendingPerfectError");
		assertEquals("error.collateral.application.type.first.collateral", msg.getKey());
		assertEquals("HP", msg.getValues()[0]);
		assertEquals("Vehicle", msg.getValues()[1]);
		assertEquals("12345", msg.getValues()[2]);
	}

	public void testWithoutLimitProfileAtGlobalSessionButAtTrxContextFor2Vehicles() {
		ValidateStpCollateralCommand cmd = new ValidateStpCollateralCommand("HP", "AB102");
		HashMap context = new HashMap();

		ICollateral approvingCollateral = new OBCollateral();
		approvingCollateral.setCollateralSubType(new OBCollateralSubType("GT409"));

		ILimitProfile trxLimitProfile = new OBLimitProfile();
		trxLimitProfile.setLimitProfileID(12345);

		ITrxContext trxCtx = new OBTrxContext();
		trxCtx.setLimitProfile(trxLimitProfile);

		ICollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(approvingCollateral);
		trxValue.setTrxContext(trxCtx);

		context.put("serviceColObj", trxValue);

		ICollateral collateral = new OBCollateral();
		collateral.setCollateralID(12345);
		collateral.setSCISecurityID(null);
		collateral.setCollateralSubType(new OBCollateralSubType("AB102"));

		ICollateralAllocation limitSecMap = new OBCollateralAllocation();
		limitSecMap.setCollateral(collateral);

		ICollateral collateral1 = new OBCollateral();
		collateral1.setCollateralID(54321);
		collateral1.setSCISecurityID(null);
		collateral1.setCollateralSubType(new OBCollateralSubType("AB102"));

		ICollateralAllocation limitSecMap1 = new OBCollateralAllocation();
		limitSecMap1.setCollateral(collateral1);

		ILimit limit = new OBLimit();
		limit.setCollateralAllocations(new ICollateralAllocation[] { limitSecMap, limitSecMap1 });

		final ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setApplicationType("HP");
		limitProfile.setLimits(new ILimit[] { limit });

		cmd.setLimitProxy((ILimitProxy) Proxy.newProxyInstance(Thread.currentThread().getContextClassLoader(),
				new Class[] { ILimitProxy.class }, new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("getLimitProfile") && args[0].equals(new Long(12345))) {
							return limitProfile;
						}
						return null;
					}
				}));

		Map returnMap = cmd.doExecute(context);
		Map exceptionMap = (Map) returnMap.get(ICommonEventConstant.COMMAND_EXCEPTION_MAP);
		assertFalse(exceptionMap.isEmpty());
		ActionMessage msg = (ActionMessage) exceptionMap.get("pendingPerfectError");
		assertEquals("error.collateral.application.type.first.collateral", msg.getKey());
		assertEquals("HP", msg.getValues()[0]);
		assertEquals("Vehicle", msg.getValues()[1]);
		assertEquals("12345", msg.getValues()[2]);
	}
}

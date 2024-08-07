package com.integrosys.cms.app.collateral.bus.valuation.support;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import junit.framework.TestCase;

import org.easymock.MockControl;

import com.integrosys.cms.app.collateral.bus.OBCollateralSubType;

/**
 * @author Chong Jun Yong
 * 
 */
public class ValuationProfileSingletonListenerTest extends TestCase {
	public void testReloadSingletonBasedOnCollateralTypeCodeOnly() {
		MockControl singletonABControl = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB = (ValuationProfileSingleton) singletonABControl.getMock();
		singletonAB.reloadProfiles();
		singletonABControl.setDefaultVoidCallable();
		singletonABControl.replay();

		MockControl singletonAB101Control = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB101 = (ValuationProfileSingleton) singletonAB101Control.getMock();
		singletonAB101.reloadProfiles();
		singletonAB101Control.setDefaultVoidCallable();
		singletonAB101Control.replay();

		Map colTypeCodeSingletons = new HashMap();
		colTypeCodeSingletons.put("AB", Arrays.asList(new ValuationProfileSingleton[] { singletonAB, singletonAB101 }));

		ValuationProfileSingletonListener listener = new ValuationProfileSingletonListener(colTypeCodeSingletons, null);
		listener.reloadSingleton(new OBCollateralSubType("AB", null));

		singletonABControl.verify();
		singletonAB101Control.verify();
	}

	public void testReloadSingletonBasedOnCollateralSubTypeCodeOnly() {
		MockControl singletonAB102Control = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB102 = (ValuationProfileSingleton) singletonAB102Control.getMock();
		singletonAB102.reloadProfiles();
		singletonAB102Control.setDefaultVoidCallable();
		singletonAB102Control.replay();

		Map colSubTypeCodeSingletons = new HashMap();
		colSubTypeCodeSingletons.put("AB102", Arrays.asList(new ValuationProfileSingleton[] { singletonAB102 }));

		ValuationProfileSingletonListener listener = new ValuationProfileSingletonListener(null,
				colSubTypeCodeSingletons);
		listener.reloadSingleton(new OBCollateralSubType("AB102"));
		listener.reloadSingleton(new OBCollateralSubType("AB", null));

		singletonAB102Control.verify();
	}

	public void testReloadSingletonBasedOnCollateralTypeCodeAndSubTypeCode() {
		MockControl singletonABControl = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB = (ValuationProfileSingleton) singletonABControl.getMock();
		singletonAB.reloadProfiles();
		singletonABControl.setDefaultVoidCallable();
		singletonABControl.replay();

		MockControl singletonAB101Control = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB101 = (ValuationProfileSingleton) singletonAB101Control.getMock();
		singletonAB101.reloadProfiles();
		singletonAB101Control.setDefaultVoidCallable();
		singletonAB101Control.replay();

		MockControl singletonAB102Control = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB102 = (ValuationProfileSingleton) singletonAB102Control.getMock();
		singletonAB102.reloadProfiles();
		singletonAB102Control.setDefaultVoidCallable();
		singletonAB102Control.replay();

		Map colTypeCodeSingletons = new HashMap();
		colTypeCodeSingletons.put("AB", Arrays.asList(new ValuationProfileSingleton[] { singletonAB, singletonAB101 }));

		Map colSubTypeCodeSingletons = new HashMap();
		colSubTypeCodeSingletons.put("AB102", Arrays.asList(new ValuationProfileSingleton[] { singletonAB102 }));

		ValuationProfileSingletonListener listener = new ValuationProfileSingletonListener(colTypeCodeSingletons,
				colSubTypeCodeSingletons);
		listener.reloadSingleton(new OBCollateralSubType("AB", null));
		listener.reloadSingleton(new OBCollateralSubType("AB102"));

		singletonABControl.verify();
		singletonAB101Control.verify();
		singletonAB102Control.verify();
	}

	public void testReloadAllSingletons() {
		MockControl singletonABControl = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB = (ValuationProfileSingleton) singletonABControl.getMock();
		singletonAB.reloadProfiles();
		singletonABControl.setDefaultVoidCallable();
		singletonABControl.replay();

		MockControl singletonAB101Control = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB101 = (ValuationProfileSingleton) singletonAB101Control.getMock();
		singletonAB101.reloadProfiles();
		singletonAB101Control.setDefaultVoidCallable();
		singletonAB101Control.replay();

		MockControl singletonAB102Control = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB102 = (ValuationProfileSingleton) singletonAB102Control.getMock();
		singletonAB102.reloadProfiles();
		singletonAB102Control.setDefaultVoidCallable();
		singletonAB102Control.replay();

		Map colTypeCodeSingletons = new HashMap();
		colTypeCodeSingletons.put("AB", Arrays.asList(new ValuationProfileSingleton[] { singletonAB, singletonAB101 }));

		Map colSubTypeCodeSingletons = new HashMap();
		colSubTypeCodeSingletons.put("AB102", Arrays.asList(new ValuationProfileSingleton[] { singletonAB102 }));

		ValuationProfileSingletonListener listener = new ValuationProfileSingletonListener(colTypeCodeSingletons,
				colSubTypeCodeSingletons);
		listener.reloadAllSingletons();

		singletonABControl.verify();
		singletonAB101Control.verify();
		singletonAB102Control.verify();
	}

	public void testInitSingletonBasedOnCollateralTypeCodeAndSubTypeCode() {
		MockControl singletonABControl = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB = (ValuationProfileSingleton) singletonABControl.getMock();
		singletonAB.init();
		singletonABControl.setDefaultVoidCallable();
		singletonABControl.replay();

		MockControl singletonAB101Control = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB101 = (ValuationProfileSingleton) singletonAB101Control.getMock();
		singletonAB101.init();
		singletonAB101Control.setDefaultVoidCallable();
		singletonAB101Control.replay();

		MockControl singletonAB102Control = MockControl.createControl(ValuationProfileSingleton.class);
		ValuationProfileSingleton singletonAB102 = (ValuationProfileSingleton) singletonAB102Control.getMock();
		singletonAB102.init();
		singletonAB102Control.setDefaultVoidCallable();
		singletonAB102Control.replay();

		Map colTypeCodeSingletons = new HashMap();
		colTypeCodeSingletons.put("AB", Arrays.asList(new ValuationProfileSingleton[] { singletonAB, singletonAB101 }));

		Map colSubTypeCodeSingletons = new HashMap();
		colSubTypeCodeSingletons.put("AB102", Arrays.asList(new ValuationProfileSingleton[] { singletonAB102 }));

		ValuationProfileSingletonListener listener = new ValuationProfileSingletonListener(colTypeCodeSingletons,
				colSubTypeCodeSingletons);
		listener.initSingleton(new OBCollateralSubType("AB", null));
		listener.initSingleton(new OBCollateralSubType("AB102"));

		singletonABControl.verify();
		singletonAB101Control.verify();
		singletonAB102Control.verify();
	}

}

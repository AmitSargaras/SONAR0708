package com.integrosys.cms.ui.collateral.pledge;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import junit.framework.TestCase;

import org.apache.struts.action.ActionMessage;

import com.integrosys.cms.app.collateral.bus.ICollateralLimitMap;
import com.integrosys.cms.app.collateral.bus.ILimitCharge;
import com.integrosys.cms.app.collateral.bus.ILimitChargeMap;
import com.integrosys.cms.app.collateral.bus.OBCollateralLimitMap;
import com.integrosys.cms.app.collateral.bus.OBLimitCharge;
import com.integrosys.cms.app.collateral.bus.OBLimitChargeMap;
import com.integrosys.cms.app.collateral.bus.type.insurance.IInsuranceCollateral;
import com.integrosys.cms.app.collateral.bus.type.insurance.OBInsuranceCollateral;
import com.integrosys.cms.app.collateral.bus.type.property.IPropertyCollateral;
import com.integrosys.cms.app.collateral.bus.type.property.OBPropertyCollateral;
import com.integrosys.cms.app.collateral.trx.ICollateralTrxValue;
import com.integrosys.cms.app.collateral.trx.OBCollateralTrxValue;

/**
 * @author Chong Jun Yong
 * 
 */
public class DeletePledgeCommandTest extends TestCase {
	public void testRemovePledgeForInsuranceCollateral() {
		DeletePledgeCommand cmd = new DeletePledgeCommand();

		ICollateralLimitMap limitSecMap = new OBCollateralLimitMap();
		limitSecMap.setCollateralID(12345);
		limitSecMap.setLimitID(54321);
		limitSecMap.setChargeID(13579);

		ILimitChargeMap limitChargeMap = new OBLimitChargeMap();
		limitChargeMap.setCollateralID(12345);
		limitChargeMap.setChargeDetailID(67890);
		limitChargeMap.setChargeID(13579);
		limitChargeMap.setStatus("ACTIVE");
		ILimitCharge charge = new OBLimitCharge();
		charge.setCollateralID(12345);
		charge.setChargeDetailID(67890);
		charge.setStatus("ACTIVE");
		charge.setLimitMaps(new ILimitChargeMap[] { limitChargeMap });

		IInsuranceCollateral insurance = new OBInsuranceCollateral();
		insurance.setCollateralID(12345);
		insurance.setCollateralLimits(new ICollateralLimitMap[] { limitSecMap });
		insurance.setLimitCharges(new ILimitCharge[] { charge });

		ICollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(insurance);

		HashMap context = new HashMap();
		context.put("pledgeRemove", Arrays.asList(new String[] { "0" }));
		context.put("serviceColObj", trxValue);

		// test not to tag charge map as 'deleted'
		Map returnMap = cmd.doExecute(context);
		Map exceptionMap = (Map) returnMap.get("commandExceptionMap");
		assertTrue(exceptionMap.isEmpty());
		assertEquals(0, trxValue.getStagingCollateral().getCollateralLimits().length);
		assertEquals(1, trxValue.getStagingCollateral().getLimitCharges().length);
		assertEquals("ACTIVE", limitChargeMap.getStatus());

		// test to tag charge map as 'deleted'
		trxValue.getStagingCollateral().setCollateralLimits(new ICollateralLimitMap[] { limitSecMap });
		cmd = new DeletePledgeCommand(true);
		returnMap = cmd.doExecute(context);
		exceptionMap = (Map) returnMap.get("commandExceptionMap");
		assertTrue(exceptionMap.isEmpty());
		assertEquals(0, trxValue.getStagingCollateral().getCollateralLimits().length);
		assertEquals(1, trxValue.getStagingCollateral().getLimitCharges().length);
		assertEquals("DELETED", limitChargeMap.getStatus());
	}

	public void testRemovePledgeForPropertyCollateral() {
		DeletePledgeCommand cmd = new DeletePledgeCommand();

		ICollateralLimitMap limitSecMap = new OBCollateralLimitMap();
		limitSecMap.setCollateralID(12345);
		limitSecMap.setLimitID(54321);
		limitSecMap.setChargeID(13579);

		ILimitChargeMap limitChargeMap = new OBLimitChargeMap();
		limitChargeMap.setCollateralID(12345);
		limitChargeMap.setChargeDetailID(67890);
		limitChargeMap.setChargeID(13579);
		limitChargeMap.setStatus("ACTIVE");
		ILimitCharge charge = new OBLimitCharge();
		charge.setCollateralID(12345);
		charge.setChargeDetailID(67890);
		charge.setStatus("ACTIVE");
		charge.setLimitMaps(new ILimitChargeMap[] { limitChargeMap });

		IPropertyCollateral property = new OBPropertyCollateral();
		property.setCollateralID(12345);
		property.setCollateralLimits(new ICollateralLimitMap[] { limitSecMap });
		property.setLimitCharges(new ILimitCharge[] { charge });

		ICollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(property);

		HashMap context = new HashMap();
		context.put("pledgeRemove", Arrays.asList(new String[] { "0" }));
		context.put("serviceColObj", trxValue);

		Map returnMap = cmd.doExecute(context);
		Map exceptionMap = (Map) returnMap.get("commandExceptionMap");
		assertFalse(exceptionMap.isEmpty());
		assertEquals(1, trxValue.getStagingCollateral().getCollateralLimits().length);
		assertEquals(1, trxValue.getStagingCollateral().getLimitCharges().length);
		assertEquals("ACTIVE", limitChargeMap.getStatus());
		assertEquals("error.collateral.remove.charge.first", ((ActionMessage) exceptionMap.get("collateralPledge"))
				.getKey());

		trxValue.getStagingCollateral().setLimitCharges(null);
		returnMap = cmd.doExecute(context);
		exceptionMap = (Map) returnMap.get("commandExceptionMap");
		assertTrue(exceptionMap.isEmpty());
		assertEquals(0, trxValue.getStagingCollateral().getCollateralLimits().length);
	}
}

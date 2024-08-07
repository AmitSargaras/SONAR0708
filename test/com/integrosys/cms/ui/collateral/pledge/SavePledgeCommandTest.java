package com.integrosys.cms.ui.collateral.pledge;

import java.util.HashMap;

import junit.framework.TestCase;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.cms.app.collateral.bus.ICollateral;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.cms.app.collateral.bus.OBCollateralLimitMap;
import com.integrosys.cms.app.collateral.trx.OBCollateralTrxValue;

public class SavePledgeCommandTest extends TestCase {
	public void testSavePledgeCheckCollateralAmountUsageIndicator() {
		HashMap context = new HashMap();

		OBCollateral stageCol = new OBCollateral();

		OBCollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(stageCol);

		context.put("serviceColObj", trxValue);
		context.put("event", "create_pledge");

		OBCollateralLimitMap map2 = new OBCollateralLimitMap();
		map2.setPledgeAmount(new Amount(123d, "MYR"));
		map2.setDrawAmountPercentage(12d);

		context.put("pledgeDetail", map2);

		SavePledgeCommand cmd = new SavePledgeCommand();
		HashMap returnMap = cmd.doExecute(context);

		HashMap exceptionMap = (HashMap) returnMap.get("commandExceptionMap");
		assertNotNull(exceptionMap);
		assertTrue(exceptionMap.isEmpty());

		HashMap resultMap = (HashMap) returnMap.get("commandResultMap");
		trxValue = (OBCollateralTrxValue) resultMap.get("serviceColObj");

		stageCol = (OBCollateral) trxValue.getStagingCollateral();
		assertEquals(ICollateral.CHARGE_INFO_AMOUNT_USAGE, stageCol.getChargeInfoPledgeAmountUsageIndicator());
		assertEquals(ICollateral.CHARGE_INFO_PERCENTAGE_USAGE, stageCol.getChargeInfoDrawAmountUsageIndicator());

	}

	public void testSavePledgeWithDifferentPledgeAmountUsageFromExistingPledge() {
		HashMap context = new HashMap();

		OBCollateralLimitMap map1 = new OBCollateralLimitMap();
		map1.setSCISysGenID(12345);

		OBCollateral stageCol = new OBCollateral();
		stageCol.setChargeInfoDrawAmountUsageIndicator(ICollateral.CHARGE_INFO_AMOUNT_USAGE);
		stageCol.setChargeInfoPledgeAmountUsageIndicator(ICollateral.CHARGE_INFO_PERCENTAGE_USAGE);
		stageCol.setCollateralLimits(new OBCollateralLimitMap[] { map1 });

		OBCollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(stageCol);

		context.put("serviceColObj", trxValue);
		context.put("event", "create_pledge");

		OBCollateralLimitMap map2 = new OBCollateralLimitMap();
		map2.setPledgeAmount(new Amount(123d, "MYR"));

		context.put("pledgeDetail", map2);

		SavePledgeCommand cmd = new SavePledgeCommand();
		HashMap returnMap = cmd.doExecute(context);

		HashMap exceptionMap = (HashMap) returnMap.get("commandExceptionMap");
		assertNotNull(exceptionMap);
		assertEquals(1, exceptionMap.size());
	}
}

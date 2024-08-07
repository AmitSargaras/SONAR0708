package com.integrosys.cms.app.collateral.trx;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.cms.app.collateral.bus.OBCollateralSubType;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class CheckerApproveUpdateCollateralStpPassedOperationTest extends TransactionEngineTestCase {

	public void onSetUp() throws Exception {
		super.onSetUp();
		addTrStateMatrix("PENDING_UPDATE", "LOADING", "CHECKER_APPROVE_PASS", "COL");
		addTrStateMatrix("PENDING_CREATE", "LOADING", "CHECKER_APPROVE_PASS", "COL");
	}

	public void testCheckerApproveUpdateStpPassedCollateral() throws Exception {
		OBCollateral actualCol = new OBCollateral();
		actualCol.setCollateralID(20081121000333999l);

		OBCollateralSubType colSubType = new OBCollateralSubType();
		colSubType.setTypeName("Asset Based");
		colSubType.setTypeCode("AB");
		colSubType.setSubTypeName("Vehicle");
		colSubType.setSubTypeCode("AB102");

		actualCol.setCollateralSubType(colSubType);
		actualCol.setCMV(new Amount(10000, "MYR"));
		actualCol.setSCISecurityID("RLOS-AB102-0001");

		OBCollateral stagingCol = new OBCollateral();
		stagingCol.setCollateralID(20081121000333555l);

		stagingCol.setCollateralSubType(colSubType);
		stagingCol.setCMV(new Amount(15000, "MYR"));
		stagingCol.setSCISecurityID("RLOS-AB102-0001");

		OBCollateralTrxValue collateralTrxValue = new OBCollateralTrxValue();
		collateralTrxValue.setCollateral(actualCol);
		collateralTrxValue.setStagingCollateral(stagingCol);
		collateralTrxValue.setFromState("ACTIVE");
		collateralTrxValue.setToState("PENDING_UPDATE");
		collateralTrxValue.setStatus("PENDING_UPDATE");
		collateralTrxValue.setInstanceName("COL");

		collateralTrxValue = (OBCollateralTrxValue) createTransaction(collateralTrxValue);

		CheckerApproveUpdateCollateralStpPassedOperation op = new CheckerApproveUpdateCollateralStpPassedOperation();
		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, collateralTrxValue);
		collateralTrxValue = (OBCollateralTrxValue) result.getTrxValue();
		assertEquals("LOADING", collateralTrxValue.getToState());
		assertEquals("CHECKER_APPROVE_PASS", collateralTrxValue.getOpDesc());
	}
	
	public void testCheckerApproveCreateStpPassedCollateral() throws Exception {
		OBCollateral actualCol = new OBCollateral();
		actualCol.setCollateralID(20081121000333999l);

		OBCollateralSubType colSubType = new OBCollateralSubType();
		colSubType.setTypeName("Asset Based");
		colSubType.setTypeCode("AB");
		colSubType.setSubTypeName("Vehicle");
		colSubType.setSubTypeCode("AB102");

		actualCol.setCollateralSubType(colSubType);
		actualCol.setCMV(new Amount(10000, "MYR"));
		actualCol.setSCISecurityID("RLOS-AB102-0001");

		OBCollateral stagingCol = new OBCollateral();
		stagingCol.setCollateralID(20081121000333555l);

		stagingCol.setCollateralSubType(colSubType);
		stagingCol.setCMV(new Amount(15000, "MYR"));
		stagingCol.setSCISecurityID("RLOS-AB102-0001");

		OBCollateralTrxValue collateralTrxValue = new OBCollateralTrxValue();
		collateralTrxValue.setCollateral(actualCol);
		collateralTrxValue.setStagingCollateral(stagingCol);
		collateralTrxValue.setFromState("ND");
		collateralTrxValue.setToState("PENDING_CREATE");
		collateralTrxValue.setStatus("PENDING_CREATE");
		collateralTrxValue.setInstanceName("COL");

		collateralTrxValue = (OBCollateralTrxValue) createTransaction(collateralTrxValue);

		CheckerApproveUpdateCollateralStpPassedOperation op = new CheckerApproveUpdateCollateralStpPassedOperation();
		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, collateralTrxValue);
		collateralTrxValue = (OBCollateralTrxValue) result.getTrxValue();
		assertEquals("LOADING", collateralTrxValue.getToState());
		assertEquals("CHECKER_APPROVE_PASS", collateralTrxValue.getOpDesc());
	}
}

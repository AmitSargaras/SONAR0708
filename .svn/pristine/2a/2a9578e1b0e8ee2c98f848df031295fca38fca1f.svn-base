package com.integrosys.cms.app.collateral.trx;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

import com.integrosys.cms.app.collateral.bus.ICollateral;
import com.integrosys.cms.app.collateral.bus.ICollateralBusManager;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.cms.app.collateral.bus.OBCollateralSubType;
import com.integrosys.cms.app.collateral.bus.OBCollateralType;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.ICMSTrxValue;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class CheckerApproveUpdateCollateralOperationTest extends TransactionEngineTestCase {
	protected void onSetUp() throws Exception {
		super.onSetUp();

		addTrStateMatrix("PENDING_CREATE", "ACTIVE", "CHECKER_APPROVE_UPDATE", "COL");
		addTrStateMatrix("PENDING_UPDATE", "ACTIVE", "CHECKER_APPROVE_UPDATE", "COL");
	}

	public void testApproveNewCollateral() throws Exception {
		OBCollateral col = new OBCollateral();
		col.setCollateralID(20081031000111222l);

		OBCollateralType colType = new OBCollateralType();
		colType.setTypeCode("AB");
		colType.setTypeName("Asset Based");

		OBCollateralSubType colSubType = new OBCollateralSubType();
		colSubType.setSubTypeCode("AB100");
		colSubType.setSubTypeName("General Charge");

		col.setCollateralType(colType);
		col.setCollateralSubType(colSubType);
		col.setSCISecurityID("LOS-STOCKS-0001-BB");

		OBCollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setStagingCollateral(col);
		trxValue.setInstanceName("COL");
		trxValue.setToState("PENDING_CREATE");

		trxValue = (OBCollateralTrxValue) createTransaction(trxValue);

		ICollateralBusManager mockActualColBusMgr = (ICollateralBusManager) Proxy.newProxyInstance(
				ICollateralBusManager.class.getClassLoader(), new Class[] { ICollateralBusManager.class },
				new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("createCollateral")) {
							ICollateral col = (ICollateral) args[0];
							assertEquals(20081031000111222l, col.getCollateralID());
							assertEquals("AB100", col.getCollateralSubType().getSubTypeCode());
							return col;
						}

						return null;
					}

				});

		CheckerApproveUpdateCollateralOperation op = new CheckerApproveUpdateCollateralOperation();
		op.setActualCollateralBusManager(mockActualColBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		ICMSTrxValue cmsTrxValue = (ICMSTrxValue) result.getTrxValue();
		assertEquals("ACTIVE", cmsTrxValue.getToState());
		assertEquals("CHECKER_APPROVE_UPDATE", cmsTrxValue.getOpDesc());
		assertNotNull(cmsTrxValue.getReferenceID());
	}

	public void testApproveExistingCollateral() throws Exception {
		OBCollateral col = new OBCollateral();
		col.setCollateralID(20081031000111222l);
		col.setComment("actual collateral");

		OBCollateralType colType = new OBCollateralType();
		colType.setTypeCode("AB");
		colType.setTypeName("Asset Based");

		OBCollateralSubType colSubType = new OBCollateralSubType();
		colSubType.setSubTypeCode("AB100");
		colSubType.setSubTypeName("General Charge");

		col.setCollateralType(colType);
		col.setCollateralSubType(colSubType);
		col.setSCISecurityID("LOS-STOCKS-0001-BB");

		OBCollateral stgCol = new OBCollateral();
		stgCol.setCollateralID(20081031000111223l);
		stgCol.setSCISecurityID("LOS-STOCKS-0001-BB");
		stgCol.setComment("staging collateral");

		OBCollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setCollateral(col);
		trxValue.setStagingCollateral(stgCol);
		trxValue.setInstanceName("COL");
		trxValue.setToState("PENDING_UPDATE");

		trxValue = (OBCollateralTrxValue) createTransaction(trxValue);

		ICollateralBusManager mockActualColBusMgr = (ICollateralBusManager) Proxy.newProxyInstance(
				ICollateralBusManager.class.getClassLoader(), new Class[] { ICollateralBusManager.class },
				new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("updateCollateral")) {
							ICollateral col = (ICollateral) args[0];
							assertEquals(20081031000111222l, col.getCollateralID());
							assertEquals("AB100", col.getCollateralSubType().getSubTypeCode());
							assertEquals("staging collateral", col.getComment());
							return col;
						}

						return null;
					}

				});

		CheckerApproveUpdateCollateralOperation op = new CheckerApproveUpdateCollateralOperation();
		op.setActualCollateralBusManager(mockActualColBusMgr);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		ICMSTrxValue cmsTrxValue = (ICMSTrxValue) result.getTrxValue();
		assertEquals("ACTIVE", cmsTrxValue.getToState());
		assertEquals("CHECKER_APPROVE_UPDATE", cmsTrxValue.getOpDesc());
	}
}

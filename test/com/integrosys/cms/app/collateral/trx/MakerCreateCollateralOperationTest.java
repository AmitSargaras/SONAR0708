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

public class MakerCreateCollateralOperationTest extends TransactionEngineTestCase {
	protected void onSetUp() throws Exception {
		super.onSetUp();

		addTrStateMatrix("ND", "PENDING_CREATE", "MAKER_CREATE", "COL");
	}

	public void testMakerSubmitNewCollateral() throws Exception {
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

		ICollateralBusManager mockStagingColBusMgrs = (ICollateralBusManager) Proxy.newProxyInstance(
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

		MakerCreateCollateralOperation op = new MakerCreateCollateralOperation();
		op.setStagingCollateralBusManager(mockStagingColBusMgrs);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		ICMSTrxValue cmsTrxValue = (ICMSTrxValue) result.getTrxValue();
		assertEquals("PENDING_CREATE", cmsTrxValue.getToState());
		assertEquals("MAKER_CREATE", cmsTrxValue.getOpDesc());
	}
}

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
public class MakerSaveCollateralOperationTest extends TransactionEngineTestCase {
	public void onSetUp() throws Exception {
		super.onSetUp();

		addTrStateMatrix("ND", "DRAFT", "MAKER_SAVE", "COL");
		addTrStateMatrix("ACTIVE", "DRAFT", "MAKER_SAVE", "COL");
	}

	public void testMakerSaveNewCollateral() throws Exception {
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

		MakerSaveCollateralOperation op = new MakerSaveCollateralOperation();
		op.setStagingCollateralBusManager(mockStagingColBusMgrs);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		ICMSTrxValue cmsTrxValue = (ICMSTrxValue) result.getTrxValue();
		assertEquals("DRAFT", cmsTrxValue.getToState());
		assertEquals("MAKER_SAVE", cmsTrxValue.getOpDesc());
	}

	public void testMakerSaveExistingCollateral() throws Exception {
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
		stgCol.setComment("staging collateral");

		stgCol.setCollateralType(colType);
		stgCol.setCollateralSubType(colSubType);
		stgCol.setSCISecurityID("LOS-STOCKS-0001-BB");

		OBCollateralTrxValue trxValue = new OBCollateralTrxValue();
		trxValue.setCollateral(col);
		trxValue.setStagingCollateral(stgCol);
		trxValue.setToState("ACTIVE");
		trxValue.setInstanceName("COL");

		trxValue = (OBCollateralTrxValue) createTransaction(trxValue);

		ICollateralBusManager mockStagingColBusMgrs = (ICollateralBusManager) Proxy.newProxyInstance(
				ICollateralBusManager.class.getClassLoader(), new Class[] { ICollateralBusManager.class },
				new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("createCollateral")) {
							ICollateral col = (ICollateral) args[0];
							assertEquals(20081031000111222l, col.getCollateralID());
							assertEquals("AB100", col.getCollateralSubType().getSubTypeCode());
							assertEquals("staging collateral", col.getComment());
							return col;
						}

						return null;
					}

				});

		MakerSaveCollateralOperation op = new MakerSaveCollateralOperation();
		op.setStagingCollateralBusManager(mockStagingColBusMgrs);

		ICMSTrxResult result = operateUsingDefaultTrxProcess(op, trxValue);
		ICMSTrxValue cmsTrxValue = (ICMSTrxValue) result.getTrxValue();
		assertEquals("DRAFT", cmsTrxValue.getToState());
		assertEquals("MAKER_SAVE", cmsTrxValue.getOpDesc());
	}
}

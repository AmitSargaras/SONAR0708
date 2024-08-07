package com.integrosys.cms.app.collateral.bus;

import org.mockejb.interceptor.Aspect;
import org.mockejb.interceptor.InvocationContext;
import org.mockejb.interceptor.MethodPatternPointcut;
import org.mockejb.interceptor.Pointcut;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.MockContextTestCase;

public class EBCollateralLimitMapBeanTest extends MockContextTestCase {

	protected void onSetUp() throws Exception {
		deploy("EBCollateralLimitMapHome", EBCollateralLimitMapLocalHome.class, EBCollateralLimitMapLocal.class,
				EBCollateralLimitMapBean.class);

		addAspect(new ColltaralLimitMapEjbCreateAspect());
	}

	public void testCreateCollateralLimitMapWithBasicInfo() throws Exception {
		OBCollateralLimitMap collateralLimitMap = new OBCollateralLimitMap();
		collateralLimitMap.setLimitID(20081024000000001l);
		collateralLimitMap.setCollateralID(20081024000000001l);
		collateralLimitMap.setCmsLimitProfileId(20081024000999111l);
		collateralLimitMap.setSCILegalEntityID("CMS-CUST-00001");
		collateralLimitMap.setSCIStatus("ACTIVE");
		collateralLimitMap.setSCILimitID("LOS-HP-0001");
		collateralLimitMap.setSCISecurityID("VEH-00001");

		EBCollateralLimitMapLocalHome collateralLimitMapLocalHome = (EBCollateralLimitMapLocalHome) get("EBCollateralLimitMapHome");
		EBCollateralLimitMapLocal local = collateralLimitMapLocalHome.create(collateralLimitMap);
		ICollateralLimitMap storedCollateralLimitMap = local.getValue();
		assertEquals("CMS-CUST-00001", storedCollateralLimitMap.getSCILegalEntityID());
		assertEquals("ACTIVE", storedCollateralLimitMap.getSCIStatus());
		assertEquals("LOS-HP-0001", storedCollateralLimitMap.getSCILimitID());
		assertEquals("VEH-00001", storedCollateralLimitMap.getSCISecurityID());

		local = collateralLimitMapLocalHome.findByPrimaryKey(new Long(storedCollateralLimitMap.getChargeID()));
		assertNotNull(local.getValue());
	}

	public void testCreateCollateralLimitMapWithChargeInfoAmountInput() throws Exception {
		OBCollateralLimitMap collateralLimitMap = new OBCollateralLimitMap();
		collateralLimitMap.setLimitID(20081024000000001l);
		collateralLimitMap.setCollateralID(20081024000000001l);
		collateralLimitMap.setCmsLimitProfileId(20081024000999111l);
		collateralLimitMap.setSCILegalEntityID("CMS-CUST-00001");
		collateralLimitMap.setSCIStatus("ACTIVE");
		collateralLimitMap.setSCILimitID("LOS-HP-0001");
		collateralLimitMap.setSCISecurityID("VEH-00001");

		Amount pledgeAmount = new Amount(25000, "MYR");
		Amount drawAmount = new Amount(21000, "MYR");

		collateralLimitMap.setPledgeAmount(pledgeAmount);
		collateralLimitMap.setDrawAmount(drawAmount);

		EBCollateralLimitMapLocalHome collateralLimitMapLocalHome = (EBCollateralLimitMapLocalHome) get("EBCollateralLimitMapHome");
		EBCollateralLimitMapLocal local = collateralLimitMapLocalHome.create(collateralLimitMap);
		ICollateralLimitMap storedCollateralLimitMap = local.getValue();
		assertEquals("LOS-HP-0001", storedCollateralLimitMap.getSCILimitID());
		assertEquals("VEH-00001", storedCollateralLimitMap.getSCISecurityID());
		assertEquals(20081024000999111l, storedCollateralLimitMap.getCmsLimitProfileId());
		assertEquals(25000d, storedCollateralLimitMap.getPledgeAmount().getAmountAsDouble(), 0);
		assertEquals(21000d, storedCollateralLimitMap.getDrawAmount().getAmountAsDouble(), 0);
	}

	public void testCreateCollateralLimitMapWithChargeInfoPercentageInput() throws Exception {
		OBCollateralLimitMap collateralLimitMap = new OBCollateralLimitMap();
		collateralLimitMap.setLimitID(20081024000000001l);
		collateralLimitMap.setCollateralID(20081024000000001l);
		collateralLimitMap.setCmsLimitProfileId(20081024000999111l);
		collateralLimitMap.setSCILegalEntityID("CMS-CUST-00001");
		collateralLimitMap.setSCIStatus("ACTIVE");
		collateralLimitMap.setSCILimitID("LOS-HP-0001");
		collateralLimitMap.setSCISecurityID("VEH-00001");
		collateralLimitMap.setPledgeAmountPercentage(0.5);
		collateralLimitMap.setDrawAmountPercentage(0.33);

		EBCollateralLimitMapLocalHome collateralLimitMapLocalHome = (EBCollateralLimitMapLocalHome) get("EBCollateralLimitMapHome");
		EBCollateralLimitMapLocal local = collateralLimitMapLocalHome.create(collateralLimitMap);
		ICollateralLimitMap storedCollateralLimitMap = local.getValue();
		assertEquals("LOS-HP-0001", storedCollateralLimitMap.getSCILimitID());
		assertEquals("VEH-00001", storedCollateralLimitMap.getSCISecurityID());
		assertEquals(20081024000999111l, storedCollateralLimitMap.getCmsLimitProfileId());
		assertEquals(0.5, storedCollateralLimitMap.getPledgeAmountPercentage(), 0);
		assertEquals(0.33, storedCollateralLimitMap.getDrawAmountPercentage(), 0);
	}

	private class ColltaralLimitMapEjbCreateAspect implements Aspect {

		public Pointcut getPointcut() {
			return new MethodPatternPointcut("EBCollateralLimitMapBean.*ejbCreate");
		}

		public void intercept(InvocationContext invocationContext) throws Exception {
			invocationContext.proceed();

			EBCollateralLimitMapBean bean = (EBCollateralLimitMapBean) invocationContext.getTargetObject();
			long pk = bean.getChargeID();

			invocationContext.setReturnObject(new Long(pk));
		}
	}
}

package com.integrosys.cms.app.limit.trx;

import org.easymock.MockControl;

import com.integrosys.cms.app.customer.proxy.SBCustomerProxy;
import com.integrosys.cms.app.customer.proxy.SBCustomerProxyHome;
import com.integrosys.cms.app.customer.trx.OBCMSCustomerTrxValue;
import com.integrosys.cms.app.limit.bus.OBLimitProfile;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class CreateLimitProfileOperationTest extends TransactionEngineTestCase {

	public void testPreProcessLimitProfileTrxValue() throws Exception {
		OBCMSCustomerTrxValue customerTrxValue = new OBCMSCustomerTrxValue();
		customerTrxValue.setTransactionID("20081117111222333");

		MockControl customerProxyControl = MockControl.createControl(SBCustomerProxy.class);
		SBCustomerProxy customerProxy = (SBCustomerProxy) customerProxyControl.getMock();
		customerProxy.getTrxCustomer(20081117000111222l);
		customerProxyControl.setReturnValue(customerTrxValue);
		customerProxyControl.replay();

		MockControl customerProxyHomeControl = MockControl.createControl(SBCustomerProxyHome.class);
		SBCustomerProxyHome customerProxyHome = (SBCustomerProxyHome) customerProxyHomeControl.getMock();
		customerProxyHome.create();
		customerProxyHomeControl.setReturnValue(customerProxy);
		customerProxyHomeControl.replay();

		bind("SBCustomerProxyHome", customerProxyHome);

		OBLimitProfileTrxValue trxValue = new OBLimitProfileTrxValue();
		OBLimitProfile stagingLimitProfile = new OBLimitProfile();
		stagingLimitProfile.setCustomerID(20081117000111222l);
		trxValue.setStagingLimitProfile(stagingLimitProfile);

		CreateLimitProfileOperation op = new CreateLimitProfileOperation();
		trxValue = (OBLimitProfileTrxValue) op.preProcess(trxValue);
		assertEquals(customerTrxValue.getTransactionID(), trxValue.getTrxReferenceID());

		customerProxyControl.verify();
		customerProxyHomeControl.verify();
	}
}

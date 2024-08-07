package com.integrosys.cms.app.recurrent.trx;

import org.easymock.MockControl;

import com.integrosys.cms.app.limit.proxy.SBLimitProxy;
import com.integrosys.cms.app.limit.proxy.SBLimitProxyHome;
import com.integrosys.cms.app.limit.trx.OBLimitProfileTrxValue;
import com.integrosys.cms.app.recurrent.bus.IConvenant;
import com.integrosys.cms.app.recurrent.bus.OBConvenant;
import com.integrosys.cms.app.recurrent.bus.OBRecurrentCheckList;
import com.integrosys.cms.app.recurrent.bus.SBRecurrentBusManager;
import com.integrosys.cms.app.transaction.ICMSTrxResult;
import com.integrosys.cms.app.transaction.TransactionEngineTestCase;
import com.integrosys.cms.host.eai.covenant.handler.ConvenantHandlerHelper;

public class SystemCreateTrxTest extends TransactionEngineTestCase {
	protected void onSetUp() throws Exception {
		super.onSetUp();

		addTrStateMatrix("ND", "ACTIVE",	 "SYSTEM_CREATE_RECURRENT_CHECKLIST", "RECURRENT_CHECKLIST");
	}
	
	public void testSystemCreateNewRecurrent() throws Exception {
		
		OBLimitProfileTrxValue limitProfileTrxValue = new OBLimitProfileTrxValue();
		limitProfileTrxValue.setTransactionID("20081121000000923");
		
		MockControl limitProfileProxyControl = MockControl.createControl(SBLimitProxy.class);
		SBLimitProxy limitProfileProxy = (SBLimitProxy) limitProfileProxyControl.getMock();
		limitProfileProxy.getTrxLimitProfile(20070101000001l);
		limitProfileProxyControl.setReturnValue(limitProfileTrxValue);
		limitProfileProxyControl.replay();

		MockControl limitProfileProxyHomeControl = MockControl.createControl(SBLimitProxyHome.class);
		SBLimitProxyHome limitProfileProxyHome = (SBLimitProxyHome) limitProfileProxyHomeControl.getMock();
		limitProfileProxyHome.create();
		limitProfileProxyHomeControl.setReturnValue(limitProfileProxy);
		limitProfileProxyHomeControl.replay();
		
		bind("SBLimitProxyHome", limitProfileProxyHome);
		
		ConvenantHandlerHelper helper = new ConvenantHandlerHelper();
		OBRecurrentCheckList stg = new OBRecurrentCheckList(20070101000001l,20070101000008l);
		stg.setCheckListID(200811111113l);
		
		IConvenant con = new OBConvenant();
		con.setConvenantID(200811111114l);
		con.setConvenantRef(200811111114l);
		
		stg.setConvenantList(new IConvenant[]{con});
		
		
		MockControl stgBusMgrControl =  MockControl.createControl(SBRecurrentBusManager.class);
		SBRecurrentBusManager stgBusMgr = (SBRecurrentBusManager)stgBusMgrControl.getMock();
		stgBusMgr.create(stg);
		stgBusMgrControl.setReturnValue(stg);
		stgBusMgrControl.replay();
		
		
		
		OBRecurrentCheckListTrxValue  trxValue_cl = new OBRecurrentCheckListTrxValue();
		trxValue_cl.setStagingCheckList(stg);
		trxValue_cl.setFromState("ND");
		trxValue_cl.setInstanceName("RECURRENT_CHECKLIST");
		trxValue_cl.setCheckList(stg);
		trxValue_cl.setReferenceID(String.valueOf(stg.getCheckListID()));

		
		SystemCreateRecurrentCheckListOperation ope = new SystemCreateRecurrentCheckListOperation();
		ope.setStagingRecurrentBusManager(stgBusMgr);
		ICMSTrxResult result = operateUsingDefaultTrxProcess(ope, trxValue_cl);
		trxValue_cl = (OBRecurrentCheckListTrxValue) result.getTrxValue();

		assertEquals("ND", trxValue_cl.getFromState());
		assertNotNull(trxValue_cl.getTransactionID());
		assertEquals("ACTIVE", trxValue_cl.getToState());
		assertEquals("SYSTEM_CREATE_RECURRENT_CHECKLIST", trxValue_cl.getOpDesc());
	}
}

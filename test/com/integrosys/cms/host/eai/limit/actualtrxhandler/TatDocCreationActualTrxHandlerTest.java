package com.integrosys.cms.host.eai.limit.actualtrxhandler;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.Vector;

import junit.framework.TestCase;

import org.easymock.MockControl;

import com.integrosys.cms.app.limit.bus.OBLimitProfile;
import com.integrosys.cms.app.tatdoc.bus.ITatDocBusManager;
import com.integrosys.cms.app.tatdoc.bus.OBTatDoc;
import com.integrosys.cms.app.transaction.ICMSTrxValue;
import com.integrosys.cms.app.transaction.OBCMSTrxValue;
import com.integrosys.cms.app.transaction.SBCMSTrxManager;
import com.integrosys.cms.host.eai.EAIHeader;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.OriginatingBookingLocation;
import com.integrosys.cms.host.eai.limit.AAMessageBody;
import com.integrosys.cms.host.eai.limit.bus.FacilityMaster;
import com.integrosys.cms.host.eai.limit.bus.LimitProfile;
import com.integrosys.cms.host.eai.limit.bus.Limits;
import com.integrosys.cms.host.eai.support.MessageDate;

public class TatDocCreationActualTrxHandlerTest extends TestCase {
	public void testCreateTatDocUponCreate() {
		OBTatDoc mockActualTatDoc = new OBTatDoc();
		mockActualTatDoc.setTatDocID(12345);

		OBTatDoc mockStageTatDoc = new OBTatDoc();
		mockStageTatDoc.setTatDocID(23456);

		MockControl actualTatDocBusMgrControl = MockControl.createControl(ITatDocBusManager.class);
		ITatDocBusManager mockActualTatDocBusMgr = (ITatDocBusManager) actualTatDocBusMgrControl.getMock();
		mockActualTatDocBusMgr.create(new OBTatDoc());
		actualTatDocBusMgrControl.setDefaultReturnValue(mockActualTatDoc);
		mockActualTatDocBusMgr.getTatDocByLimitProfileID(555);
		actualTatDocBusMgrControl.setReturnValue(null);
		mockActualTatDocBusMgr.insertOrRemovePendingPerfectionCreditFolder(new OBTatDoc(), new OBLimitProfile());
		actualTatDocBusMgrControl.setDefaultVoidCallable();
		actualTatDocBusMgrControl.replay();

		MockControl stageTatDocBusMgrControl = MockControl.createControl(ITatDocBusManager.class);
		ITatDocBusManager mockStageTatDocBusMgr = (ITatDocBusManager) stageTatDocBusMgrControl.getMock();
		mockStageTatDocBusMgr.create(new OBTatDoc());
		stageTatDocBusMgrControl.setDefaultReturnValue(mockStageTatDoc);
		stageTatDocBusMgrControl.replay();

		final Set cmsTrxValueHolder = new HashSet();

		TatDocCreationActualTrxHandler handler = new TatDocCreationActualTrxHandler();
		handler.setSourceIdsRequiredCreateTat(new String[] { "RLOS", "CLOS" });
		handler.setActualTatDocBusManager(mockActualTatDocBusMgr);
		handler.setStagingTatDocBusManager(mockStageTatDocBusMgr);
		handler.setWorkflowManager((SBCMSTrxManager) Proxy.newProxyInstance(Thread.currentThread()
				.getContextClassLoader(), new Class[] { SBCMSTrxManager.class }, new InvocationHandler() {

			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				if (method.getName().equals("createTransaction")) {
					assertTrue(ICMSTrxValue.class.isAssignableFrom(args[0].getClass()));
					cmsTrxValueHolder.add(args[0]);
				}

				return null;
			}
		}));

		LimitProfile limitProfile = new LimitProfile();
		limitProfile.setLimitProfileId(555);
		limitProfile.setSolicitorInstructionDate("20090505");
		limitProfile.setOriginatingLocation(new OriginatingBookingLocation("MY", "123"));
		limitProfile.setChangeIndicator("Y");
		limitProfile.setUpdateStatusIndicator("I");

		EAIHeader msgHeader = new EAIHeader();
		msgHeader.setSource("RLOS");

		AAMessageBody aaMsgBody = new AAMessageBody();
		aaMsgBody.setLimitProfile(limitProfile);

		handler.persistActualTrx(new EAIMessage(msgHeader, aaMsgBody));

		ICMSTrxValue tatTrxValue = (ICMSTrxValue) cmsTrxValueHolder.iterator().next();
		assertEquals("12345", tatTrxValue.getReferenceID());
		assertEquals("23456", tatTrxValue.getStagingReferenceID());

		actualTatDocBusMgrControl.verify();
		stageTatDocBusMgrControl.verify();
	}

	public void testCreateTatDocUponUpdate() {
		OBTatDoc mockActualTatDoc = new OBTatDoc();
		mockActualTatDoc.setTatDocID(12345);

		OBTatDoc mockStageTatDoc = new OBTatDoc();
		mockStageTatDoc.setTatDocID(23456);

		MockControl actualTatDocBusMgrControl = MockControl.createControl(ITatDocBusManager.class);
		ITatDocBusManager mockActualTatDocBusMgr = (ITatDocBusManager) actualTatDocBusMgrControl.getMock();
		mockActualTatDocBusMgr.create(new OBTatDoc());
		actualTatDocBusMgrControl.setDefaultReturnValue(mockActualTatDoc);
		mockActualTatDocBusMgr.getTatDocByLimitProfileID(555);
		actualTatDocBusMgrControl.setReturnValue(null);
		mockActualTatDocBusMgr.insertOrRemovePendingPerfectionCreditFolder(new OBTatDoc(), new OBLimitProfile());
		actualTatDocBusMgrControl.setDefaultVoidCallable();
		actualTatDocBusMgrControl.replay();

		MockControl stageTatDocBusMgrControl = MockControl.createControl(ITatDocBusManager.class);
		ITatDocBusManager mockStageTatDocBusMgr = (ITatDocBusManager) stageTatDocBusMgrControl.getMock();
		mockStageTatDocBusMgr.create(new OBTatDoc());
		stageTatDocBusMgrControl.setDefaultReturnValue(mockStageTatDoc);
		stageTatDocBusMgrControl.replay();

		final Set cmsTrxValueHolder = new HashSet();

		TatDocCreationActualTrxHandler handler = new TatDocCreationActualTrxHandler();
		handler.setSourceIdsRequiredCreateTat(new String[] { "RLOS", "CLOS" });
		handler.setActualTatDocBusManager(mockActualTatDocBusMgr);
		handler.setStagingTatDocBusManager(mockStageTatDocBusMgr);
		handler.setWorkflowManager((SBCMSTrxManager) Proxy.newProxyInstance(Thread.currentThread()
				.getContextClassLoader(), new Class[] { SBCMSTrxManager.class }, new InvocationHandler() {

			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				if (method.getName().equals("createTransaction")) {
					assertTrue(ICMSTrxValue.class.isAssignableFrom(args[0].getClass()));
					cmsTrxValueHolder.add(args[0]);
				}

				return null;
			}
		}));

		LimitProfile limitProfile = new LimitProfile();
		limitProfile.setLimitProfileId(555);
		limitProfile.setSolicitorInstructionDate("20090505");
		limitProfile.setOriginatingLocation(new OriginatingBookingLocation("MY", "123"));
		limitProfile.setChangeIndicator("Y");
		limitProfile.setUpdateStatusIndicator("U");

		EAIHeader msgHeader = new EAIHeader();
		msgHeader.setSource("RLOS");

		AAMessageBody aaMsgBody = new AAMessageBody();
		aaMsgBody.setLimitProfile(limitProfile);

		handler.persistActualTrx(new EAIMessage(msgHeader, aaMsgBody));

		ICMSTrxValue tatTrxValue = (ICMSTrxValue) cmsTrxValueHolder.iterator().next();
		assertEquals("12345", tatTrxValue.getReferenceID());
		assertEquals("23456", tatTrxValue.getStagingReferenceID());

		actualTatDocBusMgrControl.verify();
		stageTatDocBusMgrControl.verify();
	}

	public void testUpdateTatDocWithoutUpdateFacMasterUponUpdate() throws Exception {
		OBTatDoc mockActualTatDoc = new OBTatDoc();
		mockActualTatDoc.setTatDocID(12345);

		OBTatDoc mockStageTatDoc = new OBTatDoc();
		mockStageTatDoc.setTatDocID(23456);

		OBCMSTrxValue mockTrxValue = new OBCMSTrxValue();
		mockTrxValue.setReferenceID("12345");
		mockTrxValue.setStagingReferenceID("23456");

		MockControl actualTatDocBusMgrControl = MockControl.createControl(ITatDocBusManager.class);
		ITatDocBusManager mockActualTatDocBusMgr = (ITatDocBusManager) actualTatDocBusMgrControl.getMock();
		mockActualTatDocBusMgr.update(mockActualTatDoc);
		actualTatDocBusMgrControl.setDefaultReturnValue(mockActualTatDoc);
		mockActualTatDocBusMgr.getTatDocByLimitProfileID(555);
		actualTatDocBusMgrControl.setReturnValue(mockActualTatDoc);
		actualTatDocBusMgrControl.replay();

		MockControl stageTatDocBusMgrControl = MockControl.createControl(ITatDocBusManager.class);
		ITatDocBusManager mockStageTatDocBusMgr = (ITatDocBusManager) stageTatDocBusMgrControl.getMock();
		mockStageTatDocBusMgr.getTatDocByID(23456);
		stageTatDocBusMgrControl.setDefaultReturnValue(mockStageTatDoc);
		mockStageTatDocBusMgr.update(mockStageTatDoc);
		stageTatDocBusMgrControl.setReturnValue(mockStageTatDoc);
		stageTatDocBusMgrControl.replay();

		MockControl workflowMgrControl = MockControl.createControl(SBCMSTrxManager.class);
		SBCMSTrxManager mockWorkflowMgr = (SBCMSTrxManager) workflowMgrControl.getMock();
		mockWorkflowMgr.findTrxByRefIDAndTrxType("12345", "TAT_DOC");
		workflowMgrControl.setReturnValue(mockTrxValue);
		workflowMgrControl.replay();

		TatDocCreationActualTrxHandler handler = new TatDocCreationActualTrxHandler();
		handler.setSourceIdsRequiredCreateTat(new String[] { "RLOS", "CLOS" });
		handler.setSourceIdsRequiredUpdateTat(new String[] { "RLOS", "CLOS" });
		handler.setRequiredUpdateFacilityMasterInstructedDateUponUpdate(false);
		handler.setActualTatDocBusManager(mockActualTatDocBusMgr);
		handler.setStagingTatDocBusManager(mockStageTatDocBusMgr);
		handler.setWorkflowManager(mockWorkflowMgr);

		LimitProfile limitProfile = new LimitProfile();
		limitProfile.setLimitProfileId(555);
		limitProfile.setSolicitorInstructionDate("20090505");
		limitProfile.setOriginatingLocation(new OriginatingBookingLocation("MY", "123"));
		limitProfile.setChangeIndicator("Y");
		limitProfile.setUpdateStatusIndicator("U");

		EAIHeader msgHeader = new EAIHeader();
		msgHeader.setSource("RLOS");

		AAMessageBody aaMsgBody = new AAMessageBody();
		aaMsgBody.setLimitProfile(limitProfile);

		handler.persistActualTrx(new EAIMessage(msgHeader, aaMsgBody));

		assertEquals("20090505", MessageDate.getInstance().getString(mockActualTatDoc.getSolicitorInstructionDate()));
		assertEquals("20090505", MessageDate.getInstance().getString(mockStageTatDoc.getSolicitorInstructionDate()));

		actualTatDocBusMgrControl.verify();
		stageTatDocBusMgrControl.verify();
		workflowMgrControl.verify();
	}

	public void testUpdateTatDocWithUpdateFacMasterUponUpdate() throws Exception {
		OBTatDoc mockActualTatDoc = new OBTatDoc();
		mockActualTatDoc.setTatDocID(12345);

		OBTatDoc mockStageTatDoc = new OBTatDoc();
		mockStageTatDoc.setTatDocID(23456);

		OBCMSTrxValue mockTrxValue = new OBCMSTrxValue();
		mockTrxValue.setReferenceID("12345");
		mockTrxValue.setStagingReferenceID("23456");

		MockControl actualTatDocBusMgrControl = MockControl.createControl(ITatDocBusManager.class);
		ITatDocBusManager mockActualTatDocBusMgr = (ITatDocBusManager) actualTatDocBusMgrControl.getMock();
		mockActualTatDocBusMgr.update(mockActualTatDoc);
		actualTatDocBusMgrControl.setDefaultReturnValue(mockActualTatDoc);
		mockActualTatDocBusMgr.getTatDocByLimitProfileID(555);
		actualTatDocBusMgrControl.setReturnValue(mockActualTatDoc);
		actualTatDocBusMgrControl.replay();

		MockControl stageTatDocBusMgrControl = MockControl.createControl(ITatDocBusManager.class);
		ITatDocBusManager mockStageTatDocBusMgr = (ITatDocBusManager) stageTatDocBusMgrControl.getMock();
		mockStageTatDocBusMgr.getTatDocByID(23456);
		stageTatDocBusMgrControl.setDefaultReturnValue(mockStageTatDoc);
		mockStageTatDocBusMgr.update(mockStageTatDoc);
		stageTatDocBusMgrControl.setReturnValue(mockStageTatDoc);
		stageTatDocBusMgrControl.replay();

		MockControl workflowMgrControl = MockControl.createControl(SBCMSTrxManager.class);
		SBCMSTrxManager mockWorkflowMgr = (SBCMSTrxManager) workflowMgrControl.getMock();
		mockWorkflowMgr.findTrxByRefIDAndTrxType("12345", "TAT_DOC");
		workflowMgrControl.setReturnValue(mockTrxValue);
		workflowMgrControl.replay();

		TatDocCreationActualTrxHandler handler = new TatDocCreationActualTrxHandler();
		handler.setSourceIdsRequiredCreateTat(new String[] { "RLOS", "CLOS" });
		handler.setSourceIdsRequiredUpdateTat(new String[] { "RLOS", "CLOS" });
		handler.setRequiredUpdateFacilityMasterInstructedDateUponUpdate(true);
		handler.setActualTatDocBusManager(mockActualTatDocBusMgr);
		handler.setStagingTatDocBusManager(mockStageTatDocBusMgr);
		handler.setWorkflowManager(mockWorkflowMgr);

		FacilityMaster fac = new FacilityMaster();
		Limits limit = new Limits();
		limit.setFacilityMaster(fac);

		FacilityMaster fac1 = new FacilityMaster();
		Limits limit1 = new Limits();
		limit1.setFacilityMaster(fac1);

		LimitProfile limitProfile = new LimitProfile();
		limitProfile.setLimitProfileId(555);
		limitProfile.setSolicitorInstructionDate("20090505");
		limitProfile.setOriginatingLocation(new OriginatingBookingLocation("MY", "123"));
		limitProfile.setChangeIndicator("Y");
		limitProfile.setUpdateStatusIndicator("U");

		EAIHeader msgHeader = new EAIHeader();
		msgHeader.setSource("CLOS");

		AAMessageBody aaMsgBody = new AAMessageBody();
		aaMsgBody.setLimitProfile(limitProfile);
		aaMsgBody.setLimits(new Vector(Arrays.asList(new Limits[] { limit, limit1 })));

		handler.persistActualTrx(new EAIMessage(msgHeader, aaMsgBody));

		assertEquals("20090505", MessageDate.getInstance().getString(mockActualTatDoc.getSolicitorInstructionDate()));
		assertEquals("20090505", MessageDate.getInstance().getString(mockStageTatDoc.getSolicitorInstructionDate()));
		assertEquals(mockActualTatDoc.getSolicitorInstructionDate(), fac.getJDOInstructedDate());
		assertEquals(mockActualTatDoc.getSolicitorInstructionDate(), fac1.getJDOInstructedDate());

		actualTatDocBusMgrControl.verify();
		stageTatDocBusMgrControl.verify();
		workflowMgrControl.verify();
	}
}

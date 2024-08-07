package com.integrosys.cms.host.eai.castor;

import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import junit.framework.TestCase;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.host.eai.EAIHeader;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.core.IEaiMessageValidator;
import com.integrosys.cms.host.eai.document.DocumentInputMessageBody;
import com.integrosys.cms.host.eai.document.bus.CCChecklist;
import com.integrosys.cms.host.eai.document.bus.CheckList;
import com.integrosys.cms.host.eai.document.bus.SCChecklist;
import com.integrosys.cms.host.eai.document.inquiry.checklist.ChecklistCriteria;
import com.integrosys.cms.host.eai.document.inquiry.checklist.DocChecklistInquiryMsgBody;
import com.integrosys.cms.host.eai.document.inquiry.checklist.DocChecklistResponseMsgBody;
import com.integrosys.cms.host.eai.document.inquiry.template.CheckListTemplate;
import com.integrosys.cms.host.eai.document.inquiry.template.CheckListTemplateInquiryMsgBody;
import com.integrosys.cms.host.eai.document.inquiry.template.CheckListTemplateResponseMsgBody;
import com.integrosys.cms.host.eai.document.inquiry.template.ChecklistTemplateCriteria;
import com.integrosys.cms.host.eai.document.validator.CheckListValidator;
import com.integrosys.cms.host.eai.security.SecurityMessageBody;
import com.integrosys.cms.host.eai.security.bus.ApprovedSecurity;
import com.integrosys.cms.host.eai.security.bus.cash.CashDeposit;
import com.integrosys.cms.host.eai.security.bus.document.DocumentSecurity;
import com.integrosys.cms.host.eai.security.bus.guarantee.GuaranteeSecurity;
import com.integrosys.cms.host.eai.security.bus.insurance.InsuranceSecurity;
import com.integrosys.cms.host.eai.security.bus.marketable.MarketableSecurity;
import com.integrosys.cms.host.eai.security.bus.marketable.PortfolioItem;
import com.integrosys.cms.host.eai.security.bus.property.PropertySecurity;

/**
 * @author Chong Jun Yong
 * 
 */
public class EAICastorHelperTest extends TestCase {

	public void setUp() {
		Log4jConfigTestPlugin.configure();
	}

	private List getValidatorList() {
		List result = new ArrayList();
		result.add(new CheckListValidator());
		return result;
	}

	private List getDocChkResponseValidatorList() {
		List result = new ArrayList();
		return result;
	}

	public void testUnmarshallDocumentInput() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("document-input.cm.xml");

		URL messageUrl = ctxClassLoader.getResource("DC003-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl.getPath(), EAIMessage.class);

		assertNotNull(a);
		assertTrue(a.getMsgBody() instanceof DocumentInputMessageBody);

		DocumentInputMessageBody dim = (DocumentInputMessageBody) a.getMsgBody();
		CheckList ctc = dim.getCheckList();
		assertNotNull(ctc);

		CCChecklist cc = ctc.getCcChecklist();
		assertNotNull(cc);

		SCChecklist sc = ctc.getScChecklist();
		assertNotNull(sc);

		String xmlMessage = castorHelper.marshal(mappingUrl, a, EAIMessage.class);
		assertNotNull(xmlMessage);

		assertTrue(xmlMessage.indexOf("msgHeader") > 0);
	}

	public void testUnmarshallDocumentInquiry() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("document-inquiry.cm.xml");

		URL messageUrl = ctxClassLoader.getResource("DC001I-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl.getPath(), EAIMessage.class);

		assertNotNull(a);
		assertTrue(a.getMsgBody() instanceof CheckListTemplateInquiryMsgBody);

		CheckListTemplateInquiryMsgBody dim = (CheckListTemplateInquiryMsgBody) a.getMsgBody();
		ChecklistTemplateCriteria ctc = dim.getChecklistTemplateCriteria();
		assertNotNull(ctc);

		String xmlMessage = castorHelper.marshal(mappingUrl, a, EAIMessage.class);
		assertNotNull(xmlMessage);
		System.out.println(xmlMessage + "\n\n");

		assertTrue(xmlMessage.indexOf("msgHeader") > 0);
	}

	public void testUnmarshallDocumentResponse() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("document-response.cm.xml");

		URL messageUrl = ctxClassLoader.getResource("DC001R-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl.getPath(), EAIMessage.class);

		CheckListTemplateResponseMsgBody drm = (CheckListTemplateResponseMsgBody) a.getMsgBody();
		CheckListTemplate ct = drm.getCheckListTemplate();
		assertNotNull(ct);
		Vector cti = drm.getChecklistTemplateItem();
		assertNotNull(cti);

		assertNotNull(a);
		assertTrue(a.getMsgBody() instanceof CheckListTemplateResponseMsgBody);

		String xmlMessage = castorHelper.marshal(mappingUrl, a, EAIMessage.class);
		assertNotNull(xmlMessage);
		System.out.println(xmlMessage + "\n\n");

		assertTrue(xmlMessage.indexOf("msgHeader") > 0);
	}

	public void testUnmarshallDocChecklistInquiry() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("document-chkInquiry.cm.xml");

		URL messageUrl = ctxClassLoader.getResource("DC002I-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl.getPath(), EAIMessage.class);

		assertNotNull(a);
		assertTrue(a.getMsgBody() instanceof DocChecklistInquiryMsgBody);

		EAIHeader b = (EAIHeader) a.getMsgHeader();

		DocChecklistInquiryMsgBody dim = (DocChecklistInquiryMsgBody) a.getMsgBody();
		ChecklistCriteria ctc = dim.getChecklistCriteria();
		assertNotNull(ctc);

		String xmlMessage = castorHelper.marshal(mappingUrl, a, EAIMessage.class);
		assertNotNull(xmlMessage);
		System.out.println(xmlMessage + "\n\n");

		assertTrue(xmlMessage.indexOf("msgHeader") > 0);
	}

	public void testUnmarshallDocChecklistResponse() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("document-chkResponse.cm.xml");

		URL messageUrl = ctxClassLoader.getResource("DC002R-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl.getPath(), EAIMessage.class);

		DocChecklistResponseMsgBody drm = (DocChecklistResponseMsgBody) a.getMsgBody();
		assertNotNull(drm);
		CheckList dc = drm.getCheckList();
		assertNotNull(dc);
		Vector dci = drm.getCheckListItem();
		assertNotNull(dci);

		assertNotNull(a);
		assertTrue(a.getMsgBody() instanceof DocChecklistResponseMsgBody);

		String xmlMessage = castorHelper.marshal(mappingUrl, a, EAIMessage.class);
		assertNotNull(xmlMessage);
		System.out.println(xmlMessage + "\n\n");

		List validatorList = getDocChkResponseValidatorList();
		if (validatorList == null) {
			return;
		}

		try {
			for (Iterator iter = validatorList.iterator(); iter.hasNext();) {
				IEaiMessageValidator sciV = (IEaiMessageValidator) iter.next();
				System.out.println("Inside validator list = " + sciV);
				sciV.validate(a);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			fail(e.getMessage());
		}

		assertTrue(xmlMessage.indexOf("msgHeader") > 0);
	}

	public void testUnmarshallCollateralAllMappingXml() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		/**
		 * EaiMapping-collateral_Master.xml CO002.xml
		 */
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-collateral_Master.xml");

		URL messageUrl = ctxClassLoader.getResource("CO002.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);

		assertNotNull(a);
		a.getMsgBody();
		SecurityMessageBody colMsgbody = (SecurityMessageBody) a.getMsgBody();
		assertNotNull(colMsgbody);

		Vector vDep = colMsgbody.getDepositDetail();
		for (int i = 0; i < vDep.size(); i++) {
			CashDeposit cd = (CashDeposit) vDep.get(i);
			assertEquals(new Character('A'), cd.getOwnOtherBankInd());

		}

	}

	public void testUnmarshallCollateralGuaranteeMappingXml() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		/**
		 * EaiMapping-collateral_Master.xml CO004.xml
		 */
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-collateral_Master.xml");

		URL messageUrl = ctxClassLoader.getResource("CO004.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);

		assertNotNull(a);
		a.getMsgBody();
		SecurityMessageBody colMsgbody = (SecurityMessageBody) a.getMsgBody();
		assertNotNull(colMsgbody);
		GuaranteeSecurity gs = colMsgbody.getGuaranteeDetail();

	}

	public void testUnmarshallCollateralMarketMappingXml() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		/**
		 * EaiMapping-collateral_Master.xml CO006.xml
		 */
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-collateral_Master.xml");

		URL messageUrl = ctxClassLoader.getResource("CO006.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);

		assertNotNull(a);
		a.getMsgBody();
		SecurityMessageBody colMsgbody = (SecurityMessageBody) a.getMsgBody();
		assertNotNull(colMsgbody);
		MarketableSecurity ms = colMsgbody.getMarketableSecDetail();
		Vector fi = colMsgbody.getPortfolioItems();
		for (int i = 0; i < fi.size(); i++) {
			PortfolioItem pf = (PortfolioItem) fi.get(i);
		}

	}

	public void testUnmarshallCollateralPropertyMappingXml() {
		/**
		 * EaiMapping-collateral_Master.xml CO008.xml
		 */
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-collateral_Master.xml");

		// URL messageUrl = ctxClassLoader.getResource("CO008-Skeleton_tr.xml");
		URL messageUrl = ctxClassLoader.getResource("CO008.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);

		assertNotNull(a);
		a.getMsgBody();
		SecurityMessageBody colMsgbody = (SecurityMessageBody) a.getMsgBody();
		PropertySecurity ps = colMsgbody.getPropertyDetail();
		assertNotNull(ps.getPropertyUsage().getStandardCodeValue());
		assertNotNull(colMsgbody);

	}

	// public void testUnmarshallCovenantMappingXml() {
	/**
	 * EaiMapping-Covenant_Master.xml CV001.xml
	 */
	/*
	 * ClassLoader ctxClassLoader =
	 * Thread.currentThread().getContextClassLoader(); URL mappingUrl =
	 * ctxClassLoader.getResource("EaiMapping-Covenant_Master.xml");
	 * 
	 * URL messageUrl = ctxClassLoader.getResource("CV001-Skeleton.xml");
	 * 
	 * EAICastorHelper castorHelper = EAICastorHelper.getInstance(); EAIMessage
	 * a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl,
	 * EAIMessage.class); assertNotNull(a);
	 * 
	 * CovenantMessageBody covMsgBdy = (CovenantMessageBody) a.getMsgBody();
	 * assertNotNull(covMsgBdy);
	 * 
	 * RecurrentDoc recurrentDoc = (RecurrentDoc) covMsgBdy.getRecurrentDoc();
	 * assertNotNull(recurrentDoc);
	 * 
	 * assertTrue(recurrentDoc.getConvenantItems().size() > 0); CovenantItem
	 * covItem = (CovenantItem)
	 * covMsgBdy.getRecurrentDoc().getConvenantItems().get(0);
	 * assertEquals("11112008", covItem.getDocEndDate());
	 * assertNotNull(covItem.getJDODocEndDate());
	 * 
	 * }
	 */

	public void testUnmarshallCollateralDocumentationMappingXml() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		/**
		 * EaiMapping-collateral_Master.xml EaiMapping-collateral_Master.xml
		 * CO003.xml
		 */
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-collateral_Master.xml");

		URL messageUrl = ctxClassLoader.getResource("CO003.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);

		assertNotNull(a);
		a.getMsgBody();
		SecurityMessageBody colMsgbody = (SecurityMessageBody) a.getMsgBody();
		assertNotNull(colMsgbody);
		DocumentSecurity gs = colMsgbody.getDocumentationDetail();
		assertNotNull(gs);
		assertNotNull(gs.getLOSSecurityId());
		assertNotNull(gs.getISDADate());
		assertNotNull(gs);

	}

	public void testUnmarshallAAMappingXml() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		/**
		 * AA001 - EaiMapping-aa_Master.xml CO001 -
		 * EaiMapping-collateral_Master.xml
		 */
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-aa_Master.xml");

		URL messageUrl = ctxClassLoader.getResource("CA0001-tr.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);

		assertNotNull(a);
		assertNotNull(a.getMsgBody());

	}

	public void testUnmarshallAAFromBAMappingXml() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		/**
		 * Un-Marshalling the xml from BA CA001 - EaiMapping-aa_Master.xml CO001
		 * - EaiMapping-collateral_Master.xml
		 */
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-aa_Master.xml");

		URL messageUrl = ctxClassLoader.getResource("wpooi-CA0001.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);

		assertNotNull(a);
		assertNotNull(a.getMsgBody());

	}

	public void testUnmarshallCollateralInsuranceMappingXml() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		/**
		 * EaiMapping-collateral_Master.xml EaiMapping-collateral_Master.xml
		 * CO005.xml
		 */
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-collateral_Master.xml");

		URL messageUrl = ctxClassLoader.getResource("CO005-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);

		assertNotNull(a);
		a.getMsgBody();
		SecurityMessageBody colMsgbody = (SecurityMessageBody) a.getMsgBody();
		ApprovedSecurity as = colMsgbody.getSecurityDetail();
		assertNotNull(as.getOriginalCurrency());
		assertNotNull(colMsgbody);
		InsuranceSecurity is = colMsgbody.getInsuranceDetail();
		assertNotNull(is);
		System.out.println("***>>>" + as.getOriginalCurrency());
		assertNotNull(is.getEffectiveDate());

	}
}

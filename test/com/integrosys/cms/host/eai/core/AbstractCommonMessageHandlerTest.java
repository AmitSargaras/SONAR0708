package com.integrosys.cms.host.eai.core;

import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.Message;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;
import com.integrosys.cms.host.eai.document.EAIDocumentInputHelper;
import com.integrosys.cms.host.eai.document.bus.CheckList;
import com.integrosys.cms.host.eai.document.bus.CheckListItem;
import com.integrosys.cms.host.eai.document.validator.CheckListValidator;

public class AbstractCommonMessageHandlerTest extends CustomHibernateTestCase {

	Message msg;

	EAIMessage eaiMsg;

	HashMap flatMessage;

	static int testCtr = 0;

	protected String[] getMappingResources() {
		return new String[] { "EAI-Document-Checklist.hbm.xml" };
	}

	private List getValidatorList() {
		List result = new ArrayList();
		result.add(new CheckListValidator());
		return result;
	}

	private EAIMessage initiateEAIMsg() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("document-input.cm.xml");

		URL messageUrl = ctxClassLoader.getResource("DC003-Skeleton.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage eaiMsg = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl.getPath(), EAIMessage.class);
		return eaiMsg;
	}

	/**
	 * This method will execute all validator configured (in property file)
	 * under a "specific message" (e.g. Under Customer Message we have :
	 * LimitValidator, SubProfileValidator , etc ...)
	 */
	public void testValidateMessage() {
		EAIMessage a = initiateEAIMsg();
		List validatorList = getValidatorList();
		if (validatorList == null) {
			return;
		}

		try {
			for (Iterator iter = getValidatorList().iterator(); iter.hasNext();) {
				IEaiMessageValidator sciV = (IEaiMessageValidator) iter.next();
				sciV.validate(a);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			fail("Error validating eaiMessage");
		}

	}

	public void testHibernateCheckList() {
		eaiMsg = initiateEAIMsg();
		CheckList checkList = EAIDocumentInputHelper.getInstance().retrieveCheckList(eaiMsg);
		if (checkList == null)
			System.out.println("CheckList is NULL!");
		else
			try {
				if (getHibernateTemplate() == null)
					System.out.println("HibernateTemplate is NULL!!");
				else {
					Long id = (Long) getHibernateTemplate().save(checkList);
					assertNotNull(id);
					CheckList temp = null;
					temp = (CheckList) getHibernateTemplate().load(CheckList.class, id);
					assertNotNull(temp);
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				fail("Error in storing actual database with Hibernate");
			}
	}

	public void testHibernateCheckListItems() {
		eaiMsg = initiateEAIMsg();
		CheckList checkList = EAIDocumentInputHelper.getInstance().retrieveCheckList(eaiMsg);
		if (checkList == null)
			System.out.println("CheckList is NULL!");
		else if (checkList.getCheckListItem() != null)
			try {
				Vector items = checkList.getCheckListItem();
				if (items == null)
					items = new Vector();
				Iterator it = items.iterator();
				// while (it.hasNext()) {
				CheckListItem checkListItem = (CheckListItem) it.next();
				Long id = (Long) getHibernateTemplate().save(checkListItem);
				assertNotNull(id);
				CheckListItem temp = null;
				temp = (CheckListItem) getHibernateTemplate().load(CheckListItem.class, id);
				assertNotNull(temp);
				// }
			}
			catch (Exception e) {
				e.printStackTrace();
				fail("Error in storing actual database with Hibernate");
			}
	}

}

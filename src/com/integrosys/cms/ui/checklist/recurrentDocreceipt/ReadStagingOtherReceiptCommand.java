/**
 * Copyright Integro Technologies Pte Ltd
 * $Header:
 */
package com.integrosys.cms.ui.checklist.recurrentDocreceipt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.struts.util.LabelValueBean;

import com.integrosys.base.businfra.search.SearchResult;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.AbstractCommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.app.checklist.bus.ICheckList;
import com.integrosys.cms.app.checklist.bus.ICheckListItem;
import com.integrosys.cms.app.checklist.proxy.CheckListProxyManagerFactory;
import com.integrosys.cms.app.checklist.proxy.ICheckListProxyManager;
import com.integrosys.cms.app.checklist.trx.ICheckListTrxValue;
import com.integrosys.cms.app.chktemplate.bus.CheckListTemplateException;
import com.integrosys.cms.app.chktemplate.bus.DocumentSearchCriteria;
import com.integrosys.cms.app.chktemplate.bus.DocumentSearchResultItem;
import com.integrosys.cms.app.chktemplate.proxy.CheckListTemplateProxyManagerFactory;
import com.integrosys.cms.app.chktemplate.proxy.ICheckListTemplateProxyManager;
import com.integrosys.cms.app.creditApproval.bus.ICreditApproval;
import com.integrosys.cms.app.customer.bus.CustomerDAOFactory;
import com.integrosys.cms.app.customer.bus.ICustomerDAO;
import com.integrosys.cms.ui.checklist.CheckListHelper;
import com.integrosys.cms.ui.checklist.SharedDocumentsHelper;
import com.integrosys.cms.ui.common.LegalFirmList;
import com.integrosys.cms.ui.manualinput.CommonUtil;

/**
 * @author $Author: czhou $<br>
 * @version $Revision: 1.13 $
 * @since $Date: 2006/07/20 06:19:09 $ Tag: $Name: $
 */
public class ReadStagingOtherReceiptCommand extends AbstractCommand implements ICommonEventConstant {
	/**
	 * Default Constructor
	 */
	public ReadStagingOtherReceiptCommand() {
	}

	/**
	 * Defines an two dimensional array with the result list to be expected as a
	 * result from the doExecute method using a HashMap syntax for the array is
	 * (HashMapkey,classname,scope) The scope may be request,form or service
	 * 
	 * @return the two dimensional String array
	 */
	public String[][] getParameterDescriptor() {
		return (new String[][] { { "custTypeTrxID", "java.lang.String", REQUEST_SCOPE },
				{ ICommonEventConstant.EVENT, "java.lang.String", REQUEST_SCOPE },
				{ "forwardUser", "java.lang.String", REQUEST_SCOPE } // +OFFICE
		});
	}

	/**
	 * Defines an two dimensional array with the result list to be expected as a
	 * result from the doExecute method using a HashMap syntax for the array is
	 * (HashMapkey,classname,scope) The scope may be request,form or service
	 * 
	 * @return the two dimensional String array
	 */
	public String[][] getResultDescriptor() {
		return (new String[][] {
				{ "checkListTrxVal", "com.integrosys.cms.app.checklist.trx.ICheckListTrxValue", SERVICE_SCOPE },
				{ "ownerObj", "com.integrosys.cms.app.checklist.bus.OBCollateralCheckListOwner", FORM_SCOPE },
				{ "checkList", "com.integrosys.cms.app.checklist.bus.ICheckList", SERVICE_SCOPE },
				{ "checkListForm", "com.integrosys.cms.app.checklist.bus.OBCheckList" ,FORM_SCOPE},
				{ "flag", "java.lang.String", REQUEST_SCOPE }, { "frame", "java.lang.String", SERVICE_SCOPE },
				{ "legalFirmLabels", "java.util.Collection", REQUEST_SCOPE },
				{ "legalFirmValues", "java.util.Collection", REQUEST_SCOPE },
				{ "deferCreditApproverList", "java.util.List", SERVICE_SCOPE },
				{ "waiverCreditApproverList", "java.util.List", SERVICE_SCOPE },
				{ "custTrxDtList", "java.util.HashMap", SERVICE_SCOPE },
				{ "stockDocChkList", "java.util.HashMap", SERVICE_SCOPE },
				{ "transactionHistoryList", "java.util.List", SERVICE_SCOPE },
				{ "forwardCollection", "java.util.Collection", REQUEST_SCOPE } // +
																				// OFFICE
		});
	}

	/**
	 * This method does the Business operations with the HashMap and put the
	 * results back into the HashMap.Here creation for Company Borrower is done.
	 * 
	 * @param map is of type HashMap
	 * @return HashMap with the Result
	 */
	public HashMap doExecute(HashMap map) throws CommandProcessingException, CommandValidationException {
		HashMap returnMap = new HashMap();
		HashMap resultMap = new HashMap();
		DefaultLogger.debug(this, "Inside doExecute()");
		try {
			String custTypeTrxID = (String) map.get("custTypeTrxID");
			String event = (String) map.get(ICommonEventConstant.EVENT);
			DefaultLogger.debug(this, "TrxiD before backend call" + custTypeTrxID);
			ICheckListProxyManager proxy = CheckListProxyManagerFactory.getCheckListProxyManager();
			ICheckListTrxValue checkListTrxVal = proxy.getCheckListByTrxID(custTypeTrxID);

			List transactionHistoryList= new ArrayList();
			 ICustomerDAO customerDAO = CustomerDAOFactory.getDAO();
			 transactionHistoryList = customerDAO.getTransactionHistoryList(checkListTrxVal.getTransactionID());
			 resultMap.put("transactionHistoryList", transactionHistoryList);
			// Sorts checklist before putting into resultMap
			ICheckList checkList = checkListTrxVal.getStagingCheckList();
			SharedDocumentsHelper.mergeViewableCheckListItemIntoStaging(checkListTrxVal.getCheckList(), checkList); // R1
																													// .5
																													// CR17
			ICheckListItem[] sortedItems = CheckListHelper.sortByParentPrefix(checkList.getCheckListItemList());
			checkList.setCheckListItemList(sortedItems);

			ICheckListTemplateProxyManager proxy2 = CheckListTemplateProxyManagerFactory.getCheckListTemplateProxyManager();
			HashMap stockDocChkList = new HashMap();
			DocumentSearchCriteria criteria = new DocumentSearchCriteria();
			criteria.setDocumentType("REC");
		//	String[] splitList = chkTemplateType.split("-");
			SearchResult sr = null;
			try {
				sr = proxy2.getDocumentItemList(criteria);
			}
			catch (CheckListTemplateException ex) {
				throw new CommandProcessingException("failed to retrieve document item list using criteria [" + criteria
						+ "]", ex);
			}

			if (sr != null && sr.getResultList() != null) {
				java.util.Vector vector= (java.util.Vector) sr.getResultList();
				for(int i=0;i<vector.size();i++){
					DocumentSearchResultItem resultItem=(DocumentSearchResultItem)vector.get(i);
					if("STOCK_STATEMENT".equals(resultItem.getStatementType())){
						stockDocChkList.put(resultItem.getItemCode(), resultItem.getItemCode());		
					}
				}
				
			}

			resultMap.put("stockDocChkList", stockDocChkList);
			resultMap.put("checkList", checkListTrxVal.getStagingCheckList());
			resultMap.put("checkListTrxVal", checkListTrxVal);
			resultMap.put("ownerObj", checkListTrxVal.getStagingCheckList().getCheckListOwner());
			resultMap.put("flag", "Edit");
			if ("close_checklist_item".equals(event)) {
				resultMap.put("flag", "Close");
			}
			if ("cancel_checklist_item".equals(event)) {
				resultMap.put("flag", "Cancel");
			}
			resultMap.put("frame", "false");// used to hide frames when user
											// comes from to do list
			if ("to_track".equals(event)) {
				resultMap.put("flag", "To Track");
			}
			/*// CR-380 starts
			String countryCode = "none";
			// ICheckList checkList =(ICheckList)
			// checkListTrxVal.getStagingCheckList();
			if ((checkList != null) && (checkList.getCheckListLocation() != null)
					&& (checkList.getCheckListLocation().getCountryCode() != null)) {
				countryCode = checkList.getCheckListLocation().getCountryCode();
				// System.out.println("Country Code Cmd Class????????:"+
				// countryCode);
			}
			LegalFirmList legalFirmList = LegalFirmList.getInstance(countryCode);
			resultMap.put("legalFirmLabels", legalFirmList.getLegalFirmLabel());
			resultMap.put("legalFirmValues", legalFirmList.getLegalFirmProperty());
			// CR-380 ends
*/
			resultMap.put("forwardCollection", checkListTrxVal.getNextRouteCollection()); // +
																							// OFFICE
		}
		catch (Exception e) {
			DefaultLogger.debug(this, "got exception in doExecute" + e);
			e.printStackTrace();
			throw (new CommandProcessingException(e.getMessage()));
		}
		resultMap.put("deferCreditApproverList", getAllDeferCreditApprover());
		resultMap.put("waiverCreditApproverList", getAllWaiveCreditApprover());
		DefaultLogger.debug(this, "Going out of doExecute()");
		returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
		return returnMap;
	}
	
	private List getAllDeferCreditApprover() {
		List lbValList = new ArrayList();
		try {
			
			ICheckListProxyManager proxy = CheckListProxyManagerFactory.getCheckListProxyManager();
			
			List defer = (List)proxy.getAllDeferCreditApprover();
			
			//List idList = (List) getCityProxy().getCityList(stateId);				
		
			for (int i = 0; i < defer.size(); i++) {
				ICreditApproval creditApproval = (ICreditApproval)defer.get(i);
				
					String id = creditApproval.getApprovalCode();
					String val = creditApproval.getApprovalName();
					LabelValueBean lvBean = new LabelValueBean(val, id);
					lbValList.add(lvBean);
				
			}
		} catch (Exception ex) {
		}
		return CommonUtil.sortDropdown(lbValList);
	}
	
	private List getAllWaiveCreditApprover() {
		List lbValList = new ArrayList();
		try {
			
			ICheckListProxyManager proxy = CheckListProxyManagerFactory.getCheckListProxyManager();
			
			List waive = (List)proxy.getAllWaiveCreditApprover();
			
			//List idList = (List) getCityProxy().getCityList(stateId);				
		
			for (int i = 0; i < waive.size(); i++) {
				ICreditApproval creditApproval = (ICreditApproval)waive.get(i);
				
					String id = creditApproval.getApprovalCode();
					String val = creditApproval.getApprovalName();
					LabelValueBean lvBean = new LabelValueBean(val, id);
					lbValList.add(lvBean);
				
			}
		} catch (Exception ex) {
		}
		return CommonUtil.sortDropdown(lbValList);
	}
}

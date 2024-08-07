package com.integrosys.cms.ui.caseCreationUpdate;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;

import org.apache.commons.lang.StringUtils;

import com.integrosys.base.businfra.search.SearchResult;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.AbstractCommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.app.caseCreationUpdate.bus.CaseCreationException;
import com.integrosys.cms.app.caseCreationUpdate.bus.OBCaseCreation;
import com.integrosys.cms.app.caseCreationUpdate.proxy.ICaseCreationProxyManager;
import com.integrosys.cms.app.customer.bus.CustomerDAO;
import com.integrosys.cms.app.customer.bus.ICMSCustomer;
import com.integrosys.cms.app.customer.proxy.CustomerProxyFactory;
import com.integrosys.cms.app.customer.proxy.ICustomerProxy;
import com.integrosys.cms.app.limit.bus.ILimitProfile;
import com.integrosys.cms.app.transaction.OBTrxContext;
import com.integrosys.cms.ui.common.constant.IGlobalConstant;
import com.integrosys.cms.ui.login.CMSGlobalSessionConstant;
import com.integrosys.component.user.app.bus.ICommonUser;

/**
 $Author: Abhijit R $
 Command for list CaseCreation
 */
public class SearchListCaseCreationCommand extends AbstractCommand implements ICommonEventConstant {

	/**
	 * Default Constructor
	 */
	
	private ICaseCreationProxyManager caseCreationProxy;

	public ICaseCreationProxyManager getCaseCreationProxy() {
		return caseCreationProxy;
	}

	public void setCaseCreationProxy(ICaseCreationProxyManager caseCreationProxy) {
		this.caseCreationProxy = caseCreationProxy;
	}

	public SearchListCaseCreationCommand() {
		
	}
	
	public String[][] getParameterDescriptor() {
		return new String[][] {
				{ "startIndex", "java.lang.String", REQUEST_SCOPE },
				{ "totalCount", "java.lang.String", REQUEST_SCOPE },
				{ IGlobalConstant.USER, "com.integrosys.component.user.app.bus.ICommonUser", GLOBAL_SCOPE },
				{ IGlobalConstant.USER_TEAM, "com.integrosys.component.bizstructure.app.bus.ITeam", GLOBAL_SCOPE },
				{ "locale", "java.util.Locale", REQUEST_SCOPE },
				{ "event", "java.lang.String", REQUEST_SCOPE },
				{ "partyName", "java.lang.String", REQUEST_SCOPE },
				{ "caseId", "java.lang.String", REQUEST_SCOPE },
				{ "segment", "java.lang.String", REQUEST_SCOPE },
				{ "region", "java.lang.String", REQUEST_SCOPE },
				{ "status", "java.lang.String", REQUEST_SCOPE },
				{ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ, "com.integrosys.cms.app.limit.bus.ILimitProfile",
					GLOBAL_SCOPE },
			{ IGlobalConstant.GLOBAL_CUSTOMER_OBJ, "com.integrosys.cms.app.customer.bus.ICMSCustomer", GLOBAL_SCOPE },
				{ CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID, "java.lang.String", GLOBAL_SCOPE },
				
				
			};
	}
	   public String[][] getResultDescriptor() {
	        return (new String[][]{
	                {"caseCreationUpdateList", "com.integrosys.base.businfra.search.SearchResult", REQUEST_SCOPE},
					{ "event", "java.lang.String", REQUEST_SCOPE },
					{"customerMap", "java.util.HashMap", SERVICE_SCOPE},
					{ "startIndex", "java.lang.String", REQUEST_SCOPE },
	                {com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY, "java.util.Locale", GLOBAL_SCOPE}
	        });
	    }

	    /**
	     * This method does the Business operations  with the HashMap and put the results back into
	     * the HashMap.
	     *
	     * @param map is of type HashMap
	     * @return HashMap with the Result
	     */
	    public HashMap doExecute(HashMap map) throws CommandProcessingException, CommandValidationException {
	        HashMap returnMap = new HashMap();
	        HashMap resultMap = new HashMap();
	        String startIndex = (String) map.get("startIndex");
	        int stindex = 0;
	       // ILimitProfile limit = (ILimitProfile) map.get(IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
			//long limitProfileID = limit.getLimitProfileID();
			// DefaultLogger.debug(this,"Limit profile "+limit);
			//ICMSCustomer cust = (ICMSCustomer) map.get(IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
			//OBTrxContext theOBTrxContext = (OBTrxContext) map.get("theOBTrxContext");
	        String event = (String) map.get("event");
	        String partyName = (String) map.get("partyName");
	        String caseId = (String) map.get("caseId");
	        String segment = (String) map.get("segment");
	        String region = (String) map.get("region");
	        String status = (String) map.get("status");
	        
	        ICommonUser user = (ICommonUser) map.get(IGlobalConstant.USER);
	        try {
	        	String globalStartIndex = (String) map.get(IGlobalConstant.GLOBAL_CMSTRXSEARCH_START_INDEX);
	        	SearchResult caseCreationUpdateList = new SearchResult();
	        	
	        	if(event!=null && event.equalsIgnoreCase("")){
	        		caseCreationUpdateList= (SearchResult)  getCaseCreationProxy().getAllActualCaseCreationBranchMenu(user.getEjbBranchCode());
	        	}else{
	        		caseCreationUpdateList= (SearchResult)  getCaseCreationProxy().getAllActualCaseCreationBranchMenu(user.getEjbBranchCode());	
	        	}
	            ICustomerProxy customerProxy = CustomerProxyFactory.getProxy();
	            
	           Collection caseCreationUpdateListCollection= caseCreationUpdateList.getResultList();
	           
	           Iterator iteratorCaseCreationUpdateListCollection=caseCreationUpdateListCollection.iterator();
	           HashMap customerMap= new HashMap();
	           while(iteratorCaseCreationUpdateListCollection.hasNext()){
	        	   
	        	   OBCaseCreation caseCreation=(OBCaseCreation)iteratorCaseCreationUpdateListCollection.next();
	        	   ICMSCustomer customer= new CustomerDAO().getCustomerByLimitProfileIdForCaseCreation(caseCreation.getLimitProfileId());
	        	   customerMap.put(String.valueOf(caseCreation.getId()), customer);
	           }
	            
	            if (StringUtils.isBlank(startIndex)) {
					if (StringUtils.isBlank(globalStartIndex) || "null".equals(globalStartIndex.trim())) {
						stindex = 0;
						startIndex = String.valueOf(stindex);
						resultMap.put("startIndex", startIndex);

					}
					else {
						stindex = Integer.parseInt(globalStartIndex);
						startIndex = globalStartIndex;
						resultMap.put("startIndex", startIndex);
					}
				}
				else {
					stindex = Integer.parseInt(startIndex);
					resultMap.put("startIndex", startIndex);
				}

	                  resultMap.put("caseCreationUpdateList", caseCreationUpdateList);
	                  resultMap.put("customerMap", customerMap);
	                  resultMap.put("event", event);
	        }catch (CaseCreationException ex) {
	        	 DefaultLogger.debug(this, "got exception in doExecute" + ex);
		            ex.printStackTrace();
		            throw (new CommandProcessingException(ex.getMessage()));
			} catch (Exception e) {
	            DefaultLogger.debug(this, "got exception in doExecute" + e);
	            e.printStackTrace();
	            throw (new CommandProcessingException(e.getMessage()));
	        }
	        returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
	        return returnMap;
	    }
}




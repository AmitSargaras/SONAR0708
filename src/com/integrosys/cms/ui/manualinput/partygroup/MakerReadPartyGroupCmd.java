/**
 * Copyright Integro Technologies Pte Ltd
 * $Header:
 */
package com.integrosys.cms.ui.manualinput.partygroup;

import java.util.HashMap;

import com.integrosys.base.businfra.transaction.TransactionException;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.AbstractCommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.app.partygroup.bus.IPartyGroup;
import com.integrosys.cms.app.partygroup.bus.OBPartyGroup;
import com.integrosys.cms.app.partygroup.bus.PartyGroupException;
import com.integrosys.cms.app.partygroup.proxy.IPartyGroupProxyManager;
import com.integrosys.cms.app.partygroup.trx.IPartyGroupTrxValue;
import com.integrosys.cms.app.partygroup.trx.OBPartyGroupTrxValue;
import com.integrosys.cms.app.limit.bus.LimitDAO;

/**
 *@author $Author: Bharat Waghela$ Command to read party group
 */
public class MakerReadPartyGroupCmd extends AbstractCommand implements
		ICommonEventConstant {

	private IPartyGroupProxyManager partyGroupProxy;

	public IPartyGroupProxyManager getPartyGroupProxy() {
		return partyGroupProxy;
	}

	public void setPartyGroupProxy(IPartyGroupProxyManager partyGroupProxy) {
		this.partyGroupProxy = partyGroupProxy;
	}

	/**
	 * Default Constructor
	 */
	public MakerReadPartyGroupCmd() {
	}

	/**
	 * Defines an two dimensional array with the parameter list to be passed to
	 * the doExecute method by a HashMap syntax for the array is
	 * (HashMapkey,classname,scope) The scope may be request,form or service
	 * 
	 * @return the two dimensional String array
	 */
	public String[][] getParameterDescriptor() {
		return (new String[][] {
				{ "partyCode", "java.lang.String", REQUEST_SCOPE },
				{ "startIndex", "java.lang.String", REQUEST_SCOPE },
				{ "event", "java.lang.String", REQUEST_SCOPE } });
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
				{ "partyGroupObj",
						"com.integrosys.cms.app.partygroup.bus.OBPartyGroup",
						SERVICE_SCOPE },



						{ "migratedFlag", "java.lang.String", SERVICE_SCOPE },
						{ "startIndex", "java.lang.String", REQUEST_SCOPE },
				{ "partyGroupObj",
						"com.integrosys.cms.app.partygroup.bus.OBPartyGroup",
						FORM_SCOPE },
				{ "event", "java.lang.String", REQUEST_SCOPE },

				{
						"IPartyGroupTrxValue",
						"com.integrosys.cms.app.partygroup.trx.IPartyGroupTrxValue",
						SERVICE_SCOPE } });
	}

	/**
	 * This method does the Business operations with the HashMap and put the
	 * results back into the HashMap.Here creation for Company Borrower is done.
	 * 
	 * @param map
	 *            is of type HashMap
	 * @return HashMap with the Result
	 */
	public HashMap doExecute(HashMap map) throws CommandProcessingException,
			CommandValidationException {

		HashMap returnMap = new HashMap();
		HashMap resultMap = new HashMap();
		try {
			IPartyGroup partyGroup;
			IPartyGroupTrxValue trxValue = null;
			String branchCode = (String) (map.get("partyCode"));
			String event = (String) map.get("event");
			String startIdx = (String) map.get("startIndex");
			trxValue = (OBPartyGroupTrxValue) getPartyGroupProxy()
					.getPartyGroupTrxValue(Long.parseLong(branchCode));
			partyGroup = (OBPartyGroup) trxValue.getPartyGroup();

			LimitDAO limitDao = new LimitDAO();
					try {
					String migratedFlag = "N";	
					boolean status = false;	
					 status = limitDao.getCAMMigreted("CMS_PARTY_GROUP",partyGroup.getId(),"ID");
					
					if(status)
					{
						migratedFlag= "Y";
					}
					resultMap.put("migratedFlag", migratedFlag);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			resultMap.put("event", event);
			resultMap.put("IPartyGroupTrxValue", trxValue);
			resultMap.put("partyGroupObj", partyGroup);
			resultMap.put("startIndex", startIdx);
		} catch (PartyGroupException ex) {
			DefaultLogger.debug(this, "got exception in doExecute" + ex);
			ex.printStackTrace();
			throw (new CommandProcessingException(ex.getMessage()));
		} catch (TransactionException e) {
			DefaultLogger.debug(this, "got exception in doExecute" + e);
			e.printStackTrace();
			throw (new CommandProcessingException(e.getMessage()));
		} catch (Exception e) {
			DefaultLogger.debug(this, "got exception in doExecute" + e);
			e.printStackTrace();
			throw (new CommandProcessingException(e.getMessage()));
		}

		returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
		return returnMap;
	}

}

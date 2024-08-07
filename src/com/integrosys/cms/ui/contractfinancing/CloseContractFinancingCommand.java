/**
 * Copyright Integro Technologies Pte Ltd
 */

package com.integrosys.cms.ui.contractfinancing;

import java.util.HashMap;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.AbstractCommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.contractfinancing.proxy.ContractFinancingProxyManagerFactory;
import com.integrosys.cms.app.contractfinancing.proxy.IContractFinancingProxyManager;
import com.integrosys.cms.app.contractfinancing.trx.IContractFinancingTrxValue;
import com.integrosys.cms.app.transaction.OBTrxContext;

/**
 * Command class to Cancel Edited by maker
 * @author $Author: KienLeong $<br>
 * @version $Revision: 1.1 $
 * @since $Date: 2007/Mar/08 $ Tag: $Name: $
 */
public class CloseContractFinancingCommand extends AbstractCommand implements ICommonEventConstant {
	/**
	 * Default Constructor
	 */
	public CloseContractFinancingCommand() {
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
				{ "contractFinancingTrxValue",
						"com.integrosys.cms.app.contractfinancing.trx.IContractFinancingTrxValue", SERVICE_SCOPE },
				{ "theOBTrxContext", "com.integrosys.cms.app.transaction.OBTrxContext", FORM_SCOPE } });
	}

	/**
	 * Defines an two dimensional array with the result list to be expected as a
	 * result from the doExecute method using a HashMap syntax for the array is
	 * (HashMapkey,classname,scope) The scope may be request,form or service
	 * 
	 * @return the two dimensional String array
	 */
	public String[][] getResultDescriptor() {
		return (new String[][] { { "request.ITrxValue", "com.integrosys.cms.app.transaction.ICMSTrxValue",
				REQUEST_SCOPE } });
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
		OBTrxContext trxContext = (OBTrxContext) map.get("theOBTrxContext");
		IContractFinancingTrxValue trxValue = (IContractFinancingTrxValue) map.get("contractFinancingTrxValue");

		try {
			IContractFinancingProxyManager proxy = ContractFinancingProxyManagerFactory
					.getContractFinancingProxyManager();

			String fromState = trxValue.getFromState();

			if (fromState.equals(ICMSConstant.STATE_ND) || fromState.equals(ICMSConstant.STATE_PENDING_CREATE)) {
				proxy.makerCloseContractFinancing(trxContext, trxValue);
			}
			else if (fromState.equals(ICMSConstant.STATE_PENDING_UPDATE)) {
				proxy.makerCloseUpdateContractFinancing(trxContext, trxValue);
			}
			else if (fromState.equals(ICMSConstant.STATE_DRAFT) || fromState.equals(ICMSConstant.STATE_ACTIVE)) {
				// state_draft maybe from actual or staging
				if (trxValue.getContractFinancing() != null) { // have actual
					proxy.makerCloseUpdateContractFinancing(trxContext, trxValue);
				}
				else { // no actual
					proxy.makerCloseContractFinancing(trxContext, trxValue);
				}
			}
			else if (fromState.equals(ICMSConstant.STATE_PENDING_DELETE)) {
				proxy.makerCloseDeleteContractFinancing(trxContext, trxValue);
			}
			resultMap.put("request.ITrxValue", trxValue);

		}
		catch (Exception e) {
			DefaultLogger.debug(this, "got exception in doExecute" + e);
			e.printStackTrace();
			throw (new CommandProcessingException(e.getMessage()));
		}
		DefaultLogger.debug(this, "Going out of doExecute()");
		returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
		return returnMap;
	}

}

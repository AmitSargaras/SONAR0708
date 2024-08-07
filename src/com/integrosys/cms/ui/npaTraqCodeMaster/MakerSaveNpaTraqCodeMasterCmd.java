package com.integrosys.cms.ui.npaTraqCodeMaster;

import java.util.HashMap;

import org.apache.struts.action.ActionMessage;

import com.integrosys.base.businfra.transaction.TransactionException;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.AbstractCommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.app.npaTraqCodeMaster.bus.NpaTraqCodeMasterException;
import com.integrosys.cms.app.npaTraqCodeMaster.bus.OBNpaTraqCodeMaster;
import com.integrosys.cms.app.npaTraqCodeMaster.proxy.INpaTraqCodeMasterProxyManager;
import com.integrosys.cms.app.npaTraqCodeMaster.trx.INpaTraqCodeMasterTrxValue;
import com.integrosys.cms.app.npaTraqCodeMaster.trx.OBNpaTraqCodeMasterTrxValue;
import com.integrosys.cms.app.transaction.OBTrxContext;

public class MakerSaveNpaTraqCodeMasterCmd extends AbstractCommand implements ICommonEventConstant {

	private INpaTraqCodeMasterProxyManager npaTraqCodeMasterProxy;
	
	public INpaTraqCodeMasterProxyManager getNpaTraqCodeMasterProxy() {
		return npaTraqCodeMasterProxy;
	}

	public void setNpaTraqCodeMasterProxy(INpaTraqCodeMasterProxyManager npaTraqCodeMasterProxy) {
		this.npaTraqCodeMasterProxy = npaTraqCodeMasterProxy;
	}
	
	/**
	 * Default Constructor
	 */
	public MakerSaveNpaTraqCodeMasterCmd() {
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
				{ "INpaTraqCodeMasterTrxValue", "com.integrosys.cms.app.npaTraqCodeMaster.trx.INpaTraqCodeMasterTrxValue",
						SERVICE_SCOPE },
				{ "theOBTrxContext", "com.integrosys.cms.app.transaction.OBTrxContext", FORM_SCOPE },
				{ "event", "java.lang.String", REQUEST_SCOPE },
				{ "npaTraqCodeMasterObj", "com.integrosys.cms.app.npaTraqCodeMaster.bus.OBNpaTraqCodeMaster", FORM_SCOPE },
				{"securityType", "java.lang.String", REQUEST_SCOPE},
                {"securitySubType", "java.lang.String", REQUEST_SCOPE},
                {"propertyTypeCodeDesc", "java.lang.String", REQUEST_SCOPE},
        		{ "npaTraqCodeMasterObj", "com.integrosys.cms.app.npaTraqCodeMaster.bus.OBNpaTraqCodeMaster", FORM_SCOPE }

		});
	}
	
	public String[][] getResultDescriptor() {
		return (new String[][] {
				{ "request.ITrxValue", "com.integrosys.cms.app.transaction.ICMSTrxValue", REQUEST_SCOPE } });
	}

	/**
	 * This method does the Business operations with the HashMap and put the
	 * results back into the HashMap.
	 *
	 * @param map
	 *            is of type HashMap
	 * @return HashMap with the Result
	 */
	
	public HashMap doExecute(HashMap map) throws CommandProcessingException, CommandValidationException {
		HashMap returnMap = new HashMap();
		HashMap resultMap = new HashMap();
		HashMap exceptionMap = new HashMap();
		try {
			String event = (String) map.get("event");
			OBNpaTraqCodeMaster npaTraqCodeMaster = (OBNpaTraqCodeMaster) map.get("npaTraqCodeMasterObj");
			OBTrxContext ctx = (OBTrxContext) map.get("theOBTrxContext");
			INpaTraqCodeMasterTrxValue trxValueIn = (OBNpaTraqCodeMasterTrxValue) map.get("INpaTraqCodeMasterTrxValue");
			INpaTraqCodeMasterTrxValue trxValueOut = new OBNpaTraqCodeMasterTrxValue();

			boolean isNpaTraqCodeUnique = false;
			
			String securityType=npaTraqCodeMaster.getSecurityType();
			String securitySubType=npaTraqCodeMaster.getSecuritySubType();
			String propertyTypeDesc=npaTraqCodeMaster.getPropertyTypeCodeDesc();
			
			if (event.equals("maker_update_draft_npa_traq_code_master")) { 
			
				String npaTraqCode=npaTraqCodeMaster.getNpaTraqCode();
				String npaTraqCodeActual=trxValueIn.getStagingNpaTraqCodeMaster().getNpaTraqCode();
				String securityTypeActual=trxValueIn.getStagingNpaTraqCodeMaster().getSecurityType();
				String securitySubTypeActual=trxValueIn.getStagingNpaTraqCodeMaster().getSecuritySubType();
				String propertyTypeDescActual=trxValueIn.getStagingNpaTraqCodeMaster().getPropertyTypeCodeDesc();
				
				
				if(!npaTraqCode.equals(npaTraqCodeActual)||!securityType.equals(securityTypeActual)
						||!securitySubType.equals(securitySubTypeActual)||(propertyTypeDesc!=null && !propertyTypeDesc.equals(propertyTypeDescActual))) {
					
					isNpaTraqCodeUnique = getNpaTraqCodeMasterProxy().isNpaTraqCodeUnique(npaTraqCode,securityType,securitySubType,propertyTypeDesc);
					
					if(isNpaTraqCodeUnique != false){
						if("PT".equals(securityType)) {
							exceptionMap.put("propertyTypeCodeDescError", new ActionMessage("error.string.exist","This Property Type Code Description "));
						}else {
							exceptionMap.put("npaTraqCodeError", new ActionMessage("error.string.exist","This NPA TRAQ Code, Security Type, Security Sub-Type "));
						}
						returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
						returnMap.put(ICommonEventConstant.COMMAND_EXCEPTION_MAP, exceptionMap);
						return returnMap;
					}
				}
			}
			if (event.equals("maker_update_draft_npa_traq_code_master")) { 
				trxValueOut = getNpaTraqCodeMasterProxy().makerUpdateSaveUpdateNpaTraqCodeMaster(ctx, trxValueIn,npaTraqCodeMaster);
				resultMap.put("request.ITrxValue", trxValueOut);
			} else {
				isNpaTraqCodeUnique = getNpaTraqCodeMasterProxy().isNpaTraqCodeUniqueJdbc((String) map.get("securityType"),
						(String) map.get("securitySubType"),(String) map.get("propertyTypeCodeDesc"));				
				if(isNpaTraqCodeUnique != false){
					if("PT".equals(securityType)) {
						exceptionMap.put("propertyTypeCodeDescError", new ActionMessage("error.string.exist","This Property Type Code Description "));
					}else {
						exceptionMap.put("npaTraqCodeError", new ActionMessage("error.string.exist","This NPA TRAQ Code, Security Type, Security Sub-Type "));
					}
					returnMap.put(ICommonEventConstant.COMMAND_RESULT_MAP, resultMap);
					returnMap.put(ICommonEventConstant.COMMAND_EXCEPTION_MAP, exceptionMap);
					return returnMap;
				}
				
				trxValueOut = getNpaTraqCodeMasterProxy().makerSaveNpaTraqCodeMaster(ctx, npaTraqCodeMaster);
				resultMap.put("request.ITrxValue", trxValueOut);
			}
		} catch (NpaTraqCodeMasterException ex) {
			DefaultLogger.debug(this, "got exception in doExecute" + ex);
			ex.printStackTrace();
			throw (new CommandProcessingException(ex.getMessage()));
		} catch (TransactionException e) {
			DefaultLogger.debug(this, "got exception in doExecute" + e);
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

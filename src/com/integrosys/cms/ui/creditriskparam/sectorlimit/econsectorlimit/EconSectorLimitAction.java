package com.integrosys.cms.ui.creditriskparam.sectorlimit.econsectorlimit;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.ICommand;
import com.integrosys.base.uiinfra.common.IPage;
import com.integrosys.base.uiinfra.common.Page;
import com.integrosys.cms.ui.creditriskparam.sectorlimit.subsectorlimit.SubSectorLimitAction;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;

import java.util.HashMap;
import java.util.Locale;

public class EconSectorLimitAction extends SubSectorLimitAction {
    protected ICommand[] getCommandChain(String event) {
        ICommand[] objArray = null;
        DefaultLogger.debug(this, "<<<<< commandchain event: "+event);
        
        if (EVENT_PREPARE_UPDATE.equals(event) ||
        		EVENT_PREPARE.equals(event)) {
        	objArray = new ICommand[2];
        	objArray[0] = (ICommand) getNameCommandMap().get("ReadEconSectorLmtCmd");
        	objArray[1] = (ICommand) getNameCommandMap().get("PrepareEconSectorLmtCmd");
        } else if (EVENT_CREATE.equals(event)) {
            return new ICommand[] { (ICommand) getNameCommandMap().get("AddEconSectorLmtCmd") };
        } else if (EVENT_UPDATE.equals(event)) {
            return new ICommand[] { (ICommand) getNameCommandMap().get("UpdateEconSectorLmtCmd") };
        } else if (EVENT_ERROR_RETURN.equals(event)) {
            return new ICommand[] { (ICommand) getNameCommandMap().get("PrepareEconSectorLmtCmd") };
        }
        return objArray;
    }
    
    protected boolean isValidationRequired(String event) {
		//return false;
        return EVENT_CREATE.equals(event) ||
    	EVENT_UPDATE.equals(event);
    }
    
    protected String getErrorEvent(String event) {
        return EVENT_ERROR_RETURN;        
    }
    
    public ActionErrors validateInput(ActionForm form, Locale locale) {
    	return EconSectorLimitValidator.validateInput((EconSectorLimitForm)form, locale);
    }

    protected IPage getNextPage(String event, HashMap resultMap, HashMap exceptionMap) {
        Page aPage = new Page();

        String page = getReference(event);

        DefaultLogger.debug(this, "<<<< page: "+page);
        aPage.setPageReference( page );
        return aPage;
    }
    
    private String getReference(String event) {
    	if (EVENT_PREPARE_UPDATE.equals(event) ||
    			EVENT_ERROR_RETURN.equals(event))
    		return EVENT_PREPARE;
    	
    	if (EVENT_CREATE.equals(event) ||
    			EVENT_UPDATE.equals(event))
    		return EVENT_RETURN;
    	
    	return event;
    }
}

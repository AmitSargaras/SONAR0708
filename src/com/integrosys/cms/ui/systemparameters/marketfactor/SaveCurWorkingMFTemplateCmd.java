/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: $
 */
package com.integrosys.cms.ui.systemparameters.marketfactor;

import java.util.HashMap;

import com.integrosys.base.uiinfra.common.AbstractCommand;
import com.integrosys.base.uiinfra.common.ICommonEventConstant;
import com.integrosys.base.uiinfra.exception.CommandProcessingException;
import com.integrosys.base.uiinfra.exception.CommandValidationException;
import com.integrosys.cms.app.propertyparameters.bus.marketfactor.IMFTemplate;
import com.integrosys.cms.app.propertyparameters.trx.marketfactor.IMFTemplateTrxValue;

/**
 * @author Administrator
 * 
 *         TODO To change the template for this generated type comment go to
 *         Window - Preferences - Java - Code Style - Code Templates
 */
public class SaveCurWorkingMFTemplateCmd extends AbstractCommand {
	public String[][] getParameterDescriptor() {
		return (new String[][] {
				{ "MFTemplateTrxObj", "com.integrosys.cms.app.propertyparameters.trx.marketfactor.IMFTemplateTrxValue",
						SERVICE_SCOPE },
				{ "MFTemplateForm", "com.integrosys.cms.app.propertyparameters.bus.marketfactor.IMFTemplate",
						FORM_SCOPE }, });

	}

	public String[][] getResultDescriptor() {
		return (new String[][] {});
	}

	public HashMap doExecute(HashMap map) throws CommandProcessingException, CommandValidationException {
		HashMap result = new HashMap();
		HashMap exceptionMap = new HashMap();
		HashMap temp = new HashMap();
		try {
			// just map from form to staging limit and save in trxValue object
			IMFTemplate template = (IMFTemplate) (map.get("MFTemplateForm"));
			IMFTemplateTrxValue MFTemplateTrxObj = (IMFTemplateTrxValue) (map.get("MFTemplateTrxObj"));
			MFTemplateTrxObj.setStagingMFTemplate(template);
			result.put("MFTemplateTrxObj", MFTemplateTrxObj);

		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw (new CommandProcessingException(ex.getMessage()));
		}
		temp.put(ICommonEventConstant.COMMAND_RESULT_MAP, result);
		temp.put(ICommonEventConstant.COMMAND_EXCEPTION_MAP, exceptionMap);
		return temp;
	}
}

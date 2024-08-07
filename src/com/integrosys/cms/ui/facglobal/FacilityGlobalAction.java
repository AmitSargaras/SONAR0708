package com.integrosys.cms.ui.facglobal;

import java.util.Locale;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.cms.ui.docglobal.DocumentationGlobalAction;



/**
 * @author $Author: elango $<br>
 * @version $Revision: 1.3 $
 * @since $Date: 2003/08/23 07:30:45 $ Tag: $Name: $
 */
public class FacilityGlobalAction extends DocumentationGlobalAction {


	public ActionErrors validateInput(ActionForm aForm, Locale locale) {
		DefaultLogger.debug(this, "FacilityGlobalAction go to FacilityGlobalFormValidator");
		return FacilityGlobalFormValidator.validateInput((FacilityGlobalForm) aForm, locale);
	}
	
}

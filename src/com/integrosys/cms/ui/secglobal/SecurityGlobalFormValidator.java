package com.integrosys.cms.ui.secglobal;

import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.techinfra.validation.Validator;
import com.integrosys.base.uiinfra.common.ErrorKeyMapper;
import com.integrosys.cms.ui.docglobal.DocumentationGlobalForm;
import com.integrosys.cms.ui.docglobal.DocumentationGlobalFormValidator;

/**
 * Created by IntelliJ IDEA. User: elango Date: Jul 4, 2003 Time: 11:23:06 AM To
 * change this template use Options | File Templates.
 */
public class SecurityGlobalFormValidator extends DocumentationGlobalFormValidator {
	public static ActionErrors validateInput(DocumentationGlobalForm aForm, Locale locale) {
		ActionErrors errors = new ActionErrors();
		if("create_doc_item".equalsIgnoreCase(aForm.getEvent())||"update_doc_item".equalsIgnoreCase(aForm.getEvent()))
		{
		errors = DocumentationGlobalFormValidator.validateInput(aForm, locale);
		String errorCode = "";
		if(StringUtils.isBlank(((SecurityGlobalForm) aForm).getIsApplicableForCersaiInd())) {
			errors.add("isApplicableForCersaiIndError", new ActionMessage("error.string.madatory"));
		}
		if (!(errorCode = Validator.checkString(aForm.getDocVersion(), true, 1, 100)).equals(Validator.ERROR_NONE)
				|| aForm.getDocVersion().equals("")) {
			errors.add("docVersion", new ActionMessage(ErrorKeyMapper.map(ErrorKeyMapper.STRING, errorCode), "1", "100"));
		}
		}
		else if("y".equalsIgnoreCase(aForm.getGo())){
			String errorCode="";
            SecurityGlobalForm sForm=(SecurityGlobalForm) aForm;
			if (isValidDocumentName(sForm.getSecDocDesc())) {
				errors.add("itemDescError", new ActionMessage("error.string.specialcharacter"));
			}
			if (isValidAlphaNumStringWithoutSpace(sForm.getSecDocCode().trim())) {
				errors.add("itemCodeError", new ActionMessage("error.string.specialcharacter"));
			}
				if(!sForm.getSecDocTenureCount().equalsIgnoreCase("")){
					if (!(errorCode = Validator.checkNumber(sForm.getSecDocTenureCount(), false,0,
							999, 3, locale)).equals(Validator.ERROR_NONE)) {
						errors.add("tenureError", new ActionMessage(ErrorKeyMapper.map(ErrorKeyMapper.NUMBER, errorCode),"0",
								"999"));
					}
				}
		}
		DefaultLogger.debug(" Total Errors", "-------111111111111111111111111111111111-->" + errors.size());
		return errors;
		
	}

}

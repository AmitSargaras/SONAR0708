package com.integrosys.cms.ui.collateral.guarantees.gtegovtlink;

import java.util.Locale;

import org.apache.struts.action.ActionErrors;

import com.integrosys.cms.ui.collateral.guarantees.GuaranteesValidator;

/**
 * Created by IntelliJ IDEA. User: ssathish Date: Jun 20, 2003 Time: 6:42:25 PM
 * To change this template use Options | File Templates.
 */
public class GteGovtLinkValidator {
	public static ActionErrors validateInput(GteGovtLinkForm aForm, Locale locale) {

		ActionErrors errors = GuaranteesValidator.validateInput(aForm, locale);

		String errorCode = null;

		if (!(aForm.getEvent().equals("approve") || aForm.getEvent().equals("reject"))) {
			GteGovtLinkValidationHelper.validateInput(aForm, locale, errors);
		}

		return errors;

	}
}

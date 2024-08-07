package com.integrosys.cms.ui.profile;

import java.util.HashMap;
import java.util.Locale;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.CommonAction;
import com.integrosys.base.uiinfra.common.ICommand;
import com.integrosys.base.uiinfra.common.IPage;

public class PasswordChangeAction extends CommonAction {

	/**
	 * This method return a Array of Commad Objects responsible for a event
	 * 
	 * @param event is of type String
	 * @return Icommand Array
	 */
	public ICommand[] getCommandChain(String event) {
		ICommand objArray[] = null;
		if (EVENT_PREPARE.equals(event)) {
			objArray = new ICommand[1];
			objArray[0] = new PreparePasswordChangeCommand();
		}
		if (event.equals("change_password")) {
			objArray = new ICommand[1];
			objArray[0] = new PasswordChangeCommand();
		}
		return (objArray);
	}

	/**
	 * This method is called only for create and Update command to validate the
	 * form and return the ActionErrors object.
	 * 
	 * @param aForm is of type ActionForm
	 * @param locale of type Locale
	 * @return ActionErrors
	 */
	public ActionErrors validateInput(ActionForm aForm, Locale locale) {
		DefaultLogger.debug(this, "Inside validate Input child class");
		return PasswordChangeValidator.validateInput((PasswordChangeForm) aForm, locale);
	}

	/**
	 * This method is used to determine which the page to be displayed next
	 * using the event Result hashmap and exception hashmap.It returns the page
	 * object .
	 * 
	 * @param event is of type String
	 * @param resultMap is of type HashMap
	 * @param exceptionMap is of type HashMap
	 * @return IPage
	 */
	public IPage getNextPage(String event, HashMap resultMap, HashMap exceptionMap) {
		Page aPage = new Page();
		int err = exceptionMap.size();
		if (err > 0) {
			event = EVENT_PREPARE;
		}
		aPage.setPageReference(getReference(event));
		return aPage;
	}

	/**
	 * method which determines the forward name for a particular event
	 * @param event as String
	 * @return String
	 */
	private String getReference(String event) {
		String forwardName = "submit_fail";
		if (EVENT_PREPARE.equals(event)) {
			forwardName = "after_prepare";
		}
		if (event.equals("change_password")) {
			forwardName = "show_confirm";
		}
		return forwardName;
	}

	protected boolean isGatewayEvent(String event) {
		if (EVENT_PREPARE.equals(event)) {
			return true;
		}
		return false;
	}

	protected boolean isValidationRequired(String event) {
		boolean result = false;
		if (event.equals("change_password")) {
			result = true;
		}
		return result;
	}

}

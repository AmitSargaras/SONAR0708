/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/ui/commoditydeal/finance/release/ReleaseAction.java,v 1.1 2004/09/07 08:32:35 hshii Exp $
 */
package com.integrosys.cms.ui.commoditydeal.finance.release;

import java.util.HashMap;
import java.util.Locale;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.uiinfra.common.ICommand;
import com.integrosys.base.uiinfra.common.IPage;
import com.integrosys.base.uiinfra.common.Page;
import com.integrosys.cms.ui.commoditydeal.finance.FinanceAction;

/**
 * Description
 * 
 * @author $Author: hshii $<br>
 * @version $Revision: 1.1 $
 * @since $Date: 2004/09/07 08:32:35 $ Tag: $Name: $
 */

public class ReleaseAction extends FinanceAction {
	public final static String EVENT_PREPARE_NOOP = "prepare_noop";

	public ICommand[] getCommandChain(String event) {
		ICommand objArray[] = null;
		if (EVENT_CREATE.equals(event)) {
			objArray = new ICommand[1];
			objArray[0] = new CreateReleaseCommand();
		}
		else if (EVENT_PREPARE_UPDATE_SUB.equals(event) || EVENT_PREPARE.equals(event)) {
			objArray = new ICommand[2];
			objArray[0] = new ReadReleaseCommand();
			objArray[1] = new PrepareReleaseCommand();
		}
		else if (EVENT_REFRESH.equals(event)) {
			objArray = new ICommand[2];
			objArray[0] = new RefreshReleaseCommand();
			objArray[1] = new PrepareReleaseCommand();
		}
		else if (EVENT_READ.equals(event)) {
			objArray = new ICommand[1];
			objArray[0] = new ReadReleaseCommand();
		}
		else if (EVENT_UPDATE.equals(event)) {
			objArray = new ICommand[1];
			objArray[0] = new UpdateReleaseCommand();
		}
		else if (EVENT_READ_RETURN.equals(event)) {
			objArray = new ICommand[1];
			objArray[0] = new ReturnReleaseCommand();
		}
		else if (EVENT_PREPARE_NOOP.equals(event)) {
			objArray = new ICommand[1];
			objArray[0] = new PrepareReleaseCommand();
		}
		else {
			objArray = super.getCommandChain(event);
		}

		return objArray;
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
		DefaultLogger.debug(this, "VALIDATION REQUIRED...");
		return ReleaseValidator.validateInput((ReleaseForm) aForm, locale);
	}

	protected boolean isValidationRequired(String event) {
		boolean result = false;
		if (EVENT_CREATE.equals(event) || EVENT_UPDATE.equals(event) || EVENT_REFRESH.equals(event)) {
			result = true;
		}
		return result;
	}

	protected String getErrorEvent(String event) {
		String errorEvent = event;
		if (EVENT_CREATE.equals(event) || EVENT_UPDATE.equals(event) || EVENT_REFRESH.equals(event)) {
			errorEvent = EVENT_PREPARE_NOOP;
		}

		return errorEvent;
	}

	public IPage getNextPage(String event, HashMap resultMap, HashMap exceptionMap) {
		Page aPage = new Page();
		if (event.equals(EVENT_FORWARD)) {
			return super.getNextPage(event, resultMap, exceptionMap);
		}
		if (EVENT_READ_RETURN.equals(event)) {
			aPage.setPageReference(getReturnReference((String) resultMap.get("from_event")));
		}
		else if (EVENT_READ.equals(event)) {
			aPage.setPageReference(getReadReference((String) resultMap.get("from_event"), (String) resultMap
					.get("previous_event")));
		}
		else {
			aPage.setPageReference(getReference(event));
		}
		return aPage;
	}

	private String getReference(String event) {
		if (event.equals(EVENT_UPDATE) || event.equals(EVENT_CREATE) || event.equals(EVENT_CANCEL)) {
			return EVENT_UPDATE_RETURN;
		}
		if (event.equals(EVENT_PREPARE_UPDATE_SUB) || event.equals(EVENT_PREPARE_NOOP) || event.equals(EVENT_REFRESH)) {
			return EVENT_PREPARE;
		}
		return event;
	}

	private String getReturnReference(String from_event) {
		if (from_event.equals(EVENT_PREPARE_CLOSE) || from_event.equals(EVENT_PREPARE_CLOSE_DEAL)) {
			return EVENT_CLOSE_RETURN;
		}
		if (from_event.equals(EVENT_TRACK)) {
			return EVENT_TRACK_RETURN;
		}
		if (from_event.equals(EVENT_PROCESS)) {
			return EVENT_PROCESS_RETURN;
		}
		if (from_event.equals(EVENT_READ)) {
			return EVENT_READ_RETURN;
		}
		return from_event;
	}

	private String getReadReference(String from_event, String previous_event) {
		if (from_event.equals(EVENT_READ) && (previous_event != null) && previous_event.equals(EVENT_USER_PROCESS)) {
			return EVENT_USER_PROCESS;
		}
		if (from_event.equals(EVENT_PREPARE_CLOSE) || from_event.equals(EVENT_READ) || from_event.equals(EVENT_TRACK)
				|| from_event.equals(EVENT_PREPARE_CLOSE_DEAL)) {
			return "view_release";
		}
		if (from_event.equals(EVENT_PROCESS)) {
			return "process_release";
		}
		return from_event;
	}
}

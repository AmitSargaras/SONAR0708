/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/sccertificate/trx/SCCertificateTrxController.java,v 1.4 2003/11/06 02:08:03 hltan Exp $
 */
package com.integrosys.cms.app.sccertificate.trx;

//ofa
import com.integrosys.base.businfra.transaction.ITrxOperation;
import com.integrosys.base.businfra.transaction.ITrxParameter;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxParameterException;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.transaction.CMSTrxController;

/**
 * This controller is used to control document item related operations.
 * 
 * @author $Author: hltan $
 * @version $Revision: 1.4 $
 * @since $Date: 2003/11/06 02:08:03 $ Tag: $Name: $
 */
public class SCCertificateTrxController extends CMSTrxController {
	/**
	 * Default Constructor
	 */
	public SCCertificateTrxController() {
		super();
	}

	/**
	 * Return the instance name associated to this ITrxController. The instance
	 * name refers to the instance of the state transition table. Not
	 * implemented.
	 * 
	 * @return String
	 */
	public String getInstanceName() {
		return ICMSConstant.INSTANCE_SCC;
	}

	/**
	 * Returns an ITrxOperation object
	 * @param value - ITrxValue
	 * @param param - ITrxParameter
	 * @return ITrxOperation - the trx operation
	 * @throws TrxParameterException on error
	 */
	public ITrxOperation getOperation(ITrxValue value, ITrxParameter param) throws TrxParameterException {
		ITrxOperation op = factoryOperation(value, param);
		DefaultLogger.debug(this, "Returning Operation: " + op);
		return op;
	}

	/**
	 * Helper method to factory the operations
	 * @param value - ITrxValue
	 * @param param - ITrxParameter
	 * @return ITrxOperation - the trx operation
	 * @throws TrxParameterException on error
	 */
	private ITrxOperation factoryOperation(ITrxValue value, ITrxParameter param) throws TrxParameterException {
		String action = param.getAction();
		if (null == action) {
			throw new TrxParameterException("Action is null in ITrxParameter!");
		}
		DefaultLogger.debug(this, "Action: " + action);

		String toState = value.getToState();
		String fromState = value.getFromState();
		DefaultLogger.debug(this, "toState: " + value.getToState());
		if ((toState == null) || (toState.equals(ICMSConstant.STATE_ND))) {
			if (action.equals(ICMSConstant.ACTION_MAKER_GENERATE_SCC)) {
				return new MakerCreateSCCOperation();
			}
			throw new TrxParameterException("Unknow Action: " + action + " with toState: " + toState);
		}

		if (toState.equals(ICMSConstant.STATE_ACTIVE)) {
			if (action.equals(ICMSConstant.ACTION_MAKER_GENERATE_SCC)) {
				return new MakerUpdateSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_SYSTEM_CLOSE_SCC)) {
				return new SystemCloseSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_SYSTEM_RESET_SCC)) {
				return new SystemResetSCCOperation();
			}
			throw new TrxParameterException("Unknow Action: " + action + " with toState: " + toState);
		}

		if (toState.equals(ICMSConstant.STATE_PENDING_CREATE)) {
			if (action.equals(ICMSConstant.ACTION_CHECKER_APPROVE_GENERATE_SCC)) {
				return new CheckerApproveCreateSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_CHECKER_REJECT_GENERATE_SCC)) {
				return new CheckerRejectSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_SYSTEM_CLOSE_SCC)) {
				return new SystemCloseSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_SYSTEM_RESET_SCC)) {
				return new SystemResetSCCOperation();
			}
			throw new TrxParameterException("Unknow Action: " + action + " with toState: " + toState);
		}

		if (toState.equals(ICMSConstant.STATE_PENDING_UPDATE)) {
			if (action.equals(ICMSConstant.ACTION_CHECKER_APPROVE_GENERATE_SCC)) {
				return new CheckerApproveUpdateSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_CHECKER_REJECT_GENERATE_SCC)) {
				return new CheckerRejectSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_SYSTEM_CLOSE_SCC)) {
				return new SystemCloseSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_SYSTEM_RESET_SCC)) {
				return new SystemResetSCCOperation();
			}
			throw new TrxParameterException("Unknown Action: " + action + " with toState: " + toState);
		}

		if (toState.equals(ICMSConstant.STATE_REJECTED)) {
			if (action.equals(ICMSConstant.ACTION_MAKER_EDIT_REJECTED_GENERATE_SCC)) {
				if (fromState.equals(ICMSConstant.STATE_PENDING_CREATE)) {
					return new MakerEditRejectedCreateSCCOperation();
				}
				return new MakerEditRejectedUpdateSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_MAKER_CLOSE_REJECTED_GENERATE_SCC)) {
				if (fromState.equals(ICMSConstant.STATE_PENDING_CREATE)) {
					return new MakerCloseRejectedCreateSCCOperation();
				}
				return new MakerCloseRejectedUpdateSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_SYSTEM_CLOSE_SCC)) {
				return new SystemCloseSCCOperation();
			}
			else if (action.equals(ICMSConstant.ACTION_SYSTEM_RESET_SCC)) {
				return new SystemResetSCCOperation();
			}
			throw new TrxParameterException("Unknow Action: " + action + " with toState: " + toState);
		}
		throw new TrxParameterException("To State does not match presets! No operations found!");
	}
}
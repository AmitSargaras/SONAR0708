package com.integrosys.cms.app.insurancecoverage.trx;

import com.integrosys.base.businfra.transaction.ITrxOperation;
import com.integrosys.base.businfra.transaction.ITrxParameter;
import com.integrosys.base.businfra.transaction.ITrxValue;
import com.integrosys.base.businfra.transaction.TrxParameterException;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.transaction.CMSTrxController;

import java.util.Map;

/**
 * @author dattatray.thorat
 *  Insurance Coverage Trx controller to manage trx operations
 */
public class InsuranceCoverageTrxController extends CMSTrxController {

    private Map nameTrxOperationMap;

    /**
     * @return &lt;name, ITrxOperation&gt; pair map to be injected, name and
     *         ITrxOperation name will be the same.
     */
    public Map getNameTrxOperationMap() {
        return nameTrxOperationMap;
    }

    public void setNameTrxOperationMap(Map nameTrxOperationMap) {
        this.nameTrxOperationMap = nameTrxOperationMap;
    }

    /**
     * Default Constructor
     */
    public InsuranceCoverageTrxController() {
        super();
    }

    /**
     * Return the instance name associated to this ITrxController.
     * The instance name refers to the instance of the state transition table.
     * Not implemented.
     *
     * @return String
     */
    public String getInstanceName() {
        return ICMSConstant.INSTANCE_INSURANCE_COVERAGE;
    }

    /**
     * Returns an ITrxOperation object
     *
     * @param value - ITrxValue
     * @param param - ITrxParameter
     * @return ITrxOperation - the trx operation
     * @throws com.integrosys.base.businfra.transaction.TrxParameterException
     *          on error
     */
    public ITrxOperation getOperation(ITrxValue value, ITrxParameter param) throws TrxParameterException {
        ITrxOperation op = factoryOperation(value, param);
        DefaultLogger.debug(this, "Returning Operation: " + op);
        return op;
    }

    /**
     * Helper method to factory the operations
     *
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
        
        if (action.equals(ICMSConstant.ACTION_MAKER_UPDATE_SAVE_INSURANCE_COVERAGE)) {
            return (ITrxOperation) getNameTrxOperationMap().get("MakerSubmitSaveUpdateInsuranceCoverageOperation");
        }

        if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_CLOSE_DRAFT_INSURANCE_COVERAGE)) {
        	return (ITrxOperation) getNameTrxOperationMap().get("MakerCloseDraftCreateInsuranceCoverageOperation");
        }
        
        if ((toState == null) || (toState.equals(ICMSConstant.STATE_ND))) {
            if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_CREATE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("MakerCreateInsuranceCoverageOperation");
            }
            if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_SAVE_CREATE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("MakerSaveCreateInsuranceCoverageOperation");
            }
            throw new TrxParameterException("Unknown Action: " + action + " with toState: " + toState);
        } else if (toState.equals(ICMSConstant.STATE_PENDING_CREATE)) {
            if (action!= null && action.equals(ICMSConstant.ACTION_CHECKER_APPROVE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("CheckerApproveCreateInsuranceCoverageOperation");
            }

            if (action!= null && action.equals(ICMSConstant.ACTION_CHECKER_REJECT_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("CheckerRejectInsuranceCoverageOperation");
            }
            throw new TrxParameterException("Unknown Action: " + action + " with toState: " + toState);
        } else if (toState.equals(ICMSConstant.STATE_ACTIVE)) {
            if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_UPDATE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("MakerUpdateInsuranceCoverageOperation");
            } else if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_DELETE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("MakerDeleteInsuranceCoverageOperation");
            }
            else if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_UPDATE_SAVE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("MakerUpdateSaveInsuranceCoverageOperation");
            }
            throw new TrxParameterException("Unknow Action: " + action + " with toState: " + toState);
        } else if (toState.equals(ICMSConstant.STATE_PENDING_UPDATE)) {
            if (action!= null && action.equals(ICMSConstant.ACTION_CHECKER_APPROVE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("CheckerApproveUpdateInsuranceCoverageOperation");
            } else if (action!= null && action.equals(ICMSConstant.ACTION_CHECKER_REJECT_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("CheckerRejectInsuranceCoverageOperation");
            }
            throw new TrxParameterException("Unknown Action: " + action + " with toState: " + toState);
        } else if (toState.equals(ICMSConstant.STATE_PENDING_DELETE)) {
            if (action!= null && action.equals(ICMSConstant.ACTION_CHECKER_APPROVE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("CheckerApproveDeleteInsuranceCoverageOperation");
            } else if (action!= null && action.equals(ICMSConstant.ACTION_CHECKER_REJECT_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("CheckerRejectInsuranceCoverageOperation");
            }
            throw new TrxParameterException("Unknown Action: " + action + " with toState: " + toState);
        } else if (toState.equals(ICMSConstant.STATE_REJECTED)) {
            if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_EDIT_REJECTED_INSURANCE_COVERAGE)) {
                if (fromState.equals(ICMSConstant.STATE_PENDING_CREATE)) {
                    return (ITrxOperation) getNameTrxOperationMap().get("MakerEditRejectedCreateInsuranceCoverageOperation");
                } else if (fromState.equals(ICMSConstant.STATE_PENDING_UPDATE)) {
                    return (ITrxOperation) getNameTrxOperationMap().get("MakerEditRejectedUpdateInsuranceCoverageOperation");
                } else if (fromState.equals(ICMSConstant.STATE_PENDING_DELETE)) {
                    return (ITrxOperation) getNameTrxOperationMap().get("MakerEditRejectedDeleteInsuranceCoverageOperation");
                }
            } else if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_CLOSE_REJECTED_INSURANCE_COVERAGE)) {
                if (fromState.equals(ICMSConstant.STATE_PENDING_CREATE)) {
                    return (ITrxOperation) getNameTrxOperationMap().get("MakerCloseRejectedCreateInsuranceCoverageOperation");
                } else if (fromState.equals(ICMSConstant.STATE_PENDING_UPDATE)) {
                    return (ITrxOperation) getNameTrxOperationMap().get("MakerCloseRejectedUpdateInsuranceCoverageOperation");
                } else if (fromState.equals(ICMSConstant.STATE_PENDING_DELETE)) {
                    return (ITrxOperation) getNameTrxOperationMap().get("MakerCloseRejectedDeleteInsuranceCoverageOperation");
                }
            }
            throw new TrxParameterException("Unknown Action: " + action + " with toState: " + toState);
        }else if (toState.equals(ICMSConstant.STATE_CLOSED)) {
        	if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_UPDATE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("MakerUpdateInsuranceCoverageOperation");
            }else if(action.equals(ICMSConstant.ACTION_MAKER_DELETE_INSURANCE_COVERAGE)){
        		return (ITrxOperation) getNameTrxOperationMap().get("MakerDeleteInsuranceCoverageOperation");
        	}
            else if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_UPDATE_SAVE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("MakerSubmitSaveUpdateInsuranceCoverageOperation");
            }
        	throw new TrxParameterException("Unknown Action: " + action + " with toState: " + toState);
        }
        else if(toState.equals(ICMSConstant.STATE_DRAFT)){
        	if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_CREATE_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("MakerSubmitSaveCreateInsuranceCoverageOperation");
            }else if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_CLOSE_DRAFT_INSURANCE_COVERAGE)) {
                return (ITrxOperation) getNameTrxOperationMap().get("MakerCloseDraftCreateInsuranceCoverageOperation");
            }else if (action!= null && action.equals(ICMSConstant.ACTION_MAKER_UPDATE_INSURANCE_COVERAGE)) {
            	return (ITrxOperation) getNameTrxOperationMap().get("MakerSubmitSaveUpdateInsuranceCoverageOperation");
            }
        	throw new TrxParameterException("Unknown Action: " + action + " with toState: " + toState);
        }
        throw new TrxParameterException("To State does not match presets! No operations found!");
    }

}

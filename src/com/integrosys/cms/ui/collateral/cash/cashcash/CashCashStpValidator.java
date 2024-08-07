package com.integrosys.cms.ui.collateral.cash.cashcash;

import java.util.Map;

import org.apache.struts.action.ActionErrors;

import com.integrosys.cms.ui.collateral.cash.AbstractCashStpValidator;

public class CashCashStpValidator extends AbstractCashStpValidator {
	public boolean validate(Map context) {
		if (!validateCashCollateral(context)) {
			return false;
		}
//		ICashDeposit[] cashDeposits = cashCollateral.getDepositInfo();
		if (validateAndAccumulate(context).size() <= 0) {
				/*cashDeposits != null) {
			for (int i = 0; i < cashDeposits.length; i++) {
				if (StringUtils.isNotBlank(cashDeposits[i].getDepositReceiptNo())
						&& cashDeposits[i].getDepositAmount() != null
						&& cashDeposits[i].getDepositMaturityDate() != null) {
					// do nothing
				}
				else
					return false;
			}*/
			return true;
		}
		else return false;
	}

	public ActionErrors validateAndAccumulate(Map context) {
		ActionErrors errorMessages = validateAndAccumulateDeposit(context);

		return errorMessages;
	}
}

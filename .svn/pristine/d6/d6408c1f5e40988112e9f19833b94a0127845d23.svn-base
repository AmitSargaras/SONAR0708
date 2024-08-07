package com.integrosys.simulator.host.SIBS.COLLFDAcct;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCollateralFDInqRes extends OBMessageHeader implements IOBHost {
	private Long accountGroupNumber;

	private String accountType;

	private Long accountNumber;

	private String validationFlag;

	private BigDecimal currentBalance;

	private Date maturityDate;

	private Long timeDepositTerm;

	private String timeDepositTermCode;

	private String holdByStatus;

	private String interestDeposition;

	public Long getAccountGroupNumber() {
		return accountGroupNumber;
	}

	public void setAccountGroupNumber(Long accountGroupNumber) {
		this.accountGroupNumber = accountGroupNumber;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public Long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(Long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getValidationFlag() {
		return validationFlag;
	}

	public void setValidationFlag(String validationFlag) {
		this.validationFlag = validationFlag;
	}

	public BigDecimal getCurrentBalance() {
		return currentBalance;
	}

	public void setCurrentBalance(BigDecimal currentBalance) {
		this.currentBalance = currentBalance;
	}

	public Date getMaturityDate() {
		return maturityDate;
	}

	public void setMaturityDate(Date maturityDate) {
		this.maturityDate = maturityDate;
	}

	public Long getTimeDepositTerm() {
		return timeDepositTerm;
	}

	public void setTimeDepositTerm(Long timeDepositTerm) {
		this.timeDepositTerm = timeDepositTerm;
	}

	public String getTimeDepositTermCode() {
		return timeDepositTermCode;
	}

	public void setTimeDepositTermCode(String timeDepositTermCode) {
		this.timeDepositTermCode = timeDepositTermCode;
	}

	public String getHoldByStatus() {
		return holdByStatus;
	}

	public void setHoldByStatus(String holdByStatus) {
		this.holdByStatus = holdByStatus;
	}

	public String getInterestDeposition() {
		return interestDeposition;
	}

	public void setInterestDeposition(String interestDeposition) {
		this.interestDeposition = interestDeposition;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSCollateralFDInqRes customerFDResponse = (OBSIBSCollateralFDInqRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" accountGroupNumber: " + customerFDResponse.getAccountGroupNumber() + newLine);
				result.append(" accountType: " + customerFDResponse.getAccountType() + newLine);
				result.append(" accountNumber: " + customerFDResponse.getAccountNumber() + newLine);
				result.append(" validationFlag: " + customerFDResponse.getValidationFlag() + newLine);
				result.append(" currentBalance: " + customerFDResponse.getCurrentBalance() + newLine);
				result.append(" maturityDate: " + customerFDResponse.getMaturityDate() + newLine);
				result.append(" timeDepositTerm: " + customerFDResponse.getTimeDepositTerm() + newLine);
				result.append(" timeDepositTermCode: " + customerFDResponse.getTimeDepositTermCode() + newLine);
				result.append(" holdByStatus: " + customerFDResponse.getHoldByStatus() + newLine);
				result.append(" interestDeposition: " + customerFDResponse.getInterestDeposition() + newLine);
				result.append("}");

			}
		}
		return result.toString();
	}

	public void setSuccessResponse() {
	}
}

package com.integrosys.simulator.host.SIBS.FDAccountGrpListing;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFDAccountGrpListingRes extends OBMessageHeader implements IOBHost {
	private Long accountGrpNumber;

	private Long accountNumber;

	private String holdByStatus;

	private BigDecimal currentBalance;

	private Date maturityDate;

	private Integer timeDepositeTerm;

	private String timeDepositTermCode;

	public Long getAccountGrpNumber() {
		return accountGrpNumber;
	}

	public void setAccountGrpNumber(Long accountGrpNumber) {
		this.accountGrpNumber = accountGrpNumber;
	}

	public Long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(Long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getHoldByStatus() {
		return holdByStatus;
	}

	public void setHoldByStatus(String holdByStatus) {
		this.holdByStatus = holdByStatus;
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

	public Integer getTimeDepositeTerm() {
		return timeDepositeTerm;
	}

	public void setTimeDepositeTerm(Integer timeDepositeTerm) {
		this.timeDepositeTerm = timeDepositeTerm;
	}

	public String getTimeDepositTermCode() {
		return timeDepositTermCode;
	}

	public void setTimeDepositTermCode(String timeDepositTermCode) {
		this.timeDepositTermCode = timeDepositTermCode;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSFDAccountGrpListingRes responseObj = (OBSIBSFDAccountGrpListingRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" accountGrpNumber: " + responseObj.getAccountGrpNumber() + newLine);
				result.append(" accountNumber: " + responseObj.getAccountNumber() + newLine);
				result.append(" holdByStatus: " + responseObj.getHoldByStatus() + newLine);
				result.append(" currentBalance: " + responseObj.getCurrentBalance() + newLine);
				result.append(" maturityDate: " + responseObj.getMaturityDate() + newLine);
				result.append(" timeDepositeTerm: " + responseObj.getTimeDepositeTerm() + newLine);
				result.append(" timeDepositTermCode: " + responseObj.getTimeDepositTermCode() + newLine);
				result.append("}");
			}
		}
		return result.toString();
	}

	public void setSuccessResponse() {
	}

}

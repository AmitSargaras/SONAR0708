package com.integrosys.simulator.host.SIBS.accountVerification;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSAccountVerification extends OBMessageHeader implements IOBHost {

	private Long accountNumber;

	private String accountType;

	public Long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(Long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSAccountVerification responseObj = (OBSIBSAccountVerification) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" accountNumber: " + responseObj.getAccountNumber() + newLine);
				result.append(" accountType: " + responseObj.getAccountType() + newLine);
				result.append("}");
			}
		}
		return result.toString();
	}

	public void setSuccessResponse() {
	}
}

package com.integrosys.simulator.host.SEMA.custinfo;

import java.io.Serializable;

import com.integrosys.simulator.host.SEMA.OBSEMAMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSEMACustomerInfoReq extends OBSEMAMessageHeader implements IOBHost, Serializable {
	// private Long customerStatus;
	// private String customerType;
	// private Date deceasedDate;
	// private BigDecimal otherIncome;
	// private int cifCombinedCycle;

	// Message Detail
	private String customerIdType;

	private String customerIdNumber;

	private String cardNumber;

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		result.append(this.getClass().getName() + " Object {" + newLine);
		result.append(" customerIdType: " + customerIdType + newLine);
		result.append(" customerIdNumber: " + customerIdNumber + newLine);
		result.append(" cardNumber: " + cardNumber + newLine);
		result.append("}");

		return result.toString();

	}

	public String getCustomerIdType() {
		return customerIdType;
	}

	public void setCustomerIdType(String customerIdType) {
		this.customerIdType = customerIdType;
	}

	public String getCustomerIdNumber() {
		return customerIdNumber;
	}

	public void setCustomerIdNumber(String customerIdNumber) {
		this.customerIdNumber = customerIdNumber;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public void setSuccessResponse() {
	}

}

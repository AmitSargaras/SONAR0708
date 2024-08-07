package com.integrosys.simulator.host.SIBS.CIFExposureSecInq;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCustomerExposureSecurityInquiryRes extends OBMessageHeader implements IOBHost {

	private Long accountNumber;

	private String accountType;

	private Long collateralId;

	private String collateralCode;

	private String collateralCategory;

	private BigDecimal collateralValue;

	private Date valuationDate;

	private String valuerName;

	public Long getCollateralId() {
		return collateralId;
	}

	public void setCollateralId(Long collateralId) {
		this.collateralId = collateralId;
	}

	public String getCollateralCode() {
		return collateralCode;
	}

	public void setCollateralCode(String collateralCode) {
		this.collateralCode = collateralCode;
	}

	public String getCollateralCategory() {
		return collateralCategory;
	}

	public void setCollateralCategory(String collateralCategory) {
		this.collateralCategory = collateralCategory;
	}

	public BigDecimal getCollateralValue() {
		return collateralValue;
	}

	public void setCollateralValue(BigDecimal collateralValue) {
		this.collateralValue = collateralValue;
	}

	public Date getValuationDate() {
		return valuationDate;
	}

	public void setValuationDate(Date valuationDate) {
		this.valuationDate = valuationDate;
	}

	public String getValuerName() {
		return valuerName;
	}

	public void setValuerName(String valuerName) {
		this.valuerName = valuerName;
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

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");
		result.append(newLine + printHeaderString() + newLine);
		result.append(this.getClass().getName() + " Object {" + newLine);
		result.append(" accountType: " + accountType + newLine);
		result.append(" accountNumber: " + accountNumber + newLine);
		result.append(" collateralId: " + collateralId + newLine);
		result.append(" collateralCode: " + collateralCode + newLine);
		result.append(" collateralCategory: " + collateralCategory + newLine);
		result.append(" collateralValue: " + collateralValue + newLine);
		result.append(" valuationDate: " + valuationDate + newLine);
		result.append(" valuerName: " + valuerName + newLine);
		result.append("}");

		return result.toString();

	}

	public void setSuccessResponse() {
	}
}
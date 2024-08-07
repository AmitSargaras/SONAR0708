package com.integrosys.simulator.host.SIBS.CIFConductExposureInq;

import java.math.BigDecimal;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCustomerConductExposureInquiryRes extends OBMessageHeader implements IOBHost {

	private Long customerNumber;

	private String accountType;

	private Long accountNumber;

	private String accountTypeDescription;

	private String accountRelationship;

	private String relationshipDescription;

	private String branchName;

	private String depositTypeCode;

	private String typeDescription;

	private String currencyType;

	private String depositType;

	private BigDecimal rate;

	private BigDecimal ODLimit;

	private BigDecimal ledgerBalance;

	private String NPLStatus;

	private String carCode;

	public Long getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(Long customerNumber) {
		this.customerNumber = customerNumber;
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

	public String getAccountTypeDescription() {
		return accountTypeDescription;
	}

	public void setAccountTypeDescription(String accountTypeDescription) {
		this.accountTypeDescription = accountTypeDescription;
	}

	public String getAccountRelationship() {
		return accountRelationship;
	}

	public void setAccountRelationship(String accountRelationship) {
		this.accountRelationship = accountRelationship;
	}

	public String getRelationshipDescription() {
		return relationshipDescription;
	}

	public void setRelationshipDescription(String relationshipDescription) {
		this.relationshipDescription = relationshipDescription;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getDepositTypeCode() {
		return depositTypeCode;
	}

	public void setDepositTypeCode(String depositTypeCode) {
		this.depositTypeCode = depositTypeCode;
	}

	public String getTypeDescription() {
		return typeDescription;
	}

	public void setTypeDescription(String typeDescription) {
		this.typeDescription = typeDescription;
	}

	public String getCurrencyType() {
		return currencyType;
	}

	public void setCurrencyType(String currencyType) {
		this.currencyType = currencyType;
	}

	public String getDepositType() {
		return depositType;
	}

	public void setDepositType(String depositType) {
		this.depositType = depositType;
	}

	public BigDecimal getRate() {
		return rate;
	}

	public void setRate(BigDecimal rate) {
		this.rate = rate;
	}

	public BigDecimal getODLimit() {
		return ODLimit;
	}

	public void setODLimit(BigDecimal ODLimit) {
		this.ODLimit = ODLimit;
	}

	public BigDecimal getLedgerBalance() {
		return ledgerBalance;
	}

	public void setLedgerBalance(BigDecimal ledgerBalance) {
		this.ledgerBalance = ledgerBalance;
	}

	public String getNPLStatus() {
		return NPLStatus;
	}

	public void setNPLStatus(String status) {
		NPLStatus = status;
	}

	public String getCarCode() {
		return carCode;
	}

	public void setCarCode(String carCode) {
		this.carCode = carCode;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");
		result.append(newLine + printHeaderString() + newLine);
		result.append(this.getClass().getName() + " Object {" + newLine);
		result.append(" customerNumber: " + customerNumber + newLine);
		result.append(" accountType: " + accountType + newLine);
		result.append(" accountNumber: " + accountNumber + newLine);
		result.append(" accountTypeDescription: " + accountTypeDescription + newLine);
		result.append(" accountRelationship: " + accountRelationship + newLine);
		result.append(" relationshipDescription: " + relationshipDescription + newLine);
		result.append(" branchName: " + branchName + newLine);
		result.append(" depositTypeCode: " + depositTypeCode + newLine);
		result.append(" typeDescription: " + typeDescription + newLine);
		result.append(" currencyType: " + currencyType + newLine);
		result.append(" depositType: " + depositType + newLine);
		result.append(" rate: " + rate + newLine);
		result.append(" ODLimit: " + ODLimit + newLine);
		result.append(" ledgerBalance: " + ledgerBalance + newLine);
		result.append(" NPLStatus: " + NPLStatus + newLine);
		result.append(" carCode: " + carCode + newLine);
		result.append("}");

		return result.toString();

	}

	public void setSuccessResponse() {
	}
}

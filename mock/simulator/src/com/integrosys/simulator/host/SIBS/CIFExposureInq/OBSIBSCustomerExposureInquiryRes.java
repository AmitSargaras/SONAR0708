package com.integrosys.simulator.host.SIBS.CIFExposureInq;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCustomerExposureInquiryRes extends OBMessageHeader implements IOBHost {

	private Long customerNumber;

	private String accountType;

	private Long accountNumber;

	private String accountTypeDescription;

	private String accountRelationship;

	private String relationshipDescription;

	private String formattedShortName;

	private String loanType;

	private String typeDescription;

	private String productGroup;

	private String currencyType;

	private Date nextBusinessDate;

	private BigDecimal originalBalance;

	private BigDecimal loanInterestRate;

	private Long loanTerm;

	private String loanTermCode;

	private BigDecimal paymentAmount;

	private BigDecimal finalPayment;

	private BigDecimal outstandingBalance;

	private Long remainLongTerm;

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

	public String getFormattedShortName() {
		return formattedShortName;
	}

	public void setFormattedShortName(String formattedShortName) {
		this.formattedShortName = formattedShortName;
	}

	public String getLoanType() {
		return loanType;
	}

	public void setLoanType(String loanType) {
		this.loanType = loanType;
	}

	public String getTypeDescription() {
		return typeDescription;
	}

	public void setTypeDescription(String typeDescription) {
		this.typeDescription = typeDescription;
	}

	public String getProductGroup() {
		return productGroup;
	}

	public void setProductGroup(String productGroup) {
		this.productGroup = productGroup;
	}

	public String getCurrencyType() {
		return currencyType;
	}

	public void setCurrencyType(String currencyType) {
		this.currencyType = currencyType;
	}

	public Date getNextBusinessDate() {
		return nextBusinessDate;
	}

	public void setNextBusinessDate(Date nextBusinessDate) {
		this.nextBusinessDate = nextBusinessDate;
	}

	public BigDecimal getOriginalBalance() {
		return originalBalance;
	}

	public void setOriginalBalance(BigDecimal originalBalance) {
		this.originalBalance = originalBalance;
	}

	public BigDecimal getLoanInterestRate() {
		return loanInterestRate;
	}

	public void setLoanInterestRate(BigDecimal loanInterestRate) {
		this.loanInterestRate = loanInterestRate;
	}

	public Long getLoanTerm() {
		return loanTerm;
	}

	public void setLoanTerm(Long loanTerm) {
		this.loanTerm = loanTerm;
	}

	public String getLoanTermCode() {
		return loanTermCode;
	}

	public void setLoanTermCode(String loanTermCode) {
		this.loanTermCode = loanTermCode;
	}

	public BigDecimal getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(BigDecimal paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public BigDecimal getFinalPayment() {
		return finalPayment;
	}

	public void setFinalPayment(BigDecimal finalPayment) {
		this.finalPayment = finalPayment;
	}

	public BigDecimal getOutstandingBalance() {
		return outstandingBalance;
	}

	public void setOutstandingBalance(BigDecimal outstandingBalance) {
		this.outstandingBalance = outstandingBalance;
	}

	public Long getRemainLongTerm() {
		return remainLongTerm;
	}

	public void setRemainLongTerm(Long remainLongTerm) {
		this.remainLongTerm = remainLongTerm;
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
		result.append(" loanType: " + loanType + newLine);
		result.append(" typeDescription: " + typeDescription + newLine);
		result.append(" productGroup: " + productGroup + newLine);
		result.append(" currencyType: " + currencyType + newLine);
		result.append(" nextBusinessDate: " + nextBusinessDate + newLine);
		result.append(" originalBalance: " + originalBalance + newLine);
		result.append(" loanInterestRate: " + loanInterestRate + newLine);
		result.append(" loanTerm: " + loanTerm + newLine);
		result.append(" loanTermCode: " + loanTermCode + newLine);
		result.append(" paymentAmount: " + paymentAmount + newLine);
		result.append(" finalPayment: " + finalPayment + newLine);
		result.append(" outstandingBalance: " + outstandingBalance + newLine);
		result.append(" remainLongTerm: " + remainLongTerm + newLine);
		result.append("}");

		return result.toString();

	}

	public void setSuccessResponse() {
	}
}
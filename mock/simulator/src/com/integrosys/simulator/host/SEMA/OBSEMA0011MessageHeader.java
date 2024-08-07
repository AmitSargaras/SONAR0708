package com.integrosys.simulator.host.SEMA;

import java.math.BigDecimal;
import java.util.ArrayList;

public class OBSEMA0011MessageHeader {

	// Message Header
	private int socketMessageLength;

	private String transactionCode;

	private Long msgDate;

	private Long referenceNumber;

	private String messageId;

	private String responseCode;

	private String responseMessage;

	private String rlosUserId;

	private Integer numberOfTxnMessage;

	private String moreRecordIndicator;

	private String lastRecordKey;

	private Short bankNumber;

	private String customerNumber;

	private String customerName;

	private String customerStatus;

	private String customerIdType;

	private String customerNewICNumber;

	private String customerOldICNumber;

	private String customerWorkerId;

	private BigDecimal customerCreditLimit;

	private BigDecimal customerCashLimit;

	private BigDecimal customerTotalOSBalance;

	private BigDecimal customerOSCashBalance;

	private BigDecimal customerAvailCreditLimit;

	private BigDecimal customerAvailCashLimit;

	private BigDecimal customerOSAuthorisation;

	private BigDecimal customerOSCashAuthorisation;

	protected ArrayList responseFixList;

	public String getTransactionCode() {
		return transactionCode;
	}

	public void setTransactionCode(String transactionCode) {
		this.transactionCode = transactionCode;
	}

	public Long getMsgDate() {
		return msgDate;
	}

	public void setMsgDate(Long msgDate) {
		this.msgDate = msgDate;
	}

	public Long getReferenceNumber() {
		return referenceNumber;
	}

	public void setReferenceNumber(Long referenceNumber) {
		this.referenceNumber = referenceNumber;
	}

	public String getMessageId() {
		return messageId;
	}

	public void setMessageId(String messageId) {
		this.messageId = messageId;
	}

	public String getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(String responseCode) {
		this.responseCode = responseCode;
	}

	public String getResponseMessage() {
		return responseMessage;
	}

	public void setResponseMessage(String responseMessage) {
		this.responseMessage = responseMessage;
	}

	public String getRlosUserId() {
		return rlosUserId;
	}

	public void setRlosUserId(String rlosUserId) {
		this.rlosUserId = rlosUserId;
	}

	public Integer getNumberOfTxnMessage() {
		return numberOfTxnMessage;
	}

	public void setNumberOfTxnMessage(Integer numberOfTxnMessage) {
		this.numberOfTxnMessage = numberOfTxnMessage;
	}

	public String getMoreRecordIndicator() {
		return moreRecordIndicator;
	}

	public void setMoreRecordIndicator(String moreRecordIndicator) {
		this.moreRecordIndicator = moreRecordIndicator;
	}

	public String getLastRecordKey() {
		return lastRecordKey;
	}

	public void setLastRecordKey(String lastRecordKey) {
		this.lastRecordKey = lastRecordKey;
	}

	public Short getBankNumber() {
		return bankNumber;
	}

	public void setBankNumber(Short bankNumber) {
		this.bankNumber = bankNumber;
	}

	public String getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(String customerNumber) {
		this.customerNumber = customerNumber;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerStatus() {
		return customerStatus;
	}

	public void setCustomerStatus(String customerStatus) {
		this.customerStatus = customerStatus;
	}

	public String getCustomerIdType() {
		return customerIdType;
	}

	public void setCustomerIdType(String customerIdType) {
		this.customerIdType = customerIdType;
	}

	public String getCustomerNewICNumber() {
		return customerNewICNumber;
	}

	public void setCustomerNewICNumber(String customerNewICNumber) {
		this.customerNewICNumber = customerNewICNumber;
	}

	public String getCustomerOldICNumber() {
		return customerOldICNumber;
	}

	public void setCustomerOldICNumber(String customerOldICNumber) {
		this.customerOldICNumber = customerOldICNumber;
	}

	public String getCustomerWorkerId() {
		return customerWorkerId;
	}

	public void setCustomerWorkerId(String customerWorkerId) {
		this.customerWorkerId = customerWorkerId;
	}

	public BigDecimal getCustomerCreditLimit() {
		return customerCreditLimit;
	}

	public void setCustomerCreditLimit(BigDecimal customerCreditLimit) {
		this.customerCreditLimit = customerCreditLimit;
	}

	public BigDecimal getCustomerCashLimit() {
		return customerCashLimit;
	}

	public void setCustomerCashLimit(BigDecimal customerCashLimit) {
		this.customerCashLimit = customerCashLimit;
	}

	public BigDecimal getCustomerTotalOSBalance() {
		return customerTotalOSBalance;
	}

	public void setCustomerTotalOSBalance(BigDecimal customerTotalOSBalance) {
		this.customerTotalOSBalance = customerTotalOSBalance;
	}

	public BigDecimal getCustomerOSCashBalance() {
		return customerOSCashBalance;
	}

	public void setCustomerOSCashBalance(BigDecimal customerOSCashBalance) {
		this.customerOSCashBalance = customerOSCashBalance;
	}

	public BigDecimal getCustomerAvailCreditLimit() {
		return customerAvailCreditLimit;
	}

	public void setCustomerAvailCreditLimit(BigDecimal customerAvailCreditLimit) {
		this.customerAvailCreditLimit = customerAvailCreditLimit;
	}

	public BigDecimal getCustomerAvailCashLimit() {
		return customerAvailCashLimit;
	}

	public void setCustomerAvailCashLimit(BigDecimal customerAvailCashLimit) {
		this.customerAvailCashLimit = customerAvailCashLimit;
	}

	public BigDecimal getCustomerOSAuthorisation() {
		return customerOSAuthorisation;
	}

	public void setCustomerOSAuthorisation(BigDecimal customerOSAuthorisation) {
		this.customerOSAuthorisation = customerOSAuthorisation;
	}

	public BigDecimal getCustomerOSCashAuthorisation() {
		return customerOSCashAuthorisation;
	}

	public void setCustomerOSCashAuthorisation(BigDecimal customerOSCashAuthorisation) {
		this.customerOSCashAuthorisation = customerOSCashAuthorisation;
	}

	public ArrayList getResponseFixList() {
		return responseFixList;
	}

	public void setResponseFixList(ArrayList responseFixList) {
		this.responseFixList = responseFixList;
	}

	public String printHeaderString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append("OBSEMA0011MessageHeader" + " Object {" + newLine);
		result.append(" socketMessageLength: " + socketMessageLength + newLine);
		result.append(" transactionCode: " + transactionCode + newLine);
		result.append(" msgDate: " + msgDate + newLine);
		result.append(" referenceNumber: " + referenceNumber + newLine);
		result.append(" messageId: " + messageId + newLine);
		result.append(" responseCode: " + responseCode + newLine);
		result.append(" responseMessage: " + responseMessage + newLine);
		result.append(" rlosUserId: " + rlosUserId + newLine);
		result.append(" numberOfTxnMessage: " + numberOfTxnMessage + newLine);
		result.append(" moreRecordIndicator: " + moreRecordIndicator + newLine);
		result.append(" lastRecordKey: " + lastRecordKey + newLine);
		result.append(" bankNumber: " + bankNumber + newLine);
		result.append(" customerNumber: " + customerNumber + newLine);
		result.append(" customerName: " + customerName + newLine);
		result.append(" customerStatus: " + customerStatus + newLine);
		result.append(" customerIdType: " + customerIdType + newLine);
		result.append(" customerNewICNumber: " + customerNewICNumber + newLine);
		result.append(" customerOldICNumber: " + customerOldICNumber + newLine);
		result.append(" customerWorkerId: " + customerWorkerId + newLine);
		result.append(" customerCreditLimit: " + customerCreditLimit + newLine);
		result.append(" customerCashLimit: " + customerCashLimit + newLine);
		result.append(" customerTotalOSBalance: " + customerTotalOSBalance + newLine);
		result.append(" customerOSCashBalance: " + customerOSCashBalance + newLine);
		result.append(" customerAvailCreditLimit: " + customerAvailCreditLimit + newLine);
		result.append(" customerAvailCashLimit: " + customerAvailCashLimit + newLine);
		result.append(" customerOSAuthorisation: " + customerOSAuthorisation + newLine);
		result.append(" customerOSCashAuthorisation: " + customerOSCashAuthorisation + newLine);
		result.append("}");

		return result.toString();

	}

	public int getSocketMessageLength() {
		return socketMessageLength;
	}

	public void setSocketMessageLength(int socketMessageLength) {
		this.socketMessageLength = socketMessageLength;
	}

}

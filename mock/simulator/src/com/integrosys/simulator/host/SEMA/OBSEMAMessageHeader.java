package com.integrosys.simulator.host.SEMA;

import java.util.ArrayList;

public class OBSEMAMessageHeader {

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

	public String printHeaderString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append("OBSEMAMessageHeader" + " Object {" + newLine);
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
		result.append("}");

		return result.toString();

	}

	public ArrayList getResponseFixList() {
		return responseFixList;
	}

	public void setResponseFixList(ArrayList responseFixList) {
		this.responseFixList = responseFixList;
	}

	public int getSocketMessageLength() {
		return socketMessageLength;
	}

	public void setSocketMessageLength(int socketMessageLength) {
		this.socketMessageLength = socketMessageLength;
	}

}

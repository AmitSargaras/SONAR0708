package com.integrosys.simulator.host.SIBS;

import java.util.ArrayList;

public class OBMessageHeader {

	private final static String SUCCESSFUL_RESPONSE = "AA";

	protected final static long SEQ_NUMBER = 999999999;

	// Socket message
	private int socketMessageLength;

	private String headerType;

	private String deviceName;

	private int socketNumber;

	private int portNumber;

	private String filler;

	// DSP message
	private int headerLength;

	private int messageLength;

	private Long versionNumber;

	private String headerFormatId;

	private String dataFormatId;

	private String sourceId;

	private String destinationId;

	private String routingNumber;

	private String messageStatus;

	private Long bankIdNumber;

	private Long node;

	private String exchangeId;

	private String scenarioNumber;

	private String transactionCode;

	private String retrieveRefNumber;

	private String acquireRefNumber;

	private Long transmissionNumber;

	private Long recordToLoaded;

	private Long errorToLoaded;

	private String userId;

	private String terminalId;

	private String supervisorId;

	private String moreRecordIndicator;

	private String cutOffIndicator;

	private String userData;

	// MBASE
	private String responseResultCode;

	private String mbaseUserId;

	private String referenceNumber;

	private String rebidNumber;

	private String blockMessageNumber;

	private String endOfGroupIndicator;

	private String mbaseSourceId;

	private String mbaseDestinationId;

	private String returnDataQueueName;

	private String mbaseTerminalId;

	private String bankNumber;

	private String branchNumber;

	private String reviewSupervisorId;

	private String transmitSupervisorId;

	private String hostSupervisorId;

	private String mbaseTransactionCode;

	private String actionCode;

	private String transactionMode;

	private int numberOfRetrieveRecord;

	private String mbaseMoreRecordIndicator;

	private String searchMethod;

	private String responseErrorCode1;

	private String responseErrorCode2;

	private String responseErrorCode3;

	private String responseErrorCode4;

	private String responseErrorCode5;

	private String responseReasonCode1;

	private String responseReasonCode2;

	private String responseReasonCode3;

	private String responseReasonCode4;

	private String responseReasonCode5;

	private String strTransactionDate;

	private String strTransactionTime;

	private String accoutNumber;

	private String accountType;

	private String cifNumber;

	private String mbaseFiller;

	private String uniqueKeyOption;

	private String uniqueKey;

	protected ArrayList responseFixList;

	public int getSocketMessageLength() {
		return socketMessageLength;
	}

	public void setSocketMessageLength(int socketMessageLength) {
		this.socketMessageLength = socketMessageLength;
	}

	public String getHeaderType() {
		return headerType;
	}

	public void setHeaderType(String headerType) {
		this.headerType = headerType;
	}

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public int getSocketNumber() {
		return socketNumber;
	}

	public void setSocketNumber(int socketNumber) {
		this.socketNumber = socketNumber;
	}

	public int getPortNumber() {
		return portNumber;
	}

	public void setPortNumber(int portNumber) {
		this.portNumber = portNumber;
	}

	public String getFiller() {
		return filler;
	}

	public void setFiller(String filler) {
		this.filler = filler;
	}

	public int getHeaderLength() {
		return headerLength;
	}

	public void setHeaderLength(int headerLength) {
		this.headerLength = headerLength;
	}

	public int getMessageLength() {
		return messageLength;
	}

	public void setMessageLength(int messageLength) {
		this.messageLength = messageLength;
	}

	public Long getVersionNumber() {
		return versionNumber;
	}

	public void setVersionNumber(Long versionNumber) {
		this.versionNumber = versionNumber;
	}

	public String getHeaderFormatId() {
		return headerFormatId;
	}

	public void setHeaderFormatId(String headerFormatId) {
		this.headerFormatId = headerFormatId;
	}

	public String getDataFormatId() {
		return dataFormatId;
	}

	public void setDataFormatId(String dataFormatId) {
		this.dataFormatId = dataFormatId;
	}

	public String getSourceId() {
		return sourceId;
	}

	public void setSourceId(String sourceId) {
		this.sourceId = sourceId;
	}

	public String getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(String destinationId) {
		this.destinationId = destinationId;
	}

	public String getRoutingNumber() {
		return routingNumber;
	}

	public void setRoutingNumber(String routingNumber) {
		this.routingNumber = routingNumber;
	}

	public String getMessageStatus() {
		return messageStatus;
	}

	public void setMessageStatus(String messageStatus) {
		this.messageStatus = messageStatus;
	}

	public Long getBankIdNumber() {
		return bankIdNumber;
	}

	public void setBankIdNumber(Long bankIdNumber) {
		this.bankIdNumber = bankIdNumber;
	}

	public Long getNode() {
		return node;
	}

	public void setNode(Long node) {
		this.node = node;
	}

	public String getExchangeId() {
		return exchangeId;
	}

	public void setExchangeId(String exchangeId) {
		this.exchangeId = exchangeId;
	}

	public String getScenarioNumber() {
		return scenarioNumber;
	}

	public void setScenarioNumber(String scenarioNumber) {
		this.scenarioNumber = scenarioNumber;
	}

	public String getTransactionCode() {
		return transactionCode;
	}

	public void setTransactionCode(String transactionCode) {
		this.transactionCode = transactionCode;
	}

	public String getRetrieveRefNumber() {
		return retrieveRefNumber;
	}

	public void setRetrieveRefNumber(String retrieveRefNumber) {
		this.retrieveRefNumber = retrieveRefNumber;
	}

	public String getAcquireRefNumber() {
		return acquireRefNumber;
	}

	public void setAcquireRefNumber(String acquireRefNumber) {
		this.acquireRefNumber = acquireRefNumber;
	}

	public Long getTransmissionNumber() {
		return transmissionNumber;
	}

	public void setTransmissionNumber(Long transmissionNumber) {
		this.transmissionNumber = transmissionNumber;
	}

	public Long getRecordToLoaded() {
		return recordToLoaded;
	}

	public void setRecordToLoaded(Long recordToLoaded) {
		this.recordToLoaded = recordToLoaded;
	}

	public Long getErrorToLoaded() {
		return errorToLoaded;
	}

	public void setErrorToLoaded(Long errorToLoaded) {
		this.errorToLoaded = errorToLoaded;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTerminalId() {
		return terminalId;
	}

	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}

	public String getSupervisorId() {
		return supervisorId;
	}

	public void setSupervisorId(String supervisorId) {
		this.supervisorId = supervisorId;
	}

	public String getMoreRecordIndicator() {
		return moreRecordIndicator;
	}

	public void setMoreRecordIndicator(String moreRecordIndicator) {
		this.moreRecordIndicator = moreRecordIndicator;
	}

	public String getCutOffIndicator() {
		return cutOffIndicator;
	}

	public void setCutOffIndicator(String cutOffIndicator) {
		this.cutOffIndicator = cutOffIndicator;
	}

	public String getUserData() {
		return userData;
	}

	public void setUserData(String userData) {
		this.userData = userData;
	}

	public String getResponseResultCode() {
		return responseResultCode;
	}

	public void setResponseResultCode(String responseResultCode) {
		this.responseResultCode = responseResultCode;
	}

	public String getMbaseUserId() {
		return mbaseUserId;
	}

	public void setMbaseUserId(String mbaseUserId) {
		this.mbaseUserId = mbaseUserId;
	}

	public String getReferenceNumber() {
		return referenceNumber;
	}

	public void setReferenceNumber(String referenceNumber) {
		this.referenceNumber = referenceNumber;
	}

	public String getRebidNumber() {
		return rebidNumber;
	}

	public void setRebidNumber(String rebidNumber) {
		this.rebidNumber = rebidNumber;
	}

	public String getBlockMessageNumber() {
		return blockMessageNumber;
	}

	public void setBlockMessageNumber(String blockMessageNumber) {
		this.blockMessageNumber = blockMessageNumber;
	}

	public String getEndOfGroupIndicator() {
		return endOfGroupIndicator;
	}

	public void setEndOfGroupIndicator(String endOfGroupIndicator) {
		this.endOfGroupIndicator = endOfGroupIndicator;
	}

	public String getMbaseSourceId() {
		return mbaseSourceId;
	}

	public void setMbaseSourceId(String mbaseSourceId) {
		this.mbaseSourceId = mbaseSourceId;
	}

	public String getMbaseDestinationId() {
		return mbaseDestinationId;
	}

	public void setMbaseDestinationId(String mbaseDestinationId) {
		this.mbaseDestinationId = mbaseDestinationId;
	}

	public String getReturnDataQueueName() {
		return returnDataQueueName;
	}

	public void setReturnDataQueueName(String returnDataQueueName) {
		this.returnDataQueueName = returnDataQueueName;
	}

	public String getMbaseTerminalId() {
		return mbaseTerminalId;
	}

	public void setMbaseTerminalId(String mbaseTerminalId) {
		this.mbaseTerminalId = mbaseTerminalId;
	}

	public String getBankNumber() {
		return bankNumber;
	}

	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}

	public String getBranchNumber() {
		return branchNumber;
	}

	public void setBranchNumber(String branchNumber) {
		this.branchNumber = branchNumber;
	}

	public String getReviewSupervisorId() {
		return reviewSupervisorId;
	}

	public void setReviewSupervisorId(String reviewSupervisorId) {
		this.reviewSupervisorId = reviewSupervisorId;
	}

	public String getTransmitSupervisorId() {
		return transmitSupervisorId;
	}

	public void setTransmitSupervisorId(String transmitSupervisorId) {
		this.transmitSupervisorId = transmitSupervisorId;
	}

	public String getHostSupervisorId() {
		return hostSupervisorId;
	}

	public void setHostSupervisorId(String hostSupervisorId) {
		this.hostSupervisorId = hostSupervisorId;
	}

	public String getMbaseTransactionCode() {
		return mbaseTransactionCode;
	}

	public void setMbaseTransactionCode(String mbaseTransactionCode) {
		this.mbaseTransactionCode = mbaseTransactionCode;
	}

	public String getActionCode() {
		return actionCode;
	}

	public void setActionCode(String actionCode) {
		this.actionCode = actionCode;
	}

	public String getTransactionMode() {
		return transactionMode;
	}

	public void setTransactionMode(String transactionMode) {
		this.transactionMode = transactionMode;
	}

	public int getNumberOfRetrieveRecord() {
		return numberOfRetrieveRecord;
	}

	public void setNumberOfRetrieveRecord(int numberOfRetrieveRecord) {
		this.numberOfRetrieveRecord = numberOfRetrieveRecord;
	}

	public String getMbaseMoreRecordIndicator() {
		return mbaseMoreRecordIndicator;
	}

	public void setMbaseMoreRecordIndicator(String mbaseMoreRecordIndicator) {
		this.mbaseMoreRecordIndicator = mbaseMoreRecordIndicator;
	}

	public String getSearchMethod() {
		return searchMethod;
	}

	public void setSearchMethod(String searchMethod) {
		this.searchMethod = searchMethod;
	}

	public String getResponseErrorCode1() {
		return responseErrorCode1;
	}

	public void setResponseErrorCode1(String responseErrorCode1) {
		this.responseErrorCode1 = responseErrorCode1;
	}

	public String getResponseErrorCode2() {
		return responseErrorCode2;
	}

	public void setResponseErrorCode2(String responseErrorCode2) {
		this.responseErrorCode2 = responseErrorCode2;
	}

	public String getResponseErrorCode3() {
		return responseErrorCode3;
	}

	public void setResponseErrorCode3(String responseErrorCode3) {
		this.responseErrorCode3 = responseErrorCode3;
	}

	public String getResponseErrorCode4() {
		return responseErrorCode4;
	}

	public void setResponseErrorCode4(String responseErrorCode4) {
		this.responseErrorCode4 = responseErrorCode4;
	}

	public String getResponseErrorCode5() {
		return responseErrorCode5;
	}

	public void setResponseErrorCode5(String responseErrorCode5) {
		this.responseErrorCode5 = responseErrorCode5;
	}

	public String getResponseReasonCode1() {
		return responseReasonCode1;
	}

	public void setResponseReasonCode1(String responseReasonCode1) {
		this.responseReasonCode1 = responseReasonCode1;
	}

	public String getResponseReasonCode2() {
		return responseReasonCode2;
	}

	public void setResponseReasonCode2(String responseReasonCode2) {
		this.responseReasonCode2 = responseReasonCode2;
	}

	public String getResponseReasonCode3() {
		return responseReasonCode3;
	}

	public void setResponseReasonCode3(String responseReasonCode3) {
		this.responseReasonCode3 = responseReasonCode3;
	}

	public String getResponseReasonCode4() {
		return responseReasonCode4;
	}

	public void setResponseReasonCode4(String responseReasonCode4) {
		this.responseReasonCode4 = responseReasonCode4;
	}

	public String getResponseReasonCode5() {
		return responseReasonCode5;
	}

	public void setResponseReasonCode5(String responseReasonCode5) {
		this.responseReasonCode5 = responseReasonCode5;
	}

	public String getStrTransactionDate() {
		return strTransactionDate;
	}

	public void setStrTransactionDate(String strTransactionDate) {
		this.strTransactionDate = strTransactionDate;
	}

	public String getStrTransactionTime() {
		return strTransactionTime;
	}

	public void setStrTransactionTime(String strTransactionTime) {
		this.strTransactionTime = strTransactionTime;
	}

	public String getAccoutNumber() {
		return accoutNumber;
	}

	public void setAccoutNumber(String accoutNumber) {
		this.accoutNumber = accoutNumber;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getCifNumber() {
		return cifNumber;
	}

	public void setCifNumber(String cifNumber) {
		this.cifNumber = cifNumber;
	}

	public String getMbaseFiller() {
		return mbaseFiller;
	}

	public void setMbaseFiller(String mbaseFiller) {
		this.mbaseFiller = mbaseFiller;
	}

	public String getUniqueKeyOption() {
		return uniqueKeyOption;
	}

	public void setUniqueKeyOption(String uniqueKeyOption) {
		this.uniqueKeyOption = uniqueKeyOption;
	}

	public String getUniqueKey() {
		return uniqueKey;
	}

	public void setUniqueKey(String uniqueKey) {
		this.uniqueKey = uniqueKey;
	}

	public ArrayList getResponseFixList() {
		return responseFixList;
	}

	public void setResponseFixList(ArrayList responseFixList) {
		this.responseFixList = responseFixList;
	}

	public void setCommonSuccessResponse() {
		setResponseResultCode(SUCCESSFUL_RESPONSE);
		setNumberOfRetrieveRecord(responseFixList != null ? responseFixList.size() : 0);
	}

	public String printHeaderString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append("OBMessageHeader" + " Object {" + newLine);
		result.append(" socketMessageLength: " + socketMessageLength + newLine);
		result.append(" headerType: " + headerType + newLine);
		result.append(" deviceName: " + deviceName + newLine);
		result.append(" socketNumber: " + socketNumber + newLine);
		result.append(" portNumber: " + portNumber + newLine);
		result.append(" filler: " + filler + newLine);
		result.append(" headerLength: " + headerLength + newLine);
		result.append(" messageLength: " + messageLength + newLine);
		result.append(" versionNumber: " + versionNumber + newLine);
		result.append(" headerFormatId: " + headerFormatId + newLine);
		result.append(" dataFormatId: " + dataFormatId + newLine);
		result.append(" sourceId: " + sourceId + newLine);
		result.append(" destinationId: " + destinationId + newLine);
		result.append(" routingNumber: " + routingNumber + newLine);
		result.append(" messageStatus: " + messageStatus + newLine);
		result.append(" bankIdNumber: " + bankIdNumber + newLine);
		result.append(" node: " + node + newLine);
		result.append(" exchangeId: " + exchangeId + newLine);
		result.append(" scenarioNumber: " + scenarioNumber + newLine);
		result.append(" transactionCode: " + transactionCode + newLine);
		result.append(" retrieveRefNumber: " + retrieveRefNumber + newLine);
		result.append(" acquireRefNumber: " + acquireRefNumber + newLine);
		result.append(" transmissionNumber: " + transmissionNumber + newLine);
		result.append(" recordToLoaded: " + recordToLoaded + newLine);
		result.append(" errorToLoaded: " + errorToLoaded + newLine);
		result.append(" userId: " + userId + newLine);
		result.append(" terminalId: " + terminalId + newLine);
		result.append(" supervisorId: " + supervisorId + newLine);
		result.append(" moreRecordIndicator: " + moreRecordIndicator + newLine);
		result.append(" cutOffIndicator: " + cutOffIndicator + newLine);
		result.append(" userData: " + userData + newLine);
		result.append(" responseResultCode: " + responseResultCode + newLine);
		result.append(" mbaseUserId: " + mbaseUserId + newLine);
		result.append(" referenceNumber: " + referenceNumber + newLine);
		result.append(" rebidNumber: " + rebidNumber + newLine);
		result.append(" blockMessageNumber: " + blockMessageNumber + newLine);
		result.append(" endOfGroupIndicator: " + endOfGroupIndicator + newLine);
		result.append(" mbaseSourceId: " + mbaseSourceId + newLine);
		result.append(" mbaseDestinationId: " + mbaseDestinationId + newLine);
		result.append(" returnDataQueueName: " + returnDataQueueName + newLine);
		result.append(" mbaseTerminalId: " + mbaseTerminalId + newLine);
		result.append(" bankNumber: " + bankNumber + newLine);
		result.append(" branchNumber: " + branchNumber + newLine);
		result.append(" reviewSupervisorId: " + reviewSupervisorId + newLine);
		result.append(" transmitSupervisorId: " + transmitSupervisorId + newLine);
		result.append(" hostSupervisorId: " + hostSupervisorId + newLine);
		result.append(" mbaseTransactionCode: " + mbaseTransactionCode + newLine);
		result.append(" actionCode: " + actionCode + newLine);
		result.append(" transactionMode: " + transactionMode + newLine);
		result.append(" numberOfRetrieveRecord: " + numberOfRetrieveRecord + newLine);
		result.append(" mbaseMoreRecordIndicator: " + mbaseMoreRecordIndicator + newLine);
		result.append(" searchMethod: " + searchMethod + newLine);
		result.append(" responseErrorCode1: " + responseErrorCode1 + newLine);
		result.append(" responseErrorCode2: " + responseErrorCode2 + newLine);
		result.append(" responseErrorCode3: " + responseErrorCode3 + newLine);
		result.append(" responseErrorCode4: " + responseErrorCode4 + newLine);
		result.append(" responseErrorCode5: " + responseErrorCode5 + newLine);
		result.append(" responseReasonCode1: " + responseReasonCode1 + newLine);
		result.append(" responseReasonCode2: " + responseReasonCode2 + newLine);
		result.append(" responseReasonCode3: " + responseReasonCode3 + newLine);
		result.append(" responseReasonCode4: " + responseReasonCode4 + newLine);
		result.append(" responseReasonCode5: " + responseReasonCode5 + newLine);
		result.append(" strTransactionDate: " + strTransactionDate + newLine);
		result.append(" strTransactionTime: " + strTransactionTime + newLine);
		result.append(" accoutNumber: " + accoutNumber + newLine);
		result.append(" accountType: " + accountType + newLine);
		result.append(" cifNumber: " + cifNumber + newLine);
		result.append(" mbaseFiller: " + mbaseFiller + newLine);
		result.append(" uniqueKeyOption: " + uniqueKeyOption + newLine);
		result.append(" uniqueKey: " + uniqueKey + newLine);
		result.append("}");

		return result.toString();

	}

}

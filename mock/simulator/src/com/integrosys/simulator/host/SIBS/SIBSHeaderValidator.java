package com.integrosys.simulator.host.SIBS;

import com.integrosys.simulator.host.base.helper.HostException;
import com.integrosys.simulator.host.base.validator.HostCommonValidator;

public class SIBSHeaderValidator extends HostCommonValidator {

	public static void validateRequest(Object obj) throws Exception {
		StringBuffer errorBuffer = new StringBuffer();
		OBMessageHeader msgHeaderObj = (OBMessageHeader) obj;

		// socket header validation
		// Validate on [int] : socketMessageLength
		validateInt("socketMessageLength", msgHeaderObj.getSocketMessageLength(), true, errorBuffer);
		// Validate on [String] : headerType
		validateString("headerType", msgHeaderObj.getHeaderType(), 1, 5, true, errorBuffer);
		// Validate on [String] : deviceName
		validateString("deviceName", msgHeaderObj.getDeviceName(), 1, 15, false, errorBuffer);
		// Validate on [int] : socketNumber
		validateInt("socketNumber", msgHeaderObj.getSocketNumber(), false, 5, errorBuffer);
		// Validate on [int] : portNumber
		validateInt("portNumber", msgHeaderObj.getPortNumber(), false, 6, errorBuffer);
		// Validate on [String] : filler
		validateString("filler", msgHeaderObj.getFiller(), 1, 1, false, errorBuffer);

		// DSP header validation
		// Validate on [int] : headerLength
		validateInt("headerLength", msgHeaderObj.getHeaderLength(), false, 4, errorBuffer);
		// Validate on [int] : messageLength
		validateInt("messageLength", msgHeaderObj.getMessageLength(), false, 6, errorBuffer);
		// Validate on [Long] : versionNumber
		validateLong("versionNumber", msgHeaderObj.getVersionNumber(), false, 4, errorBuffer);
		// Validate on [String] : headerFormatId
		validateString("headerFormatId", msgHeaderObj.getHeaderFormatId(), 1, 4, false, errorBuffer);
		// Validate on [String] : dataFormatId
		validateString("dataFormatId", msgHeaderObj.getDataFormatId(), 1, 10, false, errorBuffer);
		// Validate on [String] : sourceId
		validateString("sourceId", msgHeaderObj.getSourceId(), 1, 10, true, errorBuffer);
		// Validate on [String] : destinationId
		validateString("destinationId", msgHeaderObj.getDestinationId(), 1, 10, false, errorBuffer);
		// Validate on [String] : routingNumber
		validateString("routingNumber", msgHeaderObj.getRoutingNumber(), 1, 6, false, errorBuffer);
		// Validate on [String] : messageStatus
		validateString("messageStatus", msgHeaderObj.getMessageStatus(), 1, 8, false, errorBuffer);
		// Validate on [Long] : bankIdNumber
		validateLong("bankIdNumber", msgHeaderObj.getBankIdNumber(), true, 11, errorBuffer);
		// Validate on [Long] : node
		validateLong("node", msgHeaderObj.getNode(), true, 2, errorBuffer);
		// Validate on [String] : exchangeId
		validateString("exchangeId", msgHeaderObj.getExchangeId(), 1, 20, false, errorBuffer);
		// Validate on [String] : scenarioNumber
		validateString("scenarioNumber", msgHeaderObj.getScenarioNumber(), 1, 16, true, errorBuffer);
		// Validate on [String] : transactionCode
		validateString("transactionCode", msgHeaderObj.getTransactionCode(), 1, 4, true, errorBuffer);
		// Validate on [String] : retrieveRefNumber
		validateString("retrieveRefNumber", msgHeaderObj.getRetrieveRefNumber(), 1, 22, false, errorBuffer);
		// Validate on [String] : acquireRefNumber
		validateString("acquireRefNumber", msgHeaderObj.getAcquireRefNumber(), 1, 12, false, errorBuffer);
		// Validate on [Long] : transmissionNumber
		validateLong("transmissionNumber", msgHeaderObj.getTransmissionNumber(), true, 4, errorBuffer);
		// Validate on [Long] : recordToLoaded
		validateLong("recordToLoaded", msgHeaderObj.getRecordToLoaded(), true, 4, errorBuffer);
		// Validate on [Long] : errorToLoaded
		validateLong("errorToLoaded", msgHeaderObj.getErrorToLoaded(), true, 4, errorBuffer);
		// Validate on [String] : userId
		validateString("userId", msgHeaderObj.getUserId(), 1, 10, false, errorBuffer);
		// Validate on [String] : terminalId
		validateString("terminalId", msgHeaderObj.getTerminalId(), 1, 10, false, errorBuffer);
		// Validate on [String] : supervisorId
		validateString("supervisorId", msgHeaderObj.getSupervisorId(), 1, 10, false, errorBuffer);
		// Validate on [String] : moreRecordIndicator
		validateString("moreRecordIndicator", msgHeaderObj.getMoreRecordIndicator(), 1, 1, false, errorBuffer);
		// Validate on [String] : cutOffIndicator
		validateString("cutOffIndicator", msgHeaderObj.getCutOffIndicator(), 1, 1, false, errorBuffer);
		// Validate on [String] : userData
		validateString("userData", msgHeaderObj.getUserData(), 1, 20, false, errorBuffer);

		// MBASE header validation
		// Validate on [String] : responseResultCode
		validateString("responseResultCode", msgHeaderObj.getResponseResultCode(), 1, 2, false, errorBuffer);
		// Validate on [String] : mbaseUserId
		validateString("mbaseUserId", msgHeaderObj.getMbaseUserId(), 1, 10, true, errorBuffer);
		// Validate on [String] : referenceNumber
		validateString("referenceNumber", msgHeaderObj.getReferenceNumber(), 1, 7, true, errorBuffer);
		// Validate on [String] : rebidNumber
		validateString("rebidNumber", msgHeaderObj.getRebidNumber(), 1, 4, false, errorBuffer);
		// Validate on [String] : endOfGroupIndicator
		validateString("endOfGroupIndicator", msgHeaderObj.getEndOfGroupIndicator(), 1, 4, false, errorBuffer);
		// Validate on [String] : blockMessageNumber
		validateString("blockMessageNumber", msgHeaderObj.getBlockMessageNumber(), 1, 2, false, errorBuffer);
		// Validate on [String] : mbaseSourceId
		validateString("mbaseSourceId", msgHeaderObj.getMbaseSourceId(), 1, 3, true, errorBuffer);
		// Validate on [String] : mbaseDestinationId
		validateString("mbaseDestinationId", msgHeaderObj.getMbaseDestinationId(), 1, 3, true, errorBuffer);
		// Validate on [String] : returnDataQueueName
		validateString("returnDataQueueName", msgHeaderObj.getReturnDataQueueName(), 1, 10, true, errorBuffer);
		// Validate on [String] : mbaseTerminalId
		validateString("mbaseTerminalId", msgHeaderObj.getMbaseTerminalId(), 1, 10, true, errorBuffer);
		// Validate on [String] : bankNumber
		validateString("bankNumber", msgHeaderObj.getBankNumber(), 1, 2, true, errorBuffer);
		// Validate on [String] : branchNumber
		validateString("branchNumber", msgHeaderObj.getBranchNumber(), 1, 5, true, errorBuffer);
		// Validate on [String] : reviewSupervisorId
		validateString("eviewSupervisorId", msgHeaderObj.getReviewSupervisorId(), 1, 10, false, errorBuffer);
		// Validate on [String] : transmitSupervisorId
		validateString("transmitSupervisorId", msgHeaderObj.getTransmitSupervisorId(), 1, 10, false, errorBuffer);
		// Validate on [String] : hostSupervisorId
		validateString("hostSupervisorId", msgHeaderObj.getHostSupervisorId(), 1, 10, false, errorBuffer);
		// Validate on [String] : mbaseTransactionCode
		validateString("mbaseTransactionCode", msgHeaderObj.getMbaseTransactionCode(), 1, 5, true, errorBuffer);
		// Validate on [String] : actionCode
		validateString("actionCode", msgHeaderObj.getActionCode(), 1, 1, true, errorBuffer);
		// Validate on [String] : transactionMode
		validateString("transactionMode", msgHeaderObj.getTransactionMode(), 1, 1, true, errorBuffer);
		// Validate on [int] : numberOfRetrieveRecord
		validateInt("numberOfRetrieveRecord", msgHeaderObj.getNumberOfRetrieveRecord(), true, 3, errorBuffer);
		// Validate on [String] : mbaseMoreRecordIndicator
		validateString("mbaseMoreRecordIndicator", msgHeaderObj.getMbaseMoreRecordIndicator(), 1, 1, true, errorBuffer);
		// Validate on [String] : searchMethod
		validateString("searchMethod", msgHeaderObj.getSearchMethod(), 1, 1, true, errorBuffer);
		// Validate on [String] : responseErrorCode1
		validateString("responseErrorCode1", msgHeaderObj.getResponseErrorCode1(), 1, 7, false, errorBuffer);
		// Validate on [String] : responseReasonCode1
		validateString("responseReasonCode1", msgHeaderObj.getResponseReasonCode1(), 1, 50, false, errorBuffer);
		// Validate on [String] : responseErrorCode2
		validateString("responseErrorCode2", msgHeaderObj.getResponseErrorCode2(), 1, 7, false, errorBuffer);
		// Validate on [String] : responseReasonCode1
		validateString("responseReasonCode2", msgHeaderObj.getResponseReasonCode2(), 1, 50, false, errorBuffer);
		// Validate on [String] : responseErrorCode3
		validateString("responseErrorCode3", msgHeaderObj.getResponseErrorCode3(), 1, 7, false, errorBuffer);
		// Validate on [String] : responseReasonCode3
		validateString("responseReasonCode3", msgHeaderObj.getResponseReasonCode3(), 1, 50, true, errorBuffer);
		// Validate on [String] : responseErrorCode4
		validateString("responseErrorCode4", msgHeaderObj.getResponseErrorCode4(), 1, 7, false, errorBuffer);
		// Validate on [String] : responseReasonCode4
		validateString("responseReasonCode4", msgHeaderObj.getResponseReasonCode4(), 1, 50, false, errorBuffer);
		// Validate on [String] : responseErrorCode5
		validateString("responseErrorCode5", msgHeaderObj.getResponseErrorCode5(), 1, 7, false, errorBuffer);
		// Validate on [String] : responseReasonCode5
		validateString("responseReasonCode5", msgHeaderObj.getResponseReasonCode5(), 1, 50, false, errorBuffer);
		// Validate on [String] : strTransactionDate
		validateString("strTransactionDate", msgHeaderObj.getStrTransactionDate(), 1, 8, true, errorBuffer);
		// Validate on [String] : strTransactionTime
		validateString("strTransactionTime", msgHeaderObj.getStrTransactionTime(), 1, 6, true, errorBuffer);
		// Validate on [String] : accoutNumber
		validateString("accoutNumber", msgHeaderObj.getAccoutNumber(), 1, 19, true, errorBuffer);
		// Validate on [String] : accountType
		validateString("accountType", msgHeaderObj.getAccountType(), 1, 1, true, errorBuffer);
		// Validate on [String] : cifNumber
		validateString("cifNumber", msgHeaderObj.getCifNumber(), 1, 19, true, errorBuffer);
		// Validate on [String] : mbaseFiller
		validateString("mbaseFiller", msgHeaderObj.getMbaseFiller(), 1, 10, false, errorBuffer);
		// Validate on [String] : uniqueKeyOption
		validateString("uniqueKeyOption", msgHeaderObj.getUniqueKeyOption(), 1, 1, true, errorBuffer);
		// Validate on [String] : uniqueKey
		validateString("uniqueKey", msgHeaderObj.getUniqueKey(), 1, 21, false, errorBuffer);

		if (errorBuffer.length() > 0) {
			throw new HostException(errorBuffer.toString());
		}

	}

	public static void validateResponse(Object obj) throws Exception {

	}

}

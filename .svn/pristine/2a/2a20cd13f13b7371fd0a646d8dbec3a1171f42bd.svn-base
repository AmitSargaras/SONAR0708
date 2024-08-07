package com.integrosys.simulator.host.SEMA;

import com.integrosys.simulator.host.base.helper.HostException;
import com.integrosys.simulator.host.base.validator.HostCommonValidator;

public class SEMAHeaderValidator extends HostCommonValidator {

	public static void validateRequest(Object obj) throws Exception {
		StringBuffer errorBuffer = new StringBuffer();
		OBSEMAMessageHeader msgHeaderObj = (OBSEMAMessageHeader) obj;

		// Validate on [int] : socketMessageLength
		validateInt("socketMessageLength", msgHeaderObj.getSocketMessageLength(), true, errorBuffer);
		// Validate on [String] : transactionCode
		validateString("transactionCode", msgHeaderObj.getTransactionCode(), 4, 4, true, errorBuffer);
		// Validate on [Long] : dateTime
		validateLong("msgDate", msgHeaderObj.getMsgDate(), true, 14, errorBuffer);
		// Validate on [Long] : referenceNumber
		validateLong("referenceNumber", msgHeaderObj.getReferenceNumber(), true, 14, errorBuffer);
		// Validate on [String] : messageId
		validateString("messageId", msgHeaderObj.getMessageId(), 1, 40, true, errorBuffer);
		// Validate on [String] : responseCode
		validateString("responseCode", msgHeaderObj.getResponseCode(), 1, 4, false, errorBuffer);
		// Validate on [String] : responseMessage
		validateString("responseMessage", msgHeaderObj.getResponseMessage(), 1, 100, false, errorBuffer);
		// Validate on [String] : rlosUserId
		validateString("rlosUserId", msgHeaderObj.getRlosUserId(), 1, 20, true, errorBuffer);
		// Validate on [int] : numberOfTxnMessage
		validateInt("numberOfTxnMessage", msgHeaderObj.getNumberOfTxnMessage(), true, 2, errorBuffer);
		// Validate on [String] : moreRecordIndicator
		validateString("moreRecordIndicator", msgHeaderObj.getMoreRecordIndicator(), 1, 1, true, errorBuffer);
		// Validate on [String] : lastRecordKey
		validateString("lastRecordKey", msgHeaderObj.getLastRecordKey(), 1, 20, false, errorBuffer);

		if (errorBuffer.length() > 0) {
			throw new HostException(errorBuffer.toString());
		}

	}

	public static void validateResponse(Object obj) throws Exception {

	}

}

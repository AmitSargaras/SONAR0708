package com.integrosys.simulator.host.SEMA.custinfo;

import com.integrosys.simulator.host.SEMA.SEMAHeaderValidator;
import com.integrosys.simulator.host.base.helper.HostException;
import com.integrosys.simulator.host.base.validator.HostCommonValidator;

public class SEMACustomerInfoValidator extends HostCommonValidator {

	private static SEMACustomerInfoValidator instance = new SEMACustomerInfoValidator();

	private SEMACustomerInfoValidator() {
	}

	public static SEMACustomerInfoValidator getInstance() {
		return instance;
	}

	public static void validateRequest(Object obj) throws Exception {
		StringBuffer errorBuffer = new StringBuffer();
		OBSEMACustomerInfoReq custInfoReq = (OBSEMACustomerInfoReq) obj;

		// header validation
		SEMAHeaderValidator.validateRequest(obj);

		// Validate on [String] : customerIdType
		validateString("customerIdType", custInfoReq.getCustomerIdType(), 1, 1, false, errorBuffer);
		// Validate on [String] : customerIdNumber
		validateString("customerIdNumber", custInfoReq.getCustomerIdNumber(), 1, 16, false, errorBuffer);
		// Validate on [String] : cardNumber
		validateString("cardNumber", custInfoReq.getCardNumber(), 1, 19, false, errorBuffer);

		if (errorBuffer.length() > 0) {
			throw new HostException(errorBuffer.toString());
		}
	}

	public static void validateResponse(Object obj) throws Exception {

	}

}

package com.integrosys.simulator.host.base.validator;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.integrosys.base.techinfra.validation.Validator;

public class HostCommonValidator {

	private static String newLine = "<br/>";

	public HostCommonValidator() {
	}

	/**
	 * Validate string value
	 * 
	 * @param labelName Field name
	 * @param value Field value(String)
	 * @param mandatory Field mandatory(boolean)
	 * @param errorBuffer errorBuffer
	 */
	public static void validateString(String fieldName, String value, int min, int max, boolean mandatory,
			StringBuffer errorBuffer) {
		if (mandatory) {
			if (!Validator.validateMandatoryField(value)) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_INPUT_IS_MANDATORY + newLine);
			}
		}

		if (!Validator.checkString(value, false, min, max).equals(Validator.ERROR_NONE)) {
			errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_STR_LENGTH + newLine);
		}

	}

	/**
	 * Validate Long value
	 * 
	 * @param labelName Field name
	 * @param value Field value(Long)
	 * @param mandatory Field mandatory(boolean)
	 * @param length Field length(int)
	 * @param errorBuffer errorBuffer
	 */
	public static void validateLong(String fieldName, Long value, boolean mandatory, int length,
			StringBuffer errorBuffer) {

		if (mandatory) {
			if (!valueIsPresent(value)) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_INPUT_IS_MANDATORY + newLine);
			}
		}

		if (valueIsPresent(value)) {
			String longStr = String.valueOf(value);

			if (longStr.length() > length) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_STR_LENGTH + newLine);
			}
		}
	}

	/**
	 * Validate int value
	 * 
	 * @param labelName Field name
	 * @param value Field value(int)
	 * @param mandatory Field mandatory(boolean)
	 * @param length Field length(int)
	 * @param errorBuffer errorBuffer
	 */
	public static void validateInt(String fieldName, int value, boolean mandatory, int length, StringBuffer errorBuffer) {

		if (mandatory) {
			if (!valueIsPresent(value)) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_INPUT_IS_MANDATORY + newLine);
			}
		}

		if (valueIsPresent(value)) {
			String intStr = String.valueOf(value);

			if (intStr.length() > length) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_STR_LENGTH + newLine);
			}
		}
	}

	/**
	 * Validate int value
	 * 
	 * @param labelName Field name
	 * @param value Field value(int)
	 * @param mandatory Field mandatory(boolean)
	 * @param errorBuffer errorBuffer
	 */
	public static void validateInt(String fieldName, int value, boolean mandatory, StringBuffer errorBuffer) {

		if (mandatory) {
			if (!valueIsPresent(value)) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_INPUT_IS_MANDATORY + newLine);
			}
		}
	}

	/**
	 * Validate BigDecimal value
	 * 
	 * @param labelName Field name
	 * @param value Field value(BigDecimal)
	 * @param mandatory Field mandatory(boolean)
	 * @param value Field rateSize(int)
	 * @param mandatory Field maximumFractionSize(int)
	 * @param errorBuffer errorBuffer
	 */
	public static void validateBigDecimal(String fieldName, BigDecimal value, boolean mandatory, int rateSize,
			int maximumFractionSize, StringBuffer errorBuffer) {

		if (mandatory) {
			if (!valueIsPresent(value)) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_INPUT_IS_MANDATORY + newLine);
			}
		}

		if (valueIsPresent(value)) {
			if (isValidRateLength(value, rateSize, maximumFractionSize)) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_INVALID_BIGDECIMAL_RATE + newLine);
			}
			else if (isValidFractionLength(value, rateSize, maximumFractionSize)) {
				errorBuffer
						.append(fieldName + IHostFieldValidationConstants.ERR_INVALID_BIGDECIMAL_PRECISION + newLine);
			}
		}
	}

	/**
	 * Validate date value
	 * 
	 * @param labelName Field name
	 * @param value Field value(double)
	 * @param mandatory Field mandatory(boolean)
	 * @param errorBuffer errorBuffer
	 */
	public static void validateDate(String fieldName, Date value, boolean mandatory, StringBuffer errorBuffer) {

		if (mandatory) {
			if (!valueIsPresent(value)) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_INPUT_IS_MANDATORY + newLine);
			}
		}

	}

	/**
	 * Validate date year value
	 * 
	 * @param labelName Field name
	 * @param value Field value(string)
	 * @param mandatory Field mandatory(boolean)
	 * @param errorBuffer errorBuffer
	 */
	public static void validateDate(String fieldName, int value, boolean mandatory, String pattern,
			StringBuffer errorBuffer) {

		if (mandatory) {
			validateInt(fieldName, value, mandatory, errorBuffer);
		}

		if (valueIsPresent(value)) {
			SimpleDateFormat format = new SimpleDateFormat(pattern);
			try {
				format.parse(String.valueOf(value));
			}
			catch (Exception ex) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_INVALID_DATE_YEAR + newLine);
			}
		}

	}

	private static boolean valueIsPresent(String value) {
		return (!((value == null) || (value.length() == 0)));
	}

	private static boolean valueIsPresent(int value) {
		return !(value < -2147483648) && !(value > 2147483647);
	}

	private static boolean valueIsPresent(Long value) {
		return !(value == null);
	}

	private static boolean valueIsPresent(BigDecimal value) {
		return !(value == null);
	}

	protected static boolean valueIsPresent(Date value) {
		return !(value == null);
	}

	private static boolean isValidRateLength(BigDecimal value, int rateSize, int precisionSize) {
		String amount = (value.abs()).toString();

		if (amount.indexOf(IHostFieldValidationConstants.MONETORY_DECIMAL_SEPERATOR) > 0) {
			amount = amount.substring(0, amount.indexOf(IHostFieldValidationConstants.MONETORY_DECIMAL_SEPERATOR));
		}

		if (amount.length() > (rateSize - precisionSize)) {
			return true;
		}

		return false;
	}

	private static boolean isValidFractionLength(BigDecimal value, int rateSize, int precisionSize) {
		String amount = (value.abs()).toString();

		if (amount.indexOf(IHostFieldValidationConstants.MONETORY_DECIMAL_SEPERATOR) > 0) {
			amount = amount.substring((amount.indexOf(IHostFieldValidationConstants.MONETORY_DECIMAL_SEPERATOR) + 1),
					amount.length());

			if (amount.length() > precisionSize) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Validate Short value
	 * 
	 * @param labelName Field name
	 * @param value Field value(Short)
	 * @param mandatory Field mandatory(boolean)
	 * @param length Field length(int)
	 * @param errorBuffer errorBuffer
	 */
	public static void validateShort(String fieldName, Short value, boolean mandatory, int length,
			StringBuffer errorBuffer) {

		if (mandatory) {
			if (!valueIsPresent(value)) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_INPUT_IS_MANDATORY + newLine);
			}
		}

		if (valueIsPresent(value)) {
			String longStr = String.valueOf(value);

			if (longStr.length() > length) {
				errorBuffer.append(fieldName + IHostFieldValidationConstants.ERR_STR_LENGTH + newLine);
			}
		}
	}

}

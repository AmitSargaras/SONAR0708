package com.integrosys.cms.ui.creditriskparam.internallimit.dimension;

import java.math.BigDecimal;
import java.util.Locale;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionErrors;

import com.integrosys.base.techinfra.validation.Validator;
import com.integrosys.base.uiinfra.common.ErrorKeyMapper;
import com.integrosys.cms.ui.common.constant.IGlobalConstant;

public class DimensionFormValidator implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	public static ActionErrors validate(DimensionForm aForm, Locale locale) {
		ActionErrors errors = new ActionErrors();
		String errorCode = "";
		if (!(errorCode = Validator.checkString(aForm.getDescription(), true,
				1, 255)).equals(Validator.ERROR_NONE)) {
			errors.add("description", new ActionMessage(ErrorKeyMapper.map(
					ErrorKeyMapper.STRING, errorCode), "1", "255"));
		}
		if (!(errorCode = Validator.checkNumber(aForm.getLimitAmount(), true,
				1, 255)).equals(Validator.ERROR_NONE)) {
			errors.add("limitAmount", new ActionMessage(
					ErrorKeyMapper.map(ErrorKeyMapper.NUMBER, errorCode),
					new Integer(0), new Integer(100)));
		}

		if (!(errorCode = Validator.checkStringWithNoSpecialCharsAndSpace(aForm
				.getLimitCurrency(), true, 1, 40)).equals(Validator.ERROR_NONE)) {
			errors.add("limitCurrency", new ActionMessage(ErrorKeyMapper.map(
					ErrorKeyMapper.STRING, errorCode), "1", "40"));
		}
		String maximumAmt = new BigDecimal(
				IGlobalConstant.MAXIMIUM_ALLOWED_AMOUNT).toString();
		if (!(errorCode = Validator.checkAmount(aForm.getLimitAmount(), false,
				1, IGlobalConstant.MAXIMIUM_ALLOWED_AMOUNT, aForm
						.getLimitCurrency(), locale))
				.equals(Validator.ERROR_NONE)) {
			errors.add("limitAmount", new ActionMessage(ErrorKeyMapper.map(
					ErrorKeyMapper.AMOUNT, errorCode), "1", maximumAmt));
		}
		return errors;
	}
}
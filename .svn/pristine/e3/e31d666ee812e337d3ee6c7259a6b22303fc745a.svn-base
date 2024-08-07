package com.integrosys.simulator.host.transformer.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;

public class BigDecimalConverter {

	public static String serializeBigDecimalToStr(BigDecimal decimal) {
		String resultStr = null;
		try {
			if (decimal == null) {
				return "";
			}
			DecimalFormat twoPlacesFormatter = new DecimalFormat("##############.00");
			resultStr = twoPlacesFormatter.format(decimal);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultStr;
	}

	public static BigDecimal derializeBigDecimalToFractionStr(String str) {
		BigDecimal d1 = null;
		try {
			if ((str == null) || "".equals(str)) {
				return new BigDecimal(0);
			}
			d1 = new BigDecimal(str);
			d1 = d1.divide(new BigDecimal("100"), 2, BigDecimal.ROUND_UNNECESSARY);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return d1;
	}

	public static BigDecimal derializeBigDecimalWithComma(String str) {
		BigDecimal result = null;
		try {
			if ((str == null) || (str.length() == 0)) {
				return new BigDecimal(0);
			}

			str = str.replaceAll("\\,", "");
			result = new BigDecimal(str);

		}
		catch (Exception ex) {
			ex.printStackTrace();
		}

		return result;
	}

}

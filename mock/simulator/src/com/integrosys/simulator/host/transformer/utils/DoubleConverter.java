package com.integrosys.simulator.host.transformer.utils;

import java.text.DecimalFormat;

public class DoubleConverter {

	public static double derializeDoubleWithComma(String str) {
		double result = 0.00d;
		try {
			if ((str == null) || (str.length() == 0)) {
				return 0;
			}

			str = str.replaceAll("\\,", "");
			result = Double.parseDouble(str);

		}
		catch (Exception ex) {
			ex.printStackTrace();
		}

		return result;
	}

	public static String serializeDoubleToFractionStr(double d) {
		String resultStr = null;
		try {
			DecimalFormat twoPlacesFormatter = new DecimalFormat("##############.00");
			resultStr = twoPlacesFormatter.format(d);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultStr;
	}

}

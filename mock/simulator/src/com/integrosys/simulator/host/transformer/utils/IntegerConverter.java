package com.integrosys.simulator.host.transformer.utils;

public class IntegerConverter {

	public static int derializeInt(String str) {
		if ((str == null) || (str.length() == 0)) {
			return 0;
		}

		str = str.replaceAll("\\,", "");
		int result = Integer.parseInt(str);

		return result;
	}

	public static String serializeLong(Long argLong) {
		if (argLong == null) {
			return "0";
		}

		return String.valueOf(argLong.longValue());
	}

	public static String serializeShort(Short argShort) {
		if (argShort == null) {
			return "0";
		}

		return String.valueOf(argShort.shortValue());
	}

	public static String serializeInt(Integer argInt) {
		if (argInt == null) {
			return "0";
		}

		return String.valueOf(argInt.shortValue());
	}

	public static byte[] padIntegerZero(byte[] buffer, int length, char pad, String padType) throws Exception {

		return StringConverter.padStringSpace(buffer, length, pad, padType);
	}
}

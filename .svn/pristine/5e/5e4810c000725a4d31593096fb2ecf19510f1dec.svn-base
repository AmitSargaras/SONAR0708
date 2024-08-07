package com.integrosys.simulator.host.transformer.utils;

import com.integrosys.simulator.host.transformer.helper.ITransformConstant;

public class StringConverter {

	public static String serializeString(String str) {
		if ((str == null) || (str.length() == 0)) {
			return "";
		}
		return str;
	}

	public static String serializeRequestString(String str) {
		if ((str == null) || (str.length() == 0)) {
			return "";
		}
		return TransformerUtils.formatRequestFields(str);
	}

	public static String serializeResponseString(String str) {
		if ((str == null) || (str.length() == 0)) {
			return "";
		}
		return TransformerUtils.formatResponseFields(str);
	}

	public static int deserializeString(String text) {
		if (text == null) {
			return 0;
		}
		else {
			int split = text.indexOf('.');
			int cents = 0;
			if (split > 0) {
				cents = Integer.parseInt(text.substring(0, split)) * 100;
				text = text.substring(split + 1);
			}
			return cents + Integer.parseInt(text);
		}
	}

	public static byte[] padStringSpace(byte[] buffer, int length, char pad, String padType) throws Exception {

		try {
			int buffLen = 0;
			int limit = 0;

			// buffer is null
			if (buffer == null) {
				return padStringSpace(" ".getBytes(), length, pad, padType);
			}
			else {
				buffLen = buffer.length;
				if (buffLen > length) {
					return buffer;
				}
				else {
					limit = length - buffLen;
					byte[] padBuffer = new byte[length];
					System.out.println("@@padBuffer length:" + padBuffer.length + " pad: " + pad + " padType: "
							+ padType + " length: " + length + " buffLen: " + buffLen);
					if (ITransformConstant.PAD_ALIGN_RIGHT.equals(padType)) {
						System.arraycopy(pad(pad, limit), 0, padBuffer, 0, limit);
						System.arraycopy(buffer, 0, padBuffer, limit, buffLen);
						return padBuffer;
					}
					else {
						System.arraycopy(buffer, 0, padBuffer, 0, buffLen);
						System.arraycopy(pad(pad, limit), 0, padBuffer, buffLen, limit);
						return padBuffer;
					}
				}
			}

		}
		catch (Exception ex) {
			throw new Exception(ex);
		}
	}

	public static byte[] pad(char padChar, int length) throws Exception {
		try {
			int pos = 0;
			byte[] paddedString = new byte[length];
			String localBuffer = new String(new char[] { padChar }, 0, 1);

			while (length > 1) {
				if (length % 2 == 1) {
					System.arraycopy(localBuffer.getBytes(), 0, paddedString, pos, localBuffer.getBytes().length);
					pos += localBuffer.getBytes().length;
				}
				length /= 2;
				localBuffer += localBuffer;
			}

			if (length >= 1) {
				System.arraycopy(localBuffer.getBytes(), 0, paddedString, pos, localBuffer.getBytes().length);
				pos += localBuffer.getBytes().length;
				return paddedString;
			}

			return "".getBytes();
		}
		catch (Exception ex) {
			throw new Exception(ex);
		}
	}

	public static String padRightSpace(String str, int width) {
		if (str == null) {
			str = "";
		}
		for (int i = str.length(); i < width; i++) {
			str += " ";
		}
		return str.substring(0, width);
	}

	public static String padLeftSpace(String str, int width) {
		if (str == null) {
			str = "";
		}

		for (int i = str.length(); i < width; i++) {
			str = " " + str;
		}
		return str;
	}

	public static String padRightZero(String str, int width) {
		if (str == null) {
			str = "0";
		}
		for (int i = str.length(); i < width; i++) {
			str += "0";
		}
		return str.substring(0, width);
	}

	public static String padLeftZero(String str, int width) {
		if (str == null) {
			str = "0";
		}
		for (int i = str.length(); i < width; i++) {
			str = "0" + str;
		}
		return str;
	}

}

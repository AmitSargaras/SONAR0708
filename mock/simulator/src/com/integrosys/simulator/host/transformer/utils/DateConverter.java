package com.integrosys.simulator.host.transformer.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.integrosys.simulator.host.transformer.helper.ITransformConstant;

public class DateConverter {

	public static Date deserializeDateDDMMYYYYWithSlash(String value) throws ParseException {
		if ((value == null) || (value.length() == 0)) {
			return null;
		}
		return new SimpleDateFormat(ITransformConstant.DATE_TYPE_DDMMYYYY_WITH_SLASH).parse(value);
	}

	public static String serializeDateDDMMYYYYWithSlash(Date value) throws ParseException {
		if (value == null) {
			return "";
		}
		return (new SimpleDateFormat(ITransformConstant.DATE_TYPE_DDMMYYYY_WITH_SLASH)).format(value);
	}

	public static Date deserializeDateDDMMYYWithSlash(String value) throws ParseException {
		if ((value == null) || (value.length() == 0)) {
			return null;
		}
		return new SimpleDateFormat(ITransformConstant.DATE_TYPE_DDMMYY_WITH_SLASH).parse(value);
	}

	public static String serializeDateYYYYMMDD(Date value) throws ParseException {
		if (value == null) {
			return "";
		}
		return (new SimpleDateFormat(ITransformConstant.DATE_TYPE_YYYYMMDD)).format(value);
	}

	public static String serializeDateDDMMYY(Date value) throws ParseException {
		if (value == null) {
			return "";
		}
		return (new SimpleDateFormat(ITransformConstant.DATE_TYPE_DDMMYY)).format(value);
	}

	public static String serializeDateDDMMYYYY(Date value) throws ParseException {
		if (value == null) {
			return "";
		}
		return (new SimpleDateFormat(ITransformConstant.DATE_TYPE_DDMMYYYY)).format(value);
	}

	public static Date deserializeDateYYYYMMDD(String value) throws ParseException {
		if ((value == null) || (value.length() == 0)) {
			return null;
		}

		return new SimpleDateFormat(ITransformConstant.DATE_TYPE_YYYYMMDD).parse(value);
	}

	public static Date deserializeDateDDMMYY(String value) throws ParseException {
		if ((value == null) || (value.length() == 0) || "0".equals(value) || "0000000".equals(value)) {
			return null;
		}
		else {
			if (value.length() > 6) {
				value = value.substring(1, value.length());
			}
		}

		return new SimpleDateFormat(ITransformConstant.DATE_TYPE_DDMMYY).parse(value);
	}

	public static Date deserializeDateDDMMYYYY(String value) throws ParseException {
		if ((value == null) || (value.length() == 0) || "0".equals(value) || "000000000".equals(value)) {
			return null;
		}
		else {
			if (value.length() > 6) {
				value = value.substring(1, value.length());
			}
		}

		return new SimpleDateFormat(ITransformConstant.DATE_TYPE_DDMMYYYY).parse(value);
	}

	public static String serializeTimestampYYMM(Timestamp value) throws ParseException {
		if (value == null) {
			return "";
		}
		return new SimpleDateFormat(ITransformConstant.TIMESTAMP_TYPE_YYMM).format(value);
	}

	public static Timestamp deserializeTimestampYYMM(String value) throws ParseException {
		if ((value == null) || (value.length() == 0) || "0".equals(value) || "00000".equals(value)) {
			return null;
		}
		else {
			if (value.length() > 4) {
				value = value.substring(1, value.length());
			}
		}
		return new Timestamp((new SimpleDateFormat(ITransformConstant.TIMESTAMP_TYPE_YYMM).parse(value)).getTime());
	}

	public static String serializeDateYYMM(Date value) throws ParseException {
		if (value == null) {
			return "0000";
		}
		return new SimpleDateFormat(ITransformConstant.TIMESTAMP_TYPE_YYMM).format(value);
	}

	public static Date deserializeDateYYMM(String value) throws ParseException {
		if ((value == null) || (value.length() == 0) || "0".equals(value) || "0000".equals(value) || "00000".equals(value)) {
			return null;
		}
		else {
			if (value.length() > 4) {
				value = value.substring(1, value.length());
			}
		}
		return new SimpleDateFormat(ITransformConstant.TIMESTAMP_TYPE_YYMM).parse(value);
	}

	public static String serializeDateYYYYMMDDReturnZero(Date value) throws ParseException {
		if (value == null) {
			return "00000000";
		}
		return (new SimpleDateFormat(ITransformConstant.DATE_TYPE_YYYYMMDD)).format(value);
	}

	public static String serializeDateKKMMSSSSReturnZero(Date value) throws ParseException {
		if (value == null) {
			return "00000000";
		}
		return (new SimpleDateFormat(ITransformConstant.TIME_TYPE_kkmmss)).format(value) + "00";
	}

}

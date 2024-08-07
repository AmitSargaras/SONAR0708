package com.integrosys.simulator.host.base.helper;

import java.io.Serializable;

public class Util implements Serializable {

	// CONSTANT
	private static final int CONS_HEX = 16;

	private static final int CONS_UNSIGNCHAR = 256;

	/* EBCDIC to ASCII Conversion Table */
	/*
	 * private static final short ETOA[] = { 0x00, 0x01, 0x02, 0x03, 0x9C, 0x09,
	 * 0x86, 0x7F,0x97, 0x8D, 0x8E, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11,
	 * 0x12, 0x13, 0x9D, 0x85, 0x08, 0x87,0x18, 0x19, 0x92, 0x8F, 0x1C, 0x1D,
	 * 0x1E, 0x1F, 0x80, 0x81, 0x82, 0x83, 0x84, 0x0A, 0x17, 0x1B,0x88, 0x89,
	 * 0x8A, 0x8B, 0x8C, 0x05, 0x06, 0x07, 0x90, 0x91, 0x16, 0x93, 0x94, 0x95,
	 * 0x96, 0x04,0x98, 0x99, 0x9A, 0x9B, 0x14, 0x15, 0x9E, 0x1A, 0x20, 0xA0,
	 * 0xA1, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6,0xA7, 0xA8, 0x5B, 0x2E, 0x3C, 0x28,
	 * 0x2B, 0x5D, 0x26, 0xA9, 0xAA, 0xAB, 0xAC, 0xAD, 0xAE, 0xAF,0xB0, 0xB1,
	 * 0x21, 0x24, 0x2A, 0x29, 0x3B, 0x5E, 0x2D, 0x2F, 0xB2, 0xB3, 0xB4, 0xB5,
	 * 0xB6, 0xB7,0xB8, 0xB9, 0x7C, 0x2C, 0x25, 0x5F, 0x3E, 0x3F, 0xBA, 0xBB,
	 * 0xBC, 0xBD, 0xBE, 0xBF, 0xC0, 0xC1,0xC2, 0x60, 0x3A, 0x23, 0x40, 0x27,
	 * 0x3D, 0x22, 0xC3, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,0x68, 0x69,
	 * 0xC4, 0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xCA, 0x6A, 0x6B, 0x6C, 0x6D, 0x6E,
	 * 0x6F, 0x70,0x71, 0x72, 0xCB, 0xCC, 0xCD, 0xCE, 0xCF, 0xD0, 0xD1, 0x7E,
	 * 0x73, 0x74, 0x75, 0x76, 0x77, 0x78,0x79, 0x7A, 0xD2, 0xD3, 0xD4, 0xD5,
	 * 0xD6, 0xD7, 0xD8, 0xD9, 0xDA, 0xDB, 0xDC, 0xDD, 0xDE, 0xDF,0xE0, 0xE1,
	 * 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0x7B, 0x41, 0x42, 0x43, 0x44, 0x45,
	 * 0x46, 0x47,0x48, 0x49, 0xE8, 0xE9, 0xEA, 0xEB, 0xEC, 0xED, 0x7D, 0x4A,
	 * 0x4B, 0x4C, 0x4D, 0x4E, 0x4F, 0x50,0x51, 0x52, 0xEE, 0xEF, 0xF0, 0xF1,
	 * 0xF2, 0xF3, 0x5C, 0x9E, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,0x59, 0x5A,
	 * 0xF4, 0xF5, 0xF6, 0xF7, 0xF8, 0xF9, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35,
	 * 0x36, 0x37,0x38, 0x39, 0xFA, 0xFB, 0xFC, 0xFD, 0xFE, 0xFF };
	 */
	/* ASCII to EBCDIC Conversion Table */
	/*
	 * private static final short ATOE[] = { 0x00, 0x01, 0x02, 0x03, 0x37, 0x2D,
	 * 0x2E, 0x2F, 0x16, 0x05, 0x25, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11,
	 * 0x12, 0x13, 0x3C, 0x3D, 0x32, 0x26, 0x18, 0x19, 0x3F, 0x27, 0x1C, 0x1D,
	 * 0x1E, 0x1F, 0x40, 0x5A, 0x7F, 0x7B, 0x5B, 0x6C, 0x50, 0x7D, 0x4D, 0x5D,
	 * 0x5C, 0x4E, 0x6B, 0x60, 0x4B, 0x61, 0xF0, 0xF1, 0xF2, 0xF3, 0xF4, 0xF5,
	 * 0xF6, 0xF7, 0xF8, 0xF9, 0x7A, 0x5E, 0x4C, 0x7E, 0x6E, 0x6F, 0x7C, 0xC1,
	 * 0xC2, 0xC3, 0xC4, 0xC5, 0xC6, 0xC7, 0xC8, 0xC9, 0xD1, 0xD2, 0xD3, 0xD4,
	 * 0xD5, 0xD6, 0xD7, 0xD8, 0xD9, 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0xE7, 0xE8,
	 * 0xE9, 0x4A, 0xE0, 0x4F, 0x5F, 0x6D, 0x79, 0x81, 0x82, 0x83, 0x84, 0x85,
	 * 0x86, 0x87, 0x88, 0x89, 0x91, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98,
	 * 0x99, 0xA2, 0xA3, 0xA4, 0xA5, 0xA6, 0xA7, 0xA8, 0xA9, 0xC0, 0x6A, 0xD0,
	 * 0xA1, 0x07, 0x20, 0x21, 0x22, 0x23, 0x24, 0x15, 0x06, 0x17, 0x28, 0x29,
	 * 0x2A, 0x2B, 0x2C, 0x09, 0x0A, 0x1B, 0x30, 0x31, 0x1A, 0x33, 0x34, 0x35,
	 * 0x36, 0x08, 0x38, 0x39, 0x3A, 0x3B, 0x04, 0x14, 0x3E, 0xE1, 0x41, 0x42,
	 * 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x51, 0x52, 0x53, 0x54, 0x55,
	 * 0x56, 0x57, 0x58, 0x59, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69,
	 * 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x80, 0x8A, 0x8B,
	 * 0x8C, 0x8D, 0x8E, 0x8F, 0x90, 0x9A, 0x9B, 0x9C, 0x9D, 0x9E, 0x9F, 0xA0,
	 * 0xAA, 0xAB, 0xAC, 0xAD, 0xAE, 0xAF, 0xB0, 0xB1, 0xB2, 0xB3, 0xB4, 0xB5,
	 * 0xB6, 0xB7, 0xB8, 0xB9, 0xBA, 0xBB, 0xBC, 0xBD, 0xBE, 0xBF, 0xCA, 0xCB,
	 * 0xCC, 0xCD, 0xCE, 0xCF, 0xDA, 0xDB, 0xDC, 0xDD, 0xDE, 0xDF, 0xEA, 0xEB,
	 * 0xEC, 0xED, 0xEE, 0xEF, 0xFA, 0xFB, 0xFC, 0xFD, 0xFE, 0xFF };
	 */

	/* Thai EBCDIC to Ascii */
	private static final short ETOA[] = { 0x00, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f,
			0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f,
			0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f,
			0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x20, 0x7f, 0xa1,
			0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0x5b, 0xfc, 0x2e, 0x3c, 0x28, 0x2b, 0x20, 0x26, 0x7f, 0xa8, 0xa9, 0xaa,
			0xab, 0xac, 0xad, 0xae, 0x5d, 0x21, 0x24, 0x2a, 0x29, 0x3b, 0xfd, 0x2d, 0x2f, 0xaf, 0xb0, 0xb1, 0xb2, 0xb3,
			0xb4, 0xb5, 0x5e, 0xfe, 0x2c, 0x25, 0x5f, 0x3e, 0x3f, 0xdf, 0x7f, 0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xbb, 0xbc,
			0x60, 0x3A, 0x23, 0x40, 0x27, 0x3d, 0x22, 0x7f, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0xbd,
			0xbe, 0xbf, 0xc0, 0xc1, 0xc2, 0x7f, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0xc3, 0xc4, 0xc5,
			0xc6, 0xc7, 0xc8, 0x7f, 0x7e, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a, 0xc9, 0xca, 0xcb, 0xcc, 0xcd,
			0xce, 0xf0, 0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0xcf, 0xd0, 0xd1, 0xd2, 0xd3, 0xd4, 0x7b,
			0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x7f, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0x7d, 0x4a, 0x4b,
			0x4c, 0x4d, 0x4e, 0x4f, 0x50, 0x51, 0x52, 0xda, 0xe0, 0xe1, 0xe2, 0xe3, 0xe4, 0x5c, 0x7f, 0x53, 0x54, 0x55,
			0x56, 0x57, 0x58, 0x59, 0x5a, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xea, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36,
			0x37, 0x38, 0x39, 0xeb, 0xec, 0xed, 0x7f, 0x7f, 0x7f };

	/* Ascii to Thai EBCDIC */
	private static final short ATOE[] = { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c,
			0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e,
			0x1f, 0x40, 0x5a, 0x7f, 0x7b, 0x5b, 0x6c, 0x50, 0x7d, 0x4d, 0x5d, 0x5c, 0x4e, 0x6b, 0x60, 0x4b, 0x61, 0xf0,
			0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0x7a, 0x5e, 0x4c, 0x7e, 0x6e, 0x6f, 0x7c, 0xc1, 0xc2,
			0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xd1, 0xd2, 0xd3, 0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xe2, 0xe3,
			0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9, 0xad, 0xe0, 0xbd, 0x5f, 0x6d, 0x79, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86,
			0x87, 0x88, 0x89, 0x91, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7,
			0xa8, 0xa9, 0xc0, 0x6a, 0xd0, 0xa1, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
			0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
			0xff, 0xff, 0xff, 0xff, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58,
			0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x8a, 0x8b, 0x8c, 0x8d,
			0x8e, 0x8f, 0x9a, 0x9b, 0x9C, 0x9d, 0x9e, 0x9f, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf, 0xba, 0xbb, 0xbc, 0xbd,
			0xbe, 0xbf, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0xda, 0xff, 0xff, 0xff, 0xff, 0xff, 0xdb, 0xdc, 0xdd, 0xde, 0xdf,
			0xea, 0xeb, 0xec, 0xed, 0xee, 0xef, 0xfa, 0xfb, 0xfc, 0xff, 0xff, 0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5, 0xb6,
			0xb7, 0xb8, 0xb9, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };

	/**
	 * Creates new Util
	 */
	public Util() {
	}

	/*
	 * Note: Because of byte range form -127 to 128 therfore the negative value
	 * cause problem on ATOE and ETOA array
	 */

	/**
	 * Convert from byte[] to char[]*
	 */
	public static char[] ConvertToChar(byte[] inBuf, int lenBuf) throws HostException {
		try {
			char[] outBuf = new char[lenBuf];
			int Temp;

			for (int i = 0; i < lenBuf; i++) {
				if (inBuf[i] < 0) {
					Temp = CONS_UNSIGNCHAR + inBuf[i];
				}
				else {
					Temp = inBuf[i];
				}
				outBuf[i] = (char) Temp;
			}
			return outBuf;
		}
		catch (Exception e) {
			throw new HostException("Util::ConvertToChar::" + e.getMessage());
		}
	}

	/**
	 * Convert from Ascii byte[] to EBCDIC byte[] *
	 */
	public static byte[] ConvertATOE(byte[] inBuf, int lenBuf) throws HostException {
		try {
			byte[] outBuf = new byte[lenBuf];
			int intPos;

			for (int i = 0; i < lenBuf; i++) {
				if (inBuf[i] < 0) {
					intPos = inBuf[i] + CONS_UNSIGNCHAR;
				}
				else {
					intPos = inBuf[i];
				}

				outBuf[i] = (byte) ATOE[intPos];
			}
			return outBuf;
		}
		catch (Exception e) {
			throw new HostException("Util::ConverATOE::" + e.getMessage());
		}
	}

	/**
	 * Convert EBCDIC byte[] to ASCII Because the byte will have -ve value, this
	 * will cause problem when fill into the array. Therefore we ensure the
	 * value is +ve
	 */
	public static char[] ConvertETOA(byte[] inBuf, int lenBuf) throws HostException {
		try {
			char[] outBuf = new char[lenBuf];
			int intPos;

			for (int i = 0; i < lenBuf; i++) {
				if (inBuf[i] < 0) {
					intPos = inBuf[i] + CONS_UNSIGNCHAR;
				}
				else {
					intPos = inBuf[i];
				}
				outBuf[i] = (char) ETOA[intPos];
			}
			return outBuf;
		}
		catch (Exception e) {
			throw new HostException("Util::ConverETOA::" + e.getMessage());
		}
	}

	/**
	 * Decode Host Message byte[] to String for front End
	 * 
	 * @throws HostException @ typeBuf : 'A' - Alpha Numeric, 'S' - Numeric, 'P'
	 *         - Packed, 'B' - Binary, 'H'- Hex Stream, 'X'- no conversion @
	 *         lenBuf : length according to front End Data structure
	 */
	public static String Decode(byte[] inBuf, int lenBuf, char typeBuf, boolean IsEBCDIC, int DecimalPoint)
			throws HostException {

		String rtnStr;
		String strTemp;
		boolean bNegative = false;

		try {
			switch (Character.toUpperCase(typeBuf)) {
			case 'P':
				strTemp = Unpack(inBuf, lenBuf);
				rtnStr = formatDecimal(strTemp, DecimalPoint);
				break;
			case 'H':
				rtnStr = UnHex(inBuf, lenBuf);
				break;
			case 'S': // Convert to Ascii Numeric
				if ((inBuf[lenBuf - 1] & (byte) 0xF0) == (byte) 0xD0) {
					// -ve
					inBuf[lenBuf - 1] = (byte) (inBuf[lenBuf - 1] | 0xF0);
					bNegative = true;
				}

				if (IsEBCDIC) {
					strTemp = new String(inBuf, "Cp838");
				}
				else {
					strTemp = String.valueOf(ConvertToChar(inBuf, lenBuf));
				}

				if (bNegative) {
					rtnStr = '-' + formatDecimal(strTemp, DecimalPoint);
				}
				else {
					rtnStr = formatDecimal(strTemp, DecimalPoint);
				}

				break;
			case 'A': // Alpha Numeric
				if (IsEBCDIC) {
					rtnStr = new String(inBuf, "Cp838");
				}
				else {
					rtnStr = String.valueOf(ConvertToChar(inBuf, lenBuf));
				}
				break;
			case 'B': // Binary to Decimal String
				long valDecimal = toDecimal(inBuf, lenBuf, CONS_HEX);
				rtnStr = Long.toString(valDecimal);
				break;
			case 'X':
				rtnStr = String.valueOf(ConvertToChar(inBuf, lenBuf));
				break;
			default:
				throw new HostException("Util::Decode()::Invalid Conversion Format");
			}
			return rtnStr;
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new HostException("Util::Decode::" + e.getMessage());
		}
	}

	/**
	 * Encode to Host Message Format Type 'A' - alphanumeric. Initialize to all
	 * blank. Ascii = 0x20 Type 'B' - Binary. For positive number only. Type 'P'
	 * - Pack data. The lenght in is the actual length in Front End Screen - for
	 * +ve number, len = odd value; -ve number, len = even value (one byte for
	 * '-' sign Type 'S' - numeric. Initilize to '0'. Ascii = 0x30 e.g: Numeric
	 * 0x49 -> 0xF1 Type 'H' - Hex String (2 byte) to value(1 byte) e.g String
	 * FF->0xFF Type 'X' - String with no conversion
	 */
	public static byte[] Encode(String strIn, char Type, int Len, boolean ToEBCDIC, int DecimalPoint)
			throws HostException {

		byte[] byteOutData;
		int i;
		boolean bNegative = false;
		int NumofZero;
		String strTemp = null;
		try {

			switch (Character.toUpperCase(Type)) {
			case 'P':
				if (strIn != null) {
					strTemp = unformatDecimal(strIn, DecimalPoint, Len);
				}
				byteOutData = Pack(strTemp, Len);
				break;
			case 'H':
				strIn = CheckStringLength(strIn, Len * 2);
				byteOutData = Hex(strIn, Len);
				break;

			case 'S':
				if (strIn != null) {

					if (strIn.indexOf("-", 0) == 0) { // -ve number
						strIn = strIn.substring(1, strIn.length());
						bNegative = true;
					}

					strIn = CheckStringLength(strIn, Len);
					strTemp = unformatDecimal(strIn, DecimalPoint, Len);
					strIn = strTemp;
					NumofZero = Len - strIn.length();
				}
				else {
					strIn = "";
					NumofZero = Len;
				}

				for (i = 0; i < NumofZero; i++) {
					strIn = '0' + strIn;
				}

				if (ToEBCDIC) {
					byteOutData = strIn.getBytes("Cp838");
					// byteOutData = ConvertATOE(strIn.getBytes(),
					// strIn.length());
				}
				else {
					byteOutData = strIn.getBytes();
				}

				if (bNegative) {
					byteOutData[Len - 1] = (byte) (byteOutData[Len - 1] & (byte) 0xDF);
				}

				break;

			case 'A': // Alpha Numeric
				strIn = CheckStringLength(strIn, Len);
				if (strIn != null) {
					NumofZero = Len - strIn.length();
				}
				else {
					strIn = "";
					NumofZero = Len;
				}

				for (i = 0; i < NumofZero; i++) {
					strIn = strIn + ' ';
				}
				if (ToEBCDIC) {
					byteOutData = strIn.getBytes("Cp838");
					// byteOutData = ConvertATOE(strIn.getBytes(),
					// strIn.length());
				}
				else {
					byteOutData = strIn.getBytes();
				}
				break;

			case 'B': // Binary
				byteOutData = new byte[Len / 2];
				for (i = 0; i < Len / 2; i++) {
					byteOutData[i] = 0x00;
				}

				if (strIn != null) {
					long intTemp = Long.parseLong(strIn);
					strTemp = Long.toHexString(intTemp);

					NumofZero = Len - strTemp.length();
					for (i = 0; i < NumofZero; i++) {
						strTemp = '0' + strTemp;
					}
					byteOutData = toBinary(strTemp.toUpperCase());
				}
				break;

			case 'X': // NO CONVERSION
				strIn = CheckStringLength(strIn, Len);
				byteOutData = strIn.getBytes();
				break;
			default:
				throw new HostException("Util::Encode()::Invalid Conversion Format");
			}

			// DefaultLogger.debug( Util.class , "byteOutData" + new String
			// (byteOutData) );

			return byteOutData;
		}
		catch (Exception e) {
			throw new HostException("Util::Encode::" + e.getMessage());
		}
	}

	/**
	 * Put in the decimal point with corresponding host decimal point Example:
	 * 11 2 means 123456789.12 (Front End) => 12345678912 in (Host) Receive from
	 * host 12345678912 Send to front end 123456789.12
	 */
	public static String formatDecimal(String strIn, int DecIn) throws HostException {

		try {
			String strTemp;
			if (strIn == null) {
				return strIn;
			}
			if (strIn == "") {
				return strIn;
			}

			if (DecIn == 0) {
				return strIn;
			}
			strTemp = strIn.substring(0, strIn.length() - DecIn) + "."
					+ strIn.substring(strIn.length() - DecIn, strIn.length());
			return strTemp;
		}
		catch (Exception e) {
			throw new HostException("Util::formatDecimal::" + e.getMessage());
		}
	}

	/**
	 * Take out the decimal point with corresponding host decimal point Example:
	 * 11 2 means 123456789.12 (Front End) => 12345678912 in (Host) Receive from
	 * front end 123456789.12 Send to host 12345678912
	 */
	public static String unformatDecimal(String strIn, int DecIn, int FieldLen) throws HostException {

		try {
			String strTemp = "";
			int intPos = 0;
			int intDecimal = 0;
			int i = 0;
			if (DecIn == 0) {
				return strIn; // no decimal define
			}

			if (strIn.equals("0E-9")) {
				return "0";
			}

			intPos = strIn.lastIndexOf('.');
			if (intPos == -1) {// No decimal Point
				if (DecIn != 0) {
					for (i = 0; i < DecIn; i++) {
						strIn = strIn + '0';
					}
				}
				return strIn;
			}
			else {// There is decimal point '.'
				intDecimal = strIn.length() - intPos - 1;
				if (intDecimal != DecIn) {
					if (intDecimal > DecIn) { // .xx (front end) vs .x (host)
						// strIn = strIn.substring(0, strIn.length() - 1);
						strIn = strIn.substring(0, strIn.length() - (intDecimal - DecIn));
					}
					else { // .xx (front end) vs .xxx (host)
						for (i = 0; i < (DecIn - intDecimal); i++) {
							strIn = strIn + '0';
						}
					}
				}
				strTemp = strIn.substring(0, intPos) + strIn.substring(intPos + 1, strIn.length());
				return strTemp;
			}
		}
		catch (Exception e) {
			throw new HostException("Util::unformatDecimal::" + e.getMessage());
		}
	}

	/**
	 * Convert from String to binary byte[] The String that passed in is in Hex
	 * String. Is already formatted according to the binary length (Even Number)
	 */
	public static byte[] toBinary(String strIn) throws HostException {

		byte[] byteTmp = new byte[strIn.length() / 2];
		long intTemp;

		try {
			for (int i = 0; i < strIn.length() / 2; i++) {
				intTemp = Long.parseLong(strIn.substring(i * 2, (i * 2) + 2), CONS_HEX);
				byteTmp[i] = (byte) intTemp;
			}
			return byteTmp;
		}
		catch (Exception e) {
			throw new HostException("Util::toBinary()::" + e.getMessage());
		}
	}

	/**
	 * Pack the String(numeric) to byte[] . The lenBuf that pass in is
	 * "unpack length" + sign store in DB. For +ve number = Input lenght = 7,
	 * -ve number Input lenght = 8
	 */
	public static byte[] Pack(String inBuf, int lenBuf) throws HostException {
		lenBuf = lenBuf * 2;

		byte[] bytePack = new byte[lenBuf / 2];
		boolean bNegative = false;
		int j = 0;
		int i;

		for (i = 0; i < (lenBuf / 2); i++) {
			bytePack[i] = 0x00;
		}

		try {
			if (inBuf != null) {
				if (inBuf.indexOf("-", 0) == 0) { // -ve number
					inBuf = inBuf.substring(1, inBuf.length());
					bNegative = true;
				}

				int NumofZero = lenBuf - 1 - inBuf.length();
				for (i = 0; i < NumofZero; i++) {
					inBuf = '0' + inBuf;
				}

				int tempInt;
				for (i = 0; i < inBuf.length(); i += 2) {
					if ((i + 2) > inBuf.length()) {
						tempInt = Integer.parseInt(inBuf.substring(i, i + 1) + "0", CONS_HEX);
					}
					else {
						tempInt = Integer.parseInt(inBuf.substring(i, i + 2), CONS_HEX);
					}
					bytePack[j] = (byte) tempInt;
					j++;
				}
			}
			else {
				// DefaultLogger.debug("com.eon.sme.app.bankservice.hostinterface.util.Util",
				// "inBuf is NULL");
			}

			if (bNegative) // Negative Value
			{
				// DefaultLogger.debug("com.eon.sme.app.bankservice.hostinterface.util.Util",
				// "Negative Value");
				bytePack[(lenBuf / 2) - 1] = (byte) (bytePack[(lenBuf / 2) - 1] | (byte) 0x0D);
			}
			else // Positive Value
			{
				// DefaultLogger.debug("com.eon.sme.app.bankservice.hostinterface.util.Util",
				// "Positive Value");
				bytePack[(lenBuf / 2) - 1] = (byte) (bytePack[(lenBuf / 2) - 1] | (byte) 0x0F);
			}
			// DefaultLogger.debug("com.eon.sme.app.bankservice.hostinterface.util.Util",
			// "PACK method done");
			return bytePack;
		}
		catch (Exception e) {
			throw new HostException("Util::Pack::" + e.getMessage());
		}
	}

	/**
	 * Unpack the byte[] (pack Data), convert it to String with the last
	 * character being chop off. The lenBuf that passed in is the unpack length
	 * read from Database
	 */
	public static String Unpack(byte[] inBuf, int lenBuf) throws HostException {
		lenBuf = lenBuf * 2;
		String outStr = "";
		int high;
		int low = 0;
		char[] hexChars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

		try {
			for (int i = 0; i < lenBuf / 2; i++) {
				high = ((inBuf[i] & 0xf0) >> 4);
				low = (inBuf[i] & 0x0f);
				outStr = outStr + hexChars[high] + hexChars[low];
			}

			outStr = outStr.substring(0, outStr.length() - 1);
			if (low == 0x0D) { // For negative number
				outStr = "-" + outStr;
			}
			return outStr;
		}
		catch (Exception e) {
			throw new HostException("Util::UnPack::" + e.getMessage());
		}
	}

	/**
	 * Convert from Hex or Binary or Octal to Decimal radix 16 indicate Hex
	 * radix 2 indicate Binary radix 8 indicate Octal
	 */
	public static long toDecimal(byte[] InBuf, int LenBuf, int radix) throws HostException {

		long valDecimal = 0;
		long high;
		long low;

		try {
			for (int i = 0; i < LenBuf / 2; i++) {

				high = (long) (((InBuf[i] & 0xf0) >> 4) * Math.pow(radix, (LenBuf - 1) - (i * 2)));
				low = (long) (((InBuf[i] & 0x0f)) * Math.pow(radix, (LenBuf - 2) - (i * 2)));
				valDecimal = valDecimal + high + low;
			}
			return valDecimal;
		}
		catch (Exception e) {
			throw new HostException("Util::toDecimal::" + e.getMessage());
		}
	}

	/**
	 * Format from byte[] as hex string for display purposes*
	 */
	public static String toStringHex(byte[] InBuf, int LenBuf) throws HostException {

		int intTemp;
		String strTemp = "";

		try {
			for (int i = 0; i < LenBuf; i++) {

				if (InBuf[i] < 0) {
					intTemp = InBuf[i] + CONS_UNSIGNCHAR;
				}
				else {
					intTemp = InBuf[i];
				}
				strTemp = strTemp + Integer.toHexString(intTemp) + ":";
			}
			return strTemp;
		}
		catch (Exception e) {
			throw new HostException("Util::toStringHex::" + e.getMessage());
		}
	}

	/**
	 * Convert the String(Hex String to byte stream. Example: FFCC12->3 byte
	 * with byte[0]= 0xFF,byte[1]= 0xCC,byte[2]= 0x12 inBuf = String receive
	 * lenBuf = actual length in backend. Therefore inBuf length must be 2x
	 * lenBuf
	 */
	public static byte[] Hex(String inBuf, int lenBuf) throws HostException {

		byte[] bytePack = new byte[lenBuf];
		int j = 0;
		int i;

		for (i = 0; i < (lenBuf); i++) {
			bytePack[i] = 0x00;
		}

		try {
			if (inBuf != null) {
				int tempInt;

				int NumofZero = (lenBuf * 2) - inBuf.length();
				for (i = 0; i < NumofZero; i++) {
					inBuf = '0' + inBuf;
				}

				for (i = 0; i < inBuf.length(); i += 2) {
					if ((i + 2) > inBuf.length()) {
						tempInt = Integer.parseInt(inBuf.substring(i, i + 1) + "0", CONS_HEX);
					}
					else {
						tempInt = Integer.parseInt(inBuf.substring(i, i + 2), CONS_HEX);
					}
					bytePack[j] = (byte) tempInt;
					j++;
				}
			}

			return bytePack;
		}
		catch (Exception e) {
			throw new HostException("Util::Hex::" + e.getMessage());
		}
	}

	/**
	 * Convert host Hex to String The lenBuf that passed in is String length / 2
	 */
	public static String UnHex(byte[] inBuf, int lenBuf) throws HostException {

		String outStr = "";
		int high;
		int low;
		char[] hexChars = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };

		try {
			for (int i = 0; i < lenBuf; i++) {
				high = ((inBuf[i] & 0xf0) >> 4);
				low = (inBuf[i] & 0x0f);
				outStr = outStr + hexChars[high] + hexChars[low];
			}
			return outStr;
		}
		catch (Exception e) {
			throw new HostException("Util::UnHex::" + e.getMessage());
		}
	}

	/**
	 * This is to check the String length. If the String is longer then the
	 * actual length The string will be cut off
	 **/
	public static String CheckStringLength(String inStr, int Len) throws HostException {

		try {
			if (inStr != null) {
				if (inStr.length() > Len) {
					inStr = inStr.substring(0, Len);
				}
			}
			return inStr;
		}
		catch (Exception e) {
			throw new HostException("Util::CheckStringLength::" + e.getMessage());
		}
	}

	// pad value
	public static String pad(String padChar, int length) throws HostException {
		try {
			String paddedString = "";
			String localBuffer = padChar;

			while (length > 1) {
				if (length % 2 == 1) {
					paddedString += localBuffer;
				}
				length /= 2;
				localBuffer += localBuffer;
			}

			if (length >= 1) {
				System.out.println("----" + localBuffer);
				return paddedString + localBuffer;
			}

			return "";
		}
		catch (Exception e) {
			throw new HostException(e.getMessage());
		}
	}

	public static String isMoreThanThreeCount(String ccrisResultString) throws HostException {
		String defaultFlag = "N";
		try {
			if ((ccrisResultString == null) || "".equals(ccrisResultString.trim())) {
				defaultFlag = "Y";
				return defaultFlag;
			}
			int counter = 0;
			int consecutiveCounter = 0;
			for (int i = 0; i < ccrisResultString.length(); i++) {
				int value = Character.getNumericValue(ccrisResultString.charAt(i));
				if (value > 0) {// keep track
					consecutiveCounter++;
					if (consecutiveCounter > 2) {
						defaultFlag = "Y";
						return defaultFlag;
					}
				}
				else {// reset value
					consecutiveCounter = 0;
				}
				counter += value;
			}
			if (counter >= 3) {
				defaultFlag = "Y";
			}
			else {
				defaultFlag = "N";
			}
		}
		catch (Exception e) {
			throw new HostException("Invalid Numeric Value");
		}
		return defaultFlag;
	}
}

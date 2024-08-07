package com.integrosys.simulator.host.transformer;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.integrosys.simulator.host.base.helper.TCPUtil;
import com.integrosys.simulator.host.base.helper.Util;
import com.integrosys.simulator.host.transformer.helper.ITransformConstant;
import com.integrosys.simulator.host.transformer.utils.TransformerUtils;

public class TCPFixedLengthEncodeTransfomer extends TCPFixedLengthTransfomer {

	public byte[] transformObjToEncodedByteArray(String fixLengthTemplateCode, String headerFixLengthTemplateCode,
			Object obj) throws Exception {
		byte[] encodedByteArray = null;
		int totalColumnLength = 0;
		OBTransformDefinition obTransformDef = new OBTransformDefinition();
		XMLTransformer xmlTransformer = new XMLTransformer();
		List columnList = new ArrayList();
		try {
			// get xml definition file configuration
			Object transformObj = new OBTransformDefinition();
			obTransformDef = (OBTransformDefinition) xmlTransformer.transformByteArrayToObj(null, (new TCPUtil())
					.readfile("config" + File.separator + "jibx" + File.separator + "fixed_length_main_map.xml")
					.getBytes(), transformObj);
			List fixedLengthList = obTransformDef.getFixedLength();

			for (int i = 0; i < fixedLengthList.size(); i++) {
				OBFixedLengthDefinition obFixedLength = (OBFixedLengthDefinition) fixedLengthList.get(i);
				if (fixLengthTemplateCode.equals(obFixedLength.getCode())) {
					columnList = obFixedLength.getColumn();
					totalColumnLength = obFixedLength.getTotalColumnLength();
					break;
				}
			}

			encodedByteArray = writeStr(columnList, headerFixLengthTemplateCode, totalColumnLength, obj,
					fixLengthTemplateCode);

			return encodedByteArray;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		finally {
			columnList = null;
		}

	}

	private byte[] writeHeaderByte(List headerColumnList, String headerFixLengthTemplateCode) throws Exception {
		byte[] temp = null;
		byte[] valueByte = null;
		byte[] requestByteArray = null;
		XMLTransformer xmlTransformer = new XMLTransformer();
		OBTransformDefinition obTransformDef = new OBTransformDefinition();
		String msgHeader = "";
		int startPosition = 0;
		int definedLength = 0;
		int decimalPlace = 0;
		try {
			// get xml definition file configuration
			Object transformObj = new OBTransformDefinition();
			obTransformDef = (OBTransformDefinition) xmlTransformer.transformByteArrayToObj(null, (new TCPUtil())
					.readfile("config" + File.separator + "jibx" + File.separator + "fixed_length_main_map.xml")
					.getBytes(), transformObj);
			List headerFixedLengthList = obTransformDef.getFixedLength();

			OBFixedLengthDefinition obFixedLength = new OBFixedLengthDefinition();
			for (int i = 0; i < headerFixedLengthList.size(); i++) {
				obFixedLength = (OBFixedLengthDefinition) headerFixedLengthList.get(i);
				if (headerFixLengthTemplateCode.equals(obFixedLength.getCode())) {
					break;
				}
			}

			// OBFixedLengthDefinition obFixedLength =
			// (OBFixedLengthDefinition)headerFixedLengthList.get(0);
			List columnList = obFixedLength.getColumn();
			requestByteArray = new byte[obFixedLength.getTotalColumnLength()];

			for (int i = 0; i < columnList.size(); i++) {
				OBColumn obColumn = (OBColumn) columnList.get(i);
				definedLength = obColumn.getLength();
				decimalPlace = obColumn.getDecimalPlace();
				// get value from object
				msgHeader = (String) headerColumnList.get(i);
				System.out.println("[" + obColumn.getName() + "]"
						+ Util.pad(" ", 35 - (obColumn.getName().length() + 2)) + "[" + msgHeader + "]");
				if (ITransformConstant.SIBS_BINARY_TYPE == obColumn.getType().charAt(0)) {
					temp = Util.Encode(msgHeader, obColumn.getType().charAt(0), definedLength * 2, true, decimalPlace);
				}
				else {
					temp = Util.Encode(msgHeader, obColumn.getType().charAt(0), definedLength, true, decimalPlace);
				}

				// Encoding
				System.arraycopy(temp, 0, requestByteArray, startPosition, temp.length);
				startPosition += temp.length;
			}

		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		return requestByteArray;
	}

	private byte[] writeStr(List columnList, String headerFixLengthTemplateCode, int totalColumnLength, Object obj,
			String fixLengthTemplateCode) throws Exception {
		int definedLength = 0;
		int startPosition = 0;
		int decimalPlace = 0;
		byte[] temp = null;
		byte[] requestBodyByteArray = new byte[totalColumnLength];
		byte[] requestHeaderByteArray = null;
		byte[] requestByteArray = null;

		try {
			StringBuffer resultBuffer = new StringBuffer();

			List fixedColumnList = unmarshalObj2List(fixLengthTemplateCode, obj, false);

			// write header byte array
			requestHeaderByteArray = writeHeaderByte(unmarshalObj2List(fixLengthTemplateCode, obj, true),
					headerFixLengthTemplateCode);
			String value = null;
			int size = 1;
			if (fixedColumnList.size() > columnList.size()) {
				size = (fixedColumnList.size() / columnList.size());
			}
			requestBodyByteArray = new byte[totalColumnLength * size];
			int k = 0;
			int i = 0;
			if (fixedColumnList.size() > 0) {
				for (int j = 0; j < size; j++) {
					k = k + i;
					i = 0;
					while (i < columnList.size()) {
						OBColumn obColumn = (OBColumn) columnList.get(i);
						definedLength = obColumn.getLength();
						decimalPlace = obColumn.getDecimalPlace();
						// get value from object
						System.out.println("===>" + (k + i) + "|" + i);
						value = (String) fixedColumnList.get(k + i);
						// System.out.println("name: "+obColumn.getName()+" value:"+value+
						// " type: "+obColumn.getType());
						System.out.println("[" + obColumn.getName() + "]"
								+ Util.pad(" ", 35 - (obColumn.getName().length() + 2)) + "[" + value + "]");
						temp = Util.Encode(value, obColumn.getType().charAt(0), definedLength, true, decimalPlace);

						// Encoding
						System.arraycopy(temp, 0, requestBodyByteArray, startPosition, temp.length);
						startPosition += temp.length;
						i++;
					}
				}
			}

			requestByteArray = new byte[requestHeaderByteArray.length + requestBodyByteArray.length];
			System.arraycopy(requestHeaderByteArray, 0, requestByteArray, 0, requestHeaderByteArray.length);
			System.arraycopy(requestBodyByteArray, 0, requestByteArray, requestHeaderByteArray.length,
					requestBodyByteArray.length);
			return requestByteArray;
			// return new String(requestByteArray,0,requestByteArray.length);
		}
		catch (TransformException tex) {
			throw new TransformException(tex.getMessage());
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
	}

	public Object transformEncodedByteArrayToObj(String tempCdRS, String fixLengthTemplateCode,
			String headerFixLengthTemplateCode, byte[] fixByteArray, Object obj) throws Exception {
		List columnList = new ArrayList();
		OBTransformDefinition obTransformDef = new OBTransformDefinition();
		XMLTransformer xmlTransformer = new XMLTransformer();
		int totalColumnLength = 0;

		try {

			// get xml definition file configuration
			// Object transformObj = new OBTransformDefinition();
			obTransformDef = (OBTransformDefinition) xmlTransformer.transformByteArrayToObj(null, (new TCPUtil())
					.readfile("config" + File.separator + "jibx" + File.separator + "fixed_length_main_map.xml")
					.getBytes(), obTransformDef);
			List fixedLengthList = obTransformDef.getFixedLength();

			OBFixedLengthDefinition obHeaderFixedLength = null;
			for (int i = 0; i < fixedLengthList.size(); i++) {

				if ((columnList != null) && !columnList.isEmpty() && (obHeaderFixedLength != null)) {
					break;
				}

				OBFixedLengthDefinition obFixedLength = (OBFixedLengthDefinition) fixedLengthList.get(i);
				if (fixLengthTemplateCode.equals(obFixedLength.getCode())) {
					columnList = obFixedLength.getColumn();
					totalColumnLength = obFixedLength.getTotalColumnLength();
					break;
				}

				if (obFixedLength.getCode().equals(headerFixLengthTemplateCode)) {
					obHeaderFixedLength = new OBFixedLengthDefinition();
					obHeaderFixedLength = (OBFixedLengthDefinition) fixedLengthList.get(i);
				}
			}
			// String headerStr =
			// readHeaderByte((OBFixedLengthDefinition)fixedLengthList.get(0),fixByteArray,obj);
			// obj =
			// readByte(columnList,fixByteArray,totalColumnLength,headerStr,((OBFixedLengthDefinition)fixedLengthList.get(0)).getTotalColumnLength(),obj);
			String headerStr = readHeaderByte(obHeaderFixedLength, fixByteArray, obj);
			obj = readByte(tempCdRS, columnList, fixByteArray, totalColumnLength, headerStr, obHeaderFixedLength
					.getTotalColumnLength(), obj);
			return obj;
		}
		catch (TransformException tex) {
			throw new TransformException(tex.getMessage());
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		finally {
			columnList = null;
			obj = null;
		}
	}

	private String readHeaderByte(OBFixedLengthDefinition obFixedLength, byte[] fixByteArray, Object obj)
			throws Exception {
		List headerColumnList = null;
		String str = null;
		byte[] temp = null;
		int totalColumnLength = 0;
		int startLength = 0;
		int definedLength = 0;
		int previousLength = 0;
		int decimalPlace = 0;
		String type = null;
		StringBuffer xmlStrBuffer = new StringBuffer();
		String mBaseTRansactionCode = "";
		try {
			headerColumnList = obFixedLength.getColumn();
			totalColumnLength = obFixedLength.getTotalColumnLength();
			byte[] rowByteArray = new byte[totalColumnLength];
			System.arraycopy(fixByteArray, 0, rowByteArray, 0, totalColumnLength);
			xmlStrBuffer.append("<HeaderColumnFields>");

			for (int i = 0; i < headerColumnList.size(); i++) {
				OBColumn obColumn = (OBColumn) headerColumnList.get(i);
				definedLength = obColumn.getLength();
				type = obColumn.getType();
				decimalPlace = obColumn.getDecimalPlace();

				if (i == 0) {
					startLength = 0;
				}
				else {
					startLength = previousLength;
				}

				temp = new byte[definedLength];
				System.arraycopy(rowByteArray, startLength, temp, 0, definedLength);
				previousLength = startLength + definedLength;

				// transform
				if (ITransformConstant.SIBS_BINARY_TYPE == type.charAt(0)) {
					str = Util.Decode(temp, definedLength * 2, type.charAt(0), true, decimalPlace);
				}
				else {
					str = Util.Decode(temp, definedLength, type.charAt(0), true, decimalPlace);
				}

				// if(ITransformConstant.SIBS_PACKED_TYPE == type.charAt(0)){
				//
				// if("-".indexOf(str) > 0){
				// str = "-" + str.substring(definedLength, str.length());
				// }else{
				// str = str.substring(definedLength - 1, str.length());
				// }
				// }

				if ((ITransformConstant.SIBS_PACKED_TYPE == type.charAt(0)) && (startLength > totalColumnLength)) {
					str = "0";
				}
				else {
					str = Util.Decode(temp, definedLength, type.charAt(0), true, decimalPlace);
				}

				// System.out.println("headername: ["+obColumn.getName()+"] --> [ "+str+" ]"+" headerlength == "+str.length());
				xmlStrBuffer.append("<" + obColumn.getName() + ">" + str.trim() + "</" + obColumn.getName() + ">");

				// log transaction
				if ("mbaseTransactionCode".equalsIgnoreCase(obColumn.getName())) {
					mBaseTRansactionCode = str.trim();
				}

			}

			xmlStrBuffer.append("</HeaderColumnFields>");

		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		return xmlStrBuffer.toString();
	}

	private Object readByte(String tempCdRS, List columnList, byte[] mainfixByteArray, int totalSize,
			String headerString, int totalHeaderSize, Object obj) throws Exception {
		int startLength = 0;
		int definedLength = 0;
		int previousLength = 0;
		int decimalPlace = 0;
		int originalReponseLength = 0;
		byte[] temp = null;
		String subStr = null;
		String type = null;
		StringBuffer xmlStrBuffer = new StringBuffer();

		try {
			byte[] fixByteArray = new byte[mainfixByteArray.length - totalHeaderSize];
			System.arraycopy(mainfixByteArray, totalHeaderSize, fixByteArray, 0,
					(mainfixByteArray.length - totalHeaderSize));
			int totalFixedStrRow = fixByteArray.length / totalSize;
			// round up row number to cater byte trim up
			int remainder = fixByteArray.length % totalSize;
			if ((fixByteArray.length > 0) && (remainder > 0)) {
				totalFixedStrRow++;
			}

			originalReponseLength = fixByteArray.length;

			// pad empty string
			int padEmptyStringLength = (totalFixedStrRow * totalSize) - fixByteArray.length;
			if (padEmptyStringLength > 0) {
				// originalReponseLength = fixByteArray.length;
				byte[] strArray = new byte[padEmptyStringLength];
				strArray = Util.Encode(" ", 'A', padEmptyStringLength, true, 0);
				fixByteArray = null;
				fixByteArray = new byte[(mainfixByteArray.length - totalHeaderSize) + padEmptyStringLength];
				System.arraycopy(mainfixByteArray, totalHeaderSize, fixByteArray, 0,
						(mainfixByteArray.length - totalHeaderSize));
				System.arraycopy(strArray, 0, fixByteArray, (mainfixByteArray.length - totalHeaderSize),
						padEmptyStringLength);
			}

			xmlStrBuffer.append("<ColumnFields>");
			xmlStrBuffer.append(headerString);

			for (int l = 0; l < totalFixedStrRow; l++) {
				int n = l * totalSize;
				byte[] rowByteArray = new byte[totalSize];
				System.arraycopy(fixByteArray, n, rowByteArray, 0, totalSize);
				xmlStrBuffer.append("<ColumnField>");

				for (int i = 0; i < columnList.size(); i++) {
					OBColumn obColumn = (OBColumn) columnList.get(i);
					definedLength = obColumn.getLength();
					type = obColumn.getType();
					decimalPlace = obColumn.getDecimalPlace();

					if (i == 0) {
						startLength = 0;
					}
					else {
						startLength = previousLength;
					}

					temp = new byte[definedLength];
					System.arraycopy(rowByteArray, startLength, temp, 0, definedLength);
					// System.out.println("name: ["+obColumn.getName()+"] before decode --> [ "+temp+"] ");

					// check manual padded white space for type 'P'
					if ((ITransformConstant.SIBS_PACKED_TYPE == type.charAt(0)) && (startLength > originalReponseLength)) {
						subStr = "0";
					}
					else {
						subStr = Util.Decode(temp, definedLength, type.charAt(0), true, decimalPlace);
					}

					previousLength = startLength + definedLength;

					// transform
					// subStr = Util.Decode(temp, definedLength, type.charAt(0),
					// true, decimalPlace);
					//
					// if(ITransformConstant.SIBS_PACKED_TYPE ==
					// type.charAt(0)){
					// if("-".indexOf(subStr) > 0){
					// subStr = "-" + subStr.substring(definedLength,
					// subStr.length());
					// }else{
					// subStr = subStr.substring(definedLength - 1,
					// subStr.length());
					// }
					// }
					// escape special character - &'\<>
					subStr = TransformerUtils.formatRequestFields(subStr);

					// System.out.println("name: ["+obColumn.getName()+"] --> [ "+subStr+" ]"+" length == "+subStr.length());
					xmlStrBuffer.append("<" + obColumn.getName() + ">" + subStr.trim() + "</" + obColumn.getName()
							+ ">");

					// log the transaction
				}
				xmlStrBuffer.append("</ColumnField>");
			}

			xmlStrBuffer.append("</ColumnFields>");

			obj = unmarshalXML2Obj(tempCdRS, xmlStrBuffer.toString(), obj);

			return obj;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}

	}

}

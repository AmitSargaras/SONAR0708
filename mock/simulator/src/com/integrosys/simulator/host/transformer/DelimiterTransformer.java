package com.integrosys.simulator.host.transformer;

import java.util.ArrayList;
import java.util.List;

public class DelimiterTransformer {

	public DelimiterTransformer() {
	}

	public Object transformByteArrayToObj(String schemaFileName, byte[] reqByteArray, String separator, Object obj)
			throws Exception {

		try {
			String reqStr = new String(reqByteArray);
			int numberOfSeparator = reqStr.replaceAll("[^" + separator + "]", "").length();
			obj = readString(schemaFileName, separator, numberOfSeparator + 1, reqStr, obj);

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
			obj = null;
		}

	}

	public byte[] transformObjToByteArray(String schemaFileName, String separator, Object obj) throws Exception {
		String formattedDelimiterStr = null;

		try {
			formattedDelimiterStr = writeString(schemaFileName, separator, obj);
			return formattedDelimiterStr.getBytes();

		}
		catch (TransformException tex) {
			throw new TransformException(tex.getMessage());
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		finally {
			formattedDelimiterStr = null;
		}

	}

	public Object unmarshalXML2Obj(String schemaFileName, String str, Object obj) throws Exception {

		try {
			XMLTransformer transformer = new XMLTransformer();
			// obj = transformer.transformStrToObj(schemaFileName,str,obj);
			obj = transformer.transformByteArrayToObj(schemaFileName, str.getBytes(), obj);

		}
		catch (TransformException tex) {
			throw new TransformException(tex.getMessage());
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		return obj;
	}

	private Object readString(String schemaFileName, String separator, int columnSize, String reqStr, Object obj)
			throws Exception {
		StringBuffer xmlStrBuffer = new StringBuffer();
		try {
			// get array string split by separator
			String[] delimiteredStr = reqStr.split("\\" + separator);
			xmlStrBuffer.append("<Definition>");
			for (int i = 0; i < columnSize; i++) {
				if (i < delimiteredStr.length) {
					xmlStrBuffer.append("<Column" + (i + 1) + ">" + delimiteredStr[i] + "</Column" + (i + 1) + ">");
				}
				else {
					xmlStrBuffer.append("<Column" + (i + 1) + "></Column" + (i + 1) + ">");
				}
			}
			xmlStrBuffer.append("</Definition>");
			obj = unmarshalXML2Obj(schemaFileName, xmlStrBuffer.toString(), obj);
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
			obj = null;
			xmlStrBuffer = null;
		}
	}

	public List unmarshalObj2List(String schemaFileName, Object obj) throws Exception {
		List resultList = new ArrayList();

		try {
			XMLTransformer transformer = new XMLTransformer();
			// String str = transformer.transformObjToByteArray(null,obj);
			String str = new String(transformer.transformObjToByteArray(null, obj));

			// if(schemaFileName != null && !"".equals(schemaFileName)){
			// //validate again xsd
			// transformer.validateXMLWithXsd(schemaFileName,convertReqStrForValidation(str));
			// }

			OBTransformDefinition transformObj = new OBTransformDefinition();
			// transformObj =
			// (OBTransformDefinition)transformer.transformStrToObj(null,str,transformObj);
			transformObj = (OBTransformDefinition) transformer.transformByteArrayToObj(null, str.getBytes(),
					transformObj);
			resultList = transformObj.getDelimiterList();

		}
		catch (TransformException tex) {
			throw new TransformException(tex.getMessage());
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		return resultList;
	}

	private String writeString(String schemaFileName, String separator, Object obj) throws Exception {
		StringBuffer strBuffer = new StringBuffer();
		try {
			List delimeterColumnList = unmarshalObj2List(schemaFileName, obj);
			int columnCount = delimeterColumnList.size();
			for (int i = 0; i < columnCount; i++) {

				String str = (String) delimeterColumnList.get(i);
				if (str != null) {
					strBuffer.append(str);
				}

				if (i + 1 != columnCount) {
					strBuffer.append(separator);
				}
			}
			return strBuffer.toString();
		}
		catch (TransformException tex) {
			throw new TransformException(tex.getMessage());
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		finally {
			strBuffer = null;
		}

	}

	private String convertReqStrForValidation(String reqStr) throws Exception {
		StringBuffer strBuffer = new StringBuffer();
		try {

			String[] array = reqStr.split("\\<Column");
			strBuffer.append(array[0]);
			for (int i = 1; i < array.length; i++) {
				if (array[i].startsWith("/>")) {
					strBuffer.append("<Column" + i + array[i]);
				}
				else {
					array[i] = array[i].replaceAll("</Column>", "</Column" + i + ">");
					strBuffer.append("<Column" + i + array[i]);
				}
			}
			return strBuffer.toString();
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}

	}

}

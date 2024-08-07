package com.integrosys.simulator.host.transformer;

import java.util.ArrayList;
import java.util.List;

import com.integrosys.base.techinfra.validation.Validator;
import com.integrosys.simulator.host.base.helper.TCPUtil;
import com.integrosys.simulator.host.transformer.helper.ITransformConstant;
import com.integrosys.simulator.host.transformer.utils.TransformerUtils;

public class TCPFixedLengthTransfomer {

	public TCPFixedLengthTransfomer() {

	}

	public Object transformByteArrayToObj(String schemaFileName, String fixLengthTemplateCode, byte[] fixByteArray,
			Object obj) throws Exception {
		List columnList = new ArrayList();
		OBTransformDefinition obTransformDef = new OBTransformDefinition();
		XMLTransformer xmlTransformer = new XMLTransformer();
		int totalColumnLength = 0;

		try {
			String fixStr = new String(fixByteArray);
			// remove leading white spaces
			fixStr = TransformerUtils.ltrim(fixStr);

			// get xml definition file configuration
			Object transformObj = new OBTransformDefinition();
			obTransformDef = (OBTransformDefinition) xmlTransformer.transformByteArrayToObj(null, (new TCPUtil())
					.readfile("config\\jibx\\fixed_length_main_map.xml").getBytes(), transformObj);
			List fixedLengthList = obTransformDef.getFixedLength();

			for (int i = 0; i < fixedLengthList.size(); i++) {
				OBFixedLengthDefinition obFixedLength = (OBFixedLengthDefinition) fixedLengthList.get(i);
				if (fixLengthTemplateCode.equals(obFixedLength.getCode())) {
					columnList = obFixedLength.getColumn();
					totalColumnLength = obFixedLength.getTotalColumnLength();
					break;
				}
			}
			obj = readString(schemaFileName, columnList, fixStr, totalColumnLength, obj);
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

	private Object readString(String schemaFileName, List columnList, String fixStr, int totalSize, Object obj)
			throws Exception {
		int startLength = 0;
		int definedLength = 0;
		int previousLength = 0;
		String type = null;
		String subStr = null;
		StringBuffer xmlStrBuffer = new StringBuffer();
		try {

			int totalFixedStrLength = fixStr.length() / totalSize;
			String strLine = "";
			xmlStrBuffer.append("<ColumnFields>");
			for (int l = 0; l < totalFixedStrLength; l++) {
				int m = (l * totalSize) + totalSize;
				int n = l * totalSize;
				strLine = fixStr.substring(n, m);
				xmlStrBuffer.append("<ColumnField>");
				for (int i = 0; i < columnList.size(); i++) {

					OBColumn obColumn = (OBColumn) columnList.get(i);
					definedLength = obColumn.getLength();
					type = obColumn.getType();

					if (i == 0) {
						startLength = 0;
					}
					else {
						startLength = previousLength;
					}
					subStr = strLine.substring(startLength, startLength + definedLength);
					previousLength = startLength + definedLength;
					// validate
					// if(!"".equals(subStr.trim()) &&
					// !validateFixedLine(subStr,type,1,definedLength)){
					// throw new
					// Exception(ITransformConstant.FIXED_LENGTH_ERROR+" at line "+l+
					// " ,column "+(startLength+1)+ " - "+(previousLength+1));
					// }
					// if skip flag didn't set to y/Y
					if (!ITransformConstant.SKIP_COLUMN.equalsIgnoreCase(obColumn.getSkip())) {
						// set value based on columnName
						xmlStrBuffer.append("<" + obColumn.getName() + ">" + subStr.trim() + "</" + obColumn.getName()
								+ ">");
					}

				}
				xmlStrBuffer.append("</ColumnField>");
			}
			xmlStrBuffer.append("</ColumnFields>");
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
			type = null;
			subStr = null;
			obj = null;
		}

	}

	public Object unmarshalXML2Obj(String schemaFileName, String str, Object obj) throws Exception {
		try {
			XMLTransformer transformer = new XMLTransformer();
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

	public List unmarshalObj2List(String schemaFileName, Object obj, boolean header) throws Exception {
		List resultList = new ArrayList();
		try {

			// System.out.println("[unmarshalObj2List]");

			XMLTransformer transformer = new XMLTransformer();

			byte[] strByte = transformer.transformObjToByteArray(schemaFileName, obj);

			String objectString = new String(strByte);

			if (objectString.lastIndexOf("ColumnField") > 0) {
				objectString = objectString.replaceAll("<ColumnField>", "");
				objectString = objectString.replaceAll("</ColumnField>", "");
				strByte = objectString.getBytes();
			}
			// if(schemaFileName != null && !"".equals(schemaFileName)){
			// //validate again xsd
			// transformer.validateXMLWithXsd(schemaFileName,convertReqStrForValidation(new
			// String(strByte)));
			// }

			OBTransformDefinition transformReqObj = new OBTransformDefinition();
			transformReqObj = (OBTransformDefinition) transformer.transformByteArrayToObj(null, strByte,
					transformReqObj);
			if (header) {
				resultList = transformReqObj.getHeaderColumnList();
			}
			else {
				resultList = transformReqObj.getFixedColumnList();
			}
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

	private boolean validateFixedLine(String input, String type, int min, int max) throws Exception {
		boolean validate = false;
		try {
			// validate string
			if (ITransformConstant.STRING_TYPE.equals(type)) {
				validate = Validator.validateString(input, false, min, max);
			}
			else if (ITransformConstant.INTEGER_TYPE.equals(type)) {
				// validate number only [0-9]{length}
				validate = Validator.checkPattern(input.trim(), "\\d{0," + max + "}");
			}
			else if (ITransformConstant.NUMERIC_TYPE.equals(type)) {
				// validate numeric - xxxx.xx
				validate = Validator.validateNumber(input, false, min, max);
			}
			else if (ITransformConstant.DATE_TYPE_YYYYMMDD.equals(type)) {
				// yyyymmdd
				validate = Validator.checkPattern(input, "\\d{4}\\d{1,2}\\d{1,2}");
			}
			else if (ITransformConstant.DATE_TYPE_MMDDYYY_WITH_SLASH.equals(type)) {
				// mm/dd/yyyy
				validate = Validator.checkPattern(input, "\\d{1,2}\\/\\d{1,2}\\/\\d{4}");
			}
			else {
				validate = true;
			}
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		return validate;
	}

	public byte[] transformObjToByteArray(String schemaFileName, String fixLengthTemplateCode, Object obj)
			throws Exception {
		String formattedFixedStr = null;
		OBTransformDefinition obTransformDef = new OBTransformDefinition();
		XMLTransformer xmlTransformer = new XMLTransformer();
		int totalColumnLength = 0;
		List columnList = new ArrayList();
		try {
			// get xml definition file configuration
			Object transformObj = new OBTransformDefinition();
			obTransformDef = (OBTransformDefinition) xmlTransformer.transformByteArrayToObj(null, (new TCPUtil())
					.readfile("config\\jibx\\fixed_length_main_map.xml").getBytes(), transformObj);
			List fixedLengthList = obTransformDef.getFixedLength();

			for (int i = 0; i < fixedLengthList.size(); i++) {
				OBFixedLengthDefinition obFixedLength = (OBFixedLengthDefinition) fixedLengthList.get(i);
				if (fixLengthTemplateCode.equals(obFixedLength.getCode())) {
					columnList = obFixedLength.getColumn();
					totalColumnLength = obFixedLength.getTotalColumnLength();
					break;
				}
			}

			formattedFixedStr = writeString(schemaFileName, columnList, totalColumnLength, obj);
			return formattedFixedStr.getBytes();
		}
		catch (TransformException tex) {
			throw new TransformException(tex.getMessage());
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		finally {
			formattedFixedStr = null;
			columnList = null;
		}

	}

	private String writeString(String schemaFileName, List columnList, int totalLength, Object obj) throws Exception {
		int definedLength = 0;
		int count = 0;
		StringBuffer strBuffer = new StringBuffer();
		try {
			List fixedColumnList = unmarshalObj2List(schemaFileName, obj, false);
			for (int i = 0; i < columnList.size(); i++) {
				OBColumn obColumn = (OBColumn) columnList.get(i);
				definedLength = obColumn.getLength();
				// get value from object
				String str = (String) fixedColumnList.get(i);
				if (str != null) {
					strBuffer.append(str);
					count = definedLength - str.length();
					if (count > 0) {
						strBuffer.append(TransformerUtils.fillString(' ', count));
					}

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

			String[] array = reqStr.split("\\<FixColumn");
			strBuffer.append(array[0]);
			for (int i = 1; i < array.length; i++) {
				if (array[i].startsWith("/>")) {
					strBuffer.append("<FixColumn" + i + array[i]);
				}
				else {
					array[i] = array[i].replaceAll("</FixColumn>", "</FixColumn" + i + ">");
					strBuffer.append("<FixColumn" + i + array[i]);
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

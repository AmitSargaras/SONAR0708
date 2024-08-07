package com.integrosys.simulator.host.transformer;

import org.jibx.runtime.JiBXException;

import com.integrosys.simulator.host.transformer.helper.ITransformConstant;

public class Transform {

	public byte[] xmlTransformObjToByteArray(String schemaFileName, Object obj) throws Exception {
		byte[] resultByteArray = null;
		try {
			// throw exception if null object passed in
			if (obj == null) {
				throw new TransformException(ITransformConstant.OBJ_PASSED_IN_IS_NULL);
			}

			XMLTransformer transformer = new XMLTransformer();
			resultByteArray = transformer.transformObjToByteArray(schemaFileName, obj);
		}
		catch (TransformException tex) {
			tex.printStackTrace();
		}
		catch (JiBXException jex) {
			jex.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultByteArray;
	}

	public byte[] fixedLengthTransformObjToByteArray(String schemaFileName, String fixLengthTemplateCode, Object obj)
			throws Exception {
		byte[] resultByteArray = null;
		try {
			// throw exception if null object passed in
			if (obj == null) {
				throw new TransformException(ITransformConstant.OBJ_PASSED_IN_IS_NULL);
			}

			if (fixLengthTemplateCode == null) {
				throw new TransformException(ITransformConstant.FIXED_LENGTH_CODE_IS_NULL);
			}

			TCPFixedLengthTransfomer transformer = new TCPFixedLengthTransfomer();
			resultByteArray = transformer.transformObjToByteArray(schemaFileName, fixLengthTemplateCode, obj);
		}
		catch (TransformException tex) {
			tex.printStackTrace();
		}
		catch (JiBXException jex) {
			jex.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultByteArray;
	}

	public byte[] delimiterTransformObjToByteArray(String schemaFileName, String separator, Object obj)
			throws Exception {
		byte[] resultByteArray = null;
		try {
			// throw exception if null object passed in
			if (obj == null) {
				throw new TransformException(ITransformConstant.OBJ_PASSED_IN_IS_NULL);
			}

			if (separator == null) {
				separator = "|";
			}

			DelimiterTransformer transformer = new DelimiterTransformer();
			resultByteArray = transformer.transformObjToByteArray(schemaFileName, separator, obj);
		}
		catch (TransformException tex) {
			tex.printStackTrace();
		}
		catch (JiBXException jex) {
			jex.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultByteArray;
	}

	public Object xmlTransformByteArrayToObj(String schemaFileName, byte[] reqByteArray, Object obj) throws Exception {

		try {
			// throw exception if null/empty string passed in
			if ((reqByteArray == null) || (reqByteArray.length == 0)) {
				throw new TransformException(ITransformConstant.BYTE_ARRAY_PASSED_IN_IS_NULL);
			}

			XMLTransformer transformer = new XMLTransformer();
			obj = transformer.transformByteArrayToObj(schemaFileName, reqByteArray, obj);
		}
		catch (TransformException tex) {
			tex.printStackTrace();
		}
		catch (JiBXException jex) {
			jex.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		return obj;

	}

	public Object fixedLengthTransformByteArrayToObj(String schemaFileName, String fixLengthTemplateCode,
			byte[] reqByteArray, Object obj) throws Exception {

		try {
			// throw exception if null/empty string passed in
			if ((reqByteArray == null) || (reqByteArray.length == 0)) {
				throw new TransformException(ITransformConstant.BYTE_ARRAY_PASSED_IN_IS_NULL);
			}

			if (fixLengthTemplateCode == null) {
				throw new TransformException(ITransformConstant.FIXED_LENGTH_CODE_IS_NULL);
			}

			TCPFixedLengthTransfomer transformer = new TCPFixedLengthTransfomer();
			obj = transformer.transformByteArrayToObj(schemaFileName, fixLengthTemplateCode, reqByteArray, obj);
		}
		catch (TransformException tex) {
			tex.printStackTrace();
		}
		catch (JiBXException jex) {
			jex.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		return obj;

	}

	public Object delimiterTransformByteArrayToObj(String schemaFileName, byte[] reqByteArray, String separator,
			Object obj) throws Exception {

		try {
			// throw exception if null/empty string passed in
			if ((reqByteArray == null) || (reqByteArray.length == 0)) {
				throw new TransformException(ITransformConstant.BYTE_ARRAY_PASSED_IN_IS_NULL);
			}

			if (separator == null) {
				separator = "|";
			}

			DelimiterTransformer transformer = new DelimiterTransformer();
			obj = transformer.transformByteArrayToObj(schemaFileName, reqByteArray, separator, obj);
		}
		catch (TransformException tex) {
			tex.printStackTrace();
		}
		catch (JiBXException jex) {
			jex.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		return obj;

	}

	public byte[] fixedLengthTransformObjToEncodedByteArray(String fixLengthTemplateCode,
			String headerFixLengthTemplateCode, Object obj) throws Exception {
		byte[] resultStr = null;
		try {
			// throw exception if null object passed in
			if (obj == null) {
				throw new TransformException(ITransformConstant.OBJ_PASSED_IN_IS_NULL);
			}

			if (fixLengthTemplateCode == null) {
				throw new TransformException(ITransformConstant.FIXED_LENGTH_CODE_IS_NULL);
			}

			TCPFixedLengthEncodeTransfomer transformer = new TCPFixedLengthEncodeTransfomer();
			resultStr = transformer.transformObjToEncodedByteArray(fixLengthTemplateCode, headerFixLengthTemplateCode,
					obj);
		}
		catch (TransformException tex) {
			tex.printStackTrace();
		}
		catch (JiBXException jex) {
			jex.printStackTrace();
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}

		return resultStr;
	}

	/*
	 * ublic Object fixedLengthTransformEncodedByteArrayToObj(String
	 * fixLengthTemplateCode,String headerFixLengthTemplateCode, byte[]
	 * reponseByteArray,Object obj)throws Exception { try{ //throw exception if
	 * null/empty string passed in if(reponseByteArray == null ||
	 * reponseByteArray.length == 0){ throw new
	 * TransformException(ITransformConstant.BYTE_ARRAY_PASSED_IN_IS_NULL); }
	 * 
	 * if(fixLengthTemplateCode == null){ throw new
	 * TransformException(ITransformConstant.FIXED_LENGTH_CODE_IS_NULL); }
	 * 
	 * TCPFixedLengthEncodeTransfomer transformer = new
	 * TCPFixedLengthEncodeTransfomer(); obj =
	 * transformer.transformEncodedByteArrayToObj(fixLengthTemplateCode,
	 * headerFixLengthTemplateCode,reponseByteArray, obj);
	 * }catch(TransformException tex){ tex.printStackTrace();
	 * }catch(JiBXException jex){ jex.printStackTrace(); }catch(Exception ex){
	 * ex.printStackTrace(); throw new Exception(ex.getMessage()); }
	 * 
	 * return obj; }
	 */

}

package com.integrosys.simulator.host.transformer;

import java.io.StringReader;
import java.io.StringWriter;

import org.jibx.runtime.BindingDirectory;
import org.jibx.runtime.IBindingFactory;
import org.jibx.runtime.IMarshallingContext;
import org.jibx.runtime.IUnmarshallingContext;
import org.jibx.runtime.JiBXException;

public class XMLTransformer {

	public XMLTransformer() {

	}

	public Object transformByteArrayToObj(String schemaFileName, byte[] reqByteArray, Object obj) throws Exception {
		IBindingFactory bfact = null;
		try {
			// validate xml string with xsd
			// if(schemaFileName != null && !"".equals(schemaFileName)){
			// validateXMLWithXsd(schemaFileName,new String(reqByteArray));
			// }

			// bfact = BindingDirectory.getFactory(obj.getClass());
			// System.out.println("[transformByteArrayToObj]");
			if ((schemaFileName != null) && (schemaFileName.length() > 0)) {
				bfact = BindingDirectory.getFactory(schemaFileName.toLowerCase(), obj.getClass());
			}
			else {
				bfact = BindingDirectory.getFactory(obj.getClass());
			}
			IUnmarshallingContext uctx = bfact.createUnmarshallingContext();
			obj = uctx.unmarshalDocument(new StringReader(new String(reqByteArray)));

		}
		catch (JiBXException jibx) {
			jibx.printStackTrace();
			throw new JiBXException(jibx.getMessage());
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		return obj;
	}

	public byte[] transformObjToByteArray(String schemaFileName, Object obj) throws Exception {

		StringWriter strWriter = new StringWriter();
		IBindingFactory bfact = null;
		try {

			// IBindingFactory bfact =
			// BindingDirectory.getFactory(obj.getClass());
			// System.out.println("[transformObjToByteArray]");
			if ((schemaFileName != null) && (schemaFileName.length() > 0)) {
				bfact = BindingDirectory.getFactory(schemaFileName.toLowerCase(), obj.getClass());
			}
			else {
				bfact = BindingDirectory.getFactory(obj.getClass());
			}

			IMarshallingContext mctx = bfact.createMarshallingContext();
			mctx.marshalDocument(obj, "UTF-8", null, strWriter);

			// validate xml string with xsd
			// if(schemaFileName != null && !"".equals(schemaFileName)){
			// validateXMLWithXsd(schemaFileName,strWriter.toString());
			// }

			return strWriter.toString().getBytes();

		}
		catch (JiBXException jibx) {
			jibx.printStackTrace();
			throw new JiBXException(jibx.getMessage());
		}
		catch (Exception ex) {
			ex.printStackTrace();
			throw new Exception(ex.getMessage());
		}
		finally {
			if (strWriter != null) {
				strWriter.close();
			}
		}

	}

	/*
	 * public void validateXMLWithXsd (String schemaFile,String xmlStr)throws
	 * SAXException,Exception{
	 * 
	 * try{
	 * 
	 * schemaFile = "jibx/xsd/" + schemaFile; SchemaHandler handler = new
	 * SchemaHandler(); SchemaResolver resolver = new SchemaResolver();
	 * SchemaFactory factory =
	 * SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
	 * factory.setErrorHandler(handler);
	 * 
	 * Schema schema = factory.newSchema(new
	 * StreamSource(getClass().getClassLoader
	 * ().getResourceAsStream(schemaFile))); Validator schemaValidator =
	 * schema.newValidator(); schemaValidator.setResourceResolver(resolver);
	 * schemaValidator.setErrorHandler(handler);
	 * 
	 * try{ schemaValidator.validate(new StreamSource(new
	 * StringReader(xmlStr))); }catch( SAXException saxe ) {
	 * saxe.printStackTrace(); throw new SAXException(saxe.getMessage()); }
	 * 
	 * //construct error list List errorList = handler.getErrorList();
	 * if(errorList!=null && errorList.size() > 0){ StringBuffer errorBuffer =
	 * new StringBuffer(); for(int i=0; i<errorList.size();i++){
	 * errorBuffer.append(errorList.get(i)); } throw new
	 * TransformException(errorBuffer.toString()); } }catch(TransformException
	 * tex){ throw new TransformException(tex.getMessage()); }catch(Exception
	 * ex){ ex.printStackTrace(); throw new Exception(ex.getMessage()); } }
	 */

}

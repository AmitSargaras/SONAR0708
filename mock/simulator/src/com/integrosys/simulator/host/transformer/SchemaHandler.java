package com.integrosys.simulator.host.transformer;

import java.util.ArrayList;
import java.util.List;

import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.helpers.DefaultHandler;

public class SchemaHandler extends DefaultHandler {

	private List errorStrList = new ArrayList();

	/**
	 * 
	 * @param sAXParseException
	 * @throws SAXException
	 */
	public void error(SAXParseException sAXParseException) throws SAXException {
		contructErrorValidationList(sAXParseException);
	}

	/**
	 * 
	 * @param sAXParseException
	 * @throws SAXException
	 */
	public void fatalError(SAXParseException sAXParseException) throws SAXException {
		contructErrorValidationList(sAXParseException);
	}

	/**
	 * 
	 * @param sAXParseException
	 * @throws SAXException
	 */
	public void warning(SAXParseException sAXParseException) throws SAXException {
		contructErrorValidationList(sAXParseException);
	}

	private void contructErrorValidationList(SAXParseException sAXParseException) {
		errorStrList.add(System.getProperty("line.separator") + sAXParseException);
	}

	public List getErrorList() {
		return errorStrList;
	}

}

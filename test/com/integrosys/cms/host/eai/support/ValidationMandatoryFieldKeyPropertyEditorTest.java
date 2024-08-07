package com.integrosys.cms.host.eai.support;

import java.beans.PropertyEditor;
import java.io.InputStream;

import junit.framework.TestCase;

import org.springframework.beans.factory.xml.DefaultDocumentLoader;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;

public class ValidationMandatoryFieldKeyPropertyEditorTest extends TestCase {

	/** The property editor to be tested */
	private final PropertyEditor editor = new ValidationMandatoryFieldKeyPropertyEditor();

	private final PropertyEditor editorWithClazz = new ValidationMandatoryFieldKeyPropertyEditor(true, true);

	public void testInvalidCase() {
		String value = "SOURCE_XXX CLASS_aaa PROPER_bbb";
		try {
			editor.setAsText(value);
			fail("should throw IllegalArgumentException as there is no PROPER_ prefix");
		}
		catch (IllegalArgumentException ex) {
			assertTrue(ex.getMessage().indexOf("PROPERTY_") > 0);
			System.out.println(ex);
		}
	}

	public void testAnotherInvalidCase() {
		String value = "SOURCE_XXX CLASS_aaa PROPERTY_bbb SOURCE_YYY";
		try {
			editor.setAsText(value);
			fail("should throw IllegalArgumentException as there is 4 tokens");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testAnotherInvalidCaseBecauseBlankValue() {
		String value = "";
		try {
			editor.setAsText(value);
			fail("should throw IllegalArgumentException as there is no value provided");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testSimpleValidCase() {
		String value = "SOURCE_XXX CLASS_aaa PROPERTY_bbb";
		try {
			editor.setAsText(value);
		}
		catch (IllegalArgumentException ex) {
			fail("shouldn't throw any exception");
		}
		assertEquals(new ValidationMandatoryFieldKey("XXX", "aaa", "bbb"), editor.getValue());
	}

	public void testAnotherSimpleValidCase() {
		String value = "SOURCE_XXX, CLASS_aaa, PROPERTY_bbb";
		try {
			editor.setAsText(value);
		}
		catch (IllegalArgumentException ex) {
			fail("shouldn't throw any exception");
		}
		assertEquals(new ValidationMandatoryFieldKey("XXX", "aaa", "bbb"), editor.getValue());
	}

	public void testAgainAnotherSimpleValidCase() {
		String value = "SOURCE_XXX, \n CLASS_aaa, \n PROPERTY_bbb";
		try {
			editor.setAsText(value);
		}
		catch (IllegalArgumentException ex) {
			fail("shouldn't throw any exception");
		}
		assertEquals(new ValidationMandatoryFieldKey("XXX", "aaa", "bbb"), editor.getValue());
	}

	public void testAgainAnotherLittleComplexValidCase() {
		String value = "       \n\r     SOURCE_XXX,      \n\r  CLASS_aaa,     \n\r           PROPERTY_bbb       \n\r     ";
		try {
			editor.setAsText(value);
		}
		catch (IllegalArgumentException ex) {
			fail("shouldn't throw any exception");
		}
		assertEquals(new ValidationMandatoryFieldKey("XXX", "aaa", "bbb"), editor.getValue());
	}

	public void testInvalidCaseBecauseNoClassFound() {
		String value = "SOURCE_XXX, \n CLASS_aaa, \n PROPERTY_bbb";
		try {
			editorWithClazz.setAsText(value);
			fail("should throw IllegalArgumentException because no class found for 'aaa'");
		}
		catch (IllegalArgumentException ex) {
			//
		}

		assertNull(editorWithClazz.getValue());
	}

	public void testValidCaseWithClassFound() {
		String value = "SOURCE_XXX, \n CLASS_com.integrosys.cms.app.collateral.bus.ICollateral, \n PROPERTY_CMV";
		try {
			editorWithClazz.setAsText(value);
		}
		catch (IllegalArgumentException ex) {
			fail("shouldn't throw IllegalArgumentException as we can find 'com.integrosys.cms.app.collateral.bus.ICollateral'");
		}

		assertNotNull(editorWithClazz.getValue());
		assertEquals(
				new ValidationMandatoryFieldKey("XXX", "com.integrosys.cms.app.collateral.bus.ICollateral", "CMV"),
				editorWithClazz.getValue());
	}

	public void testValidCaseWithClassFoundButPropertyNotFound() {
		String value = "SOURCE_XXX, \n CLASS_com.integrosys.cms.app.collateral.bus.ICollateral, \n PROPERTY_bbb";
		PropertyEditor editorWithClazzAndWOProperty = new ValidationMandatoryFieldKeyPropertyEditor(true, false);
		try {
			editorWithClazzAndWOProperty.setAsText(value);
		}
		catch (IllegalArgumentException ex) {
			fail("shouldn't throw IllegalArgumentException since it's 'false' for property check.");
		}

		assertNotNull(editorWithClazzAndWOProperty.getValue());
		assertEquals(
				new ValidationMandatoryFieldKey("XXX", "com.integrosys.cms.app.collateral.bus.ICollateral", "bbb"),
				editorWithClazzAndWOProperty.getValue());
	}

	public void testInvalidCaseWithoutAnySourceClassPropertyValue() {
		String value = "SOURCE_, \n CLASS_, \n PROPERTY_";
		try {
			editor.setAsText(value);
			fail("Should have throw IllegalArgumentException since no value provided.");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testParseValueFromXml() {
		InputStream valuesStream = getClass().getResourceAsStream("values.xml");
		DefaultDocumentLoader loader = new DefaultDocumentLoader();
		String value = null;
		try {
			Document doc = loader.loadDocument(new InputSource(valuesStream), null, null, 0, false);
			Element ele = (Element) doc.getElementsByTagName("value").item(0);
			value = ele.getChildNodes().item(0).getNodeValue();
			editor.setAsText(value);
		}
		catch (IllegalArgumentException ex) {
			fail("shouldn't throw any error when parsing value [" + value + "], nested " + ex);
		}
		catch (Exception ex) {
			ex.printStackTrace();
			fail("fail to parse 'values.xml', nested " + ex);
		}
	}
}

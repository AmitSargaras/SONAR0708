package com.integrosys.cms.batch.common.mapping;

import java.math.BigDecimal;
import java.util.Date;

import junit.framework.TestCase;

public class ColumnMetaInfoArrayPropertyEditorTest extends TestCase {
	public void testAllCombinations() {
		String metaInfoRawText = "1=boolean,BOOLEANTRUE_Y" + "\n2=string" + "\n3=long" + "\n4=double,DECIMAL_2"
				+ "\n5=bigdecimal" + "\n6=bigdecimal,DECIMAL_6" + "\n7=date,DATEFORMAT_ddMMyyyy";

		ColumnMetaInfoArrayPropertyEditor editor = new ColumnMetaInfoArrayPropertyEditor();
		editor.setAsText(metaInfoRawText);

		ColumnMetaInfo[] metainfo = (ColumnMetaInfo[]) editor.getValue();
		assertEquals(Boolean.class, metainfo[0].getClassType());
		assertEquals("Y", metainfo[0].getBooleanTrueValue());
		assertEquals(String.class, metainfo[1].getClassType());
		assertEquals(Long.class, metainfo[2].getClassType());
		assertEquals(Double.class, metainfo[3].getClassType());
		assertEquals(BigDecimal.class, metainfo[4].getClassType());
		assertTrue(metainfo[4].getDecimalPoints() == 0);
		assertEquals(BigDecimal.class, metainfo[5].getClassType());
		assertTrue(metainfo[5].getDecimalPoints() == 6);
		assertEquals(Date.class, metainfo[6].getClassType());
		assertEquals("ddMMyyyy", metainfo[6].getDateFormat());
	}

	public void testInvalidBooleanType() {
		String metaInfoRawText = "1=boolean";

		ColumnMetaInfoArrayPropertyEditor editor = new ColumnMetaInfoArrayPropertyEditor();
		try {
			editor.setAsText(metaInfoRawText);
			fail("should get boolean true value must be provided error");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testInvalidDateType() {
		String metaInfoRawText = "1=date";

		ColumnMetaInfoArrayPropertyEditor editor = new ColumnMetaInfoArrayPropertyEditor();
		try {
			editor.setAsText(metaInfoRawText);
			fail("should get date format must be provided error");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testInvalidPrefixValue() {
		String metaInfoRawText = "1=boolean,booleanValue_Y";

		ColumnMetaInfoArrayPropertyEditor editor = new ColumnMetaInfoArrayPropertyEditor();
		try {
			editor.setAsText(metaInfoRawText);
			fail("should get invalid prefix error");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testInvalidDecimalPointValue() {
		String metaInfoRawText = "1=double,DECIMAL_Y";

		ColumnMetaInfoArrayPropertyEditor editor = new ColumnMetaInfoArrayPropertyEditor();
		try {
			editor.setAsText(metaInfoRawText);
			fail("should get invalid format error");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testInvalidClassType() {
		String metaInfoRawText = "1=amount";

		ColumnMetaInfoArrayPropertyEditor editor = new ColumnMetaInfoArrayPropertyEditor();
		try {
			editor.setAsText(metaInfoRawText);
			fail("should get invalid class type error");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testInvalidMetaInfoFormat() {
		String metaInfoRawText = "1=amount=abc=xyz";

		ColumnMetaInfoArrayPropertyEditor editor = new ColumnMetaInfoArrayPropertyEditor();
		try {
			editor.setAsText(metaInfoRawText);
			fail("should get invalid meta info format error");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testInvalidColumnNumber() {
		String metaInfoRawText = "b=string";

		ColumnMetaInfoArrayPropertyEditor editor = new ColumnMetaInfoArrayPropertyEditor();
		try {
			editor.setAsText(metaInfoRawText);
			fail("should get invalid column number error");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}

	public void testLessThan1ColumnNumber() {
		String metaInfoRawText = "0=string";

		ColumnMetaInfoArrayPropertyEditor editor = new ColumnMetaInfoArrayPropertyEditor();
		try {
			editor.setAsText(metaInfoRawText);
			fail("should get invalid column number error");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
		}
	}
}

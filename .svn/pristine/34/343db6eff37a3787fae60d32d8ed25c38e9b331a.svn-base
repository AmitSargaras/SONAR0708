package com.integrosys.cms.batch.common.mapping;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import junit.framework.TestCase;

import org.apache.commons.lang.time.DateUtils;
import org.easymock.MockControl;
import org.springframework.batch.item.file.mapping.FieldSet;

import com.integrosys.base.businfra.currency.Amount;

/**
 * @author Chong Jun Yong
 * 
 */
public class DefaultListRecordsFieldSetMapperTest extends TestCase {
	public void testAllCombinations() throws Exception {
		List metaInfoList = new ArrayList();

		ColumnMetaInfo column1MetaInfo = new ColumnMetaInfo(1, Integer.class);
		metaInfoList.add(column1MetaInfo);

		ColumnMetaInfo column2MetaInfo = new ColumnMetaInfo(2, String.class);
		metaInfoList.add(column2MetaInfo);

		ColumnMetaInfo column3MetaInfo = new ColumnMetaInfo(3, Date.class, "ddMMyyyy");
		metaInfoList.add(column3MetaInfo);

		ColumnMetaInfo column4MetaInfo = new ColumnMetaInfo(4, Double.class, 2);
		metaInfoList.add(column4MetaInfo);

		ColumnMetaInfo column5MetaInfo = new ColumnMetaInfo(5, Long.class);
		metaInfoList.add(column5MetaInfo);

		ColumnMetaInfo column6MetaInfo = new ColumnMetaInfo(6, BigDecimal.class, 4);
		metaInfoList.add(column6MetaInfo);

		ColumnMetaInfo column7MetaInfo = new ColumnMetaInfo(7, "YES");
		metaInfoList.add(column7MetaInfo);

		DefaultListRecordsFieldSetMapper mapper = new DefaultListRecordsFieldSetMapper();
		mapper.setColumnMetaInfos((ColumnMetaInfo[]) metaInfoList.toArray(new ColumnMetaInfo[0]));

		MockControl fieldSetControl = MockControl.createControl(FieldSet.class);
		FieldSet mockFieldSet = (FieldSet) fieldSetControl.getMock();
		mockFieldSet.readInt(0);
		fieldSetControl.setReturnValue(Integer.valueOf("12345").intValue());
		mockFieldSet.readString(0);
		fieldSetControl.setReturnValue("12345");
		mockFieldSet.readString(1);
		fieldSetControl.setReturnValue("I AM FINE");
		mockFieldSet.readString(1);
		fieldSetControl.setReturnValue("I AM FINE");
		mockFieldSet.readString(2);
		fieldSetControl.setReturnValue("26032009");
		mockFieldSet.readDate(2, "ddMMyyyy");
		fieldSetControl.setReturnValue(DateUtils.parseDate("26032009", new String[] { "ddMMyyyy" }));
		mockFieldSet.readString(3);
		fieldSetControl.setReturnValue("999");
		mockFieldSet.readDouble(3);
		fieldSetControl.setReturnValue(999d);
		mockFieldSet.readLong(4);
		fieldSetControl.setReturnValue(7230307l);
		mockFieldSet.readString(4);
		fieldSetControl.setReturnValue("7230307");
		mockFieldSet.readString(5);
		fieldSetControl.setReturnValue("333355");
		mockFieldSet.readString(5);
		fieldSetControl.setReturnValue("333355");
		mockFieldSet.readBoolean(6, "YES");
		fieldSetControl.setReturnValue(true);
		mockFieldSet.readString(6);
		fieldSetControl.setReturnValue("YES");
		fieldSetControl.replay();

		List records = (List) mapper.doMapLine(mockFieldSet);
		assertEquals(Integer.valueOf("12345"), (Integer) records.get(0));
		assertEquals("I AM FINE", (String) records.get(1));
		assertEquals(DateUtils.parseDate("26032009", new String[] { "ddMMyyyy" }), (Date) records.get(2));
		assertEquals(new Double(9.99d), (Double) records.get(3));
		assertEquals(Long.valueOf("7230307"), (Long) records.get(4));
		assertEquals(new BigDecimal(Double.toString(33.3355d)), (BigDecimal) records.get(5));
		assertEquals(Boolean.TRUE, (Boolean) records.get(6));

		fieldSetControl.verify();
	}

	public void testInvalidDataType() throws Exception {
		List metaInfoList = new ArrayList();

		ColumnMetaInfo column1MetaInfo = new ColumnMetaInfo(1, Integer.class);
		metaInfoList.add(column1MetaInfo);
		ColumnMetaInfo column2MetaInfo = new ColumnMetaInfo(2, Amount.class);
		metaInfoList.add(column2MetaInfo);

		DefaultListRecordsFieldSetMapper mapper = new DefaultListRecordsFieldSetMapper();
		mapper.setColumnMetaInfos((ColumnMetaInfo[]) metaInfoList.toArray(new ColumnMetaInfo[0]));

		MockControl fieldSetControl = MockControl.createControl(FieldSet.class);
		FieldSet mockFieldSet = (FieldSet) fieldSetControl.getMock();
		mockFieldSet.readInt(0);
		fieldSetControl.setReturnValue(Integer.valueOf("12345").intValue());
		mockFieldSet.readString(0);
		fieldSetControl.setReturnValue("12345");
		mockFieldSet.readString(1);
		fieldSetControl.setReturnValue("something");
		fieldSetControl.replay();

		try {
			mapper.doMapLine(mockFieldSet);
			fail("should have throw illegal argument exception for invalid data type");
		}
		catch (IllegalArgumentException ex) {
			System.out.println(ex);
			// ok
		}

		fieldSetControl.verify();
	}
}

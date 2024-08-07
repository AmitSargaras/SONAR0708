package com.integrosys.cms.batch.common;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.springframework.batch.item.file.transform.RangeArrayPropertyEditor;
import org.springframework.batch.support.IntArrayPropertyEditor;
import org.springframework.beans.factory.config.CustomEditorConfigurer;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.test.AbstractSingleSpringContextTests;

import com.integrosys.cms.batch.common.mapping.ColumnMetaInfoArrayPropertyEditor;

/**
 * <p>
 * Base Test Case for Batch Job required Application Context (before refreshed)
 * to be added additional Post Processor or etc.
 * <p>
 * Currently adding <tt>CustomEditorConfigurer</tt> to the context before it
 * getting refreshed.
 * @author Chong Jun Yong
 * 
 */
public abstract class AbstractFeedLoaderBatchJobTestCase extends AbstractSingleSpringContextTests {
	protected void prepareApplicationContext(GenericApplicationContext context) {
		Map customerEditors = new HashMap();
		customerEditors.put("int[]", new IntArrayPropertyEditor());
		customerEditors.put("org.springframework.batch.item.file.transform.Range[]", new RangeArrayPropertyEditor());
		customerEditors.put("java.util.Date", new CustomDateEditor(new SimpleDateFormat("ddMMyyyy"), false));
		customerEditors.put("com.integrosys.cms.batch.common.mapping.ColumnMetaInfo[]",
				new ColumnMetaInfoArrayPropertyEditor());

		CustomEditorConfigurer customerEditorConfigurer = new CustomEditorConfigurer();
		customerEditorConfigurer.setCustomEditors(customerEditors);

		context.addBeanFactoryPostProcessor(customerEditorConfigurer);
	}
}

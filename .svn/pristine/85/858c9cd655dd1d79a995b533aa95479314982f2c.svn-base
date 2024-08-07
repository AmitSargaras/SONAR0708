package com.integrosys.cms.batch.sema;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.transform.FixedLengthTokenizer;
import org.springframework.batch.item.file.transform.PrefixMatchingCompositeLineTokenizer;
import org.springframework.batch.item.file.transform.Range;
import org.springframework.batch.item.file.transform.RangeArrayPropertyEditor;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.test.AbstractSingleSpringContextTests;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.test.PropertyFlatFileLoader;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.common.BatchFeedErrorLogger;
import com.integrosys.cms.batch.common.ReturnNullLineTokenizer;

/**
 * Integration test to persist data into temp table.
 * 
 * @author Chong Jun Yong
 * 
 */
public class FacilityFeedLoaderIntegrationTest extends AbstractSingleSpringContextTests {

	private String facilityFeedLocation;

	private TransactionTemplate transactionTemplate;

	private ResourceLoader resourceLoader = new DefaultResourceLoader(Thread.currentThread().getContextClassLoader());

	private String rangeText = "1-1,2-21,22-41,42-61,62-69,70-70,71-88,89-95,96-110,111-111";

	public String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml" };
	}

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();

		Properties props = PropertyFlatFileLoader.loadFromClassPath("batch.properties");

		facilityFeedLocation = props.getProperty("resource.sema.facility.feed.path");

		transactionTemplate = new TransactionTemplate(new MockBatchSpringTransactionManager());
	}

	public void testDoWork() {

		RangeArrayPropertyEditor rangeArrayPropertyEditor = new RangeArrayPropertyEditor();

		rangeArrayPropertyEditor.setAsText(rangeText);
		Range[] ranges = (Range[]) rangeArrayPropertyEditor.getValue();

		FixedLengthTokenizer fixedLengthTokenizer = new FixedLengthTokenizer();
		fixedLengthTokenizer.setColumns(ranges);

		Map tokenizerMap = new HashMap();
		tokenizerMap.put("D", fixedLengthTokenizer);
		tokenizerMap.put("T", new ReturnNullLineTokenizer());

		PrefixMatchingCompositeLineTokenizer tokenizer = new PrefixMatchingCompositeLineTokenizer();
		tokenizer.setTokenizers(tokenizerMap);

		Resource facilityResource = resourceLoader.getResource(facilityFeedLocation);

		FacilityFileSetFileMapperImpl mapper = new FacilityFileSetFileMapperImpl();
		mapper.setDateFormat("yyyyMMdd");
		mapper.setOutstandingBalanceDecimal(2);

		FlatFileItemReader reader = new FlatFileItemReader();
		reader.setResource(facilityResource);
		reader.setFieldSetMapper(mapper);
		reader.setFirstLineIsHeader(true);
		reader.setLineTokenizer(tokenizer);

		FacilityFileDAO facilityFeedDao = new FacilityFileDAO();
		facilityFeedDao.setSessionFactory((SessionFactory) getApplicationContext().getBean("ofaSessionFactory"));

		final List batchFeedErrorList = new ArrayList();
		BatchFeedErrorLogger mockBatchFeedErrorLogger = (BatchFeedErrorLogger) Proxy.newProxyInstance(
				BatchFeedErrorLogger.class.getClassLoader(), new Class[] { BatchFeedErrorLogger.class },
				new InvocationHandler() {

					public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
						if (method.getName().equals("log") && args[0] instanceof Collection) {
							batchFeedErrorList.addAll((Collection) args[0]);
							return null;
						}
						return null;
					}
				});

		FacilityFileLoader loader = new FacilityFileLoader();
		loader.setFacilityFileDAO(facilityFeedDao);
		loader.setFacilityFileReader(reader);
		loader.setTransactionTemplate(transactionTemplate);
		loader.setFeedBatchSize(500);
		loader.setBatchFeedErrorLogger(mockBatchFeedErrorLogger);
		loader.execute(null);

		assertTrue("should not have any error", batchFeedErrorList.isEmpty());
	}
}

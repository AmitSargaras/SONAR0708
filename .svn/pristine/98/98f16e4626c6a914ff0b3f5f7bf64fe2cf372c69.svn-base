package com.integrosys.cms.batch.sema;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import junit.framework.TestCase;

import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.transform.FixedLengthTokenizer;
import org.springframework.batch.item.file.transform.PrefixMatchingCompositeLineTokenizer;
import org.springframework.batch.item.file.transform.Range;
import org.springframework.batch.item.file.transform.RangeArrayPropertyEditor;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.test.PropertyFlatFileLoader;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.common.FileSystemBatchFeedErrorLogger;
import com.integrosys.cms.batch.common.ReturnNullLineTokenizer;

public class FacilityFileLoaderTest extends TestCase {

	private String facilityFeedLocation;

	private TransactionTemplate transactionTemplate;

	private ResourceLoader resourceLoader = new DefaultResourceLoader(Thread.currentThread().getContextClassLoader());

	private String rangeText = "1-1,2-21,22-41,42-61,62-69,70-70,71-88,89-95,96-110,111-111";

	public void setUp() {
		Log4jConfigTestPlugin.configure();

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

		final List facilityFeedList = new ArrayList();

		IFacilityFileDAO mockFacilityFeedDao = (IFacilityFileDAO) Proxy.newProxyInstance(IFacilityFileDAO.class
				.getClassLoader(), new Class[] { IFacilityFileDAO.class }, new InvocationHandler() {

			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				if (method.getName().equals("createFacilityFileItems")) {
					List feedList = (List) args[0];

					facilityFeedList.addAll(feedList);
					if (feedList.size() > 0) {
						assertTrue(feedList.get(0) instanceof IFacilityFile);
					}
				}
				return null;
			}
		});

		FileSystemBatchFeedErrorLogger logger = new FileSystemBatchFeedErrorLogger();
		logger.setLogFileLocation("sema.test.log");

		FacilityFileLoader loader = new FacilityFileLoader();
		loader.setFacilityFileDAO(mockFacilityFeedDao);
		loader.setFacilityFileReader(reader);
		loader.setTransactionTemplate(transactionTemplate);
		loader.setFeedBatchSize(200);
		loader.setBatchFeedErrorLogger(logger);
		loader.execute(null);

		assertEquals(700, facilityFeedList.size());
	}
}

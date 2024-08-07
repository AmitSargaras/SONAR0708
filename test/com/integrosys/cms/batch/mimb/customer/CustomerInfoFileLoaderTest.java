package com.integrosys.cms.batch.mimb.customer;

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
import org.springframework.batch.item.file.transform.DelimitedLineTokenizer;
import org.springframework.batch.item.file.transform.PrefixMatchingCompositeLineTokenizer;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.test.PropertyFlatFileLoader;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.common.ReturnNullLineTokenizer;

public class CustomerInfoFileLoaderTest extends TestCase {

	private String customerInfoFeedLocation;

	private TransactionTemplate transactionTemplate;

	private ResourceLoader resourceLoader = new DefaultResourceLoader(Thread.currentThread().getContextClassLoader());

	public void setUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		Properties props = PropertyFlatFileLoader.loadFromClassPath("batch.properties");

		customerInfoFeedLocation = props.getProperty("resource.mimb.customer.feed.path");

		transactionTemplate = new TransactionTemplate(new MockBatchSpringTransactionManager());
	}

	public void testDoWork() {
		Map tokenizerMap = new HashMap();
		tokenizerMap.put("D", new DelimitedLineTokenizer());
		tokenizerMap.put("T", new ReturnNullLineTokenizer());

		PrefixMatchingCompositeLineTokenizer tokenizer = new PrefixMatchingCompositeLineTokenizer();
		tokenizer.setTokenizers(tokenizerMap);

		CustomerInfoFieldSetMapperImpl fieldSetMapper = new CustomerInfoFieldSetMapperImpl();

		Resource customerInfoFeedRes = resourceLoader.getResource(customerInfoFeedLocation);

		FlatFileItemReader readCustomerInfoFile = new FlatFileItemReader();
		readCustomerInfoFile.setFieldSetMapper(fieldSetMapper);
		readCustomerInfoFile.setResource(customerInfoFeedRes);
		readCustomerInfoFile.setFirstLineIsHeader(true);
		readCustomerInfoFile.setLineTokenizer(tokenizer);

		final List customerFeedList = new ArrayList();

		ICustomerInfoDAO mockCustomerInfoDao = (ICustomerInfoDAO) Proxy.newProxyInstance(ICustomerInfoDAO.class
				.getClassLoader(), new Class[] { ICustomerInfoDAO.class }, new InvocationHandler() {

			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				if (method.getName().equals("createCustomerInfoItems")) {
					List feedList = (List) args[0];

					customerFeedList.addAll(feedList);
					if (feedList.size() > 0) {
						assertTrue(feedList.get(0) instanceof ICustomerInfo);
					}
				}
				return null;
			}
		});

		CustomerInfoFileLoader customerInfoFileLoader = new CustomerInfoFileLoader();
		customerInfoFileLoader.setCustomerInfoFileReader(readCustomerInfoFile);
		customerInfoFileLoader.setCustomerInfoFileDAO(mockCustomerInfoDao);
		customerInfoFileLoader.setTransactionTemplate(transactionTemplate);
		customerInfoFileLoader.setFeedBatchSize(500);
		customerInfoFileLoader.execute(null);

		assertTrue(customerFeedList.size() > 0);

	}
}

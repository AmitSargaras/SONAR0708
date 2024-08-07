package com.integrosys.cms.batch.feeds.stock;

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
import org.springframework.batch.item.file.mapping.FieldSetMapper;
import org.springframework.batch.item.file.transform.DelimitedLineTokenizer;
import org.springframework.batch.item.file.transform.PrefixMatchingCompositeLineTokenizer;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.test.PropertyFlatFileLoader;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.common.ReturnNullLineTokenizer;

public class StockPriceFileLoaderTest extends TestCase {

	private FlatFileItemReader readStockPriceFile;

	private Resource resource;

	private FieldSetMapper fieldSetMapper;

	private StockPriceFileLoader stockPriceFileLoader;

	private String stockPriceFeedLocation;

	private TransactionTemplate transactionTemplate;

	private ResourceLoader resourceLoader = new DefaultResourceLoader(Thread.currentThread().getContextClassLoader());

	public void setUp() {
		readStockPriceFile = new FlatFileItemReader();
		fieldSetMapper = new StockPriceFieldSetMapperImpl();
		stockPriceFileLoader = new StockPriceFileLoader();

		Properties props = PropertyFlatFileLoader.loadFromClassPath("batch.properties");

		stockPriceFeedLocation = props.getProperty("resource.stock.feed.path");
		resource = resourceLoader.getResource(stockPriceFeedLocation);

		transactionTemplate = new TransactionTemplate(new MockBatchSpringTransactionManager());
	}

	public void testDoWork() {

		Map tokenizerMap = new HashMap();
		tokenizerMap.put("D", new DelimitedLineTokenizer());
		tokenizerMap.put("T", new ReturnNullLineTokenizer());

		PrefixMatchingCompositeLineTokenizer tokenizer = new PrefixMatchingCompositeLineTokenizer();
		tokenizer.setTokenizers(tokenizerMap);

		readStockPriceFile.setFieldSetMapper(fieldSetMapper);
		readStockPriceFile.setResource(resource);
		readStockPriceFile.setFirstLineIsHeader(true);
		readStockPriceFile.setLineTokenizer(tokenizer);

		final List stockPriceFeedList = new ArrayList();

		IStockPriceFileDAO mockStockPriceFeedDao = (IStockPriceFileDAO) Proxy.newProxyInstance(IStockPriceFileDAO.class
				.getClassLoader(), new Class[] { IStockPriceFileDAO.class }, new InvocationHandler() {

			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				if (method.getName().equals("createStockPriceItems")) {
					List feedList = (List) args[0];

					stockPriceFeedList.addAll(feedList);
					if (feedList.size() > 0) {
						assertTrue(feedList.get(0) instanceof IStockPrice);
					}
				}
				return null;
			}
		});

		stockPriceFileLoader.setStockPriceFileReader(readStockPriceFile);
		stockPriceFileLoader.setStockPriceFileDAO(mockStockPriceFeedDao);
		stockPriceFileLoader.setFeedBatchSize(500);
		stockPriceFileLoader.setTransactionTemplate(transactionTemplate);
		stockPriceFileLoader.execute(null);

		assertTrue(stockPriceFeedList.size() > 0);
	}
}

package com.integrosys.cms.batch.feeds.stock;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.mapping.FieldSetMapper;
import org.springframework.batch.item.file.transform.DelimitedLineTokenizer;
import org.springframework.batch.item.file.transform.PrefixMatchingCompositeLineTokenizer;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.test.AbstractTransactionalSpringContextTests;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.test.PropertyFlatFileLoader;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;
import com.integrosys.cms.batch.common.ReturnNullLineTokenizer;

public class StockPriceFeedLoaderIntegrationTest extends AbstractTransactionalSpringContextTests {
	private FlatFileItemReader readStockPriceFile;

	private Resource resource;

	private FieldSetMapper fieldSetMapper;

	private StockPriceFileLoader stockPriceFileLoader;

	private String stockPriceFeedLocation;

	private TransactionTemplate transactionTemplate;

	private ResourceLoader resourceLoader = new DefaultResourceLoader(Thread.currentThread().getContextClassLoader());

	public String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml" };
	}

	public void onSetUp() throws Exception {

		Log4jConfigTestPlugin.configure();

		super.onSetUp();

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

		StockPriceFileDAO dao = new StockPriceFileDAO();
		dao.setSessionFactory((SessionFactory) getApplicationContext().getBean("ofaSessionFactory"));

		stockPriceFileLoader.setStockPriceFileReader(readStockPriceFile);
		stockPriceFileLoader.setStockPriceFileDAO(dao);
		stockPriceFileLoader.setFeedBatchSize(500);
		stockPriceFileLoader.setTransactionTemplate(transactionTemplate);

		long startTime = System.currentTimeMillis();
		stockPriceFileLoader.execute(null);
		long endTime = System.currentTimeMillis();

		logger.debug("time taken for read and persist stock price feed from mimb is [" + (endTime - startTime)
				+ "] ms.");

	}
}

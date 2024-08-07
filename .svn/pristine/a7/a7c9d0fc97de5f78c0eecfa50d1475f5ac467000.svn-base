package com.integrosys.cms.batch.mimb.collateral;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.hibernate.SessionFactory;
import org.springframework.batch.item.file.FlatFileItemReader;
import org.springframework.batch.item.file.transform.DelimitedLineTokenizer;
import org.springframework.batch.item.file.transform.PrefixMatchingCompositeLineTokenizer;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.test.AbstractTransactionalSpringContextTests;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.test.PropertyFlatFileLoader;
import com.integrosys.cms.batch.common.ReturnNullLineTokenizer;

public class MarketableSecAndCashLoaderIntegrationTest extends AbstractTransactionalSpringContextTests {

	private String marketableFeedLocation;

	private String cashFeedLocation;

	private ResourceLoader resourceLoader = new DefaultResourceLoader(Thread.currentThread().getContextClassLoader());

	private TransactionTemplate transactionTemplate;

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();

		Properties props = PropertyFlatFileLoader.loadFromClassPath("batch.properties");

		marketableFeedLocation = props.getProperty("resource.mimb.col.marketsec.feed.path");
		cashFeedLocation = props.getProperty("resource.mimb.col.cash.feed.path");
		transactionTemplate = new TransactionTemplate((PlatformTransactionManager) getApplicationContext().getBean(
				"txManager"));
	}

	public String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml" };
	}

	public void testCollateralMarketableDoWork() {
		CollateralMarketableFieldSetMapperImpl marketableFieldSetMapper = new CollateralMarketableFieldSetMapperImpl();
		CollateralMarketableFileLoader marketableFileLoader = new CollateralMarketableFileLoader();

		Resource marketableSecRes = resourceLoader.getResource(marketableFeedLocation);

		FlatFileItemReader readCollateralFile = new FlatFileItemReader();
		readCollateralFile.setFieldSetMapper(marketableFieldSetMapper);
		readCollateralFile.setResource(marketableSecRes);
		readCollateralFile.setFirstLineIsHeader(true);

		Map tokenizerMap = new HashMap();
		tokenizerMap.put("D", new DelimitedLineTokenizer());
		tokenizerMap.put("T", new ReturnNullLineTokenizer());

		PrefixMatchingCompositeLineTokenizer tokenizer = new PrefixMatchingCompositeLineTokenizer();
		tokenizer.setTokenizers(tokenizerMap);

		readCollateralFile.setLineTokenizer(tokenizer);

		CollateralFileDAO dao = new CollateralFileDAO();
		dao.setSessionFactory((SessionFactory) getApplicationContext().getBean("ofaSessionFactory"));

		marketableFileLoader.setCollateralMarketableFileReader(readCollateralFile);
		marketableFileLoader.setCollateralFileDAO(dao);
		marketableFileLoader.setTransactionTemplate(transactionTemplate);
		marketableFileLoader.setFeedBatchSize(1000);

		long startTime = System.currentTimeMillis();
		marketableFileLoader.execute(null);
		long endTime = System.currentTimeMillis();

		logger.debug("time taken for read and persist marketable sec feed from mimb is [" + (endTime - startTime)
				+ "] ms.");
	}

	public void testCollateralCashDoWork() {
		CollateralCashFieldSetMapperImpl cashFieldSetMapper = new CollateralCashFieldSetMapperImpl();
		CollateralCashFileLoader casheFileLoader = new CollateralCashFileLoader();

		Resource cashFeedRes = resourceLoader.getResource(cashFeedLocation);

		FlatFileItemReader readCollateralFile = new FlatFileItemReader();
		readCollateralFile.setFieldSetMapper(cashFieldSetMapper);
		readCollateralFile.setResource(cashFeedRes);
		readCollateralFile.setFirstLineIsHeader(true);

		Map tokenizerMap = new HashMap();
		tokenizerMap.put("D", new DelimitedLineTokenizer());
		tokenizerMap.put("T", new ReturnNullLineTokenizer());

		PrefixMatchingCompositeLineTokenizer tokenizer = new PrefixMatchingCompositeLineTokenizer();
		tokenizer.setTokenizers(tokenizerMap);

		readCollateralFile.setLineTokenizer(tokenizer);

		CollateralFileDAO dao = new CollateralFileDAO();
		dao.setSessionFactory((SessionFactory) getApplicationContext().getBean("ofaSessionFactory"));

		casheFileLoader.setCollateralCashFileReader(readCollateralFile);
		casheFileLoader.setCollateralFileDAO(dao);
		casheFileLoader.setTransactionTemplate(transactionTemplate);
		casheFileLoader.setFeedBatchSize(1000);

		long startTime = System.currentTimeMillis();
		casheFileLoader.execute(null);
		long endTime = System.currentTimeMillis();

		logger.debug("time taken for read and persist marketable sec feed from mimb is [" + (endTime - startTime)
				+ "] ms.");
	}
}

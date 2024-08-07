package com.integrosys.cms.batch.mimb.collateral;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collection;
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

public class CollateralMarketableAndCashFileLoaderTest extends TestCase {

	private String marketableFeedLocation;

	private String cashFeedLocation;

	private TransactionTemplate transactionTemplate;

	private ResourceLoader resourceLoader = new DefaultResourceLoader(Thread.currentThread().getContextClassLoader());

	public void setUp() {
		Log4jConfigTestPlugin.configure();

		Properties props = PropertyFlatFileLoader.loadFromClassPath("batch.properties");

		marketableFeedLocation = props.getProperty("resource.mimb.col.marketsec.feed.path");
		cashFeedLocation = props.getProperty("resource.mimb.col.cash.feed.path");
		transactionTemplate = new TransactionTemplate(new MockBatchSpringTransactionManager());
	}

	public void testCollateralMarketableDoWork() {
		CollateralMarketableFieldSetMapperImpl marketableFieldSetMapper = new CollateralMarketableFieldSetMapperImpl();
		CollateralMarketableFileLoader marketableFileLoader = new CollateralMarketableFileLoader();

		Resource marketSecFeedRes = resourceLoader.getResource(marketableFeedLocation);

		FlatFileItemReader readCollateralFile = new FlatFileItemReader();
		readCollateralFile.setFieldSetMapper(marketableFieldSetMapper);
		readCollateralFile.setResource(marketSecFeedRes);
		readCollateralFile.setFirstLineIsHeader(true);

		Map tokenizerMap = new HashMap();
		tokenizerMap.put("D", new DelimitedLineTokenizer());
		tokenizerMap.put("T", new ReturnNullLineTokenizer());

		PrefixMatchingCompositeLineTokenizer tokenizer = new PrefixMatchingCompositeLineTokenizer();
		tokenizer.setTokenizers(tokenizerMap);

		readCollateralFile.setLineTokenizer(tokenizer);

		final List marketableItemList = new ArrayList();

		ICollateralFileDAO mockCollateralFileDao = (ICollateralFileDAO) Proxy.newProxyInstance(ICollateralFileDAO.class
				.getClassLoader(), new Class[] { ICollateralFileDAO.class }, new InvocationHandler() {

			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				if (method.getName().equals("createCollateralMarketableItems")) {
					marketableItemList.addAll((Collection) args[0]);
				}
				return null;
			}
		});

		marketableFileLoader.setCollateralMarketableFileReader(readCollateralFile);
		marketableFileLoader.setCollateralFileDAO(mockCollateralFileDao);
		marketableFileLoader.setTransactionTemplate(transactionTemplate);
		marketableFileLoader.setFeedBatchSize(500);

		marketableFileLoader.execute(null);

		assertTrue(marketableItemList.size() > 0);
		assertTrue(marketableItemList.get(0) instanceof ICollateralMarketable);
	}

	public void testCollateralCashDoWork() {
		CollateralCashFieldSetMapperImpl cashFieldSetMapper = new CollateralCashFieldSetMapperImpl();
		CollateralCashFileLoader cashFileLoader = new CollateralCashFileLoader();

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

		final List cashItemList = new ArrayList();

		ICollateralFileDAO mockCollateralFileDao = (ICollateralFileDAO) Proxy.newProxyInstance(ICollateralFileDAO.class
				.getClassLoader(), new Class[] { ICollateralFileDAO.class }, new InvocationHandler() {

			public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
				if (method.getName().equals("createCollateralCashItems")) {
					cashItemList.addAll((Collection) args[0]);
				}
				return null;
			}
		});

		cashFileLoader.setCollateralCashFileReader(readCollateralFile);
		cashFileLoader.setCollateralFileDAO(mockCollateralFileDao);
		cashFileLoader.setTransactionTemplate(transactionTemplate);
		cashFileLoader.setFeedBatchSize(500);

		cashFileLoader.execute(null);

		assertTrue(cashItemList.size() > 0);
		assertTrue(cashItemList.get(0) instanceof ICash);
	}

}

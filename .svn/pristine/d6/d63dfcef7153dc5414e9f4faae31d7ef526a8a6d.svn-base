package com.integrosys.cms.batch.common;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import junit.framework.TestCase;
import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

import org.easymock.MockControl;
import org.springframework.batch.item.ExecutionContext;
import org.springframework.batch.item.file.FlatFileParseException;
import org.springframework.batch.item.file.ResourceAwareItemReaderItemStream;
import org.springframework.transaction.support.TransactionTemplate;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.batch.MockBatchSpringTransactionManager;

public class AbstractBatchFeedLoaderTest extends TestCase {

	private AbstractBatchFeedLoader loader;

	private MockControl itemStreamReaderControl;

	private List feedStorage;

	private int chunkPersistentCount = 0;

	public void setUp() throws Exception {

		Log4jConfigTestPlugin.configure();

		itemStreamReaderControl = MockControl.createControl(ResourceAwareItemReaderItemStream.class);
		ResourceAwareItemReaderItemStream mockResourceAwareItemReaderItemStream = (ResourceAwareItemReaderItemStream) itemStreamReaderControl
				.getMock();
		mockResourceAwareItemReaderItemStream.open(new ExecutionContext());
		itemStreamReaderControl.setVoidCallable();
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setReturnValue(new Object());
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setReturnValue(new Object());
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setReturnValue(new Object());
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setReturnValue(new Object());
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setReturnValue(null);
		mockResourceAwareItemReaderItemStream.close(new ExecutionContext());
		itemStreamReaderControl.setVoidCallable();

		feedStorage = new ArrayList();

		Enhancer enhancer = new Enhancer();
		enhancer.setSuperclass(AbstractBatchFeedLoader.class);
		enhancer.setCallback(new BatchFeedLoaderInterceptor(mockResourceAwareItemReaderItemStream, feedStorage));

		loader = (AbstractBatchFeedLoader) enhancer.create();

		chunkPersistentCount = 0;

	}

	public void testAbstractBatchFeedLoaderUsingCglib() {
		itemStreamReaderControl.replay();

		loader.setFeedBatchSize(500);
		loader.setTransactionTemplate(new TransactionTemplate(new MockBatchSpringTransactionManager()));
		loader.doReadFeeds(null);

		assertEquals(4, feedStorage.size());
		assertEquals(1, chunkPersistentCount);

		itemStreamReaderControl.verify();
	}

	public void testAbstractBatchFeedLoaderUsingCglibWithChunkOne() {
		itemStreamReaderControl.replay();

		loader.setFeedBatchSize(1);
		loader.setTransactionTemplate(new TransactionTemplate(new MockBatchSpringTransactionManager()));
		loader.doReadFeeds(null);

		assertEquals(4, feedStorage.size());
		assertEquals(4, chunkPersistentCount);

		itemStreamReaderControl.verify();
	}

	public void testAbstractBatchFeedLoaderWithParsingError() throws Exception {
		List batchErrorList = new ArrayList();

		FlatFileParseException ex1 = new FlatFileParseException("failed to parse '1234' to date object",
				new ParseException("for '1234", 0), "hello,world,1234", 30);

		FlatFileParseException ex2 = new FlatFileParseException("'1234' exceed required record length (3)",
				new ParseException("for '1234", 0), "hello,dante,1234", 32);

		MockControl itemStreamReaderControl = MockControl.createControl(ResourceAwareItemReaderItemStream.class);
		ResourceAwareItemReaderItemStream mockResourceAwareItemReaderItemStream = (ResourceAwareItemReaderItemStream) itemStreamReaderControl
				.getMock();
		mockResourceAwareItemReaderItemStream.open(new ExecutionContext());
		itemStreamReaderControl.setVoidCallable();
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setReturnValue(new Object() {
			public String toString() {
				return "ITEM1";
			}
		});
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setThrowable(ex1);
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setThrowable(ex2);
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setReturnValue(new Object() {
			public String toString() {
				return "ITEM2";
			}
		});
		mockResourceAwareItemReaderItemStream.read();
		itemStreamReaderControl.setReturnValue(null);
		mockResourceAwareItemReaderItemStream.close(new ExecutionContext());
		itemStreamReaderControl.setVoidCallable();
		itemStreamReaderControl.replay();

		BatchFeedErrorLogger errorLogger = (BatchFeedErrorLogger) Proxy.newProxyInstance(BatchFeedErrorLogger.class
				.getClassLoader(), new Class[] { BatchFeedErrorLogger.class },
				new BatchErrorListHolderInvocationHandler(batchErrorList));

		Enhancer enhancer = new Enhancer();
		enhancer.setSuperclass(AbstractBatchFeedLoader.class);
		enhancer.setCallback(new BatchFeedLoaderInterceptor(mockResourceAwareItemReaderItemStream, feedStorage));

		AbstractBatchFeedLoader loader = (AbstractBatchFeedLoader) enhancer.create();

		loader.setFeedBatchSize(1);
		loader.setTransactionTemplate(new TransactionTemplate(new MockBatchSpringTransactionManager()));
		loader.setBatchFeedErrorLogger(errorLogger);
		loader.doReadFeeds(null);

		itemStreamReaderControl.verify();

		assertEquals(2, batchErrorList.size());

		Iterator itr = feedStorage.iterator();
		Object o1 = itr.next();
		assertEquals("ITEM1", o1.toString());
		Object o2 = itr.next();
		assertEquals("ITEM2", o2.toString());
	}

	private class BatchErrorListHolderInvocationHandler implements InvocationHandler {
		List batchErrorList;

		public BatchErrorListHolderInvocationHandler(List batchErrorList) {
			this.batchErrorList = batchErrorList;
		}

		public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
			if (method.getName().equals("log") && args[0] instanceof Collection) {
				batchErrorList.addAll((Collection) args[0]);
				return null;
			}

			if (method.getName().equals("log") && args[0] instanceof BatchFeedError) {
				batchErrorList.add((BatchFeedError) args[0]);
				return null;
			}

			return null;
		}

	}

	private class BatchFeedLoaderInterceptor implements MethodInterceptor {
		private ResourceAwareItemReaderItemStream readerTarget;

		private List feedList;

		public BatchFeedLoaderInterceptor(ResourceAwareItemReaderItemStream readerTarget, List listTarget) {
			this.readerTarget = readerTarget;
			this.feedList = listTarget;
		}

		public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy) throws Throwable {
			if (method.getName().equals("getFlatFileItemReader")) {
				return readerTarget;
			}

			if (method.getName().equals("doPersistFeedList")) {
				List feedList = (List) args[0];
				chunkPersistentCount++;
				this.feedList.addAll(feedList);
				return null;
			}

			return proxy.invokeSuper(obj, args);
		}

	}
}

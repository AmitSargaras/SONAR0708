package com.integrosys.cms.batch.factory;

import java.util.ArrayList;
import java.util.List;

import junit.framework.TestCase;

import org.apache.commons.lang.StringUtils;
import org.easymock.MockControl;
import org.springframework.beans.factory.support.BeanDefinitionBuilder;
import org.springframework.beans.propertyeditors.StringArrayPropertyEditor;
import org.springframework.context.support.GenericApplicationContext;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

/**
 * @author Chong Jun Yong
 * 
 */
public class BatchJobLauncherImplTest extends TestCase {
	MockControl batchJodDaoControl;

	BatchJobDao mockBatchJobDao;

	public void setUp() {
		batchJodDaoControl = MockControl.createControl(BatchJobDao.class);
		mockBatchJobDao = (BatchJobDao) batchJodDaoControl.getMock();
		mockBatchJobDao.createBatchJobStatus(new OBBatchJobStatus());
		batchJodDaoControl.setDefaultReturnValue(new OBBatchJobStatus());
		mockBatchJobDao.updateBatchJobStatus(new OBBatchJobStatus());
		batchJodDaoControl.setDefaultReturnValue(new OBBatchJobStatus());

		Log4jConfigTestPlugin.configure();
	}

	public void testScheculeSuccessfulBatchJob() {
		List successList = new ArrayList();

		GenericApplicationContext appContext = new GenericApplicationContext();
		BeanDefinitionBuilder builder = BeanDefinitionBuilder.rootBeanDefinition(SuccessBatchJob.class)
				.addPropertyValue("successList", successList);
		appContext.registerBeanDefinition("success", builder.getBeanDefinition());
		appContext.refresh();

		StringArrayPropertyEditor editor = new StringArrayPropertyEditor();
		editor.setAsText("country=MY,filename=helloworld.csv");

		batchJodDaoControl.replay();

		BatchJobLauncherImpl impl = new BatchJobLauncherImpl();
		impl.setApplicationContext(appContext);
		impl.setBatchJobDao(mockBatchJobDao);

		impl.launch("success", (String[]) editor.getValue());

		assertTrue(successList.size() == 2);
		for (int i = 0; i < successList.size(); i++) {
			String keyValuePair = (String) successList.get(i);
			if (keyValuePair.startsWith("country")) {
				assertEquals("country=MY", keyValuePair);
				continue;
			}
			else if (keyValuePair.startsWith("filename")) {
				assertEquals("filename=helloworld.csv", keyValuePair);
				continue;
			}
			fail("unidentified key value pair [" + keyValuePair + "]");
		}

		batchJodDaoControl.verify();
	}

	public void testScheculeSuccessfulBatchJobUsingMockImpl() {
		MockBatchJobDao batchJobDao = new MockBatchJobDao();

		List successList = new ArrayList();

		GenericApplicationContext appContext = new GenericApplicationContext();
		BeanDefinitionBuilder builder = BeanDefinitionBuilder.rootBeanDefinition(SuccessBatchJob.class)
				.addPropertyValue("successList", successList);
		appContext.registerBeanDefinition("success", builder.getBeanDefinition());
		appContext.refresh();

		StringArrayPropertyEditor editor = new StringArrayPropertyEditor();
		editor.setAsText("country=MY,filename=helloworld.csv");

		BatchJobLauncherImpl impl = new BatchJobLauncherImpl();
		impl.setApplicationContext(appContext);
		impl.setBatchJobDao(batchJobDao);

		impl.launch("success", (String[]) editor.getValue());

		assertTrue(successList.size() == 2);
		for (int i = 0; i < successList.size(); i++) {
			String keyValuePair = (String) successList.get(i);
			if (keyValuePair.startsWith("country")) {
				assertEquals("country=MY", keyValuePair);
				continue;
			}
			else if (keyValuePair.startsWith("filename")) {
				assertEquals("filename=helloworld.csv", keyValuePair);
				continue;
			}
			fail("unidentified key value pair [" + keyValuePair + "]");
		}

		OBBatchJobStatus status = batchJobDao.retrieveBatchJobStatus(new Long(1));
		assertEquals("SUCCESS", status.getStatus());
	}

	public void testScheculeFailBatchJob() {
		List successList = new ArrayList();

		GenericApplicationContext appContext = new GenericApplicationContext();
		BeanDefinitionBuilder builder = BeanDefinitionBuilder.rootBeanDefinition(FailBatchJob.class).addPropertyValue(
				"successList", successList);
		appContext.registerBeanDefinition("fail", builder.getBeanDefinition());
		appContext.refresh();

		StringArrayPropertyEditor editor = new StringArrayPropertyEditor();
		editor.setAsText("country=MY, filename=helloworld.csv");

		batchJodDaoControl.replay();

		BatchJobLauncherImpl impl = new BatchJobLauncherImpl();
		impl.setApplicationContext(appContext);
		impl.setBatchJobDao(mockBatchJobDao);

		impl.launch("fail", (String[]) editor.getValue());

		assertTrue(successList.isEmpty());

		batchJodDaoControl.verify();
	}

	public void testScheculeFailBatchJobUsingMockImpl() {
		MockBatchJobDao batchJobDao = new MockBatchJobDao();

		List successList = new ArrayList();

		StringArrayPropertyEditor editor = new StringArrayPropertyEditor();
		editor.setAsText("country=MY, filename=helloworld.csv");

		BatchJobLauncherImpl impl = new BatchJobLauncherImpl();
		impl.setBatchJobDao(batchJobDao);

		impl.launch(new FailBatchJob(), (String[]) editor.getValue());

		assertTrue(successList.isEmpty());

		OBBatchJobStatus status = batchJobDao.retrieveBatchJobStatus(new Long(1));
		assertEquals("FAILED", status.getStatus());
		assertTrue(StringUtils.containsAny(status.getMessage(),
				"failed to schedule batch job, missing parameters 'country'"));
	}

}

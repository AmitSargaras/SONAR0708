package com.integrosys.cms.batch.factory;

import java.util.Date;

import org.springframework.test.AbstractTransactionalSpringContextTests;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

public class BatchJobDaoImplIntegrationTest extends AbstractTransactionalSpringContextTests {
	public void onSetUp() {
		Log4jConfigTestPlugin.configure();
	}

	public String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml", "classpath:batch/AppContext_DaoJdbc.xml" };
	}

	public void testCreateBatchJobStatusOB() {
		OBBatchJobStatus status = new OBBatchJobStatus();
		status.setJobName("valuationBatchJob");
		status.setClassName("com.integrosys.cms.valuation.ValuationMain");
		status.setStartDate(new Date());
		status.setEndDate(new Date());
		status.setMessage("Failed to start valuation batch job due to missing parameters; sec-subtype");
		status.setStatus("FAILED");

		BatchJobDao batchJobDao = (BatchJobDao) getApplicationContext().getBean("batchJobDao");
		status = batchJobDao.createBatchJobStatus(status);
		assertNotNull(status.getBatchId());
	}
}
package com.integrosys.cms.batch.factory;

import java.util.Date;

import org.apache.commons.lang.time.DateUtils;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class HibernateBatchJobStatusTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "BatchJob.hbm.xml" };
	}

	public void testBatchJobStatusFlow() {
		Date todayDate = new Date();

		OBBatchJobStatus status = new OBBatchJobStatus();
		status.setJobName("recurrentBatchJob");
		status.setClassName("com.abc.RecurrentJob");
		status.setStartDate(todayDate);
		status.setParameters("country=MY");
		status.setStatus("RUNNING");

		Long key = (Long) getHibernateTemplate().save(status);

		Date endDate = DateUtils.addHours(todayDate, 1);
		status = (OBBatchJobStatus) getHibernateTemplate().load(OBBatchJobStatus.class, key);
		status.setEndDate(endDate);
		status.setStatus("SUCCESS");

		getHibernateTemplate().update(status);

		status = (OBBatchJobStatus) getHibernateTemplate().load(OBBatchJobStatus.class, key);
		assertEquals("SUCCESS", status.getStatus());
		assertEquals(endDate, status.getEndDate());
	}
}

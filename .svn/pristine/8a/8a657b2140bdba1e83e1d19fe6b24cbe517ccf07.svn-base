package com.integrosys.cms.batch.factory;

import java.util.List;
import java.util.Map;

import com.integrosys.cms.batch.BatchJobException;
import com.integrosys.cms.batch.InvalidParameterBatchJobException;

public class FailBatchJob implements BatchJob {

	private List successList;

	public FailBatchJob() {
	}

	public void setSuccessList(List successList) {
		this.successList = successList;
	}

	public void execute(Map context) throws BatchJobException {
		throw new InvalidParameterBatchJobException("failed to schedule batch job, missing parameters 'country'");
	}
}

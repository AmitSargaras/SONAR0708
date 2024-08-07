package com.integrosys.cms.batch.factory;

import java.util.HashMap;
import java.util.Map;

public class MockBatchJobDao implements BatchJobDao {

	private Map idBackedPersistentStorage = new HashMap();

	public OBBatchJobStatus createBatchJobStatus(OBBatchJobStatus status) {
		Long key = new Long(idBackedPersistentStorage.size() + 1);
		idBackedPersistentStorage.put(key, status);
		status.setBatchId(key);

		return status;
	}

	public OBBatchJobStatus retrieveBatchJobStatus(Long key) {
		return (OBBatchJobStatus) idBackedPersistentStorage.get(key);
	}

	public OBBatchJobStatus updateBatchJobStatus(OBBatchJobStatus status) {
		idBackedPersistentStorage.put(status.getBatchId(), status);
		return retrieveBatchJobStatus(status.getBatchId());
	}

}

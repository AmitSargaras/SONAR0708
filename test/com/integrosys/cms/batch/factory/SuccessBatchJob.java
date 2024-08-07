package com.integrosys.cms.batch.factory;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.integrosys.cms.batch.BatchJobException;

public class SuccessBatchJob implements BatchJob {

	private List successList;

	public SuccessBatchJob() {
	}

	public void setSuccessList(List successList) {
		this.successList = successList;
	}

	public void execute(Map context) throws BatchJobException {
		Set entrySet = context.entrySet();
		for (Iterator itr = entrySet.iterator(); itr.hasNext();) {
			Map.Entry entry = (Map.Entry) itr.next();
			successList.add(entry.getKey() + "=" + entry.getValue());
		}
	}
}

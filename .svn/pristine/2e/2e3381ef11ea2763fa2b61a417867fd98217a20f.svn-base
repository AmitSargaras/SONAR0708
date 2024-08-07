package com.integrosys.base.techinfra.dbsupport;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Mock sequencer
 * 
 * @author Chong Jun Yong
 *
 */
public class MockSequencer implements ISequencer {
	private Map seqNameIdMap = Collections.synchronizedMap(new HashMap());
	
	public String getSeqNum(String sequenceName) {
		Long nextSeq = (Long) seqNameIdMap.get(sequenceName);
		
		if (nextSeq == null) {
			long id = 1;
			seqNameIdMap.put(sequenceName, new Long(id));
			
			return String.valueOf(id);
		}

		long id = nextSeq.longValue();
		id++;

		seqNameIdMap.put(sequenceName, new Long(id));

		return String.valueOf(id);
	}
}
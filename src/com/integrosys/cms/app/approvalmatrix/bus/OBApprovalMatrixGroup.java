/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/feed/bus/bond/OBBondFeedGroup.java,v 1.2 2003/08/06 08:10:08 btchng Exp $
 */
package com.integrosys.cms.app.approvalmatrix.bus;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * 
 * @author $Author: btchng $
 * @version $Revision: 1.2 $
 * @since $Date: 2003/08/06 08:10:08 $ Tag: $Name: $
 * 
 */
public class OBApprovalMatrixGroup implements IApprovalMatrixGroup {

	private Set feedEntriesSet;

	private String _type;

	private String _subType;

	private String _stockType;

	private long _approvalMatrixGroupID;

	private long _versionTime = 0;

	private IApprovalMatrixEntry[] feedEntries;

	public long getApprovalMatrixGroupID() {
		return this._approvalMatrixGroupID;
	}

	public IApprovalMatrixEntry[] getFeedEntries() {
		return feedEntries;
	}

	public Set getFeedEntriesSet() {
		return feedEntriesSet;
	}

	public String getStockType() {
		return _stockType;
	}

	public String getSubType() {
		return this._subType;
	}

	public String getType() {
		return this._type;
	}

	public long getVersionTime() {
		return this._versionTime;
	}

	public void setApprovalMatrixGroupID(long param) {
		this._approvalMatrixGroupID = param;
	}

	public void setFeedEntries(IApprovalMatrixEntry[] param) {
		feedEntries = param;
		
		this.feedEntriesSet = (param == null) ? new HashSet(0) : new HashSet(Arrays.asList(param));
/*		this.feedEntriesSet = new HashSet(0);
		if (param != null) {
			for (int i=0; i<param.length; i++) {
				this.feedEntriesSet.add(param[i].);
			}
		}*/
	}

	public void setFeedEntriesSet(Set feedEntriesSet) {
		this.feedEntriesSet = feedEntriesSet;

		this.feedEntries = (feedEntriesSet == null) ? null : (IApprovalMatrixEntry[]) feedEntriesSet
				.toArray(new IApprovalMatrixEntry[0]);
	}

	public void setStockType(String stockType) {
		this._stockType = stockType;
	}

	public void setSubType(String param) {
		this._subType = param;
	}

	public void setType(String param) {
		this._type = param;
	}

	public void setVersionTime(long versionTime) {
		this._versionTime = versionTime;
	}
}

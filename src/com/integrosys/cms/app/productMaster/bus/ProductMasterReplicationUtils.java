package com.integrosys.cms.app.productMaster.bus;

import com.integrosys.base.techinfra.util.ReplicateUtils;

public abstract class ProductMasterReplicationUtils {

	/**
	 * <p>
	 * Replicate ExcludedFacility which is ready to create a entity into
	 * persistent storage. Normally to create a staging copy will use this.
	 *
	 * <p>
	 * <b>note</b> must know which field(s) need to be filtered when doing
	 * replication
	 *
	 */
	public static IProductMaster replicateProductMasterForCreateStagingCopy(IProductMaster productMaster) {

		IProductMaster replicatedIdx = (IProductMaster) ReplicateUtils.replicateObject(productMaster,
				new String[] { "id"});

        return replicatedIdx;
	}
}

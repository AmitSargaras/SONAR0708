package com.integrosys.cms.batch.sibs.creditapplication;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.batch.common.AbstractFeedLoaderBatchJobTestCase;

public class CreditAppFileLoaderContextTest extends AbstractFeedLoaderBatchJobTestCase {

	public OverdraftAndTermLoanFeedsLoader creditAppFileLoader;

	protected String[] getConfigLocations() {
		String[] locations = new String[] { "classpath:AppContext_Services.xml",
				"classpath:AppContext_TrxDataSource_Test.xml", "classpath:batch/sibs/AppContext_Master.xml" };
		return locations;
	}

	protected void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();
		super.onSetUp();
	}

	public void testCreditAppFileProcess() {
		creditAppFileLoader = (OverdraftAndTermLoanFeedsLoader) getApplicationContext().getBean(
				"sibsOverdrafAndTermLoanFeedsLoaderBatchJob");
		creditAppFileLoader.execute(null);
	}

}

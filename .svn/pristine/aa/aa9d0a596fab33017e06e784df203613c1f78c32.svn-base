package com.integrosys.cms.batch.sibs.customer;

/**
 *
 * who: gek phuang
 * Date: 18th Sep 2008
 * Time: 2100hr
 *
 */

import org.springframework.test.AbstractSingleSpringContextTests;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

public class CustomerFileLoaderContextTest extends AbstractSingleSpringContextTests {

	public CustomerUpdateFeedsLoader customerFileLoader;

	protected String[] getConfigLocations() {
		String[] locations = new String[] { "classpath:AppContext_TrxDataSource_Test.xml",
				"classpath:batch/sibs/AppContext_Master.xml", "classpath:AppContext_Services.xml" };
		return locations;

	}

	protected void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();
		super.onSetUp();
	}

	public void testGetFileLoader() {
		try {

			// *** for customer feed files reading and persist to db
			customerFileLoader = (CustomerUpdateFeedsLoader) getApplicationContext().getBean("sibsCustomerFileLoaderBatchJob");
			customerFileLoader.execute(null);
		}
		catch (Exception e) {
			DefaultLogger.error(this, e);
		}
	}

}

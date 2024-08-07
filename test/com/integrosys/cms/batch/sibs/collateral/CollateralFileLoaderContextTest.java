/**
 *
 */
package com.integrosys.cms.batch.sibs.collateral;

import org.springframework.test.AbstractSingleSpringContextTests;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

/**
 * @author User
 * @Date : 03 oct08 0125hr
 * 
 */
public class CollateralFileLoaderContextTest extends AbstractSingleSpringContextTests {

	public FixedDepositFeedsLoader collFileLoader;

	protected String[] getConfigLocations() {
		String[] locations = new String[] { "classpath:AppContext_Services.xml",
				"classpath:AppContext_TrxDataSource_Test.xml", "classpath:batch/sibs/AppContext_Master.xml" };
		return locations;
	}

	protected void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();
		super.onSetUp();
	}

	public void testCollateralFileProcess() {
		try {

			// *** for collateral feed files reading and persist to db
			collFileLoader = (FixedDepositFeedsLoader) getApplicationContext().getBean("sibsCollateralFileLoaderBatchJob");
			// collFileLoader.doCollateralFDSave();
			// System.out.println("\n done save FD");
			// collFileLoader.doCollateralSMFSave();
			// System.out.println("\n done save SMF");
			collFileLoader.execute(null);
		}
		catch (Exception e) {
			DefaultLogger.error(this, e);
		}
	}
}

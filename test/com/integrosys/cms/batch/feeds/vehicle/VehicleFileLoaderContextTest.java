/**
 * 
 */
package com.integrosys.cms.batch.feeds.vehicle;

import org.springframework.test.AbstractSingleSpringContextTests;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;

/**
 * @author User
 * @Date : 06 oct08 1220hr
 * 
 */
public class VehicleFileLoaderContextTest extends AbstractSingleSpringContextTests {

	public VehicleFeedsLoader vehFileLoader;

	protected String[] getConfigLocations() {
		String[] locations = new String[] { "classpath:AppContext_Services.xml","classpath:AppContext_TrxDataSource_Test.xml",
				"classpath:batch/vehicle/AppContext_Master.xml" };
		return locations;
	}

	protected void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();
		super.onSetUp();
	}

	public void testVehicleFileProcess() {
		try {

			// *** for hire&purchase vehicle feed files reading and persist to
			// db
			vehFileLoader = (VehicleFeedsLoader) getApplicationContext().getBean("vehicleFeedLoaderBatchJob");
			System.out.println("\n beofre start of vehicle process ---");
			vehFileLoader.execute(null);
			//System.out.println("\n AFTER  vehicle process ---");
		}
		catch (Exception e) {
			DefaultLogger.error(this, e);
		}
	}
}

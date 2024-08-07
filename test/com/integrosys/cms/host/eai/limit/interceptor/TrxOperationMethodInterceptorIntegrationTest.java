package com.integrosys.cms.host.eai.limit.interceptor;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.collateral.bus.ICollateral;
import com.integrosys.cms.app.collateral.bus.OBCollateral;
import com.integrosys.cms.app.limit.bus.ICollateralAllocation;
import com.integrosys.cms.app.limit.bus.ILimit;
import com.integrosys.cms.app.limit.bus.ILimitProfile;
import com.integrosys.cms.app.limit.bus.LimitDAO;
import com.integrosys.cms.app.limit.bus.OBCollateralAllocation;
import com.integrosys.cms.app.limit.bus.OBLimit;
import com.integrosys.cms.app.limit.bus.OBLimitProfile;

public class TrxOperationMethodInterceptorIntegrationTest extends AbstractTransactionalDataSourceSpringContextTests {
	private LimitDAO limitJdbcDao;

	protected String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	protected void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();
		super.onSetUp();

		limitJdbcDao = new LimitDAO();
		limitJdbcDao.setJdbcTemplate(getJdbcTemplate());
	}

	public void testFetchFacilitylStpStatusQueryAllComplete() {
		endTransaction();
		startNewTransaction();

		TrxOperationMethodInterceptor interceptor = new TrxOperationMethodInterceptor();
		interceptor.setLimitJdbcDao(limitJdbcDao);

		ILimit limit1 = new OBLimit();
		limit1.setLimitID(20081215000111000l);

		ILimit limit2 = new OBLimit();
		limit2.setLimitID(20081215000111222l);

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimits(new ILimit[] { limit1, limit2 });

		insertAllFacilityCompleteTestCase();

		assertTrue(interceptor.requiredResponse(limitProfile));
	}

	public void testFetchFacilityAndCollateralStpStatusQueryAllComplete() {
		endTransaction();
		startNewTransaction();

		TrxOperationMethodInterceptor interceptor = new TrxOperationMethodInterceptor();
		interceptor.setLimitJdbcDao(limitJdbcDao);

		ILimit limit1 = new OBLimit();
		limit1.setLimitID(20081215000111000l);

		ICollateral col1 = new OBCollateral();
		col1.setCollateralID(20081216999000111l);

		ICollateralAllocation secMap1 = new OBCollateralAllocation();
		secMap1.setCollateral(col1);

		limit1.setCollateralAllocations(new ICollateralAllocation[] { secMap1 });

		ILimit limit2 = new OBLimit();
		limit2.setLimitID(20081215000111222l);

		ICollateral col2 = new OBCollateral();
		col2.setCollateralID(20081216999000111l);

		ICollateralAllocation secMap2 = new OBCollateralAllocation();
		secMap2.setCollateral(col2);

		limit1.setCollateralAllocations(new ICollateralAllocation[] { secMap2 });

		ILimitProfile limitProfile = new OBLimitProfile();
		limitProfile.setLimits(new ILimit[] { limit1, limit2 });

		insertAllFacilityCompleteTestCase();
		insertAllCollateralCompleteTestCase();

		assertTrue(interceptor.requiredResponse(limitProfile));
	}

	private void insertAllCollateralCompleteTestCase() {
		getJdbcTemplate().update(
				"insert into stp_master_trans (master_trx_id, reference_id, transaction_type, status) "
						+ "values (?, ?, ?, ?) ",
				new Object[] { new Long(20081216111999555l), new Long(20081216999000111l), "COL", "COMPLETE" });

		getJdbcTemplate().update(
				"insert into stp_master_trans (master_trx_id, reference_id, transaction_type, status) "
						+ "values (?, ?, ?, ?) ",
				new Object[] { new Long(20081216111999333l), new Long(20081216888000111l), "COL", "COMPLETE" });
	}

	private void insertAllFacilityCompleteTestCase() {
		getJdbcTemplate().update(
				"insert into transaction (transaction_id, reference_id, transaction_type) values (?, ?, ?) ",
				new Object[] { "20081216111222333", new Long(20081216222333444l), "FACILITY" });

		getJdbcTemplate().update(
				"insert into transaction (transaction_id, reference_id, transaction_type) values (?, ?, ?) ",
				new Object[] { "20081216111222444", new Long(20081216222333555l), "FACILITY" });

		getJdbcTemplate().update("insert into cms_facility_master (id, cms_lsp_appr_lmts_id) values (?, ?) ",
				new Object[] { new Long(20081216222333444l), new Long(20081215000111000l) });

		getJdbcTemplate().update("insert into cms_facility_master (id, cms_lsp_appr_lmts_id) values (?, ?) ",
				new Object[] { new Long(20081216222333555l), new Long(20081215000111222l) });

		getJdbcTemplate().update(
				"insert into stp_master_trans (master_trx_id, transaction_id, status) values (?, ?, ?) ",
				new Object[] { new Long(20081216111999999l), "20081216111222333", "COMPLETE" });

		getJdbcTemplate().update(
				"insert into stp_master_trans (master_trx_id, transaction_id, status) values (?, ?, ?) ",
				new Object[] { new Long(20081216111999666l), "20081216111222444", "COMPLETE" });
	}
}

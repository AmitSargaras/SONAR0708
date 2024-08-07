package com.integrosys.cms.app.sharesecurity.bus;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.common.constant.ICMSConstant;

/**
 * @author Chong Jun Yong
 * 
 */
public class ShareSecurityDAOIntegrationTest extends AbstractTransactionalDataSourceSpringContextTests {
	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();
	}

	public String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	public void testRetrieveOneSecurityNameAndId() {
		ShareSecurityDAO shareSecurityDao = new ShareSecurityDAO();
		shareSecurityDao.setJdbcTemplate(getJdbcTemplate());

		getJdbcTemplate().update(
				"insert into cms_security_source (cms_security_source_id, source_security_id, source_id, "
						+ " cms_collateral_id, status) values (?, ?, ?, ?, ?) ",
				new Object[] { new Long(20081107222999444l), "CMS-100-2000", "CMS", new Long(20081107222333444l),
						"ACTIVE" });

		List result = shareSecurityDao.getSharedSecNameForCollateral(new Long(20081107222333444l));
		assertNotNull(result);
		assertTrue(result.size() == 1);
		String sharedSecName = (String) result.get(0);
		assertTrue(sharedSecName.indexOf("CMS-100-2000") >= 0);
	}

	public void testRetrieveTwoSecurityNameAndId() {
		ShareSecurityDAO shareSecurityDao = new ShareSecurityDAO();
		shareSecurityDao.setJdbcTemplate(getJdbcTemplate());

		getJdbcTemplate().update(
				"insert into cms_security_source (cms_security_source_id, source_security_id, source_id, "
						+ " cms_collateral_id, status) values (?, ?, ?, ?, ?) ",
				new Object[] { new Long(20081107222999444l), "CMS-100-2000", "CMS", new Long(20081107222333444l),
						"ACTIVE" });

		getJdbcTemplate().update(
				"insert into cms_security_source (cms_security_source_id, source_security_id, source_id, "
						+ " cms_collateral_id, status) values (?, ?, ?, ?, ?) ",
				new Object[] { new Long(20081107222999445l), "MIMB-ABC-9988", "MIMB", new Long(20081107222333444l),
						"ACTIVE" });

		List result = shareSecurityDao.getSharedSecNameForCollateral(new Long(20081107222333444l));
		assertNotNull(result);
		assertTrue(result.size() == 2);
	}

	public void testRetrieveSecurityNameAndIdUsingListOfCollateralId() {
		ShareSecurityDAO shareSecurityDao = new ShareSecurityDAO();
		shareSecurityDao.setJdbcTemplate(getJdbcTemplate());

		getJdbcTemplate().update(
				"insert into cms_security_source (cms_security_source_id, source_security_id, source_id, "
						+ " cms_collateral_id, status) values (?, ?, ?, ?, ?) ",
				new Object[] { new Long(20081107222999444l), "CMS-100-2000", "CMS", new Long(20081107222333444l),
						"ACTIVE" });

		getJdbcTemplate().update(
				"insert into cms_security_source (cms_security_source_id, source_security_id, source_id, "
						+ " cms_collateral_id, status) values (?, ?, ?, ?, ?) ",
				new Object[] { new Long(20081107222999445l), "MIMB-ABC-9988", "CMS", new Long(20081107222333445l),
						"ACTIVE" });

		List collateralIdList = new ArrayList();
		collateralIdList.add(new Long(20081107222333444l));
		collateralIdList.add(new Long(20081107222333445l));

		Map result = shareSecurityDao.getSharedSecNameForCollaterals(collateralIdList);
		assertNotNull(result);
		assertTrue(result.size() == 2);

		List shareSecNameList = (List) result.get("20081107222333444");
		String sharedSecName = (String) shareSecNameList.get(0);
		assertTrue(sharedSecName.indexOf("CMS-100-2000") >= 0);

		shareSecNameList = (List) result.get("20081107222333445");
		sharedSecName = (String) shareSecNameList.get(0);
		assertTrue(sharedSecName.indexOf("MIMB-ABC-9988") >= 0);
	}

	public void testCreateShareSecurity() {
		ShareSecurityDAO shareSecurityDao = new ShareSecurityDAO();
		shareSecurityDao.setJdbcTemplate(getJdbcTemplate());
		shareSecurityDao.setSequenceFormatter(new DateSequencerFormatter());

		IShareSecurity shareSec = new OBShareSecurity();
		shareSec.setCmsCollateralId(20081107222333444l);
		shareSec.setSourceSecurityId("20081107222333444");
		shareSec.setStatus(ICMSConstant.STATE_ACTIVE);
		shareSec.setSourceId(ICMSConstant.SOURCE_SYSTEM_CMS);
		shareSec.setLastUpdatedTime(new Date());

		shareSecurityDao.createSharedSecurity(shareSec);

		List result = shareSecurityDao.getSharedSecNameForCollateral(new Long(20081107222333444l));
		assertNotNull(result);
		assertTrue(result.size() == 1);
		String sharedSecName = (String) result.get(0);
		assertTrue(sharedSecName.indexOf("20081107222333444") >= 0);
	}
}

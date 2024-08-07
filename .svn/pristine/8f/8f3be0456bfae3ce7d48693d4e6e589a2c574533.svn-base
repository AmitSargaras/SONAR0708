package com.integrosys.cms.app.checklist.bus;

import java.util.HashMap;

import javax.sql.DataSource;

import org.springframework.test.AbstractTransactionalSpringContextTests;

import com.integrosys.base.techinfra.dbsupport.DataSourceProxy;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.test.MockContextTestPlugin;

public class CheckListDAOIntegrationTest extends AbstractTransactionalSpringContextTests {
	CheckListDAO dao;

	protected String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml" };
	}

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();

		DataSource targeDataSource = (DataSource) getApplicationContext().getBean("ofaPool");
		DataSourceProxy proxy = new DataSourceProxy(targeDataSource);

		MockContextTestPlugin.init();
		MockContextTestPlugin.bind("java:comp/env/jdbc/CMSPool", proxy.getProxy());
	}

	public void testGetCollateralCheckListStatus() {
		dao = new CheckListDAO();
		HashMap map = dao.getCollateralCheckListStatus(20080918111222333l);
		assertNotNull(map);
		assertTrue(map.isEmpty());
	}
}

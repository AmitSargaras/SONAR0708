package com.integrosys.base.techinfra.dbsupport;

import javax.sql.DataSource;

import org.easymock.MockControl;
import org.springframework.jdbc.core.JdbcTemplate;

import com.integrosys.base.techinfra.test.MockContextTestCase;

/**
 * @author Chong Jun Yong
 * 
 */
public class JdbcTemplateAdapterTest extends MockContextTestCase {
	MockControl dataSourceControl;

	DataSource mockDataSource;

	protected void onSetUp() {
		dataSourceControl = MockControl.createControl(DataSource.class);
		mockDataSource = (DataSource) dataSourceControl.getMock();

		bind("java:comp/env/jdbc/CMSPool", mockDataSource);
	}

	public void testGetJdbcTemplate() {
		dataSourceControl.replay();

		class MockJdbcTemplateAdapter extends JdbcTemplateAdapter {
		}

		MockJdbcTemplateAdapter adapter = new MockJdbcTemplateAdapter();
		JdbcTemplate jdbcTemplate = adapter.getJdbcTemplate();
		assertEquals(mockDataSource, jdbcTemplate.getDataSource());

		dataSourceControl.verify();
	}
}

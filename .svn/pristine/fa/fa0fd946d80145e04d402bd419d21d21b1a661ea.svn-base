package com.integrosys.base.techinfra.dbsupport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.sql.DataSource;

import org.apache.commons.lang.Validate;
import org.easymock.MockControl;

/**
 * <p>
 * Test Case plugin for JDBC framework, mainly used by {@link DBUtil}, which
 * getting data source using jndi name <code>java:comp/env/jdbc/CMSPool</code>.
 * Strictly speaking any Data Source getting via the mentioned jndi name, and is
 * in the test case routine, can consider use this plugin.
 * 
 * <p>
 * Test Case who using this plugin should also extends
 * {@link com.integrosys.base.techinfra.test.MockContextTestCase}, which provide
 * mock context to bind the data source object used by {@link DBUtil} and
 * {@link JdbcTemplateAdapter}
 * 
 * @author Chong Jun Yong
 * @since 1.2
 */
public class MockDataSourceTestPlugin {

	MockControl dataSourceControl;

	MockControl connectionControl;

	MockControl statementControl;

	MockControl resultSetControl;

	ResultSet mockResultSet;

	PreparedStatement mockStatement;

	Connection mockConnection;

	DataSource mockDataSource;

	private Context mockContext;

	public MockDataSourceTestPlugin(Context context) {
		Validate.notNull(context);
		this.mockContext = context;

		setup();
	}

	protected void setup() {
		try {
			resultSetControl = MockControl.createControl(ResultSet.class);
			mockResultSet = (ResultSet) resultSetControl.getMock();

			statementControl = MockControl.createControl(PreparedStatement.class);
			mockStatement = (PreparedStatement) statementControl.getMock();

			connectionControl = MockControl.createControl(Connection.class);
			mockConnection = (Connection) connectionControl.getMock();
			mockConnection.setAutoCommit(true);
			connectionControl.setDefaultVoidCallable();
			mockConnection.prepareStatement("default sql");
			connectionControl.setDefaultReturnValue(mockStatement);

			dataSourceControl = MockControl.createControl(DataSource.class);
			mockDataSource = (DataSource) dataSourceControl.getMock();
			mockDataSource.getConnection();
			dataSourceControl.setDefaultReturnValue(mockConnection);

			mockContext.rebind("java:comp/env/jdbc/CMSPool", mockDataSource);
		}
		catch (Throwable t) {
			IllegalStateException ise = new IllegalStateException(
					"error encountered when setting up mock jdbc environment");
			ise.initCause(t);
			throw ise;
		}
	}

	public Context getMockContext() {
		return mockContext;
	}

	public void setMockContext(Context mockContext) {
		this.mockContext = mockContext;
	}

	/**
	 * Reply/Records all mock control objects.
	 */
	public void replay() {
		connectionControl.replay();
		dataSourceControl.replay();
		statementControl.replay();
		resultSetControl.replay();
	}

	public void verify() {
		connectionControl.verify();
		dataSourceControl.verify();
		statementControl.verify();
		resultSetControl.verify();
	}

	public MockControl getDataSourceControl() {
		return dataSourceControl;
	}

	public void setDataSourceControl(MockControl dataSourceControl) {
		this.dataSourceControl = dataSourceControl;
	}

	public MockControl getConnectionControl() {
		return connectionControl;
	}

	public void setConnectionControl(MockControl connectionControl) {
		this.connectionControl = connectionControl;
	}

	public MockControl getStatementControl() {
		return statementControl;
	}

	public void setStatementControl(MockControl statementControl) {
		this.statementControl = statementControl;
	}

	public MockControl getResultSetControl() {
		return resultSetControl;
	}

	public void setResultSetControl(MockControl resultSetControl) {
		this.resultSetControl = resultSetControl;
	}

	public ResultSet getMockResultSet() {
		return mockResultSet;
	}

	public void setMockResultSet(ResultSet mockResultSet) {
		this.mockResultSet = mockResultSet;
	}

	public PreparedStatement getMockStatement() {
		return mockStatement;
	}

	public void setMockStatement(PreparedStatement mockStatement) {
		this.mockStatement = mockStatement;
	}

	public Connection getMockConnection() {
		return mockConnection;
	}

	public void setMockConnection(Connection mockConnection) {
		this.mockConnection = mockConnection;
	}

	public DataSource getMockDataSource() {
		return mockDataSource;
	}

	public void setMockDataSource(DataSource mockDataSource) {
		this.mockDataSource = mockDataSource;
	}

}

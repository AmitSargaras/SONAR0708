package com.integrosys.component.commondata.app;

import javax.sql.DataSource;

import org.hsqldb.jdbcDriver;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

import com.integrosys.base.techinfra.test.MockContextTestPlugin;
import com.integrosys.component.commondata.app.bus.SBCommonDataManager;
import com.integrosys.component.commondata.app.bus.SBCommonDataManagerBean;
import com.integrosys.component.commondata.app.bus.SBCommonDataManagerHome;
import com.integrosys.component.commondata.app.proxy.SBCommonDataProxy;
import com.integrosys.component.commondata.app.proxy.SBCommonDataProxyBean;
import com.integrosys.component.commondata.app.proxy.SBCommonDataProxyHome;

/**
 * <p>
 * Test plugin class to be used conjunction with the usage of
 * <tt>CommonDataSingleton</tt>.
 * <p>
 * CommonDataSingleton is using
 * {@link com.integrosys.component.commondata.app.bus.CommonDataDAO} to search
 * through all the active common codes, which required a datasource getting from
 * Context bound with resource reference name
 * <tt>java:comp/env/jdbc/CMSPool</tt>.
 * <p>
 * In order to do unit test to codes which using <tt>CommonDataSingleton</tt>,
 * several EJBs used by <tt>CommonDataSingleton</tt> need to be deployed into
 * mock container, mainly those in bus and proxy subpackage. And also <b>just
 * before</b> testing the codes, several contract provided here
 * {@link #addCategoryCode(String, String)} and
 * {@link #addEntryCode(String, String, String)} must be used to insert common
 * codes into the mock database (HSQLDB).
 * <p>
 * All EJBs, DataSource are deployed into Mock Context or Container provided by
 * <tt>MockContextTestPlugin</tt>.
 * <p>
 * Example of usage for this test plugin class:
 * 
 * <pre>
 * CommonDataSingletonTestPlugin commonCodes = new CommonDataSingletonTestPlugin();
 * commonCodes.addCategoryCode(&quot;APPROVED_BY&quot;, &quot;Approved By&quot;);
 * commonCodes.addEntryCode(&quot;INT&quot;, &quot;Integro&quot;, &quot;APPROVED_BY&quot;);
 * </pre>
 * @author Chong Jun Yong
 * @see MockContextTestPlugin
 */
public class CommonDataSingletonTestPlugin {

	private final JdbcTemplate jdbcTemplate;

	/**
	 * Default constructor for this test plugin class, binding mock data source
	 * (HSQLDB) into context with name <tt>java:comp/env/jdbc/CMSPool</tt>
	 */
	public CommonDataSingletonTestPlugin() {
		this("java:comp/env/jdbc/CMSPool",
				new SimpleDriverDataSource(new jdbcDriver(), "jdbc:hsqldb:mem:cms", "sa", ""));
	}

	/**
	 * Constructor for this test plugin class, which to provide the JNDI name to
	 * bind the mock data source given into the context.
	 * @param dataSourceJndiName data source jndi name, normally the resource
	 *        reference name.
	 * @param dataSource the data source to be bound to the mock context with
	 *        the jndi name given
	 */
	public CommonDataSingletonTestPlugin(String dataSourceJndiName, DataSource dataSource) {
		MockContextTestPlugin.init();
		MockContextTestPlugin.deploy("SBCommonDataProxyHome", SBCommonDataProxyHome.class, SBCommonDataProxy.class,
				SBCommonDataProxyBean.class);
		MockContextTestPlugin.deploy("SBCommonDataManagerHome", SBCommonDataManagerHome.class,
				SBCommonDataManager.class, SBCommonDataManagerBean.class);

		MockContextTestPlugin.bind(dataSourceJndiName, dataSource);

		jdbcTemplate = new JdbcTemplate(dataSource);

		try {
			jdbcTemplate.execute("drop table COMMON_CODE_CATEGORY");
			jdbcTemplate.execute("drop table COMMON_CODE_CATEGORY_ENTRY");
			jdbcTemplate.execute("drop table STAGE_BUS_PARAM_GRP");
			jdbcTemplate.execute("drop sequence COMMON_CODE_CATEGORY_SEQ");
			jdbcTemplate.execute("drop sequence COMMON_CODE_ENTRY_SEQ ");
		}
		catch (DataAccessException ex) {
			// suppress
		}

		jdbcTemplate.execute("create table STAGE_BUS_PARAM_GRP (GROUP_CODE varchar(1), GROUP_NAME varchar(1))");

		StringBuffer buf = new StringBuffer("CREATE TABLE COMMON_CODE_CATEGORY ( ");
		buf.append("CATEGORY_ID      	BIGINT NOT NULL, ");
		buf.append("CATEGORY_CODE    	VARCHAR(40) NOT NULL, ");
		buf.append("CATEGORY_NAME    	VARCHAR(255), ");
		buf.append("CATEGORY_TYPE    	DECIMAL(1,0), ");
		buf.append("ACTIVE_STATUS    	CHARACTER(1), ");
		buf.append("VERSION_TIME     	BIGINT, ");
		buf.append("STATUS           	CHARACTER(1), ");
		buf.append("REF_CATEGORY_CODE	VARCHAR(40) )");

		jdbcTemplate.execute(buf.toString());

		buf = new StringBuffer("CREATE TABLE COMMON_CODE_CATEGORY_ENTRY (");
		buf.append("ENTRY_ID        	BIGINT NOT NULL, ");
		buf.append("ENTRY_CODE      	VARCHAR(40) NOT NULL, ");
		buf.append("ENTRY_NAME      	VARCHAR(255), ");
		buf.append("ACTIVE_STATUS   	CHARACTER(1), ");
		buf.append("CATEGORY_CODE   	VARCHAR(40), ");
		buf.append("CATEGORY_CODE_ID	BIGINT, ");
		buf.append("ENTRY_SOURCE    	VARCHAR(40), ");
		buf.append("COUNTRY         	VARCHAR(3), ");
		buf.append("GROUP_ID        	BIGINT, ");
		buf.append("REF_ENTRY_CODE  	VARCHAR(100), ");
		buf.append("VERSION_TIME    	BIGINT, ");
		buf.append("STATUS          	VARCHAR(15))");

		jdbcTemplate.execute(buf.toString());

		jdbcTemplate.execute("CREATE SEQUENCE COMMON_CODE_CATEGORY_SEQ");

		jdbcTemplate.execute("CREATE SEQUENCE COMMON_CODE_ENTRY_SEQ");
	}

	/**
	 * To add a new category code into the mock database. By default, category
	 * inserted will be active.
	 * @param categoryCode category code
	 * @param categoryName category name
	 * @throws IllegalStateException if for give category code is already found
	 *         in the mock database
	 */
	public void addCategoryCode(String categoryCode, String categoryName) {
		int count = jdbcTemplate.queryForInt("SELECT count(*) FROM COMMON_CODE_CATEGORY where category_code = ?",
				new Object[] { categoryCode });
		if (count > 0) {
			throw new IllegalStateException("There is already a category code [" + categoryCode + "] in the system.");
		}

		jdbcTemplate.update("insert into COMMON_CODE_CATEGORY values "
				+ "(NEXT VALUE FOR COMMON_CODE_CATEGORY_SEQ, ?, ?, 1, '1', 1, 1, null)", new Object[] { categoryCode,
				categoryName });
	}

	/**
	 * To add a new entry code into the mock database, By default, entry
	 * inserted will be active.
	 * @param entryCode entry code
	 * @param entryName entry name
	 * @param categoryCode category code of the entry
	 * @throws IllegalStateException if there is no such category code provided
	 *         is found in the mock database
	 */
	public void addEntryCode(String entryCode, String entryName, String categoryCode) throws IllegalStateException {
		int row = jdbcTemplate.update("insert into COMMON_CODE_CATEGORY_ENTRY ("
				+ "SELECT NEXT VALUE FOR COMMON_CODE_ENTRY_SEQ, ?, ?, 1, ?, CATEGORY_ID, "
				+ "null, null, 1, null, 1, 'ACTIVE' FROM COMMON_CODE_CATEGORY WHERE category_code = ?)", new Object[] {
				entryCode, entryName, categoryCode, categoryCode });

		if (row == 0) {
			throw new IllegalStateException("There is no such category code [" + categoryCode + "] in the system.");
		}
	}
}

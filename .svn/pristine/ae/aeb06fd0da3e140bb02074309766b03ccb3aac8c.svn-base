package com.integrosys.cms.batch.sibs.parameter;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.hsqldb.jdbcDriver;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

import junit.framework.TestCase;

public class AbstractSingleParameterLoaderTest extends TestCase {
	JdbcTemplate internalJdbc;

	JdbcTemplate externalJdbc;

	public void setUp() throws Exception {

		SimpleDriverDataSource ds = new SimpleDriverDataSource();
		ds.setDriverClass(jdbcDriver.class);
		ds.setUrl("jdbc:hsqldb:mem:cms");
		ds.setUsername("sa");
		ds.setPassword("");

		externalJdbc = new JdbcTemplate(ds);
		externalJdbc.execute("CREATE TABLE ABC (ID BIGINT, CODE VARCHAR(40), POINTS INTEGER)");
		externalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(1, 'MANUTD', 80)");
		externalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(2, 'CHELSEA', 70)");
		externalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(3, 'ARSENAL', 70)");
		externalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(4, 'LIVERPOOL', 69)");
		externalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(5, 'ASTON', 59)");
		externalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(6, 'MANC', 40)");

		SimpleDriverDataSource internalDs = new SimpleDriverDataSource();
		internalDs.setDriverClass(jdbcDriver.class);
		internalDs.setUrl("jdbc:hsqldb:mem:los");
		internalDs.setUsername("sa");
		internalDs.setPassword("");

		internalJdbc = new JdbcTemplate(internalDs);
		internalJdbc.execute("CREATE TABLE ABC (ID BIGINT, CODE VARCHAR(40), POINTS INTEGER)");
		internalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(1, 'MANUTD', 75)");
		internalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(2, 'CHELSEA', 55)");
		internalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(3, 'ARSENAL', 55)");
		internalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(4, 'LIVERPOOL', 40)");
		internalJdbc.update("INSERT INTO ABC (ID, CODE, POINTS) VALUES(5, 'ASTON', 40)");
	}

	public void testTheTestCase() {
		class ConcreteLoader extends AbstractSingleParameterLoader {

			protected String getCmsInquiryQuery() {
				return "SELECT ID, CODE, POINTS FROM ABC WHERE ID = ?";
			}

			protected String getCmsInsertQuery() {
				return "INSERT INTO ABC (CODE, POINTS, ID) VALUES (?, ?, ?)";
			}

			protected String getCmsUpdateQuery() {
				return "UPDATE ABC SET CODE = ?, POINTS = ? WHERE ID = ?";
			}

            protected String getCmsUpdateQueryForDeletion() {
				return "UPDATE ABC SET CODE = ?, POINTS = ? WHERE ID = ?";
			}

            protected String getExternalInquiryQuery() {
				return "SELECT ID, CODE, POINTS FROM ABC";
			}

			protected Object[] getInsertValuesFromExternal(ResultSet externalResultSet) throws SQLException {
				return new Object[] { externalResultSet.getString("CODE"),
						new Integer(externalResultSet.getInt("POINTS")), new Long(externalResultSet.getLong("ID")) };
			}

			protected Object[] getKeysValueBetweenDifferentSources(ResultSet externalResultSet) throws SQLException {
				return new Object[] { new Long(externalResultSet.getLong("ID")) };
			}

			protected Object[] getUpdateValuesFromExternal(ResultSet externalResultSet) throws SQLException {
				return new Object[] { externalResultSet.getString("CODE"),
						new Integer(externalResultSet.getInt("POINTS")), new Long(externalResultSet.getLong("ID")) };
			}

            protected boolean getDependencyParamFlag() {
                return false;
            }
        }

		SingleParameterLoader loader = new ConcreteLoader();
		loader.setCmsJdbcTemplate(internalJdbc);
		loader.setExternalJdbcTemplate(externalJdbc);
		loader.run();

		internalJdbc.query("SELECT ID, CODE, POINTS FROM ABC", new ResultSetExtractor() {

			public Object extractData(ResultSet rs) throws SQLException, DataAccessException {
				while (rs.next()) {
					long id = rs.getLong("ID");
					System.out.println("id = [" + id + "]");
					if (id == 1) {
						assertEquals("MANUTD", rs.getString("CODE"));
						assertEquals(80, rs.getInt("POINTS"));
					}
					else if (id == 2) {
						assertEquals("CHELSEA", rs.getString("CODE"));
						assertEquals(70, rs.getInt("POINTS"));
					}
					else if (id == 3) {
						assertEquals("ARSENAL", rs.getString("CODE"));
						assertEquals(70, rs.getInt("POINTS"));
					}
					else if (id == 4) {
						assertEquals("LIVERPOOL", rs.getString("CODE"));
						assertEquals(69, rs.getInt("POINTS"));
					}
					else if (id == 5) {
						assertEquals("ASTON", rs.getString("CODE"));
						assertEquals(59, rs.getInt("POINTS"));
					}
					else if (id == 6) {
						assertEquals("MANC", rs.getString("CODE"));
						assertEquals(40, rs.getInt("POINTS"));
					}
				}

				return null;
			}
		});
	}
}

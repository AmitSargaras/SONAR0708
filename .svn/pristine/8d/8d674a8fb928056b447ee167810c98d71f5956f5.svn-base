package com.integrosys.base.techinfra.orm;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import junit.framework.TestCase;

import org.apache.commons.lang.time.DateFormatUtils;
import org.easymock.MockControl;
import org.hibernate.dialect.DB2Dialect;
import org.hibernate.dialect.Dialect;
import org.hibernate.engine.SessionImplementor;
import org.hibernate.jdbc.Batcher;
import org.hibernate.type.LongType;
import org.hibernate.type.Type;

/**
 * Test Case for {@link DateAppendedSequenceGenerator}
 * 
 * @author Chong Jun Yong
 * 
 */
public class DateAppendedSequenceGeneratorTest extends TestCase {

	MockControl HibernateSessionMockControl;

	MockControl HibernateBatcherMockControl;

	MockControl PreparedStatementMockControl;

	MockControl ResultSetMockControl;

	public void testConfigureUsingDateSequencerFormatter() {
		Properties params = new Properties();
		params.put("sequence", "SEQ_LIMIT_PROFILE");
		params.put("formatter", "com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter");

		DateAppendedSequenceGenerator generator = new DateAppendedSequenceGenerator();

		Type type = new LongType();
		Dialect dialect = new DB2Dialect();

		generator.configure(type, params, dialect);

	}

	public void testGenerateUsingMock() throws Exception {
		Properties params = new Properties();
		params.put("sequence", "LIMIT_PROFILE_SEQ");

		DateAppendedSequenceGenerator generator = new DateAppendedSequenceGenerator();

		Type type = new LongType();
		Dialect dialect = new DB2Dialect();
		generator.configure(type, params, dialect);

		String sql = dialect.getSequenceNextValString("LIMIT_PROFILE_SEQ");

		ResultSetMockControl = MockControl.createControl(ResultSet.class);
		ResultSet rs = (ResultSet) ResultSetMockControl.getMock();
		rs.getLong(1);
		ResultSetMockControl.setReturnValue(1l);
		rs.close();
		ResultSetMockControl.setVoidCallable();
		rs.next();
		ResultSetMockControl.setDefaultReturnValue(true);
		ResultSetMockControl.replay();

		PreparedStatementMockControl = MockControl.createControl(PreparedStatement.class);
		PreparedStatement ps = (PreparedStatement) PreparedStatementMockControl.getMock();
		ps.executeQuery();
		PreparedStatementMockControl.setReturnValue(rs);
		PreparedStatementMockControl.replay();

		HibernateBatcherMockControl = MockControl.createControl(Batcher.class);
		Batcher batcher = (Batcher) HibernateBatcherMockControl.getMock();
		batcher.prepareSelectStatement(sql);
		HibernateBatcherMockControl.setReturnValue(ps);
		batcher.closeStatement(ps);
		HibernateBatcherMockControl.setVoidCallable();
		HibernateBatcherMockControl.replay();

		HibernateSessionMockControl = MockControl.createControl(SessionImplementor.class);
		SessionImplementor session = (SessionImplementor) HibernateSessionMockControl.getMock();
		session.getBatcher();
		HibernateSessionMockControl.setDefaultReturnValue(batcher);
		HibernateSessionMockControl.replay();

		Long result = (Long) generator.generate(session, null);

		String todayDate = DateFormatUtils.format(new Date(), "yyyyMMdd");

		String expectedResult = todayDate + "000000001";

		assertEquals(new Long(expectedResult), result);

		HibernateSessionMockControl.verify();
		HibernateBatcherMockControl.verify();
		PreparedStatementMockControl.verify();
		ResultSetMockControl.verify();
	}

	public void testGenerateStringTypeIdUsingMock() throws Exception {
		Properties params = new Properties();
		params.put("sequence", "TRX_SEQ");
		params.put("type", "java.lang.String");

		DateAppendedSequenceGenerator generator = new DateAppendedSequenceGenerator();

		Type type = new LongType();
		Dialect dialect = new DB2Dialect();
		generator.configure(type, params, dialect);

		String sql = dialect.getSequenceNextValString("TRX_SEQ");

		ResultSetMockControl = MockControl.createControl(ResultSet.class);
		ResultSet rs = (ResultSet) ResultSetMockControl.getMock();
		rs.getLong(1);
		ResultSetMockControl.setReturnValue(1l);
		rs.close();
		ResultSetMockControl.setVoidCallable();
		rs.next();
		ResultSetMockControl.setDefaultReturnValue(true);
		ResultSetMockControl.replay();

		PreparedStatementMockControl = MockControl.createControl(PreparedStatement.class);
		PreparedStatement ps = (PreparedStatement) PreparedStatementMockControl.getMock();
		ps.executeQuery();
		PreparedStatementMockControl.setReturnValue(rs);
		PreparedStatementMockControl.replay();

		HibernateBatcherMockControl = MockControl.createControl(Batcher.class);
		Batcher batcher = (Batcher) HibernateBatcherMockControl.getMock();
		batcher.prepareSelectStatement(sql);
		HibernateBatcherMockControl.setReturnValue(ps);
		batcher.closeStatement(ps);
		HibernateBatcherMockControl.setVoidCallable();
		HibernateBatcherMockControl.replay();

		HibernateSessionMockControl = MockControl.createControl(SessionImplementor.class);
		SessionImplementor session = (SessionImplementor) HibernateSessionMockControl.getMock();
		session.getBatcher();
		HibernateSessionMockControl.setDefaultReturnValue(batcher);
		HibernateSessionMockControl.replay();

		String result = (String) generator.generate(session, null);

		String todayDate = DateFormatUtils.format(new Date(), "yyyyMMdd");

		String expectedResult = todayDate + "000000001";

		assertEquals(expectedResult, result);

		HibernateSessionMockControl.verify();
		HibernateBatcherMockControl.verify();
		PreparedStatementMockControl.verify();
		ResultSetMockControl.verify();
	}

}

package com.integrosys.cms.app.eventmonitor.marketindex;

import java.util.Date;

import javax.sql.DataSource;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.AbstractTransactionalSpringContextTests;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.app.eventmonitor.IMonitorDAOResult;

/**
 * @author Chong Jun Yong
 * 
 */
public class MarketIndexDAOIntegrationTest extends AbstractTransactionalSpringContextTests {

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();
	}

	public String[] getConfigLocations() {
		return new String[] { "/AppContext_TrxDataSource_Test.xml" };
	}

	public void testNonEmptyResultSet() {
		DataSource ofaDataSource = (DataSource) getApplicationContext().getBean("ofaPool");

		Date todayDate = new Date();

		JdbcTemplate jdbc = new JdbcTemplate(ofaDataSource);

		jdbc.update("insert into cms_stage_feed_group (feed_group_id, group_type) values (?, ?)", new Object[] {
				new Long(20081103888222334l), "STOCK_INDEX" });

		jdbc.update("insert into cms_stage_price_feed "
				+ " (feed_id, feed_group_id, isin_code, unit_price, last_updated_date, feed_ref) "
				+ " values (?, ?, ?, ?, ?, ?)", new Object[] { new Long(20081103111222334l),
				new Long(20081103888222334l), "INT123", new Double(23.31d), DateUtils.addDays(todayDate, -3),
				new Long(20081103111222334l) });

		jdbc.update("insert into cms_stage_price_feed "
				+ " (feed_id, feed_group_id, isin_code, unit_price, last_updated_date, feed_ref) "
				+ " values (?, ?, ?, ?, ?, ?)", new Object[] { new Long(20081103111222335l),
				new Long(20081103888222335l), "INT123", new Double(25.01d), DateUtils.addDays(todayDate, -2),
				new Long(20081103111222335l) });

		MarketIndexDAO marketIndexDao = new MarketIndexDAO();
		marketIndexDao.setDataSource(ofaDataSource);

		IMonitorDAOResult daoResult = marketIndexDao.getInitialSet(null);
		assertTrue(daoResult.hasNextElement());
	}
}

package com.integrosys.cms.batch.feeds.stock;

import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class HibernateFeedStockTest extends CustomHibernateTestCase {

	private HibernateTemplate hibernateTemplate;

	private JdbcTemplate jdbcTemplate;

	public void setUp() {
		super.setUp();

		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}

	protected String[] getMappingResources() {
		return new String[] { "Batch-Feed-Stock.hbm.xml" };
	}

	public void testStockPrice() {
		Date todayDate = new Date();

		IStockPrice stockPrice = new OBStockPrice();
		stockPrice.setCounterName("aa");
		stockPrice.setExchangeCode("ss");
		stockPrice.setExpiryDate(todayDate);
		stockPrice.setIsinCode("ff");
		stockPrice.setListedSharesQuantity(100);
		stockPrice.setPaidUpCapital(Double.valueOf("200"));
		stockPrice.setParValue(Double.valueOf("300"));
		stockPrice.setRecordType("g");
		stockPrice.setShareStatus("l");
		stockPrice.setStockCode("kk");
		stockPrice.setStockExcSusCouIndicator("ww");
		stockPrice.setStockExcTraBoardCode("er");
		stockPrice.setStockExcTraBoardDes("pp");
		stockPrice.setStockTypes("qw");
		stockPrice.setUnitPrice(Double.valueOf("400"));
		stockPrice.setUnitPriceCurrency("oo");

		Long id = (Long) hibernateTemplate.save("actualOBStockPrice", stockPrice);
		assertNotNull(id);

		int count = jdbcTemplate.queryForInt("select count(*) from SI_TEMP_MIMB_PF002");
		assertEquals(1, count);

		OBStockPrice storedcustomerInfo = (OBStockPrice) hibernateTemplate.get("actualOBStockPrice", id);

		assertEquals("aa", storedcustomerInfo.getCounterName());
		assertEquals("ss", storedcustomerInfo.getExchangeCode());
		assertEquals(todayDate, storedcustomerInfo.getExpiryDate());
		assertEquals("ff", storedcustomerInfo.getIsinCode());
		assertEquals(100, storedcustomerInfo.getListedSharesQuantity());
		assertEquals(Double.valueOf("200"), storedcustomerInfo.getPaidUpCapital());
		assertEquals(Double.valueOf("300"), storedcustomerInfo.getParValue());
		assertEquals("g", storedcustomerInfo.getRecordType());
		assertEquals("l", storedcustomerInfo.getShareStatus());
		assertEquals("kk", storedcustomerInfo.getStockCode());
		assertEquals("ww", storedcustomerInfo.getStockExcSusCouIndicator());
		assertEquals("er", storedcustomerInfo.getStockExcTraBoardCode());
		assertEquals("pp", storedcustomerInfo.getStockExcTraBoardDes());
		assertEquals("qw", storedcustomerInfo.getStockTypes());
		assertEquals(Double.valueOf("400"), storedcustomerInfo.getUnitPrice());
		assertEquals("oo", storedcustomerInfo.getUnitPriceCurrency());

	}

}

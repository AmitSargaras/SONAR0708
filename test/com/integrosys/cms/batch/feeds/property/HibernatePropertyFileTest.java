package com.integrosys.cms.batch.feeds.property;

import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.businfra.currency.Amount;
import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.app.collateral.bus.IValuation;
import com.integrosys.cms.app.collateral.bus.OBValuation;

public class HibernatePropertyFileTest extends CustomHibernateTestCase{
	
	private HibernateTemplate hibernateTemplate;
	private JdbcTemplate jdbcTemplate;
	
	public void setUp() {
		super.setUp();
		
		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}
	
	protected String[] getMappingResources() {
		return new String[] { "valuation.hbm.xml" };
	}
	
	
	public  void testProperty(){
		String aa = "aa";
		Date todayDate = new Date();
		IValuation valuationItem = new OBValuation();
		
		valuationItem.setValuerName("xx");
		valuationItem.setCMV(new Amount(100, aa));
		valuationItem.setFSV(new Amount(200, aa));
		valuationItem.setReservePrice(new Amount(300, aa));
		valuationItem.setCollateralID(1);
		
		valuationItem.setValuationDate(todayDate);
		valuationItem.setUpdateDate(todayDate);
		valuationItem.setCurrencyCode("aa");
		valuationItem.setBeforeMarginValue(new Amount(120,aa));
		valuationItem.setRevaluationFreq(22);
		valuationItem.setRevaluationFreqUnit("we");
		valuationItem.setNonRevaluationFreq(33);
		valuationItem.setNonRevaluationFreqUnit("non");
		valuationItem.setComments("comments");
		valuationItem.setEvaluationDateFSV(todayDate);
		valuationItem.setValuationType("type");
		valuationItem.setReservePriceDate(todayDate);
		valuationItem.setSourceType("type2");
		valuationItem.setSourceId("sourceId");

		valuationItem.setRemainusefullife(Double.valueOf("32"));
		valuationItem.setValuationbasis("dd");
		valuationItem.setOlv(new Amount(55,aa));
		
		Long id = (Long) hibernateTemplate.save("actualValuation",valuationItem);
		assertNotNull(id);
		
		int count = jdbcTemplate.queryForInt("select count(*) from CMS_VALUATION");
		assertEquals(1, count);
		
		IValuation storedvaluationItem = (OBValuation) hibernateTemplate.get("actualValuation", id);
		Amount amount1 = new Amount(300,aa);
		Amount amount2 = new Amount(200,aa);
		Amount amount3 = new Amount(100,aa);
		
		assertEquals(1,storedvaluationItem.getCollateralID());
		assertEquals("xx", storedvaluationItem.getValuerName());
		assertEquals(amount1, storedvaluationItem.getReservePrice());
		assertEquals(amount2, storedvaluationItem.getFSV());
		assertEquals(amount3, storedvaluationItem.getCMV());
		
		assertEquals(todayDate, storedvaluationItem.getValuationDate());
		assertEquals(todayDate, storedvaluationItem.getUpdateDate());
		assertEquals("aa", storedvaluationItem.getCurrencyCode());
		assertEquals(new Amount(120,aa), storedvaluationItem.getBeforeMarginValue());
		assertEquals(22, storedvaluationItem.getRevaluationFreq());
		assertEquals("we", storedvaluationItem.getRevaluationFreqUnit());
		assertEquals(33, storedvaluationItem.getNonRevaluationFreq());
		assertEquals("non", storedvaluationItem.getNonRevaluationFreqUnit());
		assertEquals("comments", storedvaluationItem.getComments());
		assertEquals(todayDate, storedvaluationItem.getEvaluationDateFSV());
		assertEquals("type", storedvaluationItem.getValuationType());
		assertEquals(todayDate, storedvaluationItem.getReservePriceDate());
		assertEquals("type2", storedvaluationItem.getSourceType());
		assertEquals("sourceId", storedvaluationItem.getSourceId());
		assertEquals(Double.valueOf("32"), storedvaluationItem.getRemainusefullife());
		assertEquals("dd", storedvaluationItem.getValuationbasis());
		assertEquals(new Amount(55,aa), storedvaluationItem.getOlv());
	
	}

}

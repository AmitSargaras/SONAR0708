package com.integrosys.cms.batch.mimb.limit;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class HibernateMIMBLimitTest  extends CustomHibernateTestCase{
	
	private HibernateTemplate hibernateTemplate;
	private JdbcTemplate jdbcTemplate;

	public void setUp() {
		super.setUp();

		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}

	protected String[] getMappingResources() {
		return new String[] { "Batch-Feed-MIMB.hbm.xml" };
	}

	public void testReport() {
		ILimitInformation limitInformation = new OBLimitInformation();
		
		limitInformation.setAaNo("qw");
		limitInformation.setApprovedLimit(Double.valueOf("100"));
		limitInformation.setDrawingLimit(Double.valueOf("200"));
		limitInformation.setLimitBookingLocationCode("re");
		limitInformation.setLimitBookingLocationDesc("fg");
		limitInformation.setLimitStatus("kl");
		limitInformation.setOutstandingBalance(Double.valueOf("300"));
		limitInformation.setOutstandingBalanceSign("as");
		limitInformation.setProductDescription("sd");
		limitInformation.setProductTypeCode("yu");
		limitInformation.setRecordType("p");
		limitInformation.setSourceLimitID("s");

		Long id = (Long) hibernateTemplate
				.save("actualOBLimitInformation", limitInformation);
		assertNotNull(id);

		int count = jdbcTemplate
				.queryForInt("select count(*) from SI_TEMP_MIMB_CA003");
		assertEquals(1, count);

		OBLimitInformation storedlimitInformation = (OBLimitInformation) hibernateTemplate.get(
				"actualOBLimitInformation", id);
		
		assertEquals("qw",storedlimitInformation.getAaNo());
		assertEquals(Double.valueOf("100"),storedlimitInformation.getApprovedLimit());
		assertEquals(Double.valueOf("200"),storedlimitInformation.getDrawingLimit());
		assertEquals("re",storedlimitInformation.getLimitBookingLocationCode());
		assertEquals("fg",storedlimitInformation.getLimitBookingLocationDesc());
		assertEquals("kl",storedlimitInformation.getLimitStatus());
		assertEquals(Double.valueOf("300"),storedlimitInformation.getOutstandingBalance());
		assertEquals("as",storedlimitInformation.getOutstandingBalanceSign());
		assertEquals("sd",storedlimitInformation.getProductDescription());
		assertEquals("yu",storedlimitInformation.getProductTypeCode());
		assertEquals("p",storedlimitInformation.getRecordType());
		assertEquals("s",storedlimitInformation.getSourceLimitID());
	}
	
}

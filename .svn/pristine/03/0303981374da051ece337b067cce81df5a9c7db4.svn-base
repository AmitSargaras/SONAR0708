package com.integrosys.cms.app.transaction;

import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

/**
 * Test Case for Transaction hibernate mapping xml
 * 
 * @author Chong Jun Yong
 * @since 1.1
 */
public class HibernateTransactionTest extends CustomHibernateTestCase {
	
	private HibernateTemplate hibernateTemplate;
	private JdbcTemplate jdbcTemplate;
	
	public void setUp() {
		super.setUp();
		
		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}

	protected String[] getMappingResources() {
		return new String[] { "Transaction.hbm.xml" };
	}
	
	public void testCreateTransaction() {
		Date todayDate = new Date();
		
		OBCMSTrxValue trxValue = new OBCMSTrxValue();
		trxValue.setStagingReferenceID("20080707000000001");
		trxValue.setTransactionDate(todayDate);
		trxValue.setTransactionType("CHECKLIST");
		trxValue.setTransactionSubType("MAINTAIN_CHECKLIST");
		trxValue.setFromState("ND");
		trxValue.setStatus("PENDING_CREATE");
		trxValue.setTeamID(1234l);
		trxValue.setCreateDate(todayDate);
		trxValue.setCustomerID(5678l);
		trxValue.setLimitProfileID(5678l);
		trxValue.setOriginatingCountry("MY");
		trxValue.setOriginatingOrganisation("KL001");
		
		OBTrxContext context = new OBTrxContext();
		context.setTrxCountryOrigin("MY");
		context.setTrxOrganisationOrigin("KL001");
		context.setTrxSegment("HP");
		
		trxValue.setTrxContext(context);
		
		String id = (String) hibernateTemplate.save(trxValue);
		assertNotNull(id);
		
		int count = jdbcTemplate.queryForInt("select count(*) from transaction");
		assertEquals(1, count);
		
		OBCMSTrxValue storedTrxValue = (OBCMSTrxValue) hibernateTemplate.get(OBCMSTrxValue.class, id);
		assertNotNull(storedTrxValue.getTrxContext());
		assertEquals("MY", storedTrxValue.getTrxContext().getTrxCountryOrigin());
		assertEquals("KL001", storedTrxValue.getTrxContext().getTrxOrganisationOrigin());
		assertEquals("HP", storedTrxValue.getTrxContext().getTrxSegment());
		assertEquals("PENDING_CREATE", storedTrxValue.getStatus());
		assertEquals("ND", storedTrxValue.getFromState());
		assertEquals(todayDate, storedTrxValue.getTransactionDate());
		
	}

}

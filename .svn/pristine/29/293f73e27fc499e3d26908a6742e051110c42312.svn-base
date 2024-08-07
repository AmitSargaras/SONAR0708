package com.integrosys.cms.batch.sema;

import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class HibernateFacilityFileTest extends CustomHibernateTestCase {

	private HibernateTemplate hibernateTemplate;

	private JdbcTemplate jdbcTemplate;

	public void setUp() {
		super.setUp();

		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}

	protected String[] getMappingResources() {
		return new String[] { "Batch-Feed-SEMA.hbm.xml" };
	}

	public void testSemaFile() {
		Date todayDate = new Date();

		IFacilityFile sema = new OBFacilityFile();
		
		sema.setNewIC("aa");
		sema.setOldIC("bb");
		sema.setOthers("cc");
		//sema.setOutstandingBalance(100);
		sema.setRecordType("a");
		sema.setStatusDateNPL(todayDate);
		sema.setStatusNPL("d");
		sema.setUserCode3("ff");

		Long id = (Long) hibernateTemplate.save("actualOBFacilityFile", sema);
		assertNotNull(id);

		int count = jdbcTemplate.queryForInt("select count(*) from SI_TEMP_SEMA_CA002");
		assertEquals(1, count);

		IFacilityFile storedsema = (OBFacilityFile) hibernateTemplate.get("actualOBFacilityFile", id);

		//assertEquals(100, storedsema.getOutstandingBalance());
		assertEquals("bb", storedsema.getOldIC());
		assertEquals("aa", storedsema.getNewIC());
		assertEquals("cc", storedsema.getOthers());
		assertEquals("d", storedsema.getStatusNPL());
		assertEquals("ff", storedsema.getUserCode3());
		assertEquals("a", storedsema.getRecordType());
		assertEquals(todayDate, storedsema.getStatusDateNPL());

	}

}

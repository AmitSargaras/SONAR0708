package com.integrosys.cms.host.stp.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.sql.Timestamp;
import java.util.Date;


public class HibernateStpTrxErrorTest extends CustomHibernateTestCase{
	private HibernateTemplate hibernateTemplate;
	private JdbcTemplate jdbcTemplate;

	public void setUp() {
		super.setUp();

		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}

	protected String[] getMappingResources() {
		return new String[] { "Stp.hbm.xml" };
	}

	public  void testStpTrxError(){
        OBStpTransError stpTransError = new OBStpTransError();
        stpTransError.setTrxUID(new Long(9981231));
        stpTransError.setErrorCode("FF");
        stpTransError.setErrorDesc("Hi, hibernate testing");

        Long id = (Long) hibernateTemplate.save("stpTrxError", stpTransError);
		assertNotNull(id);

		int count = jdbcTemplate.queryForInt("select count(*) from STP_TRANS_ERROR");
		assertEquals(1, count);

		OBStpTransError storedStpTransError = (OBStpTransError) hibernateTemplate.get("stpTrxError", id);

        assertEquals("FF", storedStpTransError.getErrorCode());
		assertEquals("Hi, hibernate testing", storedStpTransError.getErrorDesc());
        assertEquals(new Long(9981231), storedStpTransError.getTrxUID());
    }
}
package com.integrosys.cms.host.stp.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.sql.Timestamp;
import java.util.Date;


public class HibernateStpTrxHistoryTest extends CustomHibernateTestCase{
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


	public  void testStpTrxHistory(){
		Date todayDate = new Date();

        OBStpTrans stpTrans = new OBStpTrans();
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setStatus("SUCCESS");
        stpTrans.setUserId(new Long(123));
        stpTrans.setTrxHistoryId(new Long(127537213));
        stpTrans.setCurTrxHistoryId("BA");
        stpTrans.setOpsDesc("CREATE");
        byte [] output = {Byte.decode("12").byteValue()};
        stpTrans.setRequestMsgStream(output);

        Long id = (Long) hibernateTemplate.save("stpTrxHistory", stpTrans);
		assertNotNull(id);

		int count = jdbcTemplate.queryForInt("select count(*) from STP_TRANS_HISTORY");
		assertEquals(1, count);

		OBStpTrans storedStpTrans = (OBStpTrans) hibernateTemplate.get("stpTrxHistory", id);

        assertEquals(new Timestamp(todayDate.getTime()), storedStpTrans.getCreationDate());
		assertEquals("SUCCESS", storedStpTrans.getStatus());
		assertEquals(new Long(123), storedStpTrans.getUserId());
        assertEquals("BA", storedStpTrans.getCurTrxHistoryId());
        assertEquals(stpTrans.getRequestMsgStream(), output);
        assertEquals(stpTrans.getOpsDesc(), "CREATE");
    }
}
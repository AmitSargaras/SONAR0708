package com.integrosys.cms.host.stp.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;


public class HibernateStpTrxTest extends CustomHibernateTestCase{
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


	public  void testStpTrx(){
		Date todayDate = new Date();

        OBStpTrans stpTrans = new OBStpTrans();
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setStatus("LOADING");
        stpTrans.setUserId(new Long(123));
        stpTrans.setTrxHistoryId(new Long(20080820000000002l));
//        stpTrans.setTrxUID(new Long(1234522));
        stpTrans.setCurTrxHistoryId("BA");
        stpTrans.setMsgCount(new Integer(0));

        byte [] output = {new Byte("100").byteValue()};
        stpTrans.setRequestMsgStream(output);

        HashSet hashSet = new HashSet();
//        OBStpTransError error = new OBStpTransError();
//        error.setErrorCode("AA");
//        error.setErrorDesc("Timeout");
//        hashSet.add(error);

//        error = new OBStpTransError();
//        error.setErrorCode("BB");
//        error.setErrorDesc("Exception");
//        hashSet.add(error);

//        stpTrans.setTrxErrorSet(hashSet);

        Long id = (Long) hibernateTemplate.save("stpTrx", stpTrans);
		assertNotNull(id);

		int count = jdbcTemplate.queryForInt("select count(*) from STP_TRANS");
		assertEquals(1, count);

		OBStpTrans storedStpTrans = (OBStpTrans) hibernateTemplate.get("stpTrx", id);

        assertEquals(new Timestamp(todayDate.getTime()), storedStpTrans.getCreationDate());
		assertEquals("LOADING", storedStpTrans.getStatus());
		assertEquals(new Long(123), storedStpTrans.getUserId());
        assertEquals(new Integer(0), storedStpTrans.getMsgCount());
        assertEquals(new Long(20080820000000002l), storedStpTrans.getTrxHistoryId());
        assertEquals("BA", storedStpTrans.getCurTrxHistoryId());
//        assertEquals(Byte.toString(storedStpTrans.getRequestMsgStream()[0]), "100");
//        assertEquals(2, storedStpTrans.getTrxErrorSet().size());
    }
}
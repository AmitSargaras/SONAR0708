package com.integrosys.cms.host.stp.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;


public class HibernateStpMasterTrxTest extends CustomHibernateTestCase{
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


	public  void testStpMasterTrx(){
		Date todayDate = new Date();

        OBStpMasterTrans masterTrans = new OBStpMasterTrans() ;
        masterTrans.setReferenceId(new Long(23123131));
        masterTrans.setStatus("active");
        masterTrans.setTransactionId("123123123123");
        masterTrans.setTransactionType("COL");

        OBStpTrans stpTrans = new OBStpTrans();
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setStatus("OBSOLETE");
        stpTrans.setUserId(new Long(123));
        stpTrans.setTrxHistoryId(new Long(127537213));
        stpTrans.setCurTrxHistoryId("BA");
        byte [] output = {Byte.decode("12").byteValue()};
//        stpTrans.setRequestMsgStream(output);
        stpTrans.setRequestMsg(null);

        HashSet hashSet = new HashSet();
        hashSet.add(stpTrans);
        masterTrans.setTrxEntriesSet(hashSet);
        Long id = (Long) hibernateTemplate.save("stpMasterTrx", masterTrans);
		assertNotNull(id);

		int count = jdbcTemplate.queryForInt("select count(*) from STP_MASTER_TRANS");
		assertEquals(1, count);

		OBStpMasterTrans storedMasterTrans = (OBStpMasterTrans) hibernateTemplate.get("stpMasterTrx", id);

		assertEquals(new Long(23123131), storedMasterTrans.getReferenceId());
		assertEquals("active", storedMasterTrans.getStatus());
		assertEquals("123123123123", storedMasterTrans.getTransactionId());
		assertEquals("COL", storedMasterTrans.getTransactionType());

        OBStpTrans storedStpTrans = (OBStpTrans) storedMasterTrans.getTrxEntriesSet().toArray()[0];
        assertEquals(new Timestamp(todayDate.getTime()), storedStpTrans.getCreationDate());
		assertEquals("OBSOLETE", storedStpTrans.getStatus());
		assertEquals(new Long(123), storedStpTrans.getUserId());
        assertEquals(new Integer(0), storedStpTrans.getMsgCount());
        assertEquals(new Long(127537213), storedStpTrans.getTrxHistoryId());
        assertEquals("BA", storedStpTrans.getCurTrxHistoryId());
//        assertEquals(stpTrans.getRequestMsgStream(), output);
        assertNull(storedStpTrans.getRequestMsgStream());
    }
}
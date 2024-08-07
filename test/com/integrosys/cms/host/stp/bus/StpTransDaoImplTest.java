package com.integrosys.cms.host.stp.bus;

import java.util.*;
import java.sql.Timestamp;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * Created by IntelliJ IDEA.
 * User: Andy Wong
 * Date: Aug 25, 2008
 * Time: 11:32:06 PM
 * To change this template use File | Settings | File Templates.
 */

public class StpTransDaoImplTest extends CustomHibernateTestCase {

	StpTransDaoImpl dao;
    JdbcTemplate jdbcTemplate;

    public void setUp() {
		super.setUp();
        dao = new StpTransDaoImpl();
        dao.setSessionFactory(getSessionFactory());
        dao.setHibernateTemplate(getHibernateTemplate());
        jdbcTemplate = new JdbcTemplate(getDataSource());
    }

    protected String[] getMappingResources() {
		return new String[] { "Stp.hbm.xml"};
	}

    public void testGetMasterTransByPrimaryKey(){
        Date todayDate = new Date();
        OBStpMasterTrans masterTrans = new OBStpMasterTrans() ;
        masterTrans.setReferenceId(new Long(23123131));
        masterTrans.setStatus("active");
        masterTrans.setTransactionId("123123123123");
        masterTrans.setTransactionType("COL");

        OBStpTrans stpTrans = new OBStpTrans();
        stpTrans.setTrxUID(new Long(12233));
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setStatus("ACTIVE");
        stpTrans.setUserId(new Long(123));
        stpTrans.setTrxHistoryId(new Long(127537213));
        stpTrans.setCurTrxHistoryId("BA");
        byte [] output = {Byte.decode("12").byteValue()};
        stpTrans.setRequestMsgStream(output);
        HashSet errSet = new HashSet();
        OBStpTransError error = new OBStpTransError();
        error.setErrorCode("agsd");
        error.setErrorDesc("654123123");
        errSet.add(error);

        stpTrans.setTrxErrorSet(errSet);

        HashSet hashSet = new HashSet();
        hashSet.add(stpTrans);

        stpTrans = new OBStpTrans();
        stpTrans.setTrxUID(new Long(12234));
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setStatus("OBSOLETE");
        stpTrans.setUserId(new Long(452));
        stpTrans.setTrxHistoryId(new Long(7512311));
        stpTrans.setCurTrxHistoryId("SA");
        stpTrans.setRequestMsgStream(output);
        stpTrans.setTrxErrorSet(new HashSet());
        hashSet.add(stpTrans);

        masterTrans.setTrxEntriesSet(hashSet);

        Long id = (Long) getHibernateTemplate().save("stpMasterTrx", masterTrans);
        OBStpMasterTrans foundStpMaster = (OBStpMasterTrans) dao.getMasterTransByPrimaryKey(id);
		assertEquals(foundStpMaster.getReferenceId(), new Long(23123131));
		assertEquals(foundStpMaster.getTrxEntriesSet().size(), 2);
    }

    public void testCreateMasterTrans(){
        Date todayDate = new Date();
        OBStpMasterTrans masterTrans = new OBStpMasterTrans() ;
        masterTrans.setReferenceId(new Long(23123131));
        masterTrans.setStatus("active");
        masterTrans.setTransactionId("123123123123");
        masterTrans.setTransactionType("COL");

        OBStpTrans stpTrans = new OBStpTrans();
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setStatus("ACTIVE");
        stpTrans.setUserId(new Long(123));
        stpTrans.setTrxUID(new Long(9999999));
        stpTrans.setCurTrxHistoryId("ABC123");
        byte [] output = {Byte.decode("12").byteValue()};
        stpTrans.setRequestMsgStream(output);

        HashSet hashSet = new HashSet();
        hashSet.add(stpTrans);
        masterTrans.setTrxEntriesSet(hashSet);

        IStpMasterTrans saveNewOB = dao.createMasterTrans(masterTrans);
		assertEquals(saveNewOB.getTransactionId(), "123123123123");
        assertEquals(saveNewOB.getStatus(), "active");

        OBStpTrans storedStpTrans = (OBStpTrans) saveNewOB.getTrxEntriesSet().toArray()[0];
        assertEquals(storedStpTrans.getTrxUID(), new Long(9999999));
//
//        OBStpTrans history = (OBStpTrans) dao.getTransHistoryByTrxUID(9999999);
//        assertEquals(history.getTrxUID(), 9999999);
//        assertEquals(history.getUserId(), 123);
//        assertEquals(history.getStatus(), "ACTIVE");

        storedStpTrans.setResponseCode("AA");
        IStpMasterTrans save2 = dao.updateMasterTrans(saveNewOB);
        OBStpTrans saveTrans = (OBStpTrans) save2.getTrxEntriesSet().toArray()[0];
        assertEquals(saveTrans.getResponseCode(), "AA");

    }

    public void testGetNoResponseTrx() throws Exception{
        Date todayDate = new Date();
        OBStpMasterTrans masterTrans = new OBStpMasterTrans() ;
        masterTrans.setReferenceId(new Long(23123131));
        masterTrans.setStatus("active");
        masterTrans.setTransactionId("123123123123");
        masterTrans.setTransactionType("COL");

        OBStpTrans stpTrans = new OBStpTrans();
        stpTrans.setTrxUID(new Long(12345));
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setUserId(new Long(123));
        stpTrans.setTrxHistoryId(new Long(127537213));
        stpTrans.setCurTrxHistoryId("BA");

        HashSet hashSet = new HashSet();
        hashSet.add(stpTrans);

        stpTrans = new OBStpTrans();
        stpTrans.setTrxUID(new Long(12346));
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setStatus("OBSOLETE");
        stpTrans.setUserId(new Long(452));
        stpTrans.setTrxHistoryId(new Long(7512311));
        stpTrans.setCurTrxHistoryId("SA");
        hashSet.add(stpTrans);

        stpTrans = new OBStpTrans();
        stpTrans.setTrxUID(new Long(12347));
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setUserId(new Long(888));
        stpTrans.setTrxHistoryId(new Long(19826313));
        stpTrans.setCurTrxHistoryId("AS");
        hashSet.add(stpTrans);

        masterTrans.setTrxEntriesSet(hashSet);

        dao.createMasterTrans(masterTrans);
        List noResponseL = (List) dao.getNoResponseStpTrans();
		assertEquals(noResponseL.size(), 2);

    }

    public void testStpTrxErrorCascade(){
        Date todayDate = new Date();
        OBStpMasterTrans masterTrans = new OBStpMasterTrans() ;
        masterTrans.setReferenceId(new Long(23123131));
        masterTrans.setStatus("active");
        masterTrans.setTransactionId("123123123123");
        masterTrans.setTransactionType("COL");

        OBStpTrans stpTrans = new OBStpTrans();
        stpTrans.setCreationDate(new Timestamp(todayDate.getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(todayDate.getTime()));
        stpTrans.setStatus("ACTIVE");
        stpTrans.setUserId(new Long(123));
        stpTrans.setTrxUID(new Long(111));
        stpTrans.setCurTrxHistoryId("ABC123");

        HashSet errSet = new HashSet();
        OBStpTransError error = new OBStpTransError();
        error.setErrorCode("ABG");
        error.setErrorDesc("654123123");
        errSet.add(error);
        stpTrans.setTrxErrorSet(errSet);

        HashSet hashSet = new HashSet();
        hashSet.add(stpTrans);
        masterTrans.setTrxEntriesSet(hashSet);

        IStpMasterTrans saveNewOB = dao.createMasterTrans(masterTrans);
        OBStpTrans storedStpTrans = (OBStpTrans) saveNewOB.getTrxEntriesSet().toArray()[0];
//        Set set = storedStpTrans.getTrxErrorSet();
//        storedStpTrans.getTrxErrorSet().clear();
//        storedStpTrans.setTrxErrorSet(set);
        
        storedStpTrans.setTrxUID(new Long(112));

        error = new OBStpTransError();
        error.setErrorCode("CDE");
        error.setErrorDesc("654123123");
        Set abc = new HashSet();
        abc.add(error);
//        storedStpTrans.getTrxErrorSet().add(error);
        storedStpTrans.setTrxErrorSet(abc);

        dao.deleteObsoleteTransError(storedStpTrans.getTrxUID());
        dao.updateMasterTrans(saveNewOB);
        IStpMasterTrans ndsave = dao.getMasterTransByTransactionId("123123123123");

        dao.updateMasterTrans(ndsave);
        List aList = jdbcTemplate.queryForList("select trx_uid, error_code from STP_TRANS_ERROR");
        for (Iterator iterator = aList.iterator(); iterator.hasNext();) {
            Map l = (Map) iterator.next();
            System.out.println("trxUID="+l.get("TRX_UID") + " errorCode="+l.get("ERROR_CODE"));
        }

//        IStpTrans hist = dao.getTransHistoryByTrxUID(111);
//        assertNotNull(Long.toString(hist.getMasterTrxId()));
//
//        int count = jdbcTemplate.queryForInt("select count(*) from STP_TRANS_HISTORY where master_trx_id <> 0");
//        assertEquals(0, count);
    }

}
package com.integrosys.cms.app.transaction;

import java.util.Date;

import com.integrosys.base.techinfra.ejbsupport.ConcurrentUpdateException;
import com.integrosys.base.techinfra.test.MockContextTestCase;

/**
 * Test Case for {@link EBCMSTrxValueBean}
 * 
 * @author Chong Jun Yong
 * 
 */
public class EBCMSTrxValueBeanTest extends MockContextTestCase {

	private EBCMSTrxValueHome ebCmsTrxValueHome;

	public void onSetUp() throws Exception {

		deploy("EBCMSTrxValueHome", EBCMSTrxValueHome.class, EBCMSTrxValue.class, EBCMSTrxValueBean.class);

		ebCmsTrxValueHome = (EBCMSTrxValueHome) get("EBCMSTrxValueHome");
	}

	public void testHomeCreateCmsTrxValue() throws Exception {
		OBCMSTrxValue trxValue = new OBCMSTrxValue();
		trxValue.setReferenceID("20080828000000111l");
		trxValue.setStagingReferenceID("200808310000000222");
		trxValue.setTransactionType("LIMIT_PROFILE");
		trxValue.setTransactionDate(new Date());
		trxValue.setLimitProfileID(20080828000000111l);
		trxValue.setLimitProfileReferenceNumber("RLOS-HP-AA-56789");

		EBCMSTrxValue trxValueLocal = ebCmsTrxValueHome.create(trxValue);

		OBCMSTrxValue storedTrxValue = trxValueLocal.getTransaction();
		assertNotNull(storedTrxValue);
		assertTrue("should have PK value greater than 0", Long.parseLong(storedTrxValue.getTransactionID()) > 0);
		assertEquals("LIMIT_PROFILE", storedTrxValue.getTransactionType());

		trxValueLocal = ebCmsTrxValueHome.findByPrimaryKey(storedTrxValue.getTransactionID());
		storedTrxValue = trxValueLocal.getTransaction();

		assertEquals(trxValue.getTransactionDate(), storedTrxValue.getTransactionDate());
		assertEquals(20080828000000111l, storedTrxValue.getLimitProfileID(), 0);
		assertEquals("RLOS-HP-AA-56789", storedTrxValue.getLimitProfileReferenceNumber());
	}

	public void testUpdateCmsTrxValueHitConcurrentUpdate() throws Exception {
		OBCMSTrxValue trxValue = new OBCMSTrxValue();
		trxValue.setReferenceID("20080828000000111l");
		trxValue.setStagingReferenceID("200808310000000222");
		trxValue.setTransactionType("LIMIT_PROFILE");
		trxValue.setTransactionDate(new Date());
		trxValue.setLimitProfileID(20080828000000111l);
		trxValue.setLimitProfileReferenceNumber("RLOS-HP-AA-56789");

		EBCMSTrxValue trxValueLocal = ebCmsTrxValueHome.create(trxValue);

		OBCMSTrxValue storedTrxValue = trxValueLocal.getTransaction();
		assertNotNull(storedTrxValue);

		trxValueLocal = ebCmsTrxValueHome.findByPrimaryKey(storedTrxValue.getTransactionID());
		storedTrxValue = trxValueLocal.getTransaction();
		storedTrxValue.setVersionTime(System.currentTimeMillis());

		try {
			trxValueLocal = ebCmsTrxValueHome.findByPrimaryKey(storedTrxValue.getTransactionID());
			trxValueLocal.setTransaction(storedTrxValue);
			fail("should have throw concurrent update exception");
		}
		catch (Exception e) {
			assertTrue(e instanceof ConcurrentUpdateException);
		}
	}
}

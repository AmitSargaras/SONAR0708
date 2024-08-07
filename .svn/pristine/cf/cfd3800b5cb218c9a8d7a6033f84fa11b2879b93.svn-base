package com.integrosys.cms.app.tatdoc.bus;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

/**
 * Test Case for {@link TatDocImpl}
 * 
 * @author Cynthia
 * @since 1.1
 */
public class TatDocDaoImplTest extends CustomHibernateTestCase {

	TatDocImpl dao;

	public void setUp() {
		super.setUp();

		dao = new TatDocImpl();
		dao.setSessionFactory(getSessionFactory());
	}

	protected String[] getMappingResources() {
		return new String[] { "TatDoc.hbm.xml" };
	}

	public void testCreateActualTatDoc() {
		OBTatDocDraft[] draftList = new OBTatDocDraft[1];
		draftList[0] = new OBTatDocDraft();
		draftList[0].setDocDraftStage("DocRec");
		draftList[0].setDraftNumber((short)1);
		draftList[0].setDraftDate(new Date());

		OBTatDoc tatDoc = new OBTatDoc();
		tatDoc.setLimitProfileID(20070101000001l);
        tatDoc.setFileReceivedFromBizCenter(new Date());
		tatDoc.setDraftList(draftList);
        tatDoc.setDocReceviceForPADate(new Date());
        tatDoc.setDocPAExcuteDate(new Date());
        tatDoc.setPreDisbursementRemarks("Pre Disbursement Remarks");
        tatDoc.setSolicitorAdviseReleaseDate(new Date());
        tatDoc.setDisbursementDocCompletionDate(new Date());
        tatDoc.setDisbursementDate(new Date());
        tatDoc.setDisbursementRemarks("Disbursement Remarks");
        tatDoc.setDocCompletionDate(new Date());
        tatDoc.setPostDisbursementRemarks("Post Disbursement Remarks");

		ITatDoc actualTatDoc = dao.create(ITatDocDAO.ACTUAL_TAT_DOC, tatDoc);
		assertTrue("pk should be greater than 0", actualTatDoc.getTatDocID() > 0);

		ITatDoc retrievedTatDoc = dao.getTatDocByID(ITatDocDAO.ACTUAL_TAT_DOC,actualTatDoc.getTatDocID());
		assertNotNull(retrievedTatDoc);
		assertTrue("should have only 1 draft date entry", retrievedTatDoc.getDraftList().length == 1);
		assertEquals(20070101000001l, retrievedTatDoc.getLimitProfileID());

		assertEquals("DocRec", retrievedTatDoc.getDraftList()[0].getDocDraftStage());
		assertEquals("1", String.valueOf(retrievedTatDoc.getDraftList()[0].getDraftNumber()));

	}

	public void testCreateStagingTatDoc() {
		OBTatDocDraft[] draftList = new OBTatDocDraft[1];
		draftList[0] = new OBTatDocDraft();
		draftList[0].setDocDraftStage("DocRec");
		draftList[0].setDraftNumber((short)1);
		draftList[0].setDraftDate(new Date());

		OBTatDoc tatDoc = new OBTatDoc();
		tatDoc.setLimitProfileID(20070101000001l);
        tatDoc.setFileReceivedFromBizCenter(new Date());
		tatDoc.setDraftList(draftList);
        tatDoc.setDocReceviceForPADate(new Date());
        tatDoc.setDocPAExcuteDate(new Date());
        tatDoc.setPreDisbursementRemarks("Pre Disbursement Remarks");
        tatDoc.setSolicitorAdviseReleaseDate(new Date());
        tatDoc.setDisbursementDocCompletionDate(new Date());
        tatDoc.setDisbursementDate(new Date());
        tatDoc.setDisbursementRemarks("Disbursement Remarks");
        tatDoc.setDocCompletionDate(new Date());
        tatDoc.setPostDisbursementRemarks("Post Disbursement Remarks");

		ITatDoc stageTatDoc = dao.create(ITatDocDAO.STAGE_TAT_DOC, tatDoc);
		assertTrue("pk should be greater than 0", stageTatDoc.getTatDocID() > 0);

		ITatDoc retrievedActualTatDoc = dao.getTatDocByID(ITatDocDAO.ACTUAL_TAT_DOC,stageTatDoc.getTatDocID());
		assertNull(retrievedActualTatDoc);

        ITatDoc retrievedTatDoc = dao.getTatDocByID(ITatDocDAO.STAGE_TAT_DOC,stageTatDoc.getTatDocID());
        assertNotNull(retrievedTatDoc);
        assertTrue("should have only 1 draft date entry", retrievedTatDoc.getDraftList().length == 1);
        assertEquals(20070101000001l, retrievedTatDoc.getLimitProfileID());

        assertEquals("DocRec", retrievedTatDoc.getDraftList()[0].getDocDraftStage());
        assertEquals("1", String.valueOf(retrievedTatDoc.getDraftList()[0].getDraftNumber()));

	}

}

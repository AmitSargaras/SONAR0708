package com.integrosys.cms.app.diary.bus;

import java.util.Date;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class DiaryDaoImplTest extends CustomHibernateTestCase {

	DiaryDaoImpl dao;

	protected String[] getMappingResources() {
		return new String[] { "DiaryItem.hbm.xml" };
	}

	public void setUp() {
		super.setUp();

		dao = new DiaryDaoImpl();
		dao.setSessionFactory(getSessionFactory());
	}

	public void testCreateStagingDiary() {

		Date todayDate = new Date();
		boolean obsolete = true;
		OBDiaryItem diaryItem = new OBDiaryItem();

		diaryItem.setTeamTypeID(21);
		diaryItem.setCustomerReference("sasa");
		diaryItem.setCustomerName("sary");
		diaryItem.setDescription("yes");
		diaryItem.setNarration("so");
		diaryItem.setDueDate(todayDate);
		diaryItem.setLastUpdatedBy("ss");
		diaryItem.setExpiryDate(todayDate);
		diaryItem.setLastUpdatedTime(todayDate);
		diaryItem.setObsoleteInd(obsolete);
		diaryItem.setFAM("meet");
		diaryItem.setCustomerSegment("as");
		diaryItem.setVersionTime(500);
		diaryItem.setAllowedCountry("SINPT");

		dao.createDiaryItem("actualOBDiaryItem", diaryItem);
		assertTrue("should have primary key set.", diaryItem.getItemID() > 0);

		IDiaryItemUI storedGroup = dao.getDiaryItem("actualOBDiaryItem",
				new Long(diaryItem.getItemID()));
		assertNotNull(storedGroup);

		assertEquals(21, storedGroup.getTeamTypeID());
		assertEquals("sary", storedGroup.getCustomerName());

	}

}

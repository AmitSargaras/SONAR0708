package com.integrosys.cms.app.diary.bus;

import java.util.Date;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;


public class HibernateDiaryItemTest extends CustomHibernateTestCase{
	private HibernateTemplate hibernateTemplate;
	private JdbcTemplate jdbcTemplate;
	
	public void setUp() {
		super.setUp();
		
		hibernateTemplate = new HibernateTemplate(getSessionFactory());
		jdbcTemplate = new JdbcTemplate(getDataSource());
	}
	
	protected String[] getMappingResources() {
		return new String[] { "DiaryItem.hbm.xml" };
	}
	
	
	public  void testDiaryItem(){
		Date todayDate = new Date();
		boolean obsolete = true ;
		OBDiaryItem diaryItem = new OBDiaryItem();
		
		//DiaryItem.setItemID(11);
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
		
		
		Long id = (Long) hibernateTemplate.save("actualOBDiaryItem",diaryItem);
		assertNotNull(id);
		
		int count = jdbcTemplate.queryForInt("select count(*) from CMS_DIARY_ITEM");
		assertEquals(1, count);
		
		OBDiaryItem storedDiaryItem = (OBDiaryItem) hibernateTemplate.get("actualOBDiaryItem", id);
		
		//assertEquals(11, storedDiaryItem.getItemID());
		assertEquals(21, storedDiaryItem.getTeamTypeID());
		assertEquals("sasa", storedDiaryItem.getCustomerReference());
		assertEquals("sary", storedDiaryItem.getCustomerName());
		assertEquals("yes", storedDiaryItem.getDescription());
		assertEquals("so", storedDiaryItem.getNarration());
		assertEquals(todayDate, storedDiaryItem.getDueDate());
		assertEquals("ss", storedDiaryItem.getLastUpdatedBy());
		assertEquals(todayDate, storedDiaryItem.getExpiryDate());
		assertEquals(todayDate, storedDiaryItem.getLastUpdatedTime());
		assertEquals(obsolete, storedDiaryItem.getObsoleteInd());
		assertEquals("meet", storedDiaryItem.getFAM());
		assertEquals("as", storedDiaryItem.getCustomerSegment());
		assertEquals(500, storedDiaryItem.getVersionTime());
		assertEquals("SINPT", storedDiaryItem.getAllowedCountry());
		
	}
}


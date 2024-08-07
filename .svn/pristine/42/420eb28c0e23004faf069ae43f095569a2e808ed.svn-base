package com.integrosys.cms.host.eai.recurrentdoc.bus;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.covenant.bus.RecurrentDoc;

public class HibernateRecurrentDocTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-RecurrentDoc.hbm.xml" };
	}

	public void testRecurrentDocMapping() {
		RecurrentDoc recDoc = new  RecurrentDoc();
		recDoc.setCmsLimitProfileID(111111);
		recDoc.setCmsSubProfileID(2222);
		recDoc.setRecurrentDocID(000001);
		recDoc.setStatus("A");
		Long returnedID = (Long) getHibernateTemplate().save(recDoc);
		assertNotNull(returnedID);
		System.out.println(" RecurrentDoc Serialized ID -->"+ returnedID);
		RecurrentDoc storedRecDoc =(RecurrentDoc) getHibernateTemplate().get(RecurrentDoc.class, returnedID);
		assertNotNull(storedRecDoc);
		
	}
}
package com.integrosys.cms.host.eai.covenant.bus;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;

public class HibernateConvenantTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Covenant.hbm.xml", "EAI-RecurrentDoc.hbm.xml" };
	}

	public void testCoventMessagePersisting() {
		// testing the actual recurrent
		RecurrentDoc recDoc = new RecurrentDoc();
		recDoc.setLOSAANumber("001223");
		recDoc.setCmsLimitProfileID(11111111l);
		recDoc.setCmsSubProfileID(2222222l);
		Long recDocid = (Long) getHibernateTemplate().save(recDoc);
		recDoc.setRecurrentDocID(recDocid.longValue());

		RecurrentDoc storedRrecDoc = (RecurrentDoc) getHibernateTemplate().get(RecurrentDoc.class, recDocid);
		assertNotNull(storedRrecDoc);

		// testing the actual covenant item
		CovenantItem covItem = new CovenantItem();
		covItem.setCovenantCondition("Good");
		covItem.setDocEndDate("11111999");
		covItem.setRecurrentDocId(new Long(recDoc.getRecurrentDocID()));
		covItem.setCMSconvenantItemRefID(new Long(99999999l));
		covItem.setOneOff("Y");
		covItem.setIsDeleted("N");
		covItem.setIsParameterized("Y");
		covItem.setRiskTrigger("Y");
		Long covItemId = (Long) getHibernateTemplate().save(covItem);
		covItem.setCMSCovenantItemID(covItemId);

		CovenantItem storedCovenantItem = (CovenantItem) getHibernateTemplate().get(CovenantItem.class, covItemId);
		getHibernateTemplate().update(storedCovenantItem);
		assertNotNull(storedCovenantItem);

		// testing the staging recurrent doc
		StageRecurrentDoc stgRecDoc = new StageRecurrentDoc();
		stgRecDoc.setLOSAANumber("aa812345");
		stgRecDoc.setCmsLimitProfileID(11111111l);
		stgRecDoc.setCmsSubProfileID(2222222l);
		Long stgRecDocID = (Long) getHibernateTemplate().save(stgRecDoc);
		stgRecDoc.setRecurrentDocID(stgRecDocID.longValue());

		StageRecurrentDoc storedStgRrecDoc = (StageRecurrentDoc) getHibernateTemplate().get(StageRecurrentDoc.class,
				stgRecDocID);
		assertNotNull(storedStgRrecDoc);

		// testing the staging covenant item
		StageConvenantItem stgCovItem = new StageConvenantItem();
		stgCovItem.setCovenantCondition("Good");
		stgCovItem.setDocEndDate("11111999");
		stgCovItem.setRecurrentDocId(new Long(stgRecDoc.getRecurrentDocID()));
		stgCovItem.setCMSconvenantItemRefID(covItem.getCMSCovenantItemID());
		Long stgCovItemId = (Long) getHibernateTemplate().save(stgCovItem);
		stgCovItem.setCMSCovenantItemID(stgCovItemId);

		StageConvenantItem storedStgCovItme = (StageConvenantItem) getHibernateTemplate().get(StageConvenantItem.class,
				stgCovItemId);
		assertNotNull(storedStgCovItme);

		assertNotSame(recDocid, stgRecDocID);
		assertNotSame(covItemId, stgCovItemId);
		assertSame(covItem.getCMSCovenantItemID(), stgCovItem.getCMSconvenantItemRefID());

	}

}

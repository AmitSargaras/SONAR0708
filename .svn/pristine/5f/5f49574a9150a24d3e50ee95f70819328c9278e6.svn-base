package com.integrosys.cms.host.eai.limit.bus;

import java.net.URL;
import java.util.Iterator;
import java.util.Vector;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;
import com.integrosys.cms.host.eai.limit.AAMessageBody;

/**
 * @author Chong Jun Yong
 * @author Thurein
 * 
 */
public class HibernateLimitTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "EAI-Limit.hbm.xml" };
	}

	public void testStoreLimitProfile() {
		LimitProfile limitProfile = new LimitProfile();
		limitProfile.setLOSAANumber("AA-HP-12345");
		limitProfile.setAAStatus("Active");
		limitProfile.setAAApproveDate("20081031");

		limitProfile.setCmsSubProfileId(20080811000000002l);

		Long id = (Long) getHibernateTemplate().save(limitProfile);
		assertNotNull(id);

		LimitProfile storedLimitProfile = (LimitProfile) getHibernateTemplate().get(LimitProfile.class, id);
		assertEquals("AA-HP-12345", storedLimitProfile.getLOSAANumber());
		assertEquals(20080811000000002l, storedLimitProfile.getCmsSubProfileId(), 0);
	}

	/**
	 * Test to make sure that all the fields in the eai-message (CA001) has
	 * persists
	 */
	public void testLimitAllFieldsPersistance() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-aa_Master.xml");
		URL messageUrl = ctxClassLoader.getResource("CA001_AllFields.xml");
		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);
		AAMessageBody aaMsgbody = (AAMessageBody) a.getMsgBody();

		/** Test the limit profile persistency **/
		LimitProfile limitProfile = aaMsgbody.getLimitProfile();
		Long id = (Long) getHibernateTemplate().save(limitProfile);
		assertNotNull(id);
		LimitProfile lmtProfile = (LimitProfile) getHibernateTemplate().get(LimitProfile.class, id);
		assertNotNull(lmtProfile.getCIFId());
		assertNotNull(lmtProfile.getCIFSource());
		assertTrue((lmtProfile.getSubProfileId() > 0));
		assertNotNull(lmtProfile.getLOSAANumber());
		assertNotNull(lmtProfile.getHostAANumber());
		assertNotNull(lmtProfile.getAAApproveDate());
		assertNotNull(lmtProfile.getOriginatingLocation().getOriginatingLocationCountry());
		assertNotNull(lmtProfile.getOriginatingLocation().getOriginatingLocationOrganisation());
		assertNotNull(lmtProfile.getAnnualReviewDate());
		assertNotNull(lmtProfile.getExtensionDate());
		assertNotNull(lmtProfile.getAAStatus());
		assertNotNull(lmtProfile.getAACreateDate());
		assertNotNull(lmtProfile.getLORequired());
		assertNotNull(lmtProfile.getAAType());
		assertNotNull(lmtProfile.getAALawType());
		assertNotNull(lmtProfile.getExtensionDateLOAcceptance());

		/** Test the credit grade persistency **/
		Vector creditGrades = aaMsgbody.getCreditGrade();
		Iterator creGrdsIter = creditGrades.iterator();
		while (creGrdsIter.hasNext()) {
			LimitCreditGrade lmtCreditGrade = (LimitCreditGrade) creGrdsIter.next();
			Long cid = (Long) getHibernateTemplate().save(lmtCreditGrade);
			assertNotNull(cid);
			LimitCreditGrade creditGrade = (LimitCreditGrade) getHibernateTemplate().get(LimitCreditGrade.class, cid);
			assertTrue(creditGrade.getLOSAANumber().equals("MO-000077-081118-000120"));
			assertTrue(creditGrade.getCreditGradeId() == 99982);
			assertTrue(creditGrade.getCreditGradeType().getStandardCodeNumber().equals("18"));
			assertTrue(creditGrade.getCreditGradeType().getStandardCodeValue().equals("CCRIS"));
			assertTrue(creditGrade.getCreditGradeCode().getStandardCodeNumber().equals("19"));
			assertTrue(creditGrade.getCreditGradeCode().getStandardCodeValue().equals("Y"));
			assertNotNull(creditGrade.getJDOCreditGradeEffectiveDate());
			assertTrue(creditGrade.getCreditGradeReasonForChange().equals("reason"));
		}

		/** Test the joint borrower persistency **/
		Vector jointBorrowers = aaMsgbody.getJointBorrower();
		Iterator jointIter = jointBorrowers.iterator();
		while (jointIter.hasNext()) {
			JointBorrower joinBorrower = (JointBorrower) jointIter.next();
			Long jid = (Long) getHibernateTemplate().save(joinBorrower);
			assertNotNull(jid);
			JointBorrower jointBorrower = (JointBorrower) getHibernateTemplate().get(JointBorrower.class, jid);
			assertTrue(jointBorrower.getCIFId().equals("20081118000368"));
			assertTrue((jointBorrower.getSubProfileId() > 0));
			assertTrue(jointBorrower.getAANumber().equals("MO-000077-081118-000120"));

		}

		/** Charge **/
		Vector charges = aaMsgbody.getChargeDetail();
		Iterator chargeIter = charges.iterator();
		while (chargeIter.hasNext()) {
			ChargeDetail savingCharge = (ChargeDetail) chargeIter.next();
			Long cID = (Long) getHibernateTemplate().save(savingCharge);

			ChargeDetail charge = (ChargeDetail) getHibernateTemplate().get(ChargeDetail.class, cID);
			assertNotNull(cID);
			assertTrue(charge.getSecurityId().equals("20081118000221"));
			assertTrue(charge.getCmsSecurityId() == 20081123000000109l);
			assertTrue((charge.getChargeType().equals("A")));
			assertNotNull(new Long(charge.getChargeDetailId()));
			assertNotNull(charge.getPriorChargeType());
			assertTrue(charge.getChargeAmount().doubleValue() == 12);
			assertTrue(charge.getSecurityRanking().intValue() == 1);
			assertNotNull(charge.getJDOLegallyChargedDate());
			assertNotNull(charge.getJDOConfirmChargedDate());

			assertTrue(charge.getPriorChargeChargee().equals("thurein"));
			assertTrue((charge.getPriorChargeAmount().equals(new Double(200))));
			assertTrue((charge.getPriorChargeType().equals("A")));

		}

		/** Stage Charge **/
		Vector stageCharges = aaMsgbody.getChargeDetail();
		Iterator stageChargeIter = stageCharges.iterator();
		while (stageChargeIter.hasNext()) {
			StagingChargeDetail savingCharge = (StagingChargeDetail) chargeIter.next();
			Long cID = (Long) getHibernateTemplate().save(savingCharge);

			StagingChargeDetail charge = (StagingChargeDetail) getHibernateTemplate().get(StagingChargeDetail.class,
					cID);
			assertNotNull(cID);
			assertTrue(charge.getSecurityId().equals("20081118000221"));
			assertTrue(charge.getCmsSecurityId() == 20081123000000109l);
			assertTrue((charge.getChargeType().equals("A")));
			assertNotNull(new Long(charge.getChargeDetailId()));
			assertNotNull(charge.getPriorChargeType());
			assertTrue(charge.getChargeAmount().doubleValue() == 12);
			assertTrue(charge.getSecurityRanking().intValue() == 1);
			assertNotNull(charge.getJDOLegallyChargedDate());
			assertNotNull(charge.getJDOConfirmChargedDate());

			assertTrue(charge.getPriorChargeChargee().equals("thurein"));
			assertTrue((charge.getPriorChargeAmount().equals(new Double(200))));
			assertTrue((charge.getPriorChargeType().equals("A")));

		}

	}
}
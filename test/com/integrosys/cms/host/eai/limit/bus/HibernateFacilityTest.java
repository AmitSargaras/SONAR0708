package com.integrosys.cms.host.eai.limit.bus;

import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.StandardCode;

/**
 * @author Chong Jun Yong
 * 
 */
public class HibernateFacilityTest extends CustomHibernateTestCase {

	protected String[] getMappingResources() {
		return new String[] { "Facility.hbm.xml", "EAI-Facility.hbm.xml" };
	}

	public void testStoreActualFacilityWithOfficerAndRelationship() {
		FacilityMaster facilityMaster = new FacilityMaster();
		facilityMaster.setLimitID(20081207000111222l);

		Long key = (Long) getHibernateTemplate().save("actualFacMaster", facilityMaster);
		facilityMaster.setId(key.longValue());

		FacilityOfficer officer = new FacilityOfficer();
		officer.setFacilityMasterId(key.longValue());

		Long officerKey = (Long) getHibernateTemplate().save("actualFacOfficer", officer);
		officer.setId(officerKey.longValue());

		FacilityRelationship rel = new FacilityRelationship();
		rel.setFacilityMasterId(key.longValue());
		rel.setGuaranteePercentage(new Double("22.33"));

		Long relKey = (Long) getHibernateTemplate().save("actualFacRelationship", rel);
		officer.setId(relKey.longValue());

		FacilityMaster storedFacilityMaster = (FacilityMaster) getHibernateTemplate().get("actualFacMaster", key);
		assertNotNull(storedFacilityMaster.getOfficerSet());
		assertEquals(1, storedFacilityMaster.getOfficerSet().size());
		assertNotNull(storedFacilityMaster.getRelationshipSet());
		assertEquals(1, storedFacilityMaster.getRelationshipSet().size());

		FacilityOfficer[] officers = (FacilityOfficer[]) storedFacilityMaster.getOfficerSet().toArray(
				new FacilityOfficer[0]);
		assertEquals(officerKey, new Long(officers[0].getId()));
		assertEquals(key, new Long(officers[0].getFacilityMasterId()));

		FacilityRelationship[] rels = (FacilityRelationship[]) storedFacilityMaster.getRelationshipSet().toArray(
				new FacilityRelationship[0]);
		assertEquals(relKey, new Long(rels[0].getId()));
		assertEquals(key, new Long(rels[0].getFacilityMasterId()));
		assertEquals(rel.getGuaranteePercentage(), rels[0].getGuaranteePercentage());
	}

	public void testStagingFacilityWithOfficerAndRelationship() {
		FacilityMaster facilityMaster = new FacilityMaster();
		facilityMaster.setLimitID(20081207000111222l);

		Long key = (Long) getHibernateTemplate().save("stageFacMaster", facilityMaster);
		facilityMaster.setId(key.longValue());

		FacilityOfficer officer = new FacilityOfficer();
		officer.setFacilityMasterId(key.longValue());

		Long officerKey = (Long) getHibernateTemplate().save("stageFacOfficer", officer);
		officer.setId(officerKey.longValue());

		FacilityRelationship rel = new FacilityRelationship();
		rel.setFacilityMasterId(key.longValue());
		rel.setGuaranteePercentage(new Double("33.44"));

		Long relKey = (Long) getHibernateTemplate().save("stageFacRelationship", rel);
		officer.setId(relKey.longValue());

		FacilityMaster storedFacilityMaster = (FacilityMaster) getHibernateTemplate().get("stageFacMaster", key);
		assertNotNull(storedFacilityMaster.getOfficerSet());
		assertEquals(1, storedFacilityMaster.getOfficerSet().size());
		assertNotNull(storedFacilityMaster.getRelationshipSet());
		assertEquals(1, storedFacilityMaster.getRelationshipSet().size());

		FacilityOfficer[] officers = (FacilityOfficer[]) storedFacilityMaster.getOfficerSet().toArray(
				new FacilityOfficer[0]);
		assertEquals(officerKey, new Long(officers[0].getId()));
		assertEquals(key, new Long(officers[0].getFacilityMasterId()));

		FacilityRelationship[] rels = (FacilityRelationship[]) storedFacilityMaster.getRelationshipSet().toArray(
				new FacilityRelationship[0]);
		assertEquals(relKey, new Long(rels[0].getId()));
		assertEquals(key, new Long(rels[0].getFacilityMasterId()));
		assertEquals(rel.getGuaranteePercentage(), rels[0].getGuaranteePercentage());
	}

	public void testStoreFacilityMessage() {
		FacilityMessage msg = new FacilityMessage();
		msg.setExpirationDate(new Date());
		msg.setMessage("I love junit test");
		msg.setMessageSeverityCode(new StandardCode("MSG_SEV", "001"));
		msg.setMessageTypeCode(new StandardCode("MSG_TYPE", "002"));
		msg.setSequenceNumber(new Long(11223));
		msg.setStatus("ACTIVE");

		Long id = (Long) getHibernateTemplate().save("actualFacMessage", msg);
		FacilityMessage storedFacMsg = (FacilityMessage) getHibernateTemplate().load("actualFacMessage", id);
		assertEquals(msg, storedFacMsg);
	}

	public void testStoreFacilityMasterWithFaclityMessagesSecDepositAndRentalRenewal() {

		FacilityMessage msg = new FacilityMessage();
		msg.setExpirationDate(new Date());
		msg.setMessage("I love junit test");
		msg.setMessageSeverityCode(new StandardCode("MSG_SEV", "001"));
		msg.setMessageTypeCode(new StandardCode("MSG_TYPE", "002"));
		msg.setSequenceNumber(new Long(11223));
		msg.setStatus("ACTIVE");

		FacilityMessage msg1 = new FacilityMessage();
		msg1.setExpirationDate(new Date());
		msg1.setMessage("I love junit test part 2");
		msg1.setMessageSeverityCode(new StandardCode("MSG_SEV", "011"));
		msg1.setMessageTypeCode(new StandardCode("MSG_TYPE", "022"));
		msg1.setSequenceNumber(new Long(11224));
		msg1.setStatus("ACTIVE");

		Set msgSet = new HashSet();
		msgSet.add(msg);
		msgSet.add(msg1);

		FacilityMaster fac = new FacilityMaster();
		fac.setLimitID(20090909000999000l);
		fac.setApprovedAmount(new Double(50000.00));
		fac.setFacilityCurrencyCode("MYR");
		fac.setApproveDate(new Date());
		fac.setApprovedBy(new StandardCode("APPROVED_BY", "SOME1"));
		fac.setJDOApplicationDate(new Date());
		fac.setOfferAcceptedDate(new Date());
		fac.setFacilityMessages(msgSet);

		Long id = (Long) getHibernateTemplate().save("actualFacMaster", fac);
		fac.setId(id.longValue());
		FacilityMaster storedFac = (FacilityMaster) getHibernateTemplate().load("actualFacMaster", id);

		assertEquals(2, storedFac.getFacilityMessages().size());
		assertTrue(storedFac.getFacilityMessages().contains(msg));
		assertTrue(storedFac.getFacilityMessages().contains(msg1));
		assertEquals(fac.getApprovedBy(), storedFac.getApprovedBy());

		FacilityIslamicSecurityDeposit dep = new FacilityIslamicSecurityDeposit();
		dep.setFixSecurityDepositAmount(new Double(55.22));
		dep.setNumberOfMonth(new Integer(7));
		dep.setOriginalSecurityDepositAmount(new Double(44.22));
		dep.setSecurityDeposit(new Double(88.22));
		dep.setStatus("ACTIVE");

		storedFac.setFacilityIslamicSecurityDeposit(dep);

		getHibernateTemplate().update("actualFacMaster", storedFac);
		storedFac = (FacilityMaster) getHibernateTemplate().load("actualFacMaster", id);

		assertEquals(dep.getFixSecurityDepositAmount(), storedFac.getFacilityIslamicSecurityDeposit()
				.getFixSecurityDepositAmount());

		FacilityIslamicRentalRenewal ren = new FacilityIslamicRentalRenewal();
		ren.setPrimeRateNumber(new StandardCode("PRIME_RATE", "001"));
		ren.setPrimeVariance(new Double(13.44));
		ren.setPrimeVarianceCode("IJRAH");
		ren.setRenewalRate(new Double(81.22));
		ren.setRenewalTerm(new Long(64));
		ren.setRenewalTermCode(new StandardCode("RENEW", "M"));
		ren.setStatus("ACTIVE");

		storedFac.setFacilityIslamicRentalRenewal(ren);

		getHibernateTemplate().update("actualFacMaster", storedFac);
		storedFac = (FacilityMaster) getHibernateTemplate().load("actualFacMaster", id);

		assertEquals(ren.getRenewalRate(), storedFac.getFacilityIslamicRentalRenewal().getRenewalRate());
	}

	public void testStoreFacilityMasterWithSingleIncrementalsAndSingleReductions() {
		Date todayDate = new Date();

		FacilityIncremental inc = new FacilityIncremental();
		inc.setAmountApplied(new Double(2233.22));
		inc.setApplicationDate(todayDate);
		inc.setApprovedBy(new StandardCode("APPROVE_BY", "ME"));
		inc.setCancelRejectCode(new StandardCode("CANCEL_REJECT", "BAD"));
		inc.setCancelRejectDate(todayDate);
		inc.setDateApproved(todayDate);
		inc.setDateOfferAccepted(todayDate);
		inc.setDateOfOffer(todayDate);
		inc.setDealerLLPCode(new StandardCode("DEALER", "001"));
		inc.setDocumentationStatus(new StandardCode("DOC_STAT", "P"));
		inc.setFacilityStatus("A");
		inc.setIncrementalLimit(new Double(1122.11));
		inc.setIncrementalNumber(new Integer(1));
		inc.setLawyerCode(new StandardCode("LAWYER", "CXC"));
		inc.setLoanPurposeCode(new StandardCode("LOAN_PURPOSE", "SHOPPING"));
		inc.setRequestReason(new StandardCode("REQ_REASON", "BAD"));
		inc.setSolicitorName("Chow Xing Chi");

		FacilityReduction dec = new FacilityReduction();
		dec.setAmountApplied(new Double(2233.22));
		dec.setApplicationDate(todayDate);
		dec.setApprovedBy(new StandardCode("APPROVE_BY", "ME"));
		dec.setCancelRejectCode(new StandardCode("CANCEL_REJECT", "BAD"));
		dec.setCancelRejectDate(todayDate);
		dec.setDateApproved(todayDate);
		dec.setDateOfferAccepted(todayDate);
		dec.setDocumentationStatus(new StandardCode("DOC_STAT", "P"));
		dec.setFacilityStatus("A");
		dec.setIncrementalLimit(new Double(1122.11));
		dec.setIncrementalNumber(new Integer(2));
		dec.setLawyerCode(new StandardCode("LAWYER", "CXC"));
		dec.setRequestReason(new StandardCode("REQ_REASON", "BAD"));
		dec.setSolicitorName("Chow Xing Chi");

		Set incSet = new HashSet();
		incSet.add(inc);
		Set decSet = new HashSet();
		decSet.add(dec);

		FacilityMaster fac = new FacilityMaster();
		fac.setLimitID(20090909000999000l);
		fac.setApprovedAmount(new Double(50000.00));
		fac.setFacilityCurrencyCode("MYR");
		fac.setApproveDate(new Date());
		fac.setApprovedBy(new StandardCode("APPROVED_BY", "SOME1"));
		fac.setJDOApplicationDate(new Date());
		fac.setOfferAcceptedDate(new Date());
		fac.setFacilityIncrementals(incSet);
		fac.setFacilityReductions(decSet);

		Long id = (Long) getHibernateTemplate().save("actualFacMaster", fac);
		fac.setId(id.longValue());
		FacilityMaster storedFac = (FacilityMaster) getHibernateTemplate().load("actualFacMaster", id);
		assertTrue(storedFac.getFacilityIncrementals().contains(inc));
		assertTrue(storedFac.getFacilityReductions().contains(dec));

		Map parameters = new WeakHashMap();
		parameters.put("limitID", new Long(20090909000999000l));

		DetachedCriteria criteria = DetachedCriteria.forEntityName("actualFacMaster");
		criteria.add(Restrictions.allEq(parameters));
		storedFac = (FacilityMaster) getHibernateTemplate().findByCriteria(criteria).get(0);

	}
}

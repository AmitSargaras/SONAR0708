package com.integrosys.cms.host.eai.limit.bus;

import java.net.URL;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.Vector;

import com.integrosys.base.techinfra.test.CustomHibernateTestCase;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.StandardCode;
import com.integrosys.cms.host.eai.castor.EAICastorHelper;
import com.integrosys.cms.host.eai.limit.AAMessageBody;

public class HibernateFacilityMasterTest extends CustomHibernateTestCase {

	private long facilityMasterID;

	protected String[] getMappingResources() {
		return new String[] { "EAI-Facility.hbm.xml" };
	}

	public void testUpdateFacilityMaster() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-aa_Master.xml");
		URL messageUrl = ctxClassLoader.getResource("CA001_AllFields.xml");
		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);
		AAMessageBody aaMsgbody = (AAMessageBody) a.getMsgBody();

		Vector limits = aaMsgbody.getLimits();
		Iterator limitIter = limits.iterator();
		while (limitIter.hasNext()) {
			Limits limit = (Limits) limitIter.next();
			FacilityMaster fm = limit.getFacilityMaster();
			fm.setFacilityBnmCodes(limit.getFacilityBNM());
			Long id = (Long) getHibernateTemplate().save("actualFacMaster", fm);
			assertNotNull(id);

			FacilityOfficer off = (FacilityOfficer) limit.getFacilityOfficer().get(0);
			assertTrue(off.getOfficerType().getStandardCodeValue().equals("F01"));
			off.setFacilityMasterId(id.longValue());
			Long off_id = (Long) getHibernateTemplate().save("actualFacOfficer", off);
			assertNotNull(off_id);

			FacilityRelationship rel = (FacilityRelationship) limit.getFacilityRelationship().get(0);
			rel.setFacilityMasterId(id.longValue());
			Long rel_id = (Long) getHibernateTemplate().save("actualFacRelationship", rel);
			assertNotNull(rel_id);

			FacilityMaster master = (FacilityMaster) getHibernateTemplate().get("actualFacMaster", id);

			assertTrue(master.getOfficerSet().size() == 1);
			assertTrue(master.getRelationshipSet().size() == 1);
			Set savedOfficerSet = master.getOfficerSet();
			Iterator iter = savedOfficerSet.iterator();
			while (iter.hasNext()) {
				FacilityOfficer savedOfficer = (FacilityOfficer) iter.next();
				assertTrue(savedOfficer.getId() == off_id.longValue());

				savedOfficer.getOfficerType().setStandardCodeValue("trwh");
			}

			FacilityOfficer officerNew = new FacilityOfficer();
			officerNew.setFacilityMasterId(id.longValue());
			savedOfficerSet.add(officerNew);
			getHibernateTemplate().update("actualFacMaster", master);
			FacilityMaster updatedmaster = (FacilityMaster) getHibernateTemplate().get("actualFacMaster", id);
			assertTrue(updatedmaster.getOfficerSet().size() == 2);
			System.out.println(updatedmaster.getOfficerSet().size());

			Set updatedOfficerSet = updatedmaster.getOfficerSet();
			Iterator iterUpdate = updatedOfficerSet.iterator();
			while (iterUpdate.hasNext()) {
				FacilityOfficer updatedOfficer = (FacilityOfficer) iterUpdate.next();
				System.out.println("updated officer id - " + updatedOfficer.getCMSOfficerId());
				System.out.println("updated officer id -> " + updatedOfficer.getCMSOfficerId());
				// assertTrue(updatedOfficer.getId() == off_id.longValue());

				// savedOfficer.getOfficerType().setStandardCodeValue("trwh");
			}

			/*
			 * Set updatedOfficerSet = new HashSet(); updatedOfficerSet =
			 * updatedmaster.getOfficerSet(); Iterator u_iter =
			 * updatedOfficerSet.iterator(); while(u_iter.hasNext()) {
			 * FacilityOfficer updatedOfficer =(FacilityOfficer) iter.next();
			 * System.out.println("officer id - "+ updatedOfficer.getId()); }
			 */

		}

	}

	public void testActualFacilityMaster() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-aa_Master.xml");
		URL messageUrl = ctxClassLoader.getResource("CA001_AllFields.xml");
		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);
		AAMessageBody aaMsgbody = (AAMessageBody) a.getMsgBody();

		Vector limits = aaMsgbody.getLimits();
		Iterator limitIter = limits.iterator();
		while (limitIter.hasNext()) {
			Limits limit = (Limits) limitIter.next();
			FacilityMaster fm = limit.getFacilityMaster();
			fm.setFacilityBnmCodes(limit.getFacilityBNM());
			fm.setIslamicFacilityMaster(limit.getIslamicFacilityMaster());
			fm.setFacilityBBAVariPackage(limit.getFacilityBBAVariPackage());

			Set officerSet = new HashSet();
			officerSet.add(limit.getFacilityOfficer().get(0));

			Set relSet = new HashSet();
			relSet.add(limit.getFacilityRelationship().get(0));

			Set multiTierSet = new HashSet();
			multiTierSet.add(limit.getFacilityMultiTierFinancings());

			Long id = (Long) getHibernateTemplate().save("actualFacMaster", fm);
			facilityMasterID = id.longValue();
			System.out.println("fac id  - " + id.longValue());
			FacilityMaster master = (FacilityMaster) getHibernateTemplate().get("actualFacMaster", id);

			/** Facility Master Test **/
			assertNotNull(master.getFinancedAmt());
			assertTrue((master.getFinancedAmt().doubleValue() == 10.88));
			assertNotNull(master.getInstallmentAmt());
			assertTrue((master.getInstallmentAmt().doubleValue() == 10.22));
			assertTrue(master.getACFNo().equals("1000"));
			assertNotNull(master.getLoanPurposeCode().getStandardCodeNumber());
			assertNotNull(master.getLoanPurposeCode().getStandardCodeValue());
			assertNotNull(master.getProductPackageCode().getStandardCodeNumber());
			assertNotNull(master.getProductPackageCode().getStandardCodeValue());
			assertNotNull(master.getJDOOfferAcceptedDate());
			assertNotNull(master.getJDOOfferDate());
			assertNotNull(master.getApprovedBy().getStandardCodeNumber());
			assertNotNull(master.getApprovedBy().getStandardCodeValue());
			assertNotNull(master.getJDOApproveDate());
			assertNotNull(master.getCancelRejectCode().getStandardCodeNumber());
			assertNotNull(master.getCancelRejectCode().getStandardCodeValue());
			assertNotNull(master.getJDOCancelRejectDate());
			assertNotNull(master.getOfficer().getStandardCodeNumber());
			assertNotNull(master.getOfficer().getStandardCodeValue());
			assertNotNull(master.getLimitStatus().getStandardCodeNumber());
			assertNotNull(master.getLimitStatus().getStandardCodeValue());
			assertNotNull(master.getFacilityStatusEntryCode());
			assertTrue(master.getFacilityStatusEntryCode().equals("good"));
			assertTrue((master.getSpread().doubleValue() == 6));
			assertNotNull(master.getRateType().getStandardCodeNumber());
			assertNotNull(master.getRateType().getStandardCodeValue());
			assertTrue(master.getSpreadSign().equals("+"));
			assertNotNull(master.getApplicationSource().getStandardCodeNumber());
			assertNotNull(master.getApplicationSource().getStandardCodeValue());
			assertNotNull(master.getDealerLPPCode().getStandardCodeNumber());
			assertNotNull(master.getDealerLPPCode().getStandardCodeValue());
			assertNotNull(master.getJDOInstructedDate());
			System.out.println("---" + master.getJDOInstructedDate());
			assertNotNull(master.getDepartmentCode().getStandardCodeNumber());
			assertNotNull(master.getDepartmentCode().getStandardCodeValue());
			assertNotNull(master.getSolicitorName());
			assertTrue(master.getSolicitorName().equals("thurein"));
			assertNotNull(master.getLawyerCode().getStandardCodeNumber());
			assertNotNull(master.getLawyerCode().getStandardCodeValue());
			assertNotNull(master.getOdExcessRateVarCode());
			assertTrue((master.getOdExcessRateVar().doubleValue() > 0));
			assertTrue((master.getMainFacilityInd().equals("Y")));
			assertNotNull(master.getMainFacilityAANo());
			assertNotNull(master.getMainFacilityCode());
			assertTrue((master.getMainFacilitySequenceNumber().longValue() > 0));
			assertTrue((master.getStandbyLine().equals("Y")));
			assertTrue((master.getFloorPledgeLimit().doubleValue() > 0));
			assertNotNull(master.getJDOApplicationDate());
			assertTrue(master.getInterestRate().doubleValue() == 12.654);
			assertTrue(master.getFinalPaymentAmt().doubleValue() == 12.22);
			assertTrue(master.getPrimeRateFloor().doubleValue() == 23.23);
			assertTrue(master.getPrimeRateCeiling().doubleValue() == 12.12);
			assertNotNull(master.getPrimeReviewDate());
			assertTrue(master.getPrimeReviewTerm().intValue() == 1234);
			assertNotNull(master.getPrimeReviewTermCode());
			assertTrue(master.getCommissionFees().doubleValue() == 22.22);
			assertTrue(master.getCommissionRate().doubleValue() == 3.55555);
			assertNotNull(master.getCommissionBasis());
			assertTrue(master.getSubsidyAmt().doubleValue() == 33.33);
			assertTrue(master.getOthersFee().doubleValue() == 44.44);
			assertTrue(master.getMaximumCommission().doubleValue() == 99999);
			assertTrue(master.getMinimumCommission().doubleValue() == 0.7);
			assertNotNull(master.getStandbyLineFacCode());
			assertTrue(master.getStandbyLineFacCodeSeq().longValue() == 12);
			// assertTrue(master.getFacCommitmentRate()== 11.2) ;
			// assertNotNull(master.getFacCommitmentRateNo() );
			assertTrue(master.getRevolvingInd().equals("Y"));
			assertTrue(master.getRevOSBalOrgAmt().equals("Y"));
			assertTrue(master.getRetentionSum().doubleValue() == 231);
			assertTrue(master.getRetentionPeriod().intValue() == 3);
			assertNotNull(master.getDateApproveCGCBNM());
			assertTrue(master.getEffectiveCostOfFund().equals("Y"));
			assertTrue(master.getECOFAdminCost().doubleValue() == 22.22);
			assertTrue(master.getECOFRate().doubleValue() == 1.982);
			assertTrue(master.getECOFVariance().doubleValue() == 7.9999);
			assertTrue(master.getECOFVarianceCode().equals("1"));
			assertNotNull(master.getFacAvalDate());
			assertTrue(master.getFacAvalPeriod().equals("43"));
			assertNotNull(master.getRefinanceFromBank());

			/*** Facility BNM Test */
			FacilityBNM facilityBNM = master.getFacilityBnmCodes();
			assertNotNull(facilityBNM.getBNMIndustryCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMIndustryCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMSectorCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMSectorCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMStateCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMStateCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMBumiNRCCCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMBumiNRCCCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMSmallScaleCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMSmallScaleCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMPrescribedRateCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMPrescribedRateCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMRelationshipCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMRelationshipCode().getStandardCodeValue());
			assertTrue((facilityBNM.getBNMExempt().equals("N")));
			assertNotNull(facilityBNM.getBNMExemptCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMExemptCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMPurposeCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMPurposeCode().getStandardCodeValue());
			assertTrue(facilityBNM.getBNMIndustryCode().getStandardCodeValue().equals("9700"));
			assertTrue(facilityBNM.getBNMSectorCode().getStandardCodeValue().equals("96"));
			assertTrue(facilityBNM.getBNMStateCode().getStandardCodeValue().equals("B"));
			assertTrue(facilityBNM.getBNMBumiNRCCCode().getStandardCodeValue().equals("0"));
			assertTrue(facilityBNM.getBNMSmallScaleCode().getStandardCodeValue().equals("1"));
			assertTrue(facilityBNM.getBNMPrescribedRateCode().getStandardCodeValue().equals("75"));
			assertTrue(facilityBNM.getBNMRelationshipCode().getStandardCodeValue().equals("1"));
			assertTrue((facilityBNM.getBNMExempt().equals("N")));
			assertTrue(facilityBNM.getBNMExemptCode().getStandardCodeValue().equals("P1B"));
			assertTrue(facilityBNM.getBNMPurposeCode().getStandardCodeValue().equals("0324"));
			assertNotNull(facilityBNM.getBNMGoodFinancedCd1().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMGoodFinancedCd2().getStandardCodeValue());
			assertTrue(facilityBNM.getBNMGoodFinancedCd1().getStandardCodeNumber().equals("BNM_GOOD_FINANCE_1"));
			assertTrue(facilityBNM.getBNMGoodFinancedCd1().getStandardCodeValue().equals("g1"));
			assertTrue(facilityBNM.getBNMGoodFinancedCd2().getStandardCodeNumber().equals("BNM_GOOD_FINANCE_2"));
			assertTrue(facilityBNM.getBNMGoodFinancedCd2().getStandardCodeValue().equals("g2"));

			IslamicFacilityMaster iMaster = master.getIslamicFacilityMaster();
			assertNotNull(iMaster);
			assertTrue(iMaster.getGPPTerm().intValue() == 3);
			assertTrue(iMaster.getGPPTermCode().equals("E"));
			assertTrue(iMaster.getGPPPaymentMode().equals("N"));
			assertTrue(iMaster.getCustomerInterestRate().doubleValue() == 112.453);
			assertTrue(iMaster.getGPPCalcMethod().equals("Y"));
			assertTrue(iMaster.getCompoundingMethod().equals("Y"));
			assertTrue(iMaster.getDateStopCompounding().equals("20081111"));
			assertTrue(iMaster.getFulrelProfitCalMehod().equals("F"));
			assertTrue(iMaster.getRefundGppProfit().equals("P"));
			assertTrue(iMaster.getRefundFulRelProfit().equals("P"));
			assertTrue(iMaster.getExcCMPInPMTAMT().equals("Y"));

			FacilityBBAVariPackage bbaPackage = master.getFacilityBBAVariPackage();
			assertNotNull(bbaPackage);
			System.out.println(">>" + bbaPackage.getCustProfRate());
			assertTrue(bbaPackage.getCustProfRate().doubleValue() == 99.08);
			assertTrue(bbaPackage.getRebateMethod().equals("E"));
			assertTrue(bbaPackage.getGPPPaymentMode().equals("Y"));
			assertTrue(bbaPackage.getGPPCalcMethod().equals("A"));
			assertTrue(bbaPackage.getGPPTerm().intValue() == 6);
			assertTrue(bbaPackage.getGPPTermCode().equals("T"));
			assertTrue(bbaPackage.getFullReleaseProfit().equals("N"));
			assertTrue(bbaPackage.getRefundFullReleaseProfit().equals("P"));
			assertTrue(bbaPackage.getFullReleaseProfitCalcMethod().equals("F"));
			assertTrue(bbaPackage.getInstallment().doubleValue() == 224.81);
			assertTrue(bbaPackage.getFinalPaymentAmt().doubleValue() == 4.35);

			FacilityMultiTierFinancing multi = new FacilityMultiTierFinancing();
			multi.setRate(new Double(334.7));
			multi.setTierSeqNo(new Integer(1));
			multi.setTierTerm(new Integer(7));
			StandardCode tierTermCode = new StandardCode();
			tierTermCode.setStandardCodeValue("555");
			multi.setTierTermCode(tierTermCode);
			multi.setRefID(1l);
			multi.setFacilityMasterId(2l);
			System.out.println("**********");
			Long multiId = (Long) getHibernateTemplate().save("actualFacilityMultiTierFinancing", multi);
			System.out.println("**********" + multiId);
			FacilityMultiTierFinancing multiTier = (FacilityMultiTierFinancing) getHibernateTemplate().get(
					"actualFacilityMultiTierFinancing", multiId);

			assertNotNull(multiTier);
			assertTrue(multiTier.getTierTerm().intValue() == 7);
			assertTrue(multiTier.getTierSeqNo().intValue() == 1);
			assertNotNull(multiTier.getTierTermCode());
			assertTrue(multiTier.getRate().doubleValue() == 334.7);

			/** Facility Relationship **/
			FacilityRelationship rel = new FacilityRelationship();
			rel.setFacilityMasterId(facilityMasterID);
			rel.setCIFId("20081118000368");
			StandardCode relAccountCode = new StandardCode();
			relAccountCode.setStandardCodeNumber("RELATIONSHIP");
			relAccountCode.setStandardCodeValue("AB");
			rel.setAccountRelationship(relAccountCode);
			rel.setAddressSeqNum(new Long(343));
			rel.setGuaranteeAmt(new Double(1222));
			rel.setCustomerName("thurein");
			rel.setMainProfileID(new Long(20081118000999l));
			rel.setShareHolderPercentage(new Double(0.9));
			rel.setReceiveMailCode("Y");
			rel.setNameAssociatedWFacOrder(new Integer(1));
			rel.setNameConjunctionPosition("N");
			rel.setNameConjunction("ccjj");
			rel.setProfitRatio(new Double(12.44444));
			rel.setDividendRatio(new Double(43.11112));

			Long rel_id = (Long) getHibernateTemplate().save("actualFacRelationship", rel);
			FacilityRelationship relation = (FacilityRelationship) getHibernateTemplate().get("actualFacRelationship",
					rel_id);

			assertNotNull(rel_id);
			assertTrue(relation.getFacilityMasterId() == facilityMasterID);
			assertTrue(relation.getCIFId().equals("20081118000368"));
			assertNotNull(relation.getAccountRelationship().getStandardCodeNumber());
			assertNotNull(relation.getAccountRelationship().getStandardCodeValue());
			assertNotNull(relation.getAddressSeqNum());
			assertTrue(relation.getGuaranteeAmt().doubleValue() > 0);
			assertTrue(relation.getAddressSeqNum().longValue() > 0);
			assertTrue(relation.getGuaranteeAmt().doubleValue() == 1222);
			assertTrue(relation.getAddressSeqNum().longValue() == 343);
			assertTrue(relation.getMainProfileID().longValue() == 20081118000999l);
			assertTrue(relation.getCustomerName().equals("thurein"));
			System.out.println("===>" + relation.getCustomerName());
			assertTrue(relation.getShareHolderPercentage().doubleValue() == 0.9);
			assertTrue(relation.getReceiveMailCode().equals("Y"));
			assertTrue(relation.getNameAssociatedWFacOrder().intValue() == 1);
			assertTrue(relation.getNameConjunctionPosition().equals("N"));
			assertTrue(relation.getNameConjunction().equals("ccjj"));
			assertTrue(relation.getProfitRatio().doubleValue() == 12.44444);
			assertTrue(relation.getDividendRatio().doubleValue() == 43.11112);

			/** Officer Test **/
			FacilityOfficer off = new FacilityOfficer();
			off.setFacilityMasterId(facilityMasterID);
			StandardCode relaCode = new StandardCode();
			relaCode.setStandardCodeNumber("OFFICER_RELATIONSHIP");
			relaCode.setStandardCodeValue("BR");
			StandardCode officerCode = new StandardCode();
			officerCode.setStandardCodeNumber("OFFICER");
			officerCode.setStandardCodeValue("000001");
			StandardCode typeCode = new StandardCode();
			typeCode.setStandardCodeNumber("OFFICER_TYPE");
			typeCode.setStandardCodeValue("F01");
			off.setRelationshipCode(relaCode);
			off.setOfficer(officerCode);
			off.setOfficerType(typeCode);

			Long off_id = (Long) getHibernateTemplate().save("actualFacOfficer", off);
			FacilityOfficer officer = (FacilityOfficer) getHibernateTemplate().get("actualFacOfficer", off_id);

			assertTrue(officer.getFacilityMasterId() == facilityMasterID);
			assertNotNull(officer.getRelationshipCode().getStandardCodeNumber());
			assertNotNull(officer.getRelationshipCode().getStandardCodeValue());
			assertNotNull(officer.getOfficer().getStandardCodeNumber());
			assertNotNull(officer.getOfficer().getStandardCodeValue());
			assertNotNull(officer.getOfficerType().getStandardCodeNumber());
			assertNotNull(officer.getOfficerType().getStandardCodeValue());
			assertTrue(officer.getRelationshipCode().getStandardCodeValue().equals("BR"));
			assertTrue(officer.getOfficer().getStandardCodeValue().equals("000001"));
			assertTrue(officer.getOfficerType().getStandardCodeValue().equals("F01"));
		}

	}

	public void testStageFacilityMaster() {
		System.out.println("*** Testing Stage Facility Master ***");
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-aa_Master.xml");
		URL messageUrl = ctxClassLoader.getResource("CA001_AllFields.xml");
		EAICastorHelper castorHelper = EAICastorHelper.getInstance();
		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);
		AAMessageBody aaMsgbody = (AAMessageBody) a.getMsgBody();

		Vector limits = aaMsgbody.getLimits();
		Iterator limitIter = limits.iterator();
		while (limitIter.hasNext()) {
			Limits limit = (Limits) limitIter.next();
			FacilityMaster fm = limit.getFacilityMaster();
			fm.setFacilityBnmCodes(limit.getFacilityBNM());
			fm.setIslamicFacilityMaster(limit.getIslamicFacilityMaster());
			fm.setFacilityBBAVariPackage(limit.getFacilityBBAVariPackage());

			Set multiTierSet = new HashSet();
			multiTierSet.add(limit.getFacilityMultiTierFinancings());

			Set officerSet = new HashSet();
			officerSet.add(limit.getFacilityOfficer().get(0));

			Set relSet = new HashSet();
			relSet.add(limit.getFacilityRelationship().get(0));

			Long id = (Long) getHibernateTemplate().save("stageFacMaster", fm);
			facilityMasterID = id.longValue();
			System.out.println("stage fac id  - " + id.longValue());
			FacilityMaster master = (FacilityMaster) getHibernateTemplate().get("stageFacMaster", id);

			/** Facility Master Test **/
			assertNotNull(master.getFinancedAmt());
			assertTrue((master.getFinancedAmt().doubleValue() == 10.88));
			assertNotNull(master.getInstallmentAmt());
			assertTrue((master.getInstallmentAmt().doubleValue() == 10.22));
			assertTrue(master.getACFNo().equals("1000"));
			assertNotNull(master.getLoanPurposeCode().getStandardCodeNumber());
			assertNotNull(master.getLoanPurposeCode().getStandardCodeValue());
			assertNotNull(master.getProductPackageCode().getStandardCodeNumber());
			assertNotNull(master.getProductPackageCode().getStandardCodeValue());
			assertNotNull(master.getJDOOfferAcceptedDate());
			assertNotNull(master.getJDOOfferDate());
			assertNotNull(master.getApprovedBy().getStandardCodeNumber());
			assertNotNull(master.getApprovedBy().getStandardCodeValue());
			assertNotNull(master.getJDOApproveDate());
			assertNotNull(master.getCancelRejectCode().getStandardCodeNumber());
			assertNotNull(master.getCancelRejectCode().getStandardCodeValue());
			assertNotNull(master.getJDOCancelRejectDate());
			assertNotNull(master.getOfficer().getStandardCodeNumber());
			assertNotNull(master.getOfficer().getStandardCodeValue());
			assertNotNull(master.getLimitStatus().getStandardCodeNumber());
			assertNotNull(master.getLimitStatus().getStandardCodeValue());
			assertNotNull(master.getFacilityStatusEntryCode());
			assertTrue(master.getFacilityStatusEntryCode().equals("good"));
			assertTrue((master.getSpread().doubleValue() == 6));
			assertNotNull(master.getRateType().getStandardCodeNumber());
			assertNotNull(master.getRateType().getStandardCodeValue());
			assertTrue(master.getSpreadSign().equals("+"));
			assertNotNull(master.getApplicationSource().getStandardCodeNumber());
			assertNotNull(master.getApplicationSource().getStandardCodeValue());
			assertNotNull(master.getDealerLPPCode().getStandardCodeNumber());
			assertNotNull(master.getDealerLPPCode().getStandardCodeValue());
			assertNotNull(master.getJDOInstructedDate());
			System.out.println("---" + master.getJDOInstructedDate());
			assertNotNull(master.getDepartmentCode().getStandardCodeNumber());
			assertNotNull(master.getDepartmentCode().getStandardCodeValue());
			assertNotNull(master.getSolicitorName());
			assertTrue(master.getSolicitorName().equals("thurein"));
			assertNotNull(master.getLawyerCode().getStandardCodeNumber());
			assertNotNull(master.getLawyerCode().getStandardCodeValue());
			assertNotNull(master.getOdExcessRateVarCode());
			assertTrue((master.getOdExcessRateVar().doubleValue() > 0));
			assertTrue((master.getMainFacilityInd().equals("Y")));
			assertNotNull(master.getMainFacilityAANo());
			assertNotNull(master.getMainFacilityCode());
			assertTrue((master.getMainFacilitySequenceNumber().longValue() > 0));
			assertTrue((master.getStandbyLine().equals("Y")));
			assertTrue((master.getFloorPledgeLimit().doubleValue() > 0));
			assertNotNull(master.getJDOApplicationDate());
			assertTrue(master.getInterestRate().doubleValue() == 12.654);

			/*** Facility BNM Test */
			FacilityBNM facilityBNM = master.getFacilityBnmCodes();
			assertNotNull(facilityBNM.getBNMIndustryCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMIndustryCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMSectorCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMSectorCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMStateCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMStateCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMBumiNRCCCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMBumiNRCCCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMSmallScaleCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMSmallScaleCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMPrescribedRateCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMPrescribedRateCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMRelationshipCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMRelationshipCode().getStandardCodeValue());
			assertTrue((facilityBNM.getBNMExempt().equals("N")));
			assertNotNull(facilityBNM.getBNMExemptCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMExemptCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMPurposeCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMPurposeCode().getStandardCodeValue());

			assertTrue(facilityBNM.getBNMIndustryCode().getStandardCodeValue().equals("9700"));
			assertTrue(facilityBNM.getBNMSectorCode().getStandardCodeValue().equals("96"));
			assertTrue(facilityBNM.getBNMStateCode().getStandardCodeValue().equals("B"));
			assertTrue(facilityBNM.getBNMBumiNRCCCode().getStandardCodeValue().equals("0"));
			assertTrue(facilityBNM.getBNMSmallScaleCode().getStandardCodeValue().equals("1"));
			assertTrue(facilityBNM.getBNMPrescribedRateCode().getStandardCodeValue().equals("75"));
			assertTrue(facilityBNM.getBNMRelationshipCode().getStandardCodeValue().equals("1"));
			assertTrue((facilityBNM.getBNMExempt().equals("N")));
			assertTrue(facilityBNM.getBNMExemptCode().getStandardCodeValue().equals("P1B"));
			assertTrue(facilityBNM.getBNMPurposeCode().getStandardCodeValue().equals("0324"));

			IslamicFacilityMaster iMaster = master.getIslamicFacilityMaster();
			assertNotNull(iMaster);
			assertTrue(iMaster.getGPPTerm().intValue() == 3);
			assertTrue(iMaster.getGPPTermCode().equals("E"));
			assertTrue(iMaster.getGPPPaymentMode().equals("N"));
			assertTrue(iMaster.getCustomerInterestRate().doubleValue() == 112.453);
			assertTrue(iMaster.getGPPCalcMethod().equals("Y"));
			assertTrue(iMaster.getCompoundingMethod().equals("Y"));
			assertTrue(iMaster.getDateStopCompounding().equals("20081111"));
			assertTrue(iMaster.getFulrelProfitCalMehod().equals("F"));
			assertTrue(iMaster.getRefundGppProfit().equals("P"));
			assertTrue(iMaster.getRefundFulRelProfit().equals("P"));
			assertTrue(iMaster.getExcCMPInPMTAMT().equals("Y"));

			FacilityBBAVariPackage bbaPackage = master.getFacilityBBAVariPackage();
			assertNotNull(bbaPackage);
			System.out.println(">>" + bbaPackage.getCustProfRate());
			assertNotNull(bbaPackage.getCustProfRate());
			assertTrue(bbaPackage.getRebateMethod().equals("E"));
			assertTrue(bbaPackage.getGPPPaymentMode().equals("Y"));
			assertTrue(bbaPackage.getGPPCalcMethod().equals("A"));
			assertTrue(bbaPackage.getGPPTerm().intValue() == 6);
			assertTrue(bbaPackage.getGPPTermCode().equals("T"));
			assertTrue(bbaPackage.getFullReleaseProfit().equals("N"));
			assertTrue(bbaPackage.getRefundFullReleaseProfit().equals("P"));
			assertTrue(bbaPackage.getFullReleaseProfitCalcMethod().equals("F"));
			assertTrue(bbaPackage.getInstallment().doubleValue() == 224.81);
			assertTrue(bbaPackage.getFinalPaymentAmt().doubleValue() == 4.35);

			FacilityMultiTierFinancing multi = new FacilityMultiTierFinancing();
			multi.setRate(new Double(334.7));
			multi.setTierSeqNo(new Integer(1));
			multi.setTierTerm(new Integer(7));
			StandardCode tierTermCode = new StandardCode();
			tierTermCode.setStandardCodeValue("555");
			multi.setTierTermCode(tierTermCode);

			Long multiId = (Long) getHibernateTemplate().save("stageFacilityMultiTierFinancing", multi);
			FacilityMultiTierFinancing multiTier = (FacilityMultiTierFinancing) getHibernateTemplate().get(
					"stageFacilityMultiTierFinancing", multiId);

			assertNotNull(multiTier);
			assertTrue(multiTier.getTierTerm().intValue() == 7);
			assertTrue(multiTier.getTierSeqNo().intValue() == 1);
			assertNotNull(multiTier.getTierTermCode());
			assertTrue(multiTier.getRate().doubleValue() == 334.7);

			/** Facility Relationship **/
			FacilityRelationship rel = new FacilityRelationship();
			rel.setFacilityMasterId(facilityMasterID);
			rel.setCIFId("20081118000368");
			StandardCode relAccountCode = new StandardCode();
			relAccountCode.setStandardCodeNumber("RELATIONSHIP");
			relAccountCode.setStandardCodeValue("AB");
			rel.setAccountRelationship(relAccountCode);
			rel.setAddressSeqNum(new Long(343));
			rel.setGuaranteeAmt(new Double(1222));
			rel.setCustomerName("thurein");
			rel.setMainProfileID(new Long(20081118000999l));
			Long rel_id = (Long) getHibernateTemplate().save("stageFacRelationship", rel);
			FacilityRelationship relation = (FacilityRelationship) getHibernateTemplate().get("stageFacRelationship",
					rel_id);

			assertNotNull(rel_id);
			assertTrue(relation.getFacilityMasterId() == facilityMasterID);
			assertTrue(relation.getCIFId().equals("20081118000368"));
			assertNotNull(relation.getAccountRelationship().getStandardCodeNumber());
			assertNotNull(relation.getAccountRelationship().getStandardCodeValue());
			assertNotNull(relation.getAddressSeqNum());
			assertTrue(relation.getGuaranteeAmt().doubleValue() > 0);
			assertTrue(relation.getAddressSeqNum().longValue() > 0);
			assertTrue(relation.getGuaranteeAmt().doubleValue() == 1222);
			assertTrue(relation.getAddressSeqNum().longValue() == 343);
			assertTrue(relation.getMainProfileID().longValue() == 20081118000999l);
			assertTrue(relation.getCustomerName().equals("thurein"));

			/** Officer Test **/
			FacilityOfficer off = new FacilityOfficer();
			off.setFacilityMasterId(facilityMasterID);
			StandardCode relaCode = new StandardCode();
			relaCode.setStandardCodeNumber("OFFICER_RELATIONSHIP");
			relaCode.setStandardCodeValue("BR");
			StandardCode officerCode = new StandardCode();
			officerCode.setStandardCodeNumber("OFFICER");
			officerCode.setStandardCodeValue("000001");
			StandardCode typeCode = new StandardCode();
			typeCode.setStandardCodeNumber("OFFICER_TYPE");
			typeCode.setStandardCodeValue("F01");
			off.setRelationshipCode(relaCode);
			off.setOfficer(officerCode);
			off.setOfficerType(typeCode);

			Long off_id = (Long) getHibernateTemplate().save("stageFacOfficer", off);
			FacilityOfficer officer = (FacilityOfficer) getHibernateTemplate().get("stageFacOfficer", off_id);

			assertTrue(officer.getFacilityMasterId() == facilityMasterID);
			assertNotNull(officer.getRelationshipCode().getStandardCodeNumber());
			assertNotNull(officer.getRelationshipCode().getStandardCodeValue());
			assertNotNull(officer.getOfficer().getStandardCodeNumber());
			assertNotNull(officer.getOfficer().getStandardCodeValue());
			assertNotNull(officer.getOfficerType().getStandardCodeNumber());
			assertNotNull(officer.getOfficerType().getStandardCodeValue());
			assertTrue(officer.getRelationshipCode().getStandardCodeValue().equals("BR"));
			assertTrue(officer.getOfficer().getStandardCodeValue().equals("000001"));
			assertTrue(officer.getOfficerType().getStandardCodeValue().equals("F01"));

		}

	}

}

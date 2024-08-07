package com.integrosys.cms.host.eai.castor;

import java.net.URL;
import java.util.Iterator;
import java.util.Vector;

import junit.framework.TestCase;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.host.eai.EAIMessage;
import com.integrosys.cms.host.eai.limit.AAMessageBody;
import com.integrosys.cms.host.eai.limit.bus.ChargeDetail;
import com.integrosys.cms.host.eai.limit.bus.FacilityBBAVariPackage;
import com.integrosys.cms.host.eai.limit.bus.FacilityBNM;
import com.integrosys.cms.host.eai.limit.bus.FacilityMaster;
import com.integrosys.cms.host.eai.limit.bus.FacilityMultiTierFinancing;
import com.integrosys.cms.host.eai.limit.bus.FacilityOfficer;
import com.integrosys.cms.host.eai.limit.bus.FacilityRelationship;
import com.integrosys.cms.host.eai.limit.bus.IslamicFacilityMaster;
import com.integrosys.cms.host.eai.limit.bus.JointBorrower;
import com.integrosys.cms.host.eai.limit.bus.LimitCreditGrade;
import com.integrosys.cms.host.eai.limit.bus.LimitGeneral;
import com.integrosys.cms.host.eai.limit.bus.LimitProfile;
import com.integrosys.cms.host.eai.limit.bus.Limits;

/**
 * 
 * @author Thurein
 * @since 12-Nov-2008
 * 
 */
public class EAIlimitCastorMappingTest extends TestCase {
	public void setUp() {
		Log4jConfigTestPlugin.configure();
	}

	public void testUnmarshallLimitAllFieldsMapping() {
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		/**
		 * Test to make sure all the fields are mapped(Unmarshalled) to object
		 * EaiMapping-collateral_Master.xml CA001_AllFields.xml
		 */
		URL mappingUrl = ctxClassLoader.getResource("EaiMapping-aa_Master.xml");

		URL messageUrl = ctxClassLoader.getResource("CA001_AllFields.xml");

		EAICastorHelper castorHelper = EAICastorHelper.getInstance();

		EAIMessage a = (EAIMessage) castorHelper.unmarshal(mappingUrl, messageUrl, EAIMessage.class);
		assertNotNull(a);

		AAMessageBody aaMsgbody = (AAMessageBody) a.getMsgBody();
		assertNotNull(aaMsgbody);

		LimitProfile lmtProfile = aaMsgbody.getLimitProfile();
		assertNotNull(lmtProfile);
		/** Limit profile testing **/
		assertNotNull(lmtProfile.getCIFId());
		assertNotNull(lmtProfile.getCIFSource());
		assertTrue((lmtProfile.getSubProfileId() > 0));
		assertNotNull(lmtProfile.getLOSAANumber());
		assertNotNull(lmtProfile.getOldLOSAANumber());
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
		assertNotNull(lmtProfile.getUpdateStatusIndicator());
		assertNotNull(lmtProfile.getChangeIndicator());

		/** CreditGrade testing **/
		Vector creditGrades = aaMsgbody.getCreditGrade();
		Iterator creGradeIter = creditGrades.iterator();
		while (creGradeIter.hasNext()) {
			LimitCreditGrade creditGrade = (LimitCreditGrade) creGradeIter.next();
			assertNotNull(creditGrade.getLOSAANumber());
			assertNotNull(creditGrade.getCreditGradeType().getStandardCodeNumber());
			assertNotNull(creditGrade.getCreditGradeType().getStandardCodeValue());
			assertNotNull(creditGrade.getCreditGradeCode().getStandardCodeNumber());
			assertNotNull(creditGrade.getCreditGradeCode().getStandardCodeValue());
			assertNotNull(creditGrade.getCreditGradeEffectiveDate());
			assertNotNull(creditGrade.getCreditGradeReasonForChange());
		}

		/** Joint Borrower Test **/
		Vector jointBorrowers = aaMsgbody.getJointBorrower();
		Iterator jointBorrowerIter = jointBorrowers.iterator();
		while (jointBorrowerIter.hasNext()) {
			JointBorrower jointBorrower = (JointBorrower) jointBorrowerIter.next();
			assertNotNull(jointBorrower.getCIFId());
			assertTrue((jointBorrower.getSubProfileId() > 0));
			assertNotNull(jointBorrower.getAANumber());
			assertTrue((jointBorrower.getUpdateStatusIndicator().equals("I")));
			assertTrue((jointBorrower.getChangeIndicator().equals("Y")));
		}

		/** Limit Test **/
		Vector limits = aaMsgbody.getLimits();
		Iterator limitIter = limits.iterator();
		while (limitIter.hasNext()) {
			Limits limit = (Limits) limitIter.next();
			LimitGeneral lmtGeneral = limit.getLimitGeneral();
			assertNotNull(lmtGeneral.getCIFId());
			assertTrue((lmtGeneral.getSubProfileId() > 0));
			assertNotNull(lmtGeneral.getLOSAANumber());
			assertNotNull(lmtGeneral.getLOSLimitId());
			assertTrue((lmtGeneral.getCMSLimitId() > 0));
			assertNotNull(lmtGeneral.getLOSOuterLimitId());
			assertTrue((lmtGeneral.getCMSOuterLimitId().longValue() > 0));
			assertNotNull(lmtGeneral.getOriginatingBookingLocation().getOriginatingLocationOrganisation());
			assertNotNull(lmtGeneral.getOriginatingBookingLocation().getOriginatingLocationCountry());
			assertNotNull(lmtGeneral.getProductType().getStandardCodeNumber());
			assertNotNull(lmtGeneral.getProductType().getStandardCodeValue());
			assertNotNull(lmtGeneral.getFacilityType().getStandardCodeNumber());
			assertNotNull(lmtGeneral.getFacilityType().getStandardCodeValue());
			assertNotNull(lmtGeneral.getLimitCurrency());
			assertTrue((lmtGeneral.getApprovedLimit().doubleValue() > 0));
			assertTrue((lmtGeneral.getDrawingLimit().doubleValue() > 0));
			assertNotNull(lmtGeneral.getFacilityType().getStandardCodeNumber());
			assertNotNull(lmtGeneral.getFacilityType().getStandardCodeValue());
			assertTrue((lmtGeneral.getUpdateStatusIndicator().equals("I")));
			assertTrue((lmtGeneral.getChangeIndicator().equals("Y")));

			/** Facility Master Test **/
			FacilityMaster master = limit.getFacilityMaster();
			assertNotNull(master.getFinancedAmt());
			assertTrue((master.getFinancedAmt().doubleValue() > 0));
			assertNotNull(master.getInstallmentAmt());
			assertTrue((master.getInstallmentAmt().doubleValue() > 0));
			assertNotNull(master.getACFNo());
			assertNotNull(master.getLoanPurposeCode().getStandardCodeNumber());
			assertNotNull(master.getLoanPurposeCode().getStandardCodeValue());
			assertNotNull(master.getProductPackageCode().getStandardCodeNumber());
			assertNotNull(master.getProductPackageCode().getStandardCodeValue());
			assertNotNull(master.getOfferAcceptedDate());
			assertNotNull(master.getApprovedBy().getStandardCodeNumber());
			assertNotNull(master.getApprovedBy().getStandardCodeValue());
			assertNotNull(master.getApproveDate());
			assertNotNull(master.getCancelRejectCode().getStandardCodeNumber());
			assertNotNull(master.getCancelRejectCode().getStandardCodeValue());
			assertNotNull(master.getCancelRejectDate());
			assertNotNull(master.getOfficer().getStandardCodeNumber());
			assertNotNull(master.getOfficer().getStandardCodeValue());
			assertNotNull(master.getLimitStatus().getStandardCodeNumber());
			assertNotNull(master.getLimitStatus().getStandardCodeValue());
			assertNotNull(master.getFacilityStatusEntryCode());
			assertTrue((master.getSpread().doubleValue() > 0));
			assertNotNull(master.getRateType().getStandardCodeNumber());
			assertNotNull(master.getRateType().getStandardCodeValue());
			assertTrue(master.getSpreadSign().equals("+"));
			assertNotNull(master.getApplicationSource().getStandardCodeNumber());
			assertNotNull(master.getApplicationSource().getStandardCodeValue());
			assertNotNull(master.getDealerLPPCode().getStandardCodeNumber());
			assertNotNull(master.getDealerLPPCode().getStandardCodeValue());
			assertNotNull(master.getDepartmentCode().getStandardCodeNumber());
			assertNotNull(master.getDepartmentCode().getStandardCodeValue());
			assertNotNull(master.getLawyerCode().getStandardCodeNumber());
			assertNotNull(master.getLawyerCode().getStandardCodeValue());
			assertNotNull(master.getOdExcessRateVarCode());
			assertTrue((master.getOdExcessRateVar().doubleValue() > 0));
			// assertTrue((master.getMainFacilityInd() > 0));
			assertNotNull(master.getMainFacilityAANo());
			assertNotNull(master.getMainFacilityCode());
			assertTrue((master.getMainFacilitySequenceNumber().longValue() > 0));
			// assertTrue((master.getStandbyLine() > 0));
			assertTrue((master.getFloorPledgeLimit().doubleValue() > 0));
			assertNotNull(master.getApplicationDate());

			assertTrue(master.getFinalPaymentAmt().doubleValue() == 12.22);
			assertTrue(master.getPrimeRateFloor().doubleValue() == 23.23);
			assertTrue(master.getPrimeRateCeiling().doubleValue() == 12.12);
			assertNotNull(master.getPrimeReviewDate());
			assertTrue(master.getPrimeReviewTerm().doubleValue() == 1234);
			assertNotNull(master.getPrimeReviewTermCode());
			assertTrue(master.getCommissionFees().doubleValue() == 22.22);
			assertTrue(master.getCommissionRate().doubleValue() == 3.55555);
			assertNotNull(master.getCommissionBasis());
			assertTrue(master.getSubsidyAmt().doubleValue() == 33.33);
			assertTrue(master.getOthersFee().doubleValue() == 44.44);
			assertTrue(master.getMaximumCommission().doubleValue() == 99999);
			assertTrue(master.getMinimumCommission().doubleValue() == 0.7);
			assertNotNull(master.getStandbyLineFacCode());
			assertTrue(master.getStandbyLineFacCodeSeq().intValue() == 12);
			assertTrue(master.getFacCommitmentRate().doubleValue() == 11.2);
			assertNotNull(master.getFacCommitmentRateNo());
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

			assertTrue((master.getUpdateStatusIndicator().equals("I")));
			assertTrue((master.getChangeIndicator().equals("Y")));

			/** Facility BNM Test **/
			FacilityBNM facilityBNM = limit.getFacilityBNM();
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
			assertNotNull(facilityBNM.getBNMExemptCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMExemptCode().getStandardCodeValue());
			assertNotNull(facilityBNM.getBNMPurposeCode().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMPurposeCode().getStandardCodeValue());

			assertNotNull(facilityBNM.getBNMGoodFinancedCd1().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMGoodFinancedCd1().getStandardCodeValue());

			assertNotNull(facilityBNM.getBNMGoodFinancedCd2().getStandardCodeNumber());
			assertNotNull(facilityBNM.getBNMGoodFinancedCd2().getStandardCodeValue());

			assertTrue((facilityBNM.getUpdateStatusIndicator().equals("I")));
			assertTrue((facilityBNM.getChangeIndicator().equals("Y")));

			/** Facility Officer Test **/
			Vector officers = limit.getFacilityOfficer();
			Iterator iter = officers.iterator();
			while (iter.hasNext()) {
				FacilityOfficer officer = (FacilityOfficer) iter.next();
				assertNotNull(new Long(officer.getCMSOfficerId()));
				assertNotNull(officer.getRelationshipCode().getStandardCodeNumber());
				assertNotNull(officer.getRelationshipCode().getStandardCodeValue());
				assertNotNull(officer.getOfficer().getStandardCodeNumber());
				assertNotNull(officer.getOfficer().getStandardCodeValue());
				assertNotNull(officer.getOfficerType().getStandardCodeNumber());
				assertNotNull(officer.getOfficerType().getStandardCodeValue());
				if (officer.getUpdateStatusIndicator() != null) {
					System.out.println("TUREIN");
				}
				assertTrue((officer.getUpdateStatusIndicator().equals("I")));
				assertTrue((officer.getChangeIndicator().equals("Y")));
			}

			/** Facility Relationship Test **/
			Vector relationships = limit.getFacilityRelationship();
			Iterator iter_rel = relationships.iterator();
			while (iter_rel.hasNext()) {
				FacilityRelationship relation = (FacilityRelationship) iter_rel.next();
				assertNotNull(new Long(relation.getCMSFacilityRelationshipID()));
				assertNotNull(relation.getCIFId());
				assertNotNull(relation.getAccountRelationship().getStandardCodeNumber());
				assertNotNull(relation.getAccountRelationship().getStandardCodeValue());
				assertNotNull(relation.getAddressSeqNum());
				assertTrue(relation.getGuaranteeAmt().doubleValue() > 0);
				assertTrue(relation.getAddressSeqNum().longValue() > 0);

				System.out.println(">>>" + relation.getShareHolderPercentage());
				assertTrue(relation.getShareHolderPercentage().doubleValue() == 0.9);
				assertTrue(relation.getReceiveMailCode().equals("Y"));
				assertNotNull(relation.getHoldMailCode());
				assertTrue(relation.getNameAssociatedWFacOrder().intValue() == 1);
				// assertTrue(relation.getNameConjunctionPosition().equals("Y"));
				assertTrue(relation.getNameConjunction().equals("ccjj"));
				assertTrue(relation.getProfitRatio().doubleValue() == 12.44444);
				assertTrue(relation.getDividendRatio().doubleValue() == 43.11112);

				assertTrue((relation.getUpdateStatusIndicator().equals("I")));
				assertTrue((relation.getChangeIndicator().equals("Y")));
			}

			/** Islamic Facility Master Test **/
			IslamicFacilityMaster iMaster = limit.getIslamicFacilityMaster();
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
			assertTrue(iMaster.getUpdateStatusIndicator().equals("I"));
			assertTrue(iMaster.getChangeIndicator().equals("Y"));

			/** Facility Multi Tier Financing Test **/
			Vector multiTiers = limit.getFacilityMultiTierFinancings();
			FacilityMultiTierFinancing multiTier = (FacilityMultiTierFinancing) multiTiers.elementAt(0);
			assertNotNull(multiTier);
			assertTrue(multiTier.getTierTerm().doubleValue() == 7);
			assertTrue(multiTier.getTierSeqNo().doubleValue() == 1);
			assertNotNull(multiTier.getTierTermCode());
			assertTrue(multiTier.getRate().doubleValue() == 334.7);
			assertTrue(multiTier.getUpdateStatusIndicator().equals("I"));
			assertTrue(multiTier.getChangeIndicator().equals("Y"));

			/** Facility BBA VariPackage Test **/
			FacilityBBAVariPackage bbaPackage = limit.getFacilityBBAVariPackage();
			assertNotNull(bbaPackage);
			assertTrue(bbaPackage.getCustProfRate().doubleValue() == 99.08);
			assertTrue(bbaPackage.getRebateMethod().equals("E"));
			assertTrue(bbaPackage.getGPPPaymentMode().equals("Y"));
			assertTrue(bbaPackage.getGPPCalcMethod().equals("A"));
			assertTrue(bbaPackage.getGPPTerm().doubleValue() == 6);
			assertTrue(bbaPackage.getGPPTermCode().equals("T"));
			assertTrue(bbaPackage.getFullReleaseProfit().equals("N"));
			assertTrue(bbaPackage.getRefundFullReleaseProfit().equals("P"));
			assertTrue(bbaPackage.getFullReleaseProfitCalcMethod().equals("F"));
			assertTrue(bbaPackage.getInstallment().doubleValue() == 224.81);
			assertTrue(bbaPackage.getFinalPaymentAmt().doubleValue() == 4.35);
			assertTrue(bbaPackage.getUpdateStatusIndicator().equals("I"));
			assertTrue(bbaPackage.getChangeIndicator().equals("Y"));
		}

		/** Charge Detail Test **/
		Vector chargeDetails = aaMsgbody.getChargeDetail();
		assertTrue((chargeDetails.size() > 0));

		Iterator chargeIter = chargeDetails.iterator();
		while (chargeIter.hasNext()) {
			ChargeDetail charge = (ChargeDetail) chargeIter.next();
			assertNotNull(charge);
			assertNotNull(charge.getSecurityId());
			assertNotNull(new Long(charge.getCmsSecurityId()));
			assertNotNull(charge.getLimitId());
			assertTrue((charge.getLimitId().length > 1));
			assertTrue((charge.getChargeType().equals("A")));
			assertNotNull(new Long(charge.getChargeDetailId()));
			assertNotNull(charge.getPriorChargeType());
			assertTrue(charge.getChargeAmount().doubleValue() > 0);
			assertTrue(charge.getSecurityRanking().intValue() > 0);
			assertNotNull(charge.getLegallyChargedDate());
			assertNotNull(charge.getConfirmChargedDate());
			assertNotNull(charge.getPriorChargeChargee());
			assertTrue((charge.getPriorChargeAmount().doubleValue() > 0));
			assertTrue((charge.getUpdateStatusIndicator().equals("I")));
			assertTrue((charge.getChangeIndicator().equals("Y")));
		}

	}
}

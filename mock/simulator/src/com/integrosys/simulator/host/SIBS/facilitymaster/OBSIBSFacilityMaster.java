package com.integrosys.simulator.host.SIBS.facilitymaster;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFacilityMaster extends OBMessageHeader implements IOBHost {

	private Long applicationNumber;

	private String facilityCode;

	private Long facilitySequence;

	private Integer facilityBranchNumber;

	private String productType;

	private BigDecimal amountApplied;

	private BigDecimal facilityLimit;

	private Date dateEntered;

	private Date applicationDate;

	private BigDecimal paymentAmt;

	private BigDecimal finalPaymentAmt;

	private Integer term;

	private String termCode;

	private String cpNo;

	private String purpose;

	private Date offerDate;

	private Date offerAcceptedDate;

	private Date approvedDate;

	private String approvedBy;

	private String cancelRejectCode;

	private Date cencelRejectDate;

	private String carCodeFlag;

	private String carCode;

	private String officer;

	private String limitStatus;

	private String facilityStatus;

	private Integer interestBase;

	private String modeOfInterest;

	private Integer yearBase;

	private BigDecimal interestRate;

	private Integer primeRateN;

	private BigDecimal primeVariance;

	private String primeVarianceCode;

	private BigDecimal primeRateFloor;

	private BigDecimal primeRateCeiling;

	private Date primeReviewDate;

	private Integer primeReviewTerm;

	private String primeReviewTermCode;

	private String currencyType;

	private String collateralType;

	private BigDecimal odExcessRateVar;

	private String odExcessRateVarCode;

	private String parValueShares;

	private Long dealerNumber;

	private Long facilityCIFNo;

	private BigDecimal drawingLimit;

	private Integer lateChargeType;

	private BigDecimal comissionFees;

	private BigDecimal handlingFees;

	private BigDecimal subsidyAmt;

	private BigDecimal othersFee;

	private BigDecimal comissionRate;

	private String comissionBasis;

	private BigDecimal maximumComission;

	private BigDecimal minimumComission;

	private String standbyLineFacCode;

	private Long standbyLineFacSeq;

	private Date facilityExpiryDate;

	private BigDecimal facCommitmentRate;

	private Integer facCommitmentRateNo;

	private Date lastMaintainDate;

	private BigDecimal originalAmt;

	private Long mainFacilityAANo;

	private String mainFacilityCode;

	private Long mainFacilitySeqNum;

	private String standbyLineInd;

	private String level;

	private BigDecimal amtUtilised;

	private String computerised;

	private BigDecimal specificProvision;

	private BigDecimal interestInSuspense;

	private BigDecimal outstandingBalance;

	private Integer paymentCode;

	private Integer paymentFreq;

	private String paymentFreqCode;

	private Integer intPaymentFreq;

	private String intPaymentFreqCode;

	private Integer gracePeriod;

	private String graceCode;

	private String revolvingInd;

	private String revOnOutstandingBalOrOrigInd;

	private BigDecimal floorPledgeLimit;

	private BigDecimal actualPledgeLimit;

	private String altSchedule;

	private Integer availPeriodInMths;

	private Integer availPeriodInDays;

	private BigDecimal retentionSum;

	private Integer retentionPeriod;

	private String retentionPeriodCode;

	private String sourceCode;

	private String lawyerCode;

	private String disbursementManner;

	private String cal1stInstlDateInd;

	private String isoReferralNo;

	private String allowIncentive;

	private Date dateApprovedBy;

	private String alternateRate;

	private String creditLineInd;

	private String productPackageCode;

	private String effectiveCostOfFund;

	private BigDecimal ecofAdminCost;

	private BigDecimal ecofRate;

	private BigDecimal ecofVariance;

	private String ecofVarianceCode;

	private Date facAvailDate;

	private Integer facAvailPeriod;

	private Date dateInstructed;

	private String solicitorReference;

	private String departmentCode;

	private String refinanceFromBank;

	private String solicitorName;

	private String scheme;

	private String aaTransRenewFlag;

	private Long renewAANo;

	private String renewFacCode;

	private Long renewFacSeq;

	public Long getApplicationNumber() {
		return applicationNumber;
	}

	public void setApplicationNumber(Long applicationNumber) {
		this.applicationNumber = applicationNumber;
	}

	public String getFacilityCode() {
		return facilityCode;
	}

	public void setFacilityCode(String facilityCode) {
		this.facilityCode = facilityCode;
	}

	public Long getFacilitySequence() {
		return facilitySequence;
	}

	public void setFacilitySequence(Long facilitySequence) {
		this.facilitySequence = facilitySequence;
	}

	public Integer getFacilityBranchNumber() {
		return facilityBranchNumber;
	}

	public void setFacilityBranchNumber(Integer facilityBranchNumber) {
		this.facilityBranchNumber = facilityBranchNumber;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public BigDecimal getAmountApplied() {
		return amountApplied;
	}

	public void setAmountApplied(BigDecimal amountApplied) {
		this.amountApplied = amountApplied;
	}

	public BigDecimal getFacilityLimit() {
		return facilityLimit;
	}

	public void setFacilityLimit(BigDecimal facilityLimit) {
		this.facilityLimit = facilityLimit;
	}

	public Date getDateEntered() {
		return dateEntered;
	}

	public void setDateEntered(Date dateEntered) {
		this.dateEntered = dateEntered;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	public BigDecimal getPaymentAmt() {
		return paymentAmt;
	}

	public void setPaymentAmt(BigDecimal paymentAmt) {
		this.paymentAmt = paymentAmt;
	}

	public BigDecimal getFinalPaymentAmt() {
		return finalPaymentAmt;
	}

	public void setFinalPaymentAmt(BigDecimal finalPaymentAmt) {
		this.finalPaymentAmt = finalPaymentAmt;
	}

	public Integer getTerm() {
		return term;
	}

	public void setTerm(Integer term) {
		this.term = term;
	}

	public String getTermCode() {
		return termCode;
	}

	public void setTermCode(String termCode) {
		this.termCode = termCode;
	}

	public String getCpNo() {
		return cpNo;
	}

	public void setCpNo(String cpNo) {
		this.cpNo = cpNo;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public Date getOfferDate() {
		return offerDate;
	}

	public void setOfferDate(Date offerDate) {
		this.offerDate = offerDate;
	}

	public Date getOfferAcceptedDate() {
		return offerAcceptedDate;
	}

	public void setOfferAcceptedDate(Date offerAcceptedDate) {
		this.offerAcceptedDate = offerAcceptedDate;
	}

	public Date getApprovedDate() {
		return approvedDate;
	}

	public void setApprovedDate(Date approvedDate) {
		this.approvedDate = approvedDate;
	}

	public String getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(String approvedBy) {
		this.approvedBy = approvedBy;
	}

	public String getCancelRejectCode() {
		return cancelRejectCode;
	}

	public void setCancelRejectCode(String cancelRejectCode) {
		this.cancelRejectCode = cancelRejectCode;
	}

	public Date getCencelRejectDate() {
		return cencelRejectDate;
	}

	public void setCencelRejectDate(Date cencelRejectDate) {
		this.cencelRejectDate = cencelRejectDate;
	}

	public String getCarCodeFlag() {
		return carCodeFlag;
	}

	public void setCarCodeFlag(String carCodeFlag) {
		this.carCodeFlag = carCodeFlag;
	}

	public String getCarCode() {
		return carCode;
	}

	public void setCarCode(String carCode) {
		this.carCode = carCode;
	}

	public String getOfficer() {
		return officer;
	}

	public void setOfficer(String officer) {
		this.officer = officer;
	}

	public String getLimitStatus() {
		return limitStatus;
	}

	public void setLimitStatus(String limitStatus) {
		this.limitStatus = limitStatus;
	}

	public String getFacilityStatus() {
		return facilityStatus;
	}

	public void setFacilityStatus(String facilityStatus) {
		this.facilityStatus = facilityStatus;
	}

	public Integer getInterestBase() {
		return interestBase;
	}

	public void setInterestBase(Integer interestBase) {
		this.interestBase = interestBase;
	}

	public String getModeOfInterest() {
		return modeOfInterest;
	}

	public void setModeOfInterest(String modeOfInterest) {
		this.modeOfInterest = modeOfInterest;
	}

	public Integer getYearBase() {
		return yearBase;
	}

	public void setYearBase(Integer yearBase) {
		this.yearBase = yearBase;
	}

	public BigDecimal getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(BigDecimal interestRate) {
		this.interestRate = interestRate;
	}

	public Integer getPrimeRateN() {
		return primeRateN;
	}

	public void setPrimeRateN(Integer primeRateN) {
		this.primeRateN = primeRateN;
	}

	public BigDecimal getPrimeVariance() {
		return primeVariance;
	}

	public void setPrimeVariance(BigDecimal primeVariance) {
		this.primeVariance = primeVariance;
	}

	public String getPrimeVarianceCode() {
		return primeVarianceCode;
	}

	public void setPrimeVarianceCode(String primeVarianceCode) {
		this.primeVarianceCode = primeVarianceCode;
	}

	public BigDecimal getPrimeRateFloor() {
		return primeRateFloor;
	}

	public void setPrimeRateFloor(BigDecimal primeRateFloor) {
		this.primeRateFloor = primeRateFloor;
	}

	public BigDecimal getPrimeRateCeiling() {
		return primeRateCeiling;
	}

	public void setPrimeRateCeiling(BigDecimal primeRateCeiling) {
		this.primeRateCeiling = primeRateCeiling;
	}

	public Date getPrimeReviewDate() {
		return primeReviewDate;
	}

	public void setPrimeReviewDate(Date primeReviewDate) {
		this.primeReviewDate = primeReviewDate;
	}

	public Integer getPrimeReviewTerm() {
		return primeReviewTerm;
	}

	public void setPrimeReviewTerm(Integer primeReviewTerm) {
		this.primeReviewTerm = primeReviewTerm;
	}

	public String getPrimeReviewTermCode() {
		return primeReviewTermCode;
	}

	public void setPrimeReviewTermCode(String primeReviewTermCode) {
		this.primeReviewTermCode = primeReviewTermCode;
	}

	public String getCurrencyType() {
		return currencyType;
	}

	public void setCurrencyType(String currencyType) {
		this.currencyType = currencyType;
	}

	public String getCollateralType() {
		return collateralType;
	}

	public void setCollateralType(String collateralType) {
		this.collateralType = collateralType;
	}

	public BigDecimal getOdExcessRateVar() {
		return odExcessRateVar;
	}

	public void setOdExcessRateVar(BigDecimal odExcessRateVar) {
		this.odExcessRateVar = odExcessRateVar;
	}

	public String getOdExcessRateVarCode() {
		return odExcessRateVarCode;
	}

	public void setOdExcessRateVarCode(String odExcessRateVarCode) {
		this.odExcessRateVarCode = odExcessRateVarCode;
	}

	public String getParValueShares() {
		return parValueShares;
	}

	public void setParValueShares(String parValueShares) {
		this.parValueShares = parValueShares;
	}

	public Long getDealerNumber() {
		return dealerNumber;
	}

	public void setDealerNumber(Long dealerNumber) {
		this.dealerNumber = dealerNumber;
	}

	public Long getFacilityCIFNo() {
		return facilityCIFNo;
	}

	public void setFacilityCIFNo(Long facilityCIFNo) {
		this.facilityCIFNo = facilityCIFNo;
	}

	public BigDecimal getDrawingLimit() {
		return drawingLimit;
	}

	public void setDrawingLimit(BigDecimal drawingLimit) {
		this.drawingLimit = drawingLimit;
	}

	public Integer getLateChargeType() {
		return lateChargeType;
	}

	public void setLateChargeType(Integer lateChargeType) {
		this.lateChargeType = lateChargeType;
	}

	public BigDecimal getComissionFees() {
		return comissionFees;
	}

	public void setComissionFees(BigDecimal comissionFees) {
		this.comissionFees = comissionFees;
	}

	public BigDecimal getHandlingFees() {
		return handlingFees;
	}

	public void setHandlingFees(BigDecimal handlingFees) {
		this.handlingFees = handlingFees;
	}

	public BigDecimal getSubsidyAmt() {
		return subsidyAmt;
	}

	public void setSubsidyAmt(BigDecimal subsidyAmt) {
		this.subsidyAmt = subsidyAmt;
	}

	public BigDecimal getOthersFee() {
		return othersFee;
	}

	public void setOthersFee(BigDecimal othersFee) {
		this.othersFee = othersFee;
	}

	public BigDecimal getComissionRate() {
		return comissionRate;
	}

	public void setComissionRate(BigDecimal comissionRate) {
		this.comissionRate = comissionRate;
	}

	public String getComissionBasis() {
		return comissionBasis;
	}

	public void setComissionBasis(String comissionBasis) {
		this.comissionBasis = comissionBasis;
	}

	public BigDecimal getMaximumComission() {
		return maximumComission;
	}

	public void setMaximumComission(BigDecimal maximumComission) {
		this.maximumComission = maximumComission;
	}

	public BigDecimal getMinimumComission() {
		return minimumComission;
	}

	public void setMinimumComission(BigDecimal minimumComission) {
		this.minimumComission = minimumComission;
	}

	public String getStandbyLineFacCode() {
		return standbyLineFacCode;
	}

	public void setStandbyLineFacCode(String standbyLineFacCode) {
		this.standbyLineFacCode = standbyLineFacCode;
	}

	public Long getStandbyLineFacSeq() {
		return standbyLineFacSeq;
	}

	public void setStandbyLineFacSeq(Long standbyLineFacSeq) {
		this.standbyLineFacSeq = standbyLineFacSeq;
	}

	public Date getFacilityExpiryDate() {
		return facilityExpiryDate;
	}

	public void setFacilityExpiryDate(Date facilityExpiryDate) {
		this.facilityExpiryDate = facilityExpiryDate;
	}

	public BigDecimal getFacCommitmentRate() {
		return facCommitmentRate;
	}

	public void setFacCommitmentRate(BigDecimal facCommitmentRate) {
		this.facCommitmentRate = facCommitmentRate;
	}

	public Integer getFacCommitmentRateNo() {
		return facCommitmentRateNo;
	}

	public void setFacCommitmentRateNo(Integer facCommitmentRateNo) {
		this.facCommitmentRateNo = facCommitmentRateNo;
	}

	public Date getLastMaintainDate() {
		return lastMaintainDate;
	}

	public void setLastMaintainDate(Date lastMaintainDate) {
		this.lastMaintainDate = lastMaintainDate;
	}

	public BigDecimal getOriginalAmt() {
		return originalAmt;
	}

	public void setOriginalAmt(BigDecimal originalAmt) {
		this.originalAmt = originalAmt;
	}

	public Long getMainFacilityAANo() {
		return mainFacilityAANo;
	}

	public void setMainFacilityAANo(Long mainFacilityAANo) {
		this.mainFacilityAANo = mainFacilityAANo;
	}

	public String getMainFacilityCode() {
		return mainFacilityCode;
	}

	public void setMainFacilityCode(String mainFacilityCode) {
		this.mainFacilityCode = mainFacilityCode;
	}

	public Long getMainFacilitySeqNum() {
		return mainFacilitySeqNum;
	}

	public void setMainFacilitySeqNum(Long mainFacilitySeqNum) {
		this.mainFacilitySeqNum = mainFacilitySeqNum;
	}

	public String getStandbyLineInd() {
		return standbyLineInd;
	}

	public void setStandbyLineInd(String standbyLineInd) {
		this.standbyLineInd = standbyLineInd;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public BigDecimal getAmtUtilised() {
		return amtUtilised;
	}

	public void setAmtUtilised(BigDecimal amtUtilised) {
		this.amtUtilised = amtUtilised;
	}

	public String getComputerised() {
		return computerised;
	}

	public void setComputerised(String computerised) {
		this.computerised = computerised;
	}

	public BigDecimal getSpecificProvision() {
		return specificProvision;
	}

	public void setSpecificProvision(BigDecimal specificProvision) {
		this.specificProvision = specificProvision;
	}

	public BigDecimal getInterestInSuspense() {
		return interestInSuspense;
	}

	public void setInterestInSuspense(BigDecimal interestInSuspense) {
		this.interestInSuspense = interestInSuspense;
	}

	public BigDecimal getOutstandingBalance() {
		return outstandingBalance;
	}

	public void setOutstandingBalance(BigDecimal outstandingBalance) {
		this.outstandingBalance = outstandingBalance;
	}

	public Integer getPaymentCode() {
		return paymentCode;
	}

	public void setPaymentCode(Integer paymentCode) {
		this.paymentCode = paymentCode;
	}

	public Integer getPaymentFreq() {
		return paymentFreq;
	}

	public void setPaymentFreq(Integer paymentFreq) {
		this.paymentFreq = paymentFreq;
	}

	public String getPaymentFreqCode() {
		return paymentFreqCode;
	}

	public void setPaymentFreqCode(String paymentFreqCode) {
		this.paymentFreqCode = paymentFreqCode;
	}

	public Integer getIntPaymentFreq() {
		return intPaymentFreq;
	}

	public void setIntPaymentFreq(Integer intPaymentFreq) {
		this.intPaymentFreq = intPaymentFreq;
	}

	public String getIntPaymentFreqCode() {
		return intPaymentFreqCode;
	}

	public void setIntPaymentFreqCode(String intPaymentFreqCode) {
		this.intPaymentFreqCode = intPaymentFreqCode;
	}

	public Integer getGracePeriod() {
		return gracePeriod;
	}

	public void setGracePeriod(Integer gracePeriod) {
		this.gracePeriod = gracePeriod;
	}

	public String getGraceCode() {
		return graceCode;
	}

	public void setGraceCode(String graceCode) {
		this.graceCode = graceCode;
	}

	public String getRevolvingInd() {
		return revolvingInd;
	}

	public void setRevolvingInd(String revolvingInd) {
		this.revolvingInd = revolvingInd;
	}

	public String getRevOnOutstandingBalOrOrigInd() {
		return revOnOutstandingBalOrOrigInd;
	}

	public void setRevOnOutstandingBalOrOrigInd(String revOnOutstandingBalOrOrigInd) {
		this.revOnOutstandingBalOrOrigInd = revOnOutstandingBalOrOrigInd;
	}

	public BigDecimal getFloorPledgeLimit() {
		return floorPledgeLimit;
	}

	public void setFloorPledgeLimit(BigDecimal floorPledgeLimit) {
		this.floorPledgeLimit = floorPledgeLimit;
	}

	public BigDecimal getActualPledgeLimit() {
		return actualPledgeLimit;
	}

	public void setActualPledgeLimit(BigDecimal actualPledgeLimit) {
		this.actualPledgeLimit = actualPledgeLimit;
	}

	public String getAltSchedule() {
		return altSchedule;
	}

	public void setAltSchedule(String altSchedule) {
		this.altSchedule = altSchedule;
	}

	public Integer getAvailPeriodInMths() {
		return availPeriodInMths;
	}

	public void setAvailPeriodInMths(Integer availPeriodInMths) {
		this.availPeriodInMths = availPeriodInMths;
	}

	public Integer getAvailPeriodInDays() {
		return availPeriodInDays;
	}

	public void setAvailPeriodInDays(Integer availPeriodInDays) {
		this.availPeriodInDays = availPeriodInDays;
	}

	public BigDecimal getRetentionSum() {
		return retentionSum;
	}

	public void setRetentionSum(BigDecimal retentionSum) {
		this.retentionSum = retentionSum;
	}

	public Integer getRetentionPeriod() {
		return retentionPeriod;
	}

	public void setRetentionPeriod(Integer retentionPeriod) {
		this.retentionPeriod = retentionPeriod;
	}

	public String getRetentionPeriodCode() {
		return retentionPeriodCode;
	}

	public void setRetentionPeriodCode(String retentionPeriodCode) {
		this.retentionPeriodCode = retentionPeriodCode;
	}

	public String getSourceCode() {
		return sourceCode;
	}

	public void setSourceCode(String sourceCode) {
		this.sourceCode = sourceCode;
	}

	public String getLawyerCode() {
		return lawyerCode;
	}

	public void setLawyerCode(String lawyerCode) {
		this.lawyerCode = lawyerCode;
	}

	public String getDisbursementManner() {
		return disbursementManner;
	}

	public void setDisbursementManner(String disbursementManner) {
		this.disbursementManner = disbursementManner;
	}

	public String getCal1stInstlDateInd() {
		return cal1stInstlDateInd;
	}

	public void setCal1stInstlDateInd(String cal1stInstlDateInd) {
		this.cal1stInstlDateInd = cal1stInstlDateInd;
	}

	public String getIsoReferralNo() {
		return isoReferralNo;
	}

	public void setIsoReferralNo(String isoReferralNo) {
		this.isoReferralNo = isoReferralNo;
	}

	public String getAllowIncentive() {
		return allowIncentive;
	}

	public void setAllowIncentive(String allowIncentive) {
		this.allowIncentive = allowIncentive;
	}

	public Date getDateApprovedBy() {
		return dateApprovedBy;
	}

	public void setDateApprovedBy(Date dateApprovedBy) {
		this.dateApprovedBy = dateApprovedBy;
	}

	public String getAlternateRate() {
		return alternateRate;
	}

	public void setAlternateRate(String alternateRate) {
		this.alternateRate = alternateRate;
	}

	public String getCreditLineInd() {
		return creditLineInd;
	}

	public void setCreditLineInd(String creditLineInd) {
		this.creditLineInd = creditLineInd;
	}

	public String getProductPackageCode() {
		return productPackageCode;
	}

	public void setProductPackageCode(String productPackageCode) {
		this.productPackageCode = productPackageCode;
	}

	public String getEffectiveCostOfFund() {
		return effectiveCostOfFund;
	}

	public void setEffectiveCostOfFund(String effectiveCostOfFund) {
		this.effectiveCostOfFund = effectiveCostOfFund;
	}

	public BigDecimal getEcofAdminCost() {
		return ecofAdminCost;
	}

	public void setEcofAdminCost(BigDecimal ecofAdminCost) {
		this.ecofAdminCost = ecofAdminCost;
	}

	public BigDecimal getEcofRate() {
		return ecofRate;
	}

	public void setEcofRate(BigDecimal ecofRate) {
		this.ecofRate = ecofRate;
	}

	public BigDecimal getEcofVariance() {
		return ecofVariance;
	}

	public void setEcofVariance(BigDecimal ecofVariance) {
		this.ecofVariance = ecofVariance;
	}

	public String getEcofVarianceCode() {
		return ecofVarianceCode;
	}

	public void setEcofVarianceCode(String ecofVarianceCode) {
		this.ecofVarianceCode = ecofVarianceCode;
	}

	public Date getFacAvailDate() {
		return facAvailDate;
	}

	public void setFacAvailDate(Date facAvailDate) {
		this.facAvailDate = facAvailDate;
	}

	public Integer getFacAvailPeriod() {
		return facAvailPeriod;
	}

	public void setFacAvailPeriod(Integer facAvailPeriod) {
		this.facAvailPeriod = facAvailPeriod;
	}

	public Date getDateInstructed() {
		return dateInstructed;
	}

	public void setDateInstructed(Date dateInstructed) {
		this.dateInstructed = dateInstructed;
	}

	public String getSolicitorReference() {
		return solicitorReference;
	}

	public void setSolicitorReference(String solicitorReference) {
		this.solicitorReference = solicitorReference;
	}

	public String getDepartmentCode() {
		return departmentCode;
	}

	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getRefinanceFromBank() {
		return refinanceFromBank;
	}

	public void setRefinanceFromBank(String refinanceFromBank) {
		this.refinanceFromBank = refinanceFromBank;
	}

	public String getSolicitorName() {
		return solicitorName;
	}

	public void setSolicitorName(String solicitorName) {
		this.solicitorName = solicitorName;
	}

	public String getScheme() {
		return scheme;
	}

	public void setScheme(String scheme) {
		this.scheme = scheme;
	}

	public String getAaTransRenewFlag() {
		return aaTransRenewFlag;
	}

	public void setAaTransRenewFlag(String aaTransRenewFlag) {
		this.aaTransRenewFlag = aaTransRenewFlag;
	}

	public Long getRenewAANo() {
		return renewAANo;
	}

	public void setRenewAANo(Long renewAANo) {
		this.renewAANo = renewAANo;
	}

	public String getRenewFacCode() {
		return renewFacCode;
	}

	public void setRenewFacCode(String renewFacCode) {
		this.renewFacCode = renewFacCode;
	}

	public Long getRenewFacSeq() {
		return renewFacSeq;
	}

	public void setRenewFacSeq(Long renewFacSeq) {
		this.renewFacSeq = renewFacSeq;
	}

	public void setSuccessResponse() {
		setCommonSuccessResponse();

		// set facility sequence for new case
		if ((facilitySequence == null) || (facilitySequence.longValue() == 0)) {
			try {
				long seq = (long) (Math.random() * SEQ_NUMBER);
				String seqStr = new DateSequencerFormatter().formatSeq(String.valueOf(seq));
				setFacilitySequence(new Long(Long.parseLong(seqStr)));

			}
			catch (Exception e) {
				System.out.println(" Exception caught at setSucessReponse: " + e.getMessage());
			}
		}

		if ((cpNo == null) || (cpNo.length() == 0)) {
			try {
				long seq = (long) (Math.random() * SEQ_NUMBER);
				String seqStr = new DateSequencerFormatter().formatSeq(String.valueOf(seq));
				setCpNo(seqStr);
			}
			catch (Exception e) {
				System.out.println(" Exception caught at setSucessReponse: " + e.getMessage());
			}
		}
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSFacilityMaster responseObj = (OBSIBSFacilityMaster) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" applicationNumber: " + responseObj.getApplicationNumber() + newLine);
				result.append(" facilityCode: " + responseObj.getFacilityCode() + newLine);
				result.append(" facilitySequence: " + responseObj.getFacilitySequence() + newLine);
				result.append(" facilityBranchNumber: " + responseObj.getFacilityBranchNumber() + newLine);
				result.append(" productType: " + responseObj.getProductType() + newLine);
				result.append(" amountApplied: " + responseObj.getAmountApplied() + newLine);
				result.append(" facilityLimit : " + responseObj.getFacilityLimit() + newLine);
				result.append(" dateEntered : " + responseObj.getDateEntered() + newLine);
				result.append(" applicationDate : " + responseObj.getApplicationDate() + newLine);
				result.append(" paymentAmt : " + responseObj.getPaymentAmt() + newLine);
				result.append(" finalPaymentAmt: " + responseObj.getFinalPaymentAmt() + newLine);
				result.append("term :" + responseObj.getTerm() + newLine);
				result.append(" termCode: " + responseObj.getTermCode() + newLine);
				result.append(" cpNo : " + responseObj.getCpNo() + newLine);
				result.append(" purpose : " + responseObj.getPurpose() + newLine);
				result.append(" offerDate : " + responseObj.getOfferDate() + newLine);
				result.append(" offerAcceptedDate : " + responseObj.getOfferAcceptedDate() + newLine);
				result.append(" approvedDate : " + responseObj.getApprovedDate() + newLine);
				result.append(" approvedBy : " + responseObj.getApprovedBy() + newLine);
				result.append(" cancelRejectCode : " + responseObj.getCancelRejectCode() + newLine);
				result.append(" cencelRejectDate: " + responseObj.getCencelRejectDate() + newLine);
				result.append(" carCodeFlag : " + responseObj.getCarCodeFlag() + newLine);
				result.append(" carCode : " + responseObj.getCarCode() + newLine);
				result.append(" officer : " + responseObj.getOfficer() + newLine);
				result.append(" limitStatus : " + responseObj.getLimitStatus() + newLine);
				result.append(" facilityStatus : " + responseObj.getFacilityStatus() + newLine);
				result.append(" interestBase : " + responseObj.getInterestBase() + newLine);
				result.append(" modeOfInterest : " + responseObj.getModeOfInterest() + newLine);
				result.append(" yearBase : " + responseObj.getYearBase() + newLine);
				result.append(" interestRate : " + responseObj.getInterestRate() + newLine);
				result.append(" primeRateN: " + responseObj.getPrimeRateN() + newLine);
				result.append(" primeVariance : " + responseObj.getPrimeVariance() + newLine);
				result.append(" primeVarianceCode : " + responseObj.getPrimeVarianceCode() + newLine);
				result.append(" primeRateFloor : " + responseObj.getPrimeRateFloor() + newLine);
				result.append(" primeRateCeiling : " + responseObj.getPrimeRateCeiling() + newLine);
				result.append(" primeReviewDate : " + responseObj.getPrimeReviewDate() + newLine);
				result.append(" primeReviewTerm : " + responseObj.getPrimeReviewTerm() + newLine);
				result.append(" primeReviewTermCode : " + responseObj.getPrimeReviewTermCode() + newLine);
				result.append(" currencyType : " + responseObj.getCurrencyType() + newLine);
				result.append(" collateralType : " + responseObj.getCollateralType() + newLine);
				result.append(" odExcessRateVar : " + responseObj.getOdExcessRateVar() + newLine);
				result.append(" odExcessRateVarCode : " + responseObj.getOdExcessRateVarCode() + newLine);
				result.append(" parValueShares : " + responseObj.getParValueShares() + newLine);
				result.append(" dealerNumber : " + responseObj.getDealerNumber() + newLine);
				result.append(" facilityCIFNo : " + responseObj.getFacilityCIFNo() + newLine);
				result.append(" drawingLimit : " + responseObj.getDrawingLimit() + newLine);
				result.append(" lateChargeType : " + responseObj.getLateChargeType() + newLine);
				result.append(" comissionFees : " + responseObj.getComissionFees() + newLine);
				result.append(" handlingFees : " + responseObj.getHandlingFees() + newLine);
				result.append(" subsidyAmt : " + responseObj.getSubsidyAmt() + newLine);
				result.append(" othersFee :" + responseObj.getOthersFee() + newLine);
				result.append(" comissionRate :" + responseObj.getComissionRate() + newLine);
				result.append(" comissionBasis : " + responseObj.getComissionBasis() + newLine);
				result.append(" maximumComission : " + responseObj.getMaximumComission() + newLine);
				result.append(" minimumComission : " + responseObj.getMinimumComission() + newLine);
				result.append(" standbyLineFacCode : " + responseObj.getStandbyLineFacCode() + newLine);
				result.append(" standbyLineFacSeq :" + responseObj.getStandbyLineFacSeq() + newLine);
				result.append(" facilityExpiryDate :" + responseObj.getFacilityExpiryDate() + newLine);
				result.append(" facCommitmentRate : " + responseObj.getFacCommitmentRate() + newLine);
				result.append(" facCommitmentRateNo : " + responseObj.getFacCommitmentRateNo() + newLine);
				result.append(" lastMaintainDate : " + responseObj.getLastMaintainDate() + newLine);
				result.append(" originalAmt : " + responseObj.getOriginalAmt() + newLine);
				result.append(" mainFacilityAANo: " + responseObj.getMainFacilityAANo() + newLine);
				result.append(" mainFacilityCode :" + responseObj.getMainFacilityCode() + newLine);
				result.append(" mainFacilitySeqNum : " + responseObj.getMainFacilitySeqNum() + newLine);
				result.append(" standbyLineInd : " + responseObj.getStandbyLineInd() + newLine);
				result.append(" level :" + responseObj.getLevel() + newLine);
				result.append(" amtUtilised : " + responseObj.getAmtUtilised() + newLine);
				result.append(" computerised : " + responseObj.getComputerised() + newLine);
				result.append(" specificProvision :" + responseObj.getSpecificProvision() + newLine);
				result.append(" interestInSuspense : " + responseObj.getInterestInSuspense() + newLine);
				result.append(" outstandingBalance : " + responseObj.getOutstandingBalance() + newLine);
				result.append(" paymentCode : " + responseObj.getPaymentCode() + newLine);
				result.append(" paymentFreq : " + responseObj.getPaymentFreq() + newLine);
				result.append(" paymentFreqCode : " + responseObj.getPaymentFreqCode() + newLine);
				result.append(" intPaymentFreq : " + responseObj.getIntPaymentFreq() + newLine);
				result.append(" intPaymentFreqCode : " + responseObj.getIntPaymentFreqCode() + newLine);
				result.append(" gracePeriod : " + responseObj.getGracePeriod() + newLine);
				result.append(" graceCode : " + responseObj.getGraceCode() + newLine);
				result.append(" revolvingInd : " + responseObj.getRevolvingInd() + newLine);
				result.append(" revOnOutstandingBalOrOrigInd : " + responseObj.getRevOnOutstandingBalOrOrigInd()
						+ newLine);
				result.append(" floorPledgeLimit : " + responseObj.getFloorPledgeLimit() + newLine);
				result.append(" actualPledgeLimit : " + responseObj.getActualPledgeLimit() + newLine);
				result.append(" altSchedule : " + responseObj.getAltSchedule() + newLine);
				result.append(" availPeriodInMths : " + responseObj.getAvailPeriodInMths() + newLine);
				result.append(" availPeriodInDays : " + responseObj.getAvailPeriodInDays() + newLine);
				result.append(" retentionSum : " + responseObj.getRetentionSum() + newLine);
				result.append(" retentionPeriod : " + responseObj.getRetentionPeriod() + newLine);
				result.append(" retentionPeriodCode : " + responseObj.getRetentionPeriodCode() + newLine);
				result.append(" sourceCode : " + responseObj.getSourceCode() + newLine);
				result.append(" lawyerCode : " + responseObj.getLawyerCode() + newLine);
				result.append(" disbursementManner : " + responseObj.getDisbursementManner() + newLine);
				result.append(" cal1stInstlDateInd : " + responseObj.getCal1stInstlDateInd() + newLine);
				result.append(" isoReferralNo : " + responseObj.getIsoReferralNo() + newLine);
				result.append(" allowIncentive : " + responseObj.getAllowIncentive() + newLine);
				result.append(" dateApprovedBy : " + responseObj.getDateApprovedBy() + newLine);
				result.append(" alternateRate : " + responseObj.getAlternateRate() + newLine);
				result.append(" creditLineInd : " + responseObj.getCreditLineInd() + newLine);
				result.append(" productPackageCode : " + responseObj.getProductPackageCode() + newLine);
				result.append(" effectiveCostOfFund : " + responseObj.getEffectiveCostOfFund() + newLine);
				result.append(" ecofAdminCost : " + responseObj.getEcofAdminCost() + newLine);
				result.append(" ecofRate : " + responseObj.getEcofRate() + newLine);
				result.append(" ecofVariance : " + responseObj.getEcofVariance() + newLine);
				result.append(" ecofVarianceCode : " + responseObj.getEcofVarianceCode() + newLine);
				result.append(" facAvailDate : " + responseObj.getFacAvailDate() + newLine);
				result.append(" facAvailPeriod : " + responseObj.getFacAvailPeriod() + newLine);
				result.append(" dateInstructed : " + responseObj.getDateInstructed() + newLine);
				result.append(" solicitorReference :" + responseObj.getSolicitorReference() + newLine);
				result.append(" departmentCode :" + responseObj.getDepartmentCode() + newLine);
				result.append(" refinanceFromBank : " + responseObj.getRefinanceFromBank() + newLine);
				result.append(" solicitorName :" + responseObj.getSolicitorName() + newLine);
				result.append(" scheme : " + responseObj.getScheme() + newLine);
				result.append(" aaTransRenewFlag : " + responseObj.getAaTransRenewFlag() + newLine);
				result.append(" renewAANo : " + responseObj.getRenewAANo() + newLine);
				result.append(" renewFacCode : " + responseObj.getRenewFacCode() + newLine);
				result.append(" renewFacSeq : " + responseObj.getRenewFacSeq() + newLine);
				result.append("}");
			}
		}

		return result.toString();
	}
}

package com.integrosys.simulator.host.SIBS.facilityislamicmaster;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFacilityIslamicMaster extends OBMessageHeader implements IOBHost {
	private Long applicationNo;

	private String facilityCode;

	private Long seqNo;

	private Integer gppTerm;

	private String gppTermCode;

	private String gppPaymentMode;

	private BigDecimal sellingPrice;

	private BigDecimal totalGPPAmt;

	private BigDecimal sptfCushionPrdMarkup;

	private Long shortSPTFGraceExpDate;

	private Date graceExpiryDate;

	private Long shortLastMaintainDate;

	private Date lastMaintainDate;

	private Integer daysCPMCalc;

	private Integer securityDeposit;

	private BigDecimal securityDepositPercentage;

	private BigDecimal securityDepositAmt;

	private String fundType;

	private BigDecimal customerInterestRate;

	private String gppCalcMethod;

	private String fullReleaseComputationMethod;

	private BigDecimal fixedAmtRefund;

	private String compoundingMethod;

	private Date dateStopCompounding;

	private Long shortDateStopCompounding;

	private String refundGPPProfit;

	private String refundFulRelProfit;

	private BigDecimal comissionFees;

	private BigDecimal commissionRate;

	private BigDecimal fixedCommissionAmt;

	private Integer commissionTerm;

	private Date commissionExpiryDate;

	private Long shortCommissionExpiryDate;

	private String excCMPInPaymentAmt;

	private String ibsDualMode;

	private Date spAgreementDate;

	private Long shortSPAgreementDate;

	private String gppDurationForSPDate;

	private Integer spTerm;

	private String spTermCode;

	private String fullRelProfitOn12Mtd;

	private String loanCategory;

	public Long getApplicationNo() {
		return applicationNo;
	}

	public void setApplicationNo(Long applicationNo) {
		this.applicationNo = applicationNo;
	}

	public String getFacilityCode() {
		return facilityCode;
	}

	public void setFacilityCode(String facilityCode) {
		this.facilityCode = facilityCode;
	}

	public Long getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(Long seqNo) {
		this.seqNo = seqNo;
	}

	public Integer getGppTerm() {
		return gppTerm;
	}

	public void setGppTerm(Integer gppTerm) {
		this.gppTerm = gppTerm;
	}

	public String getGppTermCode() {
		return gppTermCode;
	}

	public void setGppTermCode(String gppTermCode) {
		this.gppTermCode = gppTermCode;
	}

	public String getGppPaymentMode() {
		return gppPaymentMode;
	}

	public void setGppPaymentMode(String gppPaymentMode) {
		this.gppPaymentMode = gppPaymentMode;
	}

	public BigDecimal getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(BigDecimal sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public BigDecimal getTotalGPPAmt() {
		return totalGPPAmt;
	}

	public void setTotalGPPAmt(BigDecimal totalGPPAmt) {
		this.totalGPPAmt = totalGPPAmt;
	}

	public BigDecimal getSptfCushionPrdMarkup() {
		return sptfCushionPrdMarkup;
	}

	public void setSptfCushionPrdMarkup(BigDecimal sptfCushionPrdMarkup) {
		this.sptfCushionPrdMarkup = sptfCushionPrdMarkup;
	}

	public Long getShortSPTFGraceExpDate() {
		return shortSPTFGraceExpDate;
	}

	public void setShortSPTFGraceExpDate(Long shortSPTFGraceExpDate) {
		this.shortSPTFGraceExpDate = shortSPTFGraceExpDate;
	}

	public Date getGraceExpiryDate() {
		return graceExpiryDate;
	}

	public void setGraceExpiryDate(Date graceExpiryDate) {
		this.graceExpiryDate = graceExpiryDate;
	}

	public Long getShortLastMaintainDate() {
		return shortLastMaintainDate;
	}

	public void setShortLastMaintainDate(Long shortLastMaintainDate) {
		this.shortLastMaintainDate = shortLastMaintainDate;
	}

	public Date getLastMaintainDate() {
		return lastMaintainDate;
	}

	public void setLastMaintainDate(Date lastMaintainDate) {
		this.lastMaintainDate = lastMaintainDate;
	}

	public Integer getDaysCPMCalc() {
		return daysCPMCalc;
	}

	public void setDaysCPMCalc(Integer daysCPMCalc) {
		this.daysCPMCalc = daysCPMCalc;
	}

	public Integer getSecurityDeposit() {
		return securityDeposit;
	}

	public void setSecurityDeposit(Integer securityDeposit) {
		this.securityDeposit = securityDeposit;
	}

	public BigDecimal getSecurityDepositPercentage() {
		return securityDepositPercentage;
	}

	public void setSecurityDepositPercentage(BigDecimal securityDepositPercentage) {
		this.securityDepositPercentage = securityDepositPercentage;
	}

	public BigDecimal getSecurityDepositAmt() {
		return securityDepositAmt;
	}

	public void setSecurityDepositAmt(BigDecimal securityDepositAmt) {
		this.securityDepositAmt = securityDepositAmt;
	}

	public String getFundType() {
		return fundType;
	}

	public void setFundType(String fundType) {
		this.fundType = fundType;
	}

	public BigDecimal getCustomerInterestRate() {
		return customerInterestRate;
	}

	public void setCustomerInterestRate(BigDecimal customerInterestRate) {
		this.customerInterestRate = customerInterestRate;
	}

	public String getGppCalcMethod() {
		return gppCalcMethod;
	}

	public void setGppCalcMethod(String gppCalcMethod) {
		this.gppCalcMethod = gppCalcMethod;
	}

	public String getFullReleaseComputationMethod() {
		return fullReleaseComputationMethod;
	}

	public void setFullReleaseComputationMethod(String fullReleaseComputationMethod) {
		this.fullReleaseComputationMethod = fullReleaseComputationMethod;
	}

	public BigDecimal getFixedAmtRefund() {
		return fixedAmtRefund;
	}

	public void setFixedAmtRefund(BigDecimal fixedAmtRefund) {
		this.fixedAmtRefund = fixedAmtRefund;
	}

	public String getCompoundingMethod() {
		return compoundingMethod;
	}

	public void setCompoundingMethod(String compoundingMethod) {
		this.compoundingMethod = compoundingMethod;
	}

	public Date getDateStopCompounding() {
		return dateStopCompounding;
	}

	public void setDateStopCompounding(Date dateStopCompounding) {
		this.dateStopCompounding = dateStopCompounding;
	}

	public Long getShortDateStopCompounding() {
		return shortDateStopCompounding;
	}

	public void setShortDateStopCompounding(Long shortDateStopCompounding) {
		this.shortDateStopCompounding = shortDateStopCompounding;
	}

	public String getRefundGPPProfit() {
		return refundGPPProfit;
	}

	public void setRefundGPPProfit(String refundGPPProfit) {
		this.refundGPPProfit = refundGPPProfit;
	}

	public String getRefundFulRelProfit() {
		return refundFulRelProfit;
	}

	public void setRefundFulRelProfit(String refundFulRelProfit) {
		this.refundFulRelProfit = refundFulRelProfit;
	}

	public BigDecimal getComissionFees() {
		return comissionFees;
	}

	public void setComissionFees(BigDecimal comissionFees) {
		this.comissionFees = comissionFees;
	}

	public BigDecimal getCommissionRate() {
		return commissionRate;
	}

	public void setCommissionRate(BigDecimal commissionRate) {
		this.commissionRate = commissionRate;
	}

	public BigDecimal getFixedCommissionAmt() {
		return fixedCommissionAmt;
	}

	public void setFixedCommissionAmt(BigDecimal fixedCommissionAmt) {
		this.fixedCommissionAmt = fixedCommissionAmt;
	}

	public Integer getCommissionTerm() {
		return commissionTerm;
	}

	public void setCommissionTerm(Integer commissionTerm) {
		this.commissionTerm = commissionTerm;
	}

	public Date getCommissionExpiryDate() {
		return commissionExpiryDate;
	}

	public void setCommissionExpiryDate(Date commissionExpiryDate) {
		this.commissionExpiryDate = commissionExpiryDate;
	}

	public Long getShortCommissionExpiryDate() {
		return shortCommissionExpiryDate;
	}

	public void setShortCommissionExpiryDate(Long shortCommissionExpiryDate) {
		this.shortCommissionExpiryDate = shortCommissionExpiryDate;
	}

	public String getExcCMPInPaymentAmt() {
		return excCMPInPaymentAmt;
	}

	public void setExcCMPInPaymentAmt(String excCMPInPaymentAmt) {
		this.excCMPInPaymentAmt = excCMPInPaymentAmt;
	}

	public String getIbsDualMode() {
		return ibsDualMode;
	}

	public void setIbsDualMode(String ibsDualMode) {
		this.ibsDualMode = ibsDualMode;
	}

	public Date getSpAgreementDate() {
		return spAgreementDate;
	}

	public void setSpAgreementDate(Date spAgreementDate) {
		this.spAgreementDate = spAgreementDate;
	}

	public Long getShortSPAgreementDate() {
		return shortSPAgreementDate;
	}

	public void setShortSPAgreementDate(Long shortSPAgreementDate) {
		this.shortSPAgreementDate = shortSPAgreementDate;
	}

	public String getGppDurationForSPDate() {
		return gppDurationForSPDate;
	}

	public void setGppDurationForSPDate(String gppDurationForSPDate) {
		this.gppDurationForSPDate = gppDurationForSPDate;
	}

	public Integer getSpTerm() {
		return spTerm;
	}

	public void setSpTerm(Integer spTerm) {
		this.spTerm = spTerm;
	}

	public String getSpTermCode() {
		return spTermCode;
	}

	public void setSpTermCode(String spTermCode) {
		this.spTermCode = spTermCode;
	}

	public String getFullRelProfitOn12Mtd() {
		return fullRelProfitOn12Mtd;
	}

	public void setFullRelProfitOn12Mtd(String fullRelProfitOn12Mtd) {
		this.fullRelProfitOn12Mtd = fullRelProfitOn12Mtd;
	}

	public String getLoanCategory() {
		return loanCategory;
	}

	public void setLoanCategory(String loanCategory) {
		this.loanCategory = loanCategory;
	}

	public void setSuccessResponse() {
		setCommonSuccessResponse();
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				result.append(this.getClass().getName() + " Object {" + newLine);
				// todo
				result.append("}");
			}
		}

		return result.toString();
	}
}

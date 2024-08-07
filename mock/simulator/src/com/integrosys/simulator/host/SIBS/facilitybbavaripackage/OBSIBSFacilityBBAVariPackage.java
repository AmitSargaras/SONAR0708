package com.integrosys.simulator.host.SIBS.facilitybbavaripackage;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFacilityBBAVariPackage extends OBMessageHeader implements IOBHost {
	private Long applicationNo;

	private String facilityCode;

	private Long seqNo;

	private BigDecimal customerProfitRate;

	private String rebateMethod;

	private String gppPaymentMode;

	private String gppCalMethod;

	private Integer gppTerm;

	private String termCode;

	private String fullReleaseProfit;

	private String fullReleaseRebateMethod;

	private String fullReleaseComputationMethod;

	private BigDecimal paymentAmt;

	private BigDecimal finalPaymentAmt;

	private BigDecimal totalGPPAmt;

	private BigDecimal sellingPrice;

	private BigDecimal totalProfit;

	private Date lastMaintainDate;

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

	public BigDecimal getCustomerProfitRate() {
		return customerProfitRate;
	}

	public void setCustomerProfitRate(BigDecimal customerProfitRate) {
		this.customerProfitRate = customerProfitRate;
	}

	public String getRebateMethod() {
		return rebateMethod;
	}

	public void setRebateMethod(String rebateMethod) {
		this.rebateMethod = rebateMethod;
	}

	public String getGppPaymentMode() {
		return gppPaymentMode;
	}

	public void setGppPaymentMode(String gppPaymentMode) {
		this.gppPaymentMode = gppPaymentMode;
	}

	public String getGppCalMethod() {
		return gppCalMethod;
	}

	public void setGppCalMethod(String gppCalMethod) {
		this.gppCalMethod = gppCalMethod;
	}

	public Integer getGppTerm() {
		return gppTerm;
	}

	public void setGppTerm(Integer gppTerm) {
		this.gppTerm = gppTerm;
	}

	public String getTermCode() {
		return termCode;
	}

	public void setTermCode(String termCode) {
		this.termCode = termCode;
	}

	public String getFullReleaseProfit() {
		return fullReleaseProfit;
	}

	public void setFullReleaseProfit(String fullReleaseProfit) {
		this.fullReleaseProfit = fullReleaseProfit;
	}

	public String getFullReleaseRebateMethod() {
		return fullReleaseRebateMethod;
	}

	public void setFullReleaseRebateMethod(String fullReleaseRebateMethod) {
		this.fullReleaseRebateMethod = fullReleaseRebateMethod;
	}

	public String getFullReleaseComputationMethod() {
		return fullReleaseComputationMethod;
	}

	public void setFullReleaseComputationMethod(String fullReleaseComputationMethod) {
		this.fullReleaseComputationMethod = fullReleaseComputationMethod;
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

	public BigDecimal getTotalGPPAmt() {
		return totalGPPAmt;
	}

	public void setTotalGPPAmt(BigDecimal totalGPPAmt) {
		this.totalGPPAmt = totalGPPAmt;
	}

	public BigDecimal getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(BigDecimal sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public BigDecimal getTotalProfit() {
		return totalProfit;
	}

	public void setTotalProfit(BigDecimal totalProfit) {
		this.totalProfit = totalProfit;
	}

	public Date getLastMaintainDate() {
		return lastMaintainDate;
	}

	public void setLastMaintainDate(Date lastMaintainDate) {
		this.lastMaintainDate = lastMaintainDate;
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

package com.integrosys.simulator.host.SIBS.facilitymultitierfinancing;

import java.math.BigDecimal;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFacilityMultiTierFinancing extends OBMessageHeader implements IOBHost {
	private Long applicationNo;

	private String facilityCode;

	private Long sequenceNo;

	private Integer tierSeqNo;

	private Integer tierTerm;

	private String tierTermCode;

	private BigDecimal rate;

	private Integer rateNumber;

	private BigDecimal rateVariance;

	private String varianceCode;

	private String gppIndicator;

	private BigDecimal newPaymentAmt;

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

	public Long getSequenceNo() {
		return sequenceNo;
	}

	public void setSequenceNo(Long sequenceNo) {
		this.sequenceNo = sequenceNo;
	}

	public Integer getTierSeqNo() {
		return tierSeqNo;
	}

	public void setTierSeqNo(Integer tierSeqNo) {
		this.tierSeqNo = tierSeqNo;
	}

	public Integer getTierTerm() {
		return tierTerm;
	}

	public void setTierTerm(Integer tierTerm) {
		this.tierTerm = tierTerm;
	}

	public String getTierTermCode() {
		return tierTermCode;
	}

	public void setTierTermCode(String tierTermCode) {
		this.tierTermCode = tierTermCode;
	}

	public BigDecimal getRate() {
		return rate;
	}

	public void setRate(BigDecimal rate) {
		this.rate = rate;
	}

	public Integer getRateNumber() {
		return rateNumber;
	}

	public void setRateNumber(Integer rateNumber) {
		this.rateNumber = rateNumber;
	}

	public BigDecimal getRateVariance() {
		return rateVariance;
	}

	public void setRateVariance(BigDecimal rateVariance) {
		this.rateVariance = rateVariance;
	}

	public String getVarianceCode() {
		return varianceCode;
	}

	public void setVarianceCode(String varianceCode) {
		this.varianceCode = varianceCode;
	}

	public String getGppIndicator() {
		return gppIndicator;
	}

	public void setGppIndicator(String gppIndicator) {
		this.gppIndicator = gppIndicator;
	}

	public BigDecimal getNewPaymentAmt() {
		return newPaymentAmt;
	}

	public void setNewPaymentAmt(BigDecimal newPaymentAmt) {
		this.newPaymentAmt = newPaymentAmt;
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

package com.integrosys.simulator.host.SIBS.FacMultiTierInq;

import java.math.BigDecimal;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFacMultiTierInqRes extends OBMessageHeader implements IOBHost {

	private Long applicationNumber;

	private String facilityCode;

	private Long facilitySequence;

	private Long tierSequenceNumber;

	private Long tierTerm;

	private String tierTermCode;

	private BigDecimal rate;

	private Long rateNumber;

	private BigDecimal rateVariance;

	private String varianceCode;

	private BigDecimal newPaymentAmount;

	private String gppIndicator;

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

	public Long getTierSequenceNumber() {
		return tierSequenceNumber;
	}

	public void setTierSequenceNumber(Long tierSequenceNumber) {
		this.tierSequenceNumber = tierSequenceNumber;
	}

	public Long getTierTerm() {
		return tierTerm;
	}

	public void setTierTerm(Long tierTerm) {
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

	public Long getRateNumber() {
		return rateNumber;
	}

	public void setRateNumber(Long rateNumber) {
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

	public BigDecimal getNewPaymentAmount() {
		return newPaymentAmount;
	}

	public void setNewPaymentAmount(BigDecimal newPaymentAmount) {
		this.newPaymentAmount = newPaymentAmount;
	}

	public String getGppIndicator() {
		return gppIndicator;
	}

	public void setGppIndicator(String gppIndicator) {
		this.gppIndicator = gppIndicator;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSFacMultiTierInqRes facMultiTierRes = (OBSIBSFacMultiTierInqRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" applicationNumber: " + facMultiTierRes.getApplicationNumber() + newLine);
				result.append(" facilityCode: " + facMultiTierRes.getFacilityCode() + newLine);
				result.append(" facilitySequence: " + facMultiTierRes.getFacilitySequence() + newLine);
				result.append(" tierSequenceNumber: " + facMultiTierRes.getTierSequenceNumber() + newLine);
				result.append(" tierTerm: " + facMultiTierRes.getTierTerm() + newLine);
				result.append(" tierTermCode: " + facMultiTierRes.getTierTermCode() + newLine);
				result.append(" rate: " + facMultiTierRes.getRate() + newLine);
				result.append(" rateNumber: " + facMultiTierRes.getRateNumber() + newLine);
				result.append(" rateVariance: " + facMultiTierRes.getRateVariance() + newLine);
				result.append(" varianceCode: " + facMultiTierRes.getVarianceCode() + newLine);
				result.append(" newPaymentAmount: " + facMultiTierRes.getNewPaymentAmount() + newLine);
				result.append(" gppIndicator: " + facMultiTierRes.getGppIndicator() + newLine);
				result.append("}");
			}
		}

		return result.toString();

	}

	public void setSuccessResponse() {
	}

}

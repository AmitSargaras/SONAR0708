package com.integrosys.simulator.host.SIBS.FacMultiTierList;

import java.math.BigDecimal;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFacMultiTierListRes extends OBMessageHeader implements IOBHost {

	private Long applicationNumber;

	private String facilityCode;

	private Long facilitySequence;

	private Long tierSequenceNumber;

	private Long tierTerm;

	private String tierTermCode;

	private BigDecimal rate;

	private BigDecimal newPaymentRate;

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

	public BigDecimal getNewPaymentRate() {
		return newPaymentRate;
	}

	public void setNewPaymentRate(BigDecimal newPaymentRate) {
		this.newPaymentRate = newPaymentRate;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSFacMultiTierListRes loanAcctFuturePaymentRes = (OBSIBSFacMultiTierListRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" applicationNumber: " + loanAcctFuturePaymentRes.getApplicationNumber() + newLine);
				result.append(" facilityCode: " + loanAcctFuturePaymentRes.getFacilityCode() + newLine);
				result.append(" facilitySequence: " + loanAcctFuturePaymentRes.getFacilitySequence() + newLine);
				result.append(" tierSequenceNumber: " + loanAcctFuturePaymentRes.getTierSequenceNumber() + newLine);
				result.append(" tierTerm: " + loanAcctFuturePaymentRes.getTierTerm() + newLine);
				result.append(" tierTermCode: " + loanAcctFuturePaymentRes.getTierTermCode() + newLine);
				result.append(" rate: " + loanAcctFuturePaymentRes.getRate() + newLine);
				result.append(" newPaymentRate: " + loanAcctFuturePaymentRes.getNewPaymentRate() + newLine);
				result.append("}");
			}
		}

		return result.toString();

	}

	public void setSuccessResponse() {
	}

}

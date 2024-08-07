package com.integrosys.simulator.host.SIBS.CIFSCLInquiry;

import java.math.BigDecimal;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCustomerSCLInquiryRes extends OBMessageHeader implements IOBHost {

	private Long customerNumber;

	private BigDecimal individualSecuredLimit;

	private BigDecimal individualUnsecuredLimit;

	private BigDecimal enterpriseSecuredLimit;

	private BigDecimal enterpriseUnsecuredLimit;

	public Long getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(Long customerNumber) {
		this.customerNumber = customerNumber;
	}

	public BigDecimal getIndividualSecuredLimit() {
		return individualSecuredLimit;
	}

	public void setIndividualSecuredLimit(BigDecimal individualSecuredLimit) {
		this.individualSecuredLimit = individualSecuredLimit;
	}

	public BigDecimal getIndividualUnsecuredLimit() {
		return individualUnsecuredLimit;
	}

	public void setIndividualUnsecuredLimit(BigDecimal individualUnsecuredLimit) {
		this.individualUnsecuredLimit = individualUnsecuredLimit;
	}

	public BigDecimal getEnterpriseSecuredLimit() {
		return enterpriseSecuredLimit;
	}

	public void setEnterpriseSecuredLimit(BigDecimal enterpriseSecuredLimit) {
		this.enterpriseSecuredLimit = enterpriseSecuredLimit;
	}

	public BigDecimal getEnterpriseUnsecuredLimit() {
		return enterpriseUnsecuredLimit;
	}

	public void setEnterpriseUnsecuredLimit(BigDecimal enterpriseUnsecuredLimit) {
		this.enterpriseUnsecuredLimit = enterpriseUnsecuredLimit;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSCustomerSCLInquiryRes inquiryRes = (OBSIBSCustomerSCLInquiryRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" customerNumber: " + inquiryRes.getCustomerNumber() + newLine);
				result.append(" individualSecuredLimit: " + inquiryRes.getIndividualSecuredLimit() + newLine);
				result.append(" individualUnsecuredLimit: " + inquiryRes.getIndividualUnsecuredLimit() + newLine);
				result.append(" enterpriseSecuredLimit: " + inquiryRes.getEnterpriseSecuredLimit() + newLine);
				result.append(" enterpriseUnsecuredLimit: " + inquiryRes.getEnterpriseUnsecuredLimit() + newLine);
				result.append("}");
			}
		}

		return result.toString();

	}

	public void setSuccessResponse() {
	}

}

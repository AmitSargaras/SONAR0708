package com.integrosys.simulator.host.SIBS.APPCreate;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSAppCreateRes extends OBMessageHeader implements IOBHost {
	private Long applicationNumber;

	private Long applicationCifNumber;

	private Long applicationBranchNumber;

	private String shortName;

	private String formattedShortName;

	private String bumiCode;

	private String maritalStatus;

	private String decisionCenter;

	private Long m1h;

	private Long q1;

	private String ccbBorrCode;

	private String excControlCode;

	private Date renewalDate;

	private Long revisionNumber;

	private String exemptFlag;

	private String aaSICCode1;

	private String aaSICCode2;

	private String aaSICCode3;

	private String aaSICCode4;

	private String workingExperience;

	private String refinanceFrom;

	private BigDecimal customerLimit;

	private String reviewRemarks;

	private String suspendStatus;

	private String refinanceFromBankId;

	public Long getApplicationNumber() {
		return applicationNumber;
	}

	public void setApplicationNumber(Long applicationNumber) {
		this.applicationNumber = applicationNumber;
	}

	public Long getApplicationCifNumber() {
		return applicationCifNumber;
	}

	public void setApplicationCifNumber(Long applicationCifNumber) {
		this.applicationCifNumber = applicationCifNumber;
	}

	public Long getApplicationBranchNumber() {
		return applicationBranchNumber;
	}

	public void setApplicationBranchNumber(Long applicationBranchNumber) {
		this.applicationBranchNumber = applicationBranchNumber;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public String getFormattedShortName() {
		return formattedShortName;
	}

	public void setFormattedShortName(String formattedShortName) {
		this.formattedShortName = formattedShortName;
	}

	public String getBumiCode() {
		return bumiCode;
	}

	public void setBumiCode(String bumiCode) {
		this.bumiCode = bumiCode;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getDecisionCenter() {
		return decisionCenter;
	}

	public void setDecisionCenter(String decisionCenter) {
		this.decisionCenter = decisionCenter;
	}

	public Long getM1h() {
		return m1h;
	}

	public void setM1h(Long m1h) {
		this.m1h = m1h;
	}

	public Long getQ1() {
		return q1;
	}

	public void setQ1(Long q1) {
		this.q1 = q1;
	}

	public String getCcbBorrCode() {
		return ccbBorrCode;
	}

	public void setCcbBorrCode(String ccbBorrCode) {
		this.ccbBorrCode = ccbBorrCode;
	}

	public String getExcControlCode() {
		return excControlCode;
	}

	public void setExcControlCode(String excControlCode) {
		this.excControlCode = excControlCode;
	}

	public Date getRenewalDate() {
		return renewalDate;
	}

	public void setRenewalDate(Date renewalDate) {
		this.renewalDate = renewalDate;
	}

	public Long getRevisionNumber() {
		return revisionNumber;
	}

	public void setRevisionNumber(Long revisionNumber) {
		this.revisionNumber = revisionNumber;
	}

	public String getExemptFlag() {
		return exemptFlag;
	}

	public void setExemptFlag(String exemptFlag) {
		this.exemptFlag = exemptFlag;
	}

	public String getAaSICCode1() {
		return aaSICCode1;
	}

	public void setAaSICCode1(String aaSICCode1) {
		this.aaSICCode1 = aaSICCode1;
	}

	public String getAaSICCode2() {
		return aaSICCode2;
	}

	public void setAaSICCode2(String aaSICCode2) {
		this.aaSICCode2 = aaSICCode2;
	}

	public String getAaSICCode3() {
		return aaSICCode3;
	}

	public void setAaSICCode3(String aaSICCode3) {
		this.aaSICCode3 = aaSICCode3;
	}

	public String getAaSICCode4() {
		return aaSICCode4;
	}

	public void setAaSICCode4(String aaSICCode4) {
		this.aaSICCode4 = aaSICCode4;
	}

	public String getWorkingExperience() {
		return workingExperience;
	}

	public void setWorkingExperience(String workingExperience) {
		this.workingExperience = workingExperience;
	}

	public String getRefinanceFrom() {
		return refinanceFrom;
	}

	public void setRefinanceFrom(String refinanceFrom) {
		this.refinanceFrom = refinanceFrom;
	}

	public BigDecimal getCustomerLimit() {
		return customerLimit;
	}

	public void setCustomerLimit(BigDecimal customerLimit) {
		this.customerLimit = customerLimit;
	}

	public String getReviewRemarks() {
		return reviewRemarks;
	}

	public void setReviewRemarks(String reviewRemarks) {
		this.reviewRemarks = reviewRemarks;
	}

	public String getSuspendStatus() {
		return suspendStatus;
	}

	public void setSuspendStatus(String suspendStatus) {
		this.suspendStatus = suspendStatus;
	}

	public String getRefinanceFromBankId() {
		return refinanceFromBankId;
	}

	public void setRefinanceFromBankId(String refinanceFromBankId) {
		this.refinanceFromBankId = refinanceFromBankId;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSAppCreateRes appDetailInqRes = (OBSIBSAppCreateRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" applicationNumber: " + appDetailInqRes.getApplicationNumber() + newLine);
				result.append(" applicationCifNumber: " + appDetailInqRes.getApplicationCifNumber() + newLine);
				result.append(" applicationBranchNumber: " + appDetailInqRes.getApplicationBranchNumber() + newLine);
				result.append(" shortName: " + appDetailInqRes.getShortName() + newLine);
				result.append(" formattedShortName: " + appDetailInqRes.getFormattedShortName() + newLine);
				result.append(" bumiCode: " + appDetailInqRes.getBumiCode() + newLine);
				result.append(" maritalStatus: " + appDetailInqRes.getMaritalStatus() + newLine);
				result.append(" decisionCenter: " + appDetailInqRes.getDecisionCenter() + newLine);
				result.append(" m1h: " + appDetailInqRes.getM1h() + newLine);
				result.append(" q1: " + appDetailInqRes.getQ1() + newLine);
				result.append(" ccbBorrCode: " + appDetailInqRes.getCcbBorrCode() + newLine);
				result.append(" excControlCode: " + appDetailInqRes.getExcControlCode() + newLine);
				result.append(" renewalDate: " + appDetailInqRes.getRenewalDate() + newLine);
				result.append(" revisionNumber: " + appDetailInqRes.getRevisionNumber() + newLine);
				result.append(" exemptFlag: " + appDetailInqRes.getExemptFlag() + newLine);
				result.append(" aaSICCode1: " + appDetailInqRes.getAaSICCode1() + newLine);
				result.append(" aaSICCode2: " + appDetailInqRes.getAaSICCode2() + newLine);
				result.append(" aaSICCode3: " + appDetailInqRes.getAaSICCode3() + newLine);
				result.append(" aaSICCode4: " + appDetailInqRes.getAaSICCode4() + newLine);
				result.append(" workingExperience: " + appDetailInqRes.getWorkingExperience() + newLine);
				result.append(" refinanceFrom: " + appDetailInqRes.getRefinanceFrom() + newLine);
				result.append(" customerLimit: " + appDetailInqRes.getCustomerLimit() + newLine);
				result.append(" reviewRemarks: " + appDetailInqRes.getReviewRemarks() + newLine);
				result.append(" suspendStatus: " + appDetailInqRes.getSuspendStatus() + newLine);
				result.append(" refinanceFromBankId: " + appDetailInqRes.getRefinanceFromBankId() + newLine);
				result.append("}");
			}
		}

		return result.toString();
	}

	public void setSuccessResponse() {
	}
}

package com.integrosys.simulator.host.SIBS.APPSearch;

import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSAppSearchRes extends OBMessageHeader implements IOBHost {
	private String idNumber;

	private String idTypeCode;

	private String idIssueCountry;

	private Long customerNumber;

	private Long applicationNumber;

	private Long applicationBranchNumber;// AABRN

	private Date applicationDate;

	private String shortName;

	private String formattedShortName;

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getIdTypeCode() {
		return idTypeCode;
	}

	public void setIdTypeCode(String idTypeCode) {
		this.idTypeCode = idTypeCode;
	}

	public String getIdIssueCountry() {
		return idIssueCountry;
	}

	public void setIdIssueCountry(String idIssueCountry) {
		this.idIssueCountry = idIssueCountry;
	}

	public Long getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(Long customerNumber) {
		this.customerNumber = customerNumber;
	}

	public Long getApplicationNumber() {
		return applicationNumber;
	}

	public void setApplicationNumber(Long applicationNumber) {
		this.applicationNumber = applicationNumber;
	}

	public Long getApplicationBranchNumber() {
		return applicationBranchNumber;
	}

	public void setApplicationBranchNumber(Long applicationBranchNumber) {
		this.applicationBranchNumber = applicationBranchNumber;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
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

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSAppSearchRes appSearchRes = (OBSIBSAppSearchRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" idNumber: " + appSearchRes.getIdNumber() + newLine);
				result.append(" idTypeCode: " + appSearchRes.getIdTypeCode() + newLine);
				result.append(" idIssueCountry: " + appSearchRes.getIdIssueCountry() + newLine);
				result.append(" applicationNumber: " + appSearchRes.getApplicationNumber() + newLine);
				result.append(" applicationBranchNumber: " + appSearchRes.getApplicationBranchNumber() + newLine);
				result.append(" applicationDate: " + appSearchRes.getApplicationDate() + newLine);
				result.append(" shortName: " + appSearchRes.getShortName() + newLine);
				result.append(" formattedShortName: " + appSearchRes.getFormattedShortName() + newLine);
				result.append("}");
			}
		}

		return result.toString();
	}

	public void setSuccessResponse() {
	}

}

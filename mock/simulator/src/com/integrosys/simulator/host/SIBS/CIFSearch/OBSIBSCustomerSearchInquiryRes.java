package com.integrosys.simulator.host.SIBS.CIFSearch;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCustomerSearchInquiryRes extends OBMessageHeader implements IOBHost {

	private String idNumber;

	private String idType;

	private String idIssueCountry;

	private String mainIdFlag;

	private Long customerNumber;

	private String formattedShortName;

	private String searchMethod;

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getIdType() {
		return idType;
	}

	public void setIdType(String idType) {
		this.idType = idType;
	}

	public String getIdIssueCountry() {
		return idIssueCountry;
	}

	public void setIdIssueCountry(String idIssueCountry) {
		this.idIssueCountry = idIssueCountry;
	}

	public String getMainIdFlag() {
		return mainIdFlag;
	}

	public void setMainIdFlag(String mainIdFlag) {
		this.mainIdFlag = mainIdFlag;
	}

	public Long getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(Long customerNumber) {
		this.customerNumber = customerNumber;
	}

	public String getFormattedShortName() {
		return formattedShortName;
	}

	public void setFormattedShortName(String formattedShortName) {
		this.formattedShortName = formattedShortName;
	}

	public String getSearchMethod() {
		return searchMethod;
	}

	public void setSearchMethod(String searchMethod) {
		this.searchMethod = searchMethod;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSCustomerSearchInquiryRes inquiryRes = (OBSIBSCustomerSearchInquiryRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" idNumber: " + inquiryRes.getIdNumber() + newLine);
				result.append(" idType: " + inquiryRes.getIdType() + newLine);
				result.append(" idIssueCountry: " + inquiryRes.getIdIssueCountry() + newLine);
				result.append(" mainIdFlag: " + inquiryRes.getMainIdFlag() + newLine);
				result.append(" customerNumber: " + inquiryRes.getCustomerNumber() + newLine);
				result.append(" formattedShortName: " + inquiryRes.getFormattedShortName() + newLine);
				result.append(" searchMethod: " + inquiryRes.getSearchMethod() + newLine);
				result.append("}");
			}
		}

		return result.toString();

	}

	public void setSuccessResponse() {
	}

}

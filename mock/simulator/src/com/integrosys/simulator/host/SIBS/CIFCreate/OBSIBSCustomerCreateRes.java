package com.integrosys.simulator.host.SIBS.CIFCreate;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCustomerCreateRes extends OBMessageHeader implements IOBHost {

	private Long customerNumber;

	private Long retention;

	private Long customerBranchNumber;

	private Long costCenter;

	private Long customerStatus;

	private String customerType;

	private String salutation;

	private String shortName;

	private String formattedShortName;

	private String customerName1;

	private String customerName2;

	private String motherMaidenName;

	private String officerCode;

	private String insiderCode;

	private String vipCustomerCode;

	private String holdMailCode;

	private Long addressSequence;

	private String residentCode;

	private String serviceRecoveryCode;

	private String countryCitizenship;

	private String residence;

	private String race;

	private String religionCode;

	private String languageIdentifier;

	private String idNumber;

	private String idTypeCode;

	private Date dateOfBirth;

	private String placeOfBirth;

	private String maritalStatus;

	private Date maritalStatusDate;

	private String deceasedCustomerFlag;

	private Date deceasedDate;

	private String gender;

	private String classes;

	private String individual;

	private String smsaCode;

	private String businessType;

	private String customerRating;

	private String cifGroupCode;

	private int cifCombinedCycle;

	private String customerStatus2;// CFSTSC

	private Date customerStatusDate;

	private String idIssueCountry;

	private String ratingBody;

	private String ratingCode;

	private Date ratingDate;

	private Long electronicAddressSequence1;

	private String electronicAddressCode1;

	private String electronicAddressDescription1;

	private String mailingIndicator1;

	private String contactName1;

	private Long electronicAddressSequence2;

	private String electronicAddressCode2;

	private String electronicAddressDescription2;

	private String mailingIndicator2;

	private String contactName2;

	private Long electronicAddressSequence3;

	private String electronicAddressCode3;

	private String electronicAddressDescription3;

	private String mailingIndicator3;

	private String contactName3;

	private Long electronicAddressSequence4;

	private String electronicAddressCode4;

	private String electronicAddressDescription4;

	private String mailingIndicator4;

	private String contactName4;

	private Long electronicAddressSequence5;

	private String electronicAddressCode5;

	private String electronicAddressDescription5;

	private String mailingIndicator5;

	private String contactName5;

	private Long employmentHistorySequence;

	private String employmentStatus;

	private Date employmentStartDate;

	private String jobDesignationCode;

	private String occupationCode;

	private String typeOfEmployment;

	private String incomeBracketCode;

	private BigDecimal income;

	private BigDecimal otherIncome;

	private BigDecimal expenditure;

	private String employerName;

	private String remark1;

	private String remark2;

	private String employeeId;

	private String employerIndusryCode;

	private String employerIndusryRating;

	private Long previousEmploymentSequence;

	private String previousEmploymentStatus;

	private Date previousEmploymentStartDate;

	private String previousJobDesignationCode;

	private String previousOccupationCode;

	private String previousTypeOfEmployment;

	private String previousIncomeBracket;

	private BigDecimal previousIncome;

	private BigDecimal previousOtherIncome;

	private BigDecimal previousExpenditure;

	private String previousEmployerName;

	private String previousRemark1;

	private String previousRemark2;

	private String previousEmployeeId;

	private String previousEmployerIndusryCode;

	private String previousEmployerIndusryRating;

	private String idNumber2;

	private String idTypeCode2;

	private String idIssueCountry2;

	private String idNumber3;

	private String idTypeCode3;

	private String idIssueCountry3;

	public Long getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(Long customerNumber) {
		this.customerNumber = customerNumber;
	}

	public Long getRetention() {
		return retention;
	}

	public void setRetention(Long retention) {
		this.retention = retention;
	}

	public Long getCustomerBranchNumber() {
		return customerBranchNumber;
	}

	public void setCustomerBranchNumber(Long customerBranchNumber) {
		this.customerBranchNumber = customerBranchNumber;
	}

	public Long getCostCenter() {
		return costCenter;
	}

	public void setCostCenter(Long costCenter) {
		this.costCenter = costCenter;
	}

	public Long getCustomerStatus() {
		return customerStatus;
	}

	public void setCustomerStatus(Long customerStatus) {
		this.customerStatus = customerStatus;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getSalutation() {
		return salutation;
	}

	public void setSalutation(String salutation) {
		this.salutation = salutation;
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

	public String getCustomerName1() {
		return customerName1;
	}

	public void setCustomerName1(String customerName1) {
		this.customerName1 = customerName1;
	}

	public String getCustomerName2() {
		return customerName2;
	}

	public void setCustomerName2(String customerName2) {
		this.customerName2 = customerName2;
	}

	public String getMotherMaidenName() {
		return motherMaidenName;
	}

	public void setMotherMaidenName(String motherMaidenName) {
		this.motherMaidenName = motherMaidenName;
	}

	public String getOfficerCode() {
		return officerCode;
	}

	public void setOfficerCode(String officerCode) {
		this.officerCode = officerCode;
	}

	public String getInsiderCode() {
		return insiderCode;
	}

	public void setInsiderCode(String insiderCode) {
		this.insiderCode = insiderCode;
	}

	public String getVipCustomerCode() {
		return vipCustomerCode;
	}

	public void setVipCustomerCode(String vipCustomerCode) {
		this.vipCustomerCode = vipCustomerCode;
	}

	public String getHoldMailCode() {
		return holdMailCode;
	}

	public void setHoldMailCode(String holdMailCode) {
		this.holdMailCode = holdMailCode;
	}

	public Long getAddressSequence() {
		return addressSequence;
	}

	public void setAddressSequence(Long addressSequence) {
		this.addressSequence = addressSequence;
	}

	public String getResidentCode() {
		return residentCode;
	}

	public void setResidentCode(String residentCode) {
		this.residentCode = residentCode;
	}

	public String getServiceRecoveryCode() {
		return serviceRecoveryCode;
	}

	public void setServiceRecoveryCode(String serviceRecoveryCode) {
		this.serviceRecoveryCode = serviceRecoveryCode;
	}

	public String getCountryCitizenship() {
		return countryCitizenship;
	}

	public void setCountryCitizenship(String countryCitizenship) {
		this.countryCitizenship = countryCitizenship;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getRace() {
		return race;
	}

	public void setRace(String race) {
		this.race = race;
	}

	public String getReligionCode() {
		return religionCode;
	}

	public void setReligionCode(String religionCode) {
		this.religionCode = religionCode;
	}

	public String getLanguageIdentifier() {
		return languageIdentifier;
	}

	public void setLanguageIdentifier(String languageIdentifier) {
		this.languageIdentifier = languageIdentifier;
	}

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

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getPlaceOfBirth() {
		return placeOfBirth;
	}

	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public Date getMaritalStatusDate() {
		return maritalStatusDate;
	}

	public void setMaritalStatusDate(Date maritalStatusDate) {
		this.maritalStatusDate = maritalStatusDate;
	}

	public String getDeceasedCustomerFlag() {
		return deceasedCustomerFlag;
	}

	public void setDeceasedCustomerFlag(String deceasedCustomerFlag) {
		this.deceasedCustomerFlag = deceasedCustomerFlag;
	}

	public Date getDeceasedDate() {
		return deceasedDate;
	}

	public void setDeceasedDate(Date deceasedDate) {
		this.deceasedDate = deceasedDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getClasses() {
		return classes;
	}

	public void setClasses(String classes) {
		this.classes = classes;
	}

	public String getIndividual() {
		return individual;
	}

	public void setIndividual(String individual) {
		this.individual = individual;
	}

	public String getSmsaCode() {
		return smsaCode;
	}

	public void setSmsaCode(String smsaCode) {
		this.smsaCode = smsaCode;
	}

	public String getBusinessType() {
		return businessType;
	}

	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}

	public String getCustomerRating() {
		return customerRating;
	}

	public void setCustomerRating(String customerRating) {
		this.customerRating = customerRating;
	}

	public String getCifGroupCode() {
		return cifGroupCode;
	}

	public void setCifGroupCode(String cifGroupCode) {
		this.cifGroupCode = cifGroupCode;
	}

	public int getCifCombinedCycle() {
		return cifCombinedCycle;
	}

	public void setCifCombinedCycle(int cifCombinedCycle) {
		this.cifCombinedCycle = cifCombinedCycle;
	}

	public String getCustomerStatus2() {
		return customerStatus2;
	}

	public void setCustomerStatus2(String customerStatus2) {
		this.customerStatus2 = customerStatus2;
	}

	public Date getCustomerStatusDate() {
		return customerStatusDate;
	}

	public void setCustomerStatusDate(Date customerStatusDate) {
		this.customerStatusDate = customerStatusDate;
	}

	public String getIdIssueCountry() {
		return idIssueCountry;
	}

	public void setIdIssueCountry(String idIssueCountry) {
		this.idIssueCountry = idIssueCountry;
	}

	public String getRatingBody() {
		return ratingBody;
	}

	public void setRatingBody(String ratingBody) {
		this.ratingBody = ratingBody;
	}

	public String getRatingCode() {
		return ratingCode;
	}

	public void setRatingCode(String ratingCode) {
		this.ratingCode = ratingCode;
	}

	public Date getRatingDate() {
		return ratingDate;
	}

	public void setRatingDate(Date ratingDate) {
		this.ratingDate = ratingDate;
	}

	public Long getElectronicAddressSequence1() {
		return electronicAddressSequence1;
	}

	public void setElectronicAddressSequence1(Long electronicAddressSequence1) {
		this.electronicAddressSequence1 = electronicAddressSequence1;
	}

	public String getElectronicAddressCode1() {
		return electronicAddressCode1;
	}

	public void setElectronicAddressCode1(String electronicAddressCode1) {
		this.electronicAddressCode1 = electronicAddressCode1;
	}

	public String getElectronicAddressDescription1() {
		return electronicAddressDescription1;
	}

	public void setElectronicAddressDescription1(String electronicAddressDescription1) {
		this.electronicAddressDescription1 = electronicAddressDescription1;
	}

	public String getMailingIndicator1() {
		return mailingIndicator1;
	}

	public void setMailingIndicator1(String mailingIndicator1) {
		this.mailingIndicator1 = mailingIndicator1;
	}

	public String getContactName1() {
		return contactName1;
	}

	public void setContactName1(String contactName1) {
		this.contactName1 = contactName1;
	}

	public Long getElectronicAddressSequence2() {
		return electronicAddressSequence2;
	}

	public void setElectronicAddressSequence2(Long electronicAddressSequence2) {
		this.electronicAddressSequence2 = electronicAddressSequence2;
	}

	public String getElectronicAddressCode2() {
		return electronicAddressCode2;
	}

	public void setElectronicAddressCode2(String electronicAddressCode2) {
		this.electronicAddressCode2 = electronicAddressCode2;
	}

	public String getElectronicAddressDescription2() {
		return electronicAddressDescription2;
	}

	public void setElectronicAddressDescription2(String electronicAddressDescription2) {
		this.electronicAddressDescription2 = electronicAddressDescription2;
	}

	public String getMailingIndicator2() {
		return mailingIndicator2;
	}

	public void setMailingIndicator2(String mailingIndicator2) {
		this.mailingIndicator2 = mailingIndicator2;
	}

	public String getContactName2() {
		return contactName2;
	}

	public void setContactName2(String contactName2) {
		this.contactName2 = contactName2;
	}

	public Long getElectronicAddressSequence3() {
		return electronicAddressSequence3;
	}

	public void setElectronicAddressSequence3(Long electronicAddressSequence3) {
		this.electronicAddressSequence3 = electronicAddressSequence3;
	}

	public String getElectronicAddressCode3() {
		return electronicAddressCode3;
	}

	public void setElectronicAddressCode3(String electronicAddressCode3) {
		this.electronicAddressCode3 = electronicAddressCode3;
	}

	public String getElectronicAddressDescription3() {
		return electronicAddressDescription3;
	}

	public void setElectronicAddressDescription3(String electronicAddressDescription3) {
		this.electronicAddressDescription3 = electronicAddressDescription3;
	}

	public String getMailingIndicator3() {
		return mailingIndicator3;
	}

	public void setMailingIndicator3(String mailingIndicator3) {
		this.mailingIndicator3 = mailingIndicator3;
	}

	public String getContactName3() {
		return contactName3;
	}

	public void setContactName3(String contactName3) {
		this.contactName3 = contactName3;
	}

	public Long getElectronicAddressSequence4() {
		return electronicAddressSequence4;
	}

	public void setElectronicAddressSequence4(Long electronicAddressSequence4) {
		this.electronicAddressSequence4 = electronicAddressSequence4;
	}

	public String getElectronicAddressCode4() {
		return electronicAddressCode4;
	}

	public void setElectronicAddressCode4(String electronicAddressCode4) {
		this.electronicAddressCode4 = electronicAddressCode4;
	}

	public String getElectronicAddressDescription4() {
		return electronicAddressDescription4;
	}

	public void setElectronicAddressDescription4(String electronicAddressDescription4) {
		this.electronicAddressDescription4 = electronicAddressDescription4;
	}

	public String getMailingIndicator4() {
		return mailingIndicator4;
	}

	public void setMailingIndicator4(String mailingIndicator4) {
		this.mailingIndicator4 = mailingIndicator4;
	}

	public String getContactName4() {
		return contactName4;
	}

	public void setContactName4(String contactName4) {
		this.contactName4 = contactName4;
	}

	public Long getElectronicAddressSequence5() {
		return electronicAddressSequence5;
	}

	public void setElectronicAddressSequence5(Long electronicAddressSequence5) {
		this.electronicAddressSequence5 = electronicAddressSequence5;
	}

	public String getElectronicAddressCode5() {
		return electronicAddressCode5;
	}

	public void setElectronicAddressCode5(String electronicAddressCode5) {
		this.electronicAddressCode5 = electronicAddressCode5;
	}

	public String getElectronicAddressDescription5() {
		return electronicAddressDescription5;
	}

	public void setElectronicAddressDescription5(String electronicAddressDescription5) {
		this.electronicAddressDescription5 = electronicAddressDescription5;
	}

	public String getMailingIndicator5() {
		return mailingIndicator5;
	}

	public void setMailingIndicator5(String mailingIndicator5) {
		this.mailingIndicator5 = mailingIndicator5;
	}

	public String getContactName5() {
		return contactName5;
	}

	public void setContactName5(String contactName5) {
		this.contactName5 = contactName5;
	}

	public Long getEmploymentHistorySequence() {
		return employmentHistorySequence;
	}

	public void setEmploymentHistorySequence(Long employmentHistorySequence) {
		this.employmentHistorySequence = employmentHistorySequence;
	}

	public String getEmploymentStatus() {
		return employmentStatus;
	}

	public void setEmploymentStatus(String employmentStatus) {
		this.employmentStatus = employmentStatus;
	}

	public Date getEmploymentStartDate() {
		return employmentStartDate;
	}

	public void setEmploymentStartDate(Date employmentStartDate) {
		this.employmentStartDate = employmentStartDate;
	}

	public String getJobDesignationCode() {
		return jobDesignationCode;
	}

	public void setJobDesignationCode(String jobDesignationCode) {
		this.jobDesignationCode = jobDesignationCode;
	}

	public String getOccupationCode() {
		return occupationCode;
	}

	public void setOccupationCode(String occupationCode) {
		this.occupationCode = occupationCode;
	}

	public String getTypeOfEmployment() {
		return typeOfEmployment;
	}

	public void setTypeOfEmployment(String typeOfEmployment) {
		this.typeOfEmployment = typeOfEmployment;
	}

	public String getIncomeBracketCode() {
		return incomeBracketCode;
	}

	public void setIncomeBracketCode(String incomeBracketCode) {
		this.incomeBracketCode = incomeBracketCode;
	}

	public BigDecimal getIncome() {
		return income;
	}

	public void setIncome(BigDecimal income) {
		this.income = income;
	}

	public BigDecimal getOtherIncome() {
		return otherIncome;
	}

	public void setOtherIncome(BigDecimal otherIncome) {
		this.otherIncome = otherIncome;
	}

	public BigDecimal getExpenditure() {
		return expenditure;
	}

	public void setExpenditure(BigDecimal expenditure) {
		this.expenditure = expenditure;
	}

	public String getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}

	public String getRemark1() {
		return remark1;
	}

	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployerIndusryCode() {
		return employerIndusryCode;
	}

	public void setEmployerIndusryCode(String employerIndusryCode) {
		this.employerIndusryCode = employerIndusryCode;
	}

	public String getEmployerIndusryRating() {
		return employerIndusryRating;
	}

	public void setEmployerIndusryRating(String employerIndusryRating) {
		this.employerIndusryRating = employerIndusryRating;
	}

	public Long getPreviousEmploymentSequence() {
		return previousEmploymentSequence;
	}

	public void setPreviousEmploymentSequence(Long previousEmploymentSequence) {
		this.previousEmploymentSequence = previousEmploymentSequence;
	}

	public String getPreviousEmploymentStatus() {
		return previousEmploymentStatus;
	}

	public void setPreviousEmploymentStatus(String previousEmploymentStatus) {
		this.previousEmploymentStatus = previousEmploymentStatus;
	}

	public Date getPreviousEmploymentStartDate() {
		return previousEmploymentStartDate;
	}

	public void setPreviousEmploymentStartDate(Date previousEmploymentStartDate) {
		this.previousEmploymentStartDate = previousEmploymentStartDate;
	}

	public String getPreviousJobDesignationCode() {
		return previousJobDesignationCode;
	}

	public void setPreviousJobDesignationCode(String previousJobDesignationCode) {
		this.previousJobDesignationCode = previousJobDesignationCode;
	}

	public String getPreviousOccupationCode() {
		return previousOccupationCode;
	}

	public void setPreviousOccupationCode(String previousOccupationCode) {
		this.previousOccupationCode = previousOccupationCode;
	}

	public String getPreviousTypeOfEmployment() {
		return previousTypeOfEmployment;
	}

	public void setPreviousTypeOfEmployment(String previousTypeOfEmployment) {
		this.previousTypeOfEmployment = previousTypeOfEmployment;
	}

	public String getPreviousIncomeBracket() {
		return previousIncomeBracket;
	}

	public void setPreviousIncomeBracket(String previousIncomeBracket) {
		this.previousIncomeBracket = previousIncomeBracket;
	}

	public BigDecimal getPreviousIncome() {
		return previousIncome;
	}

	public void setPreviousIncome(BigDecimal previousIncome) {
		this.previousIncome = previousIncome;
	}

	public BigDecimal getPreviousOtherIncome() {
		return previousOtherIncome;
	}

	public void setPreviousOtherIncome(BigDecimal previousOtherIncome) {
		this.previousOtherIncome = previousOtherIncome;
	}

	public BigDecimal getPreviousExpenditure() {
		return previousExpenditure;
	}

	public void setPreviousExpenditure(BigDecimal previousExpenditure) {
		this.previousExpenditure = previousExpenditure;
	}

	public String getPreviousEmployerName() {
		return previousEmployerName;
	}

	public void setPreviousEmployerName(String previousEmployerName) {
		this.previousEmployerName = previousEmployerName;
	}

	public String getPreviousRemark1() {
		return previousRemark1;
	}

	public void setPreviousRemark1(String previousRemark1) {
		this.previousRemark1 = previousRemark1;
	}

	public String getPreviousRemark2() {
		return previousRemark2;
	}

	public void setPreviousRemark2(String previousRemark2) {
		this.previousRemark2 = previousRemark2;
	}

	public String getPreviousEmployeeId() {
		return previousEmployeeId;
	}

	public void setPreviousEmployeeId(String previousEmployeeId) {
		this.previousEmployeeId = previousEmployeeId;
	}

	public String getPreviousEmployerIndusryCode() {
		return previousEmployerIndusryCode;
	}

	public void setPreviousEmployerIndusryCode(String previousEmployerIndusryCode) {
		this.previousEmployerIndusryCode = previousEmployerIndusryCode;
	}

	public String getPreviousEmployerIndusryRating() {
		return previousEmployerIndusryRating;
	}

	public void setPreviousEmployerIndusryRating(String previousEmployerIndusryRating) {
		this.previousEmployerIndusryRating = previousEmployerIndusryRating;
	}

	public String getIdNumber2() {
		return idNumber2;
	}

	public void setIdNumber2(String idNumber2) {
		this.idNumber2 = idNumber2;
	}

	public String getIdTypeCode2() {
		return idTypeCode2;
	}

	public void setIdTypeCode2(String idTypeCode2) {
		this.idTypeCode2 = idTypeCode2;
	}

	public String getIdIssueCountry2() {
		return idIssueCountry2;
	}

	public void setIdIssueCountry2(String idIssueCountry2) {
		this.idIssueCountry2 = idIssueCountry2;
	}

	public String getIdNumber3() {
		return idNumber3;
	}

	public void setIdNumber3(String idNumber3) {
		this.idNumber3 = idNumber3;
	}

	public String getIdTypeCode3() {
		return idTypeCode3;
	}

	public void setIdTypeCode3(String idTypeCode3) {
		this.idTypeCode3 = idTypeCode3;
	}

	public String getIdIssueCountry3() {
		return idIssueCountry3;
	}

	public void setIdIssueCountry3(String idIssueCountry3) {
		this.idIssueCountry3 = idIssueCountry3;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSCustomerCreateRes createRes = (OBSIBSCustomerCreateRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" customerNumber: " + createRes.getCustomerNumber() + newLine);
				result.append(" retention: " + createRes.getRetention() + newLine);
				result.append(" customerBranchNumber: " + createRes.getCustomerBranchNumber() + newLine);
				result.append(" costCenter: " + createRes.getCostCenter() + newLine);
				result.append(" customerStatus: " + createRes.getCustomerStatus() + newLine);
				result.append(" customerType: " + createRes.getCustomerType() + newLine);
				result.append(" salutation: " + createRes.getSalutation() + newLine);
				result.append(" shortName: " + createRes.getShortName() + newLine);
				result.append(" formattedShortName: " + createRes.getFormattedShortName() + newLine);
				result.append(" customerName1: " + createRes.getCustomerName1() + newLine);
				result.append(" customerName2: " + createRes.getCustomerName2() + newLine);
				result.append(" motherMaidenName: " + createRes.getMotherMaidenName() + newLine);
				result.append(" officerCode: " + createRes.getOfficerCode() + newLine);
				result.append(" insiderCode: " + createRes.getInsiderCode() + newLine);
				result.append(" vipCustomerCode: " + createRes.getVipCustomerCode() + newLine);
				result.append(" holdMailCode: " + createRes.getHoldMailCode() + newLine);
				result.append(" addressSequence: " + createRes.getAddressSequence() + newLine);
				result.append(" residentCode: " + createRes.getResidentCode() + newLine);
				result.append(" serviceRecoveryCode: " + createRes.getServiceRecoveryCode() + newLine);
				result.append(" countryCitizenship: " + createRes.getCountryCitizenship() + newLine);
				result.append(" residence: " + createRes.getResidence() + newLine);
				result.append(" race: " + createRes.getRace() + newLine);
				result.append(" religionCode: " + createRes.getReligionCode() + newLine);
				result.append(" languageIdentifier: " + createRes.getLanguageIdentifier() + newLine);
				result.append(" idNumber: " + createRes.getIdNumber() + newLine);
				result.append(" idTypeCode: " + createRes.getIdTypeCode() + newLine);
				result.append(" dateOfBirth: " + createRes.getDateOfBirth() + newLine);
				result.append(" placeOfBirth: " + createRes.getPlaceOfBirth() + newLine);
				result.append(" maritalStatus: " + createRes.getMaritalStatus() + newLine);
				result.append(" maritalStatusDate: " + createRes.getMaritalStatusDate() + newLine);
				result.append(" deceasedCustomerFlag: " + createRes.getDeceasedCustomerFlag() + newLine);
				result.append(" deceasedDate: " + createRes.getDeceasedDate() + newLine);
				result.append(" gender: " + createRes.getGender() + newLine);
				result.append(" classes: " + createRes.getClasses() + newLine);
				result.append(" individual: " + createRes.getIndividual() + newLine);
				result.append(" smsaCode: " + createRes.getSmsaCode() + newLine);
				result.append(" businessType: " + createRes.getBusinessType() + newLine);
				result.append(" customerRating: " + createRes.getCustomerRating() + newLine);
				result.append(" cifGroupCode: " + createRes.getCifGroupCode() + newLine);
				result.append(" cifCombinedCycle: " + createRes.getCifCombinedCycle() + newLine);
				result.append(" customerStatus2: " + createRes.getCustomerStatus2() + newLine);// CFSTSC
				result.append(" customerStatusDate: " + createRes.getCustomerStatusDate() + newLine);
				result.append(" idIssueCountry: " + createRes.getIdIssueCountry() + newLine);
				result.append(" ratingBody: " + createRes.getRatingBody() + newLine);
				result.append(" ratingCode: " + createRes.getRatingCode() + newLine);
				result.append(" ratingDate: " + createRes.getRatingDate() + newLine);
				result.append(" electronicAddressSequence1: " + createRes.getElectronicAddressSequence1() + newLine);
				result.append(" electronicAddressCode1: " + createRes.getElectronicAddressCode1() + newLine);
				result.append(" electronicAddressDescription1: " + createRes.getElectronicAddressDescription1()
						+ newLine);
				result.append(" mailingIndicator1: " + createRes.getMailingIndicator1() + newLine);
				result.append(" contactName1: " + createRes.getContactName1() + newLine);
				result.append(" electronicAddressSequence2: " + createRes.getElectronicAddressSequence2() + newLine);
				result.append(" electronicAddressCode2: " + createRes.getElectronicAddressCode2() + newLine);
				result.append(" electronicAddressDescription2: " + createRes.getElectronicAddressDescription2()
						+ newLine);
				result.append(" mailingIndicator2: " + createRes.getMailingIndicator2() + newLine);
				result.append(" contactName2: " + createRes.getContactName2() + newLine);
				result.append(" electronicAddressSequence3: " + createRes.getElectronicAddressSequence3() + newLine);
				result.append(" electronicAddressCode3: " + createRes.getElectronicAddressCode3() + newLine);
				result.append(" electronicAddressDescription3: " + createRes.getElectronicAddressDescription3()
						+ newLine);
				result.append(" mailingIndicator3: " + createRes.getMailingIndicator3() + newLine);
				result.append(" contactName3: " + createRes.getContactName3() + newLine);
				result.append(" electronicAddressSequence4: " + createRes.getElectronicAddressSequence4() + newLine);
				result.append(" electronicAddressCode4: " + createRes.getElectronicAddressCode4() + newLine);
				result.append(" electronicAddressDescription4: " + createRes.getElectronicAddressDescription4()
						+ newLine);
				result.append(" mailingIndicator4: " + createRes.getMailingIndicator4() + newLine);
				result.append(" contactName4: " + createRes.getContactName4() + newLine);
				result.append(" electronicAddressSequence5: " + createRes.getElectronicAddressSequence5() + newLine);
				result.append(" electronicAddressCode5: " + createRes.getElectronicAddressCode5() + newLine);
				result.append(" electronicAddressDescription5: " + createRes.getElectronicAddressDescription5()
						+ newLine);
				result.append(" mailingIndicator5: " + createRes.getMailingIndicator5() + newLine);
				result.append(" contactName5: " + createRes.getContactName5() + newLine);
				result.append(" employmentHistorySequence: " + createRes.getEmploymentHistorySequence() + newLine);
				result.append(" employmentStatus: " + createRes.getEmploymentStatus() + newLine);
				result.append(" employmentStartDate: " + createRes.getEmploymentStartDate() + newLine);
				result.append(" jobDesignationCode: " + createRes.getJobDesignationCode() + newLine);
				result.append(" occupationCode: " + createRes.getOccupationCode() + newLine);
				result.append(" typeOfEmployment: " + createRes.getTypeOfEmployment() + newLine);
				result.append(" incomeBracketCode: " + createRes.getIncomeBracketCode() + newLine);
				result.append(" income: " + createRes.getIncome() + newLine);
				result.append(" otherIncome: " + createRes.getOtherIncome() + newLine);
				result.append(" expenditure: " + createRes.getExpenditure() + newLine);
				result.append(" employerName: " + createRes.getEmployerName() + newLine);
				result.append(" remark1: " + createRes.getRemark1() + newLine);
				result.append(" remark2: " + createRes.getRemark2() + newLine);
				result.append(" employeeId: " + createRes.getEmployeeId() + newLine);
				result.append(" employerIndusryCode: " + createRes.getEmployerIndusryCode() + newLine);
				result.append(" employerIndusryRating: " + createRes.getEmployerIndusryRating() + newLine);
				result.append(" previousEmploymentSequence: " + createRes.getPreviousEmploymentSequence() + newLine);
				result.append(" previousEmploymentStatus: " + createRes.getPreviousEmploymentStatus() + newLine);
				result.append(" previousEmploymentStartDate: " + createRes.getPreviousEmploymentStartDate() + newLine);
				result.append(" previousJobDesignationCode: " + createRes.getPreviousJobDesignationCode() + newLine);
				result.append(" previousOccupationCode: " + createRes.getPreviousOccupationCode() + newLine);
				result.append(" previousTypeOfEmployment: " + createRes.getPreviousTypeOfEmployment() + newLine);
				result.append(" previousIncomeBracket: " + createRes.getPreviousIncomeBracket() + newLine);
				result.append(" previousIncome: " + createRes.getPreviousIncome() + newLine);
				result.append(" previousOtherIncome: " + createRes.getPreviousOtherIncome() + newLine);
				result.append(" previousExpenditure: " + createRes.getPreviousExpenditure() + newLine);
				result.append(" previousEmployerName: " + createRes.getPreviousEmployerName() + newLine);
				result.append(" previousRemark1: " + createRes.getPreviousRemark1() + newLine);
				result.append(" previousRemark2: " + createRes.getPreviousRemark2() + newLine);
				result.append(" previousEmployeeId: " + createRes.getPreviousEmployeeId() + newLine);
				result.append(" previousEmployerIndusryCode: " + createRes.getPreviousEmployerIndusryCode() + newLine);
				result.append(" previousEmployerIndusryRating: " + createRes.getPreviousEmployerIndusryRating()
						+ newLine);
				result.append(" idNumber2: " + createRes.getIdNumber2() + newLine);
				result.append(" idTypeCode2: " + createRes.getIdTypeCode2() + newLine);
				result.append(" idIssueCountry2: " + createRes.getIdIssueCountry2() + newLine);
				result.append(" idNumber3: " + createRes.getIdNumber3() + newLine);
				result.append(" idTypeCode3: " + createRes.getIdTypeCode3() + newLine);
				result.append(" idIssueCountry3: " + createRes.getIdIssueCountry3() + newLine);
				result.append("}");
			}
		}

		return result.toString();

	}

	public void setSuccessResponse() {
	}

}

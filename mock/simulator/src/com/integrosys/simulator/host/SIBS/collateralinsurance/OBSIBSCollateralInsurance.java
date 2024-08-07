package com.integrosys.simulator.host.SIBS.collateralinsurance;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.CollateralSequencer;
import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCollateralInsurance extends OBMessageHeader implements IOBHost {
	private Long collateralID;

	private Integer collateralSeqNo;

	private String collateralName;

	private String collateralDesc;

	private String collateralInsStatus;

	private Integer insuranceCompany;

	private BigDecimal insuredAmt;

	private Date insExpirationDate;

	private Integer typeOfCoverage;

	private String bankCustArrangeIns;

	private String policyNo;

	private String coverNoteNo;

	private String schemeInd;

	private BigDecimal insurancePremium;

	private Date insIssueDate;

	private String financePremiumInd;

	private BigDecimal grossPremium;

	private BigDecimal nettPremByBorrower;

	private BigDecimal nettPremToInsCo;

	private BigDecimal commissionEarned;

	private BigDecimal takafulCommission;

	private BigDecimal stampDuty;

	private BigDecimal newAmtInsured;

	private Date endorsementDate;

	private String buildingOccupation;

	private String natureOfWork;

	private String typeOfBuilding;

	private BigDecimal numberOfStorey;

	private String wall;

	private String extensionWalls;

	private String roof;

	private String extensionRoof;

	private String endorsementCode;

	private String remark1;

	private String remark2;

	private String remark3;

	private Date effectiveDate;

	private String insurerTagging;

	private Date insuranceClaimDate;

	private String insuranceCurrency;

	private BigDecimal insuranceExchangeRate;

	private String insuranceCompanyName;

	private String typeOfFloor;

	private String typeOfPerlis1;

	private String typeOfPerlis2;

	private String typeOfPerlis3;

	private String typeOfPerlis4;

	private String typeOfPerlis5;

	private Long debitingAcctNo;

	private String accountType;

	public Long getCollateralID() {
		return collateralID;
	}

	public void setCollateralID(Long collateralID) {
		this.collateralID = collateralID;
	}

	public Integer getCollateralSeqNo() {
		return collateralSeqNo;
	}

	public void setCollateralSeqNo(Integer collateralSeqNo) {
		this.collateralSeqNo = collateralSeqNo;
	}

	public String getCollateralName() {
		return collateralName;
	}

	public void setCollateralName(String collateralName) {
		this.collateralName = collateralName;
	}

	public String getCollateralDesc() {
		return collateralDesc;
	}

	public void setCollateralDesc(String collateralDesc) {
		this.collateralDesc = collateralDesc;
	}

	public String getCollateralInsStatus() {
		return collateralInsStatus;
	}

	public void setCollateralInsStatus(String collateralInsStatus) {
		this.collateralInsStatus = collateralInsStatus;
	}

	public Integer getInsuranceCompany() {
		return insuranceCompany;
	}

	public void setInsuranceCompany(Integer insuranceCompany) {
		this.insuranceCompany = insuranceCompany;
	}

	public BigDecimal getInsuredAmt() {
		return insuredAmt;
	}

	public void setInsuredAmt(BigDecimal insuredAmt) {
		this.insuredAmt = insuredAmt;
	}

	public Date getInsExpirationDate() {
		return insExpirationDate;
	}

	public void setInsExpirationDate(Date insExpirationDate) {
		this.insExpirationDate = insExpirationDate;
	}

	public Integer getTypeOfCoverage() {
		return typeOfCoverage;
	}

	public void setTypeOfCoverage(Integer typeOfCoverage) {
		this.typeOfCoverage = typeOfCoverage;
	}

	public String getBankCustArrangeIns() {
		return bankCustArrangeIns;
	}

	public void setBankCustArrangeIns(String bankCustArrangeIns) {
		this.bankCustArrangeIns = bankCustArrangeIns;
	}

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}

	public String getCoverNoteNo() {
		return coverNoteNo;
	}

	public void setCoverNoteNo(String coverNoteNo) {
		this.coverNoteNo = coverNoteNo;
	}

	public String getSchemeInd() {
		return schemeInd;
	}

	public void setSchemeInd(String schemeInd) {
		this.schemeInd = schemeInd;
	}

	public BigDecimal getInsurancePremium() {
		return insurancePremium;
	}

	public void setInsurancePremium(BigDecimal insurancePremium) {
		this.insurancePremium = insurancePremium;
	}

	public Date getInsIssueDate() {
		return insIssueDate;
	}

	public void setInsIssueDate(Date insIssueDate) {
		this.insIssueDate = insIssueDate;
	}

	public String getFinancePremiumInd() {
		return financePremiumInd;
	}

	public void setFinancePremiumInd(String financePremiumInd) {
		this.financePremiumInd = financePremiumInd;
	}

	public BigDecimal getGrossPremium() {
		return grossPremium;
	}

	public void setGrossPremium(BigDecimal grossPremium) {
		this.grossPremium = grossPremium;
	}

	public BigDecimal getNettPremByBorrower() {
		return nettPremByBorrower;
	}

	public void setNettPremByBorrower(BigDecimal nettPremByBorrower) {
		this.nettPremByBorrower = nettPremByBorrower;
	}

	public BigDecimal getNettPremToInsCo() {
		return nettPremToInsCo;
	}

	public void setNettPremToInsCo(BigDecimal nettPremToInsCo) {
		this.nettPremToInsCo = nettPremToInsCo;
	}

	public BigDecimal getCommissionEarned() {
		return commissionEarned;
	}

	public void setCommissionEarned(BigDecimal commissionEarned) {
		this.commissionEarned = commissionEarned;
	}

	public BigDecimal getTakafulCommission() {
		return takafulCommission;
	}

	public void setTakafulCommission(BigDecimal takafulCommission) {
		this.takafulCommission = takafulCommission;
	}

	public BigDecimal getStampDuty() {
		return stampDuty;
	}

	public void setStampDuty(BigDecimal stampDuty) {
		this.stampDuty = stampDuty;
	}

	public BigDecimal getNewAmtInsured() {
		return newAmtInsured;
	}

	public void setNewAmtInsured(BigDecimal newAmtInsured) {
		this.newAmtInsured = newAmtInsured;
	}

	public Date getEndorsementDate() {
		return endorsementDate;
	}

	public void setEndorsementDate(Date endorsementDate) {
		this.endorsementDate = endorsementDate;
	}

	public String getBuildingOccupation() {
		return buildingOccupation;
	}

	public void setBuildingOccupation(String buildingOccupation) {
		this.buildingOccupation = buildingOccupation;
	}

	public String getNatureOfWork() {
		return natureOfWork;
	}

	public void setNatureOfWork(String natureOfWork) {
		this.natureOfWork = natureOfWork;
	}

	public String getTypeOfBuilding() {
		return typeOfBuilding;
	}

	public void setTypeOfBuilding(String typeOfBuilding) {
		this.typeOfBuilding = typeOfBuilding;
	}

	public BigDecimal getNumberOfStorey() {
		return numberOfStorey;
	}

	public void setNumberOfStorey(BigDecimal numberOfStorey) {
		this.numberOfStorey = numberOfStorey;
	}

	public String getWall() {
		return wall;
	}

	public void setWall(String wall) {
		this.wall = wall;
	}

	public String getExtensionWalls() {
		return extensionWalls;
	}

	public void setExtensionWalls(String extensionWalls) {
		this.extensionWalls = extensionWalls;
	}

	public String getRoof() {
		return roof;
	}

	public void setRoof(String roof) {
		this.roof = roof;
	}

	public String getExtensionRoof() {
		return extensionRoof;
	}

	public void setExtensionRoof(String extensionRoof) {
		this.extensionRoof = extensionRoof;
	}

	public String getEndorsementCode() {
		return endorsementCode;
	}

	public void setEndorsementCode(String endorsementCode) {
		this.endorsementCode = endorsementCode;
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

	public String getRemark3() {
		return remark3;
	}

	public void setRemark3(String remark3) {
		this.remark3 = remark3;
	}

	public Date getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public String getInsurerTagging() {
		return insurerTagging;
	}

	public void setInsurerTagging(String insurerTagging) {
		this.insurerTagging = insurerTagging;
	}

	public Date getInsuranceClaimDate() {
		return insuranceClaimDate;
	}

	public void setInsuranceClaimDate(Date insuranceClaimDate) {
		this.insuranceClaimDate = insuranceClaimDate;
	}

	public String getInsuranceCurrency() {
		return insuranceCurrency;
	}

	public void setInsuranceCurrency(String insuranceCurrency) {
		this.insuranceCurrency = insuranceCurrency;
	}

	public BigDecimal getInsuranceExchangeRate() {
		return insuranceExchangeRate;
	}

	public void setInsuranceExchangeRate(BigDecimal insuranceExchangeRate) {
		this.insuranceExchangeRate = insuranceExchangeRate;
	}

	public String getInsuranceCompanyName() {
		return insuranceCompanyName;
	}

	public void setInsuranceCompanyName(String insuranceCompanyName) {
		this.insuranceCompanyName = insuranceCompanyName;
	}

	public String getTypeOfFloor() {
		return typeOfFloor;
	}

	public void setTypeOfFloor(String typeOfFloor) {
		this.typeOfFloor = typeOfFloor;
	}

	public String getTypeOfPerlis1() {
		return typeOfPerlis1;
	}

	public void setTypeOfPerlis1(String typeOfPerlis1) {
		this.typeOfPerlis1 = typeOfPerlis1;
	}

	public String getTypeOfPerlis2() {
		return typeOfPerlis2;
	}

	public void setTypeOfPerlis2(String typeOfPerlis2) {
		this.typeOfPerlis2 = typeOfPerlis2;
	}

	public String getTypeOfPerlis3() {
		return typeOfPerlis3;
	}

	public void setTypeOfPerlis3(String typeOfPerlis3) {
		this.typeOfPerlis3 = typeOfPerlis3;
	}

	public String getTypeOfPerlis4() {
		return typeOfPerlis4;
	}

	public void setTypeOfPerlis4(String typeOfPerlis4) {
		this.typeOfPerlis4 = typeOfPerlis4;
	}

	public String getTypeOfPerlis5() {
		return typeOfPerlis5;
	}

	public void setTypeOfPerlis5(String typeOfPerlis5) {
		this.typeOfPerlis5 = typeOfPerlis5;
	}

	public Long getDebitingAcctNo() {
		return debitingAcctNo;
	}

	public void setDebitingAcctNo(Long debitingAcctNo) {
		this.debitingAcctNo = debitingAcctNo;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public void setSuccessResponse() {
		if (this.collateralSeqNo == null || this.collateralSeqNo.intValue() == 0) {
			Integer seq = CollateralSequencer.getInsurancePolicyNextSequenceByCollateralId(collateralID);
			this.collateralSeqNo = seq;
		}
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

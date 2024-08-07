package com.integrosys.simulator.host.SIBS.collateralcharge;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCollateralCharge extends OBMessageHeader implements IOBHost {
	private Long applicationNo;

	private String facilityCode;

	private Long accountSeq;

	private Long collateralID;

	private Integer chargeType;

	private BigDecimal chargeAmt;

	private String chargePresentationNo;

	private Date chargePresentationDate;

	private Date chargeRegisteredDate;

	private String folio;

	private String jilid;

	private Integer partyChargeInd;

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

	public Long getAccountSeq() {
		return accountSeq;
	}

	public void setAccountSeq(Long accountSeq) {
		this.accountSeq = accountSeq;
	}

	public Long getCollateralID() {
		return collateralID;
	}

	public void setCollateralID(Long collateralID) {
		this.collateralID = collateralID;
	}

	public Integer getChargeType() {
		return chargeType;
	}

	public void setChargeType(Integer chargeType) {
		this.chargeType = chargeType;
	}

	public BigDecimal getChargeAmt() {
		return chargeAmt;
	}

	public void setChargeAmt(BigDecimal chargeAmt) {
		this.chargeAmt = chargeAmt;
	}

	public String getChargePresentationNo() {
		return chargePresentationNo;
	}

	public void setChargePresentationNo(String chargePresentationNo) {
		this.chargePresentationNo = chargePresentationNo;
	}

	public Date getChargePresentationDate() {
		return chargePresentationDate;
	}

	public void setChargePresentationDate(Date chargePresentationDate) {
		this.chargePresentationDate = chargePresentationDate;
	}

	public Date getChargeRegisteredDate() {
		return chargeRegisteredDate;
	}

	public void setChargeRegisteredDate(Date chargeRegisteredDate) {
		this.chargeRegisteredDate = chargeRegisteredDate;
	}

	public String getFolio() {
		return folio;
	}

	public void setFolio(String folio) {
		this.folio = folio;
	}

	public String getJilid() {
		return jilid;
	}

	public void setJilid(String jilid) {
		this.jilid = jilid;
	}

	public Integer getPartyChargeInd() {
		return partyChargeInd;
	}

	public void setPartyChargeInd(Integer partyChargeInd) {
		this.partyChargeInd = partyChargeInd;
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

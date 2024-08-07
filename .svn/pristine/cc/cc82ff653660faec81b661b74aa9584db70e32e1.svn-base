package com.integrosys.simulator.host.SIBS.collateralfacilitylinkage;

import java.math.BigDecimal;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCollateralFacilityLinkage extends OBMessageHeader implements IOBHost {
	private Long applicationNo;

	private String facilityCode;

	private Long accountSeq;

	private Long collateralID;

	private BigDecimal pledgedAmt;

	private BigDecimal pledgedPercentage;

	private BigDecimal drawAmt;

	private BigDecimal drawPercentage;

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

	public BigDecimal getPledgedAmt() {
		return pledgedAmt;
	}

	public void setPledgedAmt(BigDecimal pledgedAmt) {
		this.pledgedAmt = pledgedAmt;
	}

	public BigDecimal getPledgedPercentage() {
		return pledgedPercentage;
	}

	public void setPledgedPercentage(BigDecimal pledgedPercentage) {
		this.pledgedPercentage = pledgedPercentage;
	}

	public BigDecimal getDrawAmt() {
		return drawAmt;
	}

	public void setDrawAmt(BigDecimal drawAmt) {
		this.drawAmt = drawAmt;
	}

	public BigDecimal getDrawPercentage() {
		return drawPercentage;
	}

	public void setDrawPercentage(BigDecimal drawPercentage) {
		this.drawPercentage = drawPercentage;
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

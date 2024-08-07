package com.integrosys.simulator.host.SIBS.facilityrelationship;

import java.math.BigDecimal;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFacilityRelationship extends OBMessageHeader implements IOBHost {

	private Long applicationNo;

	private String facilityCode;

	private Long seqNo;

	private Long cifNo;

	private String accountRelationship;

	private BigDecimal guaranteeAmt;

	private BigDecimal guaranteePercentage;

	private BigDecimal shareHolderPercentage;

	private Long addressSeqNo;

	private String receiveMailCode;

	private String holdMailCode;

	private Integer nameAssociatedWFacOrder;

	private String nameConjunctionPosition;

	private String nameConjunction;

	private BigDecimal profitRatio;

	private BigDecimal dividendRatio;

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

	public Long getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(Long seqNo) {
		this.seqNo = seqNo;
	}

	public Long getCifNo() {
		return cifNo;
	}

	public void setCifNo(Long cifNo) {
		this.cifNo = cifNo;
	}

	public String getAccountRelationship() {
		return accountRelationship;
	}

	public void setAccountRelationship(String accountRelationship) {
		this.accountRelationship = accountRelationship;
	}

	public BigDecimal getGuaranteeAmt() {
		return guaranteeAmt;
	}

	public void setGuaranteeAmt(BigDecimal guaranteeAmt) {
		this.guaranteeAmt = guaranteeAmt;
	}

	public BigDecimal getGuaranteePercentage() {
		return guaranteePercentage;
	}

	public void setGuaranteePercentage(BigDecimal guaranteePercentage) {
		this.guaranteePercentage = guaranteePercentage;
	}

	public BigDecimal getShareHolderPercentage() {
		return shareHolderPercentage;
	}

	public void setShareHolderPercentage(BigDecimal shareHolderPercentage) {
		this.shareHolderPercentage = shareHolderPercentage;
	}

	public Long getAddressSeqNo() {
		return addressSeqNo;
	}

	public void setAddressSeqNo(Long addressSeqNo) {
		this.addressSeqNo = addressSeqNo;
	}

	public String getReceiveMailCode() {
		return receiveMailCode;
	}

	public void setReceiveMailCode(String receiveMailCode) {
		this.receiveMailCode = receiveMailCode;
	}

	public String getHoldMailCode() {
		return holdMailCode;
	}

	public void setHoldMailCode(String holdMailCode) {
		this.holdMailCode = holdMailCode;
	}

	public Integer getNameAssociatedWFacOrder() {
		return nameAssociatedWFacOrder;
	}

	public void setNameAssociatedWFacOrder(Integer nameAssociatedWFacOrder) {
		this.nameAssociatedWFacOrder = nameAssociatedWFacOrder;
	}

	public String getNameConjunctionPosition() {
		return nameConjunctionPosition;
	}

	public void setNameConjunctionPosition(String nameConjunctionPosition) {
		this.nameConjunctionPosition = nameConjunctionPosition;
	}

	public String getNameConjunction() {
		return nameConjunction;
	}

	public void setNameConjunction(String nameConjunction) {
		this.nameConjunction = nameConjunction;
	}

	public BigDecimal getProfitRatio() {
		return profitRatio;
	}

	public void setProfitRatio(BigDecimal profitRatio) {
		this.profitRatio = profitRatio;
	}

	public BigDecimal getDividendRatio() {
		return dividendRatio;
	}

	public void setDividendRatio(BigDecimal dividendRatio) {
		this.dividendRatio = dividendRatio;
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

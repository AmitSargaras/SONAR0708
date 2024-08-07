package com.integrosys.simulator.host.SIBS.facilitybnm;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFacilityBNM extends OBMessageHeader implements IOBHost {

	private Long bnmApplicationNo;

	private String bnmFacilityCode;

	private Long bnmFaciltiySeq;

	private String bnmIndustryCode;

	private String bnmSectorCode;

	private String bnmStateCode;

	private String bnmBumiNRCCCode;

	private String bnmSmallScaleCode;

	private String bnmPrescribedRateCode;

	private String bnmRelationshipCode;

	private String bnmGoodsFinanceCd1;

	private String bnmGoodsFinanceCd2;

	private String bnmExempt;

	private String bnmExemptCode;

	private Long bnmTierSeqNo;

	private String bnmPurposeCode;

	public Long getBnmApplicationNo() {
		return bnmApplicationNo;
	}

	public void setBnmApplicationNo(Long bnmApplicationNo) {
		this.bnmApplicationNo = bnmApplicationNo;
	}

	public String getBnmFacilityCode() {
		return bnmFacilityCode;
	}

	public void setBnmFacilityCode(String bnmFacilityCode) {
		this.bnmFacilityCode = bnmFacilityCode;
	}

	public Long getBnmFaciltiySeq() {
		return bnmFaciltiySeq;
	}

	public void setBnmFaciltiySeq(Long bnmFaciltiySeq) {
		this.bnmFaciltiySeq = bnmFaciltiySeq;
	}

	public String getBnmIndustryCode() {
		return bnmIndustryCode;
	}

	public void setBnmIndustryCode(String bnmIndustryCode) {
		this.bnmIndustryCode = bnmIndustryCode;
	}

	public String getBnmSectorCode() {
		return bnmSectorCode;
	}

	public void setBnmSectorCode(String bnmSectorCode) {
		this.bnmSectorCode = bnmSectorCode;
	}

	public String getBnmStateCode() {
		return bnmStateCode;
	}

	public void setBnmStateCode(String bnmStateCode) {
		this.bnmStateCode = bnmStateCode;
	}

	public String getBnmBumiNRCCCode() {
		return bnmBumiNRCCCode;
	}

	public void setBnmBumiNRCCCode(String bnmBumiNRCCCode) {
		this.bnmBumiNRCCCode = bnmBumiNRCCCode;
	}

	public String getBnmSmallScaleCode() {
		return bnmSmallScaleCode;
	}

	public void setBnmSmallScaleCode(String bnmSmallScaleCode) {
		this.bnmSmallScaleCode = bnmSmallScaleCode;
	}

	public String getBnmPrescribedRateCode() {
		return bnmPrescribedRateCode;
	}

	public void setBnmPrescribedRateCode(String bnmPrescribedRateCode) {
		this.bnmPrescribedRateCode = bnmPrescribedRateCode;
	}

	public String getBnmRelationshipCode() {
		return bnmRelationshipCode;
	}

	public void setBnmRelationshipCode(String bnmRelationshipCode) {
		this.bnmRelationshipCode = bnmRelationshipCode;
	}

	public String getBnmGoodsFinanceCd1() {
		return bnmGoodsFinanceCd1;
	}

	public void setBnmGoodsFinanceCd1(String bnmGoodsFinanceCd1) {
		this.bnmGoodsFinanceCd1 = bnmGoodsFinanceCd1;
	}

	public String getBnmGoodsFinanceCd2() {
		return bnmGoodsFinanceCd2;
	}

	public void setBnmGoodsFinanceCd2(String bnmGoodsFinanceCd2) {
		this.bnmGoodsFinanceCd2 = bnmGoodsFinanceCd2;
	}

	public String getBnmExempt() {
		return bnmExempt;
	}

	public void setBnmExempt(String bnmExempt) {
		this.bnmExempt = bnmExempt;
	}

	public String getBnmExemptCode() {
		return bnmExemptCode;
	}

	public void setBnmExemptCode(String bnmExemptCode) {
		this.bnmExemptCode = bnmExemptCode;
	}

	public Long getBnmTierSeqNo() {
		return bnmTierSeqNo;
	}

	public void setBnmTierSeqNo(Long bnmTierSeqNo) {
		this.bnmTierSeqNo = bnmTierSeqNo;
	}

	public String getBnmPurposeCode() {
		return bnmPurposeCode;
	}

	public void setBnmPurposeCode(String bnmPurposeCode) {
		this.bnmPurposeCode = bnmPurposeCode;
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

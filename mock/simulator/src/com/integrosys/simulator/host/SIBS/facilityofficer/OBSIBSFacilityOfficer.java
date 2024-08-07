package com.integrosys.simulator.host.SIBS.facilityofficer;

import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSFacilityOfficer extends OBMessageHeader implements IOBHost {
	private Long applicationNo;

	private String facilityCode;

	private Long seqNo;

	private Long relationshipSeqNo;

	private String relationshipCode;

	private String officer;

	private String officerType;

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

	public Long getRelationshipSeqNo() {
		return relationshipSeqNo;
	}

	public void setRelationshipSeqNo(Long relationshipSeqNo) {
		this.relationshipSeqNo = relationshipSeqNo;
	}

	public String getRelationshipCode() {
		return relationshipCode;
	}

	public void setRelationshipCode(String relationshipCode) {
		this.relationshipCode = relationshipCode;
	}

	public String getOfficer() {
		return officer;
	}

	public void setOfficer(String officer) {
		this.officer = officer;
	}

	public String getOfficerType() {
		return officerType;
	}

	public void setOfficerType(String officerType) {
		this.officerType = officerType;
	}

	public void setSuccessResponse() {
		setCommonSuccessResponse();

		if ((relationshipSeqNo == null) || (relationshipSeqNo.longValue() == 0)) {
			try {
				long seq = (long) (Math.random() * SEQ_NUMBER);
				String seqStr = new DateSequencerFormatter().formatSeq(String.valueOf(seq));
				setRelationshipSeqNo(new Long(Long.parseLong(seqStr)));

			}
			catch (Exception e) {
				System.out.println(" Exception caught at setSucessReponse: " + e.getMessage());
			}
		}
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

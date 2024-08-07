package com.integrosys.cms.app.limit.bus;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class OBFacilityReduction implements Serializable, Comparable {
	private static final long serialVersionUID = -4640920501259338868L;

	private Long id;

	private Long cmsReferenceId;

	private Long cmsFacilityMasterId;

	private String status;

	private Integer incrementalNumber;

	private BigDecimal amountApplied;

	private BigDecimal incrementalLimit;

	private BigDecimal originalLimit;

	private Date applicationDate;

	private Date dateOfferAccepted;

	private Date dateApproved;

	private String approvedByCategoryCode;

	private String approvedByEntryCode;

	private String cancelRejectCodeCategoryCode;

	private String cancelRejectCodeEntryCode;

	private Date cancelRejectDate;

	private String facilityStatusCategoryCode;

	private String facilityStatus;

	private String solicitorName;

	private String requestReasonCategoryCode;

	private String requestReasonEntryCode;

	private String documentationStatusCategoryCode;

	private String documentationStatusEntryCode;

	private String lawyerCodeCategoryCode;

	private String lawyerCodeEntryCode;

	private Date dateInstructed;

	private String solicitorReference;

	private Date documentationDate;

	private Date dateEntered;

	private Date dateEnteredForOffer;

	private Date dateEnteredForApplied;

	private Date dateEnteredForApproved;

	private Date dateEnteredForOfferAcceptance;

	private Date dateEnteredForCancelRejected;

	public BigDecimal getAmountApplied() {
		return amountApplied;
	}

	public Date getApplicationDate() {
		return applicationDate;
	}

	public String getApprovedByCategoryCode() {
		return approvedByCategoryCode;
	}

	public String getApprovedByEntryCode() {
		return approvedByEntryCode;
	}

	public String getCancelRejectCodeCategoryCode() {
		return cancelRejectCodeCategoryCode;
	}

	public String getCancelRejectCodeEntryCode() {
		return cancelRejectCodeEntryCode;
	}

	public Date getCancelRejectDate() {
		return cancelRejectDate;
	}

	public Long getCmsFacilityMasterId() {
		return cmsFacilityMasterId;
	}

	public Long getCmsReferenceId() {
		return cmsReferenceId;
	}

	public Date getDateApproved() {
		return dateApproved;
	}

	public Date getDateOfferAccepted() {
		return dateOfferAccepted;
	}

	public String getDocumentationStatusCategoryCode() {
		return documentationStatusCategoryCode;
	}

	public String getDocumentationStatusEntryCode() {
		return documentationStatusEntryCode;
	}

	public String getFacilityStatus() {
		return facilityStatus;
	}

	public String getFacilityStatusCategoryCode() {
		return facilityStatusCategoryCode;
	}

	public Long getId() {
		return id;
	}

	public BigDecimal getIncrementalLimit() {
		return incrementalLimit;
	}

	public Integer getIncrementalNumber() {
		return incrementalNumber;
	}

	public String getLawyerCodeCategoryCode() {
		return lawyerCodeCategoryCode;
	}

	public String getLawyerCodeEntryCode() {
		return lawyerCodeEntryCode;
	}

	public BigDecimal getOriginalLimit() {
		return originalLimit;
	}

	public String getRequestReasonCategoryCode() {
		return requestReasonCategoryCode;
	}

	public String getRequestReasonEntryCode() {
		return requestReasonEntryCode;
	}

	public String getSolicitorName() {
		return solicitorName;
	}

	public String getStatus() {
		return status;
	}

	public Date getDateInstructed() {
		return dateInstructed;
	}

	public String getSolicitorReference() {
		return solicitorReference;
	}

	public Date getDocumentationDate() {
		return documentationDate;
	}

	public Date getDateEntered() {
		return dateEntered;
	}

	public Date getDateEnteredForOffer() {
		return dateEnteredForOffer;
	}

	public Date getDateEnteredForApplied() {
		return dateEnteredForApplied;
	}

	public Date getDateEnteredForApproved() {
		return dateEnteredForApproved;
	}

	public Date getDateEnteredForOfferAcceptance() {
		return dateEnteredForOfferAcceptance;
	}

	public Date getDateEnteredForCancelRejected() {
		return dateEnteredForCancelRejected;
	}

	public void setDateEnteredForOffer(Date dateEnteredForOffer) {
		this.dateEnteredForOffer = dateEnteredForOffer;
	}

	public void setDateEnteredForApplied(Date dateEnteredForApplied) {
		this.dateEnteredForApplied = dateEnteredForApplied;
	}

	public void setDateEnteredForApproved(Date dateEnteredForApproved) {
		this.dateEnteredForApproved = dateEnteredForApproved;
	}

	public void setDateEnteredForOfferAcceptance(Date dateEnteredForOfferAcceptance) {
		this.dateEnteredForOfferAcceptance = dateEnteredForOfferAcceptance;
	}

	public void setDateEnteredForCancelRejected(Date dateEnteredForCancelRejected) {
		this.dateEnteredForCancelRejected = dateEnteredForCancelRejected;
	}

	public void setDateInstructed(Date dateInstructed) {
		this.dateInstructed = dateInstructed;
	}

	public void setSolicitorReference(String solicitorReference) {
		this.solicitorReference = solicitorReference;
	}

	public void setDocumentationDate(Date documentationDate) {
		this.documentationDate = documentationDate;
	}

	public void setDateEntered(Date dateEntered) {
		this.dateEntered = dateEntered;
	}

	public void setAmountApplied(BigDecimal amountApplied) {
		this.amountApplied = amountApplied;
	}

	public void setApplicationDate(Date applicationDate) {
		this.applicationDate = applicationDate;
	}

	public void setApprovedByCategoryCode(String approvedByCategoryCode) {
		this.approvedByCategoryCode = approvedByCategoryCode;
	}

	public void setApprovedByEntryCode(String approvedByEntryCode) {
		this.approvedByEntryCode = approvedByEntryCode;
	}

	public void setCancelRejectCodeCategoryCode(String cancelRejectCodeCategoryCode) {
		this.cancelRejectCodeCategoryCode = cancelRejectCodeCategoryCode;
	}

	public void setCancelRejectCodeEntryCode(String cancelRejectCodeEntryCode) {
		this.cancelRejectCodeEntryCode = cancelRejectCodeEntryCode;
	}

	public void setCancelRejectDate(Date cancelRejectDate) {
		this.cancelRejectDate = cancelRejectDate;
	}

	public void setCmsFacilityMasterId(Long cmsFacilityMasterId) {
		this.cmsFacilityMasterId = cmsFacilityMasterId;
	}

	public void setCmsReferenceId(Long cmsReferenceId) {
		this.cmsReferenceId = cmsReferenceId;
	}

	public void setDateApproved(Date dateApproved) {
		this.dateApproved = dateApproved;
	}

	public void setDateOfferAccepted(Date dateOfferAccepted) {
		this.dateOfferAccepted = dateOfferAccepted;
	}

	public void setDocumentationStatusCategoryCode(String documentationStatusCategoryCode) {
		this.documentationStatusCategoryCode = documentationStatusCategoryCode;
	}

	public void setDocumentationStatusEntryCode(String documentationStatusEntryCode) {
		this.documentationStatusEntryCode = documentationStatusEntryCode;
	}

	public void setFacilityStatus(String facilityStatus) {
		this.facilityStatus = facilityStatus;
	}

	public void setFacilityStatusCategoryCode(String facilityStatusCategoryCode) {
		this.facilityStatusCategoryCode = facilityStatusCategoryCode;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setIncrementalLimit(BigDecimal incrementalLimit) {
		this.incrementalLimit = incrementalLimit;
	}

	public void setIncrementalNumber(Integer incrementalNumber) {
		this.incrementalNumber = incrementalNumber;
	}

	public void setLawyerCodeCategoryCode(String lawyerCodeCategoryCode) {
		this.lawyerCodeCategoryCode = lawyerCodeCategoryCode;
	}

	public void setLawyerCodeEntryCode(String lawyerCodeEntryCode) {
		this.lawyerCodeEntryCode = lawyerCodeEntryCode;
	}

	public void setOriginalLimit(BigDecimal originalLimit) {
		this.originalLimit = originalLimit;
	}

	public void setRequestReasonCategoryCode(String requestReasonCategoryCode) {
		this.requestReasonCategoryCode = requestReasonCategoryCode;
	}

	public void setRequestReasonEntryCode(String requestReasonEntryCode) {
		this.requestReasonEntryCode = requestReasonEntryCode;
	}

	public void setSolicitorName(String solicitorName) {
		this.solicitorName = solicitorName;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int compareTo(Object that) {
		Date thatApplicationDate = ((OBFacilityReduction) that).applicationDate;
		if (thatApplicationDate == null) {
			return (this.applicationDate == null) ? 0 : -1;
		}
		return (this.applicationDate == null) ? 1 : this.applicationDate.compareTo(thatApplicationDate);
	}

	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((applicationDate == null) ? 0 : applicationDate.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		return result;
	}

	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		OBFacilityReduction other = (OBFacilityReduction) obj;
		if (applicationDate == null) {
			if (other.applicationDate != null) {
				return false;
			}
		}
		else if (!applicationDate.equals(other.applicationDate)) {
			return false;
		}
		if (status == null) {
			if (other.status != null) {
				return false;
			}
		}
		else if (!status.equals(other.status)) {
			return false;
		}
		return true;
	}

	public String toString() {
		StringBuffer buf = new StringBuffer("OBFacilityReduction [");
		buf.append("applicationDate=");
		buf.append(applicationDate);
		buf.append(", incrementalNumber=");
		buf.append(incrementalNumber);
		buf.append(", amountApplied=");
		buf.append(amountApplied);
		buf.append(", incrementalLimit=");
		buf.append(incrementalLimit);
		buf.append(", originalLimit=");
		buf.append(originalLimit);
		buf.append(", requestReasonCategoryCode=");
		buf.append(requestReasonCategoryCode);
		buf.append(", requestReasonEntryCode=");
		buf.append(requestReasonEntryCode);
		buf.append(", status=");
		buf.append(status);
		buf.append("]");
		return buf.toString();
	}

}

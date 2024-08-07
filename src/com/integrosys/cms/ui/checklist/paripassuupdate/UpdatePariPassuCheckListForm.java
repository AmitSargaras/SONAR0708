/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/ui/checklist/secreceipt/SecurityReceiptForm.java,v 1.24 2006/08/07 03:40:52 czhou Exp $
 */

package com.integrosys.cms.ui.checklist.paripassuupdate;

import java.io.Serializable;

import com.integrosys.base.techinfra.logger.DefaultLogger;
import com.integrosys.cms.ui.common.TrxContextForm;

/**
 * @author $Author: czhou $<br>
 * @version $Revision: 1.24 $
 * @since $Date: 2006/08/07 03:40:52 $ Tag: $Name: $
 */

public class UpdatePariPassuCheckListForm extends TrxContextForm implements Serializable {

	private String checkListID = "";

	private String limitProfileID = "";

	private String limitBkgLoc = "";

	private String legalConstitution = "";

	private String legalID = "";

	private String custCategory = "";

	private String actionType = "";

	private String collateralID = "";

    private String collateralRef = "";

    private String secType = "";

	private String secSubType = "";

    private String secName = "";

    private String forwardUser = "";// +OFFICE

	// fields for data

    private String deferCount = "";
	
	private String deferedDays="";
	
	private String docCode = "";

	private String docDesc = "";

	private String actionParty = "";
	
	private String creditApprover = "";

	private String docRemarks = "";

	private String docRef = "";

	private String formNo = "";

	private String docDate = "";

	private String docEffDate = ""; // CR 133

	private String tempUpliftedDate = "";
	
	private String expectedReturnDate = "";
	
	private String permUpliftedDate = "";
	
	private String lodgedDate = "";
	
	private String docExpDate = "";

	private String deferDate = "";

	private String deferExtendedDate = "";

	private String docNo = "";

	private String identifyDate = "";

	private String awaiting = "";

	private String isPolicy = "";

	private String docOldEffDate = "";

	private String isEffDateChanged = "";

	// CMSSP-522: Updating Narration without changing defer date and/or extended
	// deferment date
	private String origDeferDate = "";

	private String origDeferExtendedDate = "";
	
	private String completedDate = "";
	
	private String waivedDate = "";

	// start for adding for cr-17
	private String shared;

	private String[] sno;

	private String[] checkListId;

	private String[] docShareId;

	private String[] docShareIdRef;

	private String[] profileId;

	private String[] subProfileId;

	private String[] pledgorDtlId;

	private String[] collateralId;

	private String[] existingChkListId;

	private String[] deleteCheckListId;

	private String[] isDeletedInd;

	private String[] details;

	private String[] leID;

	private String[] leName;

	private String[] securityDtlId;

	private String[] securityType;

	private String[] securitySubType;
	
//    private String legalFirm = null;
	private String panellawyerLegalFirm = "";
	private String nonPanellawyerLegalFirm = "";
    private String lawFirmPanelFlag = "";
    private String lawyerReferenceNumber = "";
    private String lawyerInCharge = "";
    private String lawFirmAddress = "";
    private String lawFirmContactNumber = "";
    private String lawyerEmail = "";
    
    private String valuerFirm = "";
	private String nonPanelvaluerLegalFirm = "";
	private String valuerFirmPanelFlag = "";
	private String valuerReferenceNumber = "";
	private String valuerInCharge = "";
	private String valuerFirmAddress = "";
	private String valuerFirmContactNumber = "";
	private String valuerEmail = "";
	
	private String insurerFirm = "";
	private String nonPanelinsurerLegalFirm = "";
	private String insurerFirmPanelFlag = "";
	private String insurerReferenceNumber = "";
	private String insurerInCharge = "";
	private String insurerFirmAddress = "";
	private String insurerFirmContactNumber = "";
	private String insurerEmail = "";

    private String monitorType = "";
    
    private String receivedDate = "";
    
    private String reNewDocOldExpDate = "";
    
    private String parentCheckListItemRef = "";
    
    public String getParentCheckListItemRef() {
		return parentCheckListItemRef;
	}

	public void setParentCheckListItemRef(String parentCheckListItemRef) {
		this.parentCheckListItemRef = parentCheckListItemRef;
	}

	public String getReNewDocOldExpDate() {
		return reNewDocOldExpDate;
	}

	public void setReNewDocOldExpDate(String reNewDocOldExpDate) {
		this.reNewDocOldExpDate = reNewDocOldExpDate;
	}

	public String getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(String receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getPolicy() {
		return isPolicy;
	}

	public void setPolicy(String policy) {
		isPolicy = policy;
	}

	public String getEffDateChanged() {
		return isEffDateChanged;
	}

	public void setEffDateChanged(String effDateChanged) {
		isEffDateChanged = effDateChanged;
	}

	public String getShared() {
		return shared;
	}

	public void setShared(String shared) {
		this.shared = shared;
	}

	public String[] getSno() {
		return sno;
	}

	public void setSno(String[] sno) {
		this.sno = sno;
	}

	public String[] getCheckListId() {
		return checkListId;
	}

	public void setCheckListId(String[] checkListId) {
		this.checkListId = checkListId;
	}

	public String[] getDocShareId() {
		return docShareId;
	}

	public void setDocShareId(String[] docShareId) {
		this.docShareId = docShareId;
	}

	public String[] getDocShareIdRef() {
		return docShareIdRef;
	}

	public void setDocShareIdRef(String[] docShareIdRef) {
		this.docShareIdRef = docShareIdRef;
	}

	public String[] getProfileId() {
		return profileId;
	}

	public void setProfileId(String[] profileId) {
		this.profileId = profileId;
	}

	public String[] getSubProfileId() {
		return subProfileId;
	}

	public void setSubProfileId(String[] subProfileId) {
		this.subProfileId = subProfileId;
	}

	public String[] getPledgorDtlId() {
		return pledgorDtlId;
	}

	public void setPledgorDtlId(String[] pledgorDtlId) {
		this.pledgorDtlId = pledgorDtlId;
	}

	public String[] getCollateralId() {
		return collateralId;
	}

	public void setCollateralId(String[] collateralId) {
		this.collateralId = collateralId;
	}

    public String getCollateralRef() {
        return collateralRef;
    }

    public void setCollateralRef(String collateralRef) {

        DefaultLogger.debug(this, "Setting collateralref >>>>>>>>>>>>>>>>>>>>>>>>>>>>" + collateralRef);

        this.collateralRef = collateralRef;
    }

    public String[] getExistingChkListId() {
		return existingChkListId;
	}

	public void setExistingChkListId(String[] existingChkListId) {
		this.existingChkListId = existingChkListId;
	}

	public String[] getDeleteCheckListId() {
		return deleteCheckListId;
	}

	public void setDeleteCheckListId(String[] deleteCheckListId) {
		this.deleteCheckListId = deleteCheckListId;
	}

	public String[] getIsDeletedInd() {
		return isDeletedInd;
	}

	public void setIsDeletedInd(String[] deletedInd) {
		isDeletedInd = deletedInd;
	}

	public String[] getDetails() {
		return details;
	}

	public void setDetails(String[] details) {
		this.details = details;
	}

	public String[] getLeID() {
		return leID;
	}

	public void setLeID(String[] leID) {
		this.leID = leID;
	}

	public String[] getLeName() {
		return leName;
	}

	public void setLeName(String[] leName) {
		this.leName = leName;
	}

	public String[] getSecurityDtlId() {
		return securityDtlId;
	}

	public void setSecurityDtlId(String[] securityDtlId) {
		this.securityDtlId = securityDtlId;
	}

	public String[] getSecurityType() {
		return securityType;
	}

	public void setSecurityType(String[] securityType) {
		this.securityType = securityType;
	}

	public String[] getSecuritySubType() {
		return securitySubType;
	}

	public void setSecuritySubType(String[] securitySubType) {
		this.securitySubType = securitySubType;
	}

	public String getIdentifyDate() {
		return this.identifyDate;
	}

	public void setIdentifyDate(String identifyDate) {
		this.identifyDate = identifyDate;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getDeferDate() {
		return deferDate;
	}

	// cr36
	public String getDeferExtendedDate() {
		return deferExtendedDate;
	}

	public void setDeferDate(String deferDate) {
		this.deferDate = deferDate;
	}

	// cr36
	public void setDeferExtendedDate(String deferExtendedDate) {
		this.deferExtendedDate = deferExtendedDate;
	}

	public String getOrigDeferDate() {
		return origDeferDate;
	}

	public void setOrigDeferDate(String origDeferDate) {
		this.origDeferDate = origDeferDate;
	}

	public String getOrigDeferExtendedDate() {
		return origDeferExtendedDate;
	}

	public void setOrigDeferExtendedDate(String origDeferExtendedDate) {
		this.origDeferExtendedDate = origDeferExtendedDate;
	}

	public String getCollateralID() {

		return collateralID;

	}

	public void setCollateralID(String collateralID) {

		DefaultLogger.debug(this, "Setting collateralid ********************************>" + collateralID);

		this.collateralID = collateralID;

	}

	private String actionTypeName = "";

	public String getIndex() {

		return index;

	}

	public void setIndex(String index) {

		this.index = index;

	}

	// used for individual manipulation

	private String index = "";

	public String getActionParty() {

		return actionParty;

	}

	public void setActionParty(String actionParty) {

		this.actionParty = actionParty;

	}

	public String getDocCode() {

		return docCode;

	}

	public void setDocCode(String docCode) {

		this.docCode = docCode;

	}

	public String getDocDate() {

		return docDate;

	}

	public void setDocDate(String docDate) {

		this.docDate = docDate;

	}

	public String getActionTypeName() {

		return actionTypeName;

	}

	public void setActionTypeName(String actionTypeName) {

		this.actionTypeName = actionTypeName;

	}

	public String getSecSubType() {

		return secSubType;

	}

	public void setSecSubType(String secSubType) {

		this.secSubType = secSubType;

	}

	public String getSecType() {

		return secType;

	}

	public void setSecType(String secType) {

		this.secType = secType;

	}


    public String getSecName() {
        return secName;
    }

    public void setSecName(String secName) {
        this.secName = secName;
    }

    public String getDocDesc() {

		return docDesc;

	}

	public void setDocDesc(String docDesc) {

		this.docDesc = docDesc;

	}

	public String getDocExpDate() {

		return docExpDate;

	}

	public void setDocExpDate(String docExpDate) {

		this.docExpDate = docExpDate;

	}

	public String getDocRef() {

		return docRef;

	}

	public void setDocRef(String docRef) {

		this.docRef = docRef;

	}

	public String getDocRemarks() {

		return docRemarks;

	}

	public void setDocRemarks(String docRemarks) {

		this.docRemarks = docRemarks;

	}

	public String getFormNo() {

		return formNo;

	}

	public void setFormNo(String formNo) {

		this.formNo = formNo;

	}

	public String getCreditApprover() {
		return creditApprover;
	}

	public void setCreditApprover(String creditApprover) {
		this.creditApprover = creditApprover;
	}
	public String getActionType() {

		return actionType;

	}

	public void setActionType(String actionType) {

		this.actionType = actionType;

	}

	public String getCustCategory() {

		return custCategory;

	}

	public void setCustCategory(String custCategory) {

		this.custCategory = custCategory;

	}

	public String getLegalID() {

		return legalID;

	}

	public void setLegalID(String legalID) {

		this.legalID = legalID;

	}

	public String getLegalConstitution() {

		return legalConstitution;

	}

	public void setLegalConstitution(String legalConstitution) {

		this.legalConstitution = legalConstitution;

	}

	public void reset() {

	}

	/**
	 * This method defines a String array which tells what object is to be
	 * formed from the form and using what mapper classes to form it. it has a
	 * syntax (keyMapperclassname)
	 * @return two-dimesnional String Array
	 */

	public String[][] getMapper() {
		String[][] input = { { "theOBTrxContext", "com.integrosys.cms.ui.common.TrxContextMapper" },
				{ "ownerObj", "com.integrosys.cms.ui.checklist.paripassuupdate.OwnerMapper" },
				{ "checkListItem", "com.integrosys.cms.ui.checklist.paripassuupdate.CheckListItemMapper" },
				{ "checkListForm", "com.integrosys.cms.ui.checklist.paripassuupdate.CheckListMapper" },
				{ "limitProfileID", "com.integrosys.cms.ui.checklist.paripassuupdate.LimitProfileMapper" } };

		return input;

	}

	public String getCheckListID() {

		return checkListID;

	}

	public void setCheckListID(String checkListID) {

		this.checkListID = checkListID;

	}

	public String getLimitProfileID() {

		return limitProfileID;

	}

	public void setLimitProfileID(String limitProfileID) {

		this.limitProfileID = limitProfileID;

	}

	public String getLimitBkgLoc() {

		return limitBkgLoc;

	}

	public void setLimitBkgLoc(String limitBkgLoc) {

		this.limitBkgLoc = limitBkgLoc;

	}

	// CR-380 Starts



	// CR-380 Ends

	// +Begin of OFFICE
	public String getForwardUser() {
		return forwardUser;
	}

	public void setForwardUser(String forwardUser) {
		this.forwardUser = forwardUser;
	}

	// +End of OFFICE

	public String getAwaiting() {
		return awaiting;
	}

	public void setAwaiting(String awaiting) {
		this.awaiting = awaiting;
	}

	public String getDocEffDate() {
		return docEffDate;
	}

	public void setDocEffDate(String docEffDate) {
		this.docEffDate = docEffDate;
	}

	public String getIsPolicy() {
		return isPolicy;
	}

	public void setIsPolicy(String isPolicy) {
		this.isPolicy = isPolicy;
	}

	public String getDocOldEffDate() {
		return docOldEffDate;
	}

	public void setDocOldEffDate(String docOldEffDate) {
		this.docOldEffDate = docOldEffDate;
	}

	public String getIsEffDateChanged() {
		return isEffDateChanged;
	}

	public void setIsEffDateChanged(String isEffDateChanged) {
		this.isEffDateChanged = isEffDateChanged;
	}

	public String getCompletedDate() {
		return completedDate;
	}

	public void setCompletedDate(String completedDate) {
		this.completedDate = completedDate;
	}

	public String getWaivedDate() {
		return waivedDate;
	}

	public void setWaivedDate(String waivedDate) {
		this.waivedDate = waivedDate;
	}

	public String getLawFirmPanelFlag() {
		return lawFirmPanelFlag;
	}

	public void setLawFirmPanelFlag(String lawFirmPanelFlag) {
		if(lawFirmPanelFlag!=null||!lawFirmPanelFlag.equals("")){
			this.lawFirmPanelFlag = lawFirmPanelFlag;
		}
		
	}

	public String getLawyerReferenceNumber() {
		return lawyerReferenceNumber;
	}

	public void setLawyerReferenceNumber(String lawyerReferenceNumber) {
		this.lawyerReferenceNumber = lawyerReferenceNumber;
	}

	public String getLawyerInCharge() {
		return lawyerInCharge;
	}

	public void setLawyerInCharge(String lawyerInCharge) {
		this.lawyerInCharge = lawyerInCharge;
	}

	public String getLawFirmAddress() {
		return lawFirmAddress;
	}

	public void setLawFirmAddress(String lawFirmAddress) {
		this.lawFirmAddress = lawFirmAddress;
	}

	public String getLawFirmContactNumber() {
		return lawFirmContactNumber;
	}

	public void setLawFirmContactNumber(String lawFirmContactNumber) {
		this.lawFirmContactNumber = lawFirmContactNumber;
	}

	public String getLawyerEmail() {
		return lawyerEmail;
	}

	public void setLawyerEmail(String lawyerEmail) {
		this.lawyerEmail = lawyerEmail;
	}

	public String getPanellawyerLegalFirm() {
		return panellawyerLegalFirm;
	}

	public void setPanellawyerLegalFirm(String panellawyerLegalFirm) {
		this.panellawyerLegalFirm = panellawyerLegalFirm;
	}

	public String getNonPanellawyerLegalFirm() {
		return nonPanellawyerLegalFirm;
	}

	public void setNonPanellawyerLegalFirm(String nonPanellawyerLegalFirm) {
		this.nonPanellawyerLegalFirm = nonPanellawyerLegalFirm;
	}

    public String getMonitorType() {
        return monitorType;
    }

    public void setMonitorType(String monitorType) {
        this.monitorType = monitorType;
    }

	public String getTempUpliftedDate() {
		return tempUpliftedDate;
	}

	public void setTempUpliftedDate(String tempUpliftedDate) {
		this.tempUpliftedDate = tempUpliftedDate;
	}

	public String getExpectedReturnDate() {
		return expectedReturnDate;
	}

	public void setExpectedReturnDate(String expectedReturnDate) {
		this.expectedReturnDate = expectedReturnDate;
	}

	public String getLodgedDate() {
		return lodgedDate;
	}

	public void setLodgedDate(String lodgedDate) {
		this.lodgedDate = lodgedDate;
	}

	public String getPermUpliftedDate() {
		return permUpliftedDate;
	}

	public void setPermUpliftedDate(String permUpliftedDate) {
		this.permUpliftedDate = permUpliftedDate;
	}

	public String getValuerFirm() {
		return valuerFirm;
	}

	public void setValuerFirm(String valuerFirm) {
		this.valuerFirm = valuerFirm;
	}

	public String getValuerFirmPanelFlag() {
		return valuerFirmPanelFlag;
	}

	public void setValuerFirmPanelFlag(String valuerFirmPanelFlag) {
		this.valuerFirmPanelFlag = valuerFirmPanelFlag;
	}

	public String getValuerReferenceNumber() {
		return valuerReferenceNumber;
	}

	public void setValuerReferenceNumber(String valuerReferenceNumber) {
		this.valuerReferenceNumber = valuerReferenceNumber;
	}

	public String getValuerInCharge() {
		return valuerInCharge;
	}

	public void setValuerInCharge(String valuerInCharge) {
		this.valuerInCharge = valuerInCharge;
	}

	public String getValuerFirmAddress() {
		return valuerFirmAddress;
	}

	public void setValuerFirmAddress(String valuerFirmAddress) {
		this.valuerFirmAddress = valuerFirmAddress;
	}

	public String getValuerFirmContactNumber() {
		return valuerFirmContactNumber;
	}

	public void setValuerFirmContactNumber(String valuerFirmContactNumber) {
		this.valuerFirmContactNumber = valuerFirmContactNumber;
	}

	public String getValuerEmail() {
		return valuerEmail;
	}

	public void setValuerEmail(String valuerEmail) {
		this.valuerEmail = valuerEmail;
	}

	public String getInsurerFirm() {
		return insurerFirm;
	}

	public void setInsurerFirm(String insurerFirm) {
		this.insurerFirm = insurerFirm;
	}

	public String getInsurerFirmPanelFlag() {
		return insurerFirmPanelFlag;
	}

	public void setInsurerFirmPanelFlag(String insurerFirmPanelFlag) {
		this.insurerFirmPanelFlag = insurerFirmPanelFlag;
	}

	public String getInsurerReferenceNumber() {
		return insurerReferenceNumber;
	}

	public void setInsurerReferenceNumber(String insurerReferenceNumber) {
		this.insurerReferenceNumber = insurerReferenceNumber;
	}

	public String getInsurerInCharge() {
		return insurerInCharge;
	}

	public void setInsurerInCharge(String insurerInCharge) {
		this.insurerInCharge = insurerInCharge;
	}

	public String getInsurerFirmAddress() {
		return insurerFirmAddress;
	}

	public void setInsurerFirmAddress(String insurerFirmAddress) {
		this.insurerFirmAddress = insurerFirmAddress;
	}

	public String getInsurerFirmContactNumber() {
		return insurerFirmContactNumber;
	}

	public void setInsurerFirmContactNumber(String insurerFirmContactNumber) {
		this.insurerFirmContactNumber = insurerFirmContactNumber;
	}

	public String getInsurerEmail() {
		return insurerEmail;
	}

	public void setInsurerEmail(String insurerEmail) {
		this.insurerEmail = insurerEmail;
	}

	public String getNonPanelvaluerLegalFirm() {
		return nonPanelvaluerLegalFirm;
	}

	public void setNonPanelvaluerLegalFirm(String nonPanelvaluerLegalFirm) {
		this.nonPanelvaluerLegalFirm = nonPanelvaluerLegalFirm;
	}

	public String getNonPanelinsurerLegalFirm() {
		return nonPanelinsurerLegalFirm;
	}

	public void setNonPanelinsurerLegalFirm(String nonPanelinsurerLegalFirm) {
		this.nonPanelinsurerLegalFirm = nonPanelinsurerLegalFirm;
	}

	public String getDeferCount() {
		return deferCount;
	}

	public void setDeferCount(String deferCount) {
		this.deferCount = deferCount;
	}

	public String getDeferedDays() {
		return deferedDays;
	}

	public void setDeferedDays(String deferedDays) {
		this.deferedDays = deferedDays;
	}
}

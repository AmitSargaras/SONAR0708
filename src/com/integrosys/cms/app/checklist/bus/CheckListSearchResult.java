/*
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/src/com/integrosys/cms/app/checklist/bus/CheckListSearchResult.java,v 1.9 2006/08/14 10:56:25 jzhai Exp $
 */
package com.integrosys.cms.app.checklist.bus;

//java
import java.io.Serializable;
import java.util.Date;

import com.integrosys.base.techinfra.util.AccessorUtil;
import com.integrosys.cms.app.common.bus.IBookingLocation;

/**
 * This class contains the search result for checklist
 * 
 * @author $Author: Abhijit Rudrakshawar $<br>
 * @version $Revision: 1.9 $
 * @since $Date: 2006/08/14 10:56:25 $ Tag: $Name: $
 */
public class CheckListSearchResult implements Serializable {
	private long checkListID = com.integrosys.cms.app.common.constant.ICMSConstant.LONG_INVALID_VALUE;

	private long limitProfileID = com.integrosys.cms.app.common.constant.ICMSConstant.LONG_INVALID_VALUE;

	private String checkListStatus = null;

	private String checkListType = null;

	private String trxID = null;

	private String trxStatus = null;

	private String trxFromState = null;

	private boolean allowDeleteInd = false;

	private IBookingLocation checkListLocation = null;

	private String checkListOrganization = null;

	private String disableTaskInd = null;

	private String customerType;

    private String applicationType;
    
    private Date camDate;
    private String camNumber;
    private String camType;
    private String isLatest;


    public String getIsLatest() {
		return isLatest;
	}

	public void setIsLatest(String isLatest) {
		this.isLatest = isLatest;
	}

	public Date getCamDate() {
		return camDate;
	}

	public void setCamDate(Date camDate) {
		this.camDate = camDate;
	}

	public String getCamNumber() {
		return camNumber;
	}

	public void setCamNumber(String camNumber) {
		this.camNumber = camNumber;
	}

	public String getCamType() {
		return camType;
	}

	public void setCamType(String camType) {
		this.camType = camType;
	}

	public String getDisableTaskInd() {
		return disableTaskInd;
	}

	public void setDisableTaskInd(String disableTaskInd) {
		this.disableTaskInd = disableTaskInd;
	}

	public String getCheckListOrganization() {
		return checkListOrganization;
	}

	public void setCheckListOrganization(String checkListOrganization) {
		this.checkListOrganization = checkListOrganization;
	}

	/**
	 * Get the check list ID
	 * @return long - the checklist ID
	 */
	public long getCheckListID() {
		return this.checkListID;
	}

	/**
	 * Get the limit profile ID
	 * @return long - the limit profile ID
	 */
	public long getLimitProfileID() {
		return this.limitProfileID;
	}

	/**
	 * Get the status of the checklistf
	 * @return String - the checklist status
	 */
	public String getCheckListStatus() {
		return this.checkListStatus;
	}

	/**
	 * Get the check list type
	 * @return String - the checklist type
	 */
	public String getCheckListType() {
		return this.checkListType;
	}

	/**
	 * Get the trx ID
	 * @return String - the trx ID
	 */
	public String getTrxID() {
		return this.trxID;
	}

	/**
	 * Get the trx status
	 * @return String - the trx status
	 */
	public String getTrxStatus() {
		return this.trxStatus;
	}

	public String getTrxFromState() {
		return this.trxFromState;
	}

	/**
	 * Get the checklist location
	 * @return IBookingLocation - the checklist location
	 */
	public IBookingLocation getCheckListLocation() {
		return this.checkListLocation;
	}

	/**
	 * Get the allow delete indicator
	 * @return boolean - true if allow delete
	 */
	public boolean getAllowDeleteInd() {
		return this.allowDeleteInd;
	}

	/**
	 * Set the checklist ID
	 * @param aCheckListID of long type
	 */
	public void setCheckListID(long aCheckListID) {
		this.checkListID = aCheckListID;
	}

	/**
	 * Set the limit profile ID
	 * @return aLimitProfileID of long type
	 */
	public void setLimitProfileID(long aLimitProfileID) {
		this.limitProfileID = aLimitProfileID;
	}

	/**
	 * Set the checklist status
	 * @param aCheckListStatus of String type
	 */
	public void setCheckListStatus(String aCheckListStatus) {
		this.checkListStatus = aCheckListStatus;
	}

	/**
	 * Set the checklist type
	 * @param aCheckListType of String type
	 */
	public void setCheckListType(String aCheckListType) {
		this.checkListType = aCheckListType;
	}

	/**
	 * Set the trx ID.
	 * @param aTrxID - String
	 */
	public void setTrxID(String aTrxID) {
		this.trxID = aTrxID;
	}

	/**
	 * Set the trx status.
	 * @param aTrxStatus - String
	 */
	public void setTrxStatus(String aTrxStatus) {
		this.trxStatus = aTrxStatus;
	}

	public void setTrxFromState(String trxFromState) {
		this.trxFromState = trxFromState;
	}

	/**
	 * Set the checklist booking location
	 * @param anIBookingLocation of IBookingLocation type
	 */
	public void setCheckListLocation(IBookingLocation anIBookingLocation) {
		this.checkListLocation = anIBookingLocation;
	}

	public void setAllowDeleteInd(boolean anAllowDeleteInd) {
		this.allowDeleteInd = anAllowDeleteInd;
	}

	/**
	 * Prints a String representation of this object
	 * 
	 * @return String
	 */
	public String toString() {
		return AccessorUtil.printMethodValue(this);
	}

	/**
	 * Get the customer type.
	 * 
	 * @return String - the customer type
	 */
	public String getCustomerType() {
		return this.customerType;
	}

	/**
	 * Set the customer type.
	 * 
	 * @param customerType of long String
	 */
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}


    /**
     * Gets the application type
     * @return String - application type
     */
    public String getApplicationType() {
        return applicationType;
    }

    /**
     * Sets the application type
     * @param applicationType - application type
     */
    public void setApplicationType(String applicationType) {
        this.applicationType = applicationType;
    }
}

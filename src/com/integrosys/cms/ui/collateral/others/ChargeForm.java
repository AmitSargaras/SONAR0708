package com.integrosys.cms.ui.collateral.others;import java.io.Serializable;import com.integrosys.base.uiinfra.common.CommonForm;/** *  * Created by IntelliJ IDEA. *  * User: ssathish *  * Date: Jul 23, 2003 *  * Time: 7:10:13 PM *  * To change this template use Options | File Templates. */public class ChargeForm extends CommonForm implements Serializable {	public static final String CHARGEMAPPER = "com.integrosys.cms.ui.collateral.others.ChargeMapper";	private String securityID = "";	public String getSecurityID() {		return this.securityID;	}	public void setSecurityID(String securityID) {		this.securityID = securityID;	}	private String[] limitID;	public String[] getLimitID() {		return this.limitID;	}	public void setLimitID(String[] limitID) {		this.limitID = limitID;	}	private String[] limitMapID;	public String[] getLimitMapID() {		return this.limitMapID;	}	public void setLimitMapID(String[] limitMapID) {		this.limitMapID = limitMapID;	}	private String rank = "";	public String getRank() {		return this.rank;	}	public void setRank(String rank) {		this.rank = rank;	}	private String chargeAmount = "";	public String getChargeAmount() {		return this.chargeAmount;	}	public void setChargeAmount(String chargeAmount) {		this.chargeAmount = chargeAmount;	}	private String priorChargeAmount = "";	public String getPriorChargeAmount() {		return this.priorChargeAmount;	}	public void setPriorChargeAmount(String priorChargeAmount) {		this.priorChargeAmount = priorChargeAmount;	}	private String chargeePriorCharge = "";	public String getChargeePriorCharge() {		return this.chargeePriorCharge;	}	public void setChargeePriorCharge(String chargeePriorCharge) {		this.chargeePriorCharge = chargeePriorCharge;	}	private String dateLegalCharge = "";	public String getDateLegalCharge() {		return this.dateLegalCharge;	}	public void setDateLegalCharge(String dateLegalCharge) {		this.dateLegalCharge = dateLegalCharge;	}	private String isLEChargeRank = "";	public String getIsLEChargeRank() {		return this.isLEChargeRank;	}	public void setIsLEChargeRank(String isLEChargeRank) {		this.isLEChargeRank = isLEChargeRank;	}	private String isLEJurisdiction = "";	public String getIsLEJurisdiction() {		return this.isLEJurisdiction;	}	public void setIsLEJurisdiction(String isLEJurisdiction) {		this.isLEJurisdiction = isLEJurisdiction;	}	private String isLEGovernLaw = "";	public String getIsLEGovernLaw() {		return this.isLEGovernLaw;	}	public void setIsLEGovernLaw(String isLEGovernLaw) {		this.isLEGovernLaw = isLEGovernLaw;	}	private String isLE;	private String dateLE;	/**	 * @return Returns the dateLE.	 */	public String getDateLE() {		return dateLE;	}	/**	 * @param dateLE	 *            The dateLE to set.	 */	public void setDateLE(String dateLE) {		this.dateLE = dateLE;	}	/**	 * @return Returns the isLE.	 */	public String getIsLE() {		return isLE;	}	/**	 * @param isLE	 *            The isLE to set.	 */	public void setIsLE(String isLE) {		this.isLE = isLE;	}	private String dateLEChageRank = "";	public String getDateLEChageRank() {		return this.dateLEChageRank;	}	public void setDateLEChageRank(String dateLEChageRank) {		this.dateLEChageRank = dateLEChageRank;	}	private String dateLEJurisdiction = "";	public String getDateLEJurisdiction() {		return this.dateLEJurisdiction;	}	public void setDateLEJurisdiction(String dateLEJurisdiction) {		this.dateLEJurisdiction = dateLEJurisdiction;	}	private String dateLEGovernLaw = "";	public String getDateLEGovernLaw() {		return this.dateLEGovernLaw;	}	public void setDateLEGovernLaw(String dateLEGovernLaw) {		this.dateLEGovernLaw = dateLEGovernLaw;	}	private String chargeType = "";	public String getChargeType() {		return this.chargeType;	}	public void setChargeType(String chargeType) {		this.chargeType = chargeType;	}	private String natureOfCharge = "";	public String getNatureOfCharge() {		return this.natureOfCharge;	}	public void setNatureOfCharge(String natureOfCharge) {		this.natureOfCharge = natureOfCharge;	}	private String priorChargeType = "";	public String getPriorChargeType() {		return this.priorChargeType;	}	public void setPriorChargeType(String priorChargeType) {		this.priorChargeType = priorChargeType;	}	public String redemption = "Yes";	public String getRedemption() {		return redemption;	}	public void setRedemption(String redemption) {		this.redemption = redemption;	}	private String caveatWaivedInd;	public String getCaveatWaivedInd() {		return this.caveatWaivedInd;	}	public void setCaveatWaivedInd(String caveatWaivedInd) {		this.caveatWaivedInd = caveatWaivedInd;	}	private String caveatReferenceNo;	public String getCaveatReferenceNo() {		return this.caveatReferenceNo;	}	public void setCaveatReferenceNo(String caveatReferenceNo) {		this.caveatReferenceNo = caveatReferenceNo;	}	private String expiryDate;	public String getExpiryDate() {		return this.expiryDate;	}	public void setExpiryDate(String expiryDate) {		this.expiryDate = expiryDate;	}	private String presentationNo;	public String getPresentationNo() {		return this.presentationNo;	}	public void setPresentationNo(String presentationNo) {		this.presentationNo = presentationNo;	}	private String presentationDate;	public String getPresentationDate() {		return this.presentationDate;	}	public void setPresentationDate(String presentationDate) {		this.presentationDate = presentationDate;	}	private String lodgedDate;	public String getLodgedDate() {		return this.lodgedDate;	}	public void setLodgedDate(String lodgedDate) {		this.lodgedDate = lodgedDate;	}	private String solicitorName;	public String getSolicitorName() {		return this.solicitorName;	}	public void setSolicitorName(String solicitorName) {		this.solicitorName = solicitorName;	}	private String folio;	public String getFolio() {		return folio;	}	public void setFolio(String folio) {		this.folio = folio;	}	private String jilid;	public String getJilid() {		return jilid;	}	public void setJilid(String jilid) {		this.jilid = jilid;	}	private String partyCharge;	public String getPartyCharge() {		return partyCharge;	}	public void setPartyCharge(String partyCharge) {		this.partyCharge = partyCharge;	}	public String[][] getMapper() {		String[][] input = {		{ "form.chargeObject", CHARGEMAPPER },		};		return input;	}	public void reset() {	}    private String hostCollateralId;    public String getHostCollateralId() {        return hostCollateralId;    }    public void setHostCollateralId(String hostCollateralId) {        this.hostCollateralId = hostCollateralId;    }}
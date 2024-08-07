package com.integrosys.simulator.host.SIBS.CIFCreateAddress;

import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCustomerAddressCreateRes extends OBMessageHeader implements IOBHost {
	private Long customerNumber;

	private Long addressSequence;

	private String addressType;

	private String addressLine1;

	private String addressLine2;

	private String addressLine3;

	private String addressLine4;

	private String addressLine5;

	private String foreignAddress;

	private String insufficientAddress;

	private String blockHouseBuildingNumber;

	private String storeyNumber;

	private String unitNumber;

	private String poBoxNumber;

	private String buildingPostOfficeName;

	private String streetName;

	private String city;

	private String state;

	private String postalCode;

	private String country;

	private Date liveThereSinceDate;

	private String addressRemark;

	public Long getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(Long customerNumber) {
		this.customerNumber = customerNumber;
	}

	public Long getAddressSequence() {
		return addressSequence;
	}

	public void setAddressSequence(Long addressSequence) {
		this.addressSequence = addressSequence;
	}

	public String getAddressType() {
		return addressType;
	}

	public void setAddressType(String addressType) {
		this.addressType = addressType;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getAddressLine3() {
		return addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	public String getAddressLine4() {
		return addressLine4;
	}

	public void setAddressLine4(String addressLine4) {
		this.addressLine4 = addressLine4;
	}

	public String getAddressLine5() {
		return addressLine5;
	}

	public void setAddressLine5(String addressLine5) {
		this.addressLine5 = addressLine5;
	}

	public String getForeignAddress() {
		return foreignAddress;
	}

	public void setForeignAddress(String foreignAddress) {
		this.foreignAddress = foreignAddress;
	}

	public String getInsufficientAddress() {
		return insufficientAddress;
	}

	public void setInsufficientAddress(String insufficientAddress) {
		this.insufficientAddress = insufficientAddress;
	}

	public String getBlockHouseBuildingNumber() {
		return blockHouseBuildingNumber;
	}

	public void setBlockHouseBuildingNumber(String blockHouseBuildingNumber) {
		this.blockHouseBuildingNumber = blockHouseBuildingNumber;
	}

	public String getStoreyNumber() {
		return storeyNumber;
	}

	public void setStoreyNumber(String storeyNumber) {
		this.storeyNumber = storeyNumber;
	}

	public String getUnitNumber() {
		return unitNumber;
	}

	public void setUnitNumber(String unitNumber) {
		this.unitNumber = unitNumber;
	}

	public String getPoBoxNumber() {
		return poBoxNumber;
	}

	public void setPoBoxNumber(String poBoxNumber) {
		this.poBoxNumber = poBoxNumber;
	}

	public String getBuildingPostOfficeName() {
		return buildingPostOfficeName;
	}

	public void setBuildingPostOfficeName(String buildingPostOfficeName) {
		this.buildingPostOfficeName = buildingPostOfficeName;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Date getLiveThereSinceDate() {
		return liveThereSinceDate;
	}

	public void setLiveThereSinceDate(Date liveThereSinceDate) {
		this.liveThereSinceDate = liveThereSinceDate;
	}

	public String getAddressRemark() {
		return addressRemark;
	}

	public void setAddressRemark(String addressRemark) {
		this.addressRemark = addressRemark;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSCustomerAddressCreateRes addressCreateRes = (OBSIBSCustomerAddressCreateRes) responseFixList
						.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" customerNumber: " + addressCreateRes.getCustomerNumber() + newLine);
				result.append(" addressSequence: " + addressCreateRes.getAddressSequence() + newLine);
				result.append(" addressType: " + addressCreateRes.getAddressType() + newLine);
				result.append(" addressLine1: " + addressCreateRes.getAddressLine1() + newLine);
				result.append(" addressLine2: " + addressCreateRes.getAddressLine2() + newLine);
				result.append(" addressLine3: " + addressCreateRes.getAddressLine3() + newLine);
				result.append(" addressLine4: " + addressCreateRes.getAddressLine4() + newLine);
				result.append(" addressLine5: " + addressCreateRes.getAddressLine5() + newLine);
				result.append(" foreignAddress: " + addressCreateRes.getForeignAddress() + newLine);
				result.append(" insufficientAddress: " + addressCreateRes.getInsufficientAddress() + newLine);
				result.append(" blockHouseBuildingNumber: " + addressCreateRes.getBlockHouseBuildingNumber() + newLine);
				result.append(" storeyNumber: " + addressCreateRes.getStoreyNumber() + newLine);
				result.append(" unitNumber: " + addressCreateRes.getUnitNumber() + newLine);
				result.append(" poBoxNumber: " + addressCreateRes.getPoBoxNumber() + newLine);
				result.append(" buildingPostOfficeName: " + addressCreateRes.getBuildingPostOfficeName() + newLine);
				result.append(" streetName: " + addressCreateRes.getStreetName() + newLine);
				result.append(" city: " + addressCreateRes.getCifNumber() + newLine);
				result.append(" state: " + addressCreateRes.getState() + newLine);
				result.append(" postalCode: " + addressCreateRes.getPostalCode() + newLine);
				result.append(" country: " + addressCreateRes.getCountry() + newLine);
				result.append(" liveThereSinceDate: " + addressCreateRes.getLiveThereSinceDate() + newLine);
				result.append(" addressRemark: " + addressCreateRes.getAddressRemark() + newLine);
				result.append("}");
			}
		}

		return result.toString();

	}

	public void setSuccessResponse() {
	}

}

package com.integrosys.simulator.host.SEMA.approvedCard;

import java.io.Serializable;

import com.integrosys.simulator.host.SEMA.OBSEMAMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSEMAApprovedCardRes extends OBSEMAMessageHeader implements IOBHost, Serializable {

	// private Long customerNumber;
	// private String customerType;
	// private Date dateOfBirth;
	// private int cifCombinedCycle;
	// private BigDecimal income;

	private String appCreateStatus;

	private Short pBankNumber;

	private Long appId;

	private String cardInd;

	private String customerNumber;

	private Short productNo;

	private String accountNo;

	private String accountBlockCode;

	private String cardNumber;

	private Integer cardExpiryDate;

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSEMAApprovedCardRes approvedRes = (OBSEMAApprovedCardRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);

				result.append(" appCreateStatus: " + approvedRes.getAppCreateStatus() + newLine);
				result.append(" pBankNumber: " + approvedRes.getPBankNumber() + newLine);
				result.append(" appId: " + approvedRes.getAppId() + newLine);
				result.append(" cardInd: " + approvedRes.getCardInd() + newLine);
				result.append(" customerNumber: " + approvedRes.getCustomerNumber() + newLine);
				result.append(" productNo: " + approvedRes.getProductNo() + newLine);
				result.append(" accountNo: " + approvedRes.getAccountNo() + newLine);
				result.append(" accountBlockCode: " + approvedRes.getAccountBlockCode() + newLine);
				result.append(" cardNumber: " + approvedRes.getCardNumber() + newLine);
				result.append(" cardExpiryDate: " + approvedRes.getCardExpiryDate() + newLine);
				result.append("}");
			}
		}
		return result.toString();
	}

	public String getAppCreateStatus() {
		return appCreateStatus;
	}

	public void setAppCreateStatus(String appCreateStatus) {
		this.appCreateStatus = appCreateStatus;
	}

	public Short getPBankNumber() {
		return pBankNumber;
	}

	public void setPBankNumber(Short bankNumber) {
		pBankNumber = bankNumber;
	}

	public Long getAppId() {
		return appId;
	}

	public void setAppId(Long appId) {
		this.appId = appId;
	}

	public String getCardInd() {
		return cardInd;
	}

	public void setCardInd(String cardInd) {
		this.cardInd = cardInd;
	}

	public String getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(String customerNumber) {
		this.customerNumber = customerNumber;
	}

	public Short getProductNo() {
		return productNo;
	}

	public void setProductNo(Short productNo) {
		this.productNo = productNo;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getAccountBlockCode() {
		return accountBlockCode;
	}

	public void setAccountBlockCode(String accountBlockCode) {
		this.accountBlockCode = accountBlockCode;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public Integer getCardExpiryDate() {
		return cardExpiryDate;
	}

	public void setCardExpiryDate(Integer cardExpiryDate) {
		this.cardExpiryDate = cardExpiryDate;
	}

	public void setSuccessResponse() {
	}

}

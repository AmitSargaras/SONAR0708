package com.integrosys.simulator.host.SEMA.custinfo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;

import com.integrosys.simulator.host.SEMA.OBSEMA0011MessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSEMACustomerInfoRes extends OBSEMA0011MessageHeader implements IOBHost, Serializable {

	// private Long customerNumber;
	// private String customerType;
	// private Date dateOfBirth;
	// private int cifCombinedCycle;
	// private BigDecimal income;
	private Short pBankNumber;

	private String accountNumber;

	private BigDecimal accountProduct;

	private String accountPromoProgram;

	private String accountStatus;

	private String accountBlockCode;

	private String accountTNGIndicator;

	private String accountTNGStatus;

	private Integer accountBranchNumber;

	private BigDecimal accountStmtCycle;

	private BigDecimal accountCreditLimit;

	private BigDecimal accountCashLimit;

	private BigDecimal accountTotalOSBalance;

	private BigDecimal accountOSRetailBalance;

	private BigDecimal accountOSCashBalance;

	private BigDecimal accountAvailCreditLimit;

	private BigDecimal accountAvailCashLimit;

	private BigDecimal accountOSAuthorisation;

	private BigDecimal accountOSCashAuthorisation;

	private BigDecimal accountCurrentDue;

	private BigDecimal accountPastDue;

	private BigDecimal accountTotalDue;

	private String cardNumber;

	private Short cardBankNumber;

	private BigDecimal cardProduct;

	private String cardType;

	private String cardCHCustomerNumber;

	private String cardStatus;

	private String cardBlockCode;

	private String cardShortName;

	private Timestamp cardExpiryDate;

	private Short suppBankNumber;

	private String suppCustomerNumber;

	private String suppCustomerName;

	private String suppCustomerStatus;

	private String suppCustomerIdType;

	private String suppCustomerNewICNumber;

	private String suppCustomerOldICNumber;

	private String suppCustomerWorkerId;

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSEMACustomerInfoRes infoRes = (OBSEMACustomerInfoRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);

				result.append(" pBankNumber: " + infoRes.getPBankNumber() + newLine);
				result.append(" accountNumber: " + infoRes.getAccountNumber() + newLine);
				result.append(" accountProduct: " + infoRes.getAccountProduct() + newLine);
				result.append(" accountPromoProgram: " + infoRes.getAccountPromoProgram() + newLine);
				result.append(" accountStatus: " + infoRes.getAccountStatus() + newLine);
				result.append(" accountBlockCode: " + infoRes.getAccountBlockCode() + newLine);
				result.append(" accountTNGIndicator: " + infoRes.getAccountTNGIndicator() + newLine);
				result.append(" accountTNGStatus: " + infoRes.getAccountTNGStatus() + newLine);
				result.append(" accountBranchNumber: " + infoRes.getAccountBranchNumber() + newLine);
				result.append(" accountStmtCycle: " + infoRes.getAccountStmtCycle() + newLine);
				result.append(" accountCreditLimit: " + infoRes.getAccountCreditLimit() + newLine);
				result.append(" accountCashLimit: " + infoRes.getAccountCashLimit() + newLine);
				result.append(" accountTotalOSBalance: " + infoRes.getAccountTotalOSBalance() + newLine);
				result.append(" accountOSRetailBalance: " + infoRes.getAccountOSRetailBalance() + newLine);
				result.append(" accountOSCashBalance: " + infoRes.getAccountOSCashBalance() + newLine);
				result.append(" accountAvailCreditLimit: " + infoRes.getAccountAvailCreditLimit() + newLine);
				result.append(" accountAvailCashLimit: " + infoRes.getAccountAvailCashLimit() + newLine);
				result.append(" accountOSAuthorisation: " + infoRes.getAccountOSAuthorisation() + newLine);
				result.append(" accountOSCashAuthorisation: " + infoRes.getAccountOSCashAuthorisation() + newLine);
				result.append(" accountCurrentDue: " + infoRes.getAccountCurrentDue() + newLine);
				result.append(" accountPastDue: " + infoRes.getAccountPastDue() + newLine);
				result.append(" accountTotalDue: " + infoRes.getAccountTotalDue() + newLine);
				result.append(" cardNumber: " + infoRes.getCardNumber() + newLine);
				result.append(" cardBankNumber: " + infoRes.getCardBankNumber() + newLine);
				result.append(" cardProduct: " + infoRes.getCardProduct() + newLine);
				result.append(" cardCHCustomerNumber: " + infoRes.getCardCHCustomerNumber() + newLine);
				result.append(" cardStatus: " + infoRes.getCardStatus() + newLine);
				result.append(" cardBlockCode: " + infoRes.getCardBlockCode() + newLine);
				result.append(" cardShortName: " + infoRes.getCardShortName() + newLine);
				result.append(" cardExpiryDate: " + infoRes.getCardExpiryDate() + newLine);
				result.append(" suppBankNumber: " + infoRes.getSuppBankNumber() + newLine);
				result.append(" suppCustomerNumber: " + infoRes.getSuppCustomerNumber() + newLine);
				result.append(" suppCustomerName: " + infoRes.getSuppCustomerName() + newLine);
				result.append(" suppCustomerStatus: " + infoRes.getSuppCustomerStatus() + newLine);
				result.append(" suppCustomerIdType: " + infoRes.getSuppCustomerIdType() + newLine);
				result.append(" suppCustomerNewICNumber: " + infoRes.getSuppCustomerNewICNumber() + newLine);
				result.append(" suppCustomerOldICNumber: " + infoRes.getSuppCustomerOldICNumber() + newLine);
				result.append(" suppCustomerWorkerId: " + infoRes.getSuppCustomerWorkerId() + newLine);
				result.append("}");
			}
		}

		return result.toString();

	}

	public Short getPBankNumber() {
		return pBankNumber;
	}

	public void setPBankNumber(Short bankNumber) {
		pBankNumber = bankNumber;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public BigDecimal getAccountProduct() {
		return accountProduct;
	}

	public void setAccountProduct(BigDecimal accountProduct) {
		this.accountProduct = accountProduct;
	}

	public String getAccountPromoProgram() {
		return accountPromoProgram;
	}

	public void setAccountPromoProgram(String accountPromoProgram) {
		this.accountPromoProgram = accountPromoProgram;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	public String getAccountBlockCode() {
		return accountBlockCode;
	}

	public void setAccountBlockCode(String accountBlockCode) {
		this.accountBlockCode = accountBlockCode;
	}

	public String getAccountTNGIndicator() {
		return accountTNGIndicator;
	}

	public void setAccountTNGIndicator(String accountTNGIndicator) {
		this.accountTNGIndicator = accountTNGIndicator;
	}

	public String getAccountTNGStatus() {
		return accountTNGStatus;
	}

	public void setAccountTNGStatus(String accountTNGStatus) {
		this.accountTNGStatus = accountTNGStatus;
	}

	public Integer getAccountBranchNumber() {
		return accountBranchNumber;
	}

	public void setAccountBranchNumber(Integer accountBranchNumber) {
		this.accountBranchNumber = accountBranchNumber;
	}

	public BigDecimal getAccountStmtCycle() {
		return accountStmtCycle;
	}

	public void setAccountStmtCycle(BigDecimal accountStmtCycle) {
		this.accountStmtCycle = accountStmtCycle;
	}

	public BigDecimal getAccountCreditLimit() {
		return accountCreditLimit;
	}

	public void setAccountCreditLimit(BigDecimal accountCreditLimit) {
		this.accountCreditLimit = accountCreditLimit;
	}

	public BigDecimal getAccountCashLimit() {
		return accountCashLimit;
	}

	public void setAccountCashLimit(BigDecimal accountCashLimit) {
		this.accountCashLimit = accountCashLimit;
	}

	public BigDecimal getAccountTotalOSBalance() {
		return accountTotalOSBalance;
	}

	public void setAccountTotalOSBalance(BigDecimal accountTotalOSBalance) {
		this.accountTotalOSBalance = accountTotalOSBalance;
	}

	public BigDecimal getAccountOSRetailBalance() {
		return accountOSRetailBalance;
	}

	public void setAccountOSRetailBalance(BigDecimal accountOSRetailBalance) {
		this.accountOSRetailBalance = accountOSRetailBalance;
	}

	public BigDecimal getAccountOSCashBalance() {
		return accountOSCashBalance;
	}

	public void setAccountOSCashBalance(BigDecimal accountOSCashBalance) {
		this.accountOSCashBalance = accountOSCashBalance;
	}

	public BigDecimal getAccountAvailCreditLimit() {
		return accountAvailCreditLimit;
	}

	public void setAccountAvailCreditLimit(BigDecimal accountAvailCreditLimit) {
		this.accountAvailCreditLimit = accountAvailCreditLimit;
	}

	public BigDecimal getAccountAvailCashLimit() {
		return accountAvailCashLimit;
	}

	public void setAccountAvailCashLimit(BigDecimal accountAvailCashLimit) {
		this.accountAvailCashLimit = accountAvailCashLimit;
	}

	public BigDecimal getAccountOSAuthorisation() {
		return accountOSAuthorisation;
	}

	public void setAccountOSAuthorisation(BigDecimal accountOSAuthorisation) {
		this.accountOSAuthorisation = accountOSAuthorisation;
	}

	public BigDecimal getAccountOSCashAuthorisation() {
		return accountOSCashAuthorisation;
	}

	public void setAccountOSCashAuthorisation(BigDecimal accountOSCashAuthorisation) {
		this.accountOSCashAuthorisation = accountOSCashAuthorisation;
	}

	public BigDecimal getAccountCurrentDue() {
		return accountCurrentDue;
	}

	public void setAccountCurrentDue(BigDecimal accountCurrentDue) {
		this.accountCurrentDue = accountCurrentDue;
	}

	public BigDecimal getAccountPastDue() {
		return accountPastDue;
	}

	public void setAccountPastDue(BigDecimal accountPastDue) {
		this.accountPastDue = accountPastDue;
	}

	public BigDecimal getAccountTotalDue() {
		return accountTotalDue;
	}

	public void setAccountTotalDue(BigDecimal accountTotalDue) {
		this.accountTotalDue = accountTotalDue;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public Short getCardBankNumber() {
		return cardBankNumber;
	}

	public void setCardBankNumber(Short cardBankNumber) {
		this.cardBankNumber = cardBankNumber;
	}

	public BigDecimal getCardProduct() {
		return cardProduct;
	}

	public void setCardProduct(BigDecimal cardProduct) {
		this.cardProduct = cardProduct;
	}

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardCHCustomerNumber() {
		return cardCHCustomerNumber;
	}

	public void setCardCHCustomerNumber(String cardCHCustomerNumber) {
		this.cardCHCustomerNumber = cardCHCustomerNumber;
	}

	public String getCardStatus() {
		return cardStatus;
	}

	public void setCardStatus(String cardStatus) {
		this.cardStatus = cardStatus;
	}

	public String getCardBlockCode() {
		return cardBlockCode;
	}

	public void setCardBlockCode(String cardBlockCode) {
		this.cardBlockCode = cardBlockCode;
	}

	public String getCardShortName() {
		return cardShortName;
	}

	public void setCardShortName(String cardShortName) {
		this.cardShortName = cardShortName;
	}

	public Timestamp getCardExpiryDate() {
		return cardExpiryDate;
	}

	public void setCardExpiryDate(Timestamp cardExpiryDate) {
		this.cardExpiryDate = cardExpiryDate;
	}

	public Short getSuppBankNumber() {
		return suppBankNumber;
	}

	public void setSuppBankNumber(Short suppBankNumber) {
		this.suppBankNumber = suppBankNumber;
	}

	public String getSuppCustomerNumber() {
		return suppCustomerNumber;
	}

	public void setSuppCustomerNumber(String suppCustomerNumber) {
		this.suppCustomerNumber = suppCustomerNumber;
	}

	public String getSuppCustomerName() {
		return suppCustomerName;
	}

	public void setSuppCustomerName(String suppCustomerName) {
		this.suppCustomerName = suppCustomerName;
	}

	public String getSuppCustomerStatus() {
		return suppCustomerStatus;
	}

	public void setSuppCustomerStatus(String suppCustomerStatus) {
		this.suppCustomerStatus = suppCustomerStatus;
	}

	public String getSuppCustomerIdType() {
		return suppCustomerIdType;
	}

	public void setSuppCustomerIdType(String suppCustomerIdType) {
		this.suppCustomerIdType = suppCustomerIdType;
	}

	public String getSuppCustomerNewICNumber() {
		return suppCustomerNewICNumber;
	}

	public void setSuppCustomerNewICNumber(String suppCustomerNewICNumber) {
		this.suppCustomerNewICNumber = suppCustomerNewICNumber;
	}

	public String getSuppCustomerOldICNumber() {
		return suppCustomerOldICNumber;
	}

	public void setSuppCustomerOldICNumber(String suppCustomerOldICNumber) {
		this.suppCustomerOldICNumber = suppCustomerOldICNumber;
	}

	public String getSuppCustomerWorkerId() {
		return suppCustomerWorkerId;
	}

	public void setSuppCustomerWorkerId(String suppCustomerWorkerId) {
		this.suppCustomerWorkerId = suppCustomerWorkerId;
	}

	public void setSuccessResponse() {
	}

}

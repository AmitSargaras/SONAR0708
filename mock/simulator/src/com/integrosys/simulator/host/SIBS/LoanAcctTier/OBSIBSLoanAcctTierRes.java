package com.integrosys.simulator.host.SIBS.LoanAcctTier;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSLoanAcctTierRes extends OBMessageHeader implements IOBHost {

	private Long accountNumber;

	private String accountType;

	private String strRateEfficientDate;

	private Date rateEfficientDate;

	private BigDecimal loanInterestRate;

	private Long primeRateNumber;

	private BigDecimal primeVariance;

	private String primeVarianceCode;

	public Long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(Long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getStrRateEfficientDate() {
		return strRateEfficientDate;
	}

	public void setStrRateEfficientDate(String strRateEfficientDate) {
		this.strRateEfficientDate = strRateEfficientDate;
	}

	public Date getRateEfficientDate() {
		return rateEfficientDate;
	}

	public void setRateEfficientDate(Date rateEfficientDate) {
		this.rateEfficientDate = rateEfficientDate;
	}

	public BigDecimal getLoanInterestRate() {
		return loanInterestRate;
	}

	public void setLoanInterestRate(BigDecimal loanInterestRate) {
		this.loanInterestRate = loanInterestRate;
	}

	public Long getPrimeRateNumber() {
		return primeRateNumber;
	}

	public void setPrimeRateNumber(Long primeRateNumber) {
		this.primeRateNumber = primeRateNumber;
	}

	public BigDecimal getPrimeVariance() {
		return primeVariance;
	}

	public void setPrimeVariance(BigDecimal primeVariance) {
		this.primeVariance = primeVariance;
	}

	public String getPrimeVarianceCode() {
		return primeVarianceCode;
	}

	public void setPrimeVarianceCode(String primeVarianceCode) {
		this.primeVarianceCode = primeVarianceCode;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSLoanAcctTierRes loanAcctTierRes = (OBSIBSLoanAcctTierRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" accountNumber: " + loanAcctTierRes.getAccountNumber() + newLine);
				result.append(" accountType: " + loanAcctTierRes.getAccountType() + newLine);
				result.append(" strRateEfficientDate: " + loanAcctTierRes.getStrRateEfficientDate() + newLine);
				result.append(" rateEfficientDate: " + loanAcctTierRes.getRateEfficientDate() + newLine);
				result.append(" loanInterestRate: " + loanAcctTierRes.getLoanInterestRate() + newLine);
				result.append(" primeRateNumber: " + loanAcctTierRes.getPrimeRateNumber() + newLine);
				result.append(" primeVariance: " + loanAcctTierRes.getPrimeVariance() + newLine);
				result.append(" primeVarianceCode: " + loanAcctTierRes.getPrimeVarianceCode() + newLine);
				result.append("}");
			}
		}

		return result.toString();

	}

	public void setSuccessResponse() {
	}
}

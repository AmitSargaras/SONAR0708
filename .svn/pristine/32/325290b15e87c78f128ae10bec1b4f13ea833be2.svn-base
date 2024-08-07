package com.integrosys.simulator.host.SIBS.DealerInq;

import java.math.BigDecimal;
import java.util.Date;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSDealerInqRes extends OBMessageHeader implements IOBHost {
	private Long dealerNumber;

	private BigDecimal dealerLimit;

	private BigDecimal dealerAmountUtilised;

	private BigDecimal dealerTakeUpLimit;

	private Date dealerExpiryDate;

	public Long getDealerNumber() {
		return dealerNumber;
	}

	public void setDealerNumber(Long dealerNumber) {
		this.dealerNumber = dealerNumber;
	}

	public BigDecimal getDealerLimit() {
		return dealerLimit;
	}

	public void setDealerLimit(BigDecimal dealerLimit) {
		this.dealerLimit = dealerLimit;
	}

	public BigDecimal getDealerAmountUtilised() {
		return dealerAmountUtilised;
	}

	public void setDealerAmountUtilised(BigDecimal dealerAmountUtilised) {
		this.dealerAmountUtilised = dealerAmountUtilised;
	}

	public BigDecimal getDealerTakeUpLimit() {
		return dealerTakeUpLimit;
	}

	public void setDealerTakeUpLimit(BigDecimal dealerTakeUpLimit) {
		this.dealerTakeUpLimit = dealerTakeUpLimit;
	}

	public Date getDealerExpiryDate() {
		return dealerExpiryDate;
	}

	public void setDealerExpiryDate(Date dealerExpiryDate) {
		this.dealerExpiryDate = dealerExpiryDate;
	}

	public String printString() {
		StringBuilder result = new StringBuilder();
		String newLine = System.getProperty("line.separator");

		result.append(newLine + printHeaderString() + newLine);

		if (responseFixList != null) {
			for (int i = 0; i < responseFixList.size(); i++) {
				OBSIBSDealerInqRes dealerRes = (OBSIBSDealerInqRes) responseFixList.get(i);
				result.append(this.getClass().getName() + " Object {" + newLine);
				result.append(" dealerNumber: " + dealerRes.getDealerNumber() + newLine);
				result.append(" dealerLimit: " + dealerRes.getDealerLimit() + newLine);
				result.append(" dealerAmountUtilised: " + dealerRes.getDealerAmountUtilised() + newLine);
				result.append(" dealerTakeUpLimit: " + dealerRes.getDealerTakeUpLimit() + newLine);
				result.append(" dealerExpiryDate: " + dealerRes.getDealerExpiryDate() + newLine);
				result.append("}");
			}
		}

		return result.toString();
	}

	public void setSuccessResponse() {
		// TODO Auto-generated method stub

	}
}

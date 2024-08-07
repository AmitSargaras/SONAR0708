package com.integrosys.simulator.host.SIBS.collateraltradein;

import java.math.BigDecimal;

import com.integrosys.simulator.host.SIBS.OBMessageHeader;
import com.integrosys.simulator.host.base.IOBHost;

public class OBSIBSCollateralTradeIn extends OBMessageHeader implements IOBHost {
	private Long collateralId;

	private String makeOfGoods;

	private String modelNumber;

	private Integer yearOfManufacture;

	private String registrationNumber;

	private BigDecimal tradeInValue;

	private BigDecimal tradeInDeposit;

	public Long getCollateralId() {
		return collateralId;
	}

	public void setCollateralId(Long collateralId) {
		this.collateralId = collateralId;
	}

	public String getMakeOfGoods() {
		return makeOfGoods;
	}

	public void setMakeOfGoods(String makeOfGoods) {
		this.makeOfGoods = makeOfGoods;
	}

	public String getModelNumber() {
		return modelNumber;
	}

	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}

	public Integer getYearOfManufacture() {
		return yearOfManufacture;
	}

	public void setYearOfManufacture(Integer yearOfManufacture) {
		this.yearOfManufacture = yearOfManufacture;
	}

	public String getRegistrationNumber() {
		return registrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}

	public BigDecimal getTradeInValue() {
		return tradeInValue;
	}

	public void setTradeInValue(BigDecimal tradeInValue) {
		this.tradeInValue = tradeInValue;
	}

	public BigDecimal getTradeInDeposit() {
		return tradeInDeposit;
	}

	public void setTradeInDeposit(BigDecimal tradeInDeposit) {
		this.tradeInDeposit = tradeInDeposit;
	}

	public void setSuccessResponse() {
		setCommonSuccessResponse();
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

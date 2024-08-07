package com.integrosys.base.techinfra.util;

import java.math.BigDecimal;

/**
 * @author Chong Jun Yong
 * 
 */
public class ComplexBean {
	private SimpleBean simpleBean;

	private String type;

	private int numberOfBeans;

	private BigDecimal pocketMoney;

	public BigDecimal getPocketMoney() {
		return pocketMoney;
	}

	public void setPocketMoney(BigDecimal pocketMoney) {
		this.pocketMoney = pocketMoney;
	}

	public SimpleBean getSimpleBean() {
		return simpleBean;
	}

	public void setSimpleBean(SimpleBean simpleBean) {
		this.simpleBean = simpleBean;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getNumberOfBeans() {
		return numberOfBeans;
	}

	public void setNumberOfBeans(int numberOfBeans) {
		this.numberOfBeans = numberOfBeans;
	}

}

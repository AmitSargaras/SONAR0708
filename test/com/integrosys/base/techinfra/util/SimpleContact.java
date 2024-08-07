package com.integrosys.base.techinfra.util;

/**
 * @author Chong Jun Yong
 *
 */
public class SimpleContact {
	private long id;
	
	private long countryCode;

	private long areaCode;

	private long number;

	public long getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(long countryCode) {
		this.countryCode = countryCode;
	}

	public long getAreaCode() {
		return areaCode;
	}

	public void setAreaCode(long areaCode) {
		this.areaCode = areaCode;
	}

	public long getNumber() {
		return number;
	}

	public void setNumber(long number) {
		this.number = number;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
}

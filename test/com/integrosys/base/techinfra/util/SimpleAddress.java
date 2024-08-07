package com.integrosys.base.techinfra.util;

/**
 * @author Chong Jun Yong
 * 
 */
public class SimpleAddress {
	private long id;

	private String houseNo;

	private String streetNo;

	private long postCode;

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getStreetNo() {
		return streetNo;
	}

	public void setStreetNo(String streetNo) {
		this.streetNo = streetNo;
	}

	public long getPostCode() {
		return postCode;
	}

	public void setPostCode(long postCode) {
		this.postCode = postCode;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((houseNo == null) ? 0 : houseNo.hashCode());
		result = prime * result + (int) (postCode ^ (postCode >>> 32));
		result = prime * result + ((streetNo == null) ? 0 : streetNo.hashCode());
		return result;
	}

	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		SimpleAddress other = (SimpleAddress) obj;
		if (houseNo == null) {
			if (other.houseNo != null) {
				return false;
			}
		}
		else if (!houseNo.equals(other.houseNo)) {
			return false;
		}
		if (postCode != other.postCode) {
			return false;
		}
		if (streetNo == null) {
			if (other.streetNo != null) {
				return false;
			}
		}
		else if (!streetNo.equals(other.streetNo)) {
			return false;
		}
		return true;
	}

}

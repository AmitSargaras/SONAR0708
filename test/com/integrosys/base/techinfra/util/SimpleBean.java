package com.integrosys.base.techinfra.util;

import java.util.Date;

/**
 * @author Chong Jun Yong
 * 
 */
public class SimpleBean {
	private long id;

	private String name;

	private Date date;

	private long referenceId;

	public Date getDate() {
		return date;
	}

	public long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public long getReferenceId() {
		return this.referenceId;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setReferenceId(long referenceId) {
		this.referenceId = referenceId;
	}

	public String toString() {
		StringBuffer buf = new StringBuffer();
		buf.append("SimpleBean [id=");
		buf.append(id);
		buf.append(", referenceId=");
		buf.append(referenceId);
		buf.append(", date=");
		buf.append(date);
		buf.append(", name=");
		buf.append(name);
		buf.append("]");
		return buf.toString();
	}

}

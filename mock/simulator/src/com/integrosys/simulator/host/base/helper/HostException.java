package com.integrosys.simulator.host.base.helper;


public class HostException extends Exception {

	private String transactionId;

	public HostException() {
		super();
	}

	public HostException(String message) {
		super(message);
	}

	public HostException(Throwable throwable) {
		super(throwable);
	}

	public HostException(String message, Throwable throwable) {
		super(message, throwable);
	}

	public String getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}

}

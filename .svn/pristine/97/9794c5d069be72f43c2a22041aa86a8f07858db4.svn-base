package com.integrosys.simulator.host.tcp;

public class TCPSSLServer {

	private static TCPSSLServer instance = new TCPSSLServer();

	private TCPSSLServer() {

	}

	public static TCPSSLServer getInstance() {
		return instance;
	}

	public void start(String port) {

		TCPSSLServerListener tcpSSLServerListener = new TCPSSLServerListener(port);
		Thread t = new Thread(tcpSSLServerListener);
		t.start();
	}

	public static final void main(String[] args) throws Exception {
		TCPSSLServer.getInstance().start("9001");
		// TCPSSLServer.getInstance().start(args[0]);
	}
}
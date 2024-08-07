package com.integrosys.simulator.host.tcp;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;

public class TCPServer {

	private static final TCPServer instance = new TCPServer();

	private TCPServer() {
	}

	public static TCPServer getInstance() {
		return instance;
	}

	public void start(String port) {

		try {
			PrintStream stream = new PrintStream(new File("simulator.log"));
			System.setOut(stream);
			System.setErr(stream);
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		TCPServerListener tcpServerListener = new TCPServerListener(port);
		Thread t = new Thread(tcpServerListener);
		t.start();
	}

	public static final void main(String[] args) throws Exception {
		TCPServer.getInstance().start(args[0]);
	}
}
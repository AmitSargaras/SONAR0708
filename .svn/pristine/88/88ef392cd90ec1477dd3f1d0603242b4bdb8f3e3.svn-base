package com.integrosys.simulator.host.tcp;

import java.net.ServerSocket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.net.ServerSocketFactory;
import javax.net.ssl.SSLServerSocketFactory;

public class TCPSSLServerListener extends Thread {

	private boolean listening = false;

	private ServerSocket serverSSLSocket = null;

	private ExecutorService tpes = null;

	private String ipPort = "";

	public TCPSSLServerListener(String port) {
		this.ipPort = port;
		tpes = Executors.newFixedThreadPool(100);
	}

	public void run() {
		listening = true;
		try {

			int port = Integer.parseInt(ipPort);
			ServerSocketFactory sslserversocketfactory = (SSLServerSocketFactory) SSLServerSocketFactory.getDefault();
			serverSSLSocket = (ServerSocket) sslserversocketfactory.createServerSocket(port);

			System.out.println("****************************************************************");
			System.out.println("Start Connection On SSL TCP : ");
			System.out.println("TCP SSL Socket Listener Port " + port + " is started. ");

			while (listening) {
				TCPServerWork tcpSSLServerWork = new TCPServerWork(serverSSLSocket.accept());
				tpes.execute(tcpSSLServerWork);
			}

		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("TCP Socket is not able to start. Please check error from log file.");
		}
		finally {
			if (serverSSLSocket != null) {
				try {
					serverSSLSocket.close();
					serverSSLSocket = null;
				}
				catch (Exception e) {

				}

			}
		}
	}
}
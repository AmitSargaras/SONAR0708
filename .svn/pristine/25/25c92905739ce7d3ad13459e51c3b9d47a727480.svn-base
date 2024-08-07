package com.integrosys.simulator.host.tcp;

import java.net.ServerSocket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.net.ServerSocketFactory;

public class TCPServerListener extends Thread {

	private boolean listening = false;

	private ServerSocket serverSocket = null;

	private ExecutorService tpes = null;

	private String ipPort = "";

	public TCPServerListener(String port) {
		this.ipPort = port;
		tpes = Executors.newFixedThreadPool(100);
	}

	public void run() {
		listening = true;
		try {

			int port = Integer.parseInt(ipPort);
			ServerSocketFactory serversocketfactory = (ServerSocketFactory) ServerSocketFactory.getDefault();
			serverSocket = (ServerSocket) serversocketfactory.createServerSocket(port);
			// serverSocket = new ServerSocket(port);

			System.out.println("****************************************************************");
			System.out.println("Start Connection On TCP : ");
			System.out.println("TCP Socket Listener Port " + port + " is started. ");

			while (listening) {
				Thread.sleep(2000);
				TCPServerWork tcpServerWork = new TCPServerWork(serverSocket.accept());
				tpes.execute(tcpServerWork);
			}

		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("TCP Socket is not able to start. Please check error from log file.");
		}
		finally {
			if (serverSocket != null) {
				try {
					serverSocket.close();
					serverSocket = null;
				}
				catch (Exception e) {

				}

			}
		}
	}
}
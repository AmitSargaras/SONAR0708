package com.integrosys.simulator.host.tcp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.net.Socket;

public class TCPServerWork extends Thread {

	private Socket socket = null;

	public TCPServerWork(Socket socket) {
		this.socket = socket;
	}

	public void run() {
		BufferedOutputStream out = null;
		BufferedInputStream in = null;
		TCPLoadSetting tcpLoadSetting = new TCPLoadSetting();
		TCPLoadSettingVO tcpLoadSettingVO = new TCPLoadSettingVO();
		try {

			out = new BufferedOutputStream(socket.getOutputStream());
			in = new BufferedInputStream(socket.getInputStream());

			int totalBytes = 20480;
			byte[] bt = new byte[totalBytes];
			StringBuffer buffer = null;
			ByteArrayOutputStream by = new ByteArrayOutputStream();
			String input = null;
			int dataSize = 0;

			buffer = new StringBuffer();
			do {
				dataSize = in.read(bt);
				if (dataSize > 0) {
					buffer.append(new String(bt, 0, dataSize));
					by.write(bt, 0, dataSize);
				}
			} while (in.available() > 0);
			input = buffer.toString();
			buffer = null;
			System.out.println("Processing Request (Server Port: " + socket.getLocalPort() + " Client IP: "
					+ socket.getInetAddress().getHostAddress() + ")");

			tcpLoadSettingVO = tcpLoadSetting.loadConfig(by.toByteArray());
			byte[] outputContent = tcpLoadSettingVO.getResponseString();

			if (outputContent != null) {
				if (socket.isConnected()) {
					out.write(outputContent);
					out.flush();

				}
				else {
					System.out.println("- Connection to Client IP: " + socket.getInetAddress().getHostAddress()
							+ " is closed");
				}

			}
			else {
				System.out.println("- No response message.");
			}

			System.out.println("Finish");
			System.out.println("****************************************************************");
		}
		catch (Exception ioe) {
			System.out.println(" - " + ioe.getMessage());
		}
		finally {
			if (out != null) {
				try {
					out.close();
				}
				catch (Exception e) {

				}
				out = null;
			}
			if (in != null) {
				try {
					in.close();
				}
				catch (Exception e) {

				}
				in = null;
			}
			if (socket != null) {
				try {
					socket.close();
				}
				catch (Exception e) {

				}
				socket = null;
			}
		}
	}
}

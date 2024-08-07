package com.integrosys.simulator.host.tcp;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.net.Socket;

import com.integrosys.simulator.host.base.helper.Util;

public class TCPClient extends Thread {

	// private static Logger logger = Logger.getLogger(TransactionMapper.class);

	private String ipAddress;

	private int portNo;

	private int timeout;

	private String requestMessage = "";

	private byte[] requestByte;

	byte[] tt = new byte[3];

	public TCPClient(String ipAddress, int portNo, int timeout, String requestMessage, byte[] requestByte) {
		this.ipAddress = ipAddress;
		this.portNo = portNo;
		this.requestMessage = requestMessage;
		this.requestByte = requestByte;
		try {
			// System.out.println("==="+requestMessage.length());
			com.integrosys.simulator.host.base.helper.Util util = new com.integrosys.simulator.host.base.helper.Util();
			// System.arraycopy(requestMessage.getBytes(), 335, tt, 0, 3);
			// System.out.println("11111-"+util.Decode(tt, 3*2, 'P', false, 0));
			// //3F001F
			// System.out.println("22222-"+util.parsePackedDecimal(tt,
			// (byte)0x0f, (byte)0x0c));
			// System.out.println("="+byteArrayToHexString(tt));
			// System.out.println("="+util.toStringHex(tt, 3));

			// System.arraycopy(requestByte, 335, tt, 0, 3);
			// System.out.println("333333-"+util.Decode(tt, 3*2, 'P', false,
			// 0)); //90001
			// System.out.println("444444-"+util.parsePackedDecimal(tt,
			// (byte)0x0f, (byte)0x0c));
			// System.out.println("="+byteArrayToHexString(tt));
			// System.out.println("="+util.toStringHex(tt, 3));
		}
		catch (Exception e) {
			e.printStackTrace();
		}

		this.timeout = timeout;
	}

	public void run() {
		send();
	}

	public String send() {
		Socket socket = null;
		BufferedOutputStream out = null;
		BufferedInputStream in = null;
		byte[] tt = new byte[3];

		try {

			String responseMessage = null;

			int totalBytes = 20480;
			byte[] bt = new byte[totalBytes];
			StringBuffer buffer = new StringBuffer();
			int dataSize = 0;

			socket = new Socket(ipAddress, portNo);

			if (timeout > 0) {
				socket.setSoTimeout(timeout);
			}

			out = new BufferedOutputStream(socket.getOutputStream());
			in = new BufferedInputStream(socket.getInputStream());

			System.out.println("Sending message to Server IP: " + ipAddress + " Port No: " + portNo + " Message: "
					+ requestMessage);

			System.out.println("requestMessage.getBytes() = " + requestMessage.getBytes().length);
			System.out.println("requestMessage.length()   = " + requestMessage.length());

			// System.arraycopy(requestMessage.getBytes(), 335, tt, 0, 3);
			// com.integrosys.sml.los.host.base.helper.Util util = new
			// com.integrosys.sml.los.host.base.helper.Util();
			// System.out.println("11111-"+util.Decode(tt, 3*2, 'P', false, 0));
			// //3F001F
			// System.out.println("22222-"+util.parsePackedDecimal(tt,
			// (byte)0x0f, (byte)0x0c));
			// System.out.println("="+byteArrayToHexString(tt));
			// System.out.println("="+util.toStringHex(tt, 3));

			// out.write(requestMessage.getBytes(),0,requestMessage.length());
			// out.write(requestByte);
			out.write(requestByte, 0, requestByte.length);
			out.flush();

			do {
				dataSize = in.read(bt);
				if (dataSize > 0) {
					buffer.append(new String(bt, 0, dataSize));
				}
			} while (in.available() > 0);
			responseMessage = buffer.toString();

			System.out.println("Received message from Server IP: " + ipAddress + " Port No: " + portNo
					+ " Message Length: " + responseMessage.length());
			System.out.println("Received Message : " + responseMessage);

			byte[] responseArray = responseMessage.getBytes();
			System.out.println("responseArray.length=" + responseArray.length);
			// Socket Header
			byte[] temp = new byte[2];
			System.arraycopy(responseArray, 0, temp, 0, 2);
			System.out.println("SKTMLEN = " + Util.Decode(temp, 2 * 2, 'B', false, 0));
			temp = new byte[4];
			System.arraycopy(responseArray, 2, temp, 0, 4);
			System.out.println("Txn Code = " + Util.Decode(temp, 4, 'A', true, 0));
			temp = new byte[14];
			System.arraycopy(responseArray, 6, temp, 0, 14);
			System.out.println("Date Time = " + Util.Decode(temp, 14, 'S', true, 0));
			temp = new byte[14];
			System.arraycopy(responseArray, 20, temp, 0, 14);
			System.out.println("Ref Number = " + Util.Decode(temp, 14, 'S', true, 0));
			temp = new byte[40];
			System.arraycopy(responseArray, 34, temp, 0, 40);
			System.out.println("Msg ID = " + Util.Decode(temp, 40, 'A', true, 0));
			temp = new byte[4];
			System.arraycopy(responseArray, 74, temp, 0, 4);
			System.out.println("Resp Code = " + Util.Decode(temp, 4, 'A', true, 0));
			temp = new byte[100];
			System.arraycopy(responseArray, 78, temp, 0, 100);
			System.out.println("Resp Msg = " + Util.Decode(temp, 100, 'A', true, 0));
			temp = new byte[20];
			System.arraycopy(responseArray, 178, temp, 0, 20);
			System.out.println("RLOS UserID = " + Util.Decode(temp, 20, 'A', true, 0));
			temp = new byte[2];
			System.arraycopy(responseArray, 198, temp, 0, 2);
			System.out.println("Num Txn = " + Util.Decode(temp, 2, 'S', true, 0));
			temp = new byte[1];
			System.arraycopy(responseArray, 200, temp, 0, 1);
			System.out.println("More Record Ind = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[100];
			System.arraycopy(responseArray, 201, temp, 0, 100);
			System.out.println("Last Record Key = " + Util.Decode(temp, 100, 'A', true, 0));
			// Detail Header
			temp = new byte[4];
			System.arraycopy(responseArray, 301, temp, 0, 4);
			System.out.println("Bank Number = " + Util.Decode(temp, 4, 'S', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 305, temp, 0, 16);
			System.out.println("Costumer Number = " + Util.Decode(temp, 16, 'A', true, 0));
			temp = new byte[30];
			System.arraycopy(responseArray, 321, temp, 0, 30);
			System.out.println("customer Name = " + Util.Decode(temp, 30, 'A', true, 0));
			temp = new byte[1];
			System.arraycopy(responseArray, 351, temp, 0, 1);
			System.out.println("Customer status = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[1];
			System.arraycopy(responseArray, 352, temp, 0, 1);
			System.out.println("Customer IDType = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 353, temp, 0, 16);
			System.out.println("New IC = " + Util.Decode(temp, 16, 'A', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 369, temp, 0, 16);
			System.out.println("Old IC = " + Util.Decode(temp, 16, 'A', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 385, temp, 0, 16);
			System.out.println("Work ID = " + Util.Decode(temp, 16, 'A', true, 0));
			temp = new byte[6];
			System.arraycopy(responseArray, 401, temp, 0, 6);
			System.out.println("Customer Credit Limit = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 407, temp, 0, 6);
			System.out.println("Customer Cash Limit = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 413, temp, 0, 6);
			System.out.println("Customer Total OS Balance = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 419, temp, 0, 6);
			System.out.println("Customer OS Cash Balance = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 425, temp, 0, 6);
			System.out.println("Customer Avail Credit Limit = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 431, temp, 0, 6);
			System.out.println("Customer Avail Cash Limit = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 437, temp, 0, 6);
			System.out.println("Customer OS Auth = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 443, temp, 0, 6);
			System.out.println("Customer OS Cash Auth = " + Util.Decode(temp, 6, 'P', true, 2));

			// Body
			temp = new byte[4];
			System.arraycopy(responseArray, 449, temp, 0, 4);
			System.out.println("Acc Bank Number = " + Util.Decode(temp, 4, 'S', true, 0));
			temp = new byte[19];
			System.arraycopy(responseArray, 453, temp, 0, 19);
			System.out.println("Acc Number = " + Util.Decode(temp, 19, 'A', true, 0));
			temp = new byte[2];
			System.arraycopy(responseArray, 472, temp, 0, 2);
			System.out.println("Acc Product = " + Util.Decode(temp, 2, 'P', true, 0));
			temp = new byte[6];
			System.arraycopy(responseArray, 474, temp, 0, 6);
			System.out.println("Acc Promo Program = " + Util.Decode(temp, 6, 'A', true, 0));
			temp = new byte[1];
			System.arraycopy(responseArray, 480, temp, 0, 1);
			System.out.println("Acc Status = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[2];
			System.arraycopy(responseArray, 481, temp, 0, 2);
			System.out.println("Acc Block Code = " + Util.Decode(temp, 2, 'A', true, 0));
			temp = new byte[1];
			System.arraycopy(responseArray, 483, temp, 0, 1);
			System.out.println("Acc Tng Ind = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[1];
			System.arraycopy(responseArray, 484, temp, 0, 1);
			System.out.println("Acc Tng Status = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[5];
			System.arraycopy(responseArray, 485, temp, 0, 5);
			System.out.println("Acc Branch Number = " + Util.Decode(temp, 5, 'S', true, 0));
			temp = new byte[2];
			System.arraycopy(responseArray, 490, temp, 0, 2);
			System.out.println("Acc Stmt Cycle = " + Util.Decode(temp, 2, 'P', true, 0));
			temp = new byte[6];
			System.arraycopy(responseArray, 492, temp, 0, 6);
			System.out.println("Acc Credit Limit = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 498, temp, 0, 6);
			System.out.println("Acc Cash Limit = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 504, temp, 0, 6);
			System.out.println("Acc Total OS Balance = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 510, temp, 0, 6);
			System.out.println("Acc OS Retail Balance = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 516, temp, 0, 6);
			System.out.println("Acc OS Cash Balance = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 522, temp, 0, 6);
			System.out.println("Acc Avail Credit Limit = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 528, temp, 0, 6);
			System.out.println("Acc Avail Cash Limit = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 534, temp, 0, 6);
			System.out.println("Acc OS Auth = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 540, temp, 0, 6);
			System.out.println("Acc OS Cash Auth = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 546, temp, 0, 6);
			System.out.println("Acc Current Due = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 552, temp, 0, 6);
			System.out.println("Acc Past Due = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[6];
			System.arraycopy(responseArray, 558, temp, 0, 6);
			System.out.println("Acc Total Due = " + Util.Decode(temp, 6, 'P', true, 2));
			temp = new byte[19];
			System.arraycopy(responseArray, 564, temp, 0, 19);
			System.out.println("Card Number = " + Util.Decode(temp, 19, 'A', true, 0));
			temp = new byte[4];
			System.arraycopy(responseArray, 583, temp, 0, 4);
			System.out.println("Card Bank Number = " + Util.Decode(temp, 4, 'S', true, 0));
			// System.out.println("HDRNUM = "+Util.parsePackedDecimal(temp,
			// (byte)0x0f, (byte)0x0c));
			// System.out.println("HDRNUM.length = "+Util.parsePackedDecimal(temp,
			// "+".getBytes()[0], "-".getBytes()[0]).length());
			temp = new byte[2];
			System.arraycopy(responseArray, 587, temp, 0, 2);
			System.out.println("Card Product = " + Util.Decode(temp, 2, 'P', true, 0));
			// System.out.println("HDRNUM = "+Util.parsePackedDecimal(temp,
			// (byte)0x0f, (byte)0x0c));
			temp = new byte[1];
			System.arraycopy(responseArray, 589, temp, 0, 1);
			System.out.println("Card Type = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 590, temp, 0, 16);
			System.out.println("Card CH Number = " + Util.Decode(temp, 16, 'A', true, 0));
			temp = new byte[1];
			System.arraycopy(responseArray, 606, temp, 0, 1);
			System.out.println("Card Status = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[2];
			System.arraycopy(responseArray, 607, temp, 0, 2);
			System.out.println("Card Block Code = " + Util.Decode(temp, 2, 'A', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 609, temp, 0, 16);
			System.out.println("Card Short Name = " + Util.Decode(temp, 16, 'A', true, 0));
			temp = new byte[3];
			System.arraycopy(responseArray, 625, temp, 0, 3);
			System.out.println("Card Expiry Date = " + Util.Decode(temp, 3, 'P', true, 0));
			temp = new byte[4];
			System.arraycopy(responseArray, 628, temp, 0, 4);
			System.out.println("Supp Bank Number = " + Util.Decode(temp, 4, 'S', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 632, temp, 0, 16);
			System.out.println("Supp Customer Number = " + Util.Decode(temp, 16, 'A', true, 0));
			temp = new byte[30];
			System.arraycopy(responseArray, 648, temp, 0, 30);
			System.out.println("Supp Customer Name = " + Util.Decode(temp, 30, 'A', true, 0));
			temp = new byte[1];
			System.arraycopy(responseArray, 678, temp, 0, 1);
			System.out.println("Supp Customer Status = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[1];
			System.arraycopy(responseArray, 679, temp, 0, 1);
			System.out.println("Supp Cust IDType = " + Util.Decode(temp, 1, 'A', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 680, temp, 0, 16);
			System.out.println("Supp New IC = " + Util.Decode(temp, 16, 'A', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 696, temp, 0, 16);
			System.out.println("Supp Old IC = " + Util.Decode(temp, 16, 'A', true, 0));
			temp = new byte[16];
			System.arraycopy(responseArray, 712, temp, 0, 16);
			System.out.println("Supp Work ID = " + Util.Decode(temp, 16, 'A', true, 0));
			/*
			 * temp = new byte[1]; System.arraycopy(responseArray, 338, temp, 0,
			 * 1); System.out.println("HDACCD = "+Util.Decode(temp, 1, 'A',
			 * true, 0)); temp = new byte[1]; System.arraycopy(responseArray,
			 * 339, temp, 0, 1);
			 * System.out.println("HDTMOD = "+Util.Decode(temp, 1, 'A', true,
			 * 0)); temp = new byte[2]; System.arraycopy(responseArray, 340,
			 * temp, 0, 2); System.out.println("HDNREC = "+Util.Decode(temp, 22,
			 * 'P', true, 0)); temp = new byte[1];
			 * System.arraycopy(responseArray, 342, temp, 0, 1);
			 * System.out.println("HDMREC = "+Util.Decode(temp, 1, 'A', true,
			 * 0)); temp = new byte[1]; System.arraycopy(responseArray, 343,
			 * temp, 0, 1); System.out.println("HDSMTD = "+Util.Decode(temp, 1,
			 * 'A', true, 0)); temp = new byte[7];
			 * System.arraycopy(responseArray, 344, temp, 0, 7);
			 * System.out.println("HDRCD1 = "+Util.Decode(temp, 7, 'A', true,
			 * 0)); temp = new byte[50]; System.arraycopy(responseArray, 351,
			 * temp, 0, 50); System.out.println("HDRRE1 = "+Util.Decode(temp,
			 * 50, 'A', true, 0)); temp = new byte[7];
			 * System.arraycopy(responseArray, 401, temp, 0, 7);
			 * System.out.println("HDRCD2 = "+Util.Decode(temp, 7, 'A', true,
			 * 0)); temp = new byte[50]; System.arraycopy(responseArray, 408,
			 * temp, 0, 50); System.out.println("HDRRE2 = "+Util.Decode(temp,
			 * 50, 'A', true, 0)); temp = new byte[7];
			 * System.arraycopy(responseArray, 458, temp, 0, 7);
			 * System.out.println("HDRCD3 = "+Util.Decode(temp, 7, 'A', true,
			 * 0)); temp = new byte[50]; System.arraycopy(responseArray, 465,
			 * temp, 0, 50); System.out.println("HDRRE3 = "+Util.Decode(temp,
			 * 50, 'A', true, 0)); temp = new byte[7];
			 * System.arraycopy(responseArray, 515, temp, 0, 7);
			 * System.out.println("HDRCD4 = "+Util.Decode(temp, 7, 'A', true,
			 * 0)); temp = new byte[50]; System.arraycopy(responseArray, 522,
			 * temp, 0, 50); System.out.println("HDRRE4 = "+Util.Decode(temp,
			 * 50, 'A', true, 0)); temp = new byte[7];
			 * System.arraycopy(responseArray, 572, temp, 0, 7);
			 * System.out.println("HDRCD5 = "+Util.Decode(temp, 7, 'A', true,
			 * 0)); temp = new byte[50]; System.arraycopy(responseArray, 579,
			 * temp, 0, 50); System.out.println("HDRRE5 = "+Util.Decode(temp,
			 * 50, 'A', true, 0)); temp = new byte[5];
			 * System.arraycopy(responseArray, 629, temp, 0, 5);
			 * System.out.println("HDDTIN = "+Util.Decode(temp, 52, 'P', true,
			 * 0)); temp = new byte[4]; System.arraycopy(responseArray, 634,
			 * temp, 0, 4); System.out.println("HDTMIN = "+Util.Decode(temp, 42,
			 * 'P', true, 0)); temp = new byte[10];
			 * System.arraycopy(responseArray, 638, temp, 0, 10);
			 * System.out.println("HDACTN = "+Util.Decode(temp, 102, 'P', true,
			 * 0)); temp = new byte[1]; System.arraycopy(responseArray, 648,
			 * temp, 0, 1); System.out.println("HDACTY = "+Util.Decode(temp, 1,
			 * 'A', true, 0)); temp = new byte[10];
			 * System.arraycopy(responseArray, 649, temp, 0, 10);
			 * System.out.println("HDCIFN = "+Util.Decode(temp, 102, 'P', true,
			 * 0)); temp = new byte[10]; System.arraycopy(responseArray, 659,
			 * temp, 0, 10); System.out.println("HDFILR = "+Util.Decode(temp,
			 * 10, 'A', true, 0)); temp = new byte[1];
			 * System.arraycopy(responseArray, 669, temp, 0, 1);
			 * System.out.println("MBSOPT = "+Util.Decode(temp, 1, 'A', true,
			 * 0)); temp = new byte[21]; System.arraycopy(responseArray, 670,
			 * temp, 0, 21); System.out.println("MBUKEY = "+Util.Decode(temp,
			 * 21, 'A', true, 0)); //Body temp = new byte[40];
			 * System.arraycopy(responseArray, 691, temp, 0, 40);
			 * System.out.println("CFSSNO = "+Util.Decode(temp, 40, 'A', true,
			 * 0)); temp = new byte[3]; System.arraycopy(responseArray, 731,
			 * temp, 0, 3); System.out.println("CFSSCD = "+Util.Decode(temp, 3,
			 * 'A', true, 0)); temp = new byte[3];
			 * System.arraycopy(responseArray, 734, temp, 0, 3);
			 * System.out.println("CFIDCN = "+Util.Decode(temp, 3, 'A', true,
			 * 0)); temp = new byte[1]; System.arraycopy(responseArray, 737,
			 * temp, 0, 1); System.out.println("MAINID = "+Util.Decode(temp, 1,
			 * 'A', true, 0)); temp = new byte[10];
			 * System.arraycopy(responseArray, 738, temp, 0, 10);
			 * System.out.println("CFCIFN = "+Util.Decode(temp, 102, 'P', true,
			 * 0)); temp = new byte[16]; System.arraycopy(responseArray, 748,
			 * temp, 0, 16); System.out.println("CFFSNM = "+Util.Decode(temp,
			 * 16, 'A', true, 0));
			 */

			// temp = new byte[40];
			// System.arraycopy(responseArray, 671, temp, 0, 40);
			// System.out.println("CFSSNO = "+Util.Decode(temp, 40, 'A', true,
			// 0));
			// temp = new byte[3];
			// System.arraycopy(responseArray, 711, temp, 0, 3);
			// System.out.println("CFSSCD = "+Util.Decode(temp, 3, 'A', true,
			// 0));
			// temp = new byte[3];
			// System.arraycopy(responseArray, 714, temp, 0, 3);
			// System.out.println("CFIDCN = "+Util.Decode(temp, 3, 'A', true,
			// 0));
			// temp = new byte[1];
			// System.arraycopy(responseArray, 717, temp, 0, 1);
			// System.out.println("MAINID = "+Util.Decode(temp, 1, 'A', true,
			// 0));
			// temp = new byte[10];
			// System.arraycopy(responseArray, 718, temp, 0, 10);
			// System.out.println("CFCIFN = "+Util.Decode(temp, 10*2, 'P', true,
			// 0));
			// temp = new byte[20];
			// System.arraycopy(responseArray, 728, temp, 0, 20);
			// System.out.println("CFFSNM = "+Util.Decode(temp, 20, 'A', true,
			// 0));

		}
		catch (Exception e) {
			e.printStackTrace();
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

		return "";
	}

	public static void main(String args[]) {

		Thread t = null;
		try {
			String requestMessage = null;
			// SIBS Header
			// byte [] result = new byte[36];
			byte[] result = new byte[337];

			com.integrosys.simulator.host.base.helper.Util util = new com.integrosys.simulator.host.base.helper.Util();
			// Socket header
			System.arraycopy(util.Encode("335", 'B', 2 * 2, false, 0), 0, result, 0, 2);
			System.arraycopy(util.Encode("0010", 'A', 4, true, 0), 0, result, 2, 4);
			System.arraycopy(util.Encode("20081226114740", 'S', 14, true, 0), 0, result, 6, 14);
			System.arraycopy(util.Encode("20081224000030", 'S', 14, true, 0), 0, result, 20, 14);
			System.arraycopy(util.Encode("0000328                                 ", 'A', 40, true, 0), 0, result, 34,
					40);
			System.arraycopy(util.Encode("    ", 'A', 4, true, 0), 0, result, 74, 4);
			System
					.arraycopy(
							util
									.Encode(
											"                                                                                                    ",
											'A', 100, true, 0), 0, result, 76, 100);
			System.arraycopy(util.Encode("1234567890          ", 'A', 20, true, 0), 0, result, 178, 20);
			System.arraycopy(util.Encode("01", 'S', 2, true, 0), 0, result, 198, 2);
			System.arraycopy(util.Encode("N", 'A', 1, true, 0), 0, result, 200, 1);
			System
					.arraycopy(
							util
									.Encode(
											"                                                                                                    ",
											'A', 100, true, 0), 0, result, 201, 100);

			// System.arraycopy(util.Encode("N", 'A',1, true, 0), 0, result,
			// 299, 1);
			// System.arraycopy(util.Encode("780101010101    ", 'A',16, true,
			// 0), 0, result, 300, 16);
			// System.arraycopy(util.Encode("                   ", 'A',19, true,
			// 0), 0, result, 316, 19);

			System.arraycopy(util.Encode(" ", 'A', 1, true, 0), 0, result, 301, 1);
			System.arraycopy(util.Encode("                ", 'A', 16, true, 0), 0, result, 302, 16);
			System.arraycopy(util.Encode("5148960000040003   ", 'A', 19, true, 0), 0, result, 318, 19);

			/*
			 * System.arraycopy(util.Encode("        ", 'A',8, true, 0), 0,
			 * result, 90, 8); System.arraycopy(util.Encode("00000000000",
			 * 'S',11, true, 0), 0, result, 98, 11);
			 * System.arraycopy(util.Encode("00", 'S',2, true, 0), 0, result,
			 * 109, 2); System.arraycopy(util.Encode("                    ",
			 * 'A',20, true, 0), 0, result, 111, 20);
			 * System.arraycopy(util.Encode("BBMBSLSINQFNC   ", 'A',16, true,
			 * 0), 0, result, 131, 16); System.arraycopy(util.Encode("0000",
			 * 'A',4, true, 0), 0, result, 147, 4);
			 * System.arraycopy(util.Encode("                     ", 'A',22,
			 * true, 0), 0, result, 151, 22);
			 * System.arraycopy(util.Encode("            ", 'A',12, true, 0), 0,
			 * result, 173, 12); System.arraycopy(util.Encode("0000", 'S',4,
			 * true, 0), 0, result, 185, 4);
			 * System.arraycopy(util.Encode("0000", 'S',4, true, 0), 0, result,
			 * 189, 4); System.arraycopy(util.Encode("0000", 'S',4, true, 0), 0,
			 * result, 193, 4); System.arraycopy(util.Encode("SI1OFF01  ",
			 * 'A',10, true, 0), 0, result, 197, 10);
			 * System.arraycopy(util.Encode("          ", 'A',10, true, 0), 0,
			 * result, 207, 10); System.arraycopy(util.Encode("          ",
			 * 'A',10, true, 0), 0, result, 217, 10);
			 * System.arraycopy(util.Encode(" ", 'A',1, true, 0), 0, result,
			 * 227, 1); System.arraycopy(util.Encode(" ", 'A',1, true, 0), 0,
			 * result, 228, 1);
			 * System.arraycopy(util.Encode("                    ", 'A',20,
			 * true, 0), 0, result, 229, 20);
			 * 
			 * //Mbase //HDRIND System.arraycopy(util.Encode("  ", 'A',2, true,
			 * 0), 0, result, 249, 2); //HDUSID
			 * System.arraycopy(util.Encode("SI1OFF01", 'A',10, true, 0), 0,
			 * result, 251, 10); //HDRNUM
			 * System.arraycopy(util.Encode("0000000", 'P',42, false, 0), 0,
			 * result, 261, 4); //HDRBID System.arraycopy(util.Encode("0000",
			 * 'P',32, false, 0), 0, result, 265, 3); //HDEGPI
			 * System.arraycopy(util.Encode("    ", 'A',4, true, 0), 0, result,
			 * 268, 4); //HDBMSG System.arraycopy(util.Encode("00", 'P',22,
			 * false, 0), 0, result, 272, 2); //HDSRID
			 * System.arraycopy(util.Encode("   ", 'A',3, true, 0), 0, result,
			 * 274, 3); //HDDSID System.arraycopy(util.Encode("RBS", 'A',3,
			 * true, 0), 0, result, 277, 3); //HDRTDQ
			 * System.arraycopy(util.Encode("          ", 'A',10, true, 0), 0,
			 * result, 280, 10); //HDTMID
			 * System.arraycopy(util.Encode("          ", 'A',10, true, 0), 0,
			 * result, 290, 10); //HDBKNO System.arraycopy(util.Encode("00",
			 * 'P',22, false, 0), 0, result, 300, 2); //HDBRNO
			 * System.arraycopy(util.Encode("00000", 'P',32, false, 0), 0,
			 * result, 302, 3); //HDRSID
			 * System.arraycopy(util.Encode("          ", 'A',10, true, 0), 0,
			 * result, 305, 10); //HDTSID
			 * System.arraycopy(util.Encode("          ", 'A',10, true, 0), 0,
			 * result, 315, 10); //HDHSID
			 * System.arraycopy(util.Encode("          ", 'A',10, true, 0), 0,
			 * result, 325, 10); //HDTXCD System.arraycopy(util.Encode("90001",
			 * 'P',32, false, 0), 0, result, 335, 3); //
			 * System.arraycopy(util.formatPackedDecimal(90001, 5, (byte)0x0f,
			 * (byte)0x0c), 0, result, 335, 3); //HDACCD
			 * System.arraycopy(util.Encode("I", 'A',1, true, 0), 0, result,
			 * 338, 1); //HDTMOD System.arraycopy(util.Encode("R", 'A',1, true,
			 * 0), 0, result, 339, 1); //HDNREC
			 * System.arraycopy(util.Encode("000", 'P',22, false, 0), 0, result,
			 * 340, 2); //HDMREC System.arraycopy(util.Encode("N", 'A',1, true,
			 * 0), 0, result, 342, 1); //HDSMTD
			 * System.arraycopy(util.Encode("F", 'A',1, true, 0), 0, result,
			 * 343, 1); //HDRCD1 System.arraycopy(util.Encode("       ", 'A',7,
			 * true, 0), 0, result, 344, 7); //HDRRE1
			 * System.arraycopy(util.Encode
			 * ("                                                  ", 'A',50,
			 * true, 0), 0, result, 351, 50); //HDRCD2
			 * System.arraycopy(util.Encode("       ", 'A',7, true, 0), 0,
			 * result, 401, 7); //HDRRE2System.arraycopy(util.Encode(
			 * "                                                  ", 'A',50,
			 * true, 0), 0, result, 408, 50); //HDRCD3
			 * System.arraycopy(util.Encode("       ", 'A',7, true, 0), 0,
			 * result, 458, 7); //HDRRE3System.arraycopy(util.Encode(
			 * "                                                  ", 'A',50,
			 * true, 0), 0, result, 465, 50); //HDRCD4
			 * System.arraycopy(util.Encode("       ", 'A',7, true, 0), 0,
			 * result, 515, 7); //HDRRE4System.arraycopy(util.Encode(
			 * "                                                  ", 'A',50,
			 * true, 0), 0, result, 522, 50); //HDRCD5
			 * System.arraycopy(util.Encode("       ", 'A',7, true, 0), 0,
			 * result, 572, 7); //HDRRE5System.arraycopy(util.Encode(
			 * "                                                  ", 'A',50,
			 * true, 0), 0, result, 579, 50); //HDDTIN
			 * System.arraycopy(util.Encode("24092008", 'P',52, false, 0), 0,
			 * result, 629, 5); //HDTMIN System.arraycopy(util.Encode("163020",
			 * 'P',42, false, 0), 0, result, 634, 4); //HDACTN
			 * System.arraycopy(util.Encode("0000000000000000000", 'P',102,
			 * false, 0), 0, result, 638, 10); //HDACTY
			 * System.arraycopy(util.Encode(" ", 'A',1, true, 0), 0, result,
			 * 648, 1); //HDCIFN
			 * System.arraycopy(util.Encode("0000000000000000000", 'P',102,
			 * false, 0), 0, result, 649, 10); //HDFILR
			 * System.arraycopy(util.Encode("          ", 'A',10, true, 0), 0,
			 * result, 659, 10); //MBSOPT System.arraycopy(util.Encode("S",
			 * 'A',1, true, 0), 0, result, 669, 1); //MBUKEY
			 * System.arraycopy(util.Encode("                     ", 'A',21,
			 * true, 0), 0, result, 670, 21);
			 */

			System.out.println("req msg = " + new String(result, 0, result.length));
			System.out.println("req msg length = " + result.length);
			// Body
			// System.arraycopy(util.Encode("5864907                                 ",
			// 'A',40, true, 0), 0, result, 723, 40);
			// System.arraycopy(util.Encode("IO ", 'A',3, true, 0), 0, result,
			// 763, 3);
			// System.arraycopy(util.Encode("MY ", 'A',3, true, 0), 0, result,
			// 766, 3);
			// System.arraycopy(util.Encode(" ", 'A',1, true, 0), 0, result,
			// 769, 1);
			// System.arraycopy(util.Encode("0000000000000000000", 'P',10, true,
			// 0), 0, result, 770, 10);
			/*
			 * System.arraycopy(util.Encode("5864907                                 "
			 * , 'A',40, true, 0), 0, result, 691, 40);
			 * System.arraycopy(util.Encode("IO ", 'A',3, true, 0), 0, result,
			 * 731, 3); System.arraycopy(util.Encode("MY ", 'A',3, true, 0), 0,
			 * result, 734, 3); System.arraycopy(util.Encode(" ", 'A',1, true,
			 * 0), 0, result, 737, 1);
			 * System.arraycopy(util.Encode("0000000000000000000", 'P',102,
			 * false, 0), 0, result, 738, 10);
			 */

			// requestMessage =
			// HostSimulatorUtil.getFileContent("C:/eBworx/HostRevamp/HostSimulator/input/8001.xml");
			byte[] tt = new byte[3];
			// System.arraycopy(result, 335, tt, 0, 3);

			// System.out.println("1-"+util.Decode(tt, 3*2, 'P', false, 0));
			// System.out.println("2-"+util.parsePackedDecimal(tt, (byte)0x0f,
			// (byte)0x0c));
			// System.out.println("="+byteArrayToHexString(tt));
			// System.out.println("="+util.toStringHex(tt, 3));

			System.out.println("------start------");
			// for (int i = 0; i < 1; i++) {
			// TCPClient client = new TCPClient("172.28.252.1", 10151, 60*1000,
			// new String(result,0,result.length));
			TCPClient client = new TCPClient("localhost", 9001, 60 * 1000, new String(result, 0, result.length), result);
			// TCPClient client = new TCPClient("172.28.252.14", 11012, 60*1000,
			// new String(result,0,result.length), result);
			// TCPClient client = new TCPClient("172.28.252.1", 10151, 180*1000,
			// requestMessage);
			t = new Thread(client);

			// System.out.println("11-"+util.Decode(tt, 3*2, 'P', false, 0));
			// //3F001F
			// System.out.println("22-"+util.parsePackedDecimal(tt, (byte)0x0f,
			// (byte)0x0c));
			// System.out.println("="+byteArrayToHexString(tt));
			// System.out.println("="+util.toStringHex(tt, 3));
			t.start();
			// }

		}
		catch (Exception e) {
			e.printStackTrace();
		}

	}

	static String byteArrayToHexString(byte in[]) {
		byte ch = 0x00;
		int i = 0;
		if ((in == null) || (in.length <= 0)) {
			return null;
		}

		String pseudo[] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" };
		StringBuffer out = new StringBuffer(in.length * 2);

		while (i < in.length) {
			ch = (byte) (in[i] & 0xF0); // Strip off high nibble
			ch = (byte) (ch >>> 4);
			// shift the bits down
			ch = (byte) (ch & 0x0F);
			// must do this is high order bit is on!
			out.append(pseudo[(int) ch]); // convert the nibble to a String
											// Character
			ch = (byte) (in[i] & 0x0F); // Strip off low nibble
			out.append(pseudo[(int) ch]); // convert the nibble to a String
											// Character
			i++;
		}
		String rslt = new String(out);
		return rslt;
	}

}

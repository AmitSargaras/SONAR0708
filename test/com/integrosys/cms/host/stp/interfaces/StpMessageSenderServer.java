package com.integrosys.cms.host.stp.interfaces;

import com.integrosys.cms.host.stp.adapter.MessageAdapter;
import com.integrosys.cms.host.stp.bus.OBStpField;

import java.io.*;
import java.net.*;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Jerlin Ong
 * Date: Sep 8, 2008
 * Time: 10:54:53 AM
 * To change this template use File | Settings | File Templates.
 */
public class StpMessageSenderServer {
    public static void main(String args[]) throws Exception{

        ServerSocket serverSocket = null;
        Socket clientSocket = null;

        String clientMsg = null;
        String serverMsg = null;

        DataInputStream din;
        DataOutputStream dout;

        boolean bEOM  = false;
        int    p_MsgLen 	= 4096;
        int byteLen = 0;
        int i = 0;
        int TmpIndex = 0;
        long intByteRec = 0;
        int msgLenAvai = 0;
        byte[] byteTemp  = new byte[p_MsgLen];
        byte[] p_byteReceiveHostComm = new byte[p_MsgLen];
        byte[] changeReceiveMsgtoByte = new byte[p_MsgLen];
        MessageAdapter msgAdapter = new MessageAdapter();
        List dList = new ArrayList();
        List aList = new ArrayList();

        OBStpField obStpA1 = new OBStpField();
        obStpA1.setFieldID("1");
        obStpA1.setClassName("");
        obStpA1.setClassField("");
        obStpA1.setClassFieldType("");
        obStpA1.setPosition("1");
        obStpA1.setLength("10");
        obStpA1.setValue("");
        obStpA1.setFormat("A");
        obStpA1.setMandatory("M");
        obStpA1.setDecimalPoint("0");
        aList.add(obStpA1);
        OBStpField obStpP1 = new OBStpField();
        obStpP1.setFieldID("2");
        obStpP1.setClassName("");
        obStpP1.setClassField("");
        obStpP1.setClassFieldType("");
        obStpP1.setPosition("2");
        obStpP1.setLength("10");
        obStpP1.setValue("");
        obStpP1.setFormat("P");
        obStpP1.setMandatory("M");
        obStpP1.setDecimalPoint("2");
        aList.add(obStpP1);
        OBStpField obStpA2 = new OBStpField();
        obStpA2.setFieldID("3");
        obStpA2.setClassName("");
        obStpA2.setClassField("");
        obStpA2.setClassFieldType("");
        obStpA2.setPosition("3");
        obStpA2.setLength("5");
        obStpA2.setValue("");
        obStpA2.setFormat("A");
        obStpA2.setMandatory("M");
        obStpA2.setDecimalPoint("0");
        aList.add(obStpA2);
        OBStpField obStpP2 = new OBStpField();
        obStpP2.setFieldID("4");
        obStpP2.setClassName("");
        obStpP2.setClassField("");
        obStpP2.setClassFieldType("");
        obStpP2.setPosition("4");
        obStpP2.setLength("6");
        obStpP2.setValue("");
        obStpP2.setFormat("P");
        obStpP2.setMandatory("M");
        obStpP2.setDecimalPoint("0");
        aList.add(obStpP2);

        try {
            try {
                System.out.println("Server Started.");
                serverSocket = new ServerSocket(3300);

                clientSocket = serverSocket.accept();
                System.out.println("After Socket.");

            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
	       	    din = new DataInputStream(clientSocket.getInputStream());
	            /*get response from server*/
        	    while (!bEOM){
                    System.out.println("After While");
	                intByteRec = din.read(byteTemp,0,byteTemp.length);

                    System.out.println("After the length of the byte pass back by server : " + intByteRec);

                    if ((intByteRec == 0) || (intByteRec == -1)){
                        bEOM = true;
                        break;
                    }

                    for (i=0; i< intByteRec; i++){
                        System.out.println("Inside for loop i : " + i);
                        Arrays.fill(p_byteReceiveHostComm,TmpIndex, TmpIndex+1, byteTemp[i]);
                        TmpIndex++;
                     }

                     if (TmpIndex == intByteRec) {
                        System.out.println("Inside if : " + TmpIndex + " p_MsgLen : " + p_MsgLen);
                        bEOM = true;
                        break;
                     }
	            }
                dList = msgAdapter.decipherMessageToList(byteTemp,aList);
                System.out.println("dList : " + dList);
                clientMsg = msgAdapter.decipherMessageToString(byteTemp,aList);
                System.out.println("clientMsg : " + clientMsg);
                //clientMsg = new String(p_byteReceiveHostComm);
                System.out.println("After Byte convert to String for message from client : " + clientMsg);

            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

            try {
                serverMsg = "Message Receive From Client : " + clientMsg;
                System.out.println("serverMsg : " + serverMsg);
                changeReceiveMsgtoByte = msgAdapter.constructMessageToByte(dList);
                System.out.println("changeReceiveMsgtoByte : " + changeReceiveMsgtoByte);
                serverMsg = msgAdapter.constructMessageToString(aList);
                System.out.println("serverMsg : " + serverMsg);
        	    dout = new DataOutputStream(clientSocket.getOutputStream());
                System.out.println("After DataOutputStream");

                dout.write(changeReceiveMsgtoByte,0,byteLen);
                System.out.println("After DataOutputStream write");
	            dout.flush();
                System.out.println("After DataOutputStream flush");
            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }

                clientSocket.close();
                serverSocket.close();
                System.out.println("Server Ended.");
         } catch (Exception e) {
                e.printStackTrace();
        }
    }
}

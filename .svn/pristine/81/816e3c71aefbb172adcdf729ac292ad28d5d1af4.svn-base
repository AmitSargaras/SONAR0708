package com.integrosys.cms.host.stp.adapter;

import junit.framework.TestCase;
import com.integrosys.cms.host.stp.bus.OBStpField;
import com.integrosys.cms.host.stp.adapter.MessageAdapter;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Jerlin Ong
 * Date: Aug 29, 2008
 * Time: 4:03:05 PM
 * To change this template use File | Settings | File Templates.
 */
public class StpMessageAdapterTest extends TestCase {
    public void testMessageAdapter(){
        List aList = new ArrayList();
        MessageAdapter msgAdapter = new MessageAdapter();
        byte[] byteTemp  = new byte[4096];
        String cMsg = null;
        List dList = new ArrayList();
        String dMsg = null;

        OBStpField obStpA1 = new OBStpField();
        obStpA1.setFieldID("1");
        obStpA1.setClassName("");
        obStpA1.setClassField("");
        obStpA1.setClassFieldType("");
        obStpA1.setPosition("1");
        obStpA1.setLength("10");
        obStpA1.setValue("ABCDEF");
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
        obStpP1.setValue("-12345.67");
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
        obStpA2.setValue("ZYX");
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
        obStpP2.setLength("5");
        obStpP2.setValue("98765");
        obStpP2.setFormat("P");
        obStpP2.setMandatory("M");
        obStpP2.setDecimalPoint("0");
        aList.add(obStpP2);

        try{
            byteTemp = msgAdapter.constructMessageToByte(aList);
            System.out.println("byteTemp : " + byteTemp);
            cMsg = msgAdapter.constructMessageToString(aList);
            System.out.println("cMsg : " + cMsg);

            dList = msgAdapter.decipherMessageToList(byteTemp,aList);
            System.out.println("dList : " + dList);
            dMsg = msgAdapter.decipherMessageToString(byteTemp,aList);
            System.out.println("dMsg : " + dMsg);
            assertEquals(cMsg, dMsg);
        } catch (Exception e) {
            System.out.println("TestMessageAdapter::main::" + e.getMessage());
        }
    }
}

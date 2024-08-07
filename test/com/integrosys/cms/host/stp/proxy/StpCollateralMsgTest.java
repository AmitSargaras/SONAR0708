package com.integrosys.cms.host.stp.proxy;

import junit.framework.TestCase;

import java.util.List;
import java.util.HashMap;

import com.integrosys.cms.host.stp.mapper.ISTPMapper;
import com.integrosys.cms.host.stp.mapper.STPMapper;
import com.integrosys.cms.host.stp.adapter.MessageAdapter;
import com.integrosys.cms.host.stp.interfaces.StpMessageSender;

/**
 * Created by IntelliJ IDEA.
 * User: Jerlin
 * Date: Oct 7, 2008
 * Time: 9:49:43 AM
 * To change this template use File | Settings | File Templates.
 */
public class StpCollateralMsgTest extends TestCase {

    //Test communication with server for Collateral Master
    public void testGetMsgColMasterCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-122", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "1");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-122", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Master
    public void testGetMsgColMasterUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-132", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "2");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-132", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Master
    public void testGetMsgColMasterDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-142", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "3");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-142", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Insurance
    public void testGetMsgColInsuranceCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-124", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "4");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-124", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Insurance
    public void testGetMsgColInsuranceUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-134", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "5");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-134", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Insurance
    public void testGetMsgColInsuranceDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-144", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "6");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-144", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Trade IN
    public void testGetMsgColTradeInCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-125", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "7");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-125", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Trade IN
    public void testGetMsgColTradeInUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-135", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "8");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-135", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Trade IN
    public void testGetMsgColTradeInDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-145", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "9");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-145", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Chargor
    public void testGetMsgColChargorCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-126", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "10");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-126", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Chargor
    public void testGetMsgColChargorUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-136", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "11");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-136", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Chargor
    public void testGetMsgColChargorDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-146", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "12");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-146", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Facility Linkage Creation
    public void testGetMsgColFacLinkCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-721", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "13");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-721", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Facility Linkage Update
    public void testGetMsgColFacLinkUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-731", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "14");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-731", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Facility Linkage Delete
    public void testGetMsgColFacLinkDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-741", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "15");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-741", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Facility Chargor Linkage Creation
    public void testGetMsgColFacChargorCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-722", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "16");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-722", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Facility Chargor Linkage Update
    public void testGetMsgColFacChargorUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-732", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "17");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-732", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Collateral Facility Chargor Linkage Deletion
    public void testGetMsgColFacChargorDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-742", ISTPMapper.COLLATERAL_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "18");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-742", ISTPMapper.COLLATERAL_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }
}

package com.integrosys.cms.host.stp.proxy;

import junit.framework.TestCase;
import com.integrosys.cms.host.stp.interfaces.StpMessageSender;
import com.integrosys.cms.host.stp.mapper.STPMapper;
import com.integrosys.cms.host.stp.mapper.ISTPMapper;
import com.integrosys.cms.host.stp.adapter.MessageAdapter;

import java.util.List;
import java.util.HashMap;

/**
 * Created by IntelliJ IDEA.
 * User: Jerlin
 * Date: Oct 7, 2008
 * Time: 11:04:06 AM
 * To change this template use File | Settings | File Templates.
 */
public class StpFacilityMsgTest extends TestCase {
    //Test communication with server for Facility Master Creation
    public void testGetMsgFacMasterCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-321", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "19");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-321", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Master Update
    public void testGetMsgFacMasterUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-331", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "20");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-331", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Master Deletion
    public void testGetMsgFacMasterDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-341", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "21");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-341", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility BNM Creation
    public void testGetMsgFacBNMCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-327", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "22");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-327", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility BNM Update
    public void testGetMsgFacBNMUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-337", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "23");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-337", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility BNM Deletion
    public void testGetMsgFacBNMDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-347", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "24");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-347", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Officer Creation
    public void testGetMsgFacOfficerCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-328", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "25");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-328", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Officer Update
    public void testGetMsgFacOfficerUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-338", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "26");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-338", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Officer Delete
    public void testGetMsgFacOfficerDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-348", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "27");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-348", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Relationship Create
    public void testGetMsgFacRelCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-322", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "28");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-322", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Relationship Update
    public void testGetMsgFacRelUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-332", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "29");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-332", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Relationship Deletion
    public void testGetMsgFacRelDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-342", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "30");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-342", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Insurance Creation
    public void testGetMsgFacInsCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-329", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "31");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-329", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Insurance Update
    public void testGetMsgFacInsUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-339", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "32");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-339", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Insurance Deletion
    public void testGetMsgFacInsDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-349", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "33");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-349", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }


    //Test communication with server for Islamic Facility Master Creation
    public void testGetMsgIslamicFacMasterCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-376", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        // SIT login
        hmap.put("I13USER", "SI1OFF01");
        hmap.put("HDUSID", "SI1OFF01");
        // UAT login
//        hmap.put("I13USER", "CMSCAC01");
//        hmap.put("HDUSID", "CMSCAC01");
        // "S" (send) / "R" (resend)
//        hmap.put("MBSOPT","R");
        hmap.put("MBUKEY", "34");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-376", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Islamic Facility Master Update
    public void testGetMsgIslamicFacMasterUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-386", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "SI1OFF01");
        hmap.put("HDUSID", "SI1OFF01");
        hmap.put("MBUKEY", "35");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-386", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Islamic Facility Master Deletion
    public void testGetMsgIslamicFacMasterDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-396", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "SI1OFF01");
        hmap.put("HDUSID", "SI1OFF01");
        hmap.put("MBUKEY", "36");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-396", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }


    //Test communication with server for Facility BBA Vari Package Creation
    public void testGetMsgFacBBACreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-371", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "37");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-371", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility BBA Vari Package Update
    public void testGetMsgFacBBAUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-381", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "38");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-381", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility BBA Vari Package Deletion
    public void testGetMsgFacBBADelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-391", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "39");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-391", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }


    //Test communication with server for Facility Multi Tier Financing Creation
    public void testGetMsgFacMultiTierCreate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-324", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "40");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-324", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Multi Tier Financing Update
    public void testGetMsgFacMultiTierUpdate() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-334", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "41");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-334", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

    //Test communication with server for Facility Multi Tier Financing Deletion
    public void testGetMsgFacMultiTierDelete() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-344", ISTPMapper.FACILITY_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "42");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-344", ISTPMapper.FACILITY_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }


    //Test communication with server for Facility Multi Tier Financing Listing
    public void testGetMsgFacMultiTierListing() throws Exception {
        STPMapper stpMapper = new STPMapper();
        StpMessageSender msgSender = new StpMessageSender();
        MessageAdapter msgAdapter = new MessageAdapter();

        List stpList = stpMapper.getList("request-304", ISTPMapper.OTHER_PATH);
        HashMap hmap = new HashMap();
        hmap.put("I13USER", "CMSCAC01");
        hmap.put("HDUSID", "CMSCAC01");
        hmap.put("MBUKEY", "43");
        stpList = stpMapper.mapToFieldOB(hmap, stpList);
        assertNotNull(stpList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);
        byte[] returnByteMsg = (byte []) msgSender.sendAndReceive(convertByteMsg, null);
        assertNotNull(returnByteMsg);

        if (returnByteMsg != null) {
            List returnMsgList = stpMapper.getList("response-304", ISTPMapper.OTHER_PATH);
            returnMsgList = msgAdapter.decipherMessageToList(returnByteMsg, returnMsgList);
        }
    }

}

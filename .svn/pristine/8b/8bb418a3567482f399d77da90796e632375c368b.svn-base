package com.integrosys.cms.host.stp.proxy;

import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.propertyfile.PropertyManager;
import com.integrosys.cms.app.collateral.bus.OBInsurancePolicy;
import com.integrosys.cms.app.collateral.bus.type.cash.OBCashDeposit;
import com.integrosys.cms.app.collateral.bus.type.cash.ICashDeposit;
import com.integrosys.cms.app.customer.bus.OBCustomerSearchResult;
import com.integrosys.cms.app.customer.bus.CustomerSearchCriteria;
import com.integrosys.cms.host.mq.IMessageSenderProxy;
import com.integrosys.cms.host.stp.adapter.MessageAdapter;
import com.integrosys.cms.host.stp.bus.OBStpField;
import com.integrosys.cms.host.stp.bus.StpTransBusManagerImpl;
import com.integrosys.cms.host.stp.bus.StpTransJdbcImpl;
import com.integrosys.cms.host.stp.common.IStpTransType;
import com.integrosys.cms.host.stp.interfaces.StpMessageSender;
import com.integrosys.cms.host.stp.mapper.DomParser;
import com.integrosys.cms.host.stp.mapper.STPMapper;
import com.integrosys.component.user.app.bus.ICommonUser;
import com.integrosys.component.user.app.bus.OBCommonUser;
import org.easymock.MockControl;
import org.springframework.test.AbstractTransactionalSpringContextTests;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.lang.StringUtils;

import javax.sql.DataSource;
import java.net.URL;
import java.util.*;

/**
 * Test case to test stp synchronize proxy
 *
 * @author: KLYong
 * @version: ${VERSION}
 * @since: Sep 18, 2008 2:33:06 PM
 */

/**
 * update customer inquiry test case
 *
 * @author Andy Wong
 * @since 20 Oct 2008
 */
public class StpSyncProxyImplTest extends AbstractTransactionalSpringContextTests {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    StpTransJdbcImpl jdbc;
    StpTransBusManagerImpl busManager;
    StpSyncProxyImpl syncProxy;

    protected String[] getConfigLocations() {
        return new String[]{"classpath:AppContext_TrxDataSource_Test.xml"};
    }

    public void onSetUp() throws Exception {
        Log4jConfigTestPlugin.configure();
        jdbc = new StpTransJdbcImpl();
        DataSource targeDataSource = (DataSource) getApplicationContext().getBean("ofaPool");
        jdbc.setDataSource(targeDataSource);
        jdbc.setSequenceFormatter(new DateSequencerFormatter());
        busManager = new StpTransBusManagerImpl();
        busManager.setStpTransJdbc(jdbc);
        syncProxy = StpSyncProxyImpl.getInstance();
        syncProxy.setStpMsgSender(new StpMessageSender());
        syncProxy.setStpMsgAdapter(new MessageAdapter());
        STPMapper mapper = new STPMapper();
        mapper.setStpDomParser(new DomParser(Arrays.asList(new String [] {"/otherStp.xml"})));
        syncProxy.setStpMapper(mapper);
        syncProxy.setStpTransBusManager(busManager);

        Properties properties = PropertyManager.getProperty();
        Properties prop = new Properties();
        URL fileNameUrl = getClass().getResource("/stp.properties");
        prop.load(fileNameUrl.openStream());
        properties.putAll(prop);

        super.onSetUp();
    }

    //Test sender communication
    public void testSenderStpComm() throws Exception {
        MockControl mockControl = MockControl.createControl(IMessageSenderProxy.class);
        IMessageSenderProxy sender = (IMessageSenderProxy) mockControl.getMock();

        STPMapper stpClassMapper = new STPMapper();
        MessageAdapter msgAdapter = new MessageAdapter();
        OBInsurancePolicy obInsurancePolicy = new OBInsurancePolicy();
        obInsurancePolicy.setDebitingACNo("AC00123456");
        obInsurancePolicy.setAcType("D");

        List xmlMsgList = stpClassMapper.getList("request-321`", STPMapper.FACILITY_PATH);
        List conversionMsgList = stpClassMapper.mapToFieldOB(obInsurancePolicy, xmlMsgList);
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(conversionMsgList);

        //Easy mock recording
        sender.sendAndReceive(convertByteMsg, null);
        mockControl.setDefaultReturnValue(convertByteMsg);
        mockControl.replay();

        byte[] returnByteMsg = (byte[]) sender.sendAndReceive(convertByteMsg, null);

        //Compare convert byte and return byte
        assertEquals(convertByteMsg, returnByteMsg);
    }

    public ICommonUser getUserName(String username) {
        ICommonUser user = new OBCommonUser();
        user.setLoginID(username);
        return user;
    }

    //Test communication with server - Inquiry Account Verification
    public void testInquiryAccVer() throws Exception {
        ArrayList arlist = new ArrayList();
        Map map = new HashMap();
        map.put("HDNREC", "1");
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(map);
        OBInsurancePolicy obInsurancePolicy = new OBInsurancePolicy();
        obInsurancePolicy.setDebitingACNo("16400000739"); //Valid data
        obInsurancePolicy.setAcType("L");
        arlist.add(obInsurancePolicy);

        Object object = syncProxy.submitTask("906", arlist.toArray());
        Object[] bizOB = (Object[]) object;
        for (int i = 0; i < bizOB.length; i++) {
            if (bizOB[i] instanceof OBInsurancePolicy) {
                OBInsurancePolicy obInsuPol = (OBInsurancePolicy) bizOB[i];
                assertEquals(obInsurancePolicy.getDebitingACNo(), obInsuPol.getDebitingACNo());
                assertEquals(obInsurancePolicy.getAcType(), obInsuPol.getAcType());
            }
        }
    }

    //Test communication with server - Inquiry search FD Account list
    public void testInquiryFDAccList() throws Exception {
        Map map = new HashMap();
        map.put("HDNREC", "1");
        map.put("I13MORE", "1");
        map.put("HDMREC" , "Y");
        ArrayList arlist = new ArrayList();
        arlist.add(getUserName("CMSCAC02"));
        arlist.add(map);
        OBCashDeposit obCashDeposit = new OBCashDeposit();
        obCashDeposit.setDepositRefNo("3300055862"); //Valid data
        //obCashDeposit.setAccountTypeValue("0000000003000032738");
        arlist.add(obCashDeposit);

        Object object = syncProxy.submitTask("908", arlist.toArray());
        ArrayList bizList = (ArrayList) object;
        assertNotNull(bizList);
        for (int i = 0; i < bizList.size(); i++) {
            if (bizList.get(i) instanceof OBCashDeposit) {
                OBCashDeposit obCashDep = (OBCashDeposit) bizList.get(i);
                assertNotNull(obCashDep);
            }
        }

        //Testing for more indicator record
//        arlist.clear();
//        map.clear();
//        map.put("HDNREC", "1");
//        map.put("I13MORE", "1");
//        map.put("HDMREC" , "Y");
//        arlist.add(getUserName("SI1OFF01"));
//        arlist.add(map);
//        OBCashDeposit obCashDeposit2 = new OBCashDeposit();
//        obCashDeposit2.setDepositRefNo("2300057920"); //InValid data
//        obCashDeposit2.setAccountTypeValue("2000312312");
//        arlist.add(obCashDeposit2);
//        Object object2 = syncProxy.submitTask("908", arlist.toArray());
//        ArrayList bizList2 = (ArrayList) object2;
//        assertNotNull(bizList2);
//        for (int i = 0; i < bizList2.size(); i++) {
//            if (bizList2.get(i) instanceof OBCashDeposit) {
//                OBCashDeposit obCashDep2 = (OBCashDeposit) bizList2.get(i);
//                assertNotNull(obCashDep2);
//            }
//        }
    }

    //Test communication with server - Inquiry customer search
    public void testInquiryCustSearch() throws Exception {
        final String noOfRecord = "10";

        ArrayList arlist = new ArrayList();
        Map map = new HashMap();
        map.put("HDNREC", noOfRecord);
        map.put("WKMETH", "M");
        arlist.add(getUserName("CMSCACT1"));
        arlist.add(map);
        CustomerSearchCriteria customerSearchCriteria = new CustomerSearchCriteria();
        customerSearchCriteria.setLegalID("140006387");
        //customerSearchCriteria.setCustomerName("ALI");
        arlist.add(customerSearchCriteria);

        ArrayList bizList = (ArrayList) syncProxy.submitTask("001", arlist.toArray());
//        assertEquals(bizList.size(), Integer.parseInt(noOfRecord));

        for (Iterator iterator = bizList.iterator(); iterator.hasNext();) {
            OBCustomerSearchResult result = (OBCustomerSearchResult) iterator.next();
            logger.debug("Cust Name="+ result.getCustomerName());
            logger.debug("CIF ID="+ result.getLegalReference());
            logger.debug("ID Type="+ result.getIdType());
            logger.debug("ID Num="+ result.getIdNo());
            logger.debug("Country="+ result.getOrigLocCntry());
        }

        //test get more record
//        arlist = new ArrayList();
//        arlist.add(getUserName("SI1OFF01"));
//        map.put("I13MORE", "1");
//        map.put("HDMREC" , "Y");
//        arlist.add(map);
//        customerSearchCriteria = (OBCustomerSearchResult) bizList.get(Integer.parseInt(noOfRecord)-1);
//        arlist.add(customerSearchResult);
//
//        bizList = (ArrayList) syncProxy.submitTask("001", arlist.toArray());
//        assertEquals(bizList.size(), Integer.parseInt(noOfRecord));
//
//        for (Iterator iterator = bizList.iterator(); iterator.hasNext();) {
//            OBCustomerSearchResult result = (OBCustomerSearchResult) iterator.next();
//            logger.debug("MORE--Cust Name="+ result.getCustomerName());
//            logger.debug("MORE--CIF ID="+ result.getLegalID());
//            logger.debug("MORE--ID Type="+ result.getIdType());
//            logger.debug("MORE--ID Num="+ result.getIdNo());
//            logger.debug("MORE--Country="+ result.getOrigLocCntry());
//        }
//
//        //test get exact search
//        arlist = new ArrayList();
//        arlist.add(getUserName("SI1OFF01"));
//        map.put("WKMETH", "N");
//        customerSearchResult = new OBCustomerSearchResult();
////        customerSearchResult.setLegalID(0);
//        customerSearchResult.setCustomerName("ALI @ KADIR BIN CHE");
//        arlist.add(map);
//        arlist.add(customerSearchResult);
//
//        bizList = (ArrayList) syncProxy.submitTask("001", arlist.toArray());
//
//        for (Iterator iterator = bizList.iterator(); iterator.hasNext();) {
//            OBCustomerSearchResult result = (OBCustomerSearchResult) iterator.next();
//            logger.debug("EXACT--Cust Name="+ result.getCustomerName());
//            logger.debug("EXACT--CIF ID="+ result.getLegalID());
//            logger.debug("EXACT--ID Type="+ result.getIdType());
//            logger.debug("EXACT--ID Num="+ result.getIdNo());
//            logger.debug("EXACT--Country="+ result.getOrigLocCntry());
//        }
    }

    //Using easy mock to stimulate GetObjectMsg method by mocking stpcomm
    public void testGetObjectMsg() throws Exception {
        MockControl mockCtrl = MockControl.createControl(IMessageSenderProxy.class);
        IMessageSenderProxy sender = (IMessageSenderProxy) mockCtrl.getMock();

        ArrayList arlist = new ArrayList();
        arlist.add(getUserName("SI1OFF01"));
        OBInsurancePolicy obInsurancePolicy = new OBInsurancePolicy();
        obInsurancePolicy.setDebitingACNo("18450003717");
        obInsurancePolicy.setAcType("L");
        arlist.add(obInsurancePolicy);

        StpSyncProxyImpl stpSyncProxyImpl = new StpSyncProxyImpl();
        STPMapper stpMapper = new STPMapper();
        MessageAdapter msgAdapter = new MessageAdapter();
        List stpList = new ArrayList();
        List xmlMsgList = stpMapper.getList("request-906", STPMapper.OTHER_PATH);
        for (int j = 0; j < xmlMsgList.size(); j++) {
            OBStpField obStpField = new OBStpField(xmlMsgList, j);
            stpList.add(obStpField);
        }
        Object[] object = arlist.toArray();
        for (int i = 0; i < arlist.toArray().length; i++) {
            stpList = stpMapper.mapToFieldOB(object[i], stpList);
        }
        byte[] convertByteMsg = msgAdapter.constructMessageToByte(stpList);
        assertNotNull(convertByteMsg);

        sender.sendAndReceive(convertByteMsg, null);
        mockCtrl.setDefaultReturnValue(convertByteMsg);
        mockCtrl.replay();

        syncProxy.setStpMsgSender(sender);
        Object object1 = syncProxy.submitTask("906", arlist.toArray());
        assertNotNull(object1);
        Object[] bizOB = (Object[]) object1;
        assertNotNull(bizOB);
        for (int i = 0; i < bizOB.length; i++) {
            if (bizOB[i] instanceof OBCashDeposit) {
                OBInsurancePolicy obInsuPol = (OBInsurancePolicy) bizOB[i];
                assertNotNull(obInsuPol);
                assertEquals(obInsurancePolicy.getDebitingACNo(), obInsuPol.getDebitingACNo());
                assertEquals(obInsurancePolicy.getAcType(), obInsuPol.getAcType());
            }
        }
    }

    //Collateral Linkage To Facility Subfile - 95701
    public void testColLinkFacSubfile() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("CCAPNO", "0000000000200000001");
        dataMap.put("CCFCDE", "610");
        dataMap.put("ACTSEQ", "0000000000000000001");
        dataMap.put("CCDCID", "");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("701", arlist.toArray());
        List resultList = (ArrayList) object;
        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }

        //test get more record
        arlist = new ArrayList();
        arlist.add(getUserName("SI1OFF01"));
        headerMap.put("I13MORE", "1");
        headerMap.put("HDNREC", noOfRecord);
        headerMap.put("HDMREC" , "Y");
        arlist.add(headerMap);
        dataMap.put("CCAPNO", "0000000000200000001");
        dataMap.put("CCFCDE", "610");
        dataMap.put("ACTSEQ", "0000000000000000001");
        dataMap.put("CCDCID", "");
        arlist.add(dataMap);

        object = syncProxy.submitTask("701", arlist.toArray());
        resultList = (ArrayList) object;
        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //Collateral Linkage To Facility Inquiry - 96701
    public void testColLinkFacInquiry() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("CCAPNO", "0000000000200000001");
        dataMap.put("CCFCDE", "423");
        dataMap.put("ACTSEQ", "0000000000000000001");
        dataMap.put("CCDCID", "0000000000002052785");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("711", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //Facility's Collateral Charge Listing - more record - 95702
    public void testFacColChargeListing() throws Exception {
        final String noOfRecord = "1";
        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("CCAPNO", "0000000000200000001");
        dataMap.put("CCFCDE", "610");
        dataMap.put("ACTSEQ", "0000000000000000001");
        dataMap.put("CCDCID", "0000000000002052786");
        dataMap.put("CCHGTP", "");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("702", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }

        //test get more record
        arlist = new ArrayList();
        arlist.add(getUserName("SI1OFF01"));
        headerMap.put("I13MORE", "1");
        headerMap.put("HDNREC", noOfRecord);
        headerMap.put("HDMREC" , "Y");
        arlist.add(headerMap);
        dataMap.put("CCAPNO", "0000000000200000001");
        dataMap.put("CCFCDE", "610");
        dataMap.put("ACTSEQ", "0000000000000000001");
        dataMap.put("CCDCID", "0000000000002052786");
        dataMap.put("CCHGTP", "012"); //mandatory for more search
        arlist.add(dataMap);

        object = syncProxy.submitTask("702", arlist.toArray());
        resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //Facility's Collateral Charge Inquiry - 96702
    public void testFacColChargeInquiry() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("CCAPNO", "0000000000200000001");
        dataMap.put("CCFCDE", "423");
        dataMap.put("ACTSEQ", "0000000000000000001");
        dataMap.put("CCDCID", "0000000000002052785");
        dataMap.put("CCHGTP", "012");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("712", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //LS Fac Rel. Subfile Inquiry Program - 95312
    public void testFacRelSubfileInquiry() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("ACAPNO", "0000000000200000001");
        dataMap.put("ACFCOD", "423");
        dataMap.put("ACFSEQ", "0000000000000000018");
        dataMap.put("ACCIFN", "");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("302", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }

        //test get more record
        arlist = new ArrayList();
        arlist.add(getUserName("SI1OFF01"));
        headerMap.put("I13MORE", "1");
        headerMap.put("HDNREC", "2");
        headerMap.put("HDMREC" , "Y");
        arlist.add(headerMap);
        dataMap.put("ACAPNO", "0000000000200000001");
        dataMap.put("ACFCOD", "423");
        dataMap.put("ACFSEQ", "0000000000000000018");
        dataMap.put("ACCIFN", "0000000000190075491");
        arlist.add(dataMap);

        object = syncProxy.submitTask("302", arlist.toArray());
        resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //LS Fac Rel. Detail Inquiry Program - 96312
    public void testFacRelDetailInquiry() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("ACAPNO", "0000000000200000001");
        dataMap.put("ACFCOD", "423");
        dataMap.put("ACFSEQ", "0000000000000000010");
        dataMap.put("ACCIFN", "0000000000190075491");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("312", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //LS Fac BNM. Detail Inquiry Program - 96317
    public void testFacBnmDetailInquiry() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("BNAPNO", "0000000000200000001");
        dataMap.put("BNFCDE", "423");
        dataMap.put("BNFSEQ", "0000000000000000010");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("317", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //LS Fac Official Subfile Inquiry Program - 95318
    public void testFacOfiicialSubfileInquiry() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("LOAPNO", "0000000000200000001");
        dataMap.put("LOFCDE", "423");
        dataMap.put("LOSEQ", "0000000000000000010");
        dataMap.put("LOOSEQ", "");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("308", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }

        //test get more record
        arlist = new ArrayList();
        arlist.add(getUserName("SI1OFF01"));
        headerMap.put("I13MORE", "1");
        headerMap.put("HDNREC", noOfRecord);
        headerMap.put("HDMREC" , "Y");
        arlist.add(headerMap);
        dataMap.put("LOAPNO", "0000000000200000001");
        dataMap.put("LOFCDE", "423");
        dataMap.put("LOSEQ", "0000000000000000010");
        dataMap.put("LOOSEQ", "0000000000000000001");
        arlist.add(dataMap);

        object = syncProxy.submitTask("308", arlist.toArray());
        resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //LS Fac Ins. Detail Inquiry Program - 96319
    public void testFacInsuranceDetailInquiry() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("AAAPNOW", "0000000000200000001");
        dataMap.put("AFFCDEW", "423");
        dataMap.put("AFSEQW", "0000000000000000010");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("319", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //LS Fac Subfile Inquiry - 95310
    public void testFacMasterSubfileInquiry() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("AFAPNO", "0000000000200000001");
        dataMap.put("AFFCDE", "423");
        dataMap.put("AFSEQ", "0000000000000000019");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("301", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }

        //test get more record
        arlist = new ArrayList();
        arlist.add(getUserName("SI1OFF01"));
        headerMap.put("I13MORE", "1");
        headerMap.put("HDNREC", noOfRecord);
        headerMap.put("HDMREC" , "Y");
        arlist.add(headerMap);
        dataMap.put("AFAPNO", "0000000000200000001");
        dataMap.put("AFFCDE", "423");
        dataMap.put("AFSEQ", "0000000000000000020");
        arlist.add(dataMap);

        object = syncProxy.submitTask("301", arlist.toArray());
        resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //LS Fac Detail Inquiry - 96310
    public void testFacMasterDetailInquiry() throws Exception {
        final String noOfRecord = "1";

        ArrayList arlist = new ArrayList();
        Map headerMap = new HashMap();
        headerMap.put("HDNREC", noOfRecord);
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(headerMap);
        Map dataMap = new HashMap();
        dataMap.put("AFAPNO", "0000000000200000001");
        dataMap.put("AFFCDE", "423");
        dataMap.put("AFSEQ", "0000000000000000010");
        arlist.add(dataMap);

        Object object = syncProxy.submitTask("311", arlist.toArray());
        List resultList = (ArrayList) object;

        if (resultList != null) {
            for (int i=0; i<resultList.size(); i++) {
                if (StringUtils.equals(((OBStpField) resultList.get(i)).getFieldID(), "HDRIND"))
                    assertEquals("AA", ((OBStpField) resultList.get(i)).getValue());
            }
        }
    }

    //Test communication with server - 366 - Facility Islamic Master Inquiry
    public void testFacIslamicMasterInq() throws Exception {
        ArrayList arlist = new ArrayList();
        Map map = new HashMap();
        map.put("HDNREC", "1");
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(map);

        Map dataMap = new HashMap();
        dataMap.put("AIAPNO", "200000003");
        dataMap.put("AIFCDE", "410");
        dataMap.put("AISEQ", "2");

//        dataMap.put("AIAPNO", "201000001");
//        dataMap.put("AIFCDE", "410");
//        dataMap.put("AISEQ", "3");
//
//        dataMap.put("AIAPNO", "201000007");
//        dataMap.put("AIFCDE", "410");
//        dataMap.put("AISEQ", "3");

        arlist.add(dataMap);

        Object object = syncProxy.submitTask(IStpTransType.TRX_TYPE_FAC_ISLAMIC_MASTER_INQUIRY, arlist.toArray());
    }

    //Test communication with server - 364 - Facility Islamic Security Deposit
    public void testFacIslamicSecDepositInq() throws Exception {
        ArrayList arlist = new ArrayList();
        Map map = new HashMap();
        map.put("HDNREC", "1");
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(map);

        Map dataMap = new HashMap();
//        dataMap.put("AIAPNO", "200000003");
//        dataMap.put("AIFCDE", "410");
//        dataMap.put("AISEQ", "2");

        arlist.add(dataMap);
        Object object = syncProxy.submitTask(IStpTransType.TRX_TYPE_FAC_ISLAMIC_SEC_DEPOSIT_INQUIRY, arlist.toArray());
    }

    //Test communication with server - 363 - Facility Islamic Rental Renew
    public void testFacIslamicRentalRenewInq() throws Exception {
        ArrayList arlist = new ArrayList();
        Map map = new HashMap();
        map.put("HDNREC", "1");
        arlist.add(getUserName("SI1OFF01"));
        arlist.add(map);

        Map dataMap = new HashMap();
//        dataMap.put("AIAPNO", "200000003");
//        dataMap.put("AIFCDE", "410");
//        dataMap.put("AISEQ", "2");

        arlist.add(dataMap);
        Object object = syncProxy.submitTask(IStpTransType.TRX_TYPE_FAC_ISLAMIC_RENTAL_RENEWAL_INQUIRY, arlist.toArray());
    }
    
}

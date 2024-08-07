package com.integrosys.cms.host.stp.chain.facility;

import com.integrosys.cms.host.stp.bus.OBStpField;
import com.integrosys.cms.host.stp.bus.OBStpMasterTrans;
import com.integrosys.cms.host.stp.bus.OBStpTrans;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.test.AbstractSingleSpringContextTests;

import java.sql.Timestamp;
import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Andy Wong
 * Date: Sep 20, 2008
 * Time: 2:55:39 PM
 * To change this template use File | Settings | File Templates.
 */
public class StpFacRelDeletionCmdIntegrateTest extends AbstractSingleSpringContextTests {

    ApplicationContext context = getApplicationContext();

    protected String[] getConfigLocations() {
        return new String[]{
                "/AppContext_TrxDataSource_Test.xml",
                "/AppContext_TrxPlugin.xml",
                "/AppContext_Workflow.xml",
                "/facility/AppContext_Master.xml",
                "/collateral/AppContext_Master.xml",
                "/facility/AppContext_Master.xml",
                "/checklist/AppContext_Master.xml",
                "/custodian/AppContext_Master.xml",
                "/stp/AppContext_DaoJdbc.xml",
                "/stp/AppContext_Services.xml"};
    }

    public void testSpringInjection() throws Exception {
//        BeanDefinitionBuilder builder = BeanDefinitionBuilder.rootBeanDefinition("com.integrosys.cms.host.stp.bus.StpTransBusManagerImpl");
//        context.registerBeanDefinition("stpTransBusManager", builder.getBeanDefinition());
//        BeanHouse.setOwnApplicationContext(context);
//        StpTransBusManagerImpl manager = (StpTransBusManagerImpl) BeanHouse.get("stpTransBusManager");

//        BeanFactory factory = (BeanFactory) context;
//        StpFacRelDeletionCmd facRelDeletionCmd = (StpFacRelDeletionCmd) factory.getBean("stpFacRelDeletionCmd");
//        assertNotNull(facRelDeletionCmd);
//
//        List tmpL = new ArrayList();
//        OBStpField obStpField = new OBStpField();
//        obStpField.setLength("5");
//        obStpField.setFormat("A");
//        obStpField.setValue("9999999");
//        obStpField.setFieldID("ABC123");
//        tmpL.add(obStpField);
//
//        obStpField = new OBStpField();
//        obStpField.setLength("8");
//        obStpField.setFormat("A");
//        obStpField.setValue("88888888");
//        obStpField.setFieldID("ABC124");
//        tmpL.add(obStpField);
//
//        String out = facRelDeletionCmd.getStpMsgAdapter().constructMessageToString(tmpL);
//        assertEquals("999999988888888", out);
//
//        String chainConfig = facRelDeletionCmd.getPropertyUtil().get("stp.catalogLoader.chainConfig", null);
//        assertEquals(chainConfig, "/chain-config.xml");

    }

    public void testCollection() throws Exception {
        HashSet hashSet = new HashSet();
        OBStpMasterTrans masterTrans = new OBStpMasterTrans();
        masterTrans.setReferenceId(new Long(23123131));
        masterTrans.setStatus("active");
        masterTrans.setTransactionId("123123123123");
        masterTrans.setTransactionType("COL");

        OBStpTrans stpTrans = new OBStpTrans();
        stpTrans.setCreationDate(new Timestamp(new Date().getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(new Date().getTime()));
        stpTrans.setStatus("OBSOLETE");
        stpTrans.setUserId(new Long(123));
        stpTrans.setTrxHistoryId(new Long(127537213));
        stpTrans.setTrxType("999");
        stpTrans.setCurTrxHistoryId("BA");
        byte[] output = {Byte.decode("12").byteValue()};
        stpTrans.setRequestMsgStream(output);
        hashSet.add(stpTrans);

        stpTrans = new OBStpTrans();
        stpTrans.setCreationDate(new Timestamp(new Date().getTime()));
        stpTrans.setLastUpdateDate(new Timestamp(new Date().getTime()));
        stpTrans.setStatus("ACTIVE");
        stpTrans.setTrxType("342");
        stpTrans.setUserId(new Long(17631));
        stpTrans.setTrxHistoryId(new Long(981263123));
        stpTrans.setCurTrxHistoryId("12351723123123");
        hashSet.add(stpTrans);

        masterTrans.setTrxEntriesSet(hashSet);
        OBStpTrans existObStpTrans = null;

        for (Iterator iterator = masterTrans.getTrxEntriesSet().iterator(); iterator.hasNext();) {
            OBStpTrans obStpTrans = (OBStpTrans) iterator.next();

            if (StringUtils.equals(obStpTrans.getTrxType(), "342")) {
                existObStpTrans = obStpTrans;
                break;
            }
        }

        existObStpTrans.setStatus("DELETED");

        for (Iterator iterator = masterTrans.getTrxEntriesSet().iterator(); iterator.hasNext();) {
            OBStpTrans obStpTrans = (OBStpTrans) iterator.next();

            if (StringUtils.equals(obStpTrans.getTrxType(), "342")) {
                assertEquals("DELETED", obStpTrans.getStatus());
                break;
            }
        }
    }
}



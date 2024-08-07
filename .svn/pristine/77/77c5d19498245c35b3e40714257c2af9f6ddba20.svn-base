package com.integrosys.cms.host.stp.proxy;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.host.stp.bus.IStpTransBusManager;
import com.integrosys.cms.host.stp.bus.OBStpMasterTrans;
import com.integrosys.cms.host.stp.chain.IStpCatalogLoader;
import com.integrosys.cms.host.stp.common.IStpConstants;
import junit.framework.TestCase;
import org.easymock.MockControl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Andy Wong
 * Date: Aug 31, 2008
 * Time: 12:43:46 AM
 * To change this template use File | Settings | File Templates.
 */
public class StpAsyncProxyImplTest extends TestCase {
    private final Logger logger = LoggerFactory.getLogger(getClass());
    MockControl busMgrControl, catalogControl;
    IStpTransBusManager bus;
    IStpCatalogLoader loader;

    protected void setUp() throws Exception {
        Log4jConfigTestPlugin.configure();
        busMgrControl = MockControl.createControl(IStpTransBusManager.class);
        catalogControl = MockControl.createControl(IStpCatalogLoader.class);

        bus = (IStpTransBusManager) busMgrControl.getMock();
        bus.createMasterTrans(new OBStpMasterTrans());
        busMgrControl.setDefaultReturnValue(new OBStpMasterTrans());
        bus.getMasterTransByTransactionId("1");
        busMgrControl.setDefaultReturnValue(new OBStpMasterTrans());
        bus.updateMasterTrans(new OBStpMasterTrans());
        busMgrControl.setDefaultReturnValue(new OBStpMasterTrans());
        ArrayList statusList = new ArrayList();
        statusList.add(IStpConstants.MASTER_TRX_LOADING);
        statusList.add(IStpConstants.MASTER_TRX_QUEUE);
        bus.getMasterTransByStatus(statusList);
        busMgrControl.setDefaultReturnValue(new ArrayList());
        busMgrControl.replay();

        loader = (IStpCatalogLoader) catalogControl.getMock();
        loader.executeCommand(new OBStpMasterTrans());
        catalogControl.setDefaultReturnValue(true);
        catalogControl.replay();
    }

    public void testStpSubmitTaskUsingMock() throws Exception {
        final StpAsyncProxyImpl asyncProxy = new StpAsyncProxyImpl();
        asyncProxy.setStpTransBusManager(bus);
        asyncProxy.setStpCatalogLoader(loader);
//        asyncProxy.invalidatePendingTask();

        for (int i = 0; i < 50; i++) {
            final String transType = (i % 2 == 0) ? "COL" : "FACILITY";
            final String status = (i % 2 == 0) ? "LOADING" : "RETRY";
            final int count = i;

            Thread submitThread = new Thread() {
                public void run() {
                    String trxId = Long.toString(Long.parseLong("20080902000001") + count);
                    long refId = Long.parseLong("20099902000001") + count;

                    try {
                        sleep(100 * count);
                    } catch (InterruptedException e) {
                        e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                    }
                    logger.debug("----------Submit task" + count);
                    asyncProxy.submitTask(trxId, refId, transType);
                }
            };
            submitThread.start();
        }

        busMgrControl.verify();
        catalogControl.verify();
        Thread.sleep(20000);
    }
}

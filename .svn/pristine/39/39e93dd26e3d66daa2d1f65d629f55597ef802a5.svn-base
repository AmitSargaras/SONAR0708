package com.integrosys.cms.batch.sibs;

import com.integrosys.base.techinfra.context.BeanHouse;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.cms.batch.factory.BatchJobDao;
import com.integrosys.cms.batch.factory.BatchJobLauncherImpl;
import com.integrosys.cms.batch.factory.OBBatchJobStatus;
import org.apache.commons.lang.math.RandomUtils;
import org.easymock.MockControl;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.AbstractSingleSpringContextTests;

import javax.sql.DataSource;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Andy Wong
 * Date: Oct 7, 2008
 * Time: 3:33:09 PM
 * To change this template use File | Settings | File Templates.
 */
public class StpReconcileCMSBatchJobLauncherTest extends AbstractSingleSpringContextTests {

    ApplicationContext context = getApplicationContext();
    MockControl batchJodDaoControl;
    BatchJobDao mockBatchJobDao;
    JdbcTemplate jdbc;

    protected String[] getConfigLocations() {
        return new String[]{
                "/stp/AppContext_Batch.xml",
                "/batch/AppContext_Master.xml",
                "/AppContext_Services.xml",
                "/AppContext_TrxDataSource_Test.xml"};
    }

    protected void onSetUp() throws Exception {
        batchJodDaoControl = MockControl.createControl(BatchJobDao.class);
        mockBatchJobDao = (BatchJobDao) batchJodDaoControl.getMock();
        mockBatchJobDao.createBatchJobStatus(new OBBatchJobStatus());
        batchJodDaoControl.setDefaultReturnValue(new OBBatchJobStatus());
        mockBatchJobDao.updateBatchJobStatus(new OBBatchJobStatus());
        batchJodDaoControl.setDefaultReturnValue(new OBBatchJobStatus());

        Log4jConfigTestPlugin.configure();
        jdbc = new JdbcTemplate((DataSource) getApplicationContext().getBean("ofaPool"));

    }

    public void testBatchJob() {
        batchJodDaoControl.replay();
        BeanHouse.setOwnApplicationContext(context);

        BatchJobLauncherImpl impl = new BatchJobLauncherImpl();
        impl.setApplicationContext(getApplicationContext());
        impl.setBatchJobDao(mockBatchJobDao);
        impl.launch("stockPriceFileLoaderBatchJob", new String[0]);
        batchJodDaoControl.verify();
    }
}

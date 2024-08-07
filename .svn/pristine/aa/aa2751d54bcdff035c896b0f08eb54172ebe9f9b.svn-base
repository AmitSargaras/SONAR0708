package com.integrosys.cms.host.stp.bus;

import org.springframework.test.AbstractTransactionalSpringContextTests;
import com.integrosys.cms.app.checklist.bus.CheckListDAO;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.dbsupport.DataSourceProxy;
import com.integrosys.base.techinfra.dbsupport.DateSequencerFormatter;
import com.integrosys.base.techinfra.test.MockContextTestPlugin;

import javax.sql.DataSource;
import java.util.HashMap;

/**
 * Created by IntelliJ IDEA.
 * User: Andy Wong
 * Date: Sep 26, 2008
 * Time: 3:01:59 PM
 * To change this template use File | Settings | File Templates.
 */
public class StpTransJdbcIntegrateTest extends AbstractTransactionalSpringContextTests {
    StpTransJdbcImpl jdbc;

	protected String[] getConfigLocations() {
		return new String[] { "classpath:AppContext_TrxDataSource_Test.xml" };
	}

	public void onSetUp() throws Exception {
		Log4jConfigTestPlugin.configure();

		super.onSetUp();
	}

	public void testGetCollateralCheckListStatus() {
		jdbc = new StpTransJdbcImpl();
        DataSource targeDataSource = (DataSource) getApplicationContext().getBean("ofaPool");
        jdbc.setDataSource(targeDataSource);
        jdbc.setSequenceFormatter(new DateSequencerFormatter());

        String seqNum = jdbc.getSeqNum();
		assertNotNull(seqNum);
	}
}

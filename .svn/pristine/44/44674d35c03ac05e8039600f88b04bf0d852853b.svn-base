package com.integrosys.cms.batch.valuation;

import org.springframework.test.AbstractTransactionalSpringContextTests;
import org.springframework.context.ApplicationContext;
import org.hibernate.SessionFactory;
import com.integrosys.cms.app.commoncode.bus.CommonCodeDaoImpl;
import com.integrosys.cms.app.collateral.bus.valuation.model.GenericValuationModel;
import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.logger.DefaultLogger;

import javax.sql.DataSource;
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.Iterator;

/**
 * Created by IntelliJ IDEA.
 * User: Cynthia
 * Date: Nov 4, 2008
 * Time: 6:43:50 PM
 * To change this template use File | Settings | File Templates.
 */
public class ValuationMainDaoQueryTest extends AbstractTransactionalSpringContextTests {

    ApplicationContext context = getApplicationContext();

    protected String[] getConfigLocations() {
        return new String[] {"/AppContext_TrxDataSource_Test.xml"};
    }


    protected void onSetUp() throws Exception {
        Log4jConfigTestPlugin.configure();
        super.onSetUp();
    }



    public void testQuery() {

        DataSource dataSource = (DataSource) context.getBean("ofaPool");

        Map paramMap = new HashMap();
        paramMap.put("country", "MY");
        paramMap.put("sectype", "PT");

        ValuationMainDAO dao = new ValuationMainDAO();
        dao.setDataSource(dataSource);
        List resultList = dao.getNextBatchSecurities(paramMap, 0, 3000);
        long noOfSec = dao.getNoOfSecurities(paramMap);

        DefaultLogger.debug(this, "Executed Test Case");
        System.out.println("Executed Test Case \n" + resultList);
        System.out.println("Number of Securities \n" + noOfSec);

        for(Iterator it=resultList.iterator(); it.hasNext(); ) {
            GenericValuationModel model = (GenericValuationModel)it.next();
            System.out.println(model.getCollateralId());
            System.out.println(model.getSecType());
            System.out.println(model.getSecSubtype());
            System.out.println(model.getSecCurrency());
            System.out.println(model.getPrevValuationDate());
            System.out.println(model.getValuationDate());
        }

        assertNotNull(resultList);

    }

}

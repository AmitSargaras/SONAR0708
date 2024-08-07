package com.integrosys.cms.batch.sibs.parameter;

import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.commoncode.bus.CommonCodeDaoImpl;
import com.integrosys.cms.app.commoncode.bus.ICommonCodeDao;
import com.integrosys.cms.app.commoncodeentry.bus.ICommonCodeEntry;
import com.integrosys.cms.app.commoncodeentry.bus.OBCommonCodeEntry;
import com.integrosys.cms.batch.sibs.parameter.obj.OBCommonCodeEntryWrapper;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.test.AbstractTransactionalSpringContextTests;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

/**
 * Created by IntelliJ IDEA.
 * User: Cynthia
 * Date: Nov 3, 2008
 * Time: 3:59:25 PM
 * To change this template use File | Settings | File Templates.
 */
public class ParameterSavingStagingTest extends AbstractTransactionalSpringContextTests {

    ApplicationContext context = getApplicationContext();

    protected String[] getConfigLocations() {
        return new String[] {"/AppContext_TrxDataSource_Test.xml"};
    }

    /*
    protected void onSetUp() throws Exception {
        super.onSetUp();
    }*/


    public void testSaveStaging() {

        SessionFactory ofaSessionFactory = (SessionFactory) context.getBean("ofaSessionFactory");

        CommonCodeDaoImpl commonCodeDao = new CommonCodeDaoImpl();
        commonCodeDao.setSessionFactory(ofaSessionFactory);

        OBCommonCodeEntryWrapper entryCode1 = new OBCommonCodeEntryWrapper();
        entryCode1.setEntryCode("PP");
        entryCode1.setEntryName("Passport");
        entryCode1.setActiveStatus(true);
        entryCode1.setEntrySource(ICommonCodeDao.ENTRY_SOURCE_SIBS);
        entryCode1.setCountry("MY");
        entryCode1.setCategoryCode("ID_TYPE");
        entryCode1.setCategoryCodeId(9);

        ArrayList list = new ArrayList();
        list.add(entryCode1);

        //=========== Test Save ============
        Collection updatedList = commonCodeDao.update("actualEntryCodeWrapper", list);
        for(Iterator it=updatedList.iterator(); it.hasNext(); ) {
            ICommonCodeEntry updatedCCE = (ICommonCodeEntry)it.next();
            System.out.println("UpdatedItem: \n============= ");
            System.out.println("getEntryId:  " + updatedCCE.getEntryId());
            System.out.println("getEntryName:  " + updatedCCE.getEntryName());
            System.out.println("getActiveStatus:  " + updatedCCE.getActiveStatus());
            System.out.println("getEntrySource:  " + updatedCCE.getEntrySource());
            System.out.println("getCountry:  " + updatedCCE.getCountry());
            System.out.println("getCategoryCode:  " + updatedCCE.getCategoryCode());
            System.out.println("getCategoryCodeId:  " + updatedCCE.getCategoryCodeId());
            System.out.println("========== \n\n");
            assertTrue("should contain entry id", updatedCCE.getEntryId() != ICMSConstant.LONG_INVALID_VALUE);

            //============ Change this to test for update =====================
            updatedCCE.setEntryName(updatedCCE.getEntryName() + " - New");
        }

        //=========== Test Existing Updated, Non-Existing Save ============

        OBCommonCodeEntryWrapper entryCode2 = new OBCommonCodeEntryWrapper();
        entryCode2.setEntryCode("OT");
        entryCode2.setEntryName("Others");
        entryCode2.setActiveStatus(true);
        entryCode2.setEntrySource(ICommonCodeDao.ENTRY_SOURCE_SIBS);
        entryCode2.setCountry("MY");
        entryCode2.setCategoryCode("ID_TYPE");
        entryCode2.setCategoryCodeId(9);

        updatedList.add(entryCode2);
        updatedList = commonCodeDao.update("actualEntryCodeWrapper", updatedList);

        for(Iterator it=updatedList.iterator(); it.hasNext(); ) {
            ICommonCodeEntry updatedCCE = (ICommonCodeEntry)it.next();
            System.out.println("UpdatedItem: \n============= ");
            System.out.println("getEntryId:  " + updatedCCE.getEntryId());
            System.out.println("getEntryName:  " + updatedCCE.getEntryName());
            System.out.println("getActiveStatus:  " + updatedCCE.getActiveStatus());
            System.out.println("getEntrySource:  " + updatedCCE.getEntrySource());
            System.out.println("getCountry:  " + updatedCCE.getCountry());
            System.out.println("getCategoryCode:  " + updatedCCE.getCategoryCode());
            System.out.println("getCategoryCodeId:  " + updatedCCE.getCategoryCodeId());
            System.out.println("========== \n\n");
            assertTrue("should contain entry id", updatedCCE.getEntryId() != ICMSConstant.LONG_INVALID_VALUE);
        }

        
        //=========== Test Existing Updated, Non-Existing Save ============
        updatedList = commonCodeDao.updateStaging("stageEntryCodeWrapper", updatedList);
        for(Iterator it=updatedList.iterator(); it.hasNext(); ) {
            OBCommonCodeEntry updatedCCE = (OBCommonCodeEntry)it.next();
            System.out.println("UpdatedItem: \n============= ");
            System.out.println("getStageId:  " + updatedCCE.getStageId().longValue());
            System.out.println("getEntryId:  " + updatedCCE.getEntryId());
            System.out.println("getEntryName:  " + updatedCCE.getEntryName());
            System.out.println("getActiveStatus:  " + updatedCCE.getActiveStatus());
            System.out.println("getEntrySource:  " + updatedCCE.getEntrySource());
            System.out.println("getCountry:  " + updatedCCE.getCountry());
            System.out.println("getCategoryCode:  " + updatedCCE.getCategoryCode());
            System.out.println("getCategoryCodeId:  " + updatedCCE.getCategoryCodeId());
            System.out.println("========== \n\n");
            assertTrue("should contain stage id", updatedCCE.getStageId() != null);
        }

    }



}

package com.integrosys.cms.host.stp.chain;

import junit.framework.TestCase;
import com.integrosys.cms.host.stp.bus.OBStpMasterTrans;
import com.integrosys.cms.app.common.constant.ICMSConstant;

/**
 * Created by IntelliJ IDEA.
 * User: Jerlin Ong
 * Date: Sep 4, 2008
 * Time: 11:15:07 AM
 * To change this template use File | Settings | File Templates.
 */
public class StpCatalogLoaderTest extends TestCase {
    public void testCatalogLoader() throws Exception {
        OBStpMasterTrans obStpMasterTransFac = new OBStpMasterTrans();
        String trxID = "20080905000000898";
        Long refID = new Long("20070101000001");
        obStpMasterTransFac.setTransactionId(trxID);
        obStpMasterTransFac.setReferenceId(refID);
        obStpMasterTransFac.setStatus("CREATE");
        obStpMasterTransFac.setTransactionType(ICMSConstant.INSTANCE_LIMIT);
        IStpCatalogLoader stpCatalogLoaderFac = new StpCatalogLoader();
        boolean status = stpCatalogLoaderFac.executeCommand(obStpMasterTransFac);
        System.out.println("status in CatalogLoaderTest Facility Creation : " + status);

        OBStpMasterTrans obStpMasterTransFac2 = new OBStpMasterTrans();
        trxID = "20080905000000898";
        refID = new Long("20070101000001");
        obStpMasterTransFac2.setTransactionId(trxID);
        obStpMasterTransFac2.setReferenceId(refID);
        obStpMasterTransFac2.setStatus("DELETED");
        obStpMasterTransFac2.setTransactionType(ICMSConstant.INSTANCE_LIMIT);
        IStpCatalogLoader stpCatalogLoaderFac2 = new StpCatalogLoader();
        status = stpCatalogLoaderFac2.executeCommand(obStpMasterTransFac2);
        System.out.println("status in CatalogLoaderTest Facility Deletion : " + status);

        OBStpMasterTrans obStpMasterTransCol = new OBStpMasterTrans();
        trxID = "20080905000000900";
        refID = new Long("20070101000001");
        obStpMasterTransCol.setTransactionId(trxID);
        obStpMasterTransCol.setReferenceId(refID);
        obStpMasterTransCol.setStatus("CREATE");
        obStpMasterTransCol.setTransactionType(ICMSConstant.INSTANCE_COLLATERAL);
        IStpCatalogLoader stpCatalogLoaderCol = new StpCatalogLoader();
        status = stpCatalogLoaderCol.executeCommand(obStpMasterTransCol);
        System.out.println("status in CatalogLoaderTest Collateral Creation : " + status);

        OBStpMasterTrans obStpMasterTransCol2 = new OBStpMasterTrans();
        trxID = "20080905000000900";
        refID = new Long("20070101000001");
        obStpMasterTransCol2.setTransactionId(trxID);
        obStpMasterTransCol2.setReferenceId(refID);
        obStpMasterTransCol2.setStatus("DELETED");
        obStpMasterTransCol2.setTransactionType(ICMSConstant.INSTANCE_COLLATERAL);
        IStpCatalogLoader stpCatalogLoaderCol2 = new StpCatalogLoader();
        status = stpCatalogLoaderCol2.executeCommand(obStpMasterTransCol2);
        System.out.println("status in CatalogLoaderTest Collateral Deletion : " + status);

    }
}

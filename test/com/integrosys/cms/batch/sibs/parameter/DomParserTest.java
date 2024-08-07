package com.integrosys.cms.batch.sibs.parameter;

import org.springframework.test.AbstractSingleSpringContextTests;

import java.io.InputStream;
import java.util.Map;

import com.integrosys.base.techinfra.logger.Log4jConfigTestPlugin;
import com.integrosys.base.techinfra.logger.DefaultLogger;
import junit.framework.TestCase;

/**
 * Created by IntelliJ IDEA.
 * User: Cynthia
 * Date: Oct 8, 2008
 * Time: 2:44:30 PM
 * To change this template use File | Settings | File Templates.
 */
public class DomParserTest extends TestCase {

    public void testDomParser() {
        InputStream inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(IParameterBusManager.PROPERTY_FILE_NAME);
        Map paramPropertyMap = DomParser.parseParameterPropertyFile(inputStream);

        OBParameterProperty commonCodeParamProp = new OBParameterProperty();
        commonCodeParamProp.setType("commoncode");
        commonCodeParamProp.setRemoteEntityName("paramAddressType");
        commonCodeParamProp.setLocalName("4");
        commonCodeParamProp.setIsDependencyUpdate(false);

        OBParameterProperty tableParamProp = new OBParameterProperty();
        tableParamProp.setType("table");
        tableParamProp.setRemoteEntityName("paramHostFacilityType");
        tableParamProp.setLocalName("paramLocalHostFacilityType");
        tableParamProp.setIsDependencyUpdate(false);

        OBParameterProperty dependencyParamProp = new OBParameterProperty();
        dependencyParamProp.setType("table");
        dependencyParamProp.setRemoteEntityName("paramHostBranchCACDependency");
        dependencyParamProp.setLocalName("paramLocalHostBranchCACDependency");
        dependencyParamProp.setIsDependencyUpdate(true);

        OBParameterProperty addressTypeParamProp = (OBParameterProperty)paramPropertyMap.get("paramAddressType");
        OBParameterProperty facTypeParamProp = (OBParameterProperty)paramPropertyMap.get("paramHostFacilityType");
        OBParameterProperty branchDepParamProp = (OBParameterProperty)paramPropertyMap.get("paramHostBranchCACDependency");

        DefaultLogger.debug(this, "Constructed Common Code Object: " + commonCodeParamProp);
        DefaultLogger.debug(this, "Retrieved Common Code Object: " + addressTypeParamProp);
        DefaultLogger.debug(this, "Constructed Table Object: " + tableParamProp);
        DefaultLogger.debug(this, "Retrieved Table Object: " + facTypeParamProp);
        DefaultLogger.debug(this, "Constructed Dependency Object: " + dependencyParamProp);
        DefaultLogger.debug(this, "Retrieved Dependency Object: " + branchDepParamProp);

        assertTrue("should contain an entry from common-code", paramPropertyMap.containsKey("paramAddressType"));
        assertTrue("should contain an entry from table", paramPropertyMap.containsKey("paramHostFacilityType"));
        assertTrue("should contain an entry from dependency", paramPropertyMap.containsKey("paramHostBranchCACDependency"));

        assertEquals(commonCodeParamProp, addressTypeParamProp);
        assertEquals(tableParamProp, facTypeParamProp);
        assertEquals(dependencyParamProp, branchDepParamProp);

    }
}

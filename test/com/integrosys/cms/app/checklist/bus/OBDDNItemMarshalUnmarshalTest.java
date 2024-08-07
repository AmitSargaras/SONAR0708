package com.integrosys.cms.app.checklist.bus;

import com.integrosys.base.techinfra.test.CustomCastorMarshalUnmarshalTestCase;
import com.integrosys.cms.app.ddn.bus.OBDDNItem;
import org.exolab.castor.xml.MarshalException;
import org.exolab.castor.xml.Marshaller;
import org.exolab.castor.xml.ValidationException;

import java.io.IOException;
import java.io.StringWriter;

/**
 * Created by IntelliJ IDEA.
 * User: Andy Wong
 * Date: May 24, 2010
 * Time: 4:19:59 PM
 * To change this template use File | Settings | File Templates.
 */
public class OBDDNItemMarshalUnmarshalTest extends CustomCastorMarshalUnmarshalTestCase {

    public void testMarshalDDNItemXml() {
        addMapping("compare/ddn/Id_mapping.xml");

        String xml = (String) execute(new MarshallerAction() {
            public Object doInMarshaller(Marshaller marshaller) throws MarshalException, ValidationException, IOException {
                OBDDNItem item = new OBDDNItem();
                item.setDDNItemID(617231273412L);
                item.setDDNItemRef(12323123123L);
                StringWriter sw = new StringWriter();
                marshaller.setWriter(sw);
                marshaller.marshal(item);
                return sw.toString();
            }
        });
        System.out.println(xml);
    }
}

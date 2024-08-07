package com.integrosys.cms.ui.genli;

import com.integrosys.base.businfra.customer.ILegalEntity;
import com.integrosys.base.techinfra.context.BeanHouse;
import com.integrosys.base.techinfra.propertyfile.PropertyManager;
import com.integrosys.base.techinfra.util.DateUtil;
import com.integrosys.cms.app.checklist.bus.ICheckList;
import com.integrosys.cms.app.checklist.bus.OBCheckList;
import com.integrosys.cms.app.common.constant.ICMSConstant;
import com.integrosys.cms.app.customer.bus.IContact;
import com.integrosys.cms.app.customer.bus.OBCMSCustomer;
import com.integrosys.cms.app.limit.bus.ILimitProfile;
import com.integrosys.cms.app.limit.bus.OBLimitProfile;
import com.integrosys.cms.ui.common.CommonCodeList;
import com.integrosys.cms.ui.common.constant.IGlobalConstant;
import com.integrosys.component.login.ui.GlobalSessionConstant;
import com.integrosys.component.user.app.bus.OBCommonUser;
import junit.framework.TestCase;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.MethodInvocationException;
import org.apache.velocity.exception.ParseErrorException;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader;
import org.springframework.mock.web.MockHttpServletRequest;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: Jun 1, 2010
 * Time: 5:41:44 PM
 * To change this template use File | Settings | File Templates.
 */
public class FileLoadActionTest extends TestCase {
    public void testLIGeneration() throws Exception {
        String rtfTemplate = "LI-Valuer-Conv(Comm).rtf";

        Velocity.setProperty("file.resource.loader.class", ClasspathResourceLoader.class.getName());

        Velocity.init();

        VelocityContext context = new VelocityContext();

        context.put("currentTime", DateUtil.convertToDisplayDate(new Date()));

        OBCheckList checkList = new OBCheckList();
        checkList.setInsurerFirm("INSURER FIRM");
        checkList.setInsurerFirmAddress("INSURER FIRM ADDRESS");
        checkList.setInsurerFirmContactNumber("INSURER FIRM CONTACT NUMBER");
        checkList.setValuerFirm("VALUER FIRM");
        checkList.setValuerFirmAddress("VALUER FIRM ADDRESS");
        checkList.setValuerFirmContactNumber("VALUER FIRM CONTACT NUMBER");
        checkList.setLegalFirm("LEGAL FIRM");
        checkList.setLawFirmAddress("LAW FIRM ADDRESS");
        checkList.setLawFirmContactNumber("LAW FIRM CONTACT NUMBER");
        context.put("checkList", checkList);

        OBCMSCustomer cmsUser = new OBCMSCustomer();
        cmsUser.setCustomerName("CUSTOMER NAME");
        context.put("cmsUser", cmsUser);

        context.put("colAddr", "COL ADDR");
        context.put("titleNo", "TITLE NO");
        context.put("titleType", "TITLE TYPE");
        context.put("colSubType", "COL SUB TYPE");
        context.put("colDevName", "COL DEV NAME");
        context.put("landArea", "LAND AREA");
        context.put("landAreaUOM", "LAND AREA UOM");
        context.put("idNo", "ID NO");
        context.put("contactNo", "CONTACT NO");
        context.put("addrLine1", "ADDR LINE 1");
        context.put("addrLine2", "ADDR LINE 2");

        Template template = null;
        try {
            template = Velocity.getTemplate(rtfTemplate);
        } catch (ResourceNotFoundException rnfe) {
            System.out.println("Template Not Found");
        } catch (ParseErrorException pee) {
            System.out.println("Parse Error");
        } catch (MethodInvocationException mie) {
            System.out.println("Method Invocation");
        } catch (Exception e) {
            System.out.println("Error Message : " + e);
        }

        StringWriter sw = new StringWriter();

        Velocity.mergeTemplate(rtfTemplate, Velocity.ENCODING_DEFAULT, context, sw);

        byte[] result = sw.toString().getBytes();

        FileOutputStream fos = new FileOutputStream(new File("C:\\Result.rtf"));
        fos.write(result);
        fos.close();
    }
}

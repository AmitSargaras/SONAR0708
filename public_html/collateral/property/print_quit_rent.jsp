<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext,
                 com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.base.techinfra.util.DateUtil,
                 java.io.StringWriter,
                 java.util.*"%>

<%@ include file="/collateral/locale.jsp"%>

<%
    try {

		VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
        VelocityContext ctx = new VelocityContext();

        String date = DateUtil.formatDate("dd MMM yyyy",new Date());
        ctx.put("date", date);

        
        List borrowerList = (List)(request.getAttribute("customerNameList"));
        List famCodeList = (List)(request.getAttribute("famCodeList"));
        ctx.put("borrowerList", borrowerList);
        ctx.put("famCodeList", famCodeList);
        ctx.put("registedHolder", (String)(request.getAttribute("registedHolder")));
        ctx.put("property", (String)(request.getAttribute("property")));

        StringWriter sw = new StringWriter();
        velocityEngine.mergeTemplate(fileName,ctx,sw);
        byte cont[] = sw.toString().getBytes();
        String strMime = "application/rtf";
        // Clear out response stream
        response.reset();

        // Set the browser's mime type
        response.setContentType(strMime);

        // Ensure the browser's page to expect a file
        response.setHeader("Expires", "0");
        response.addHeader("Content-disposition", "attachment; filename="+fileName);
        response.getOutputStream().write(cont);
        response.flushBuffer();        
     }
     catch(Exception ex)
     {
         ex.printStackTrace();
         out.println("An error has occurred while exporting the report.<BR>" + ex.toString());
     }  
%>  
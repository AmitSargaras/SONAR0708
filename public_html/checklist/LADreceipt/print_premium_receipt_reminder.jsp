<%@ page import="org.apache.velocity.app.VelocityEngine,
                 org.apache.velocity.VelocityContext,
                 com.integrosys.base.businfra.customer.OBCustomer,
                 java.io.StringWriter,
                 java.net.URL,
                 java.util.Properties,
                 java.io.File,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.base.techinfra.context.BeanHouse,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 java.util.StringTokenizer,
                 java.util.*"%>
<%
    ICheckListItem chkListItem = (ICheckListItem)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.checkListItem");
    

try {
    String fileName = "PremiumReceiptReminderLetter.rtf";
    String expDate =(String) request.getAttribute("expDate");
    String docRef =(String) request.getAttribute("docRef");

    VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
    VelocityContext ctx = new VelocityContext();

    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    String sysdate = DateUtil.formatDate(locale,new Date(), "dd/MM/yyyy");
	ctx.put("sysdate",sysdate);	
        
    ctx.put("docRef", docRef);
    ctx.put("expDate",expDate);
    //ctx.put("item",chkListItem.getItem());

    // customer obj
    ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ctx.put("customer",cust);
	StringWriter sw = new StringWriter();
    velocityEngine.getTemplate(fileName).merge(ctx,sw);
    byte cont[] = sw.toString().getBytes();
    String strMime = "application/rtf";
    // Clear out response stream
    response.reset();

    // Set the browser's mime type
    response.setContentType(strMime);

    // Ensure the browser's page to expect a file
    response.setHeader("Expires", "0");
    response.addHeader("Content-disposition", "attachment; filename="+"PREMIUM PAID RECEIPT REMINDER.rtf");
    response.getOutputStream().write(cont);
    response.flushBuffer();

} catch (Exception e) {
        e.printStackTrace();
        out.println("An error has occurred while exporting the report.<BR>" + e.toString());
		throw e;
    }

%>
<html>
<body>
<script>

</script>
</body>
</html>
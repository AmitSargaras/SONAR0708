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
                 java.util.Date,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.checklist.bus.ICheckListItem,
                 com.integrosys.cms.app.collateral.bus.type.property.IPropertyCollateral,
                 java.util.StringTokenizer"%>
<%    
    ICheckListItem chkListItem = (ICheckListItem)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.checkListItem");
    IPropertyCollateral col = (IPropertyCollateral)session.getAttribute("com.integrosys.cms.ui.checklist.secreceipt.SecurityReceiptAction.collateral");

try {
    String fileName = "caveat_renewal_reminder.rtf";
    System.out.println("ExpiryDate: " + chkListItem.getExpiryDate());
    String date = DateUtil.formatDate("dd MMM yyyy",chkListItem.getExpiryDate());

	VelocityEngine velocityEngine = (VelocityEngine) BeanHouse.get("velocityEngine");
    
    VelocityContext ctx = new VelocityContext();

    ctx.put("col", col);
    ctx.put("date",date);
    ctx.put("item",chkListItem.getItem());
    // customer obj
    ICMSCustomer cust = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ctx.put("cust",cust);
	if(cust!=null && cust.getOfficialAddresses()!=null)
	    ctx.put("address",cust.getOfficialAddresses()[0]);

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
    response.addHeader("Content-disposition", "attachment; filename="+"caveat_renewal_reminder.rtf");
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
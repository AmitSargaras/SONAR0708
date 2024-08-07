<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%
    String viewCustomerLink = "CustomerProcess.do?event=viewLimitProfile";
    String viewDocumentStatus = "CheckList.do?event=viewDocumentStatus";

    String transactionID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + "transactionID_backtoTask");
    ICMSCustomer customer = (ICMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitprofile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    String event = (String) request.getAttribute("event");
    if (event != null && event.equals("processcusdetails")) {
        transactionID = null;
    }
%>

<html>
<head>

<style>
	table.tblFormSection tbody tr {
		height: 16px;
	}
</style>
</head>

<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="22%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px;padding-left:6px">
    <thead>
    </thead>
    <tbody>
        <tr>
            <td colspan="2" nowrap style="padding-left:5px">&nbsp;</td>
        </tr>
        <tr>
            <td width="10" nowrap valign="top">-</td>
            <td width="164" height="18" nowrap>
                <a href=<%=viewCustomerLink%> title="View Customer Details">View Customer Details</a></td>
        </tr>

        <tr>
            <td nowrap valign="top">-</td>
             <td height="18" nowrap wrap><b>
            <% if (transactionID != null) {%>
                   <a href="ToDo.do?event=customertodo&customerID=<%=customer.getCustomerID()%>&limitProfileID=<%=limitprofile.getLimitProfileID()%>&transactionID=<%=transactionID%>"
                            title="Back To Task List">Back To Task List</a>
            <%} else {%>
                <a href="CustomerSearch.do?event=return" title="Back To Task List">Back To Task List</a>
            <%}%>
          </b></td>
        </tr>
    </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>

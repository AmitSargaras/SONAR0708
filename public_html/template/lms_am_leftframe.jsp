<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%
    /*
    String subprofileID = request.getParameter("subprofileID");
    String instrID = request.getParameter("instrID");

    System.out.println(">>>>subprofileID: " + subprofileID);
    System.out.println(">>>>instrID: " + instrID);
    */

    String subProfileId = request.getParameter("sub_profile_id");
    String customerType = request.getParameter("customerType");
    //System.out.println(">>>> maker_leftframe - subprofileID: " + subProfileId);
    //System.out.println(">>>>customerType1: " + customerType);

    if (subProfileId == null)
        subProfileId = (String)session.getAttribute("sub_profile_id");   
	if (customerType == null)
        customerType = (String)session.getAttribute("customerType");   
    //System.out.println(">>>>customerType2: " + customerType);

/*
Enumeration enum = session.getAttributeNames() ;

while (enum.hasMoreElements())
{
out.print(enum.nextElement());
out.print("<BR>");
}
*/


    
    if (subProfileId == null)
        subProfileId = (String)session.getAttribute(
		"com.integrosys.cms.ui.custrelationship.CustRelAction.sub_profile_id");   
    if (customerType == null)
        customerType = (String)session.getAttribute(
		"com.integrosys.cms.ui.custrelationship.CustRelAction.customerType");   
    	
	boolean canViewLink = (customerType!=null&&customerType.equals( ICMSConstant.CUST_TYPE_CORPORATE ))?true:false;
    String limitProfileId = request.getParameter("limitProfileID");
    //System.out.println(">>>>limitProfileID: " + limitProfileId);
    
    //String viewCustomerLink = "CustomerProcess.do?event=processcusdetails&subprofileID=" + subprofileID + "&instrID=" + instrID;

    String viewCustomerLink = "CRCustomerSearch.do?event=view_cust_details&sub_profile_id=" + subProfileId + "&customerType=" + customerType;
    String viewShareholderLink = "CRShareHolder.do?event=view&sub_profile_id=" + subProfileId + "&customerType=" + customerType;
    String viewCustomerRelationshipLink = "CustRelationship.do?event=view&sub_profile_id=" + subProfileId + "&customerType=" + customerType;

    /*
    String transactionID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + "transactionID_backtoTask");
    OBCMSCustomer customer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitprofile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    String event = (String) request.getAttribute("event");
    if (event != null && event.equals("processcusdetails")) {
        transactionID = null;
    }
    */
%>


<%@page import="java.util.Enumeration"%>
<html>
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="CssStyle" -->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <!-- InstanceEndEditable -->
    <!-- InstanceBeginEditable name="head" -->
    <style>
        table.tblFormSection tbody tr {
            height: 16px;
        }
    </style>
    <!-- InstanceEndEditable -->
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
            <td width="164" height="18" nowrap><a href=<%=viewCustomerLink%> title="View Customer Details">View Customer Details</a></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
		<% if( canViewLink ) { %>
        <tr>
            <td width="10" nowrap valign="top">-</td>
            <td width="164" height="18" nowrap><a href="<%=viewShareholderLink%>" title="Shareholder">Shareholder</a></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
        <tr>
            <td width="10" nowrap valign="top">-</td>
            <td width="164" height="18" nowrap><a href="<%=viewCustomerRelationshipLink%>" title="Customer Relationship">Customer Relationship </a></td>
        </tr>
		<% } %>
        
        <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
    </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>
<%  //System.out.println("left frame ok"); %>

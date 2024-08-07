<!--Created by Pratheepa for CR148-->
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile"%>
                 
 
 <%
     /**
      * Copyright Integro Technologies Pte Ltd
      * $Header: /home/cms2/cvsroot/cms2/public_html/template/ssc_support_leftframe.jsp,
      * @author $Author: jitendra $<br>
      * @version $Revision: 1.8 $
      * @since $Date: 2006/11/14 11:31:45 $
      * Tag: $Name: DEV_20061123_B286V1 $
      */
 %>
<%
     String viewCustomerLink = "CustomerProcess.do?event=viewLimitProfile";
        String transactionID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"transactionID_backtoTask");
    OBCMSCustomer customer = (OBCMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitprofile =(ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
     String event = (String)request.getAttribute("event");
    if(event!=null && event.equals("processcusdetails"))
    {
         transactionID=null;
    }
%>


<html>
<head>

<style>
table.tblFormSection tbody tr {
	height : 16px ;
}
</style>
</head>

<body>
<table width="22%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px;padding-left:6px">
  <thead>
  </thead>
  <tbody>
    <tr>
      <td colspan="2" nowrap style="padding-left:5px">&nbsp;</td>
    </tr>
    <tr>
      <td width="10" nowrap valign="top">-</td>
      <td width="164" height="18" nowrap><a href=<%=viewCustomerLink%> title="View Customer Details">View
        Customer Details</a></td>
    </tr>
<%
	    String isMainBorrowerOnly = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"isMainBorrowerOnly");
	if((customer.getCoBorrowerInd() || !customer.getNonBorrowerInd())&&!"Y".equals(isMainBorrowerOnly)) {
	%>
	    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
	<tr>
      <td width="10" nowrap valign="top">-</td>
	  <%String viewMainBorrowerInfo = "CustomerProcess.do?event=listMainBorrower";%>
      <td width="164" height="18"><a href=<%=viewMainBorrowerInfo%> title="Main Borrower Information">Main Borrower Information</a></td>
    </tr>
	<%}%>
    
    <%  
       if (!customer.getNonBorrowerInd())
       {
     %>
       <tr>
                 <td>&nbsp;</td>
                 <td height="18">&nbsp;</td>
       </tr>
        
          
       <tr>
       	    <td width="10" nowrap valign="top">-</td>
       	      <td width="164" height="18" nowrap><a href="Bfl.do?event=view_bfl" title="View BFL Status">View BFL Status</a></td>
       </tr>
       <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr> 
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" ><a href="RecurrentCheckList.do?event=read" title="View Maintain Recurrent Document / Covenant Checklist">View Maintain
        Recurrent Document / Covenant Checklist</a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" ><a href="RecurrentReceipt.do?event=read" title="View Update Recurrent Document / Covenant Receipt">View Update
        Recurrent Document / Covenant Receipt</a></td>
    </tr>
   <% } %>
   
   <tr>
	    <td>&nbsp;</td>
	    <td height="18">&nbsp;</td>
   </tr>
    <tr>
      <td nowrap valign="top">-</td>
     <% if(transactionID!=null){%>
    <td height="18" nowrap wrap ><b><a href="ToDo.do?event=customertodo&customerID=<%=customer.getCustomerID()%>&limitProfileID=<%=limitprofile.getLimitProfileID()%>&transactionID=<%=transactionID%>" title="Back To Task List">Back To Task List</a></b></td>
  <%} else {%>
   <td height="18" nowrap wrap ><b><a href="CustomerSearch.do?event=return" title="Back To Task List">Back To Task List</a></b></td>
     <%}%>
    </tr>
   
  </tbody>
</table>
</body>

</html>

<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile"%>
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
	<%if(customer.getCoBorrowerInd()){%>
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
<%      if (!customer.getNonBorrowerInd())
        { 
%>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18"><a href="Tat.do?event=viewTat" title="View TAT">View TAT </a></td>
    </tr>
    <tr>
    <td width="10" nowrap valign="top">-</td>
      <td width="164" height="18" nowrap><a href="Bfl.do?event=view_issue_draft_bfl" title="Issue Draft BFL">View Issue
        Draft BFL</a></td>
         </tr>
          <tr>
        <td width="10" nowrap valign="top">-</td>
      <td width="164" height="18" nowrap><a href="Bfl.do?event=view_send_draft_bfl" title="Send Draft BFL">View Send
        Draft BFL</a></td>
      </tr>
        <tr>
     <td width="10" nowrap valign="top">-</td>
      <td width="164" height="18" nowrap><a href="Bfl.do?event=view_recv_draft_bfl_ack" title="Receive Draft BFL">View Receive
        Draft BFL Ack</a></td>
         </tr>
          <tr>
        <td width="10" nowrap valign="top">-</td>
      <td width="164" height="18" nowrap><a href="Bfl.do?event=view_issue_clean_type_bfl" title="Issue Clean-Type BFL">View Issue
        Clean-Type BFL</a></td>
      </tr>
        <tr>
        <td width="10" nowrap valign="top">-</td>
        <td width="164" height="18" nowrap><a href="Bfl.do?event=view_special_issue_clean_type_bfl" title="Issue Special Clean-Type BFL">View Issue Special Clean-Type BFL</a></td>
         </tr>
       <tr>
        <td width="10" nowrap valign="top">-</td>
      <td width="164" height="18" nowrap><a href="Bfl.do?event=view_customer_accept_bfl" title="Customer Accept BFL">View Customer Accept BFL</a></td>
    </tr>
    <tr>
      <td width="10" nowrap valign="top">-</td>
      <td width="164" height="18" nowrap><a href="Bfl.do?event=view_print_bfl_reminder" title="Reminder - Clean BFL">View Print BFL Reminder</a></td>
    </tr>

    <%  }%>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="CCReceipt.do?event=list" title="View C/C Receipt">View
        C/C Receipt</a></td>
    </tr>
<%      if ((!customer.getNonBorrowerInd()) || 
            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus())))
        {
%>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="SecurityReceipt.do?event=list" title="View Security Receipt">View
        Security Receipt</a></td>
    </tr>
<%      }
%>
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
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

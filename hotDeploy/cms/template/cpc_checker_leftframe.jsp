<!--Modified by Pratheepa for CR148-->
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
<% if (!customer.getNonBorrowerInd()) {%>
        <tr>
          <td>&nbsp;</td>
          <td height="18">&nbsp;</td>
        </tr>
        <tr>
          <td nowrap valign="top">-</td>
          <td height="18"><a href="Tat.do?event=viewTat" title="View TAT">View TAT </a></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td height="18">&nbsp;</td>
        </tr>

        <tr>
        <td width="10" nowrap valign="top">-</td>
          <td width="164" height="18" nowrap><a href="Bfl.do?event=issue_draft_bfl" title="Issue Draft BFL">Issue   Draft BFL</a></td>
             </tr>
              <tr>
            <td width="10" nowrap valign="top">-</td>
          <td width="164" height="18" nowrap><a href="Bfl.do?event=send_draft_bfl" title="Send Draft BFL">Send  Draft BFL</a></td>
          </tr>
            <tr>
         <td width="10" nowrap valign="top">-</td>
          <td width="164" height="18" nowrap><a href="Bfl.do?event=recv_draft_bfl_ack" title="Receive Draft BFL">Receive  Draft BFL Ack</a></td>
             </tr>
              <tr>
            <td width="10" nowrap valign="top">-</td>
          <td width="164" height="18" nowrap><a href="Bfl.do?event=issue_clean_type_bfl" title="Issue Clean-Type BFL">Issue  Clean-Type BFL</a></td>
          </tr>
            <tr>
            <td width="10" nowrap valign="top">-</td>
            <td width="164" height="18" nowrap><a href="Bfl.do?event=special_issue_clean_type_bfl" title="Issue Special Clean-Type BFL">Issue Special Clean-Type BFL</a></td>
             </tr>
           <tr>
            <td width="10" nowrap valign="top">-</td>
          <td width="164" height="18" nowrap><a href="Bfl.do?event=customer_accept_bfl" title="Customer Accept BFL">Customer Accept BFL</a></td>
        </tr>

          <tr>
            <td width="10" nowrap valign="top">-</td>
          <td width="164" height="18" nowrap><a href="Bfl.do?event=print_bfl_reminder" title="Customer Accept BFL">Print BFL Reminder</a></td>
        </tr>
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
<%  } %>
        <tr>
          <td>&nbsp;</td>
          <td height="18">&nbsp;</td>
        </tr>
        <tr>
          <td nowrap valign="top">-</td>
          <td height="18"><a href="CCCheckList.do?event=list" title="View Maintain C/C Checklist">View Maintain C/C Checklist</a></td>
        </tr>
<%  if ((!customer.getNonBorrowerInd()) ||
            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus())))  { %>
        <tr>
          <td nowrap valign="top">-</td>
          <td height="18" nowrap><a href="SecurityCheckList.do?event=list" title="View Maintain Security Checklist">View Maintain  Security Checklist</a></td>
        </tr>
<%  } %>

    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="CCReceipt.do?event=list" title="View C/C Receipt">View C/C Receipt</a></td>
    </tr>

<%  if ((!customer.getNonBorrowerInd()) ||
            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus())))  { %>
        <tr>
          <td nowrap valign="top">-</td>
          <td height="18" nowrap><a href="SecurityReceipt.do?event=list" title="View Security Receipt">View  Security Receipt</a></td>
        </tr>

        <tr>
          <td nowrap valign="top">-</td>
          <td height="18" nowrap><a href="ReportServlet?event=gen_def_report&flag=view" title="Print Deficiency Report"> Print Deficiency Report</a>
          </td>
        </tr>
<%  } %>

        <tr>
          <td nowrap valign="top">-</td>
          <td height="18" nowrap><a href="DocumentCheckList.do?event=print_req_await_doc" title="Print All Required Awaiting Document">Print All Required Awaiting Document</a>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td height="18">&nbsp;</td>
        </tr>
        <!--
        <tr>
          <td nowrap valign="top">-</td>
          <td height="18" nowrap><a href="GenerateCCC.do?event=list_ccc" title="View Latest CCC">View Latest  CCC</a></td>
        </tr>
        -->
<% if (!customer.getNonBorrowerInd()) { %>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="GenerateSCC.do?event=view_generate_scc" title="View Latest SCC">View Latest  SCC</a> </td>
            </tr>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="GeneratePSCC.do?event=view_generate_pscc" title="View Latest Partial SCC">View Latest Partial SCC</a></td>
            </tr>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="GenerateDDN.do?event=view_generate_ddn" title="View Latest DDN">View Latest DDN</a></td>
            </tr>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="GenerateDDN.do?event=view_remarks" title="View Latest DDN Remarks">View Latest DDN Remarks</a></td>
            </tr>
<%  } %>

        <tr>
          <td>&nbsp;</td>
          <td height="18">&nbsp;</td>
        </tr>
        <tr>
          <td nowrap="nowrap" valign="top">-</td>
          <td height="18" nowrap="nowrap"><a href="DocumentLocation.do?event=list" title="View Doc Originating Location">View Doc Originating Location</a></td>
        </tr>
        <tr>
          <td nowrap="nowrap" valign="top">-</td>
          <td height="18" nowrap="nowrap"><a href="CCColTask.do?event=list" title="View C/C Collaboration Task">View C/C Collaboration Task</a></td>
        </tr>
<%  if ((!customer.getNonBorrowerInd()) ||
            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus()))) { %>
        <tr>
          <td nowrap valign="top">-</td>
          <td height="18" nowrap wrap ><a href="SecurityColTask.do?event=list" title="View Security Collaboration Task">View Security Collaboration Task</a></td>
        </tr>
<%    }  %>

    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>

<%  if (!customer.getNonBorrowerInd())  { %>
        <tr>
          <td nowrap valign="top">-</td>
          <td height="18" ><a href="RecurrentCheckList.do?event=read" title="View Maintain Recurrent Document / Covenant Checklist">View Maintain Recurrent Document / Covenant Checklist</a></td>
        </tr>
        <tr>
          <td nowrap valign="top">-</td>
          <td height="18" ><a href="RecurrentReceipt.do?event=read" title="View Update Recurrent Document / Covenant Receipt">View Update Recurrent Document / Covenant Receipt</a></td>
        </tr>
<%    }%>

    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>

    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap wrap ><a href="DocumentCheckList.do?event=list" title="List of Documents Held">List  of Documents Held</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap wrap ><a href="CheckList.do?event=view_share_doc" title="View Shared Doc">View Shared Document </a></td>
    </tr>
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

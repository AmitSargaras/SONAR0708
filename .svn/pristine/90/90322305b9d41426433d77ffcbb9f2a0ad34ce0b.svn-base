<!--Modified by Pratheepa for CR148-->
<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam,                 
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.checklist.CheckListUtil,
                 com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%
    String viewCustomerLink = "CustomerProcess.do?event=viewLimitProfile";
    String transactionID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"transactionID_backtoTask");
    System.out.println("Transaction ID: " + transactionID);
    OBCMSCustomer customer = (OBCMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    String event = (String)request.getAttribute("event");
    if(event!=null && event.equals("processcusdetails"))
    {
         transactionID=null;
         session.setAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"transactionID_backtoTask", null);
    }
    ILimitProfile limitprofile =(ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);    
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    ITeam team = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);    
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
      <td width="164" height="18"><a href=<%=viewCustomerLink%> title="View Customer Details">View
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
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
<%
        if (!customer.getNonBorrowerInd())
        {
%>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18"><a href="Tat.do?event=createTat" title="Create TAT">Create TAT </a></td>
    </tr>
    
    <!--
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
      -->
      	<tr>
	      <td>&nbsp;</td>
	      <td height="18">&nbsp;</td>
    	</tr>
            
         <tr>
                <td width="10" nowrap valign="top">-</td>
                  <td width="164" height="18" nowrap><a href="Bfl.do?event=view_bfl" title="View BFL Status">View BFL Status</a></td>
         </tr>
         
      
      
      
<%      }
%>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18"><a href="CCCheckList.do?event=list" title="Maintain C/C Checklist">Maintain
        C/C Checklist</a></td>
    </tr>
<%      if ((!customer.getNonBorrowerInd()) || 
            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus())))
        {
%>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="SecurityCheckList.do?event=list" title="Maintain Security Checklist">Maintain
        Security Checklist</a></td>
    </tr>
<%      }
%>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="CCReceipt.do?event=list" title="Update C/C Receipt">Update
        C/C Receipt</a></td>
    </tr>
<%      if ((!customer.getNonBorrowerInd()) || 
            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus())))
        {
%>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="SecurityReceipt.do?event=list" title="Update Security Receipt">Update
        Security Receipt</a></td>
    </tr>

    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="ReportServlet?event=gen_def_report&flag=view" title="Print Deficiency Report">Print Deficiency Report</a>
      </td>
    </tr>
    
<%      }
%>
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
      <td height="18" nowrap><a href="GenerateCCC.do?event=list_ccc" title="Generate CCC">Generate
        CCC</a></td>
    </tr>
    -->
<%
        if (!customer.getNonBorrowerInd())
        {
%>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="GenerateSCC.do?event=generate_scc" title="Generate SCC">Generate
        SCC</a> </td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="GeneratePSCC.do?event=generate_pscc" title="Generate Partial SCC">Generate
        Partial SCC</a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="GenerateDDN.do?event=generate_ddn" title="Generate DDN">Generate
        DDN</a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="GenerateLI.do?event=list" title="Generate Letter of Reminder / Instructions">Generate Letter of Reminder / Instructions</a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="GenerateDDN.do?event=update_remarks" title="Update DDN Remarks">Update DDN Remarks</a></td>
    </tr>
<%  }
%>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap="nowrap" valign="top">-</td>
      <td height="18" nowrap="nowrap"><a href="DocumentLocation.do?event=list" title="Update Doc Originating Location">Update Doc Originating Location</a></td>
    </tr>
    <tr>
      <td nowrap="nowrap" valign="top">-</td>
      <td height="18" nowrap="nowrap"><a href="CCColTask.do?event=list" title="Create C/C Collaboration Task">Create
        C/C Collaboration Task</a></td>
    </tr>
<%
        if ((!customer.getNonBorrowerInd()) || 
            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus())))
        {
%>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap wrap ><a href="SecurityColTask.do?event=list" title="Create Security Collaboration Task">Create
        Security Collaboration Task</a></td>
    </tr>
<%       }
%>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
<%
        if (!customer.getNonBorrowerInd()) {
			boolean isEditable = CheckListUtil.allowEditRecurrentCovenantChkList(user, team, customer, limitprofile);			
			if (isEditable) {
%>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" ><a href="RecurrentCheckList.do?event=list" title="Maintain Recurrent Document / Covenant Checklist">Maintain
        Recurrent Document / Covenant Checklist</a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" ><a href="RecurrentReceipt.do?event=list" title="Update Recurrent Document / Covenant Receipt">Update
        Recurrent Document / Covenant Receipt</a></td>
    </tr>
<% 			} else {    %>
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
<%    }  }%>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap="NOWRAP">-</td>
      <td height="18" nowrap="NOWRAP"><a href="custodian.do?event=list_lodgement" title="Print Lodgement Memo">Print
        Lodgement Memo</a></td>
    </tr>
    <tr>
      <td nowrap="NOWRAP">-</td>
      <td height="18" nowrap="NOWRAP"><a href="custodian.do?event=list_withdrawal" title="Print Withdrawal Mem">Print
        Withdrawal Memo</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap wrap ><a href="DocumentCheckList.do?event=list" title="List of Documents Held">List
        of Documents Held</a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap wrap ><a href="CheckList.do?event=view_share_doc" title="View Shared Doc">View
        Shared Document </a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <%--
    <tr>
      <td nowrap valign="top">-</td>
   <%  
   long limitProfileID = ICMSConstant.LONG_MIN_VALUE;
   if (limitprofile != null)
   {
        limitProfileID = limitprofile.getLimitProfileID();
   }
   if(transactionID!=null){%>
    <td height="18" nowrap wrap ><b><a href="ToDo.do?event=customertodo&customerID=<%=customer.getCustomerID()%>&limitProfileID=<%=limitProfileID%>&transactionID=<%=transactionID%>" title="Back To Task List">Back To Task List</a></b></td>
  <%} else {%>
   <td height="18" nowrap wrap ><b><a href="CustomerSearch.do?event=return" title="Back To Task List">Back To Task List</a></b></td>
     <%}
     %>
    </tr>
--%>
  </tbody>
</table>
</body>
</html>

<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->


<!-- InstanceEndEditable -->
</head>
<%
    String transactionID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+"transactionID_backtoTask");
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitprofile =(ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    String isViewFlag = "true";
%>
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="25%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  </thead>
  <tbody>
    <tr>
      <td colspan="3" nowrap="nowrap" style="padding-left:5px">&nbsp;</td>
    </tr>
    <tr>
      <td width="14" nowrap="NOWRAP">-</td>
      <td width="166" height="18" nowrap="NOWRAP"><a href="CustomerProcess.do?event=viewLimitProfile"  title="View Customer Details">
      <bean:message key="title.leftframe.view.customer"/>
      </a></td>
    </tr>
<%  
        if (!customer.getNonBorrowerInd())
        {
%>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <!--
    - Commented by erene @ 20100120
    - This section is not needed by Alliance
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18"><a href="Tat.do?event=viewTat" title="View TAT">View TAT </a></td>
    </tr>
    -->
<% } %>    
    <tr>
      <td colspan="3" nowrap="nowrap" style="padding-left:5px">&nbsp;</td>
    </tr>
    
    <%  
        if ((!customer.getNonBorrowerInd()) || 
            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus())))
        {
%>
    
    <tr>
      <td nowrap="NOWRAP">-</td>
      <td height="18" nowrap="NOWRAP"><a href="CCReceipt.do?event=cust_list" title="Update C/C Doc">
      <bean:message key="title.leftframe.update.ccdoc"/></a></td>
    </tr>

    <tr>
      <td nowrap="nowrap">-</td>
      <td height="18" nowrap="nowrap"><a href="SecurityReceipt.do?event=cust_list" title="Update Security Doc">
      <bean:message key="title.leftframe.update.security"/></a></td>
    </tr>

		<!-- added for security envelope maintenance by erene @ 201001226-->
    <!--[Start]-->
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18">
          <a href="MaintainSecurityEnvelope.do?event=sec_envelope_list&customerID=<%=limitprofile.getCustomerID()%>&lspLmtProfileId=<%=limitprofile.getLimitProfileID()%>">
              <bean:message key="title.security.envelope.custodian"/>
          </a>
      </td>                             
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <!--[End]-->   
   <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18"><a href="CCCheckList.do?event=list&isViewFlag=<%=isViewFlag%>" title="View Maintain C/C Checklist">
          <bean:message key="title.leftframe.view.maintain.ccdoc"/></a></td>
    </tr>
<%
        if (!customer.getNonBorrowerInd())
        {
%>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="SecurityCheckList.do?event=list&isViewFlag=<%=isViewFlag%>" title="View Maintain Security Checklist">
          <bean:message key="title.leftframe.view.maintain.security"/></a></td>
    </tr>
<%      } %>        
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="CCReceipt.do?event=list&isViewFlag=<%=isViewFlag%>" title="View C/C Receipt">
          <bean:message key="title.leftframe.view.ccdoc.rcpt"/></a></td>
    </tr>

    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="SecurityReceipt.do?event=list&isViewFlag=<%=isViewFlag%>" title="View Security Receipt">
        <bean:message key="title.leftframe.view.security.rcpt"/></a></td>
    </tr>

   <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
         <tr>
      <td nowrap="NOWRAP">-</td>
      <td height="18" nowrap="NOWRAP"><a href="custodian.do?event=list_reversal" title="Print Reversal Mem">
          <bean:message key="title.leftframe.print.reversal.memo"/></a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap wrap ><a href="DocumentCheckList.do?event=list" title="List of Documents Held">
        <bean:message key="title.leftframe.listdoc.held"/></a></td>
    </tr>
    <tr>

      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
        <%      }
%>
    
    <!--
    - Commented by erene @ 20100120
    - This section is not needed by Alliance
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap wrap ><a href="CheckList.do?event=view_share_doc" title="View Shared Doc">View Shared Document </a></td>
    </tr>
    -->
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr> 
    
     <tr>
      <td nowrap valign="top">-</td>
       <% if(transactionID!=null){%>
    <td height="18" nowrap wrap ><b><a href="ToDo.do?event=customertodo&customerID=<%=customer.getCustomerID()%>&limitProfileID=<%=limitprofile.getLimitProfileID()%>&transactionID=<%=transactionID%>" title="Back To Task List"><bean:message key="title.leftframe.backto.tasklist"/></a></b></td>
  <%} else {%>
   <td height="18" nowrap wrap ><b><a href="CustomerSearch.do?event=return" title="Back To Task List"><bean:message key="title.leftframe.backto.tasklist"/></a></b></td>
     <%}%>
    </tr>
    <tr>
      <td colspan="3" nowrap="NOWRAP">&nbsp;</td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

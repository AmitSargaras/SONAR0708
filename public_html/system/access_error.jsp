<%@ page language="java"%>
<%@ page import="com.integrosys.base.techinfra.exception.OFAException,
                 com.integrosys.cms.app.common.constant.ICMSErrorCodes,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%
    Exception e = (Exception)request.getAttribute("losException");
    OFAException oe = null;
    String errorCode = null;
    String errorMsg = "";
    if((null != e) && (e instanceof OFAException)) {
        oe = (OFAException)e;
        errorCode = oe.getErrorCode();
        errorMsg = oe.getMessage();
    }
    
    ICMSCustomer customer = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);

%>


<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable --> <!-- InstanceBeginEditable name="head" --> <!-- InstanceEndEditable --> 
</head>

<body>
<!-- InstanceBeginEditable name="Content" --> 
<table width="60%" height="240" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
  <thead>
  </thead>
  <tbody>
    <tr class="odd"> 
      <td style="text-align:center" valign="middle"><table width="90%"  height="180"  border="0" cellpadding="10" cellspacing="0" class="tblInfo" style="margin:30px">
          <thead>
          </thead>
          <tbody>
            <tr> 
              <td class="even" style="text-align:center" valign="middle"> 
                <br />
                <table width="90%"  border="0" cellpadding="10" cellspacing="0" class="tblInfo" style="margin:40px">
                  <tr class="even">
                    <td style="border:none;text-align:right;padding-right:10px"><strong><img src="img/noentry.gif" width="50" height="50" /></strong></td>
                    <td style="border:none"><strong><font size="2">
                        <%
                            if(null != errorCode && errorCode.length() != 0) {
                                if(errorCode.equals(ICMSErrorCodes.DDAP_TAT_NOT_CREATED)) { %>
                                    <font size="2">Error code is: <%=errorCode%><br>
                                    <br><font size="0">Related Turn Around Time parameter has not been created for <%=customer.getCMSLegalEntity().getLEReference()%>.<br> 
																		<br><font size="0">You would not be able to proceed with the action. Please check with your immediate supervisor. 
																		For next task, please click any of the menu mentioned above.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_SPECIAL_ISSUE_NOT_ALLOWED)) { %>
                                	Access Denied.
                                    <br>You are not allowed to Issue Special Clean-Type BFL if you have already issued Draft BFL.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_SEND_DRAFT_NOT_ALLOWED)) { %>
                                	Access Denied.
                                    <br>You are not allowed to Send Draft BFL for this Limit Profile.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_ACK_REC_DRAFT_NOT_ALLOWED)) { %>
                                	Access Denied.
                                    <br>You are not allowed to Acknowledge Receipt of DRaft BFL for this Limit Profile.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_ISSUE_CLEAN_NOT_ALLOWED)) { %>
                                	Access Denied.
                                    <br>You are not allowed to Issue Clean-Type BFL for this Limit Profile.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_ISSUE_FINAL_NOT_ALLOWED)) { %>
                                	Access Denied.
                                    <br>You are not allowed to Issue Final BFL for this Limit Profile.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_CUSTOMER_ACCEPT_NOT_ALLOWED)) { %>
                                	Access Denied.
                                    <br>You are not allowed to Perform Customer Accept BFL for this Limit Profile.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_COMPLETE_BCA_NOT_ALLOWED)) { %>    
                                	Access Denied.
                                    <br>You are not allowed to Complete the Limit Profile.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_UNKNOWN_TAT_CODE)) { %>  
                                	Access Denied.
                                    <br>Unknown TAT Code detected. Please contact your administrator for assistance. 
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_ISSUE_DRAFT_NOT_ALLOWED)) { %>  
                                	Access Denied.
                                    <br>You are not allowed to Issue Draft BFL for this Limit Profile.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_INVALID_FIRST_CODE)) { %>  
                                	Access Denied.
                                    <br>The first BFL entry must be either Issue Draft BFL, or Issue Special Clean-Type BFL.
                                <% } else if(errorCode.equals(ICMSErrorCodes.BFL_ISSUE_NOT_REQUIRED)) { %>
                                     Access Denied.
                                    <br>BFL is not required for this Limit Profile.
                                <% } else if(errorCode.equals(ICMSErrorCodes.FAP_NO_ACCESS)) { %>
                                		<font size="2">The error code is: <%=errorCode%></font><br>
                                        <br><font size="0">Your ID is not allowed to access the function (by URL).
										<br><font size="0">Please contact System Administrator to resolve this issue. For next task, please click any of the menu mentioned above.
								<% } else if(errorCode.equals(ICMSErrorCodes.DDAP_SETUP_ERROR)) { %>
                                		<font size="2">The error code is: <%=errorCode%><br>
                                        <br><font size="0">Not able to proceed with Data Access Protection Check.<br>
										<br><font size="0">Please contact System Administrator to resolve this issue. For next task, please click any of the menu mentioned above.
								<% } else if(errorCode.equals(ICMSErrorCodes.DDAP_LIMIT_NOT_FOUND)) { %>
                                		<font size="2">The error code is: <%=errorCode%><br>
                                        <br><font size="0">No Facility found for AA. Please check with your immediate supervisor.
                                        For next task, please click any of the menu mentioned above.
								<% } else if(errorCode.equals(ICMSErrorCodes.DDAP_NO_ACCESS)) {
									    if(null != customer) { %>
                                		    <font size="2">The error code is: <%=errorCode%><br>
                                            <br><font size="0">Your belonging team is not allowed to access  <%=customer.getCustomerName()%>.<br>
                                            <br><font size="0">Please contact System Administrator to resolve this issue. For next task, please click any of the menu mentioned above.
                                <%      }      %>
								<% } else if(errorCode.equals(ICMSErrorCodes.DDAP_DIFF_COUNTRY)) {
								        String splitMsg[] = errorMsg.split(ICMSErrorCodes.DDAP_DIFF_COUNTRY + "] ");
								        String errMsg = (splitMsg.length >=2) ? splitMsg[1] : errorMsg;
								%>
                                        <font size="2">The error code is: <%=errorCode%><br>
                                        <br><font size="0"><%=errMsg%><br>
                                <% } else { %>
                            		<br>The error code is: <%=errorCode%>
                            	<% } %>
                        <% } else { %>
                           Access Denied.  
                           <br>
                           <br><font size="0">Your ID is not allowed to access <%=customer.getCustomerName()%>.<br>
                           <br><font size="0">Please contact System Administrator to resolve this issue.   
                           For next task, please click any of the menu mentioned above.      
                       <% } %>
                    </font></strong></td>
                  </tr>
                </table>
                <br />
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable --> 
</body>
<!-- InstanceEnd --></html>

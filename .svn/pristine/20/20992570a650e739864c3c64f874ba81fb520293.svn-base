<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.PropertiesConstantHelper,
                 com.integrosys.cms.app.limit.bus.ILimitProfile" %>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
                 
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
    
    boolean requireDocumentation = 	limitprofile != null && 
	PropertiesConstantHelper.isValidDocumentationSystem(limitprofile.getSourceID()) &&
	PropertiesConstantHelper.isValidDocumentationApplicationType(limitprofile.getApplicationType()); 
%>


<html>
<head>

<style >
	table.tblFormSection tbody tr {
		height: 16px;
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
            <td width="164" height="18" nowrap><a href=<%=viewCustomerLink%> title="View Customer Details">View  Customer Details</a></td>
        </tr>

        <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
		<% //if (limitprofile != null) {
			if (false) {
			%>
        <tr>
            <td width="10" nowrap valign="top">-</td>
            <td width="164" height="18" nowrap><a href="<%=viewDocumentStatus%>" title="Documentation Status">Documentation Status </a></td>
        </tr>
		<%}%>
        <%--
            String isMainBorrowerOnly = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + "isMainBorrowerOnly");
            if ((customer.getCoBorrowerInd() || !customer.getNonBorrowerInd()) && !"Y".equals(isMainBorrowerOnly)) {
        %>
            <tr>
                <td>&nbsp;</td>
                <td height="18">&nbsp;</td>
            </tr>
            <tr>
                <td width="10" nowrap valign="top">-</td>
                <%String viewMainBorrowerInfo = "CustomerProcess.do?event=listMainBorrower";%>
                <td width="164" height="18"><a href=<%=viewMainBorrowerInfo%> title="Main Borrower Information">Main Borrower Information</ a></td>
            </tr>

        <%}--%>

        <% if (!customer.getNonBorrowerInd()  || 
	            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus()))) {  
	            
        	if (requireDocumentation) {
	            
	            %>

			<tr>
            	<td>&nbsp;</td><td height="18"><strong><bean:message key="label.documentary.requirement"/></strong></td>
            </tr>	
        <tr>
            <td width="10" nowrap valign="top">-</td>
            <td width="164" height="18" nowrap><a href="TatDoc.do?event=view_checker" ><bean:message key="title.view.tatdoc"/></a></td>
        </tr>
      
            
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18"><a href="CCCheckList.do?event=list" title="View Maintain C/C Checklist">View Maintain
		        C/C Checklist</a></td>
		    </tr>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="CCReceipt.do?event=list" title="View Update C/C Receipt">View Update
                C/C Receipt</a></td>
            </tr>

            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="SecurityCheckList.do?event=list" title="View Maintain Security Checklist">View Maintain
                Security Checklist</a></td>
            </tr>
            
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="SecurityReceipt.do?event=list" title="View Update Security Receipt">View Update
                Security Receipt</a></td>
            </tr>
            
            <tr>
                <td>&nbsp;</td>
                <td height="18">&nbsp;</td>
            </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="DocumentCheckList.do?event=list" title="View Complete Checklist">View Complete Checklist</a></td>
		    </tr>
		    <% if (!ICMSConstant.APPLICATION_TYPE_CO.equals(limitprofile.getApplicationType()) &&
		    		!ICMSConstant.APPLICATION_TYPE_CO_HP.equals(limitprofile.getApplicationType()))  {%>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18"><a href="DocumentCheckList.do?event=print_letter_list" title="Retrieve Letter of Instruction/ Reminder">
				<bean:message key="label.retrieve.letter.instruction.reminder"/> 
			  </a></td>
		    </tr>
		    <% } %>
            <tr>
                <td>&nbsp;</td>
                <td height="18">&nbsp;</td>
            </tr>
		<%} %>

			<% if (PropertiesConstantHelper.isSTPRequired() && 
					PropertiesConstantHelper.isValidSTPSystem(limitprofile.getSourceID())) {
			 %>
            <tr>
            	<td>&nbsp;</td><td height="18"><strong><bean:message key="label.stp.SIBS"/></strong></td>
            </tr>			

			<% if (PropertiesConstantHelper.isValidSTPFacilityLoadingApplicationType(limitprofile.getApplicationType())) { %>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18"><a href="FacilityMain.do?event=list&frameRequested=true" title="<bean:message key="title.facility"/>"><bean:message key="title.facility"/></a></td>
		    </tr>     
			<% } %>
            <tr>
                <td nowrap valign="top">-</td>
                <td height="18"><a href="CollateralLoading.do?event=list&frameRequested=true" title="<bean:message key='title.collateral.loading'/>">
                    <bean:message key="title.collateral.loading"/></a></td>
            </tr>       
            <tr>
                <td nowrap valign="top"></td>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
			<%} %>
<!--
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
-->
		<%     	
		    if (requireDocumentation) {
		%> 
            <tr>
                <td nowrap valign="top">-</td>
                <td height="18"><a href="RecurrentCheckList.do?event=read" title="View Maintain Recurrent Document / Covenant Checklist">View Maintain
                    Recurrent Document / Covenant Checklist</a></td>
            </tr>
            <tr>
                <td nowrap valign="top">-</td>
                <td height="18"><a href="RecurrentReceipt.do?event=read" title="View Update Recurrent Document / Covenant Receipt">View Update
                    Recurrent Document / Covenant Receipt</a></td>
            </tr>

        <%} }%>

        <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
        <%--
        <tr>
            <td nowrap valign="top">-</td>
            <td height="18" nowrap wrap>
            <b>
            <% if (transactionID != null) {%>
                    <a href="ToDo.do?event=customertodo&customerID=<%=customer.getCustomerID()%>&limitProfileID=<%=limitprofile.getLimitProfileID()%>&transactionID=<%=transactionID%>"  title="Back To Task List">Back To Task List</a>
             <%} else {%>
                    <a href="CustomerSearch.do?event=return" title="Back To Task List">Back To Task List</a>
            <%}%>
           </b></td>
        </tr>
        --%>
    </tbody>
</table>
</body>
</html>

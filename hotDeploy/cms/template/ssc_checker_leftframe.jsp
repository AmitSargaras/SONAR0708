<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.constant.PropertiesConstantHelper,
                 com.integrosys.cms.app.limit.bus.ILimitProfile" %>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
    /*
    String subprofileID = request.getParameter("subprofileID");
    String instrID = request.getParameter("instrID");

    System.out.println(">>>>subprofileID: " + subprofileID);
    System.out.println(">>>>instrID: " + instrID);
    */

    //String viewCustomerLink = "CustomerProcess.do?event=processcusdetails&subprofileID=" + subprofileID + "&instrID=" + instrID;
	String id = (String)request.getAttribute("legalCustomerId");
    String viewCustomerLink = "CustomerProcess.do?event=viewLimitProfile";
    String viewDocumentStatus = "CheckList.do?event=viewDocumentStatus";
    boolean isBranchUser=false;
    boolean isBranchUserView=false;
    boolean isCputUser=false;
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER 
    		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH){
    	System.out.println("membership type id :"+user.getTeamTypeMembership().getMembershipType().getMembershipTypeID());
    	if(user.getTeamTypeMembership().getMembershipType().getMembershipTypeID()==1){
    	isBranchUser=true;
    	}
    }
    
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_CHECKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_CHECKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_VIEW
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_VIEW_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.ALL_VIEW_REPORT
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.ALL_VIEW_REPORT_WFH){
    	System.out.println("membership type id :"+user.getTeamTypeMembership().getMembershipType().getMembershipTypeID());
    	isBranchUserView=true;
    }
    
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_CHECKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER_CHECKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER_CHECKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_CHECKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
    ){
    	isCputUser=true;
    }

    String transactionID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + "transactionID_backtoTask");
    OBCMSCustomer customer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitprofile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    boolean isLADCycle=false;
    if(customer.getCycle()!=null){
    	if("LAD".equalsIgnoreCase(customer.getCycle())){
    	isLADCycle=true;
    	}
    }
    
    String event = (String) request.getAttribute("event");
    if (event != null && event.equals("processcusdetails")) {
        transactionID = null;
    }
    
    boolean requireDocumentation = 	limitprofile != null && 
			PropertiesConstantHelper.isValidDocumentationSystem(limitprofile.getSourceID()) &&
			PropertiesConstantHelper.isValidDocumentationApplicationType(limitprofile.getApplicationType());    
			
	System.out.println("///////////////////////////////// Left Frame is ///////////////////////////// ssc_checker_leftframe.jsp");

%>



<%@page import="com.integrosys.component.user.app.bus.ICommonUser"%><html>
<head>

<style>
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
            <td width="164" height="18" nowrap=""><a href="CustomerSearch.do?event=return" title="Return">Return</a></td>
        </tr>
        <tr>
            <td width="10" nowrap valign="top">-</td>
            <td width="164" height="18" nowrap><a href="<%=viewCustomerLink%>" title="View Customer Details">View Customer Details</a></td>
        </tr>
        
 <tr>
                <td>&nbsp;</td>
                <td height="18">&nbsp;</td>
            </tr>
             <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="Discrepency.do?event=list_discrepency" title="View Discrepancy"> View Discrepancy</a></td>
            </tr>
             <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
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

		<%      if ((!customer.getNonBorrowerInd()) || 
		            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus())))
		        {
			
		        	if (requireDocumentation) {
		%> 
<!--
            <tr>
                <td>&nbsp;</td>
                <td height="18">&nbsp;</td>
            </tr>

            <tr>
                <td width="10" nowrap valign="top">-</td>
                <td width="164" height="18" nowrap><a href="Bfl.do?event=view_bfl" title="View BFL Status">View BFL Status</a></td>
            </tr>

-->
            <tr>
            	<td>&nbsp;</td><td height="18" nowrap><strong><bean:message key="label.documentary.requirement"/></strong></td>
            </tr>	
<!--        <tr>-->
<!--            <td width="10" nowrap valign="top">-</td>-->
<!--            <td width="164" height="18" nowrap><a href="TatDoc.do?event=view_checker" ><bean:message key="title.view.tatdoc"/></a></td>-->
<!--        </tr>-->
<!--		    <tr>-->
<!--		      <td nowrap valign="top">-</td>-->
<!--		      <td height="18" nowrap><a href="CCCheckList.do?event=list" title="View Maintain C/C Checklist">View Maintain C/C Checklist</a></td>-->
<!--		    </tr>-->
 <!-- Added By Abhijit Facility , Cam , Security , DDN  , LAD , Discrepency  -->
 
 <tr>
		      <td nowrap valign="top">-</td>
		      
<!--		      <td height="18" nowrap><a href="TatDoc.do?event=read_edit" title="<bean:message key="title.tatdoc"/>"><bean:message key="title.tatdoc"/></a></td>-->
		      <td height="18" nowrap><a href="FacilityCheckList.do?event=list" title="View Maintain Facility Checklist">View Maintain Facility Checklist</a></td>
		    </tr>
		     <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="FacilityReceipt.do?event=list" title="View Update Facility Receipt">View Update Facility Receipt</a></td>
		    </tr>
		    <tr>
		     <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="CAMCheckList.do?event=list" title="View Maintain CAM Checklist">View Maintain CAM Checklist</a></td>
		    </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="CAMReceipt.do?event=list" title="View Update CAM Receipt">View Update CAM Receipt</a></td>
		    </tr>
		     <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
		      
<!--            <tr>-->
<!--              <td nowrap valign="top">-</td>-->
<!--              <td height="18" nowrap><a href="CCReceipt.do?event=list" title="View Update C/C Receipt">View Update C/C Receipt</a></td>-->
<!--            </tr>-->

            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="SecurityCheckList.do?event=list" title="View Maintain Security Checklist">View Maintain Security Checklist</a></td>
            </tr>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="SecurityReceipt.do?event=list" title="View Update Security Receipt">View Update Security Receipt</a></td>
            </tr>
            <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
            <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="OtherCheckList.do?event=list" title="Maintain Other Checklist">View Maintain Other  Checklist</a></td>
		    </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="OtherReceipt.do?event=list" title="Update Other Receipt">View Update Other Receipt</a></td>
		    </tr>
		    
		    <!-- Start:Code added for Pari Passu Checklist -->
		   <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="MaintainPariPassuCheckListAction.do?event=checker_list" title="View Maintain Pari Passu Checklist">View Maintain Pari Passu Checklist</a></td>
		    </tr>		    
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="UpdatePariPassuCheckListAction.do?event=after_chk_list" title="View Update Pari Passu Checklist">View Update Pari Passu Checklist</a></td>
		    </tr>		    
		    <!-- End:Code added for Pari Passu Checklist -->	            
           
            <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
            <%-- if(isBranchUser){ %>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="CaseCreation.do?event=CaseCreationListViewCommand&role=branch"title="Case Creation">Case Creation </a></td>
            </tr>
             <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
            <%} --%>
            
             <%if(isBranchUser || isCputUser||isBranchUserView){ %>
             
            
             <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="caseCreationUpdate.do?event=maker_list_caseCreationUpdate&role=branch "title="Case Creation">Update Case Creation </a></td>
            </tr>
            <%} %>
            
             <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="Annexure.do?event=checker_annexure_list" title="Exchange Information">Exchange of Information</a></td>
            </tr>
            <tr>
                <td nowrap valign="top"></td>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="DocumentCheckList.do?event=list" title="View Complete Checklist">View Complete Checklist</a></td>
		    </tr>

            <tr>
                <td>&nbsp;</td>
                <td height="18">&nbsp;</td>
            </tr>
            <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="GenerateDDN.do?event=view_generate_ddn" title="View DDN">View DDN</a></td>
		    </tr>
		     <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
        <%if(isBranchUser){ %>
        <tr>
                <td nowrap valign="top">-</td>
                <td height="18" nowrap><a href="RecurrentDocCheckList.do?event=list" title="Maintain Recurrent Document Checklist">
                    Maintain Recurrent Document Checklist</a></td>
            </tr>
            <tr>
                <td nowrap valign="top">-</td>
                <td height="18" nowrap><a href="RecurrentDocReceipt.do?event=list" title="Update Recurrent Document Receipt">
                Update Recurrent Document Receipt</a></td>
            </tr>
            <tr>
            	<td>&nbsp;</td>
            	<td height="18">&nbsp;</td>
        	</tr>
        	<%}else{ %>
        	 <tr>
                <td nowrap valign="top">-</td>
                <td height="18" nowrap><a href="RecurrentDocCheckList.do?event=list" title="View Recurrent Document Checklist">
                    View Recurrent Document Checklist</a></td>
            </tr>
            <tr>
                <td nowrap valign="top">-</td>
                <td height="18" nowrap><a href="RecurrentDocReceipt.do?event=list" title="View Recurrent Document Receipt">
                View Recurrent Document Receipt</a></td>
            </tr>
            <tr>
            	<td>&nbsp;</td>
            	<td height="18">&nbsp;</td>
        	</tr>
        	<%} %>
        <%if(isLADCycle){ %>
        
        <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="LADReceipt.do?event=list" title="View Update LAD Receipt"> View Update LAD Receipt</a></td>
		    </tr>
<!--        <tr>-->
<!--                <td nowrap valign="top">-</td>-->
<!--                <td height="18" nowrap><a href="GenerateLAD.do?event=menu_view" title="View Update LAD Checklist">-->
<!--               View Update LAD Checklist</a></td>-->
<!--            </tr>-->
              <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
         <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
        <%} %>
<!--		    <tr>-->
<!--		      <td nowrap valign="top">-</td>-->
<!--		      <td height="18" nowrap><a href="GeneratePSCC.do?event=view_generate_pscc" title="View Partial SCC">View Partial SCC</a></td>-->
<!--		    </tr>-->
<!--            <tr>-->
<!--		      <td nowrap valign="top">-</td>-->
<!--		      <td height="18" nowrap><a href="GenerateSCC.do?event=view_generate_scc" title="View SCC">View SCC</a></td>-->
<!--		    </tr>-->

		    <% if (!ICMSConstant.APPLICATION_TYPE_PL.equals(limitprofile.getApplicationType()) &&
		    		!ICMSConstant.APPLICATION_TYPE_HP.equals(limitprofile.getApplicationType()))  {%>
<!--	    <tr>-->
<!--      <td nowrap valign="top">-</td>-->
<!--        <td height="18" nowrap><a href="GenerateLI.do?event=list" title="Generate Letter of Reminder / Instructions">Generate Letter of Reminder/<br>Instructions</a></td>-->
<!--    </tr>-->
		    <% } %>
            <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
        <% } %>
			<% if (limitprofile != null && PropertiesConstantHelper.isSTPRequired() && 
					PropertiesConstantHelper.isValidSTPSystem(limitprofile.getSourceID())) {
			 %>
<!--            <tr>-->
<!--            	<td>&nbsp;</td><td height="18" nowrap><strong><bean:message key="label.stp.SIBS"/></strong></td>-->
<!--            </tr>			-->

			<% if (PropertiesConstantHelper.isValidSTPFacilityLoadingApplicationType(limitprofile.getApplicationType())) { %>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="FacilityMain.do?event=list&frameRequested=true" title="<bean:message key="title.facility"/>"><bean:message key="title.facility"/></a></td>
		    </tr>     
			<% } %>
            <tr>
                <td nowrap valign="top">-</td>
                <td height="18" nowrap><a href="CollateralLoading.do?event=list&frameRequested=true" title="<bean:message key='title.collateral.loading'/>">
                    <bean:message key="title.collateral.loading"/></a></td>
            </tr>       
            <tr>
                <td nowrap valign="top"></td>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
			<% } %>
			
			
		<%  if (requireDocumentation) { %>            
    
<!--            <tr>-->
<!--                <td nowrap valign="top">-</td>-->
<!--                <td height="18" nowrap><a href="RecurrentCheckList.do?event=read" title="View Maintain Recurrent Document / Covenant Checklist">View Maintain Recurrent Document/<br>Covenant Checklist</a></td>-->
<!--            </tr>-->
<!--            <tr>-->
<!--                <td nowrap valign="top">-</td>-->
<!--                <td height="18" nowrap><a href="RecurrentReceipt.do?event=read" title="View Update Recurrent Document / Covenant Receipt">View Update Recurrent Document/<br>Covenant Receipt</a></td>-->
<!--            </tr>-->

        <% } }%>

       
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

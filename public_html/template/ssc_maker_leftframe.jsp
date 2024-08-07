<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.PropertiesConstantHelper,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 java.util.ArrayList" %>
<%@ page import="com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>
<%@ page import="java.util.List" %>
<%@ page import="com.integrosys.cms.app.function.bus.OBTeamFunctionGrp" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
    /*
    String subprofileID = request.getParameter("subprofileID");
    String instrID = request.getParameter("instrID");

    System.out.println(">>>>subprofileID: " + subprofileID);
    System.out.println(">>>>instrID: " + instrID);
    */
    //System.out.println("::::::::::!111111111111111:::::::::");
    //String viewCustomerLink = "CustomerProcess.do?event=processcusdetails&subprofileID=" + subprofileID + "&instrID=" + instrID;
	String id = (String)request.getAttribute("legalCustomerId");	
    String viewCustomerLink = "CustomerProcess.do?event=viewLimitProfile";
    String viewDocumentStatus = "CheckList.do?event=viewDocumentStatus";
    boolean isBranchUser=false;
    boolean isCputADMUser=false;
    boolean isCputUser=false;
    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER 
		|| user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH){
    	isBranchUser=true;
    }
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER||
    		user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER
			||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_MAKER_CHECKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH
			){
    	isCputUser=true;
    }
    
    if(user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.TEAM_TYPE_SC_MAKER_WFH
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER_CHECKER
    		||user.getTeamTypeMembership().getMembershipID()==ICMSConstant.CPU_ADMIN_MAKER_CHECKER_WFH){
    	isCputADMUser=true;
    }
	
    String transactionID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + "transactionID_backtoTask");
    OBCMSCustomer customer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitprofile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    String event = (String) request.getAttribute("event");
    if (event != null && event.equals("processcusdetails")) {
        transactionID = null;
    }   
    boolean isLADCycle=false;
    if(customer.getCycle()!=null){
    	if("LAD".equalsIgnoreCase(customer.getCycle())){
    	isLADCycle=true;
    	}
    }
    boolean requireDocumentation = 	limitprofile != null && 
    		PropertiesConstantHelper.isValidDocumentationSystem(limitprofile.getSourceID()) &&
			PropertiesConstantHelper.isValidDocumentationApplicationType(limitprofile.getApplicationType());

	//System.out.println("///////////////////////////////// Left Frame is ///////////////////////////// ssc_maker_leftframe.jsp");


    List teamFunctionList = (List) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_FUNTION);
    boolean isPreDisbursementTeam = false;
    if (teamFunctionList != null) {
        for (int i = 0; i < teamFunctionList.size(); i++) {
            long functionGrp = ((OBTeamFunctionGrp)teamFunctionList.get(i)).getFunctionGrpId();
            if(functionGrp == 1) {
                isPreDisbursementTeam = true;
            } else if(functionGrp != 2 && functionGrp != 3) {
                DefaultLogger.debug(this, "ssc_maker_leftframe.jsp >>>>>>>>>>>>>>> unknown function group = " + functionGrp);
            }
        }
    } else {
        DefaultLogger.debug(this, "ssc_maker_leftframe.jsp >>>>>>>>>>>>>>>> teamFunctionList is null ");
    }
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
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
        <tr>
            <td width="10" nowrap valign="top">-</td>
            <td width="164" height="18" nowrap=""><a href="<%=viewCustomerLink%>" title="View Customer Details">View Customer Details</a></td>
        </tr>
        
        <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
            
             <%if(isBranchUser){ %>
             <tr>
              <td nowrap valign="top">-</td>
             <!--  <td height="18" nowrap><a href="Discrepency.do?event=list_discrepency" title="View Discrepancy"> View Discrepancy</a></td> -->
              <td height="18" nowrap><a href="Discrepency.do?event=list_discrepency" title="Discrepancy">Discrepancy</a></td>
            </tr>
            <%}else{ %>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="Discrepency.do?event=list_discrepency" title="Discrepancy">Discrepancy</a></td>
            </tr>
            <%} %>
             <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
		<%--<% if (limitprofile != null) {%>
        <tr>
            <td width="10" nowrap valign="top">-</td>
            <td width="164" height="18" nowrap><a href="<%=viewDocumentStatus%>" title="Documentation Status">Documentation Status </a></td>
        </tr>
		<%}%>--%>

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
                <td width="164" height="18"><a href=<%=viewMainBorrowerInfo%> title="Main Borrower Information">Main Borrower Information</a></td>
            </tr>
        <%}--%>

         <!--if (!customer.getNonBorrowerInd()) {-->
            <!--<tr>
                <td>&nbsp;</td>
                <td height="18">&nbsp;</td>
            </tr>
            <tr>
                <td width="10" nowrap valign="top">-</td>
                <td width="164" height="18" nowrap><a href="Bfl.do?event=view_bfl" title="View BFL Status">
                    View BFL Status</a></td>
            </tr>-->
            <%if (!customer.getNonBorrowerInd()) { %>
            <%--
            <tr>
            	<td>&nbsp;</td>
            	<td height="18" nowrap><a href="#" title="Generate Letter of Reminder">Generate Letter of Reminder</a></td>
            </tr>
            <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
            --%>
            <% } %>
		<%      if ((!customer.getNonBorrowerInd()) || 
		            (limitprofile != null && ICMSConstant.STATE_DELETED.equals(limitprofile.getBCAStatus())))
		        {
			//System.out.println("::::::::::!00000000000000:::::::::");			
                    if ((limitprofile != null) && (limitprofile.getCustomerID() == customer.getCustomerID())) {
						//System.out.println("::::::::::!111111111111111:::::::::");
                    if (requireDocumentation) {
                    	
                    	//System.out.println("::::::::::!222222222222222:::::::::");
		%>            
            <tr>
            	<td>&nbsp;</td><td height="18" nowrap><strong><bean:message key="label.documentary.requirement"/></strong></td>
            </tr>	
		    <tr>
		      <td nowrap valign="top">-</td>
		      
<!--		      <td height="18" nowrap><a href="TatDoc.do?event=read_edit" title="<bean:message key="title.tatdoc"/>"><bean:message key="title.tatdoc"/></a></td>-->
		      <td height="18" nowrap><a href="FacilityCheckList.do?event=list" title="Maintain Facility Checklist">Maintain Facility Checklist</a></td>
		    </tr>
		     <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="FacilityReceipt.do?event=list" title="Update Facility Receipt">Update Facility Receipt</a></td>
		    </tr>
		     <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
<!--		    <tr>-->
<!--		      <td nowrap valign="top">-</td>-->
<!--		      <td height="18" nowrap><a href="CCCheckList.do?event=list" title="Maintain C/C Checklist">Maintain C/C Checklist</a></td>-->
<!--		    </tr>-->
<!--		    <tr>-->
<!--		      <td nowrap valign="top">-</td>-->
<!--		      <td height="18" nowrap><a href="CCReceipt.do?event=list" title="Update C/C Receipt">Update C/C Receipt</a></td>-->
<!--		    </tr>-->

			<tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="CAMCheckList.do?event=list" title="Maintain CAM Checklist">Maintain CAM Checklist</a></td>
		    </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="CAMReceipt.do?event=list" title="Update CAM Receipt">Update CAM Receipt</a></td>
		    </tr>
		     <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="SecurityCheckList.do?event=list" title="Maintain Security Checklist">Maintain Security Checklist</a></td>
		    </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="SecurityReceipt.do?event=list" title="Update Security Receipt">Update Security Receipt</a></td>
		    </tr>
		    <!-- Start:Code added for Pari Passu Checklist -->
		   <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
            <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="OtherCheckList.do?event=list" title="Maintain Other Checklist">Maintain Other  Checklist</a></td>
		    </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="OtherReceipt.do?event=list" title="Update Other Receipt">Update Other Receipt</a></td>
		    </tr>
		     <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="MaintainPariPassuCheckListAction.do?event=list" title="Maintain Pari Passu Checklist">Maintain Pari Passu Checklist</a></td>
		    </tr>		    
		    <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="UpdatePariPassuCheckListAction.do?event=after_list" title="Update Pari Passu Checklist">Update Pari Passu Checklist</a></td>
		    </tr>		    
		    <!-- End:Code added for Pari Passu Checklist -->		    
		    
<!--            Added By Abhijit Rudrakshawar Start-->
  			
            <%if(isCputUser){ %>
            <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="CaseCreation.do?event=CaseCreationListViewCommand&role=cput "title="Case Creation">Initiate Case Creation </a></td>
            </tr>
             <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="caseCreationUpdate.do?event=maker_list_caseCreationUpdate&role=cput "title="Case Creation">Update Case Creation </a></td>
            </tr>
            <%} %>
            <%if(isBranchUser){ %>
             <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
           <!--   <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="CaseCreation.do?event=CaseCreationListViewCommand&role=branch" title="Case Creation">Initiate Case Creation </a></td>
            </tr>  --> 
             <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="caseCreationUpdate.do?event=maker_list_caseCreationUpdate&role=branch "title="Case Creation">Update Case Creation </a></td>
            </tr>
            <%} %>
            
              <%if( isCputADMUser){ %>
               <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
            
             <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="caseCreationUpdate.do?event=maker_list_caseCreationUpdate&role=branch "title="Case Creation">Update Case Creation </a></td>
            </tr>
            <%} %>
            <!--            Added By  Abhijit Rudrakshawar  End-->  
             <tr>
            	<td>&nbsp;</td><td height="18">&nbsp;</td>
            </tr>
           <%if(isBranchUser){ %>       
	  		 <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="Annexure.do?event=checker_annexure_list" title="Exchange Information">Exchange of Information</a></td>
            </tr>
			<% }else{ %>   
            <tr>
              <td nowrap valign="top">-</td>
              <td height="18" nowrap><a href="Annexure.do?event=list" title="Exchange Information">Exchange of Information</a></td>
            </tr>
          		
			<% } %>

            <tr>
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
    <%if(isBranchUser){ %>
   			 <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="GenerateDDN.do?event=view_generate_ddn" title="View DDN">View DDN</a></td>
		    </tr>
		<% }else{ %>   
        <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="GenerateDDN.do?event=generate_ddn" title="Generate DDN">Generate DDN</a></td>
    </tr>
   <% } %>
<!--    <tr>-->
<!--        <td nowrap valign="top">-</td>-->
<!--        <td height="18" nowrap><a href="GeneratePSCC.do?event=generate_pscc" title="Generate Partial SCC">Generate Partial SCC</a></td>-->
<!--    </tr>-->
<!--    <tr>-->
<!--        <td nowrap valign="top">-</td>-->
<!--        <td height="18" nowrap><a href="GenerateSCC.do?event=generate_scc" title="Generate SCC">Generate SCC</a></td>-->
<!--    </tr>-->
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
<!--    <tr>-->
<!--      <td nowrap>-</td>-->
<!--      <td height="18" nowrap><a href="custodian.do?event=list_lodgement" title="Print Lodgement Memo">Print Lodgement Memo</a></td>-->
<!--    </tr>-->
<!--    <tr>-->
<!--      <td nowrap>-</td>-->
<!--      <td height="18" nowrap><a href="custodian.do?event=list_withdrawal" title="Print Withdrawal Mem">Print Withdrawal Memo</a></td>-->
<!--    </tr>-->
<!--    <tr>-->
<!--      <td>&nbsp;</td>-->
<!--      <td height="18">&nbsp;</td>-->
<!--    </tr> -->
		    <%
                if (PropertiesConstantHelper.isGenerateLIApplicable(limitprofile.getApplicationType())
                    && isPreDisbursementTeam)  {%>
<!--	    <tr>-->
<!--      <td nowrap valign="top">-</td>-->
<!--        <td height="18" nowrap><a href="GenerateLI.do?event=list" title="Generate Letter of Reminder / Instructions">Generate Letter of Reminder/<br>Instructions</a></td>-->
<!--    </tr>-->
		    <% } %>
        <% } %>
<!--            <tr>-->
<!--            	<td>&nbsp;</td><td height="18">&nbsp;</td>-->
<!--            </tr>-->
			<% if (limitprofile != null && PropertiesConstantHelper.isSTPRequired() && 
					PropertiesConstantHelper.isValidSTPSystem(limitprofile.getSourceID())) {
			 %>
<!--            <tr>-->
<!--            	<td>&nbsp;</td><td height="18" nowrap><strong><bean:message key="label.stp.SIBS"/></strong></td>-->
<!--            </tr>			-->
<!--            <tr>-->
<!--                <td nowrap valign="top">-</td>-->
<!--                <td height="18" nowrap><a href="CollateralRedirect.do?event=prepare&frameRequested=true" title="Create Collateral">-->
<!--                    Create Collateral</a></td>-->
<!--            </tr>-->
			<% if (PropertiesConstantHelper.isValidSTPFacilityLoadingApplicationType(limitprofile.getApplicationType())) { %>
<!--		    <tr>-->
<!--		      <td nowrap valign="top">-</td>-->
<!--		      <td height="18" nowrap><a href="FacilityMain.do?event=list&frameRequested=true" title="<bean:message key="title.facility"/>"><bean:message key="title.facility"/></a></td>-->
<!--		    </tr>     -->
			<% } %>
<!--            <tr>-->
<!--                <td nowrap valign="top">-</td>-->
<!--                <td height="18" nowrap><a href="CollateralLoading.do?event=list&frameRequested=true" title="<bean:message key='title.collateral.loading'/>">-->
<!--                    <bean:message key="title.collateral.loading"/></a></td>-->
<!--            </tr>       -->
<!--            <tr>-->
<!--                <td nowrap valign="top"></td>-->
<!--            	<td>&nbsp;</td><td height="18">&nbsp;</td>-->
<!--            </tr>-->
			<% } %>
		<%  if (requireDocumentation) { %>            
<!--            <tr>-->
<!--                <td nowrap valign="top">-</td>-->
<!--                <td height="18" nowrap><a href="RecurrentCheckList.do?event=list" title="Maintain Recurrent Document / Covenant Checklist">-->
<!--                    Maintain Recurrent Document/<br>Covenant Checklist</a></td>-->
<!--            </tr>-->
<!--            <tr>-->
<!--                <td nowrap valign="top">-</td>-->
<!--                <td height="18" nowrap><a href="RecurrentReceipt.do?event=list" title="Update Recurrent Document / Covenant Receipt">-->
<!--                Update Recurrent Document/<br>Covenant Receipt</a></td>-->
<!--            </tr>-->
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
            
        	 <%if(isLADCycle){ %>
        	 
        	 <tr>
		      <td nowrap valign="top">-</td>
		      <td height="18" nowrap><a href="LADReceipt.do?event=list" title="Update LAD Receipt">Update LAD Receipt</a></td>
		    </tr>
		     <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr> <tr>
            <td>&nbsp;</td>
            <td height="18">&nbsp;</td>
        </tr>
<!--            <tr>-->
<!--                <td nowrap valign="top">-</td>-->
<!--                <td height="18" nowrap><a href="GenerateLAD.do?event=menu" title="Update LAD Checklist">-->
<!--                Update LAD Checklist</a></td>-->
<!--            </tr>-->
		<%} %>
            <%  } } } %>
<!--             <tr>-->
<!--                <td nowrap valign="top">-</td>-->
<!--                <td height="18" nowrap><a href="LADCheckList.do?event=list" title="Maintain Recurrent Document / Covenant Checklist">-->
<!--                    Maintain LAD</a></td>-->
<!--            </tr>-->

			
          
<%--
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
        --%>
    </tbody>
</table>
</body>
</html>


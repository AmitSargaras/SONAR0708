<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.component.user.app.bus.ICommonUser,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>

<%
//get team and user from session to test..

    ICommonUser user = (ICommonUser)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER);
	String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
	long membershipID = Long.parseLong(teamTypeMemID);

	 //Start: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
    OBCMSCustomer customer = (OBCMSCustomer) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    boolean isActive=true;
    if(null!=customer && ICMSConstant.CUSTOMER_STATUS_INACTIVE.equals(customer.getStatus())){
    isActive=false;
    	}
    
    DefaultLogger.debug(this,"Party Status: isActive:"+isActive);
  //End: Uma Khot: Phase 3 CR: View Scanned and linked documents for Inactive Parties
    boolean found = false;

                        if(membershipID == ICMSConstant.TEAM_TYPE_CPC_MAKER){//4 is cpc maker team type memship id..
                            found = true;
                            %>
                            <jsp:include page="/template/cpc_maker_leftframe.jsp" />
                            <%

                        }else if(membershipID == ICMSConstant.TEAM_TYPE_CPC_CUSTODIAN_MAKER){//4 is cpc maker team type memship id..
                            found = true;
                            %>
                            <jsp:include page="/custodian/maker_left_frame.jsp" />
                            <%

                        }else if (membershipID == ICMSConstant.TEAM_TYPE_CPC_CUSTODIAN_CHECKER) {
                           found = true;
                           %>
                            <jsp:include page="/custodian/checker_left_frame.jsp" />
                            <%

                        }else if(membershipID == ICMSConstant.TEAM_TYPE_SSC_MAKER
                        ||membershipID == ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH
                        ||membershipID==ICMSConstant.CPU_MAKER
                        ||membershipID==ICMSConstant.TEAM_TYPE_CPU_MAKER_I
                        ||membershipID==ICMSConstant.CPU_ADMIN_MAKER
                        ||membershipID==ICMSConstant.TEAM_TYPE_SC_MAKER_WFH
                        ||membershipID==ICMSConstant.CPU_ADMIN_MAKER_CHECKER
                        ||membershipID==ICMSConstant.CPU_ADMIN_MAKER_CHECKER_WFH
                        ||membershipID==ICMSConstant.CPU_MAKER_CHECKER
                        ||membershipID==ICMSConstant.CPU_MAKER_CHECKER_WFH
                        ||membershipID == ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH
                        ||membershipID==ICMSConstant.TEAM_TYPE_CPU_MAKER_II
                        ||membershipID==ICMSConstant.TEAM_TYPE_CPU_MAKER_II_WFH){
                        	if(isActive){
                            found = true;
                            %>
                      <jsp:include page="/template/ssc_maker_leftframe.jsp" />
                        <%}else{
                        	 found = true;
                        	 %>
                        <jsp:include page="/template/ssc_checker_leftframe.jsp" />
                            
						<%}}else if(membershipID == ICMSConstant.TEAM_TYPE_SSC_CHECKER
								||membershipID == ICMSConstant.TEAM_TYPE_SSC_CHECKER_WFH
								||membershipID==ICMSConstant.CPU_CHECKER
								||membershipID==ICMSConstant.CPU_ADMIN_CHECKER
								||membershipID==ICMSConstant.TEAM_TYPE_SC_CHECKER_WFH
								||membershipID==ICMSConstant.CPU_ADMIN_MAKER_CHECKER
								||membershipID==ICMSConstant.CPU_ADMIN_MAKER_CHECKER_WFH
								||membershipID==ICMSConstant.CPU_MAKER_CHECKER
								||membershipID==ICMSConstant.CPU_MAKER_CHECKER_WFH){
                            found = true;
                            %>
                            <jsp:include page="/template/ssc_checker_leftframe.jsp" />
                            <%
                        }else if(membershipID ==ICMSConstant.TEAM_TYPE_CPC_CHECKER){
                            found = true;
                            %>
                            <jsp:include page="/template/cpc_checker_leftframe.jsp" />
                            <%
                        }else if(membershipID ==ICMSConstant.TEAM_TYPE_GAM_USER){
                            found = true;
                            %>
                            <jsp:include page="/template/gam_leftframe.jsp" />
                            <%
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_CPC_MANAGER_USER) {
                            found = true;
                        %>
                           <jsp:include page="/template/cpc_manager_leftframe.jsp" />
                        <%
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_CPC_SUPPORT_USER) {
                            found = true;
                        %>
                          <jsp:include page="/template/cpc_support_leftframe.jsp" />
                        <%
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_FAM_USER) {
                            found = true;
                        %>
                            <jsp:include page="/template/fam_leftframe.jsp" />
                        <%
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_RCO_USER) {
                            found = true;
                        %>
                            <jsp:include page="/template/rco_leftframe.jsp" />
                        <%
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_SCO_USER) {
                            found = true;
                        %>
                            <jsp:include page="/template/sco_leftframe.jsp" />
                        <%
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_MIS_USER) {
                            found = true;
                        %>
                            <jsp:include page="/template/mis_leftframe.jsp" />
                        <%
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_SSC_SUPPORT_USER) {
                            found = true;
                        %>
                            <jsp:include page="/template/ssc_support_leftframe.jsp" />
                        <%
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_AM_MAKER) {
                            found = true;
                        %>
                            <jsp:include page="/template/am_maker_leftframe.jsp" />
                        <%
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_AM_CHECKER) {
                            found = true;
                        %>
                            <jsp:include page="/template/am_checker_leftframe.jsp" />
                        <% 
                         }else if (membershipID == ICMSConstant.TEAM_TYPE_BRANCH_MAKER || membershipID == ICMSConstant.TEAM_TYPE_BRANCH_MAKER_WFH) {
                             found = true;
                             %>
                                  <jsp:include page="/template/ssc_maker_leftframe.jsp" />
                             <% 
                        }else if (membershipID == ICMSConstant.TEAM_TYPE_BRANCH_VIEW||membershipID == ICMSConstant.TEAM_TYPE_BRANCH_VIEW_WFH) {
                             found = true;
                             %>
                                  <jsp:include page="/template/ssc_checker_leftframe.jsp" />
                             <% 
                             
                              }else if (membershipID == ICMSConstant.TEAM_TYPE_BRANCH_CHECKER||membershipID == ICMSConstant.TEAM_TYPE_BRANCH_CHECKER_WFH) {
                                  found = true;
                                  %>
                                       <jsp:include page="/template/ssc_checker_leftframe.jsp" />
                                  <% 
                                  
                               }else if (membershipID == 1016||membershipID == 1037) {
                                  found = true;
                                   %>
                                   <jsp:include page="/template/ssc_checker_leftframe.jsp" />
                                 <% 
                                       
                               }else {
                            found = true;
                            DefaultLogger.debug(this, "Using Default Left Frame for MembershipID: " + membershipID);
                         %>
                           <jsp:include page="/template/default_leftframe.jsp" />
                         <%
                        }
    if(false == found) {
            Exception e = new Exception("Unknown membership ID in team. Unable to assign a template for this login user with userID: " + user.getUserID());
            DefaultLogger.error(this, "Caught Exceptiion!", e);
        %>
            <jsp:include page="/system/system_error.jsp" />
        <%
    }
%>

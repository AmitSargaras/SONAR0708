<%@ page import="java.util.*,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.app.limit.bus.ITradingAgreement,
                 com.integrosys.cms.app.limit.trx.OBLimitProfileTrxValue,
                 com.integrosys.cms.ui.common.AgreementTypeList, 
                 com.integrosys.cms.ui.login.CMSGlobalSessionConstant" %>
                 
                 <%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/UdfTag.tld" prefix="udf"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
String teamTypeMemID = (String) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
boolean isUserCpcMaker = ICMSConstant.TEAM_TYPE_SSC_MAKER == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_SSC_MAKER_WFH == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_I == Long.parseLong(teamTypeMemID)
||ICMSConstant.TEAM_TYPE_CPU_MAKER_I_WFH == Long.parseLong(teamTypeMemID);

%>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: $
     *
     * Describe this JSP.
     * Purpose: For Maker and checker view the AA Information
     * Description: view AA Information by Maker and Checker
     *
     * @author $Author: jerlin $<br>
     * @version $Revision:$
     * @since $Date: $
     * Tag: $Name:  $
     */
 %>
<%
  ITeam userTeam = (ITeam)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+IGlobalConstant.USER_TEAM);
  long oneTeamMshipID = userTeam.getTeamMemberships()[0].getTeamTypeMembership().getMembershipID();
  long teamTypeID = userTeam.getTeamType().getTeamTypeID();
  boolean isMr = false;

  if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER ||
    oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER) {
    isMr = true;
  }
    
  String cannotDeleteAA = (String)request.getAttribute("cannotDeleteAA");
	
  String aaID = request.getParameter("aaID");
  String trxId = request.getParameter("TrxId");
  String indexChange = "";
  String mainEventIdentifier = "";
  String event = (String) request.getAttribute("event");
  if(request.getParameter("indexChange") != null){
    indexChange = request.getParameter("indexChange");
  }else{
    indexChange = "0";
  }
  if(isUserCpcMaker)
  mainEventIdentifier = "viewMaker";
  else
  mainEventIdentifier = "viewChecker";
  
  if(event.equals("maker_close_aadetail"))
  {
	  mainEventIdentifier="maker_close_aadetail"; 
  }
  boolean isView = true;
  if("view".equals(event)){
    isView = true;
  }else{
    isView = false;
  }

  boolean isDelete = true;
  if("maker_delete_aadetail".equals(event) || "maker_delete_aadetail_reject".equals(event)){
    isDelete = true;
  }else{
    isDelete = false;
  }

  boolean isClose = true;
  if("maker_close_aadetail".equals(event)){
    isClose = true;
  }else{
    isClose = false;
  }
  if(event.equals("maker_close_aadetail"))
  {
	  mainEventIdentifier="maker_close_aadetail";
  }
  if("maker_close_aadetail".equals(mainEventIdentifier))
	  isClose = true;

  ILimitProfile parameters = null ;
  Object obj = session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.limitProfileTrxVal");
  com.integrosys.cms.ui.manualinput.aa.AADetailForm aForm = (com.integrosys.cms.ui.manualinput.aa.AADetailForm) request.getAttribute("AADetailForm");
  OBLimitProfileTrxValue obTrxValue = null;
  boolean entries_editable = false;
  boolean isRejected = false;
  boolean canEdit = false;
  
  String relationShipMgrName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.relationShipMgrName");
  
  String regionName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.regionName");
  
  String migratedFlag = "N";	
   migratedFlag = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.migratedFlag");
  if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }

  String branchName = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.branchName");
  
  Collection riskGradeList = (Collection) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.riskGradeList");
	request.setAttribute("riskGradeList", riskGradeList);
	List creditAprrovalList=(List)session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.creditAprrovalList");
	pageContext.setAttribute("creditAprrovalList",creditAprrovalList);	
  
  if( obj!=null ) {
    DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.limitProfileTrxVal");
    obTrxValue = (OBLimitProfileTrxValue)obj;
    DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );

    // check whether the currentStatus is REJECTED
    String status = "";
    if(obTrxValue.getStatus().length() > 8){
      status = obTrxValue.getStatus().substring(0,8);
    }else{
      status = obTrxValue.getStatus();
    }

    isRejected = ICompConstant.STATE_REJECTED.equals( status );//true;


    // Entries are editable only if the record is ACTIVE.
    if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
      entries_editable = true;
    }

    if( event.equalsIgnoreCase("maker_close_aadetail") || "to_track".equals(event) ) {
      parameters = obTrxValue.getStagingLimitProfile();

    } else {
      parameters = obTrxValue.getLimitProfile();
    }

    if( parameters!=null ) {
        DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters.");
    }
  }else {
    DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'limitProfileTrxVal' ");
  }
	boolean isDeleted = false;
    String aaId = null;
    if(parameters!=null){
		if (parameters.getBCAStatus() != null && parameters.getBCAStatus().equals (ICMSConstant.STATE_DELETED)) { 
        	isDeleted = true;   
        }
		if( parameters.getCMSCreateInd() )
		{
		  canEdit = true;
		}
           
    }
    String customerID = request.getParameter("customerID");
    if(customerID==null){
    	customerID =(String) session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.customerId");
    }
 //   System.out.println("************/////////////////////////////// customerID "+customerID);
%>


<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%><link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script type="text/javascript" src="js/udf.js"></script>
<script language="JavaScript" type="text/JavaScript">    
<!--
  function submitPage(num) {
    if (num == 1) {
      document.forms[0].action = "MIAADetail.do?event=maker_edit_aadetail&indexChange=<%=indexChange%>&customerID=<%=customerID%>";
    }else if(num==2){
		if( '<%=event%>' == 'maker_delete_aadetail_confirm' ) {
            document.forms[0].action = "MIAADetail.do?event=<%=event%>&indexChange=<%=indexChange%>&customerID=<%=customerID%>";
		}
		else if( '<%=event%>' == 'maker_delete_aadetail_reject_confirm' ) {
            document.forms[0].action = "MIAADetail.do?event=<%=event%>&indexChange=<%=indexChange%>&customerID=<%=customerID%>";
		}
		else {
            document.forms[0].action = "MIAADetail.do?event=<%=event%>_confirm&indexChange=<%=indexChange%>&customerID=<%=customerID%>";
		}
    }
    document.forms[0].submit();
  }

function viewAgreement() {
  if( '<%=event%>' == 'maker_delete_aadetail_confirm' ) {
    document.forms[0].action = "TradingAgreement.do?event=view&preEvent=maker_delete_aadetail&indexChange=0&TrxId=<%=trxId%>&&aaID=<%=aaID%>&customerID=<%=customerID%>";
  }else if( '<%=event%>' == 'maker_delete_aadetail_reject_confirm' ) {
    document.forms[0].action = "TradingAgreement.do?event=view&preEvent=maker_delete_aadetail_reject&indexChange=0&TrxId=<%=trxId%>&&aaID=<%=aaID%>&customerID=<%=customerID%>";
  }else{
    document.forms[0].action = "TradingAgreement.do?event=view&preEvent=<%=event%>&indexChange=0&TrxId=<%=trxId%>&&aaID=<%=aaID%>&customerID=<%=customerID%>";
  }
  document.forms[0].submit();
}



function showDetail2() {
	document.forms[0].action = "MIAADetail.do?event=check_list_other_covenants_view&mainEventIdentifier=<%=mainEventIdentifier%>";
	document.forms[0].submit();
}

function showDetail() {
	document.forms[0].action = "MIAADetail.do?event=view_list_other_covenants&mainEventIdentifier=<%=mainEventIdentifier%>";
	document.forms[0].submit();
}

  function goPreviousPage() {
    document.forms[0].action = "MICustomerSearch.do?event=list_customer";
    document.forms[0].submit();
  }
//-->
</script>

<html:form  action="MIAADetail.do?">
<input type="hidden" name="aaID" value="<%=aaID%>"/>
<input type="hidden" name="TrxId" value="<%=trxId%>"/>

<bean:define id="formObj" name="AADetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.aa.AADetailForm"/>
<table width="90%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>

</table>
  <table border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tbody>
      <tr>
        <td align="right">&nbsp;</td>
      </tr>
      <tr>
        <td align="right"><font color="#FF0000">*</font>Mandatory for Submission</td>
      </tr>
      <% if( cannotDeleteAA != null ) {
      		isDelete = true; 
      %>
		<tr>
        <td align="left"><font color="#FF0000" size="1">This AA cannot be deleted.</font></td>
      </tr>      
      <% } %>
    </tbody>
  </table>

  <%@ include file="/manualinput/aa/view_customer_party_info.jsp"%>

<table width="90%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<tr align="left">
<td width="25%" colspan="1">
						<% if(isUserCpcMaker) {%>
						<input onclick="javascript : showDetail()"
							name="AddNew12" type="button" id="AddNew12" value="Other Covenant"
							class="btnNormal" />
						<%}else{%>
						<input onclick="javascript : showDetail2()"
							name="AddNew12" type="button" id="AddNew12" value="Other Covenant"
							class="btnNormal" />
						<%}%>
						</td></tr><tr>
						<tr>
						<td>
						<% if(event.equals("check_list_other_covenants")){%>		
						    <jsp:include page="checker_list_other_covenants.jsp"></jsp:include>
						<%}%>
						<% if(event.equals("list_other_covenants")){%>		
						    <jsp:include page="list_other_covenants.jsp"></jsp:include>
						<%}%>
					</td></tr>
</table>


  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
      <tr>
        <td><h3>CAM Details</h3></td>
        <%if(isView&&!isDeleted&&canEdit){%>
        <td align="right" valign="baseline">
        <%if(isUserCpcMaker) { %>
          	<input class="btnNormal" type="button" name="edit_aa" value="Edit" onclick="javascript:submitPage(1)"/>
          <%}%>
        </td>
        <%}%>
      </tr>
      <tr>
        <td colspan="2"><hr/></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <%
        	    int rowIdx = 0;
				Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
            %>
            <tbody>
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">CAM Type<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="camType"/>&nbsp;</td>
                <td class="fieldname" width="20%">CAM No.<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="aaNum"/>&nbsp;</td>
              </tr>    

              <tr class="even">
                <td class="fieldname" width="20%">CAM Date<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="aaApprovalDate"/>&nbsp;</td>
                <td class="fieldname" width="20%">CAM Login Date<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="camLoginDate"/>&nbsp;</td>
              </tr>
<!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->      
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">RAM Rating<font color="#FF0000">*</font></td>
                <%if(aForm.getRamRating()!=null && !"".equals(aForm.getRamRating())){ %>
                <td width="30%"><%=aForm.getRamRating() %>&nbsp;</td>
                <%}else{ %>
                 <td width="30%">-&nbsp;</td>
                <%} %>
                <td class="fieldname">RAM Rating Year<font color="#FF0000">*</font></td>
                <%if(aForm.getRamRatingYear()!=null && !"".equals(aForm.getRamRatingYear())){ %>
                	<td width="30%"><%=aForm.getRamRatingYear() %>&nbsp;</td>
                <%}else{ %>
                <td width="30%">-&nbsp;</td>
                <%} %>
              </tr>    
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
						<td class="fieldname">Rating Type<font color="#FF0000">*</font></td>
							 <%String strType = aForm.getRamRatingType();%>
               <%if(strType!=null && !strType.equals("")){ %>
            <td><integro:common-code-single entryCode="<%=strType%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.CommonCode_SEC_RATING_TYPE%>" descWithCode="false" /></td>
            <%}else{ %>
             <td>-</td>
            <%} %>
                <td class="fieldname">RAM Rating Finalization Date</td>
                <%if(null!=aForm.getRamRatingFinalizationDate() && !"".equals(aForm.getRamRatingFinalizationDate())){ %>
                	<td width="30%"><%=aForm.getRamRatingFinalizationDate() %>&nbsp;</td>
                <%}else{ %>
                <td width="30%">-&nbsp;</td>
                <%} %>
              </tr>    
<!--End by Pramod Katkar-->
              <tr class="even">
                <td class="fieldname" width="20%">Expiry Date<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="annualReviewDate"/>&nbsp;</td>
                <td class="fieldname" width="20%">Extension Date<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="extendedNextReviewDate"/>&nbsp;</td>
              </tr>
              
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Number of times extended<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="noOfTimesExtended"/>&nbsp;</td>
                <td class="fieldname" width="20%">Total CAM Sanctioned Amount (INR)<font color="#FF0000">*</font></td>
                <td width="30%"> 
                	<integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),obCMSCustomer.getTotalSanctionedLimit())%>" />	
                </td>
              </tr>    

              <tr class="even">
                <td class="fieldname" width="20%">Relationship Manager<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%= relationShipMgrName %>"/></td>
                <td class="fieldname" width="20%">Controlling Branch<font color="#FF0000">*</font></td>
                <td width="30%"><integro:empty-if-null value="<%= branchName %>"/>&nbsp;</td>
              </tr>
              <tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td class="fieldname" width="20%">Fully Cash Collateral</td>
							<td width="30%" >
									<html:checkbox property="fullyCashCollateral" disabled="true"/>
								</td>
							<td class="fieldname" width="20%">Total Release Amount Facility Level(INR)</td>
							<td width="30%">
									<!--bean:write name="AADetailForm" property="totalSanctionedAmountFacLevel"/>&nbsp; -->
									<integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),aForm.getTotalSanctionedAmountFacLevel())%>" />
							</td>
			</tr>	
              
               			<tr class="odd">
							<td class="fieldname">Committee Approval</td>
							<td><html:checkbox property="committeApproval" disabled="true"/></td>
							<td class="fieldname">Board Approval</td>
							<td><html:checkbox property="boardApproval" disabled="true"/></td>
						</tr>
						<tr class="even">
							<td class="fieldname">Credit Approvers 1</td>
							<td class="even"><span class="odd"> 
							<html:select property="creditApproval1"	value="<%=aForm.getCreditApproval1() %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> </span></td>
							
							<td class="fieldname">Credit Approvers 4</td>
							<td class="even"><span class="odd"> <html:select
								property="creditApproval4"
								value="<%=aForm.getCreditApproval4() %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> 
							</span> </td>
							
						</tr>
						<tr class="even">
						<td class="fieldname">Credit Approvers 2</td>
							<td><span class="odd"> 
							<html:select property="creditApproval2"	value="<%=aForm.getCreditApproval2() %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> </span></td>
							<td class="fieldname">Credit Approvers 5</td>
							<td class="even"><span class="odd"> <html:select
								property="creditApproval5"
								value="<%=aForm.getCreditApproval5() %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> 
							</span></td>
							
						</tr>
						<tr class="even">
						<td class="fieldname">Credit Approvers 3</td>
							<td class="even"><span class="odd"> <html:select	property="creditApproval3"
								value="<%=aForm.getCreditApproval3() %>" disabled="true">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> 
							</span> </td>
						<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						 <tr class="even">
						  <td class="fieldname" width="20%">RBI Asset  Classification<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="rbiAssetClassification"/>&nbsp;</td>
                <td class="fieldname" width="20%">Asset Classification<font color="#FF0000">*</font></td>
                <td width="30%"><bean:write name="AADetailForm" property="assetClassification"/>&nbsp;</td>
               
              </tr>
              <!--  Start:Uma Khot:CRI Field addition enhancement  -->
              <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Whether Special Approval Grid Requirement Applicable For Customer Rated Below HDB8</td>
                <td>
					<%if(formObj.getIsSpecialApprGridForCustBelowHDB8() != null && formObj.getIsSpecialApprGridForCustBelowHDB8().equals("Yes")){ %>
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsSpecialApprGridForCustBelowHDB8() == null || formObj.getIsSpecialApprGridForCustBelowHDB8().equals("No")){ %>
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
				<td class="fieldname" width="20%"></td>
                <td width="30%">&nbsp;</td>
              </tr> 
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%" rowspan="2">Non Cooperative Borrowers</td>
                <td rowspan="2">
					<%if(formObj.getIsNonCooperativeBorrowers() != null && formObj.getIsNonCooperativeBorrowers().equals("Yes")){ %>
					<input type="radio" name="isNonCooperativeBorrowers" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isNonCooperativeBorrowers" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsNonCooperativeBorrowers() == null || formObj.getIsNonCooperativeBorrowers().equals("No")){ %>
					<input type="radio" name="isNonCooperativeBorrowers" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isNonCooperativeBorrowers" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
				<td class="fieldname" width="20%">1) Is any Director (other than Nominee Director) declared As Non Cooperative for any other company</td>
				<td>
					<%if(formObj.getIsDirectorAsNonCooperativeForOther() != null && formObj.getIsDirectorAsNonCooperativeForOther().equals("Yes")){ %>
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsDirectorAsNonCooperativeForOther() == null || formObj.getIsDirectorAsNonCooperativeForOther().equals("No")){ %>
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
				</tr>
                <tr class="even">
               <!-- <td class="fieldname" width="20%">&nbsp;</td><td >&nbsp;</td>-->
                <td class="fieldname" width="20%">2) Name of Directors and Company</td>
                <td><html:textarea name="AADetailForm" rows="4" cols="55" property="nameOfDirectorsAndCompany" readonly="TRUE"/>
				</td>
              </tr> 
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Within Single Borrower Prudential Ceiling</td>
                <td>
					<%if(formObj.getIsSingleBorrowerPrudCeiling() == null || formObj.getIsSingleBorrowerPrudCeiling().equals("Yes")){ %>
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsSingleBorrowerPrudCeiling() != null && formObj.getIsSingleBorrowerPrudCeiling().equals("No")){ %>
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
                <td class="fieldname" width="20%">Provide details of RBI/Board approval Obtained/ or in the course of being obtained</td>
                
                <td width="30%">
               		 				<html:select property="rbiApprovalForSingle" style="width:225"
												styleId="rbiApprovalForSingle" disabled="true" value="<%=formObj.getRbiApprovalForSingle()%>">
											<integro:common-code categoryCode="<%=CategoryCodeConstant.RBI_APPROVAL %>" descWithCode="false" />
									</html:select>
                
                <br><br>
                <html:textarea name="AADetailForm" rows="2" cols="55" property="detailsOfRbiApprovalForSingle" readonly="TRUE"/>&nbsp;
                </td>
              </tr> 
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="fieldname" width="20%">Within Group Borrower Prudential Ceiling</td>
                <td>
					<%if(formObj.getIsGroupBorrowerPrudCeiling() == null || formObj.getIsGroupBorrowerPrudCeiling().equals("Yes")){ %>
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="Yes" checked="checked" disabled="disabled"/> Yes
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="No" disabled="disabled"/> No
					<%} %>
					<%if(formObj.getIsGroupBorrowerPrudCeiling() != null && formObj.getIsGroupBorrowerPrudCeiling().equals("No")){ %>
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="Yes" disabled="disabled"/> Yes
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="No" checked="checked" disabled="disabled"/> No
					<%} %>
				</td>
                <td class="fieldname" width="20%">Provide details of RBI/Board approval Obtained/ or in the course of being obtained</td>
                
                <td width="30%">
                			<html:select property="rbiApprovalForGroup" style="width:225"
												styleId="rbiApprovalForGroup" disabled="true" value="<%=formObj.getRbiApprovalForGroup()%>">
											<integro:common-code categoryCode="<%=CategoryCodeConstant.RBI_APPROVAL %>" descWithCode="false" />
							</html:select>
                <br><br>
                <html:textarea name="AADetailForm" rows="2" cols="55" property="detailsOfRbiApprovalForGroup" readonly="TRUE" />&nbsp;
                </td>
              </tr> 
  			 <!--  End:Uma Khot:CRI Field addition enhancement  -->
              <tr>
              <td colspan="4">
               <table width="100%"  border="0" align="center" cellspacing="0" cellpadding="0" class="tblInput">
                <tbody>
                <tr>
                <td class="fieldname">Remarks</td>
                <td class="odd">
                	<html:textarea name="AADetailForm" rows="5" cols="120" 
                	property="docRemarks" readonly="TRUE" 
                	onkeyup="limitTextInput(this,1600,'Narration')"/></br>
                    <html:errors property="remarks" />
                </td>
                </tr>
                </tbody>
            </table>
            </td>
            </tr>

            </tbody>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </tbody>
  </table>

  <% 
    if(isMr){
  %>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
      <tr>
        <td><h3>Trading Agreement Details</h3></td>
      </tr>
      <tr>
        <td colspan="2"><hr/></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td colspan="2">
          <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
            <thead>
              <tr class="tblInfo">
                <td class="fieldname" width="10%">S/N</td>
                <td class="fieldname" width="20%">Agreement Type</td>
                <td class="fieldname" width="20%">Minimum Transfer Amount</td>
                <td class="fieldname" width="20%">Base Currency</td>
                <td class="fieldname" width="20%">Counterparty Threshold Amount</td>
                <td class="fieldname" width="10%">Action</td>
              </tr>
            </thead>
            <tbody>
              <%ITradingAgreement agreementParameters = null;
              if(parameters != null){
                agreementParameters = parameters.getTradingAgreement();
              }

              if(agreementParameters == null){%>
              <tr class="even">
                <td colspan="6"><bean:message key="label.global.not.found"/></font></td>
              </tr>    
            <%}else{%>
              <tr class="even">
                <td class="index">1&nbsp;</font></td>
                <td>
                  <%String agreementType = null;
                    if(! ( agreementParameters.getAgreementType() == null || agreementParameters.getAgreementType() == "" ) ){
                      agreementType = AgreementTypeList.getInstance().getAgreementTypeName(agreementParameters.getAgreementType());
                    }%>
                  <integro:empty-if-null value="<%=agreementType%>"/>&nbsp;</td> 
                <td><integro:amount param="all" amount="<%=agreementParameters.getMinTransferAmount()%>" decimal="4"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=agreementParameters.getBaseCurrency()%>"/>&nbsp;</td>
                <td><integro:amount param="all" amount="<%=agreementParameters.getCounterPartyThresholdAmount()%>" decimal="4"/>&nbsp;</td>
                <td><a href="javascript:viewAgreement()">View</a></td>
              </tr>
            <%}%>
            </tbody>
          </table>
        </td>
      </tr>

      <tr>
        <td colspan="2">&nbsp;</td>
      </tr>
    </tbody>
  </table>
  <%
    }
  %>

  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" >
    <tbody>
      <tr>
        <td>
        <%if(isRejected && event.equalsIgnoreCase("maker_delete_aadetail_reject")) {
            String paramUID = obTrxValue.getUserInfo();
            String paramRemarks = obTrxValue.getRemarks();
            if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
              paramRemarks=" ";
            }%>
          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
              <tr>
                <td width="43%" class="fieldname">Remarks</td>
                <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
              </tr>
              <tr>
                <td class="fieldname">Last Action By</td>
                <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>
              </tr>
              <tr class="odd">
                <td class="fieldname">Last Remarks Made</td>
                <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
              </tr>
            </tbody>
          </table>
        <%}%>
        </td>
      </tr>

      <tr>
        <td>&nbsp;</td>
      </tr>
      	<tr>
				<td><udf:udfDisplay module="cam" action="view"/></td>
	</tr>
	 <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td> <jsp:include page="cam_images_list.jsp"></jsp:include></td>
      </tr>
     <tr>
        <td> &nbsp;</td>
      </tr>
      <tr>
        <td> &nbsp;</td>
      </tr>
        <tr>
     <%if(!event.equals("to_track")){%>
        <tr>
        <td> <jsp:include page="view_audit_details.jsp"></jsp:include></td>
      </tr>
      <%} %>
    </tbody>
  </table>

  <table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
  
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <% 
        if(isDelete){
      %>
      <td>
        <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/delete2.gif',1)">
          <img src="img/delete1.gif" name="Image142" width="75" height="22" border="0" id="Image142" />
        </a>
      </td>
      <td>
        <a href="<%=isRejected?"ToDo.do": "javascript:goPreviousPage()"%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)">
          <img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" />
        </a>
      </td> 
      <%
        }else if(isClose){
      %>
      <td>
        <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image142','','img/close2a.gif',1)">
          <img src="img/close1a.gif" name="Image142" width="75" height="22" border="0" id="Image142" />
        </a>
      </td>
      <td>
        <a href="<%=isRejected?"ToDo.do": "javascript:goPreviousPage()"%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)">
          <img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" />
        </a>
      </td> 
      <%
        }else if("to_track".equals(event)){
      %>
       <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
      <%
        }else if(isView){
          if(!event.equalsIgnoreCase("maker_close_aadetail")){
            isRejected = false;
          }
      %>
      <td>
        <a href="<%=isRejected?"ToDo.do": "javascript:goPreviousPage()"%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/return2.gif',1)">
          <img src="img/return1.gif" name="Image51" width="70" height="20" border="0" id="Image51" />
        </a>
      </td> 
      <%
        }
      %>
    </tr>
  </table>
</html:form>
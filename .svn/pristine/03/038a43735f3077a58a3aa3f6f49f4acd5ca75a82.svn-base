<%@ page
	import="java.util.*,java.text.*,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.common.constant.ICompConstant,
	com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.base.uiinfra.common.ICommonEventConstant,
	com.integrosys.cms.app.limit.bus.ILimitProfile,com.integrosys.cms.app.limit.bus.ITradingAgreement,
	com.integrosys.cms.app.limit.trx.OBLimitProfileTrxValue,com.integrosys.cms.ui.common.AgreementTypeList,com.integrosys.cms.ui.common.CountryList,
	org.apache.struts.util.LabelValueBean,com.integrosys.cms.ui.common.CommonCodeList,java.text.SimpleDateFormat,
	com.integrosys.cms.ui.collateral.CategoryCodeConstant,
	java.text.DecimalFormat"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/UdfTag.tld" prefix="udf"%>
<%
	/**
	 * Copyright Integro Technologies Pte Ltd
	 * $Header: $
	 *
	 * Describe this JSP.
	 * Purpose: For Maker edit or create the AA Information
	 * Description:  edit or create AA Information by Maker
	 *
	 * @author $Author: jerlin $<br>
	 * @version $Revision:$
	 * @since $Date: $
	 * Tag: $Name:  $
	 */
	String context = request.getContextPath() + "/";
%>
<%
	ITeam userTeam = (ITeam) session
	.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.USER_TEAM);
	long oneTeamMshipID = userTeam.getTeamMemberships()[0]
	.getTeamTypeMembership().getMembershipID();
	long teamTypeID = userTeam.getTeamType().getTeamTypeID();
	boolean isMr = false;
	String aaType = ICMSConstant.AA_TYPE_BANK;

	if (oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_MAKER
	|| oneTeamMshipID == ICMSConstant.TEAM_TYPE_MR_CHECKER) {
		isMr = true;
		aaType = ICMSConstant.AA_TYPE_TRADE;
	}
	String duplicateAANo = (String) request
	.getAttribute("duplicateAANo");

	String agreementNull = null;//request.getParameter("agreementNull");
	String preEvent = request.getParameter("preEvent");
	String indexChange = "";
	String mainEventIdentifier = "";
	String customerID;
	int ind = 0;
	String event = request.getParameter("event");
	if (	
			event.equals("maker_edit_aadetail")
			|| event.equals("maker_edit_aadetail_confirm")
			|| event.equals("maker_edit_aadetail_confirm_error")
			|| "return_maker_edit_aadetail_reject".equals(event)
			|| event.equals("return_edit_Other_Covenant_List_to_AA_confirm_error")
			|| "return_maker_edit_aadetail".equals(event)
			|| event.equals("refresh_maker_edit_aadetail")
			|| event.equals("return_edit_Other_Covenant_List_to_AA")
			|| event.equals("maker_edit_aadetail_reject_confirm_error")
			|| event.equals("maker_edit_aadetail_reject")
			|| event.equals("refresh_maker_edit_aadetail_reject")
		)
		mainEventIdentifier = "maker_edit_aadetail";
	else if (event.equals("maker_add_aadetail")
			|| event.equals("return_Other_Covenant_List_to_AA_confirm")
			|| event.equals("return_Other_Covenant_List_to_AA_confirm_error")
			|| event.equals("refresh_maker_add_aadetail")
			|| event.equals("maker_add_aadetail_confirm_error")
			|| event.equals("return_Other_Covenant_List_to_AA"))
		mainEventIdentifier = "maker_add_aadetail";
	String trxId = request.getParameter("TrxId");
	pageContext.setAttribute("mainEventIdentifier",
			mainEventIdentifier);

	System.out.println("mainEventIdentifier----------------->>"
			+ mainEventIdentifier);

	if (event.equals("return_Other_Covenant_List_to_AA")
			|| event.equals("return_edit_Other_Covenant_List_to_AA")) {
		customerID = (String) session.getAttribute(
				"com.integrosys.cms.ui.manualinput.aa.AADetailAction.customerID");
		System.out
				.println("customerID----------------->>" + customerID);
		pageContext.setAttribute("customerID", customerID);
	} else {
		customerID = request.getParameter("customerID");
		System.out.println("////////////////************** customerID-"
				+ customerID);
		pageContext.setAttribute("customerID", customerID);
	}
	System.out.println(
			"////////////////************** event111111111111111-"
					+ event);
	
	List otherCovenantDetailsList = (List) session.getAttribute(
			"com.integrosys.cms.ui.manualinput.aa.AADetailAction.otherCovenantDetailsList");
	if (otherCovenantDetailsList != null) {
		//System.out.println("otherCovenantDetailsList----------------->>"+ otherCovenantDetailsList);
		pageContext.setAttribute("otherCovenantDetailsList",
				otherCovenantDetailsList);
	} else {
		//System.out.println("In ELSE");
		otherCovenantDetailsList = new ArrayList();
		pageContext.setAttribute("otherCovenantDetailsList",
				otherCovenantDetailsList);
	}
	if (event.equals("remove_agreement")) {
		event = request.getParameter("preEvent");
	}

	if (event.equals("maker_add_aadetail_confirm")
			|| event.equals("maker_add_aadetail")) {
		preEvent = "maker_add_aadetail";
		agreementNull = (String) request.getAttribute("agreementNull");
	} else if (event.equals("maker_edit_aadetail_confirm")
			|| event.equals("maker_edit_aadetail")) {
		preEvent = "maker_edit_aadetail";
		agreementNull = (String) request.getAttribute("agreementNull");
	} else if (event.equals("maker_edit_aadetail_reject_confirm")
			|| event.equals("maker_edit_aadetail_reject")) {
		preEvent = "maker_edit_aadetail_reject";
		agreementNull = (String) request.getAttribute("agreementNull");
	}

	if (request.getParameter("indexChange") != null) {
		indexChange = request.getParameter("indexChange");
		ind = Integer.parseInt(indexChange) + 1;

	} else {
		indexChange = "0";
		ind = Integer.parseInt(indexChange) + 1;
	}

	ILimitProfile parameters = null;
	Object obj = session.getAttribute(
			"com.integrosys.cms.ui.manualinput.aa.AADetailAction.limitProfileTrxVal");

	System.out.println(
			"--------------------------------------------->limitProfileTrxVal:----"
					+ obj);
	com.integrosys.cms.ui.manualinput.aa.AADetailForm aForm = (com.integrosys.cms.ui.manualinput.aa.AADetailForm) request
			.getAttribute("AADetailForm");
	OBLimitProfileTrxValue obTrxValue = null;
	boolean entries_editable = false;
	boolean isRejected = false;

	String migratedFlag = "N";
	migratedFlag = (String) session.getAttribute(
			"com.integrosys.cms.ui.manualinput.aa.AADetailAction.migratedFlag");
	if (migratedFlag == null) {
		migratedFlag = "N";
	}

	String relationShipMgrName = (String) session.getAttribute(
			"com.integrosys.cms.ui.manualinput.aa.AADetailAction.relationShipMgrName");

	String regionName = (String) session.getAttribute(
			"com.integrosys.cms.ui.manualinput.aa.AADetailAction.regionName");

	String branchName = (String) session.getAttribute(
			"com.integrosys.cms.ui.manualinput.aa.AADetailAction.branchName");

	Collection riskGradeList = (Collection) session.getAttribute(
			"com.integrosys.cms.ui.manualinput.aa.AADetailAction.riskGradeList");
	request.setAttribute("riskGradeList", riskGradeList);
	List creditAprrovalList = (List) session.getAttribute(
			"com.integrosys.cms.ui.manualinput.aa.AADetailAction.creditAprrovalList");
	pageContext.setAttribute("creditAprrovalList", creditAprrovalList);

	if (obj != null) {
		DefaultLogger.debug(this,
				"@@@Debug:::1 FROM JSP got session.limitProfileTrxVal");
		obTrxValue = (OBLimitProfileTrxValue) obj;
		DefaultLogger.debug(this,
				"ob.getStatus() = " + obTrxValue.getStatus());
		DefaultLogger.debug(this, "getStagingLimitProfile() = "
				+ obTrxValue.getStagingLimitProfile());

		DefaultLogger.debug(this,
				"getLimitProfile()= " + obTrxValue.getLimitProfile());

		// check whether the currentStatus is REJECTED
		String status = "";
		if (obTrxValue.getStatus().length() > 8) {
			status = obTrxValue.getStatus().substring(0, 8);
		} else {
			status = obTrxValue.getStatus();
		}
		isRejected = ICompConstant.STATE_REJECTED.equals(status);//true;

		// Entries are editable only if the record is ACTIVE.
		if (ICompConstant.STATE_ACTIVE.equals(obTrxValue.getStatus())
				|| isRejected) {
			entries_editable = true;
		}

		if (event.equalsIgnoreCase("maker_edit_aadetail_reject")
				|| Integer.parseInt(indexChange) > 0) {
			parameters = obTrxValue.getStagingLimitProfile();
		} else {
			parameters = obTrxValue.getLimitProfile();
		}

		if (parameters != null) {
			DefaultLogger.debug(this,
					"@@@Debug:::2 FROM JSP parameters = " + parameters);
		}

	} else {
		DefaultLogger.debug(this,
				"@@@Debug::: FROM JSP got NULL in session.'limitProfileTrxVal' ");
	}

	String aaId = null;
	if (parameters != null) {
		aaId = String.valueOf(parameters.getLimitProfileID());
	}
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MMM/yyyy");

	//Start:Code added for Total Sanctioned Amount For Facility
	String totalSanctionedAmtFac = (String) session.getAttribute(
			"com.integrosys.cms.ui.manualinput.aa.AADetailAction.totalSanctionedAmtFac");

	totalSanctionedAmtFac = UIUtil
			.formatWithCommaAndDecimal(totalSanctionedAmtFac);
	System.out
			.println("totalSanctionedAmtFac:" + totalSanctionedAmtFac);
	//End  :Code added for Total Sanctioned Amount For Facility
%>



<%@page import="com.integrosys.cms.ui.common.UIUtil"%><link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="js/date.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/udf.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
  function submitPage(num) {
    enableAllFormElements();
    if (num == 1) {
      document.forms[0].action = "MIAADetail.do?event=maker_edit_aadetail&indexChange=<%=indexChange%>";

    }else if(num==2){
      if('<%=event.substring(0, 7)%>' == 'refresh'){
        document.forms[0].action = "MIAADetail.do?event=add_agreement&indexChange=<%=indexChange%>&preEvent=<%=event.substring(8, event.length())%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";

      }else if('<%=event%>' == 'maker_edit_aadetail_confirm' || '<%=event%>' == 'maker_edit_aadetail_reject_confirm' || 
               '<%=event%>' == 'maker_add_aadetail_confirm'){
        document.forms[0].action = "MIAADetail.do?event=add_agreement&indexChange=<%=indexChange%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";

      }else{
        document.forms[0].action = "MIAADetail.do?event=add_agreement&indexChange=<%=indexChange%>&preEvent=<%=event%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
      }

    }else if(num==3){
      if('<%=event.substring(0, 7)%>' == 'refresh'){
        document.forms[0].action = "MIAADetail.do?event=remove_agreement&indexChange=<%=indexChange%>&preEvent=<%=event.substring(8, event.length())%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";

      }else if('<%=event%>' == 'maker_edit_aadetail_confirm' || '<%=event%>' == 'maker_edit_aadetail_reject_confirm' || 
               '<%=event%>' == 'maker_add_aadetail_confirm'){
        document.forms[0].action = "MIAADetail.do?event=remove_agreement&indexChange=<%=indexChange%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";

      }else{
        document.forms[0].action = "MIAADetail.do?event=remove_agreement&indexChange=<%=indexChange%>&preEvent=<%=event%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
      }

    }else if(num==4){
      if('<%=event.substring(0, 7)%>' == 'refresh'){
        document.forms[0].action = "MIAADetail.do?event=<%=event.substring(8, event.length())%>_confirm&indexChange=<%=indexChange%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";

      }else if('<%=event%>' == 'maker_edit_aadetail_confirm' || '<%=event%>' == 'maker_edit_aadetail_reject_confirm' || '<%=event%>' == 'return_Other_Covenant_List_to_AA_confirm' || 
               '<%=event%>' == 'maker_add_aadetail_confirm'){
        document.forms[0].action = "MIAADetail.do?event=<%=event%>&indexChange=<%=indexChange%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";

      }else{
        document.forms[0].action = "MIAADetail.do?event=<%=event%>_confirm&indexChange=<%=indexChange%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
      }

    }else if(num==5){
      if('<%=event.substring(0, 7)%>' == 'refresh'){
        document.forms[0].action = "MIAADetail.do?event=edit_agreement&indexChange=<%=indexChange%>&preEvent=<%=event.substring(8, event.length())%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";

      }else if('<%=event%>' == 'maker_edit_aadetail_confirm' || '<%=event%>' == 'maker_edit_aadetail_reject_confirm' || 
               '<%=event%>' == 'maker_add_aadetail_confirm'){
        document.forms[0].action = "MIAADetail.do?event=edit_agreement&indexChange=<%=indexChange%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";

      }else{
        document.forms[0].action = "MIAADetail.do?event=edit_agreement&indexChange=<%=indexChange%>&preEvent=<%=event%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
      }

    }
    var fullyColl = document.getElementById("fullyCashCollateral1").checked;
    if(fullyColl == true){
        document.getElementById("fullyCashCollateral1").value = "on";
        document.getElementById("fullyCashCollateralN").value = "on";
    }
    if(fullyColl == false){
       document.getElementById("fullyCashCollateral1").value = "";
        document.getElementById("fullyCashCollateralN").value = "";
    }

var committeAp = document.getElementById("committeApproval1").checked;
if(committeAp == true){
    document.getElementById("committeApproval1").value = "on";
    document.getElementById("committeApprovalN").value = "on";
}
if(committeAp == false){
    document.getElementById("committeApproval1").value = "";
    document.getElementById("committeApprovalN").value = "";
}

//640change1

     var BoardApp = document.getElementById("boardApproval1").checked;
     if(BoardApp == true){
         document.getElementById("boardApproval1").value = "on";
         document.getElementById("boardApprovalN").value = "on";
     }
     if(BoardApp == false){
        document.getElementById("boardApproval1").value = "";
         document.getElementById("boardApprovalN").value = "";
     }
      document.forms[0].submit();
  }

  function changeBookingOrganisation(dropdown) {
	var curSel = "";
	for(i=0; i<dropdown.options.length; i++)
	{
		if (dropdown.options[i].selected == true)
		{
			curSel = dropdown.options[i].value;	
			break;
		}
	}	
    if('<%=event.substring(0, 7)%>' == 'refresh'){
   
      document.forms[0].action = "MIAADetail.do?event=refresh_<%=preEvent%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>&bookingCty="+curSel;
    }
    else if('<%=event%>' == 'maker_add_aadetail_confirm' 
			|| '<%=event%>' == 'maker_edit_aadetail_confirm'
			|| '<%=event%>' == 'maker_edit_aadetail_reject_confirm'  ){
      document.forms[0].action = "MIAADetail.do?event=refresh_<%=preEvent%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>&bookingCty="+curSel;
    }
    else{
      document.forms[0].action = "MIAADetail.do?event=refresh_<%=event%>&indexChange=<%=ind%>&preEvent=<%=preEvent%>&TrxId=<%=trxId%>&customerID=<%=customerID%>&bookingCty="+curSel;
    }
    document.forms[0].submit();
  }

  function showDetail(){
		document.forms[0].action="MIAADetail.do?event=list_other_covenants&mainEventIdentifier=<%=mainEventIdentifier%>";
	    document.forms[0].submit();
	}
  
  function showDetail2(){
		document.forms[0].action="MIAADetail.do?event=list_other_covenants_edit&mainEventIdentifier=<%=mainEventIdentifier%>";
	    document.forms[0].submit();
	}
  
  function goPreviousPage() {
    if('<%=event%>' == 'maker_edit_aadetail'){
      document.forms[0].action = "MIAADetail.do?event=view&aaID=<%=aaId%>&customerID=<%=customerID%>";
    }else{
      document.forms[0].action = "MICustomerSearch.do?event=list_customer";
    }
    document.forms[0].submit();
  }

  function refreshCamDateDetails()
  {
	 // alert(document.getElementById("camType").value);
	  if(document.getElementById("camType").value=='Initial' || document.getElementById("camType").value=='Annual'){
	   var curSel = 0 ;
	   var strSel = "" ;
   		var date = document.getElementById("aaApprovalDate").value;
   		if(isNaN(date)){
   		originalDate = convertStrToDate(date);
   		nextDate = calculateNextDate(originalDate, 1, 'Y');
   		strExpDate = convertDateToStr(nextDate);
   		document.getElementById("annualReviewDate").value=strExpDate; 
   		nextDate.add(Date.DAY, +1);
   		strExpDate = convertDateToStr(nextDate);
   		document.getElementById("extendedNextReviewDate").value=strExpDate; 
   		}
   		else
   		{
   			document.getElementById("annualReviewDate").value=""; 
   			document.getElementById("extendedNextReviewDate").value=""; 
   	   		}
	  }
  }	

  function changeCamLoginDate() {
	 
	  	var date = document.getElementById("camLoginDate").value;
	  	var camType = document.getElementById("camType").value;
	  	document.getElementById("camTypeHidden").value= camType;
	  	document.getElementById("camLoginDate").value ='<%= formatter.format(new java.util.Date()) %>';
	  
  }

 // Start:Uma Khot:CRI Field addition enhancement
 
  function enableDirectorAsNonCooperative(){
		if(document.all.isNonCooperativeBorrowers[0].checked){
			document.getElementById('isDirectorAsNonCooperativeForOther').disabled = false;
		}else{
			document.all.isDirectorAsNonCooperativeForOther[1].checked=true;
			document.getElementById('isDirectorAsNonCooperativeForOther').disabled = true;
			document.getElementById('nameOfDirectorsAndCompany').value = '';
		}
		
	 }

  function enablenameOfDirectorsAndCompany(){
		if(document.all.isDirectorAsNonCooperativeForOther[0].checked){
			document.getElementById('nameOfDirectorsAndCompany').disabled = false;
		}else{
			document.getElementById('nameOfDirectorsAndCompany').value = '';
			document.getElementById('nameOfDirectorsAndCompany').disabled = true;
		
		}
		
	 }
	 
 function enableRbiApprovalSingle(){
	if(document.all.isSingleBorrowerPrudCeiling[0].checked){
		document.getElementById('detailsOfRbiApprovalForSingle').value = '';
		document.getElementById('detailsOfRbiApprovalForSingle').disabled = true;
		document.getElementById('rbiApprovalForSingle').disabled = true;
		document.getElementById('rbiApprovalForSingle').value = '';
	}else{
		 alert(" Board / RBI approval is required. ");
		document.getElementById('detailsOfRbiApprovalForSingle').disabled = false;
		document.getElementById('rbiApprovalForSingle').disabled = false;
	}
	
 }

 function enableRbiApprovalGroup(){
	 	if(document.all.isGroupBorrowerPrudCeiling[0].checked){
			document.getElementById('detailsOfRbiApprovalForGroup').value = '';
			document.getElementById('detailsOfRbiApprovalForGroup').disabled = true;
			document.getElementById('rbiApprovalForGroup').disabled = true;
			document.getElementById('rbiApprovalForGroup').value = '';
		}else{
			 alert(" Board / RBI approval is required. ");
			document.getElementById('detailsOfRbiApprovalForGroup').disabled = false;
			document.getElementById('rbiApprovalForGroup').disabled = false;
		}
	 }

 
 function changeCheckbocCommitApproval(val){
	 var committeAppr = document.getElementById("committeApproval1").value;
	 var committeAppr11 = document.getElementById("committeApproval1").checked;
	 if(committeAppr11 == true){
		 document.getElementById("committeApproval1").value = "on";
		 document.getElementById("committeApprovalN").value = "on";
	 }
	 if(committeAppr11 == false){
		 document.getElementById("committeApproval1").value = "";
		 document.getElementById("committeApprovalN").value = "";
	 }
	}

 function changeCheckbocFullyCashCollateral(val){

	      var fullyCollat = document.getElementById("fullyCashCollateral1").value;
	      var fullyCollat = document.getElementById("fullyCashCollateral1").checked;
	      if(fullyCollat == true){
	          document.getElementById("fullyCashCollateral1").value = "on";
	          document.getElementById("fullyCashCollateralN").value = "on";
	      }
	      if(fullyCollat == false){
	         document.getElementById("fullyCashCollateral1").value = "";
	          document.getElementById("fullyCashCollateralN").value = "";
	      }
	}
			
 function changeCheckbocBoardApproval(val){

	      var BoardApp = document.getElementById("boardApproval1").value;
	      var BoardApp = document.getElementById("boardApproval1").checked;
	      if(BoardApp == true){
	          document.getElementById("boardApproval1").value = "on";
	          document.getElementById("boardApprovalN").value = "on";
	      }
	      if(BoardApp == false){
	         document.getElementById("boardApproval1").value = "";
	          document.getElementById("boardApprovalN").value = "";
	      }

	}										   
 // End:Uma Khot:CRI Field addition enhancement
 
//-->
</script>

<html:form action="MIAADetail.do?">
	<html:hidden property="aaType" value="<%=aaType%>" />
	<html:hidden property="aaID" value="<%=aaId%>" />
	<html:hidden property="bookingCty" value="IN" />
	
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
	<table  border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
		</thead>
		<tbody>
			<tr>
				<td align="right">&nbsp;</td>
			</tr>
			<tr>
				<td align="right"><font color="RED">*</font>Mandatory for
				Submission</td>
			</tr>
		</tbody>
	</table>

	<%@ include file="/manualinput/aa/view_customer_party_info.jsp"%>
	
	<table width="90%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
<% if(event.equals("maker_add_aadetail") || event.equals("return_Other_Covenant_List_to_AA")){%>
				<tr align="left">
<td width="25%" colspan="1"><input onclick="javascript : showDetail()"
							name="AddNew12" type="button" id="AddNew12" value="Other Covenant"
							class="btnNormal" />  
						</td></tr>
						<%}%>
						<% if(event.equals("maker_edit_aadetail") || event.equals("maker_add_aadetail_confirm")|| event.equals("maker_edit_aadetail_confirm") || (event.equals("maker_edit_aadetail_reject")) || event.equals("return_edit_Other_Covenant_List_to_AA") || event.equals("return_Other_Covenant_List_to_AA_confirm") || "return_maker_edit_aadetail".equals(event)){%>
				<tr align="left">
<td width="25%" colspan="1"><input onclick="javascript : showDetail2()"
							name="AddNew12" type="button" id="AddNew12" value="Other Covenant"
							class="btnNormal" />  
						</td></tr>
						<%}%>
						<% if(event.equals("list_other_covenants")){%>		
						    <jsp:include page="list_other_covenants.jsp"></jsp:include>
						<%}%>
					</td></tr>
</table>
	
	
	<table width="90%" border="0" align="center" cellpadding="0"
		cellspacing="0" >
		<thead>
			<tr>
				<td>
				<h3>CAM Details</h3>
				 
				</td>
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tblInfo">
					<%
						int rowIdx = 0;
					%>
					<tbody>
						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td class="fieldname" width="20%">CAM Type<font
								color="#FF0000">*</font></td>
							<td width="30%">
							
							<% String selectValue = "Initial";
							System.out.println("********************************** aForm.getCamType() "+aForm.getCamType());
							if( aForm.getCamType()==null || aForm.getCamType().equals("") ){
								selectValue ="Initial";								
								}
								else
								{
									selectValue=aForm.getCamType();								
								}
							System.out.println("********************************** selectValue "+selectValue);
								%>
								<%if(selectValue.equals("Interim") || selectValue.equals("Annual")){ %>
							<html:select property="camType" styleId="camType" onchange="changeCamLoginDate();"
								value="<%=selectValue%>" name="AADetailForm">
								<html:option value="">Please Select</html:option>
								<%
							//	if(obTrxValue==null){
								%>
								<!--<html:option value="Initial">Initial</html:option>
								--><%//}else{ if(obTrxValue.getLimitProfile()==null){ %>
							<!-- 	<html:option value="Initial">Initial</html:option>  -->
								<%//}else{ %>
								<html:option value="Interim">Interim</html:option>
								<html:option value="Annual">Annual</html:option>
								<%//}}  %>
							</html:select>
							<%}else{ %>
							<%if(event.equals("maker_add_aadetail")){ %>
							<html:select property="camType" styleId="camType" onchange="changeCamLoginDate();"
								value="<%=selectValue%>" name="AADetailForm">
								<html:option value="">Please Select</html:option>
								<%
							//	if(obTrxValue==null){
								%>
								<html:option value="Initial">Initial</html:option>
								<%//}else{ if(obTrxValue.getLimitProfile()==null){ %>
							<!-- 	<html:option value="Initial">Initial</html:option>  -->
								<%//}else{ %>
								
								<%//}}  %>
							</html:select>
							<%}else{ %>
							<html:select property="camType" styleId="camType" onchange="changeCamLoginDate();"
								value="<%=selectValue%>" name="AADetailForm">
								<html:option value="">Please Select</html:option>
								<%
							//	if(obTrxValue==null){
								%>
								<html:option value="Initial">Initial</html:option>
								<%//}else{ if(obTrxValue.getLimitProfile()==null){ %>
							<!-- 	<html:option value="Initial">Initial</html:option>  -->
								<%//}else{ %>
								<html:option value="Interim">Interim</html:option>
								<html:option value="Annual">Annual</html:option>
								<%//}}  %>
							</html:select>
							<%} %>
							<%} %>
							<html:errors property="camtype" /></td>
							<td class="fieldname" width="20%">CAM No.<font
								color="#FF0000">*</font></td>
						
							<td width="30%"><html:text property="aaNum" value="<%=aForm.getAaNum()%>" maxlength="18" />
						<br><html:errors property="aaNum" /> 
							<html:errors property="invalidCharacter" />
							 <html:errors property="spaceError" /> 
							 <%
						 		if (duplicateAANo != null) {
						 %> <font color="#FF0000" size="1">CAM No. is duplicate.</font>&nbsp;
													<%
								}
							%>
							</td>
						</tr>
						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							
							
								<td class="fieldname" width="20%">CAM Date<font
								color="#FF0000">*</font></td>
							<td width="30%"><html:text property="aaApprovalDate" styleId="aaApprovalDate"
								readonly="true" onchange="javascript:refreshCamDateDetails();changeCamLoginDate();" />
							<img src="img/calendara.gif" name="Image724" border="0"
								id="Image724"
								onclick="return showCalendar('aaApprovalDate', 'dd/mm/y');"
								onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)"
								onmouseout="MM_swapImgRestore()" /> <html:errors
								property="aaApprovalDate" /></td>
								
							<td class="fieldname" width="20%">CAM Login Date</td>
							<td width="30%"><html:text property="camLoginDate" styleId="camLoginDate"
								readonly="true" />  <html:errors
								property="camLoginDate" /></td>
						</tr>
		<!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->			
						<tr class="even">
							<td class="fieldname" width="20%">RAM Rating<font
								color="#FF0000">*</font></td>
							<td class="odd">
							<html:select property="ramRating"	value="<%=aForm.getRamRating() %>">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="riskGradeList" labelProperty ="label" property ="value"/>
							</html:select> <html:errors property="ramRating" /></td>
								<%Calendar cal = Calendar.getInstance();  
						    int currentYear = cal.get(cal.YEAR);  
						    int previousYear1=currentYear-1;
						    int previousYear2=previousYear1-1;
						    %>
							<td class="fieldname">RAM Rating Year<font
								color="#FF0000">*</font></td>
							<td class="odd">
							<html:select property="ramRatingYear"	value="<%=aForm.getRamRatingYear() %>">
							<html:option value="">Please Select </html:option>                     
						<html:option value="<%=String.valueOf(currentYear) %>"><%=currentYear %></html:option>
								<html:option value="<%=String.valueOf(previousYear1)%>"><%=previousYear1%></html:option>
								<html:option value="<%=String.valueOf(previousYear2)%>"><%=previousYear2%></html:option>
							</html:select> <html:errors property="ramRatingYear" /></td>
						</tr>
						<tr class="odd">
						<td class="fieldname">Rating Type<font
								color="#FF0000">*</font></td>
								<td><span class="odd"> <html:select
								property="ramRatingType"
								value="<%=aForm.getRamRatingType() %>">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_SEC_RATING_TYPE%>"
									descWithCode="false" />
							</html:select> <html:errors property="ramRatingType" /> </span></td>
							<td class="fieldname">RAM Rating Finalization Date</td>
							<td width="30%"><html:text property="ramRatingFinalizationDate" styleId="ramRatingFinalizationDate"
								readonly="true" />
							<img src="img/calendara.gif" name="Image724" border="0"
								id="Image724"
								onclick="return showCalendar('ramRatingFinalizationDate', 'dd/mm/y');"
								onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)"
								onmouseout="MM_swapImgRestore()" /> <html:errors
								property="ramRatingFinalizationDate" /></td>
						</tr>
		<!--End by Pramod Katkar-->

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td class="fieldname" width="20%">Expiry Date</td>
							<td width="30%"><html:text property="annualReviewDate" styleId="annualReviewDate"
								readonly="true" />
								<img src="img/calendara.gif" name="Image724" border="0"
								id="Image724"
								onclick="return showCalendar('annualReviewDate', 'dd/mm/y');"
								onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)"
								onmouseout="MM_swapImgRestore()" />
								<html:errors property="annualReviewDate" />
								</td>
							<td class="fieldname" width="20%">Extension Date</td>
							<td width="30%">
							<html:text property="extendedNextReviewDate" styleId="extendedNextReviewDate"
								readonly="true" /> <img src="img/calendara.gif" name="Image724"
								border="0" id="Image724"
								onclick="return showCalendar('extendedNextReviewDate', 'dd/mm/y');"
								onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)"
								onmouseout="MM_swapImgRestore()" /> 
								<html:errors property="extendedNextReviewDate" /></td>
						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td class="fieldname" width="20%">Number of times extended</td>
							<td width="30%"><html:text property="noOfTimesExtended"
								readonly="true" /></td>
							<td class="fieldname" width="20%">Total CAM Sanctioned Amount
							(INR)</td><%	String totalSanctionedLimit=UIUtil.formatWithCommaAndDecimal(obCMSCustomer.getTotalSanctionedLimit());
							System.out.println("obCMSCustomer.getTotalSanctionedLimit():"+totalSanctionedLimit); %>
							<td width="30%"><html:text property="totalSactionedAmount" value="<%=totalSanctionedLimit %>"
								readonly="true" maxlength="25" size="23" /> 
						<!--  <td width="30%"><html:text property="totalSactionedAmount" value="<%=obCMSCustomer.getTotalSanctionedLimit() %>"
								readonly="true" maxlength="25" size="23" /> --><html:errors property="totalSactionedAmount" /> </td>
						</tr>

						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td class="fieldname" width="20%">Relationship Manager</td>
							<td width="30%">
							<integro:empty-if-null value="<%= relationShipMgrName %>"/>
								</td>
							<td class="fieldname" width="20%">Controlling Branch</td>
							<td width="30%">
							<integro:empty-if-null value="<%= branchName %>"/>
							<html:hidden property="controllingBranch" value="<%= branchName %>" />
							</td>
						</tr>
						<%
								if (aForm.getCommitteApproval()==null) {
									aForm.setCommitteApproval("");
								}
								if (aForm.getBoardApproval()==null) {
									aForm.setBoardApproval("");
								}
								if (aForm.getCommitteApproval().equals("Y")) {
									aForm.setCommitteApproval("on");
								}
								if (aForm.getBoardApproval().equals("Y")) {
									aForm.setBoardApproval("on");
								}
								if (aForm.getFullyCashCollateral()==null) {
									aForm.setFullyCashCollateral("");
								}
								if (aForm.getFullyCashCollateral().equals("Y")) {
									aForm.setFullyCashCollateral("on");
								}
						%>
						<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
							<td class="fieldname" width="20%">Fully Cash Collateral</td>

								 <td class="odd"><html:checkbox property="fullyCashCollateral" styleId="fullyCashCollateral1" onchange="changeCheckbocFullyCashCollateral(this);"/>
                        	</td>
							<td class="fieldname" width="20%">Total Release Amount Facility Level(INR)</td>
							<td width="30%">
								<html:text property="totalSanctionedAmountFacLevel" value="<%=totalSanctionedAmtFac%>"
								readonly="true" size="23" /><html:errors property="totalSanctionedAmountFacLevel" />
							</td>
						</tr>							
						<tr class="odd">
							<td class="fieldname">Committee Approval</td>
							<td class="odd"><html:checkbox property="committeApproval"  styleId="committeApproval1" onchange="changeCheckbocCommitApproval(this);" /></td>
							<td class="fieldname">Board Approval</td>
							<td class="odd"><html:checkbox property="boardApproval" styleId="boardApproval1" onchange="changeCheckbocBoardApproval(this);" /></td>
						</tr>
						<tr class="even">
							<td class="fieldname">Credit Approvers 1</td>
							<td class="even"><span class="odd"> 
							<html:select property="creditApproval1"	value="<%=aForm.getCreditApproval1() %>">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> </span></td>
							
							<td class="fieldname">Credit Approvers 4</td>
							<td class="even"><span class="odd"> <html:select
								property="creditApproval4"
								value="<%=aForm.getCreditApproval4() %>">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> 
							</span> </td>
							
						</tr>
						<tr class="even">
						<td class="fieldname">Credit Approvers 2</td>
							<td><span class="odd"> 
							<html:select
								property="creditApproval2"
								value="<%=aForm.getCreditApproval2() %>">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> </span></td>
							<td class="fieldname">Credit Approvers 5</td>
							<td class="even"><span class="odd"> <html:select
								property="creditApproval5"
								value="<%=aForm.getCreditApproval5() %>">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> 
							</span></td>
							
						</tr>
						<tr class="even">
						<td class="fieldname">Credit Approvers 3</td>
							<td class="even"><span class="odd"> <html:select	property="creditApproval3"
								value="<%=aForm.getCreditApproval3() %>">
							<html:option value="">Please Select </html:option>                     
						    <html:options collection ="creditAprrovalList" labelProperty ="label" property ="value"/>
							</html:select> 
							</span> </td>
							<td class="fieldname">&nbsp;</td>
							<td><html:errors property="minCreditApprover" />&nbsp;</td>
						</tr>
						<tr class="even">
						<td class="fieldname">RBI Asset Classification<font
								color="#FF0000">*</font></td>
							<td><span class="odd"> <html:select
								property="rbiAssetClassification"
								value="<%=aForm.getRbiAssetClassification() %>">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_RBI_ASSET_ClASSIFICATION%>"
									descWithCode="false" />
							</html:select> <html:errors property="rbiAssetClassification" /> </span></td>
							<td class="fieldname">Asset Classification<font
								color="#FF0000">*</font></td>
							<td class="even"><span class="odd"> <html:select
								property="assetClassification"
								value="<%=aForm.getAssetClassification() %>">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.CommonCode_ASSET_ClASSIFICATION%>"
									descWithCode="false" />
							</html:select> <html:errors property="assetClassification" /> </span></td>
							
						</tr>
						<!--  Start:Uma Khot:CRI Field addition enhancement  -->
				<tr class="odd">
                <td class="fieldname" width="20%">Whether Special Approval Grid Requirement Applicable For Customer Rated Below HDB8</td>
                <td>
					<%if(formObj.getIsSpecialApprGridForCustBelowHDB8() != null && formObj.getIsSpecialApprGridForCustBelowHDB8().equals("Yes")){ %>
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="Yes" checked="checked" id="isSpecialApprGridForCustBelowHDB8"/> Yes
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="No" id="isSpecialApprGridForCustBelowHDB8"/> No
					<%} %>
					<%if(formObj.getIsSpecialApprGridForCustBelowHDB8() == null || formObj.getIsSpecialApprGridForCustBelowHDB8().equals("No")){ %>
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="Yes" id="isSpecialApprGridForCustBelowHDB8"/> Yes
					<input type="radio" name="isSpecialApprGridForCustBelowHDB8" value="No" checked="checked" id="isSpecialApprGridForCustBelowHDB8"/> No
					<%} %>
				</td>
				<td class="fieldname" width="20%"></td>
                <td width="30%">&nbsp;</td>
              </tr> 
               <tr class="even">
                <td class="fieldname" width="20%" rowspan="2">Non Cooperative Borrowers</td>
                <td rowspan="2">
					<%if(formObj.getIsNonCooperativeBorrowers() != null && formObj.getIsNonCooperativeBorrowers().equals("Yes")){ %>
					<input type="radio" name="isNonCooperativeBorrowers" value="Yes" checked="checked" id="isNonCooperativeBorrowers" onclick="enableDirectorAsNonCooperative();enablenameOfDirectorsAndCompany()"/> Yes
					<input type="radio" name="isNonCooperativeBorrowers" value="No" id="isNonCooperativeBorrowers" onclick="enableDirectorAsNonCooperative();enablenameOfDirectorsAndCompany()"/> No
					<%} %>
					<%if(formObj.getIsNonCooperativeBorrowers() == null || formObj.getIsNonCooperativeBorrowers().equals("No")){ %>
					<input type="radio" name="isNonCooperativeBorrowers" value="Yes" id="isNonCooperativeBorrowers" onclick="enableDirectorAsNonCooperative();enablenameOfDirectorsAndCompany()"/> Yes
					<input type="radio" name="isNonCooperativeBorrowers" value="No" checked="checked" id="isNonCooperativeBorrowers" onclick="enableDirectorAsNonCooperative();enablenameOfDirectorsAndCompany()"/> No
					<%} %>
				</td>
				<td class="fieldname" width="20%">1) Is any Director (other than Nominee Director) declared As Non Cooperative for any other company</td>
				<td>
					<%if(formObj.getIsDirectorAsNonCooperativeForOther() != null && formObj.getIsDirectorAsNonCooperativeForOther().equals("Yes")){ %>
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="Yes" checked="checked" id="isDirectorAsNonCooperativeForOther" onclick="enablenameOfDirectorsAndCompany()"/> Yes
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="No" id="isDirectorAsNonCooperativeForOther" onclick="enablenameOfDirectorsAndCompany()"/> No
					<%} %>
					<%if(formObj.getIsDirectorAsNonCooperativeForOther() == null || formObj.getIsDirectorAsNonCooperativeForOther().equals("No")){ %>
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="Yes" id="isDirectorAsNonCooperativeForOther" onclick="enablenameOfDirectorsAndCompany()"/> Yes
					<input type="radio" name="isDirectorAsNonCooperativeForOther" value="No" checked="checked" id="isDirectorAsNonCooperativeForOther" onclick="enablenameOfDirectorsAndCompany()"/> No
					<%} %>
				</td>
				</tr>
                <tr class="odd">
               <!-- <td class="fieldname" width="20%">&nbsp;</td><td >&nbsp;</td>-->
                <td class="fieldname" width="20%">2) Name of Directors and Company</td>
                <%if(formObj.getIsDirectorAsNonCooperativeForOther() != null && formObj.getIsDirectorAsNonCooperativeForOther().equals("Yes")) { %>
                <td><html:textarea name="AADetailForm" rows="4" cols="55" property="nameOfDirectorsAndCompany"  styleId="nameOfDirectorsAndCompany"/>
                <%}else{ %>
                <td><html:textarea name="AADetailForm" rows="4" cols="55" property="nameOfDirectorsAndCompany"  styleId="nameOfDirectorsAndCompany" disabled="true"/>
                <%} %>
                <html:errors property="nameOfDirectorsAndCompanyErr"/>
				</td>
              </tr> 
               <tr class="even">
                <td class="fieldname" width="20%">Within Single Borrower Prudential Ceiling</td>
                <td>
					<%if(formObj.getIsSingleBorrowerPrudCeiling() == null || formObj.getIsSingleBorrowerPrudCeiling().equals("Yes")){ %>
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="Yes" checked="checked" id="isSingleBorrowerPrudCeiling" onclick="enableRbiApprovalSingle()"/> Yes
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="No" id="isSingleBorrowerPrudCeiling" onclick="enableRbiApprovalSingle()"/> No
					<%} %>
					<%if(formObj.getIsSingleBorrowerPrudCeiling() != null && formObj.getIsSingleBorrowerPrudCeiling().equals("No")){ %>
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="Yes" id="isSingleBorrowerPrudCeiling" onclick="enableRbiApprovalSingle()"/> Yes
					<input type="radio" name="isSingleBorrowerPrudCeiling" value="No" checked="checked" id="isSingleBorrowerPrudCeiling" onclick="enableRbiApprovalSingle()"/> No
					<%} %>
				</td>
                <td class="fieldname" width="20%">Provide details of RBI/Board approval Obtained/ or in the course of being obtained</td> 

				 <%if(formObj.getIsSingleBorrowerPrudCeiling() != null && formObj.getIsSingleBorrowerPrudCeiling().equals("No")){ %>
                <td width="30%">
                	<html:select property="rbiApprovalForSingle" styleId="rbiApprovalForSingle" value="<%=aForm.getRbiApprovalForSingle() %>">
								<integro:common-code categoryCode="<%=CategoryCodeConstant.RBI_APPROVAL%>" descWithCode="false" />
					</html:select> 
					<html:errors property="rbiApprovalSingleError" />
                <% }else{ %>
                <td width="30%">
                	<html:select property="rbiApprovalForSingle" styleId="rbiApprovalForSingle" value="<%=aForm.getRbiApprovalForSingle() %>" disabled="true">
								<integro:common-code categoryCode="<%=CategoryCodeConstant.RBI_APPROVAL%>" descWithCode="false" />
					</html:select> 
					<html:errors property="rbiApprovalSingleError" />
					
                <%}%>
                 
				 <br><br>
                <%if(formObj.getIsSingleBorrowerPrudCeiling() != null && formObj.getIsSingleBorrowerPrudCeiling().equals("No")){ %>
                <html:textarea name="AADetailForm" rows="2" cols="55" property="detailsOfRbiApprovalForSingle" styleId="detailsOfRbiApprovalForSingle"/>&nbsp;
                <% }else{ %>
                 <html:textarea name="AADetailForm" rows="2" cols="55" property="detailsOfRbiApprovalForSingle" styleId="detailsOfRbiApprovalForSingle" disabled="true"/>&nbsp;
                <%}%>
               
   				<html:errors property="detailsOfRbiApprovalForSingleErr" />
   				 </td> 
              </tr> 
               <tr class="odd">
                <td class="fieldname" width="20%">Within Group Borrower Prudential Ceiling</td>
                <td>
					<%if(formObj.getIsGroupBorrowerPrudCeiling() == null || formObj.getIsGroupBorrowerPrudCeiling().equals("Yes")){ %>
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="Yes" checked="checked" id="isGroupBorrowerPrudCeiling" onclick="enableRbiApprovalGroup()"/> Yes
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="No" id="isGroupBorrowerPrudCeiling" onclick="enableRbiApprovalGroup()"/> No
					<%} %>
					<%if(formObj.getIsGroupBorrowerPrudCeiling() != null && formObj.getIsGroupBorrowerPrudCeiling().equals("No")){ %>
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="Yes" id="isGroupBorrowerPrudCeiling" onclick="enableRbiApprovalGroup()"/> Yes
					<input type="radio" name="isGroupBorrowerPrudCeiling" value="No" checked="checked" id="isGroupBorrowerPrudCeiling" onclick="enableRbiApprovalGroup()"/> No
					<%} %>
				</td>
                <td class="fieldname" width="20%">Provide details of RBI/Board approval Obtained/ or in the course of being obtained</td>
                
                <%if(formObj.getIsGroupBorrowerPrudCeiling() != null && formObj.getIsGroupBorrowerPrudCeiling().equals("No")){ %>
                 <td width="30%">
                	<html:select property="rbiApprovalForGroup" styleId="rbiApprovalForGroup" value="<%=aForm.getRbiApprovalForGroup() %>" >
								<integro:common-code categoryCode="<%=CategoryCodeConstant.RBI_APPROVAL%>" descWithCode="false" />
					</html:select> 
					<html:errors property="rbiApprovalGroupError" />
                <% }else{ %>
                 <td width="30%">
                	<html:select property="rbiApprovalForGroup" styleId="rbiApprovalForGroup" value="<%=aForm.getRbiApprovalForGroup() %>" disabled="true">
								<integro:common-code categoryCode="<%=CategoryCodeConstant.RBI_APPROVAL%>" descWithCode="false" />
					</html:select> 
					<html:errors property="rbiApprovalGroupError" />
                 <%}%>
                
                <br><br>
                <%if(formObj.getIsGroupBorrowerPrudCeiling() != null && formObj.getIsGroupBorrowerPrudCeiling().equals("No")){ %>
                <html:textarea name="AADetailForm" rows="2" cols="55" property="detailsOfRbiApprovalForGroup" styleId="detailsOfRbiApprovalForGroup"/>&nbsp;
                <% }else{ %>
                <html:textarea name="AADetailForm" rows="2" cols="55" property="detailsOfRbiApprovalForGroup" styleId="detailsOfRbiApprovalForGroup" disabled="true"/>&nbsp;
                 <%}%>
   				<html:errors property="detailsOfRbiApprovalForGroupErr" />
   				</td>
              </tr> 
						<!--  End:Uma Khot:CRI Field addition enhancement  -->
						<tr>
              <td colspan="4">
               <table width="100%"  border="0" cellspacing="0" cellpadding="0" class="tblInput">
                <tbody>
                <tr class="odd">
                    <td class="fieldname">Remarks</td>
                    <td><html:textarea name="AADetailForm" rows="5" cols="120" property="docRemarks" onkeyup="limitTextInput(this,1600,'Narration')"/><html:errors property="docRemarks" /></td>
                </tr>
                </tbody>
            </table>
            </td>
            </tr>
           
            <html:hidden name="AADetailForm" property="camType"/>
            <input type="hidden" name="camTypeHidden" id="camTypeHidden"/>
            
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td><jsp:include page="udf_cam_hidden_error.jsp"></jsp:include></td>
			</tr>
			<tr>
				<td><udf:udfDisplay module="cam" action="add"/></td>
			</tr>
			<tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>
        	<%@ include file="/manualinput/aa/cam_images_list_edit.jsp" %>
        </td>
      </tr>
      <tr>
        <td> &nbsp;</td>
      </tr>
      <tr>
        <td> &nbsp;</td>
      </tr>
        <tr>
        <td> <jsp:include page="view_audit_details.jsp"></jsp:include></td>
      </tr>
		</tbody>
	</table>

	<%
		if (isMr) {
	%>
	<%@ include file="/manualinput/aa/trading_agreement_list.jsp"%>
	<%
		}
	%>

	<table width="90%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<tbody>
			<tr>
				<td>
				<%
					if (isRejected) {
							String paramUID = obTrxValue.getUserInfo();
							String paramRemarks = obTrxValue.getRemarks();
							if (paramRemarks == null
									|| paramRemarks.trim().equalsIgnoreCase("null")) {
								paramRemarks = " ";
							}
				%>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td width="43%" class="fieldname">Remarks</td>
							<td width="57%" class="odd"><textarea name="remarks"
								rows="4" style="width: 90%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=paramUID == null ? "-" : paramUID%>
							&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><integro:wrapper
								value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<%
					}
				%>
				</td>
			</tr>

			<tr>
				<td>&nbsp;</td>
			</tr>
		</tbody>
	</table>

	<table width="75" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><a href="javascript:submitPage(4)"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image142','','img/submit2.gif',1)"> <img
				src="img/submit1.gif" name="Image142" width="75" height="22"
				border="0" id="Image142" /> </a></td>
			<td><a
				href="<%=isRejected
						? "ToDo.do"
						: "javascript:goPreviousPage()"%>"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"> <img
				src="img/cancel1.gif" name="Image51" width="70" height="20"
				border="0" id="Image51" /> </a></td>
		</tr>
	</table>
	
   <!--Start: Uma Khot:CRI Field addition enhancement  -->
			<%	if(formObj.getIsNonCooperativeBorrowers() == null || formObj.getIsNonCooperativeBorrowers().equals("No")) { %>
				<script language="javascript">
				document.getElementById('isDirectorAsNonCooperativeForOther').disabled = true;
				</script>
		<%	}else {%>
		<%if( formObj.getIsNonCooperativeBorrowers()!=null && formObj.getIsNonCooperativeBorrowers().equals("Yes")) { %>
				<script language="javascript">
				document.getElementById('isDirectorAsNonCooperativeForOther').disabled = false;
			
				</script>
		<% }else{ %>
				<script language="javascript">
				document.getElementById('isDirectorAsNonCooperativeForOther').disabled = true;
				</script>
		<% }
		}%>
		   <!--End: Uma Khot:CRI Field addition enhancement  -->
		<html:hidden name="AADetailForm" property="camType"/>
		<html:hidden name="AADetailForm" property="aaApprovalDate"/>
		<html:hidden name="AADetailForm" property="camLoginDate"/>
		<html:hidden name="AADetailForm" property="ramRating"/>
		<html:hidden name="AADetailForm" property="ramRatingYear"/>
		<html:hidden name="AADetailForm" property="ramRatingType"/>
		<html:hidden name="AADetailForm" property="ramRatingFinalizationDate"/>
		<html:hidden name="AADetailForm" property="annualReviewDate"/>
		<html:hidden name="AADetailForm" property="extendedNextReviewDate"/>
		<html:hidden name="AADetailForm" property="noOfTimesExtended"/>
		<html:hidden name="AADetailForm" property="totalSactionedAmount"/>
		<html:hidden name="AADetailForm" property="controllingBranch"/>
		<html:hidden name="AADetailForm" property="fullyCashCollateral" styleId="fullyCashCollateralN"/>																	 
		<html:hidden name="AADetailForm" property="committeApproval" styleId="committeApprovalN"/>
		<html:hidden name="AADetailForm" property="boardApproval" styleId="boardApprovalN" />

 		<html:hidden name="AADetailForm" property="totalSanctionedAmountFacLevel"/>
		<html:hidden name="AADetailForm" property="creditApproval1"/>
		<html:hidden name="AADetailForm" property="creditApproval2"/>
		<html:hidden name="AADetailForm" property="creditApproval3"/>
		<html:hidden name="AADetailForm" property="creditApproval4"/>
		<html:hidden name="AADetailForm" property="creditApproval5"/>
		<html:hidden name="AADetailForm" property="rbiAssetClassification"/>
		<html:hidden name="AADetailForm" property="assetClassification"/>
		<html:hidden name="AADetailForm" property="nameOfDirectorsAndCompany"/>
		<html:hidden name="AADetailForm" property="rbiApprovalForSingle"/>
		<html:hidden name="AADetailForm" property="detailsOfRbiApprovalForSingle"/>
		<html:hidden name="AADetailForm" property="rbiApprovalForGroup"/>
		<html:hidden name="AADetailForm" property="detailsOfRbiApprovalForGroup"/>
		<html:hidden name="AADetailForm" property="docRemarks"/>
		
</html:form>
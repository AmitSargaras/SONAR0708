<%@page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>
<%@page	import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page	import="com.integrosys.component.user.app.bus.OBSearchCommonUser"%>
<%@page	import="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.poi.report.ReportForm,com.integrosys.cms.app.poi.report.OBFilter"%>
<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankAction"%><html>

<head>
<%
String context = request.getContextPath() + "/";
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";

System.out.println("************************************ "
		+ basePath);
ReportForm form= (ReportForm)request.getAttribute("ReportForm");
String rptId = form.getReportId();
String eventssss= (String)request.getAttribute("event");
System.out.println("eventssss=="+eventssss+"  ** forms.event=");
//String filterUser = (String)request.getAttribute("filterUser");
//String filterParty = (String)request.getAttribute("filterParty");
String filterUser = form.getFilterUserMode();
String filterParty = form.getFilterPartyMode();
//if(null==filterParty||filterParty.equals(""))
//	filterParty="ALL";


if("RPT0087".equals(form.getReportId())){
List facilityList = (List)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.facilityList");
pageContext.setAttribute("facilityList",facilityList);
}
else{
	List departmentList = (List)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.departmentList");
	pageContext.setAttribute("departmentList",departmentList);
}

List managerList = (List)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.managerList");
pageContext.setAttribute("managerList",managerList);

List camQuarterList = (List)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.camQuarterList");
pageContext.setAttribute("camQuarterList",camQuarterList);

List rmRegionList = (List) session
.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.rmRegionList");

List relationshipMgrList = (List) session
.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.relationshipMgrList");

if (!(rmRegionList == null)) {
	pageContext.setAttribute("rmRegionList", rmRegionList);
}
else{
	pageContext.setAttribute("rmRegionList", new ArrayList());
}
if (!(relationshipMgrList == null)) {
	pageContext.setAttribute("relationshipMgrList", relationshipMgrList);
}
else{
	pageContext.setAttribute("relationshipMgrList", new ArrayList());
}

System.out.println("Event====>"+form.getEvent());

String reportsFilterType = (String)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.reportsFilterType");
if(reportsFilterType==null)
	reportsFilterType="";


OBCustomerSearchResult searchResult=(OBCustomerSearchResult)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.customerObject");
OBSearchCommonUser selectedUser=(OBSearchCommonUser)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.selectedUserObject");
OBSystemBankBranch selectedBranch=(OBSystemBankBranch)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.selectedBranchObject");
OBCMSCustomer selectedGuarantor=(OBCMSCustomer)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.guarantorObject");

org.apache.struts.action.ActionErrors errors = (org.apache.struts.action.ActionErrors)(request.getAttribute("org.apache.struts.action.ERROR"));

List fileList=(List)request.getAttribute("fileInfo");
if(fileList!=null){
	pageContext.setAttribute("fileList",fileList);
}
int sno = 0;

%>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<script type="text/javascript" src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">

	function submitReport(){ //v3.0
	  //var reportID=document.forms[0].reportId.value;
	  //document.forms[0].event.value="generate_report_"+reportID;
	  var reportId = '<%=rptId%>';
	  if(reportId == 'RPT0085'){
		var val = document.getElementById('eventOrCriteriaVal').value;
		if(val == 'Limit is reduced or increased due to DP amount is changed'){
			 document.forms[0].event.value="generate_report_spe";
		}else{
			document.forms[0].event.value="generate_report";
		}
	  }else{
		  document.forms[0].event.value="generate_report";
	  }
	  
	  //document.forms[0].event.value="generate_report";
	  document.forms[0].submit();
	  newShowSilkScreen();
	}
	
	function toggleParty(seleObj){ //v3.0
	var sel=seleObj.value
	  if(sel=='ALL'){
		  document.getElementById('searchCustomerButton').disabled = true;
		  document.forms[0].searchCustomerName.disabled = true;
		  document.getElementById('partyDet').style.display = 'none';
		  document.forms[0].partyId.value="";
	  }else if(sel=='SELECTD_PARTY'){
		  document.getElementById('searchCustomerButton').disabled = false;
		  document.forms[0].searchCustomerName.disabled = false;
		  document.getElementById('partyDet').style.display = '';
	  }
	}

	function toggleDoc(seleObj){ //v3.0
		
		var sel=seleObj.value
		  if(sel=='F'){
			  
		  }else if(sel=='S'){
			  
		  }
		}
	
	function toggleUser(seleObj){ //v3.0
	var sel=seleObj.value
	  if(sel=='ALL'){
		  document.getElementById('searchUserButton').disabled = true;
		  document.forms[0].searchLoginID.disabled = true;
		  document.getElementById('userDet').style.display = 'none';
		  document.forms[0].userId.value="";
	  }else if(sel=='SELECTD_USER'){
		  document.getElementById('searchUserButton').disabled = false;
		  document.forms[0].searchLoginID.disabled = false;
		  document.getElementById('userDet').style.display = '';
	  }
	}
/* 	function toggleFilter(obj){ //v3.0
	  var enableFilter=obj.value;
	  if("INDUSTRY" == enableFilter){
	  }else if("SEGMENT" == enableFilter){
	  }else if("PARTY" == enableFilter){
	  }
	}
 */	function searchCustomer(){ //v3.0
		//alert("searchCustomerName  : "+document.forms[0].searchCustomerName.value);
		if(document.forms[0].searchCustomerName.value==null){
			alert("Please enter customer name to search.");
		}
		document.forms[0].event.value="list";
		document.forms[0].submit();
	}
 function searchParty(){ //v3.0
		//alert("searchCustomerName  : "+document.forms[0].searchCustomerName.value);
	 if(document.forms[0].searchPartyName.value==null){
			alert("Please enter customer name to search.");
		}
		document.forms[0].event.value="list";
		document.forms[0].submit();
	}
	function searchUser(){ //v3.0
		if(document.forms[0].searchLoginID.value==null){
			alert("Please enter users id to search.");
		}
		document.forms[0].event.value="list_user";
		document.forms[0].submit();
	}

	function searchBranch(){ //v3.0
		if(document.forms[0].searchBranchCode.value==null){
			alert("Please enter branch code to search.");
		}
		document.forms[0].event.value="list_branch";
		document.forms[0].submit();
	}
	function searchGuarantor(){ //v3.0
		if(document.forms[0].searchGuarantorName.value==null){
			alert("Please enter guarantor name to search");
		}
		document.forms[0].event.value="list_guarantor";
		document.forms[0].submit();	
	}

	function generateReport(selObj){ //v3.0
	  //alert("Hi");
	  //alert(selObj.options[selObj.selectedIndex].value);
	  var reportID=selObj.options[selObj.selectedIndex].value
	  //document.forms[0].event.value="generate_report_"+reportID;
	 // document.forms[0].event.value="prepare_filter";
	  document.forms[0].submit();
	}
	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}
	function refreshRelationshipMgrId(dropdown)
	{
		 var curSel = "";
		 for(i=0; i<dropdown.options.length; i++)
		 {
			if (dropdown.options[i].selected == true)
			{
			    curSel = dropdown.options[i].value;	
			}    	
		 }
		 var dep = 'relationshipMgr';
		 var url = '/cms/poiReport.do?event=refresh_rm_id&regionId='+curSel;
		 sendLoadDropdownReq(dep, url);
		}
	function refreshFacility(dropdown)
	{
		 var curSel = "";
		 for(i=0; i<dropdown.options.length; i++)
		 {
			if (dropdown.options[i].selected == true)
			{
			    curSel = dropdown.options[i].value;	
			}    	
		 }
		 var dep = 'facility';
		 var url = '/cms/poiReport.do?event=refresh_facility&facilityId='+curSel;
		 sendLoadDropdownReq(dep, url);
		}
	function refreshSubType(dropdown){	
		var currVal = "";
		for(i=0; i<dropdown.options.length; i++){
			if (dropdown.options[i].selected == true){
				currVal = dropdown.options[i].value;	
			}
		}	
		var dep = 'securitySubType';

		var url = '<%=request.getContextPath()%>/commoncode/' + "get_common_code.jsp" + '?dropdown_name='+dep+'&code=<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE%>&ref='+currVal;

		//alert(url);
		sendLoadDropdownReq(dep, url);	
	}
	
	

	function setValTohidden(dropdown){
		
			 var selectedYear = "";
		 for(i=0; i<dropdown.options.length; i++)
		 {
			if (dropdown.options[i].selected == true)
			{
				selectedYear = dropdown.options[i].value;	
				document.getElementById("ddlYears1").value = dropdown.options[i].value;
			}    	
		 }
	//	 alert("selectedYear="+selectedYear);
		 document.getElementById("ddlYears1").value = selectedYear;
		 
		
	}
	
	function hideUnhideDates(dropdown){
		var currVal = "";
		for(i=0; i<dropdown.options.length; i++){
			if (dropdown.options[i].selected == true){
				currVal = dropdown.options[i].value;	
			}
		}
	//	alert('**'+currVal+'**');
		if(currVal == 'Stock Statement is due for more than 2 months' || currVal == 'Post updation of stock statement along with DP arrived'){
			document.getElementById("selectYearDropdown").style.display = '';
		 var ddlYears = document.getElementById("ddlYears");
 
        //Determine the Current Year.
        var currentYear = (new Date()).getFullYear();
      
        var option = document.createElement("OPTION");
        option.innerHTML = "Please select";
        option.value = "";
        ddlYears.appendChild(option);
        
        //Loop and add the Year values to DropDownList.
       /*  for (var i = currentYear; i > 2010; i--) {
            var option = document.createElement("OPTION");
            option.innerHTML = i;
            option.value = i;
            ddlYears.appendChild(option);
        } */
        
        var yearsLength = 30;
        var currentYear = new Date().getFullYear();
        for(var i = 0; i < yearsLength; i++){
          var next = currentYear+1;
          var year = currentYear + '-' + next.toString().slice(-2);
          ddlYears.appendChild(new Option(year, year));
          currentYear--;
        }
        
	  }else{
		  document.getElementById("selectYearDropdown").style.display = 'none';
	  }
		 if(currVal == 'Limit is reduced or increased due to DP amount is changed'){
			document.getElementById("eventFromDate").style.display = '';
			document.getElementById("eventToDate").style.display = '';
		}else{
			document.getElementById("eventFromDate").style.display = 'none';
			document.getElementById("eventToDate").style.display = 'none';
		} 
	}
	
	window.onload = function(){
		
		var event = '<%=eventssss%>';
		 var reportId = '<%=rptId%>';
		 //alert(event+"  **"+reportId);
		/* if(event == 'cancleFilter_spe' && reportId == 'RPT0085'){
			document.getElementById('eventOrCriteriaVal').value = 'Limit is reduced or increased due to DP amount is changed';
			
			document.getElementById("eventFromDate").style.display = '';
			document.getElementById("eventToDate").style.display = '';
			
		} */
		
		 if(reportId == 'RPT0085'){
				if(document.getElementById('eventOrCriteriaVal').value == 'Limit is reduced or increased due to DP amount is changed'){
				
				document.getElementById("eventFromDate").style.display = '';
				document.getElementById("eventToDate").style.display = '';
				}
				
			}
	}
	
	
	function downloadReport(path,reportId){ //v3.0
		var aLocation = 'poiReport.do?event=downloadReport&erosionFileName='+path+'&reportId='+reportId; 
		window.location.href = aLocation ;
		//document.forms[0].submit();
	}
</script>
</head>
<body>
<br>
<br>
<table width="70%" border="0" cellpadding="0" cellspacing="0"
	align="center" class="tblInfo">
	<html:form action="poiReport.do">
		<tr class="even">
			<td class="fieldname">Report Name 
			</td>
			<td><html:hidden property="event" /> <html:hidden
				property="reportId" value="<%=form.getReportId()%>" /> <integro:common-code-single
				entryCode="<%=form.getReportId()%>" categoryCode="REPORTS"
				display="true" descWithCode="false" /></td>
		</tr>
		<%-- <tr class="odd">
            <td class="fieldname">
				Report Type
			</td>
			<td>
				<%=reportsFilterType%> 
			</td>
		</tr> --%>
<!-- Added by Uma Khot: Start:For Monthly Basel Report 08/09/2015  -->
<% if("RPT0054".equals(form.getReportId())){ %>
	<tr class="even">
		<td class="fieldname" width="20%">Security Type<font
				color="red">*</font></td>
			<td width="30%"><html:select property="securityType">
			<html:option value="">Please select</html:option>
			<html:option value="AssetBasedGeneralCharge">Asset Based-General Charge</html:option>
			<html:option value="AssetBasedGold">Asset Based-Gold</html:option>
			<html:option value="AssetBasedPlantEquipment">Asset Based-Plant Equipment</html:option>
			<html:option value="AssetBasedPostDatedCheques">Asset Based-Post Dated Cheques</html:option>
			<html:option value="AssetBasedSpecificAsset">Asset Based-Specific Asset</html:option>
			<html:option value="AssetBasedVehicles">Asset Based-Vehicles</html:option>
			<html:option value="CashFixedDeposit">Cash-Fixed Deposit</html:option>
			<html:option value="GuaranteesBank">Guarantees-Bank</html:option>
			<html:option value="GuaranteesCorporate">Guarantees-Corporate</html:option>
			<html:option value="GuaranteesGovernment">Guarantees-Government</html:option>
			<html:option value="GuaranteesIndividual">Guarantees-Individual</html:option>
			<html:option value="GuaranteesStandbyLC">Guarantees-Standby LC</html:option>
			<html:option value="InsuranceLifeInsurance">Insurance-Life Insurance</html:option>
			<html:option value="PropertyProperty">Property-Property</html:option>
			</html:select> <br>
			<html:errors property="securityTypeError" />
			</td>
		</tr>
<%} %>
<!-- Added by Uma Khot: End:For Monthly Basel Report 08/09/2015  -->
<%if("RPT0025".equals(form.getReportId())){ %>
		<tr class="even">
		<td class="fieldname" width="20%">System<font
				color="red">*</font></td>
			<td width="30%"><html:select property="uploadSystem">
			<html:option value="">Please select</html:option>
				<html:option value="UBS">UBS</html:option>
			<html:option value="FINWARE">FINWARE</html:option>
			<html:option value="BAHRAIN">BAHRAIN</html:option>
			<html:option value="HONGKONG">HONGKONG</html:option>
			</html:select> <br>
			<html:errors property="uploadSystemError" />
			</td>
		</tr>
	<%} %>
	
	<%if("RPT0081".equals(form.getReportId())){ %>
		<tr class="even">
		<td class="fieldname" width="20%">System<font
				color="red">*</font></td>
			<td width="30%">
		        <html:select property="uploadSystem">
					<integro:common-code categoryCode="<%=CategoryCodeConstant.SYSTEM%>" />
					<html:option value="ALL">All</html:option>
				</html:select>
				<br>
				<html:errors property="uploadSystemError" />
				<html:hidden property="uploadSystem" />
			</td>
		</tr>
	<%} %>
	
	<%if("RPT0059".equals(form.getReportId())){ %>
		<tr class="even">
		<td class="fieldname" width="20%">Quarter<font
				color="red">*</font></td>
			<td width="30%"><html:select property="quarter">
			<html:option value="">Please select</html:option>
				<html:options collection="camQuarterList" labelProperty="label"
					property="value"></html:options>
			</html:select> <br>
			<html:errors property="camReportQuarter" />
			</td>
		</tr>
	<%} %>

		<%if("TYPE1".equals(reportsFilterType)){ %>
		<tr class="even">

			<td class="fieldname">Industry</td>
			<td><html:select property="industry" name="ReportForm"
				style="width:250px"
				onchange="javascript:refreshRbiIndustryCode(this)"
				style="width:250px">
				<integro:common-code
					categoryCode="<%=CategoryCodeConstant.HDFC_INDUSTRY%>" />
			</html:select> <br>
			<html:errors property="industryNameError" /></td>
		</tr>
<%}if("TYPE9".equals(reportsFilterType)||"RPT0009".equals(form.getReportId())||form.getReportId().equals("RPT0033_1")
		||form.getReportId().equals("RPT0033_2")||form.getReportId().equals("RPT0002")||form.getReportId().equals("RPT0013_1")
		||form.getReportId().equals("RPT0013_2")||form.getReportId().equals("RPT0013_3")||form.getReportId().equals("RPT0013_4")
		||form.getReportId().equals("RPT0007")||form.getReportId().equals("RPT0010")||form.getReportId().equals("RPT0011")
		||form.getReportId().equals("RPT0029")||form.getReportId().equals("RPT0024")||form.getReportId().equals("RPT0050")
		||form.getReportId().equals("RPT0051")){ %>
<tr class="even">
             <td class="fieldname">
				Relationship Manager
			</td>
			<td>
			<html:select property="relationManager" name="ReportForm" 
						style="width:250px" style="width:250px">
				<html:option value="">Please Select</html:option>
				<html:options collection="managerList" labelProperty="label" property="value" />
			</html:select>
			<br><html:errors property="managerError"/>
		</td>
		</tr>
		
<%}  if("TYPE1".equals(reportsFilterType) || "TYPE2".equals(reportsFilterType) || "TYPE9".equals(reportsFilterType)
		||form.getReportId().equals("RPT0033_1")||form.getReportId().equals("RPT0033_2")||form.getReportId().equals("RPT0002")
		||form.getReportId().equals("RPT0013_1")||form.getReportId().equals("RPT0013_2")||form.getReportId().equals("RPT0013_3")
		||form.getReportId().equals("RPT0013_4")||form.getReportId().equals("RPT0007")||form.getReportId().equals("RPT0010")
		||form.getReportId().equals("RPT0011")||form.getReportId().equals("RPT0029")||form.getReportId().equals("RPT0024")
		||form.getReportId().equals("RPT0005")||form.getReportId().equals("RPT0050")||form.getReportId().equals("RPT0051")||form.getReportId().equals("RPT0056")){  %>		
	<tr class="even">
             <td class="fieldname">
				Segment
			</td>
			<td>
			 <html:select property="segment" style="width:250px">
			 	<integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"/>
			 </html:select>
			<br><html:errors property="customerSegmentError"/>
			</td>
		</tr>		
	<%}if(form.getReportId().equals("RPT0013_1")||form.getReportId().equals("RPT0013_2")
			||form.getReportId().equals("RPT0013_3")||form.getReportId().equals("RPT0013_4")){ %>
	<tr class="even">
             <td class="fieldname">
				RBI Asset Classification
			</td>
			<td>
			 <html:select property="rbiAsset" style="width:250px">
			 	<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_RBI_ASSET_ClASSIFICATION%>"/>
			 </html:select>
			<br><html:errors property="customerSegmentError"/>
			</td>
		</tr>
		<%}if(form.getReportId().equals("RPT0051")){ %>
			<tr class="even">
             <td class="fieldname">
				Document Type
			</td>
			<td>
			<input type="radio" name="filterDocument" value="F" checked="checked" onclick="toggleDoc(this)" >Facility&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="filterDocument" value="S"  onclick="toggleDoc(this)">Security &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<br><html:errors property="customerSegmentError"/>
			</td>
		</tr>
		
<%}if(form.getReportId().equals("RPT0070")){ %>
	<tr class="even">
	<td class="fieldname">Party</td>
	<td>
	<%if("ALL".equals(filterParty)){
		%>
		<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" >Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" checked="checked">All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%}else if("SELECTD_PARTY".equals(filterParty)){
		%>
		<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%}else{
	%>
	<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%} %>
	<html:hidden property="filterPartyMode"/>
	</td>	
</tr>
<tr class="even">
     <td class="fieldname">
		Select Party
	</td>
	<td>
		<input type="text" name="searchCustomerName" 
		<%if((!("TYPE1".equals(reportsFilterType) 
				|| "TYPE5".equals(reportsFilterType) 
				) && searchResult==null
				&& (errors != null && errors.get("customerNameError")== null))||("ALL".equals(filterParty))){ %>
		disabled="disabled" <%} %> />&nbsp;&nbsp;&nbsp; <input
		class="btnNormal" id="searchCustomerButton" type="button"
		value="Search Party"
		<%if((!("TYPE1".equals(reportsFilterType) 
				|| "TYPE5".equals(reportsFilterType) 
				) && searchResult==null
				&& (errors != null && errors.get("customerNameError")== null)
				)||("ALL".equals(filterParty))){ %>
				disabled="disabled"
		<%} %>
		 onclick="searchCustomer()"/>
		&nbsp;<html:errors property="customerNameError"/>
		&nbsp;<html:errors property="filterPartyError"/>
	</td>	
</tr>
		<tr>
			<td colspan="2">

			<div id="partyDet">
			<%if(searchResult!=null){ %>

			<table width="100%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Customer Details</td>
							</tr>
							<tr>
								<td width="18%"><bean:message key="label.list.party.name" /><br />
								</td>
								<td width="11%"><bean:message key="label.list.party.id" /><br />
							</tr>

						</thead>
						<tbody>

							<tr class="even">
								<td><integro:htmltext
									value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
								<%if("RPT0016".equals(form.getReportId())){ %> <html:hidden
									property="partyId"
									value="<%=String.valueOf(searchResult.getLegalReference())%>" />
								<%}else{%> <html:hidden property="partyId"
									value="<%=String.valueOf(searchResult.getSubProfileID())%>" />
								<%} %>
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
			</td>
		</tr>
	         <tr class="even">
                     <td class="fieldname">SCOD Due From Date <font color="red">*</font></td>
                     <td><html:text property="scodFromDate" size="12" maxlength="12"
                           readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
                           border="0" id="fromDateCal"
                           onclick="return showCalendar('scodFromDate', 'dd/mm/y');"
                           onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
                     <html:errors property="scodFromDateError" /></td>
              </tr>
              <tr class="even">
                     <td class="fieldname">SCOD Due To Date</td>
                     <td><html:text property="scodToDate" size="12" maxlength="12"
                           readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
                           border="0" id="toDateCal"
                           onclick="return showCalendar('scodToDate', 'dd/mm/y');"
                           onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
                     <html:errors property="scodToDateError" /></td>
              </tr>
                 <tr class="even">
                     <td class="fieldname">ESCOD Due From Date</td>
                     <td><html:text property="escodFromDate" size="12" maxlength="12"
                           readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
                           border="0" id="fromDateCal"
                           onclick="return showCalendar('escodFromDate', 'dd/mm/y');"
                           onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
                     <html:errors property="escodfromDateError" /></td>
              </tr>
              <tr class="even">
                     <td class="fieldname">ESCOD Due To Date</td>
                     <td><html:text property="escodToDate" size="12" maxlength="12"
                           readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
                           border="0" id="toDateCal"
                           onclick="return showCalendar('escodToDate', 'dd/mm/y');"
                           onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
                     <html:errors property="escodtoDateError" /></td>
              </tr>
<%}	if("TYPE1".equals(reportsFilterType) 
		|| "TYPE2".equals(reportsFilterType) 
		|| "TYPE3".equals(reportsFilterType)
		|| "TYPE5".equals(reportsFilterType)
		|| "TYPE6".equals(reportsFilterType)
		|| "TYPE7".equals(reportsFilterType)
		|| "TYPE9".equals(reportsFilterType)
		|| "TYPE10".equals(reportsFilterType)
		|| "TYPE11".equals(reportsFilterType)
		|| "TYPE73".equals(reportsFilterType)
		|| "TYPE81".equals(reportsFilterType)
		|| form.getReportId().equals("RPT0086")){  %>
		<%if(!("TYPE1".equals(reportsFilterType) 
				|| "TYPE5".equals(reportsFilterType) 
				|| "TYPE7".equals(reportsFilterType) 
				||"TYPE10".equals(reportsFilterType)
				)){ %>
		<tr class="even">
		<%if("TYPE73".equals(reportsFilterType) || "TYPE81".equals(reportsFilterType)){%>
			<td class="fieldname">Party<font
				color="red">*</font></td>
			<%}else{ %>
			<td class="fieldname">Party</td>
			<%} %>
			<%if(!form.getReportId().equals("RPT0049")&& !form.getReportId().equals("RPT0050")&& !form.getReportId().equals("RPT0051")){ 
			%>
			<td>
			<%if("ALL".equals(filterParty)){
				%>
				<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" >Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" checked="checked">All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%}else if("SELECTD_PARTY".equals(filterParty)){
				%>
				<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%}else{
			%>
			<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%} %>
			<html:hidden property="filterPartyMode"/>
			</td>
			<%}else if(!form.getReportId().equals("RPT0050")){
				%>
			<td>

			<%if("ALL".equals(filterParty)){ 
			%>
				<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" >Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" checked="checked">All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%}else if("SELECTD_PARTY".equals(filterParty)){ 
			%>
				<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%} else{
			%>
				<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" >Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" checked="checked">All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
			
			<%} %>
			<html:hidden property="filterPartyMode"/>
			</td>
			
			<%} %>
		</tr>
		<%} %>
		<tr class="even">
             <td class="fieldname">
				Select Party
				<%if(  "RPT0007".equals(form.getReportId()) || "RPT0017".equals(form.getReportId())
				|| "RPT0027".equals(form.getReportId()) || "RPT0056".equals(form.getReportId())
				|| "RPT0009".equals(form.getReportId()) || "RPT0010".equals(form.getReportId())
				|| "RPT0023".equals(form.getReportId()) || "RPT0012".equals(form.getReportId())
				|| "RPT0051".equals(form.getReportId()) || "RPT0005".equals(form.getReportId())
				|| "RPT0022".equals(form.getReportId()) || "RPT0047".equals(form.getReportId())
				|| "RPT0003".equals(form.getReportId()) || "RPT0024".equals(form.getReportId())
				|| "RPT0068".equals(form.getReportId()) || "RPT0034".equals(form.getReportId())
				|| "RPT0029".equals(form.getReportId()) || "RPT0018".equals(form.getReportId())
				|| "RPT0035".equals(form.getReportId()) || "RPT0030".equals(form.getReportId())
				|| "RPT0036".equals(form.getReportId()) || "RPT0050".equals(form.getReportId()) 
				|| "RPT0031".equals(form.getReportId()) || "RPT0032".equals(form.getReportId())
				|| "RPT0014".equals(form.getReportId()) || "RPT0011".equals(form.getReportId())    
				|| "RPT0047".equals(form.getReportId()) || "RPT0047_A".equals(form.getReportId()) 
				||"RPT0047_B".equals(form.getReportId())|| "RPT0047_C".equals(form.getReportId())    
				||"RPT0048".equals(form.getReportId())  || "RPT0015".equals(form.getReportId())     
				||"RPT0016".equals(form.getReportId())  || "RPT0013_1".equals(form.getReportId())
				||"RPT0013_2".equals(form.getReportId())  || "RPT0013_1".equals(form.getReportId())
				||"RPT0013_3".equals(form.getReportId())  || "RPT0013_4".equals(form.getReportId())
				|| "RPT0091".equals(form.getReportId()) || "RPT0092".equals(form.getReportId())
			)
			{%> <font color="red">*</font> <%}%>
			</td>
			<%if(!form.getReportId().equals("RPT0049")&& !form.getReportId().equals("RPT0050")&& !form.getReportId().equals("RPT0051")){ 
			%>
			<td>
				<input type="text" name="searchCustomerName" 
				<%if((!("TYPE1".equals(reportsFilterType) 
						|| "TYPE5".equals(reportsFilterType) 
						) && searchResult==null
						&& (errors != null && errors.get("customerNameError")== null))||("ALL".equals(filterParty))){ %>
				disabled="disabled" <%} %> />&nbsp;&nbsp;&nbsp; <input
				class="btnNormal" id="searchCustomerButton" type="button"
				value="Search Party"
				<%if((!("TYPE1".equals(reportsFilterType) 
						|| "TYPE5".equals(reportsFilterType) 
						) && searchResult==null
						&& (errors != null && errors.get("customerNameError")== null)
						)||("ALL".equals(filterParty))){ %>
						disabled="disabled"
				<%} %>
				 onclick="searchCustomer()"/>
				&nbsp;<html:errors property="customerNameError"/>
				&nbsp;<html:errors property="filterPartyError"/>
			</td>	
			<%}else{ %>	
			<td><%if("SELECTD_PARTY".equals(filterParty) && !(form.getReportId().equals("RPT0063"))){
				%>
				<input type="text" name="searchCustomerName" />&nbsp;&nbsp;&nbsp;
				<input class="btnNormal" id="searchCustomerButton" type="button" value="Search Party"  onclick="searchCustomer()"/>
				&nbsp;<html:errors property="customerNameError"/>
				&nbsp;<html:errors property="filterPartyError"/>
				<%}else if(form.getReportId().equals("RPT0050")){ %>
				<input type="text" name="searchCustomerName" />&nbsp;&nbsp;&nbsp;
				<input class="btnNormal" id="searchCustomerButton" type="button" value="Search Party"  onclick="searchCustomer()"/>
				&nbsp;<html:errors property="customerNameError"/>
				&nbsp;<html:errors property="filterPartyError"/>
				<%}else{ 
				%>
				<input type="text" name="searchCustomerName" disabled="disabled" />&nbsp;&nbsp;&nbsp;
				<input class="btnNormal" id="searchCustomerButton" type="button" value="Search Party" disabled="disabled" onclick="searchCustomer()"/>
				&nbsp;<html:errors property="customerNameError"/>
				&nbsp;<html:errors property="filterPartyError"/>
				<%} %>
			</td>	
			<%} %>
		</tr>
		<tr>
			<td colspan="2">

			<div id="partyDet">
			<%if(searchResult!=null){ %>

			<table width="100%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Customer Details</td>
							</tr>
							<tr>
								<td width="18%"><bean:message key="label.list.party.name" /><br />
								</td>
								<td width="11%"><bean:message key="label.list.party.id" /><br />
							</tr>

						</thead>
						<tbody>

							<tr class="even">
								<td><integro:htmltext
									value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
								<%if("RPT0016".equals(form.getReportId()) || "RPT0073".equals(form.getReportId()) 
										|| "RPT0081".equals(form.getReportId())){ %> <html:hidden
									property="partyId"
									value="<%=String.valueOf(searchResult.getLegalReference())%>" />
								<%}else{%> <html:hidden property="partyId"
									value="<%=String.valueOf(searchResult.getSubProfileID())%>" />
								<%} %>
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			
			<%if(searchResult!=null && "RPT0063".equals(form.getReportId())){ %>
			<table width="100%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Customer Details</td>
							</tr>
							<tr>
								<td width="18%"><bean:message key="label.list.party.name" /><br />
								</td>
								<td width="11%"><bean:message key="label.list.party.id" /><br />
							</tr>

						</thead>
						<tbody>

							<tr class="even">
								<td><integro:htmltext
									value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
								<%if("RPT0016".equals(form.getReportId())){ %> <html:hidden
									property="partyId"
									value="<%=String.valueOf(searchResult.getLegalReference())%>" />
								<%}else{%> <html:hidden property="partyId"
									value="<%=String.valueOf(searchResult.getSubProfileID())%>" />
								<%} %>
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			
			</div>
			</td>
		</tr>
		<%}if("TYPE6".equals(reportsFilterType)){
	if("RPT0003".equals(form.getReportId())){%>
		<tr class="even">
			<td class="fieldname">Status</td>
			<td><html:select property="status" style="width:250px">
				<option value="">ALL</option>
				<option value="1">Documents requested by CPU but not sent
				by Branch</option>
				<option value="2">Documents sent by Branch but not received
				by CPU</option>
				<option value="3">Documents not requested by CPU</option>
			</html:select></td>
		</tr>

		<%} else if("RPT0016".equals(form.getReportId())){%>
		<tr class="even">
			<td class="fieldname">Status</td>
			<td><html:select property="status" style="width:250px">
				<option value="">ALL</option>
				<option value="PENDING_CREATE">Pending Create</option>
				<option value="PENDING_INSERT">Pending Upload Create</option>
				<option value="PENDING_UPDATE">Pending Update</option>
				<option value="PENDING_ENABLE">Pending Enable</option>
				<option value="PENDING_DISABLE">Pending Disable</option>
				<option value="PENDING_DELETE">Pending Delete</option>
			</html:select></td>
		</tr>

		<%}}if("TYPE4".equals(reportsFilterType)||"TYPE8".equals(reportsFilterType)){  %>
		<%if(!("RPT0040".equals(form.getReportId())
				||"RPT0039".equals(form.getReportId()))) {%>
		<tr class="even">
			<td class="fieldname">User</td>
			<td>
			<%if("ALL".equals(filterUser)){ %>
				<input type="radio" name="filterUserMode" value="SELECTD_USER" onclick="toggleUser(this)" >Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="filterUserMode" value="ALL" 		   onclick="toggleUser(this)" >All&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%}else{ %>
				<input type="radio" name="filterUserMode" value="SELECTD_USER" onclick="toggleUser(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="filterUserMode" value="ALL" 		   onclick="toggleUser(this)">All&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%} %>
				<html:hidden property="filterUserMode"/>
			</td>
		</tr>
		<%} %>
		<tr class="even">
			<td class="fieldname">Select User
			<%if("RPT0037".equals(form.getReportId())||"RPT0041".equals(form.getReportId())||"RPT0042".equals(form.getReportId())) {%>
				 <font color="red">*</font> 
				 <%}%>
			</td>
			<td><input type="text" name="searchLoginID"
				<%if((selectedUser==null
						&& (errors != null && errors.get("userNameError")== null))|| ("ALL".equals(filterUser))){ %>
				disabled="disabled" <%} %> />&nbsp;&nbsp;&nbsp; <input
				class="btnNormal" id="searchUserButton" type="button"
				value="Search User(by User ID)" onclick="searchUser()"
				<%if((selectedUser==null
					&& (errors != null && errors.get("userNameError")== null))|| ("ALL".equals(filterUser))){ %>
				disabled="disabled" <%} %> /> &nbsp;<html:errors
				property="userNameError" /> &nbsp;<html:errors
				property="filterUserError" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<div id="userDet">
			<%if(selectedUser!=null){ %>

			<table width="80%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected User Details</td>
							</tr>
							<tr>
								<td width="18%">User ID<br />
								</td>
								<td width="11%">Full Name<br />
							</tr>

						</thead>
						<tbody>

							<tr class="odd">
								<td><integro:htmltext
									value="<%=selectedUser.getLoginID()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=selectedUser.getUserName()%>" />&nbsp;<br>
								<html:hidden property="userId"
									value="<%=String.valueOf(selectedUser.getUserID())%>" /></td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
			</td>
		</tr>
		<%}if(("TYPE7".equals(reportsFilterType)||"TYPE8".equals(reportsFilterType))
		&& !("RPT0033_1".equals(form.getReportId())
		||"RPT0033_2".equals(form.getReportId())
		||"RPT0033_3".equals(form.getReportId())
		)){ %>
		<tr class="even">
			<td class="fieldname">Branch Code</td>
			<td><input type="text" name="searchBranchCode" />&nbsp;&nbsp;&nbsp;<input
				class="btnNormal" type="button"
				value="Search Branch(by Branch Code)" onclick="searchBranch()" /> <html:errors
				property="branchCodeError" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<%if(selectedBranch!=null){ %>
			<table width="80%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Branch Details</td>
							</tr>
							<tr>
								<td width="18%">Branch Code<br />
								</td>
								<td width="11%">Branch Name<br />
							</tr>

						</thead>
						<tbody>

							<tr class="odd">
								<td><integro:htmltext
									value="<%=selectedBranch.getSystemBankBranchCode()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=selectedBranch.getSystemBankBranchName()%>" />&nbsp;<br>
								<html:hidden property="branchId"
									value="<%=String.valueOf(selectedBranch.getId())%>" /></td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</td>
		</tr>
		<%} if("RPT0040".equals(form.getReportId())){%>
		<tr class="even">
			<td class="fieldname">Department</td>
			<td><html:select property="departmentId" name="ReportForm"
				style="width:250px" style="width:250px">
				<html:option value="">ALL</html:option>
				<html:options collection="departmentList" labelProperty="label"
					property="value" />
			</html:select> <br>
			</td>
		</tr>
		<%} if("RPT0020".equals(form.getReportId())){%>
		<tr class="even">
			<td class="fieldname">Document Type</td>
			<td><html:select property="documentType" name="ReportForm"
				style="width:250px" style="width:250px">
				<integro:common-code categoryCode="IMG_UPLOAD_CATEGORY"
					descWithCode="false" />
			</html:select> <br>
			<html:errors property="industryNameError" /></td>
		</tr>
		<%}/*  if("RPT0033_1".equals(form.getReportId())
		||"RPT0033_2".equals(form.getReportId())
		||"RPT0033_3".equals(form.getReportId())
		){ */%>
		<%-- <tr class="even">
		<td class="fieldname">
			Relationship
		</td>
		<td>
		
		<html:select property="relatoionship" name="ReportForm"
						style="width:250px" style="width:250px">
						<integro:common-code descWithCode="false"
											categoryCode="<%=CategoryCodeConstant.RELATIONSHIP_TYPE%>"/>
		</html:select>
			<br><html:errors property="industryNameError"/>
										
		</td>
	</tr>
	<tr class="even">
             <td class="fieldname">
				Guarantor
			</td>
			<td>
				<input type="text" name="searchGuarantorName" />&nbsp;&nbsp;&nbsp;<input class="btnNormal" type="button" value="Search Guarantor" onclick="searchGuarantor()"/>
				
				<html:errors property="guarantorNameError"/> 
			</td>
		</tr>
		<tr>
		<td colspan="2">
		    
    <%if(selectedGuarantor!=null){ %>
    
    <table width="80%" class="tblFormSection" border="0" align="center" cellpadding="0" cellspacing="0"  id="custsearch" style="margin-top:15px">
          <tr>
           <td>
            <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
             <thead>
              <tr align="center">
               <td colspan="2" align="center">Selected Guarantor Details</td>
              </tr>
              <tr>
               <td width="18%"><bean:message key="label.list.party.name"/><br/>
               </td>
               <td width="11%"><bean:message key="label.list.party.id"/><br/>
              </tr>
              
             </thead>
             <tbody>
       
                  <tr class="odd">
                  <td>
	                  <integro:htmltext value="<%=selectedGuarantor.getCustomerName()%>"/>&nbsp;<br>
                  </td>
                  <td>
	                  <integro:empty-if-null value="<%=selectedGuarantor.getCifId()%>"/>&nbsp;<br>
	                  <html:hidden property="guarantor" value="<%=String.valueOf(selectedGuarantor.getCustomerID())%>"/>
                  </td>
                 </tr>
              </tbody>
			</table>
		   </td>
		  </tr>
		 </table>
    <%} %>
		</td>
		</tr> --%>
		<%//} 
if("TYPE8".equals(reportsFilterType)
		||"TYPE4".equals(reportsFilterType)
		||"RPT0001".equals(form.getReportId())
		||"RPT0002".equals(form.getReportId())
		||"RPT0012".equals(form.getReportId())
		||"RPT0018".equals(form.getReportId())
		||"RPT0020".equals(form.getReportId())
		||"RPT0043".equals(form.getReportId())
		||"RPT0044".equals(form.getReportId())
		||"RPT0056".equals(form.getReportId())
		||"RPT0071".equals(form.getReportId())
		||"TYPE9".equals(reportsFilterType)
		||"TYPE10".equals(reportsFilterType)
		||"RPT0072".equals(form.getReportId())
		||"RPT0100".equals(form.getReportId())
		||"RPT0104".equals(form.getReportId())
		) {%>
    <%--CLMJ-14 added an asterik symbol in from and to date --%>
		<tr class="even">
		<% if("RPT0100".equals(form.getReportId())){%>
			<td class="fieldname">LEI From Date
		<%}else{ %>
			<td class="fieldname">From Date
		<%} %>	
		<%	if(!("RPT0056".equals(form.getReportId())) && !("RPT0100".equals(form.getReportId()))){%>
			<font color="red">*</font></td> <%}%>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<% if("RPT0100".equals(form.getReportId())){%>
				<td class="fieldname">LEI To Date
			<%}else{ %>
				<td class="fieldname">To Date
			<%} %>	
			<%	if(!("RPT0056".equals(form.getReportId())) && !("RPT0100".equals(form.getReportId()))){%>
			<font color="red">*</font></td> <%}%>
			</td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<%} %>
		<%if("RPT0103".equals(form.getReportId())){%>


		
		<tr class="even">
			<td class="fieldname">Party</td>
			<td>
			<%if("ALL".equals(filterParty)){ %> <input type="radio"
				name="filterPartyMode" value="SELECTD_PARTY"
				onclick="toggleParty(this)">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"
				onclick="toggleParty(this)" checked="checked">All
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%}else{ %> <input
				type="radio" name="filterPartyMode" value="SELECTD_PARTY"
				onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"
				onclick="toggleParty(this)">All
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%}%> <html:hidden
				property="filterPartyMode" /></td>
		</tr>
       <%--CLMJ-39 --%>
		<tr class="even">
			<td class="fieldname">Select Party<font color="red">*</font> 
			</td>
			<td><input type="text" name="searchCustomerName"
				<%if((!("TYPE1".equals(reportsFilterType) 
						|| "TYPE5".equals(reportsFilterType) 
						) && searchResult==null
						&& (errors != null && errors.get("customerNameError")== null))||("ALL".equals(filterParty))){ %>
				disabled="disabled" <%} %> />&nbsp;&nbsp;&nbsp; <input
				class="btnNormal" id="searchCustomerButton" type="button"
				value="Search Party"
				<%if((!("TYPE1".equals(reportsFilterType) 
						|| "TYPE5".equals(reportsFilterType) 
						) && searchResult==null
						&& (errors != null && errors.get("customerNameError")== null)
						)||("ALL".equals(filterParty))){ %>
				disabled="disabled" <%} %> onclick="searchCustomer()" /> &nbsp;<html:errors
				property="customerNameError" /> &nbsp;<html:errors
				property="filterPartyError" /></td>
		</tr>
		<tr>
			<td colspan="2">

			<div id="partyDet">
			<%if(searchResult!=null){ %>

			<table width="80%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Customer Details</td>
							</tr>
							<tr>
								<td width="18%"><bean:message key="label.list.party.name" /><br />
								</td>
								<td width="11%"><bean:message key="label.list.party.id" /><br />
							</tr>

						</thead>
						<tbody>

							<tr class="even">
								<td><integro:htmltext
									value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
								<%if("RPT0016".equals(form.getReportId())){ %> <html:hidden
									property="partyId"
									value="<%=String.valueOf(searchResult.getLegalReference())%>" />
								<%}else if("RPT0047".equals(form.getReportId()) || "RPT0048".equals(form.getReportId())){%> <html:hidden property="partyId"
									value="<%=String.valueOf(searchResult.getLmpLeID())%>" />
									<%}else{%> <html:hidden property="partyId"
									value="<%=String.valueOf(searchResult.getSubProfileID())%>" />
								<%} %>
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
			</td>
		</tr>
		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
<%}%>
		<%if("RPT0047".equals(form.getReportId()) || "RPT0048".equals(form.getReportId())){%>


		<tr class="even">
			<td class="fieldname">Segment</td>
			<td><html:select property="segment" style="width:250px">
				<integro:common-code
					categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" />
			</html:select> <br>
			<html:errors property="customerSegmentError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">Party</td>
			<td>
			<%if("ALL".equals(filterParty)){ %> <input type="radio"
				name="filterPartyMode" value="SELECTD_PARTY"
				onclick="toggleParty(this)">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"
				onclick="toggleParty(this)" checked="checked">All
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%}else{ %> <input
				type="radio" name="filterPartyMode" value="SELECTD_PARTY"
				onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"
				onclick="toggleParty(this)">All
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%}%> <html:hidden
				property="filterPartyMode" /></td>
		</tr>
       <%--CLMJ-39 --%>
		<tr class="even">
			<td class="fieldname">Select Party<font color="red">*</font> 
			</td>
			<td><input type="text" name="searchCustomerName"
				<%if((!("TYPE1".equals(reportsFilterType) 
						|| "TYPE5".equals(reportsFilterType) 
						) && searchResult==null
						&& (errors != null && errors.get("customerNameError")== null))||("ALL".equals(filterParty))){ %>
				disabled="disabled" <%} %> />&nbsp;&nbsp;&nbsp; <input
				class="btnNormal" id="searchCustomerButton" type="button"
				value="Search Party"
				<%if((!("TYPE1".equals(reportsFilterType) 
						|| "TYPE5".equals(reportsFilterType) 
						) && searchResult==null
						&& (errors != null && errors.get("customerNameError")== null)
						)||("ALL".equals(filterParty))){ %>
				disabled="disabled" <%} %> onclick="searchCustomer()" /> &nbsp;<html:errors
				property="customerNameError" /> &nbsp;<html:errors
				property="filterPartyError" /></td>
		</tr>
		<tr>
			<td colspan="2">

			<div id="partyDet">
			<%if(searchResult!=null){ %>

			<table width="100%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Customer Details</td>
							</tr>
							<tr>
								<td width="18%"><bean:message key="label.list.party.name" /><br />
								</td>
								<td width="11%"><bean:message key="label.list.party.id" /><br />
							</tr>

						</thead>
						<tbody>

							<tr class="even">
								<td><integro:htmltext
									value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
								<%if("RPT0016".equals(form.getReportId())){ %> <html:hidden
									property="partyId"
									value="<%=String.valueOf(searchResult.getLegalReference())%>" />
								<%}else if("RPT0047".equals(form.getReportId()) || "RPT0048".equals(form.getReportId())){%> <html:hidden property="partyId"
									value="<%=String.valueOf(searchResult.getLmpLeID())%>" />
									<%}else{%> <html:hidden property="partyId"
									value="<%=String.valueOf(searchResult.getSubProfileID())%>" />
								<%} %>
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
			</td>
		</tr>
		<tr class="even">
			<td class="fieldname" width="20%">Region</td>
			<td width="30%"><html:select name="ReportForm"
				property="rmRegion"
				onchange="javascript:refreshRelationshipMgrId(this)"
				style="width:250px">
				<option value="">Please Select</option>
				<html:options collection="rmRegionList" labelProperty="label"
					property="value" />
			</html:select> <br>
			<html:errors property="rmRegionError" /></td>

		</tr>
		<tr class="even">
			<td class="fieldname" width="20%">Relationship Manager</td>
			<td width="30%"><html:select name="ReportForm"
				property="relationshipMgr" style="width:250px">
				<option value="">Please Select</option>
				<html:options collection="relationshipMgrList" labelProperty="label"
					property="value" />
			</html:select> <br>
			<html:errors property="relationshipMgrError" /></td>
		</tr>

		<tr class="even">
		<td class="fieldname" width="20%">Event</td>
			<td width="30%"><html:select property="moduleEvent">
				<html:option value="">Please Select</html:option>
				<html:option value="LIMIT">Limit Release</html:option>
				<html:option value="PDDC">Post Disbursal Deferral Clearance</html:option>
				<html:option value="CAM">CAM Module</html:option>
			</html:select> <br>
			</td>
		</tr>
		<tr class="even">
		<td class="fieldname" width="20%">TAT Criteria</td>
			<td width="30%"><html:select property="tatCriteria">
				<html:option value="">Please Select</html:option>
				<html:option value="WITHIN">Within Limit</html:option>
				<html:option value="OUTSIDE">Outside Limit</html:option>
			</html:select> <br>
			</td>
		</tr>
		<%if("RPT0047".equals(form.getReportId())){ %>
		<tr class="even">
		<td class="fieldname" width="20%">Profile<font
				color="red">*</font></td>
			<td width="30%"><html:select property="profile">
			<html:option value="">Please select</html:option>
				<html:option value="RM">Relationship Manager</html:option>
				<html:option value="BRANCH">Branch User</html:option>
				<html:option value="CPU">CPU User</html:option>
			</html:select> <br>
			<html:errors property="profileError" />
			</td>
		</tr>
	<%} %>
	
	
		<tr class="even">
		<td class="fieldname" width="20%">Category</td>
			<td width="30%"><html:select property="category">
				<html:option value="">Please Select</html:option>
				<html:option value="FTNR">First Time Not Right</html:option>
				<html:option value="FTR">First Time Right</html:option>
			</html:select> <br>
			</td>
		</tr>
		<tr class="even">
			<td class="fieldname">Case Id</td>
			<td><html:text property="caseId" size="60" maxlength="50"/> </td>
		</tr>
		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
<%}%>
<!-- Added by Santosh for UBS Limit-->
<%if("RPT0060".equals(form.getReportId()) || "RPT0076".equals(form.getReportId()) || "RPT0077".equals(form.getReportId())){%>
		<tr class="even">
		<td class="fieldname" width="20%">Record Type</td>
		<td width="30%">
			<html:select property="recordType">
				<html:option value="">Please Select</html:option>
				<html:option value="SUCCESS">Success</html:option>
				<html:option value="REJECTED">Reject</html:option>
				<html:option value="SUMMARY">Summary</html:option>
			</html:select> <br>
		</td>
		</tr>
		<tr class="even">
			<td class="fieldname">Select Party</td>
			<td><input type="text" name="searchCustomerName"/>&nbsp;&nbsp;&nbsp; 
				<input class="btnNormal" id="searchCustomerButton" type="button"
				value="Search Party" onclick="searchCustomer()" /> &nbsp;
				<html:errors property="customerNameError" /> &nbsp;
				<html:errors property="filterPartyError" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<div id="partyDet">
			<%if(searchResult!=null){ %>
			<table width="100%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Customer Details</td>
							</tr>
							<tr>
								<td width="18%"><bean:message key="label.list.party.name" /><br />
								</td>
								<td width="11%"><bean:message key="label.list.party.id" /><br />
							</tr>
						</thead>
						<tbody>
							<tr class="even">
								<td><integro:htmltext
									value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
								<html:hidden property="partyId" value="<%=String.valueOf(searchResult.getLegalReference())%>" />
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
			</td>
		</tr>
		<tr class="even">
			<td class="fieldname">From Date</td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date</td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
<%}%>	




<%if( "RPT0099".equals(form.getReportId()) || "RPT0069".equals(form.getReportId())){%>
		<tr class="even">
	<td class="fieldname">Party</td>
	<td>
	<%if("ALL".equals(filterParty)){
		%>
		<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" >Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" checked="checked">All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%}else if("SELECTD_PARTY".equals(filterParty)){
		%>
		<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%}else{
	%>
	<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<%} %>
	<html:hidden property="filterPartyMode"/>
	</td>	
</tr>
<tr class="even">
     <td class="fieldname">
		Select Party
	</td>
	<td>
		<input type="text" name="searchCustomerName" 
		<%if((!("TYPE1".equals(reportsFilterType) 
				|| "TYPE5".equals(reportsFilterType) 
				) && searchResult==null
				&& (errors != null && errors.get("customerNameError")== null))||("ALL".equals(filterParty))){ %>
		disabled="disabled" <%} %> />&nbsp;&nbsp;&nbsp; <input
		class="btnNormal" id="searchCustomerButton" type="button"
		value="Search Party"
		<%if((!("TYPE1".equals(reportsFilterType) 
				|| "TYPE5".equals(reportsFilterType) 
				) && searchResult==null
				&& (errors != null && errors.get("customerNameError")== null)
				)||("ALL".equals(filterParty))){ %>
				disabled="disabled"
		<%} %>
		 onclick="searchCustomer()"/>
		&nbsp;<html:errors property="customerNameError"/>
		&nbsp;<html:errors property="filterPartyError"/>
	</td>	
</tr>
		<tr>
			<td colspan="2">

			<div id="partyDet">
			<%if(searchResult!=null){ %>

			<table width="100%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Customer Details</td>
							</tr>
							<tr>
								<td width="18%"><bean:message key="label.list.party.name" /><br />
								</td>
								<td width="11%"><bean:message key="label.list.party.id" /><br />
							</tr>

						</thead>
						<tbody>

							<tr class="even">
								<td><integro:htmltext
									value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
								<%if("RPT0016".equals(form.getReportId())){ %> <html:hidden
									property="partyId"
									value="<%=String.valueOf(searchResult.getLegalReference())%>" />
								<%}else{%> <html:hidden property="partyId"
									value="<%=String.valueOf(searchResult.getSubProfileID())%>" />
								<%} %>
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
			</td>
		</tr>
<%}%>


<%if("RPT0069".equals(form.getReportId()) || "RPT0099".equals(form.getReportId()) ){%>
		<tr class="even">
			<td class="fieldname">From Date</td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date</td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
<%}%>


<!-- Added by Santosh for Diary CR-->
<%if("RPT0061".equals(form.getReportId())){%>

		<tr class="even">
			<td class="fieldname">Select User</td>
			<td><input type="text" name="searchLoginID"
				<%if((selectedUser==null
						&& (errors != null && errors.get("userNameError")== null))|| ("ALL".equals(filterUser))){ %>
				disabled="disabled" <%} %> />&nbsp;&nbsp;&nbsp; <input
				class="btnNormal" id="searchUserButton" type="button"
				value="Search User(by User ID)" onclick="searchUser()"
				<%if((selectedUser==null
					&& (errors != null && errors.get("userNameError")== null))|| ("ALL".equals(filterUser))){ %>
				disabled="disabled" <%} %> /> &nbsp;<html:errors
				property="userNameError" /> &nbsp;<html:errors
				property="filterUserError" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<div id="userDet">
			<%if(selectedUser!=null){ %>

			<table width="80%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected User Details</td>
							</tr>
							<tr>
								<td width="18%">User ID<br />
								</td>
								<td width="11%">Full Name<br />
							</tr>

						</thead>
						<tbody>

							<tr class="odd">
								<td><integro:htmltext
									value="<%=selectedUser.getLoginID()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=selectedUser.getUserName()%>" />&nbsp;<br>
								<html:hidden property="userId"
									value="<%=String.valueOf(selectedUser.getLoginID())%>" /></td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
			</td>
		</tr>

		<tr class="even">
		<td class="fieldname" width="20%">Status</td>
		<td width="30%">
			<html:select property="status">
				<html:option value="">Please Select</html:option>
				<html:option value="Open">Open</html:option>
				<html:option value="Closed">Closed</html:option>
			</html:select> <br>
		</td>
		</tr>
		
		<tr class="even">
			<td class="fieldname" width="20%">Segment</td>
			<td><html:select property="segment" style="width:250px">
					<integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"/>
				</html:select>
				<br><html:errors property="customerSegmentError"/>
			</td>
		</tr>
	
		<tr class="even">
			<td class="fieldname">From Date</td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		
		<tr class="even">
			<td class="fieldname">To Date</td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
<%}%>	
<%System.out.println("<<<<<<form.getReportId()>>>>>"+form.getReportId()); %>
<%if("RPT0062".equals(form.getReportId())){%>
		<tr class="even">
		<td class="fieldname" width="20%">System File
		<font color="red">*</font>
		</td>
		<td width="30%">
			<html:select property="uploadSystem">
				<html:option value="">Please Select</html:option>
				<html:option value="UBS">UBS File Upload</html:option>
				<html:option value="FINWARE">Finware/ Finware FW File Upload</html:option>
				<html:option value="HONGKONG">HongKong File Upload</html:option>
				<html:option value="BAHRAIN">Bahrain File Upload</html:option>
				<html:option value="FD">FD File Upload</html:option>
			</html:select> <br>
			<html:errors property="uploadSystemError" />
		</td>
		</tr>
		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
<%}%>	

<%if("RPT0063".equals(form.getReportId()) || 
		"RPT0095".equals(form.getReportId()) || 
		"RPT0096".equals(form.getReportId()) || 
		"RPT0097".equals(form.getReportId()) || 
		"RPT0098".equals(form.getReportId()) ){%>
              <tr class="even">
                     <td class="fieldname">From Date<font color="red">*</font></td>
                     <td><html:text property="fromDate" size="12" maxlength="12"
                           readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
                           border="0" id="fromDateCal"
                           onclick="return showCalendar('fromDate', 'dd/mm/y');"
                           onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
                     <html:errors property="fromDateError" /></td>
              </tr>
              <tr class="even">
                     <td class="fieldname">To Date<font color="red">*</font></td>
                     <td><html:text property="toDate" size="12" maxlength="12"
                           readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
                           border="0" id="toDateCal"
                           onclick="return showCalendar('toDate', 'dd/mm/y');"
                           onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
                     <html:errors property="toDateError" /></td>
              </tr>
<%}%>  
		<%if("RPT0064".equals(form.getReportId())){%>   

		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<%} %>
		<%if("RPT0065".equals(form.getReportId())){%>

		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<%} %>



<!-- Added For Cersai Mapping Reports By Prachit -->
		
		
		
		<%if("RPT0066".equals(form.getReportId()) || "RPT0067".equals(form.getReportId())){ 
		%>
		<tr class="even">
		<td class="fieldname" width="20%">Banking Method<font
				color="red">*</font></td>
			<td width="30%"><html:select property="bankingMethod" style="width:250px">
				<integro:common-code
					categoryCode="<%=CategoryCodeConstant.BANKING_METHOD%>" />
			</html:select> <br>
			<html:errors property="bankingMethodError"/>
			</td>
		</tr>
		<%} %>
		
		<%if("RPT0066".equals(form.getReportId()) || "RPT0067".equals(form.getReportId())){ %>
		<tr class="even">
		<td class="fieldname" width="20%">Type Of Security<font
				color="red">*</font></td>
			<td width="30%"><html:select property="typeOfSecurity">
			<html:option value="">Please select</html:option>
			<html:option value="MOVABLE">MOVABLE</html:option>
			<html:option value="IMMOVABLE">IMMOVABLE</html:option>
			</html:select> <br>
			<html:errors property="typeOfSecurityError"/>
			</td>
		</tr>
		<%} %>
		
		<%if("RPT0067".equals(form.getReportId())){ %>
		<tr class="even">
		<td class="fieldname" width="20%">Report Format<font
				color="red">*</font></td>
			<td width="30%"><html:select property="reportFormat">
			<html:option value="">Please select</html:option>
			<html:option value="CersaiCompatible">CERSAI compatible</html:option>
			<html:option value="UserReference">User Reference</html:option>
			</html:select> <br>
			<html:errors property="reportFormatError" />
			</td>
		</tr>
		<%} %>
		
		<%if("RPT0067".equals(form.getReportId())){ %>
		<tr class="even">
			<td class="fieldname">Date Of Receipt Of Document From<font color="red">*</font> </td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<%} %>
		
		<%if("RPT0066".equals(form.getReportId())){ %>
		<tr class="even">
			<td class="fieldname">Date Of Receipt Of Document From<font color="red">*</font> </td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" />&nbsp;
			<html:errors property="fromDatePostError" /></td>
		</tr>
		<%} %>
		
		<%if("RPT0066".equals(form.getReportId()) || "RPT0067".equals(form.getReportId())){ %>
		<tr class="even">
			<td class="fieldname">Date Of Receipt Of Document To<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<%} %>
		
		<%if("RPT0068".equals(form.getReportId())){ %>
		<tr class="even">
             <td class="fieldname">
				Party Name
			</td>
			<td><input type="text" name="searchCustomerName" <%if(searchResult!=null){ %> value="<%=searchResult.getCustomerName()%>" <%} %> />&nbsp;&nbsp;&nbsp; 
				<input class="btnNormal" id="searchCustomerButton" type="button"
				value="Search" onclick="searchCustomer()" /> &nbsp;
				<html:errors property="partyNameError" /> &nbsp;
				<html:errors property="filterPartyError" />&nbsp;
				<html:errors property="customerNameError" />
			</td>
		</tr>
		<%} %>
		
		<%if("RPT0068".equals(form.getReportId())){ %>
		<tr class="even">
             <td class="fieldname">
				Party ID
			</td>
			<%if(searchResult==null){ 
			%>
			<td>
			<input type="text"></td>
			<%}else{ 
			%>
			<td>
			<integro:empty-if-null
					value="<%=searchResult.getLegalReference()%>" />
					<html:hidden property="partyId" value="<%=String.valueOf(searchResult.getLegalReference())%>" />
			</td>
			<%} %>
		</tr>
		<%} %>
		<%if("RPT0068".equals(form.getReportId())){ %>
		<tr class="even">
             <td class="fieldname">
				Security ID
			</td>
			<td>
			<input type="text" name="securityId">
			<html:errors property="securityIdError" />
			</td>
		</tr>
		<%} %>
		
		
		<%if("RPT0073".equals(form.getReportId())){ %>
		<tr class="even">
             <td class="fieldname">
				Security Status<font
				color="red">*</font>
			</td>
			<td width="30%"><html:select property="securityStatus">
			<html:option value="">Please select</html:option>
			<html:option value="ACTIVE">ACTIVE</html:option>
			<html:option value="INACTIVE">INACTIVE</html:option>
			</html:select> <br>
			<html:errors property="securityStatusError"/>
			</td>
		</tr>
		<%} %>
		
		<%if("RPT0073".equals(form.getReportId())){ %>
		<tr class="even">
			<td class="fieldname">Date of Valuation From Date<font
				color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" />&nbsp;
			<html:errors property="fromDatePostError" /></td>
		</tr>
		<%} %>
		
		<%if("RPT0073".equals(form.getReportId())){ %>
		<tr class="even">
			<td class="fieldname">Date of Valuation To Date</td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<%} %>
		
		<%if("RPT0012".equals(form.getReportId())){ %>
		<tr class="even">
             <td width="40%" class="fieldname" nowrap>
               <bean:message key="label.security.type"/>/
               <bean:message key="label.security.sub.type"/>
             </td>
             <td width="60%">
                <html:select property="securityType1" onchange="refreshSubType(this);">
					<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE %>" descWithCode="false" />
                </html:select>
                 <html:select property="securitySubType" >
					<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_SUB_TYPE %>" refEntryCode="<%= form.getSecurityType()%>" descWithCode="false"/>
                 </html:select>
                 <html:errors property="securityType1"/>
                 <html:errors property="securitySubType"/>
                 <span class="errormsg" id="span11">&nbsp;</span>
             </td>
		</tr>
		<%} %>
		<%if("RPT0089".equals(form.getReportId())){ %>
			<tr class="even">
				<td class="fieldname">Sync Up Date<font color="red">*</font></td>
				<td>
					<html:text property="eodSyncUpDate" size="12" maxlength="12" readonly="true" />
					<img src="img/calendara.gif" name="img_eodSyncUpDate" border="0" 
						onclick="return showCalendar('eodSyncUpDate', 'dd/mm/y');" 
						onMouseOver="MM_swapImage('img_eodSyncUpDate','','img/calendarb.gif',1)" 
						onMouseOut="MM_swapImgRestore()" />
					<html:errors property="eodSyncUpDateError" />
				</td>
			</tr>
		<%} %>
		<%if("RPT0084".equals(form.getReportId())){%>

		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date</td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<tr class="even">
             <td class="fieldname">
				Exceptional User<font color="red">*</font>
			</td>
			<td>
			<input type="radio" name="isExceptionalUser" value="Y">Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="isExceptionalUser" value="N" checked="checked">No &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<br><html:errors property="isExceptionalUserError"/>
			<html:hidden property="isExceptionalUser"/>
			</td>
		</tr>
		<%} %>
		

			<%if("RPTCO0002".equals(form.getReportId())){ %>
		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<%} %>
		<%if("RPT0087".equals(form.getReportId())){ %>
		<tr class="even">
			<td class="fieldname">Party</td>
			<td>
			<%if("ALL".equals(filterParty)){
			%>
			<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" >Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" checked="checked">All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%}else if("SELECTD_PARTY".equals(filterParty)){
			 %>
			<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%}else{
			%>
			<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%} %>
			<html:hidden property="filterPartyMode"/>
			</td>	
		</tr>
		<tr class="even">
     		<td class="fieldname">
				Select Party
			</td>
		<td>
			<input type="text" name="searchCustomerName" 
			<%if((!("TYPE1".equals(reportsFilterType) 
				|| "TYPE5".equals(reportsFilterType) 
				) && searchResult==null
				&& (errors != null && errors.get("customerNameError")== null))||("ALL".equals(filterParty))){ %>
			disabled="disabled" <%} %> />&nbsp;&nbsp;&nbsp; <input
			class="btnNormal" id="searchCustomerButton" type="button"
			value="Search Party"
			<%if((!("TYPE1".equals(reportsFilterType) 
				|| "TYPE5".equals(reportsFilterType) 
				) && searchResult==null
				&& (errors != null && errors.get("customerNameError")== null)
				)||("ALL".equals(filterParty))){ %>
				disabled="disabled"
			<%} %>
		 	onclick="searchCustomer()"/>
			&nbsp;<html:errors property="customerNameError"/>
			&nbsp;<html:errors property="filterPartyError"/>
			</td>	
		</tr>
				<tr>
			<td colspan="2">
			<div id="partyDet">
			<%if(searchResult!=null){ %>
			<table width="100%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Customer Details</td>
							</tr>
							<tr>
								<td width="18%"><bean:message key="label.list.party.name" /><br />
								</td>
								<td width="11%"><bean:message key="label.list.party.id" /><br />
							</tr>
						</thead>
						<tbody>
							<tr class="even">
								<td><integro:htmltext
									value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
								<html:hidden property="partyId" value="<%=String.valueOf(searchResult.getLegalReference())%>" />
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
			</td>
		</tr>
		<tr class="even">
			<td class="fieldname">Facility</td>
            <td>
            	<%-- <html:select name="ReportForm" property="facility" >
                <html:option value="">Please Select </html:option>
                <html:options name="facilityList" labelName="facilityList"/>
            	</html:select> --%>
            	<html:select property="facility" name="ReportForm">
				<html:option value="">Please Select</html:option>
				<html:options collection="facilityList" labelProperty="label" property="value" />
				</html:select>
            </td>
		</tr>
		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<%} %>
		
		<%if("RPT0084".equals(form.getReportId())){%>
		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<%} %>
		<%if("RPT0087".equals(form.getReportId())){ %>
		<tr class="even">
			<td class="fieldname">Party</td>
			<td>
			<%if("ALL".equals(filterParty)){
			%>
			<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" >Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" checked="checked">All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%}else if("SELECTD_PARTY".equals(filterParty)){
			 %>
			<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%}else{
			%>
			<input type="radio" name="filterPartyMode" value="SELECTD_PARTY" onclick="toggleParty(this)" checked="checked">Select&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="filterPartyMode" value="ALL"   		 onclick="toggleParty(this)" >All &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%} %>
			<html:hidden property="filterPartyMode"/>
			</td>	
		</tr>
		<tr class="even">
     		<td class="fieldname">
				Select Party
			</td>
		<td>
			<input type="text" name="searchCustomerName" 
			<%if((!("TYPE1".equals(reportsFilterType) 
				|| "TYPE5".equals(reportsFilterType) 
				) && searchResult==null
				&& (errors != null && errors.get("customerNameError")== null))||("ALL".equals(filterParty))){ %>
			disabled="disabled" <%} %> />&nbsp;&nbsp;&nbsp; <input
			class="btnNormal" id="searchCustomerButton" type="button"
			value="Search Party"
			<%if((!("TYPE1".equals(reportsFilterType) 
				|| "TYPE5".equals(reportsFilterType) 
				) && searchResult==null
				&& (errors != null && errors.get("customerNameError")== null)
				)||("ALL".equals(filterParty))){ %>
				disabled="disabled"
			<%} %>
		 	onclick="searchCustomer()"/>
			&nbsp;<html:errors property="customerNameError"/>
			&nbsp;<html:errors property="filterPartyError"/>
			</td>	
		</tr>
				<tr>
			<td colspan="2">
			<div id="partyDet">
			<%if(searchResult!=null){ %>
			<table width="100%" class="tblFormSection" border="0" align="center"
				cellpadding="0" cellspacing="0" id="custsearch"
				style="margin-top: 15px">
				<tr>
					<td>
					<table width="100%" class="tblinfo" style="margin-top: 0"
						border="0" cellspacing="0" cellpadding="0">
						<thead>
							<tr align="center">
								<td colspan="2" align="center">Selected Customer Details</td>
							</tr>
							<tr>
								<td width="18%"><bean:message key="label.list.party.name" /><br />
								</td>
								<td width="11%"><bean:message key="label.list.party.id" /><br />
							</tr>
						</thead>
						<tbody>
							<tr class="even">
								<td><integro:htmltext
									value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
								</td>
								<td><integro:empty-if-null
									value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
								<html:hidden property="partyId" value="<%=String.valueOf(searchResult.getLegalReference())%>" />
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</table>
			<%} %>
			</div>
			</td>
		</tr>
		<tr class="even">
			<td class="fieldname">Facility</td>
            <td>
            	<%-- <html:select name="ReportForm" property="facility" >
                <html:option value="">Please Select </html:option>
                <html:options name="facilityList" labelName="facilityList"/>
            	</html:select> --%>
            	<html:select property="facility" name="ReportForm">
				<html:option value="">Please Select</html:option>
				<html:options collection="facilityList" labelProperty="label" property="value" />
				</html:select>
            </td>
		</tr>
		<tr class="even">
			<td class="fieldname">From Date<font color="red">*</font></td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		<tr class="even">
			<td class="fieldname">To Date<font color="red">*</font></td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<%} %>
		<%if("RPT0085".equals(form.getReportId())){ %>
		<tr class="even">
             <td class="fieldname">Events/Criteria's<font color="red">*</font></td>
             <td width="30%"><html:select property="eventOrCriteria" styleId = "eventOrCriteriaVal" onchange="hideUnhideDates(this);" >
			<html:option value="">Please select</html:option>
			<html:option value="Post updation of stock statement along with DP arrived">Post updation of stock statement along with DP arrived</html:option>
			<html:option value="Limit is reduced or increased due to DP amount is changed">Limit is reduced or increased due to DP amount is changed</html:option>
			<html:option value="Stock statement is not submitted once the due date is over">Stock statement is not submitted once the due date is over (Exact next day)</html:option>
			<html:option value="Stock Statement is due for more than 2 months">Stock Statement is due for more than 2 months</html:option>
			<html:option value="Notification before 15 days from Stock statement Due date">Notification before 15 days from Stock statement Due date</html:option>
			<html:option value="Notification before 7 days from Stock statement Due date">Notification before 7 days from Stock statement Due date</html:option>
			<html:option value="Notification before 1 days from Stock statement Due date">Notification before 1 days from Stock statement Due date</html:option>
			</html:select> <br>
			<html:errors property="eventOrCriteriaError" />
			<html:hidden property="eventOrCriteria"/>
			</td>
		</tr>
		
		<tr class="even" id ="eventFromDate" style='display: none'>
			<td class="fieldname">From Date</td>
			<td><html:text property="fromDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="fromDateCal"
				border="0" id="fromDateCal"
				onclick="return showCalendar('fromDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="fromDateError" /></td>
		</tr>
		
		<tr class="even" id ="eventToDate" style='display: none'>
			<td class="fieldname">To Date</td>
			<td><html:text property="toDate" size="12" maxlength="12"
				readonly="true" /> <img src="img/calendara.gif" name="toDateCal"
				border="0" id="toDateCal"
				onclick="return showCalendar('toDate', 'dd/mm/y');"
				onmouseover="MM_swapImage('Image32','','img/calendarb.gif',1)" /> <br>
			<html:errors property="toDateError" /></td>
		</tr>
		<tr class="even" id ="selectYearDropdown" style='display: none'>
		<td class="fieldname">Please Select Year</td>
		<td><select id="ddlYears" property="selectYearDropdown" onchange="setValTohidden(this);" >
		
		</select></td>
		<input type="hidden" id="ddlYears1" name="selectYearDropdown" />
		<html:errors property="selectYearDropdownError" />
		</tr>
		
		<%} %>
		
		
		<%if("RPT0086".equals(form.getReportId())){ %>
		<tr class="even">
             <td class="fieldname">Audit Trail Frequency<font color="red">*</font></td>
             <td width="30%"><html:select property="monthsOfAuditTrail" >
			<html:option value="">Please select</html:option>
			<html:option value="12">12months</html:option>
			<html:option value="24">24months</html:option>
			<html:option value="36">36months</html:option>
			</html:select> <br>
			<html:errors property="monthsOfAuditTrailError" />
			<html:hidden property="monthsOfAuditTrail"/>
			</td>
		</tr>
		
		<%} %>
		
		

		<!--For Erosion CR  -->
		<%if("EROSION01".equals(form.getReportId())||"EROSION02".equals(form.getReportId())
				||"EROSION03".equals(form.getReportId())||"EROSION04".equals(form.getReportId())){ %>
			<td colspan="4" align="center">
				<table width="90%" border="0" cellspacing="0" cellpadding="0"
					class="tblInfo">
					<thead>
						<tr>
							<td width="6%">S/N</td>
							<td width="20%">File Name</td>

						</tr>
					</thead>
					<tbody>
						<logic:present name="fileList">
							<logic:iterate id="ob" name="fileList" length="10"
								indexId="counter" type="java.io.File" scope="page">
								<%
                            String rowClass="";
                            sno++;
                            if(sno%2!=0){
                                rowClass="odd";
                            }else{
                                rowClass="even";
                            }
                        %>
								<tr class="<%=rowClass%>">
									<td class="index"><%=counter.intValue()+1%></td>
									<td><a href="#" onclick="downloadReport('<%=ob.getName()%>','<%=form.getReportId()%>')"><%=ob.getName()%></a></td>
								</tr>
							</logic:iterate>
							<% if (sno == 0 ) { %>
							<tr class="odd">
								<td colspan="10"><bean:message key="label.global.not.found" />
								</td>
							</tr>
							<% } %>
						</logic:present>
						<logic:notPresent name="fileList">
							<tr class="odd">
								<td colspan="10"><bean:message key="label.global.not.found" />
								</td>
							</tr>
						</logic:notPresent>
					</tbody>
				</table>
			</td>

			<%} %>
		<!--End Erosion  -->
</table>
<br>
<table width="150" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr>
		<td valign="baseline" align="center">&nbsp;</td>
		<td valign="baseline" align="center">&nbsp;</td>
	</tr>
	<tr>
		<td valign="baseline" align="center"><a href="#" onclick="submitReport()"
	<%if("EROSION01".equals(form.getReportId())||"EROSION02".equals(form.getReportId())
				||"EROSION03".equals(form.getReportId())||"EROSION04".equals(form.getReportId())){ %>
		<td><!-- <input type="button" value="Submit" onclick="submitReport()"> -->
		<a href="poiReport.do?event=list_report"
			onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"> <img
			src="img/return1.gif" name="Image1" border="0" id="Image1" /> </a></td>
	<%}else{%>
		<td><a href="#" onclick="submitReport()"
			onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image3','','img/submit1.gif',1)"> <img
			src="img/submit1.gif" name="Image41" border="0" id="Image3" /> </a>&nbsp;&nbsp;</td>
		<td valign="baseline" align="center">
		<a href="poiReport.do?event=list_report"
			onmouseout="MM_swapImgRestore()"
			onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"> <img
			src="img/return1.gif" name="Image1" border="0" id="Image1" /> </a>&nbsp;</td>
	<%}%>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>


</html:form>
</body>
</html>


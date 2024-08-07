<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,java.math.BigDecimal,com.integrosys.base.businfra.currency.Amount,
	com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page
	import="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.*"%>
<%@page import="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"%>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<%
	//List relationshipMgrList = null;
	List partyGroupList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGroupList");
	List rmRegionList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.rmRegionList");
	List rbiIndustryCodeList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.rbiIndustryCodeList");
	List relationshipMgrList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.relationshipMgrList");
	List countryList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryList");
	List regionList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.regionList");
	List cityList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.cityList");
	List stateList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.stateList");
	
	
	List systemBranchList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.systemBranchList");
	if (!(systemBranchList == null)) {
		TreeMap soretedMap= new TreeMap();
		for(int i=0;i<systemBranchList.size();i++)
		{
			OBSystemBankBranch ob=(OBSystemBankBranch)systemBranchList.get(i);
			
				soretedMap.put(ob.getSystemBankBranchCode().toUpperCase(),ob);	
		}
		systemBranchList = new ArrayList(soretedMap.values());
	}
	List systemList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.systemList");
	System.out.println("----------Party group list on jsp is  ----    "
			+ partyGroupList.size());
	OBSystemBankBranch systemBank = (OBSystemBankBranch) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.branchObj");
	if (!(partyGroupList == null)) {
		
		pageContext.setAttribute("partyGroupList", partyGroupList);
		//request.setAttribute("otherBankList", otherBankList);
	}
if (!(systemBranchList == null)) {
		
		pageContext.setAttribute("systemBranchList", systemBranchList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	if (!(rmRegionList == null)) {
		
		pageContext.setAttribute("rmRegionList", rmRegionList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	if (!(relationshipMgrList == null)) {
		
		pageContext.setAttribute("relationshipMgrList", relationshipMgrList);
		//request.setAttribute("otherBankList", otherBankList);
	}
    if (!(rbiIndustryCodeList == null)) {
		
	pageContext.setAttribute("rbiIndustryCodeList", rbiIndustryCodeList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	
	if (!(countryList == null)) {
		
		pageContext.setAttribute("countryList", countryList);
		//request.setAttribute("otherBankList", otherBankList);
	}if (!(regionList == null)) {
		
		pageContext.setAttribute("regionList", regionList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	if (!(cityList == null)) {
		
		pageContext.setAttribute("cityList", cityList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	if (!(stateList == null)) {
		
		pageContext.setAttribute("stateList", stateList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	

	if (!(systemList == null)) {
		
		pageContext.setAttribute("systemList", systemList);
		//request.setAttribute("systemList", systemList);
	}
	else 
	{
		pageContext.setAttribute("systemList", new ArrayList());
	}

	int sno = 0;
	int no = 0;

	//if (sr != null) {
	// relationshipMgrList = new ArrayList(sr.getResultList());
	//pageContext.setAttribute("relationshipMgrList",
	//		relationshipMgrList);
	//}

	//String event = request.getParameter("event");
	//pageContext.setAttribute("partyGroupList", sr);
	//int sno = 0;
	//int startIndex=0;
	//int counter=1;
	//String ind= (String) request.getAttribute("startIndex");
	//if(ind!=null && (!ind.equals("")))
	//{
	//	 startIndex = Integer.parseInt(ind);

	//}
%>
<%
	String context = request.getContextPath() + "/";
	System.out.println("************************************ "
			+ context);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("************************************ "
			+ basePath);
	
	ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
	System.out.println(value );
	
%>



<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page import="java.util.TreeMap"%><html>
<head>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>




<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>

<script language="JavaScript" type="text/JavaScript"><!--
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function gotopage(aLocation) {
	window.location.href = aLocation ;
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}


function saveForm() {

	document.getElementById('customerdetails').style.display = '';
   
}
function checkboxStatusActive(){

	 if(document.getElementById("status").value=='')
	{
		document.getElementById("status").value= "ACTIVE";
	}
	else
	{
		document.getElementById("status").value= "ACTIVE";	
	}
	
}
function checkboxStatusInactive(){

		document.getElementById("status").value= "INACTIVE";

}


function addSystem(name){
	document.forms[0].action="ManualInputCustomer.do?event="+name;
	
    document.forms[0].submit();
}
function refreshRegionId(dropdown)
{

 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'region';
 var url = '/cms/ManualInputCustomer.do?event=refresh_region_id&countryId='+curSel;
 
 sendLoadDropdownReq(dep, url);
 
}
function getAction(id,name,ind) {
	
	var type = document.getElementById("actionType"+ind).value;
	
	 if(type =="Edit"){
		
		document.forms[0].action = "ManualInputCustomer.do?systemCustomerId=" +id +"&system="+name+"&index="+ind;		
		
	    	document.forms[0].event.value = "edit_system_in_edit";
    	document.forms[0].submit();
	}
	else if( type == "Delete"){					
		document.forms[0].action = "ManualInputCustomer.do?systemCustomerId=" +id +"&system="+name+"&index="+ind;		
    	document.forms[0].event.value = "delete_system_in_edit";
    	document.forms[0].submit();
	}	    
}
function refreshStateId(dropdown)
{

 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'state';
 var url = '/cms/ManualInputCustomer.do?event=refresh_state_id&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}
function makeUppercase() {
	
	document.getElementById("customerNameShort").value = document.getElementById("customerNameShort").value.toUpperCase();
	}

function refreshCityId(dropdown)
{
	
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'city';
 var url = '/cms/ManualInputCustomer.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
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
	 var url = '/cms/ManualInputCustomer.do?event=refresh_rm_id&regionId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}
function ladSelected()
{
	alert('LAD Cycle is selected.');
}
function docSelected()
{
	alert('DOC Cycle is selected.');
}
function refreshRbiIndustryCode(dropdown)
{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 var dep = 'rbiIndustryCode';
	 var url = '/cms/ManualInputCustomer.do?event=refresh_rbi_industry_code&industryName='+curSel;
	 sendLoadDropdownReq(dep, url);
	}

//function createPartyGroup() {
	
 //	document.forms[0].action = "MIPartyGroup.do?event=maker_prepare_create_party_group&startIndex=";
 	
  //  document.forms[0].submit();
//}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
		<tr background="red">
						<td width="100%" colspan="4">
						<h3>Summary Details </h3>
						</td>
					</tr>
					<tr>
						<td colspan="4">
						<hr />
						</td>
					</tr>
	<tr>
		<td valign="top">
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<jsp:include page="cri_hidden_details.jsp"></jsp:include>
			<tbody>
				<tr id="customerdetails">
					<td>
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
								
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party ID</td>
										<td width="30%">
										<input type="text" size="30" style="background:#B4CFEC"  disabled="true"/>
										<html:hidden property="cifId" 
											></html:hidden>&nbsp;
											</td>
										<td class="fieldname" width="20%">Party Name<font color="red">*</font></td>
										<td width="30%"><html:text property="customerNameShort" onchange="javascript : makeUppercase()"
											size="30" maxlength="100"   ></html:text>&nbsp;
												<br><html:errors property="customerNameShortError"/>
												<html:errors property="specialCharacterCustomerNameShortError"/>
											<html:errors property="customerNameShortLengthError"/>
											<html:errors property="dupCustomerNameError"/>
											</td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Status<font color="red">*</font></td>
										<td width="30%">
										<%if( value.getStatus()==null){
											%>
						                  	<input type="radio" name="status" checked="checked" value="ACTIVE" disabled="disabled"  onclick="javascript:checkboxStatusActive()">Open</input>
					                  		<input type="radio" name="status" value="INACTIVE" disabled="disabled"  onclick="javascript:checkboxStatusInactive()">Close</input>
					                  		<%
										}
										else if( value.getStatus().equalsIgnoreCase("ACTIVE") ){
					                  	%>
					                  	<input type="radio" name="status" checked="checked" value="ACTIVE" disabled="disabled"  onclick="javascript:checkboxStatusActive()" >Open</input>
				                  		<input type="radio" name="status" value="INACTIVE" disabled="disabled"  onclick="javascript:checkboxStatusInactive()">Close</input>
				                  		<%}else{%>
				                  			<input type="radio" name="status"  value="ACTIVE" disabled="disabled"  onclick="javascript:checkboxStatusActive()">Open</input>
					                  		<input type="radio" name="status" disabled="disabled" checked="checked" value="INACTIVE"   onclick="javascript:checkboxStatusInactive()">Close</input>
				                  		<%} %>
												<br><html:errors property="statusError"/>
											</td>
										<td class="fieldname" width="20%">Main Branch<Font color="red">*</Font></td>
										<td width="30%">
										
										<html:select property="mainBranch"
											size="1"    style="width:250px">
											<option value="">Please Select</option>
											<logic:present name="systemBranchList">
												<logic:iterate id="ob" name="systemBranchList"
													type="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"
													 scope="page">
													<%
														String rowClass = "";
																	sno++;
																	if (sno % 2 != 0) {
																		rowClass = "odd";
																	} else {
																		rowClass = "even";
																	}
																	// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
													%>

													<%
														if (value.getMainBranch() == null) {
													%>
													<option 
														value="<%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%>"><%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%></option>
													<%
														} else {
													%>
													<%
														if (value.getMainBranch().equals(
																				String.valueOf(ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()))) {
													%>
													<option 
														value="<%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%>" selected="selected"><%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%></option>
													<%
														} else {
													%>
													<option 
														value="<%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%>"><%=ob.getSystemBankBranchCode()+"-"+ob.getSystemBankBranchName()%></option>
													<%
														}
													%>
													<%
														}
													%>


												</logic:iterate>
											</logic:present>


										</html:select>
										
												<br><html:errors property="mainBranchError"/>
											</td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Segment<font color="red">*</font></td>
										<td width="30%"><html:select property="customerSegment"    style="width:250px">

											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
										<br><html:errors property="customerSegmentError"/>
										</td>
										<td class="fieldname" width="20%">Party Relationship
										Start Date</td>
										<td width="30%"><html:text property="relationshipStartDate" size="30"
											maxlength="20"  readonly="true"></html:text><img src="img/calendara.gif"
											alt="calender" name="Image723" border="0" id="Image725"
											onclick="showCalendar('relationshipStartDate', 'dd/mm/y')"
											onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" />&nbsp;
												<br><html:errors property="relationshipDateError"/>
											</td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>

						
						
						
						
						
					</table>
					</td>
				</tr>
		</table>
		</td>
	</tr>
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="domicileCountry" value="IN" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerNameShort" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address2" />

	<html:hidden name="ManualInputCustomerInfoForm" property="email" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerBranch" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerSegment" />
	<html:hidden name="ManualInputCustomerInfoForm" property="status" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="partyGroupName" />
		<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />			
	<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipMgr" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cycle" />
	<html:hidden name="ManualInputCustomerInfoForm" property="entity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="rbiIndustryCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cinLlpin" />
	<html:hidden name="ManualInputCustomerInfoForm" property="partyNameAsPerPan" />
	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfIncorporation" />
	<html:hidden name="ManualInputCustomerInfoForm" property="aadharNumber" />	
	<html:hidden name="ManualInputCustomerInfoForm" property="listedCompany" />
<html:hidden name="ManualInputCustomerInfoForm" property="isinNo" />
<html:hidden name="ManualInputCustomerInfoForm" property="raroc" />
<html:hidden name="ManualInputCustomerInfoForm" property="raraocPeriod" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="yearEndPeriod" />
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrEmpId" />
<html:hidden name="ManualInputCustomerInfoForm" property="pfLrdCreditMgrEmpId" /> 
<html:hidden name="ManualInputCustomerInfoForm" property="creditMgrSegment" />  	
	<html:hidden name="ManualInputCustomerInfoForm" property="industryName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" />
		<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="region" />
	<html:hidden name="ManualInputCustomerInfoForm" property="country"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="state" />
	<html:hidden name="ManualInputCustomerInfoForm" property="city" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telex" />
	<html:hidden name="ManualInputCustomerInfoForm" property="subLine" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="bankingMethod" />
	<html:hidden name="ManualInputCustomerInfoForm" property="exceptionalCases" />	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalNonFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="fundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="nonFundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm" property="memoExposure" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="totalSanctionedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="mpbf" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="fundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="nonFundedShareLimit" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipStartDate" />
		<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI" styleId="deferLEI"/>
		<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />

		<!--End Santosh LEI CR  -->	
		<html:hidden  property="event"/>
			<html:hidden name="ManualInputCustomerInfoForm"
		property="sublineListEmpty" />
		<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
		<html:hidden name="ManualInputCustomerInfoForm" property="bankName" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeState" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="officePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm" property="officeEmail" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress1" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress2" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeAddress3" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeRegion" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCountry" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeState" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeCity" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeTelex" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficePostCode" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeEmail" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="borrowerDUNSNo" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity1" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity2" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="classActivity3" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="willfulDefaultStatus" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitFilledStatus" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateOfSuit" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitAmount" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitReferenceNo" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateWillfulDefault" />
	
	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeDUNSNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="partyConsent" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="mainBranch" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="directorListEmpty" />
		
		
		
		<html:hidden name="ManualInputCustomerInfoForm" property="directorName" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="isRBIWilfulDefaultersList" />
	
	<html:hidden name="ManualInputCustomerInfoForm" property="nameOfBank" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isDirectorMoreThanOne" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="nameOfDirectorsAndCompany" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfDefault" />
	
		<html:hidden name="ManualInputCustomerInfoForm" property="extOfCompromiseAndWriteoff" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isCibilStatusClean" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="detailsOfCleanCibil" />
	
	
		<html:hidden name="ManualInputCustomerInfoForm" property="isBorrDefaulterWithBank" />
		
		
		<%if(systemList!=null && systemList.size()==0){ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="systemListEmpty" value="Y" />
		<%}else{ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="systemListEmpty" value="N" />
		<%} %>
		
		<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
</table>
<!-- InstanceEnd -->
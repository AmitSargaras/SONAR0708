<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.*"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page
	import="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"%>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<%
	
	/*List partyGroupList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGroupList");
	List rmRegionList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.rmRegionList");
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
	List systemList = (List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.systemList");
	System.out.println("----------Party group list on jsp is  ----    "
			+ regionList);
	pageContext.setAttribute("partyGroupList", partyGroupList);
	pageContext.setAttribute("rmRegionList", rmRegionList);
	pageContext
			.setAttribute("relationshipMgrList", relationshipMgrList);
	pageContext.setAttribute("countryList", countryList);
	pageContext.setAttribute("regionList", regionList);
	pageContext.setAttribute("cityList", cityList);
	pageContext.setAttribute("stateList", stateList);

	if (!(systemList == null)) {
		
		pageContext.setAttribute("systemList", systemList);	
	}*/
	int sno = 1;
%>
<%
ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request
.getAttribute("ManualInputCustomerInfoForm");
	String context = request.getContextPath() + "/";
	System.out.println("************************************ "
			+ context);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("************************************ "
			+ basePath);
	
	List systemList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.systemList");

	//List otherBankList = value.getOtherBank();

	if (!(systemList == null)) {
		
		pageContext.setAttribute("systemList", systemList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	

%>



<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%><html>
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

function addParty(){
	document.getElementById('addParty').style.display = '';
	document.getElementById('addSystemDetails').style.display = '';
	document.getElementById('addSystemDetails2').style.display = '';
	document.getElementById('hrline').style.display = '';
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
	<tr>
		<td valign="top">
		<table width="95%" border="0" align="center" cellpadding="0"
			cellspacing="0" class="tblFormSection">
			<tbody>
				<tr id="customerdetails">
					<td>
					<table width="100%" height="100%" cellspacing="0" cellpadding="0"
						border="0">
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo">
								<thead>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party ID</td>
										<td width="30%"><%=form.getCifId() %></td>
										<td class="fieldname" width="20%">Party Name</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getLegalName()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Status</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getStatus()%>"/></td>
										<td class="fieldname" width="20%">Main Branch</td>
										<td width="30%"></td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Segment</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getStatus()%>"/></td>
										<td class="fieldname" width="20%">Party Relationship
										Start Date</td>
										<td width="30%">-</td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						
						<tr>
							<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tblInfo" id="addParty">
								<thead>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="fieldname" width="20%">Party Name</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getLegalName()%>"/></td>
										<td class="fieldname" width="20%">Status</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getStatus()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Main Branch</td>
										<td width="30%">&nbsp;</td>
										<td class="fieldname" width="20%">Group</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getPartyGroupName()%>"/></td>

									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">RM Employee Code</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getRelationshipMgrEmpCode()%>"/></td>
										<td class="fieldname" width="20%">Relationship Manager</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getRelationshipMgr()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">RM Region</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getRmRegion()%>"/></td>
										<td class="fieldname">Segment</td>
										<td>Commodity</td>
									</tr>
									<tr class="even">
										<td class="fieldname">Entity</td>
										<td><integro:empty-if-null value="<%=form.getEntity()%>"/></td>
										<td class="fieldname">Industry Name</td>
										<td><integro:empty-if-null value="<%=form.getIndustryName()%>"/></td>

									</tr>
									<tr class="even">
										<td class="fieldname">RBI Industry Code</td>
										<td><integro:empty-if-null value="<%=form.getRbiIndustryCode()%>"/></td>
										<td class="fieldname">Cycle</td>
										<td><integro:empty-if-null value="<%=form.getCycle()%>"/>
									</tr>									
									<tr class="odd">
										<td class="fieldname">CIN/LLPIN</td>
										<td><integro:empty-if-null value="<%=form.getCinLlpin()%>"/></td>
										<td class="fieldname">Date of Birth/Incorporation</td>
										<td><integro:empty-if-null value="<%=form.getDateOfIncorporation()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname"></td>
										<td></td>
										<td class="fieldname">Party name as per PAN</td>
										<td><integro:empty-if-null value="<%=form.getPartyNameAsPerPan()%>"/>
										</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Industry Name</td>
										<td><integro:empty-if-null value="<%=form.getIndustryName()%>"/></td>
										<td class="fieldname">Form 60/61</td>
										<td><integro:empty-if-null value="<%=form.getForm6061Checked()%>"/></td>
										<td class="fieldname">PAN</td>
										<td><integro:empty-if-null value="<%=form.getPan()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname">LEI Code</td>
										<td><integro:empty-if-null value="<%=form.getLeiCode()%>"/></td>
										<td class="fieldname">LEI Exp Date</td>
										<td><integro:empty-if-null value="<%=form.getLeiExpDate()%>"/></td>
										<td class="fieldname">Defer LEI</td>
										<td><integro:empty-if-null value="<%=form.getDeferLEI()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname">Address1</td>
										<td><integro:empty-if-null value="<%=form.getAddress1()%>"/></td>
										<td class="fieldname">Address2</td>
										<td><integro:empty-if-null value="<%=form.getAddress2()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Address3</td>
										<td><integro:empty-if-null value="<%=form.getAddress3()%>"/></td>
										<td class="fieldname">Pincode</td>
										<td><integro:empty-if-null value="<%=form.getPostcode()%>"/></td>

									</tr>
									<tr class="odd">
										<td class="fieldname">Country</td>
										<td><integro:empty-if-null value="<%=form.getCountry()%>"/></td>
										<td class="fieldname">Region</td>
										<td><integro:empty-if-null value="<%=form.getRegion()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname">State</td>
										<td><integro:empty-if-null value="<%=form.getState()%>"/></td>
										<td class="fieldname">City</td>
										<td><integro:empty-if-null value="<%=form.getCity()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname">Telephone Number</td>
										<td><integro:empty-if-null value="<%=form.getTelephoneNo()%>"/></td>
										<td class="fieldname">Fax No.</td>
										<td><integro:empty-if-null value="<%=form.getTelex()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Email</td>
										<td><integro:empty-if-null value="<%=form.getEmail()%>"/></td>
										<td class="fieldname">AADHAR Number</td>
										<td><integro:empty-if-null value="<%=form.getAadharNumber()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname"><bean:message key="label.party.summary.listedCompany"/></td>
										<td><integro:empty-if-null value="<%=form.getListedCompany()%>"/></td>
										<td class="fieldname"><bean:message key="label.party.summary.isinNo"/></td>
										<td><integro:empty-if-null value="<%=form.getIsinNo()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname"><bean:message key="label.party.summary.raroc"/></td>
										<td><integro:empty-if-null value="<%=form.getRaroc()%>"/></td>
										<td class="fieldname"><bean:message key="label.party.summary.raraocPeriod"/></td>
										<td><integro:empty-if-null value="<%=form.getRaraocPeriod()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname"><bean:message key="label.party.summary.yearEndPeriod"/></td>
										<td><integro:empty-if-null value="<%=form.getYearEndPeriod()%>"/></td>
										<td class="fieldname"><bean:message key="label.party.summary.creditMgrEmpId"/></td>
										<td><integro:empty-if-null value="<%=form.getCreditMgrEmpId()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname"><bean:message key="label.party.summary.pfLrdCreditMgrEmpId"/></td>
										<td><integro:empty-if-null value="<%=form.getPfLrdCreditMgrEmpId()%>"/></td>
										<td class="fieldname"><bean:message key="label.party.summary.creditMgrSegment"/></td>
										<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
												entryCode="<%=form.getCreditMgrSegment()%>"
												descWithCode="false"  display="true" /></td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>
						<tr id="addSystemDetails" >
							<td align="right">
							<h3 align="left">System Details</h3>
							</td>
						</tr>
						
						<tr id="hrline" >
							<td>
							<hr />
							</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr id="addSystemDetails2">
							<td>
							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>
									
										<td>S/N</td>
										<td>System</td>
										<td>System ID</td>
										
									</tr>
								</thead>
								<tbody>
									<logic:present name="systemList">
										<logic:iterate id="ob" name="systemList"
											type="com.integrosys.cms.app.customer.bus.OBSystem"
											length="10" scope="page">
											
											<tr class="">
												<td class="index"><%=sno++ %></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getSystem()%>" />&nbsp;</center>
												</td>
												<td>
												<center><%=ob.getSystemCustomerId()%>&nbsp;</center>
												</td>
												
											</tr>
										</logic:iterate>
									</logic:present>
									<logic:notPresent name="systemList">
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
									</logic:notPresent>
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
	<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipMgr" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />	
	
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
	<html:hidden name="ManualInputCustomerInfoForm" property="country" />
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
		property="legalName" />
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
	<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
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

	<html:hidden name="ManualInputCustomerInfoForm" property="dateOfSuit" />

	<html:hidden name="ManualInputCustomerInfoForm" property="suitAmount" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="suitReferenceNo" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="dateWillfulDefault" />

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regOfficeDUNSNo" />
	<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />	
		
		
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
		
		
</table>
<!-- InstanceEnd -->
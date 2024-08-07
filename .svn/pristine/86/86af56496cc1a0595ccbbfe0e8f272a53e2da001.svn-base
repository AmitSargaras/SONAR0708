<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
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
	
	String pName = (String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGroupName");
	String cityName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.cityName");
	String stateName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.stateName");
	String regionName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.regionName");
	String countryName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryName");
	String cityRegName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.cityRegName");
	String stateRegName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.stateRegName");
	String regionRegName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.regionRegName");
	String countryRegName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryRegName");
	String rmRegionName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.rmRegionName");
	String relManagerName=(String)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.relManagerName");
	
	
	List otherSystemList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.viewOtherSystemList");

	//List otherBankList = value.getOtherBank();

	if (!(otherSystemList == null)) {
		
		pageContext.setAttribute("otherSystemList", otherSystemList);
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
										<td class="fieldname" width="20%">Party ID<font color="red">*</font></td>
										<td width="30%"><%=form.getCifId() %></td>
										<td class="fieldname" width="20%">Party Name<font color="red">*</font></td>
										<td width="30%"><integro:empty-if-null value="<%=form.getCustomerNameShort()%>"/></td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">Status<font color="red">*</font></td>
										<td width="30%"><integro:empty-if-null value="<%=form.getStatus()%>"/></td>
										<td class="fieldname" width="20%">Main Branch<font color="red">*</font></td>
										<td width="30%"><integro:empty-if-null value="<%=form.getMainBranch()%>"/></td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Segment<font color="red">*</font></td>
										<td width="30%">
										
										<integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>"
												entryCode="<%=form.getCustomerSegment()%>"
												descWithCode="false"  display="true"/></td>
										<td class="fieldname" width="20%">Party Relationship
										Start Date</td>
										<td width="30%"><integro:empty-if-null value="<%=form.getRelationshipStartDate()%>"/></td>
									</tr>
								</tbody>
							</table>
							</td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
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
		<html:hidden name="ManualInputCustomerInfoForm"
		property="relationshipStartDate" />
		<!--Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="leiCode" styleId="lei"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="leiExpDate" styleId="leiExpDate"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="deferLEI" styleId="deferLEI"/>
		<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />
		<!--End Santosh LEI CR  -->	
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />			
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
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="mainBranch" />
			<html:hidden name="ManualInputCustomerInfoForm"
		property="branchCode" />
		<html:hidden name="ManualInputCustomerInfoForm"
		property="partyConsent" />


	<html:hidden name="ManualInputCustomerInfoForm" property="pName" value="<%=pName %>" />

	<html:hidden name="ManualInputCustomerInfoForm" property="cityName"  value="<%=cityName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm" property="stateName"  value="<%=stateName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm" property="regionName" value="<%=regionName %>" />

	<html:hidden name="ManualInputCustomerInfoForm" property="countryName"  value="<%=countryName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm" property="cityRegName" value="<%=cityRegName %>" />

	<html:hidden name="ManualInputCustomerInfoForm" property="stateRegName"  value="<%=stateRegName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm"
		property="regionRegName"  value="<%=regionRegName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm"
		property="countryRegName" value="<%=countryRegName %>" />

	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegionName" value="<%=rmRegionName %>"/>

	<html:hidden name="ManualInputCustomerInfoForm"
		property="relManagerName"  value="<%=relManagerName %>"/>

    <html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeTelex" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelNo" />
		
		<html:hidden name="ManualInputCustomerInfoForm"
		property="stdCodeOfficeTelex" />
		
		
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

	<jsp:include page="cri_hidden_details.jsp"></jsp:include>
</table>
<!-- InstanceEnd -->
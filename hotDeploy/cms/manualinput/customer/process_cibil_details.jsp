<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="java.util.*"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>

<%

ICMSCustomerTrxValue trx = (ICMSCustomerTrxValue)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.ICMSCustomerTrxValue");
if( trx != null ) {
       DefaultLogger.debug(this,  "trx "+trx);
     
   }else {
       DefaultLogger.debug(this, "trx is  NULL in request");
   }
	List countryList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryList");
	List regionList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.regionList");
	List cityList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.cityList");
	List stateList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.stateList");

	List countryRegList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryRegList");
	List regionRegList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.regionRegList");
	List cityRegList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.cityRegList");
	List stateRegList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.stateRegList");
	OBSystemBankBranch systemBank = (OBSystemBankBranch) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.branchObj");
	
	List classActivityList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.classActivityList");
	pageContext.setAttribute("classActivityList", classActivityList);
	
	List otherBankList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.otherBankList");

	pageContext.setAttribute("otherBankList", otherBankList);
	pageContext.setAttribute("countryRegList", countryRegList);
	pageContext.setAttribute("regionRegList", regionRegList);
	pageContext.setAttribute("cityRegList", cityRegList);
	pageContext.setAttribute("stateRegList", stateRegList);

	pageContext.setAttribute("countryList", countryList);
	pageContext.setAttribute("regionList", regionList);
	pageContext.setAttribute("cityList", cityList);
	pageContext.setAttribute("stateList", stateList);
	int no = 0;
	List directorList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.directorList");
	
	if (!(directorList == null)) {

		pageContext.setAttribute("directorList",directorList);
		//request.setAttribute("systemList", systemList);
	}else {
		pageContext.setAttribute("directorList",new ArrayList());
	}
	ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request
			.getAttribute("ManualInputCustomerInfoForm");

	String context = request.getContextPath() + "/";
	
	value.setBankingMethod(value.getFinalBankMethodList());
	
	 String[] revisedArr1 = value.getRevisedEmailIdsArray();
	 String[] revisedArr = value.getRevisedEmailIdsArray();
	 int len = 0;
	 
	 value.setRevisedEmailIdsArray(value.getRevisedEmailIdsArray());
	 
	if(value != null){
		if(value.getRevisedEmailIdsArray() != null){
			for(int i=0; i<value.getRevisedEmailIdsArray().length;i++){
				System.out.println("cibil details=>+++++value.getRevisedEmailIdsArray()--=======>"+value.getRevisedEmailIdsArray()[i].toString()+" ** value.getRevisedEmailIdsArray().length=>"+value.getRevisedEmailIdsArray().length);
			}
		}
	}
	
	
	List revisedArr22 = value.getRevisedArrayListN();
	 
	
	if(value != null){
		if(value.getRevisedEmailIdsArray() != null){
			len = revisedArr1.length;
			revisedArr = new String[len ];
			for(int i=0; i<value.getRevisedEmailIdsArray().length ;i++){
				revisedArr[i] = revisedArr1[i];
				System.out.println("I="+i+" ** revisedArr[i]===>"+revisedArr[i]);
			}
		}
	}  
	
	System.out.println("Revised ArrayList create cibil method =>"+value.getRevisedArrayListN());
	/* List arr12 = value.getRevisedArrayListN();
	System.out.println("arr12.size()=>"+arr12.size());
	pageContext.setAttribute("arr12",arr12); */
	pageContext.setAttribute("revisedArr",revisedArr);
	int cnt = 0;
%>


<%@page
	import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>


<%@page import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page import="com.integrosys.cms.app.customer.trx.ICMSCustomerTrxValue"%><script
	type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
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
function addDirector(name){
	document.forms[0].action="ManualInputCustomer.do?event="+name;
	
    document.forms[0].submit();
}
function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function checkbox(){

	if(document.getElementById("partyConsent").value=='N')
	{
		document.getElementById("partyConsent").value= "Y";
	
	}
	else if(document.getElementById("partyConsent").value=='')
	{
		document.getElementById("partyConsent").value= "Y";
		
	}
	else
	{
		document.getElementById("partyConsent").value= "N";
		
	}
	
}

function saveForm() {

	document.getElementById('customerdetails').style.display = '';
   
}
function refreshOfficeRegionId(dropdown)
{

 var curSel = "";

 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'officeRegion';

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
 var dep = 'officeState';
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
 var dep = 'officeCity';
 var url = '/cms/ManualInputCustomer.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function refreshRegRegionId(dropdown)
{

 var curSel = "";

 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'regOfficeRegion';
 var url = '/cms/ManualInputCustomer.do?event=refresh_region_id&countryId='+curSel;
 
 sendLoadDropdownReq(dep, url);
 
}
function refreshRegStateId(dropdown)
{

 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'regOfficeState';
 var url = '/cms/ManualInputCustomer.do?event=refresh_state_id&regionId='+curSel;
 sendLoadDropdownReq(dep, url);
}

function refreshRegCityId(dropdown)
{
	
 var curSel = "";
 for(i=0; i<dropdown.options.length; i++)
 {
	if (dropdown.options[i].selected == true)
	{
	    curSel = dropdown.options[i].value;	
	}    	
 }
 var dep = 'regOfficeCity';
 var url = '/cms/ManualInputCustomer.do?event=refresh_city_id&stateId='+curSel;
 sendLoadDropdownReq(dep, url);
}
function copyValue()
{
	if(document.getElementById("regOffice").value=='' || document.getElementById("regOffice").value=='N')
	{
	document.getElementById("regOffice").value= "Y";
	 document.forms[0].action="ManualInputCustomer.do?event=copy_office_to_reg_resubmit";
	 document.forms[0].submit();
	}
	else
	{
	    document.getElementById("regOffice").value= "N";
	    document.getElementById("regOfficeDUNSNo").value = "";
		document.getElementById("regOfficeAddress1").value = "";
		document.getElementById("regOfficeAddress2").value = "";
		document.getElementById("regOfficeAddress3").value = "";
		document.getElementById("regOfficeCountry").value = "";
		document.getElementById("regOfficePostCode").value = "";
		document.getElementById("regOfficeRegion").value = "";
		document.getElementById("regOfficeState").value = "";
		document.getElementById("regOfficeCity").value = "";	
		document.getElementById("regOfficeTelephoneNo").value = "";	
		document.getElementById("regOfficeTelex").value = "";	
		document.getElementById("stdCodeOfficeTelNo").value = "";	
		document.getElementById("stdCodeOfficeTelex").value = "";	
		document.getElementById("regOfficeEmail").value = "";		
	}
}
function getAction(ind) {
	
	var type = document.getElementById("actionType"+ind).value;
      
	 if(type =="Edit"){
		document.forms[0].action = "ManualInputCustomer.do?index="+ind;		
    	document.forms[0].event.value = "edit_director_in_resubmit";
    	
    	document.forms[0].submit();
	}
	else if( type == "Delete"){					
		document.forms[0].action = "ManualInputCustomer.do?index="+ind;		
    	document.forms[0].event.value = "delete_director_in_resubmit";
    	document.forms[0].submit();
	}	    
}


function willfulDftSts(value) {

	if(value == 'NOT_DEFAULTER') {
		 document.getElementById("spanPIF11").style.display = "none";
         document.getElementById("spanPIF12").style.display = '';
         document.getElementById("spanPIF13").style.display = "none";
         document.getElementById("spanPIF14").style.display = '';
		 document.getElementById("dateWillfulDefault").disabled=true;
		 document.getElementById("suitFilledStatus").disabled= true;
		 document.getElementById("suitReferenceNo").disabled= true;
		 document.getElementById("suitAmount").disabled= true;
		 document.getElementById("dateOfSuit").disabled= true;
		 document.getElementById("dateWillfulDefault").value='';
		 document.getElementById("suitFilledStatus").value= '';
		 document.getElementById("suitReferenceNo").value= '';
		 document.getElementById("suitAmount").value= '';
		 document.getElementById("dateOfSuit").value= '';
	}else{
		 document.getElementById("spanPIF11").style.display = '';
         document.getElementById("spanPIF12").style.display = "none";
         document.getElementById("spanPIF13").style.display = '';
         document.getElementById("spanPIF14").style.display = "none";
		 document.getElementById("dateWillfulDefault").disabled=false;
		 document.getElementById("suitFilledStatus").disabled= false;
		 document.getElementById("suitReferenceNo").disabled= false;
		 document.getElementById("suitAmount").disabled= false;
		 document.getElementById("dateOfSuit").disabled= false;
	}
	
}
//-->

	var enableTag = function() {
		enable.apply(null, arguments);
	}

	var enable = function() {
		for (var i = 0; i < arguments.length; i++) {
			document.getElementById(arguments[i]).disabled = false;
		}
	}

	var disableTag = function() {
		disable.apply(null, arguments);
	}

	var disable = function() {
		for (var i = 0; i < arguments.length; i++) {
			document.getElementById(arguments[i]).disabled = true;
			document.getElementById(arguments[i]).value = "";
		}
	}
	function enableBankAndDirectorMoreThanOne(){
		if(document.all.isRBIWilfulDefaultersList[0].checked){
			document.all.isDirectorMoreThanOne[0].disabled= false;
			document.all.isDirectorMoreThanOne[1].disabled= false;
			document.getElementById('nameOfBank').disabled=false;
		}
		else{
			document.getElementById('nameOfBank').value='';
			document.getElementById('nameOfBank').disabled=true;
			document.getElementById('nameOfDirectorsAndCompany').value='';
			document.getElementById('nameOfDirectorsAndCompany').disabled=true;
			document.all.isDirectorMoreThanOne[1].checked= true;
			document.all.isDirectorMoreThanOne[0].disabled= true;
			document.all.isDirectorMoreThanOne[1].disabled= true;
		}
	}
</script>
<!-- InstanceEndEditable -->
</head>
<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	
	<tr background="red">
						<td width="100%" colspan="4">
						<h3>CIBIL Details </h3>
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
				<tr>
					<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInfo">
						<thead>
						</thead>
						<tbody>
							<tr class="odd">
								<td class="fieldname" width="20%">Branch Code<font color="red">*</font></td>
								<td width="30%">
							<html:hidden property="branchCode" ></html:hidden>
												<integro:empty-if-null value="<%=value.getMainBranch()%>"/>						
								</td>
								<td class="fieldname" width="20%">Borrower DUNS number</td>
								<td width="30%"><html:text property="borrowerDUNSNo" size="15"
									maxlength="9"></html:text>&nbsp;
								<br><html:errors property="borrowerDUNSNoError"/>
								<html:errors property="borrowerDUNSNoLengthError"/>
								<html:errors property="specialCharacterBorrowerDUNSNoError"/>
									</td>
							</tr>
							<tr class="even">
								<td class="fieldname" width="20%">Customer Name<font color="red">*</font></td>
								<td width="30%"><textarea id="customerNameShort" readonly="readonly" style="width: 300px; height: 30px;" ><%=value.getCustomerNameShort()%></textarea>&nbsp;</td>
								<td class="fieldname" width="20%">PAN</td>
								<td><bean:write name="ManualInputCustomerInfoForm"
									property="pan"></bean:write>&nbsp;</td>
							</tr>
							<tr class="odd">
								

								<td class="fieldname" width="20%">Party Consent</td>
								<td width="30%">
								<% if(value.getPartyConsent()==null || value.getPartyConsent().equals("")){%>
								
								<input type="checkbox" id="partyC" onclick="javascript:checkbox()"></input>
								<html:hidden property="partyConsent"/>
								<% }else if(value.getPartyConsent().equals("Y")){%>
								<input type="checkbox" id="partyC" checked="checked" onclick="javascript:checkbox()"></input>
								<html:hidden property="partyConsent"/>
								<%} else if(value.getPartyConsent().equals("N")){%>
								<input type="checkbox" id="partyC" onclick="javascript:checkbox()"></input>
								<html:hidden property="partyConsent"/>
								<%} %>
								</td>
									<td  class="fieldname" width="20%">&nbsp;</td>
									<td width="30%">&nbsp;</td>
							</tr>
							<!--<tr class="even">
								<td class="fieldname">Address 1<font color="red">*</font></td>
								<td><html:text property="officeAddress1" size="30"
									maxlength="20"></html:text>&nbsp;
									<br><html:errors property="officeAddress1Error"/>
									</td>
								<td class="fieldname">Address 2<font color="red">*</font></td>
								<td><html:text property="officeAddress2" size="30"
									maxlength="20"></html:text>&nbsp;
									<br><html:errors property="officeAddress2Error"/>
									</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Address 3<font color="red">*</font></td>
								<td><html:text property="officeAddress3" size="30"
									maxlength="20"></html:text>&nbsp;
									<br><html:errors property="officeAddress3Error"/>
									</td>

								<td class="fieldname">Country<font color="red">*</font></td>
								<td><html:select property="officeCountry"
									name="ManualInputCustomerInfoForm"
									onchange="javascript:refreshOfficeRegionId(this)">
									<option value="">-Select-</option>
									<html:options collection="countryList" labelProperty="label"
										property="value" />
								</html:select>
								<br><html:errors property="officeCountryError"/>
								</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Pincode</td>
								<td><html:text property="officePostCode" size="30"
									maxlength="20"></html:text>&nbsp;</td>
								<td class="fieldname">Region<font color="red">*</font></td>
								<td><html:select property="officeRegion"
									name="ManualInputCustomerInfoForm"
									onchange="javascript:refreshStateId(this)">
									<option value="">-Select-</option>
									<html:options collection="regionList" labelProperty="label"
										property="value" />
								</html:select>
								<br><html:errors property="officeRegionError"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">State<font color="red">*</font></td>
								<td><html:select property="officeState"
									name="ManualInputCustomerInfoForm"
									onchange="javascript:refreshCityId(this)">
									<option value="">-Select-</option>
									<html:options collection="stateList" labelProperty="label"
										property="value" />
								</html:select>
								<br><html:errors property="officeStateError"/>
								</td>
								<td class="fieldname">City<font color="red">*</font></td>
								<td><html:select property="officeCity"
									name="ManualInputCustomerInfoForm">
									<option value="">-Select-</option>
									<html:options collection="cityList" labelProperty="label"
										property="value" />
								</html:select>
								<br><html:errors property="officeCityError"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Telephone Number</td>
								<td><input name="text43" type="text" size="5" /> <html:text
									property="officeTelephoneNo" size="30" maxlength="20"></html:text>&nbsp;</td>
								<td class="fieldname">Fax No.</td>
								<td><input name="text55" type="text" size="5" /> <html:text
									property="officeTelex" size="30" maxlength="20"></html:text>&nbsp;</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Email</td>
								<td><html:text property="officeEmail" size="30"
									maxlength="20"></html:text>&nbsp;</td>
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							--><tr class="even">
								<td class="fieldname">Class of Activity 1</td>
								<td><html:select
											name="ManualInputCustomerInfoForm" property="classActivity1" style="width:250px">
											<option value="">Please Select</option>
											<html:options collection="classActivityList"
												labelProperty="label" property="value" />
										</html:select></td>
								<td class="fieldname">Class of Activity 2</td>
								<td><html:select
											name="ManualInputCustomerInfoForm" property="classActivity2" style="width:250px">
											<option value="">Please Select</option>
											<html:options collection="classActivityList"
												labelProperty="label" property="value" />
										</html:select></td>
							</tr>
							<tr class="odd">
							<td class="fieldname" width="20%">Copy previous addresss as Registered address</td>
								
									<td>
									<% if(value.getRegOffice()==null || value.getRegOffice().equals("")){%>
								
								<input type="checkbox" id="reg" onclick="javascript:copyValue()"></input>
								<html:hidden property="regOffice" styleId="regOffice"/>
								<% }else if(value.getRegOffice().equals("Y")){%>
								<input type="checkbox" id="reg" checked="checked" onclick="javascript:copyValue()"></input>
								<html:hidden property="regOffice" styleId="regOffice"/>
								<%} else if(value.getRegOffice().equals("N")){%>
								<input type="checkbox" id="reg" onclick="javascript:copyValue()"></input>
								<html:hidden property="regOffice" styleId="regOffice"/>
								<%} %>
									</td>
									<td class="fieldname">Registered office DUNS No.</td>
								<td><html:text property="regOfficeDUNSNo" styleId="regOfficeDUNSNo" size="15"
									maxlength="10"></html:text>&nbsp;
									<br><html:errors property="regOfficeDUNSNoLengthError"/>
										<html:errors property="specialCharacterRegOfficeDUNSNoError"/>
									</td>
							</tr>
							<!--<tr  class="even">
							<td class="fieldname" width="20%">Copy previous addresss as Registered address</td>
								
								<td width="30%"><html:checkbox property="regOffice" 
									onclick="javascript:copyValue()"></html:checkbox>
							<td  class="fieldname" width="20%">&nbsp;</td>
									<td width="30%">&nbsp;</td>
							</tr>
							--><tr class="odd">
								<td class="fieldname">Registered Office Address 1<font color="red">*</font></td>
							
								<td><html:text property="regOfficeAddress1" styleId="regOfficeAddress1" size="30"
									maxlength="75"></html:text>&nbsp;
									<br><html:errors property="regOfficeAddress1Error"/>
									<html:errors property="regOfficeAddress1LengthError"/>
									</td>
								<td class="fieldname">Registered Office Address 2</td>
								<td><html:text property="regOfficeAddress2" styleId="regOfficeAddress2" size="30"
									maxlength="75"></html:text>&nbsp;
									<br>
									<html:errors property="regOfficeAddress2LengthError"/>
									</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Registered Office Address 3</td>
								<td><html:text property="regOfficeAddress3" styleId="regOfficeAddress3" size="30"
									maxlength="75"></html:text>&nbsp;
									<br>
									<html:errors property="regOfficeAddress3LengthError"/>
									</td>

								<td class="fieldname">Country<font color="red">*</font></td>
								<td><html:select property="regOfficeCountry" styleId="regOfficeCountry"
									name="ManualInputCustomerInfoForm"
									onchange="javascript:refreshRegRegionId(this)"  style="width:250px">
									<option value="">Please Select</option>
									<html:options collection="countryRegList" labelProperty="label"
										property="value" />
								</html:select>
								<br><html:errors property="regOfficeCountryError"/>
								</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Pincode</td>
								<td><html:text property="regOfficePostCode" styleId="regOfficePostCode" size="10"
									maxlength="6"></html:text>&nbsp;
									<br><html:errors property="regOfficePostCodeLengthError"/>
									<html:errors property="regPostcodeError"/>
									</td>
								<td class="fieldname">Region<font color="red">*</font></td>
								<td><html:select property="regOfficeRegion" styleId="regOfficeRegion"
									name="ManualInputCustomerInfoForm"
									onchange="javascript:refreshRegStateId(this)"  style="width:250px">
									<option value="">Please Select</option>
									<html:options collection="regionRegList" labelProperty="label"
										property="value" />
								</html:select>
								<br><html:errors property="regOfficeRegionError"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">State<font color="red">*</font></td>
								<td><html:select property="regOfficeState" styleId="regOfficeState"
									name="ManualInputCustomerInfoForm"
									onchange="javascript:refreshRegCityId(this)"  style="width:250px">
									<option value="">Please Select</option>
									<html:options collection="stateRegList" labelProperty="label"
										property="value" />
								</html:select>
								<br><html:errors property="regOfficeStateError"/>
								</td>
								<td class="fieldname">City<font color="red">*</font></td>
								<td><html:select property="regOfficeCity" styleId="regOfficeCity"
									name="ManualInputCustomerInfoForm"  style="width:250px">
									<option value="">Please Select</option>
									<html:options collection="cityRegList" labelProperty="label"
										property="value" />
								</html:select>
								<br><html:errors property="regOfficeCityError"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Telephone Number</td>
								<td><html:text property="stdCodeOfficeTelNo" styleId="stdCodeOfficeTelNo" size="5"
											maxlength="5"></html:text><html:text
									property="regOfficeTelephoneNo" styleId="regOfficeTelephoneNo" size="30" maxlength="20"></html:text>&nbsp;
									<br><html:errors property="regOfficeTelephoneNoLengthError"/>
									<html:errors property="specialCharacterRegOfficeTelephoneNoError"/>
										<html:errors property="specialCharacterRegOfficeStdTelephoneNoError"/>
									</td>
								<td class="fieldname">Fax No.</td>
								<td><html:text property="stdCodeOfficeTelex" styleId="stdCodeOfficeTelex" size="5"
											maxlength="5"></html:text><html:text
									property="regOfficeTelex" styleId="regOfficeTelex" size="30" maxlength="20"></html:text>&nbsp;
									<br><html:errors property="regOfficeTelexLengthError"/>
									<html:errors property="specialCharacterRegOfficeTelexError"/>
									<html:errors property="specialCharacterRegOfficeStdTelexError"/>
									</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Email</td>
								<td><html:text property="regOfficeEmail" styleId="regOfficeEmail" size="30"
									maxlength="50"></html:text>&nbsp;
									<br><html:errors property="regOfficeEmailError"/>
									</td>
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>

						</tbody>
					</table>
					</td>
				</tr>
				<tr>
					<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInfo">
						<thead>
						</thead>
						<tbody>
							<tr class="odd">
								<td class="fieldname" width="20%">Willful Default status<font color="red">*</font></td>
								<td width="30%"><html:select
											property="willfulDefaultStatus" styleId="willfulDefaultStatus" onchange="willfulDftSts(this.value)" >

											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.WILLFUL_DEFAULT_STATUS%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
											<br><html:errors property="willfulDefaultStatusError"/>
										</td>
								<td class="fieldname" width="20%">Date classified as
								willful default</td>
								<td width="30%"><html:text property="dateWillfulDefault" styleId="dateWillfulDefault" size="30"
											maxlength="20" readonly="true"></html:text><br></br><html:errors property="dateWillfulDefault" />
											<span id="spanPIF11" style="display:"> 
									<img src="img/calendara.gif"
											alt="calender" name="Image723" border="0" id="Image725"
											onclick="showCalendar('dateWillfulDefault', 'dd/mm/y')"
											onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" />&nbsp;      
                                   
                                         </span>
                                    <span id="spanPIF12" style="display:none">       
	                                     <img src="img/calendara.gif" alt="calender"  name="Image723" border="0" id="Image723" 
                                         onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                     </span>     
										</td>	
							</tr>
							<tr class="even">
								<td class="fieldname" width="20%">Suit Filed Status</td>
								<td width="30%"><html:select
											property="suitFilledStatus" styleId="suitFilledStatus">

											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.SUIT_FILLED_STATUS%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select></td>
								<td class="fieldname" width="20%">Suit Reference No.</td>
								<td width="30%"><html:text property="suitReferenceNo" size="15" styleId="suitReferenceNo"
											maxlength="10"></html:text>
											<br><html:errors property="suitReferenceNoLengthError"/>
											</td>
							</tr>
							<tr class="odd">
								<td class="fieldname" width="20%">Suit Amount</td>
								<td width="30%"><html:text property="suitAmount" size="28" styleId="suitAmount"
											maxlength="23" styleId="suitAmount" onblur="javascript:formatAmountAsCommaSeparated(this)"></html:text>

											<!--<select
									name="select15" id="select5">
									<option>Select</option>
									<option selected="selected">INR</option>
									<option>MYR</option>
									<option>USD</option>
									<option>GBP</option>
									<option>AUD</option>
									<option>YEN</option>
								</select>
								--><br><html:errors property="suitAmountLengthError"/>
								</td>
								<td class="fieldname" width="20%">Date of Suit</td>
								<td width="30%"><html:text property="dateOfSuit" size="30" styleId="dateOfSuit"
											maxlength="20" readonly="true"></html:text><br></br><html:errors property="dateOfSuit" />
									<span id="spanPIF13" style="display:"> 
									<img src="img/calendara.gif"
											alt="calender" name="Image723" border="0" id="Image723"
											onclick="showCalendar('dateOfSuit', 'dd/mm/y')"
											onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" />&nbsp;
                                   
                                     </span>
                                    <span id="spanPIF14" style="display:none">       
	                                     <img src="img/calendara.gif" alt="calender"  name="Image723" border="0" id="Image723" 
                                         onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                                     </span>     
											
								</td>
							</tr>
							
							
								<tr class="even">
										<td class="fieldname" width="20%">Is it in RBI Wilful Defaulter List?</td>
										<td width="30%"><html:radio
												property="isRBIWilfulDefaultersList"
												styleId="isRBIWilfulDefaultersList" value="Yes"
												onclick="enableBankAndDirectorMoreThanOne();" />
											Yes <html:radio property="isRBIWilfulDefaultersList"
												styleId="isRBIWilfulDefaultersList" value="No"
												onclick="enableBankAndDirectorMoreThanOne();" />
											No &nbsp; <br></td>
										<td class="fieldname" width="20%">
											<p>1)Name of the Bank</p> <br />
											<p>2)If any Directors name appear more than once </p> <br />
											<p>3)Name of Directors and Company</p>
										</td>
										<td><html:select property="nameOfBank"
												styleId="nameOfBank" disabled="true" value="<%=value.getNameOfBank()%>" >
												<option value="">Please Select</option>
				                  				<html:options collection="otherBankList" labelProperty="label" property="value" />
											</html:select> <br /> <br /> <br /> <html:radio
												property="isDirectorMoreThanOne"
												styleId="isDirectorMoreThanOne" value="Yes" disabled="true" onclick="enableTag('nameOfDirectorsAndCompany');" />
											Yes <html:radio property="isDirectorMoreThanOne"
												styleId="isDirectorMoreThanOne" value="No" onclick="disableTag('nameOfDirectorsAndCompany');"/>
											No &nbsp; <br /> <br /> <br /> <html:textarea
												property="nameOfDirectorsAndCompany"
												styleId="nameOfDirectorsAndCompany" rows="3" cols="50" 
												disabled="true" value="<%=value.getNameOfDirectorsAndCompany()%>"></html:textarea>
												<html:errors property="nameOfDirectorsAndCompanyLengthError" />
											</td>
									</tr>



									<tr class="odd">
										<td class="fieldname" width="20%">Was the
											borrower/promoter a defaulter with the bank earlier</td>
										<td width="30%"><html:radio
												property="isBorrDefaulterWithBank"
												styleId="isBorrDefaulterWithBank" value="Yes"
												onclick="enableTag('detailsOfDefault','extOfCompromiseAndWriteoff');" />
											Yes <html:radio property="isBorrDefaulterWithBank"
												styleId="isBorrDefaulterWithBank" value="No"
												onclick="disableTag('detailsOfDefault','extOfCompromiseAndWriteoff');" />
											No &nbsp; <br></td>
										<td class="fieldname" width="20%">
											<p>1)Provide Details of default</p> <br />
											<p>2)Extent of compromise and write off</p>
										<td><html:textarea property="detailsOfDefault"
												styleId="detailsOfDefault" rows="3" cols="50" value="<%=value.getDetailsOfDefault()%>"></html:textarea>
												<html:errors property="detailsOfDefaultLengthError" />
											<br />
													<br />
															<br />
											 <html:textarea property="extOfCompromiseAndWriteoff"
												styleId="extOfCompromiseAndWriteoff"
												rows="3" cols="50"  value="<%=value.getExtOfCompromiseAndWriteoff()%>"></html:textarea>
												<html:errors property="extOfCompromiseAndWriteoffLengthError" />
										</td>
									</tr>


									<tr class="even">
										<td class="fieldname" width="20%">Is CIBIL Status Clean</td>
										<td width="30%"><html:radio property="isCibilStatusClean"
												styleId="isCibilStatusClean" value="Yes"
												onclick="disableTag('detailsOfCleanCibil');" /> Yes <html:radio
												property="isCibilStatusClean"
												styleId="isCibilStatusClean" value="No"
												onclick="enableTag('detailsOfCleanCibil');" /> No &nbsp; <br>
										</td>
										<td class="fieldname" width="20%">
											<p>1)Provide Details</p>
										<td><html:textarea property="detailsOfCleanCibil"
												styleId="detailsOfCleanCibil" rows="3" cols="50" value="<%=value.getDetailsOfCleanCibil()%>"></html:textarea>
												<html:errors property="detailsOfCleanCibilLengthError" />
										</td>
									</tr>
							
							
							
						</tbody>
					</table>
					</td>
				</tr>
<tr><td>&nbsp;</td></tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
					<tr>
					<td align="right">
					<h3 align="left">Other/Relationship Details</h3>

					<input onclick="javascript : addDirector('add_director_in_resubmit')"
								name="AddNew12" type="button" id="AddNew12"
								value="Add Relationship Details" class="btnNormal" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<hr />
					</td>
				</tr>
				<tr>
					<td>
<html:errors property="directorListEmptyError"/>
					<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
						style="margin-top: 0" width="100%" align="center">
						<thead>
							<tr>
								<td>S/N</td>
								<td>DIN Number</td>
								<td>Director&rsquo;s Name</td>
								<td>Relationship</td>
								
								<td>Action</td>
							</tr>
						</thead>
						<tbody>
							<logic:present name="directorList">
										<logic:iterate id="ob" name="directorList"
											type="com.integrosys.cms.app.customer.bus.OBDirector"
											scope="page">
											<%
												String rowClass = "";
														no++;
														if (no % 2 != 0) {
															rowClass = "odd";
														} else {
															rowClass = "even";
														}
														// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
											%>
											<tr class="<%=rowClass%>">
												<td class="index"><%=no%></td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getDinNo()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null value="<%=ob.getDirectorName()%>"/>&nbsp;</center>
												</td>
												<td>
												<center><integro:common-code
												categoryCode="<%=CategoryCodeConstant.RELATIONSHIP_TYPE%>"
												entryCode="<%=ob.getRelationship()%>"
												descWithCode="false"  display="true"/></center>
												</td>
												<td>
												<center><select id="actionType<%=no%>"
													onchange="getAction('<%=no%>')">
													<option value="">-Select-</option>
													<option value="Edit">Edit</option>
													<option value="Delete">Delete</option>
												</select></center>
												</td>
											</tr>
										</logic:iterate>
									</logic:present>
									 <%if(directorList.size()==0 ){ %>
									
										<tr class="odd">
											<td colspan="8"><bean:message
												key="label.global.not.found" /></td>
										</tr>
								<%} %>


<logic:present name="revisedArr">
									<logic:iterate id="ob" name="revisedArr" 
											scope="page"
											>
										<% 
										String str = revisedArr1[cnt].toString();
										System.out.println("++**++*+*+*+ str=>"+str);
										%>
										
											<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" value="<%=str%>"/>
										
										<%cnt++;
										%>
									</logic:iterate>
								</logic:present>

						</tbody>
					</table>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td>
					<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
						style="margin-top: 0" width="100%" align="center">
				<tr class="even" width="60%">
							<td class="fieldname">Last Remarks Made</td>
							<td colspan="3"><%=trx.getRemarks() != null ? trx
						.getRemarks() : ""%>&nbsp;</td>
						</tr>
						</table>
				</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
					 <jsp:include page="view_audit_details.jsp"></jsp:include>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
		</table>
		</td>
	</tr>
	
	
	
	<%if (value.getIsBorrDefaulterWithBank() == null
					|| value.getIsBorrDefaulterWithBank().equals("")||value.getIsBorrDefaulterWithBank().equals("No")) {%>
		<script language="JavaScript" >
		document.all.isBorrDefaulterWithBank[1].checked = true;
		document.getElementById('detailsOfDefault').disabled = true;
		document.getElementById('extOfCompromiseAndWriteoff').disabled = true;
		</script>
	<%} else {%>
	<script language="JavaScript" >	
	document.all.isBorrDefaulterWithBank[0].checked = true;	
		document.getElementById('detailsOfDefault').disabled = false;
		document.getElementById('extOfCompromiseAndWriteoff').disabled =false;
		</script>
			<%}%>
	
	<%if (value.getIsCibilStatusClean() == null
					|| value.getIsCibilStatusClean().equals("") 
					|| value.getIsCibilStatusClean().equals("Yes")) {%>
					<script language="JavaScript" >
		document.all.isCibilStatusClean[0].checked = true;
		document.getElementById('detailsOfCleanCibil').disabled = true;
		 </script>
	
	<%} else {%>
		
	<%if (value.getIsCibilStatusClean().equals("No")) {%>
	<script language="JavaScript" >
	document.all.isCibilStatusClean[1].checked = true;
	document.getElementById('detailsOfCleanCibil').disabled = false;
	 </script>
	<%} else {%>
	<script language="JavaScript" >
	}
	document.getElementById('detailsOfCleanCibil').disabled = true;
	 </script>
	<%}
			}%>	
	
	<%if (value.getIsDirectorMoreThanOne() == null
					|| value.getIsDirectorMoreThanOne().equals("")) {%>
					
			<script language="JavaScript" >
		document.all.isDirectorMoreThanOne[1].checked = true;
		document.getElementById('nameOfDirectorsAndCompany').disabled = true;
		 </script>
	<%} else {%>
	<script language="JavaScript" >
			document.all.isDirectorMoreThanOne[0].checked = true;
			document.getElementById('nameOfDirectorsAndCompany').disabled = false;
			 </script>
	<%}%>
	
	
	
	
		
	<%if (value.getIsRBIWilfulDefaultersList() == null
					|| value.getIsRBIWilfulDefaultersList().equals("No")|| value.getIsRBIWilfulDefaultersList().equals("")) {	
					%>
					<script language="JavaScript" >
		document.all.isRBIWilfulDefaultersList[1].checked = true;
		document.getElementById('nameOfBank').disabled = true;
		document.all.isDirectorMoreThanOne[0].disabled = true;
		document.all.isDirectorMoreThanOne[1].disabled = true;
		 </script>
	<%} else {%>
	<script language="JavaScript" >
		document.getElementById('nameOfBank').disabled = false;
		document.all.isDirectorMoreThanOne[0].disabled = false;
		document.all.isDirectorMoreThanOne[1].disabled = false;
		 </script>
	<%}%>
		<%
			if(value.getWillfulDefaultStatus().equals("NOT_DEFAULTER")){
		%>
				 <script language="JavaScript" >
				 document.getElementById("spanPIF11").style.display = "none";
		         document.getElementById("spanPIF12").style.display = '';
		         document.getElementById("spanPIF13").style.display = "none";
		         document.getElementById("spanPIF14").style.display = '';
				 document.getElementById("dateWillfulDefault").disabled=true;
				 document.getElementById("suitFilledStatus").disabled= true;
				 document.getElementById("suitReferenceNo").disabled= true;
				 document.getElementById("suitAmount").disabled= true;
				 document.getElementById("dateOfSuit").disabled= true;
				 document.getElementById("dateWillfulDefault").value='';
				 document.getElementById("suitFilledStatus").value= '';
				 document.getElementById("suitReferenceNo").value= '';
				 document.getElementById("suitAmount").value= '';
				 document.getElementById("dateOfSuit").value= '';
				 </script>
		<%	}else{ %>
		<script language="JavaScript" >		 
		document.getElementById("spanPIF11").style.display = '';
		         document.getElementById("spanPIF12").style.display = "none";
		         document.getElementById("spanPIF13").style.display = '';
		         document.getElementById("spanPIF14").style.display = "none";
				 document.getElementById("dateWillfulDefault").disabled=false;
				 document.getElementById("suitFilledStatus").disabled= false;
				 document.getElementById("suitReferenceNo").disabled= false;
				 document.getElementById("suitAmount").disabled= false;
				 document.getElementById("dateOfSuit").disabled= false;
				 </script>
		<% } %>
	
	
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" />
	<html:hidden name="ManualInputCustomerInfoForm"
	property="domicileCountry" value="IN" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="sublineListEmpty" />
		
		
	<html:hidden name="ManualInputCustomerInfoForm"
		property="customerNameShort" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address2" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address3" />

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
	<html:hidden name="ManualInputCustomerInfoForm" property="region" />
	<html:hidden name="ManualInputCustomerInfoForm" property="country" />
	<html:hidden name="ManualInputCustomerInfoForm" property="state" />
	<html:hidden name="ManualInputCustomerInfoForm" property="city" />
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
	<!--End Santosh LEI CR  -->		
	<input type="hidden" name="event">
	<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
	<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />

	<html:hidden name="ManualInputCustomerInfoForm" property="bankName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="postcode" />
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
		property="systemListEmpty" />
		
		
		<html:hidden name = "ManualInputCustomerInfoForm" property="panValGenParamFlag" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="isPanValidated"  />
		
		<html:hidden name = "ManualInputCustomerInfoForm" property="leiValGenParamFlag" styleId="leiValGenParamFlag" />
	<html:hidden name = "ManualInputCustomerInfoForm" property="isLeiValidated" styleId="isLeiValidated" />
		
		
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
		
		<html:hidden name="ManualInputCustomerInfoForm" property="finalBankMethodList" />
<html:hidden name="ManualInputCustomerInfoForm" property="leadValue" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="multBankNonFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankFundBasedHdfcBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedLeadBankPer" />
<html:hidden name="ManualInputCustomerInfoForm" property="consBankNonFundBasedHdfcBankPer" />
		 <html:hidden name="ManualInputCustomerInfoForm" property="cifId" />   
		
		<%if(directorList!=null && directorList.size()==0){ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="directorListEmpty" value="Y" />
		<%}else{ %>
		<html:hidden name="ManualInputCustomerInfoForm"
		property="directorListEmpty" value="N" />
		<%} %>
		
		<html:hidden name="ManualInputCustomerInfoForm" property="regOffice" />
		<html:hidden name = "ManualInputCustomerInfoForm" property="dpSharePercent" styleId="dpSharePercent" />
		<input type="hidden" name="ManualInputCustomerInfoForm" id="status" value="<%=value.getStatus()%>" />
		<jsp:include page="cri_hidden_details.jsp"></jsp:include>
		<jsp:include page="udf_hidden_details.jsp"></jsp:include>
</table>


<!-- InstanceEnd -->


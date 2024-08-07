<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.*"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>

<%ManualInputCustomerInfoForm form = (ManualInputCustomerInfoForm) request
.getAttribute("ManualInputCustomerInfoForm");
	//List sr = (List) request.getAttribute("partyGroupList");
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


<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%><script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/itgDualList.js"></script>
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

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function saveForm() {

	document.getElementById('customerdetails').style.display = '';
   
}
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
				<tr>
					<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInfo">
						<thead>
						</thead>
						<tbody>
							<tr class="odd">
								<td class="fieldname" width="20%">Branch Code</td>
								<td width="30%">&nbsp;</td>
								<td class="fieldname" width="20%">Borrower DUNS number</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getBorrowerDUNSNo()%>"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname" width="20%">Customer Name</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getLegalName()%>"/></td>
								<td class="fieldname" width="20%">PAN</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getPan()%>"/></td>
							</tr>
							<tr class="odd">
								
								<td class="fieldname" width="20%">Party Consent</td>
								<td width="30%"><input type="checkbox" name="checkbox3"
									id="checkbox3"></td>
									<td  class="fieldname" width="20%">&nbsp;</td>
										<td  width="30%">&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Address 1</td>
								<td><integro:empty-if-null value="<%=form.getOfficeAddress1()%>"/></td>
								<td class="fieldname">Address 2</td>
								<td><integro:empty-if-null value="<%=form.getOfficeAddress2()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Address 3</td>
								<td><integro:empty-if-null value="<%=form.getOfficeAddress3()%>"/></td>
								<td class="fieldname">Country</td>
								<td><integro:empty-if-null value="<%=form.getOfficeCountry()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Pincode</td>
								<td><integro:empty-if-null value="<%=form.getOfficePostCode()%>"/></td>
								<td class="fieldname">Region</td>
								<td><integro:empty-if-null value="<%=form.getOfficeRegion()%>"/></td>
								
							</tr>
							<tr class="even">
								<td class="fieldname">State</td>
								<td><integro:empty-if-null value="<%=form.getOfficeState()%>"/>&nbsp;</td>
								<td class="fieldname">City</td>
								<td><integro:empty-if-null value="<%=form.getOfficeCity()%>"/>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Telephone Number</td>
								<td><integro:empty-if-null value="<%=form.getOfficeTelephoneNo()%>"/></td>
								<td class="fieldname">Fax No.</td>
								<td><integro:empty-if-null value="<%=form.getOfficeTelex()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Email</td>
								<td><integro:empty-if-null value="<%=form.getOfficeEmail()%>"/></td>
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Class of Activity 1</td>
								<td><integro:empty-if-null value="<%=form.getClassActivity1()%>"/></td>
								<td class="fieldname">Class of Activity 2</td>
								<td><integro:empty-if-null value="<%=form.getClassActivity2()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Class of Activity 3</td>
								<td><integro:empty-if-null value="<%=form.getClassActivity3()%>"/></td>
								<td class="fieldname">Registered office DUNS No.</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeDUNSNo()%>"/></td>
							</tr>
							<tr>
							<td class="fieldname" width="20%">Registered Office</td>
								<td width="30%"><input type="checkbox" name="checkbox"
									id="checkbox"></td>
									<td  class="fieldname" width="20%">&nbsp;</td>
										<td  width="30%">&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Registered Office Address 1</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeAddress1()%>"/></td>
								<td class="fieldname">Registered Office Address 2</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeAddress2()%>"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname">Registered Office Address 3</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeAddress3()%>"/></td>
								<td class="fieldname">Country</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeCountry()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Pincode</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficePostCode()%>"/></td>
								<td class="fieldname">Region</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeRegion()%>"/>&nbsp;</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">State</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeState()%>"/>&nbsp;</td>
								<td class="fieldname">City</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeCity()%>"/>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Telephone Number</td>
								<td>
								<integro:empty-if-null value="<%=form.getRegOfficeTelephoneNo()%>"/></td>
								<td class="fieldname">Fax No.</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeTelex()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Email</td>
								<td><integro:empty-if-null value="<%=form.getRegOfficeEmail()%>"/></td>
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
								<td class="fieldname" width="20%">Willful Default status</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getWillfulDefaultStatus()%>"/></td>
								<td class="fieldname" width="20%">Date classified as
								willful default</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getDateWillfulDefault()%>"/>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname" width="20%">Suit Filed Status</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getSuitFilledStatus()%>"/></td>
								<td class="fieldname" width="20%">Suit Reference No.</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getSuitReferenceNo()%>"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname" width="20%">Suit Amount</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getSuitAmount()%>"/> </td>
								<td class="fieldname" width="20%">Date of Suit</td>
								<td width="30%"><integro:empty-if-null value="<%=form.getDateOfSuit()%>"/><html:errors property="dateOfSuit" />&nbsp;</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>

				
		</table>
		</td>
	</tr>
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" />
	<html:hidden name="ManualInputCustomerInfoForm"property="domicileCountry" value="IN" />
	<html:hidden name="ManualInputCustomerInfoForm" property="customerNameShort" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address1" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address2" />
	<html:hidden name="ManualInputCustomerInfoForm" property="address3" />
	<html:hidden name="ManualInputCustomerInfoForm" property="email" />
    <html:hidden name="ManualInputCustomerInfoForm" property="customerBranch" />
	<html:hidden name="ManualInputCustomerInfoForm" property="customerSegment" />
	<html:hidden name="ManualInputCustomerInfoForm" property="status" />
	<html:hidden name="ManualInputCustomerInfoForm" property="partyGroupName" />
	<html:hidden name="ManualInputCustomerInfoForm" property="groupExposer" />
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgrEmpCode" />		
	<html:hidden name="ManualInputCustomerInfoForm" property="relationshipMgr" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rmRegion" />
	<html:hidden name="ManualInputCustomerInfoForm" property="cycle" />
	<html:hidden name="ManualInputCustomerInfoForm" property="entity" />
	<html:hidden name="ManualInputCustomerInfoForm" property="rbiIndustryCode" />
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
	<html:hidden name="ManualInputCustomerInfoForm" property="telephoneNo" />
	<html:hidden name="ManualInputCustomerInfoForm" property="telex" />
	
	
	<html:hidden name="ManualInputCustomerInfoForm" property="subLine" />
	<html:hidden name="ManualInputCustomerInfoForm" property="bankingMethod" />
	<html:hidden name="ManualInputCustomerInfoForm" property="exceptionalCases" />
	<html:hidden name="ManualInputCustomerInfoForm" property="totalFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="totalNonFundedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="fundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm" property="nonFundedSharePercent" />
	<html:hidden name="ManualInputCustomerInfoForm" property="memoExposure" />
	<html:hidden name="ManualInputCustomerInfoForm" property="totalSanctionedLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="mpbf" />
	<html:hidden name="ManualInputCustomerInfoForm" property="fundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm" property="nonFundedShareLimit" />
	<html:hidden name="ManualInputCustomerInfoForm"
		property="legalName" />
<html:hidden name="ManualInputCustomerInfoForm" property="nodalLead" />
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


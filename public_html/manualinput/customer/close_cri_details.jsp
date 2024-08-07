<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.commondata.app.CommonDataSingleton,
	com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>

<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="java.util.Locale"%><script type="text/javascript" src="js/calendar.js"></script>
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
List currencyList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.currencyList");

if (!(currencyList == null)) {
	pageContext.setAttribute("currencyList", currencyList);
	session.setAttribute("currencyList", currencyList);
	 
	}

Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
request.setAttribute("ManualInputCustomerInfoForm",value);

	int sno = 0;
	int no = 0;
	List facList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.facList");
	System.out.println("************************************ "+	session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.facList"));
	if (!(facList == null)) {
		pageContext.setAttribute("facList", facList);
	}
	
			List countryList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryList");
			
				if (!(countryList == null)) {
		
		pageContext.setAttribute("countryList", countryList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	
	
 	    List facNameList=(List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.facNameList");
	
					if (!(facNameList == null)) {
		
		pageContext.setAttribute("facNameList", facNameList);
		//request.setAttribute("otherBankList", otherBankList);
	} 
	
	
	 	    List securityNameList=(List) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.securityNameList");
	
					if (!(securityNameList == null)) {
		
		pageContext.setAttribute("securityNameList", securityNameList);
		//request.setAttribute("otherBankList", otherBankList);
	}
	
	
	
	

%>
<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->

<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%><head>
<%@page import="com.integrosys.base.techinfra.mapper.MapperUtil"%><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>

<head>





<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="java.util.ArrayList"%>
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

function addCriFacilityList(){
	document.forms[0].action="ManualInputCustomer.do?event=add_cri_fac_list";
	
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html>

<bean:define id="formObj" name="ManualInputCustomerInfoForm" scope="request" type="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"/>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	
	<jsp:include page="non_cri_hidden_details.jsp"></jsp:include>
		<jsp:include page="udf_hidden_details.jsp"/>	
	<tr background="red">
						<td width="100%" colspan="4">
						<h3>CRI Details </h3>
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
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						class="tblInfo">
						<thead>
						</thead>
						<tbody>
							<tr class="odd">
								<td class="fieldname" width="20%">Name of the Customer</td>
									<td width="30%">
								<bean:write
									name="ManualInputCustomerInfoForm" property="customerNameShort"></bean:write> &nbsp;</td>
								<td class="fieldname" width="20%">Constitution</td>
								<td width="30%">
								<integro:common-code
												categoryCode="<%=CategoryCodeConstant.ENTITY%>"
												entryCode="<%=formObj.getEntity()%>"
												descWithCode="false"  display="true"/>
								<%--<html:text property="legalConstitution" value="<%=formObj.getEntity() %>" readonly="true"></html:text> 
								--%>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname" width="20%">PAN</td>
								<td width="30%"><bean:write name="ManualInputCustomerInfoForm"
									property="pan"></bean:write>&nbsp;
									</td>
								<td class="fieldname" width="20%">Customer RAM Id</td>
								<td width="30%"><html:text property="customerRamID" maxlength="20"  value="<%=formObj.getCustomerRamID()%>" readonly="true">
								</html:text><html:errors property="customerRamID"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname" width="20%">Customer APR Code</td>
								<td width="30%"><html:text property="customerAprCode"
									 maxlength="10" value="<%=formObj.getCustomerAprCode()%>" readonly="true"></html:text><html:errors property="customerAprCode" /></td>
								<td class="fieldname" width="20%">Customer External Rating</td>
								<td width="30%"><html:textarea property="customerExtRating" rows="5" cols="50" readonly="true"></html:textarea></td>
							</tr>
							<tr class="odd">
							<html:hidden property="customerFyClouser"/>
										<td class="fieldname" width="20%">Customer FY Closure</td>
										<td><html:select property="customerFyClouser" style="width:225" disabled="true">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.CUSTOMER_FY_CLOSUER%>"
									descWithCode="false" />
								</html:select><html:errors property="customerFyClouser"/></td>
								     <td></td>
									</tr>
							<tr class="even">
								<td class="fieldname">NBFC</td>
								<td>
								<html:hidden property="isNbfs"/>
								<%if(formObj.getIsNbfs() != null && formObj.getIsNbfs().equals("Yes")){ %>
									<input type="radio" name="isNbfs" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isNbfs" value="No" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsNbfs() == null || formObj.getIsNbfs().equals("No")){ %>
									<input type="radio" name="isNbfs" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isNbfs" value="No" checked="checked" disabled="disabled"/> No
								<%} %>
								<html:errors property="isNbfs"/>
								</td>
								<td class="fieldname">
								<p>a)</p>
								<p>b)</p>
								</td>
								<td>
								<html:hidden property="nbfsA"/>
								<html:hidden property="nbfsB"/>
								<p><integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_NBFC_A%>" entryCode="<%=value.getNbfsA() %>"
									descWithCode="false" display="true" /></p>
								<p><integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_NBFC_B%>" entryCode="<%=value.getNbfsA() %>"
									descWithCode="false" display="true" /><html:errors property="nbfsB"/></p>
								</td>
							</tr>
							<tr class="odd">
							<td class="fieldname">Group Exposure</td>
								<td><logic:present name="partyGroupList">
												<logic:iterate id="ob" name="partyGroupList"
													type="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"
													 scope="page">
													<%
													//System.out.println("here:::::::::"+formObj.getPartyGroupName());
														if (formObj.getPartyGroupName() != null && formObj.getPartyGroupName().equals(String.valueOf(ob.getId())) ) {
															System.out.println(formObj.getPartyGroupName());
													%>
													<html:text property="groupExposer" value="<%=String.valueOf( ob.getGroupExpLimit().getAmountAsBigDecimal()) %>" readonly="true"></html:text>
													<%
														} 
													%>
												</logic:iterate>
											</logic:present>
								</td>
								<td class="fieldname">MSME Classification</td>
								<td>
								<html:hidden property="msmeClassification"/>
								<html:select property="msmeClassification" style="width:225" disabled="true">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_MSME_CLASSIC%>"
									descWithCode="false" />
								</html:select>&nbsp;</td>
								<html:errors property="msmeClassification"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname">
								<p>Weaker Section</p>
								</td>
								<td>
								<html:hidden property="isWeakerSection"/>
								<%if(formObj.getIsWeakerSection() != null && formObj.getIsWeakerSection().equals("Yes")){ %>
									<input type="radio" name="isWeakerSection" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isWeakerSection" value="No" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsWeakerSection() == null || formObj.getIsWeakerSection().equals("No")){ %>
									<p><input type="radio" name="isWeakerSection" value="Yes" disabled="disabled"/> Yes
									<p><input type="radio" name="isWeakerSection" value="No" checked="checked" disabled="disabled"/> No
								<%} %>
								<html:errors property="isWeakerSection"/>
								</td>
								<td class="fieldname">Type</td>
								<td>
								<html:hidden property="weakerSection"/>
								<p><bean:write name="ManualInputCustomerInfoForm"
									property="weakerSection"></bean:write>&nbsp;<html:errors property="weakerSection"/></p>
								<p><html:text property="govtSchemeType"  readonly="true"/></p>
								</td>
							</tr>
							
							<tr class="odd">
								<td class="fieldname">Minority Community</td>
								<td>
								<html:hidden property="isMinorityCommunity"/>
								<%if(formObj.getIsMinorityCommunity() != null && formObj.getIsMinorityCommunity().equals("Yes")){ %>
								<input type="radio" name="isMinorityCommunity" value="Yes" checked="checked" disabled="disabled"/> Yes
								<input type="radio" name="isMinorityCommunity" value="No" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsMinorityCommunity() == null || formObj.getIsMinorityCommunity().equals("No")){ %>
								<input type="radio" name="isMinorityCommunity" value="Yes"disabled="disabled"/> Yes
								<input type="radio" name="isMinorityCommunity" value="No"  checked="checked" disabled="disabled"/> No
								<%} %>
								<html:errors property="isMinorityCommunity"/>
								<p><bean:write name="ManualInputCustomerInfoForm"
									property="minorityCommunity"></bean:write>&nbsp;<html:errors property="minorityCommunity"/></p>
								</td>
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
								<td class="fieldname">Commodities Exposure</td>
								<td>
								<%if(formObj.getIsCommoditiesExposer() != null && formObj.getIsCommoditiesExposer().equals("Yes")){ %>
									<input type="radio" name="isCommoditiesExposer" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isCommoditiesExposer" value="No" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsCommoditiesExposer() == null || formObj.getIsCommoditiesExposer().equals("No") 
										|| formObj.getIsCommoditiesExposer().equals("")){ %>
									<input type="radio" name="isCommoditiesExposer" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isCommoditiesExposer" value="No" checked="checked"  disabled="disabled"/> No
								<%} %>
								<html:errors property="isCommoditiesExposer"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Sensitive</td>
								<td>
								<html:hidden property="isSensitive"/>
								<%if(formObj.getIsSensitive() != null && formObj.getIsSensitive().equals("Yes")){ %>
								<input type="radio" name="isSensitive" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isSensitive" value="No" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsSensitive() == null || formObj.getIsSensitive().equals("No")){ %>
								<!-- Uma Khot- commented as when Sensitive value is No then also 'No' Checkbox should be checked
							 <input type="radio" name="isSensitive" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isSensitive" value="No" disabled="disabled"/> No -->	
									<input type="radio" name="isSensitive" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isSensitive" value="No"  checked="checked" disabled="disabled"/> No
								<%} %>
								<html:errors property="isSensitive"/>
								</td>
								<td class="fieldname">Commodity Name</td>
								<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.CommonCode_COMMODITY_NAMES%>"
												entryCode="<%=value.getCommoditiesName()%>"
												descWithCode="false"  display="true" />
								<html:hidden property="commoditiesName"/><html:errors property="commoditiesName"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname">Gross Investment (In plant and
								machinery) (INR)</td>
								<td>
								Rs.<html:text property="grossInvsInPM" maxlength="23" readonly="true"/>&nbsp; millions<html:errors property="msmeGrossInvsInPM"/>
								<html:errors property="grossInvsInPM"/></td>
								<td class="fieldname">Gross Investment (In equipment) (INR) </td>
								<td>
								Rs.<html:text property="grossInvsInEquip" maxlength="23" readonly="true"/>&nbsp; millions<html:errors property="grossInvsInEquip"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">PSU</td>
								<td>
								<p>
								<html:hidden property="psu"/>
								<%if(formObj.getPsu() == null || formObj.getPsu().equals("No")){ %>
									<input type="radio" name="psu" value="State" disabled="disabled"/> State
									<input type="radio" name="psu" value="Central" disabled="disabled"/> Central
									<input type="radio" name="psu" value="No"  checked="checked" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getPsu() != null && formObj.getPsu().equals("State")){ %>
									<input type="radio" name="psu" value="State"   checked="checked" disabled="disabled"/> State
									<input type="radio" name="psu" value="Central" disabled="disabled"/> Central
									<input type="radio" name="psu" value="No"disabled="disabled"/> No
								<%} %>
								<%if(formObj.getPsu() != null && formObj.getPsu().equals("Central")){ %>
									<input type="radio" name="psu" value="State" disabled="disabled"/> State
									<input type="radio" name="psu" value="Central"   checked="checked" disabled="disabled"/> Central
									<input type="radio" name="psu" value="No" disabled="disabled"/> No
								<%} %>
								
								<html:errors property="psu"/>
								</p>
								</td>
								<td class="fieldname">Percentage of Shareholding</td>
								<td>
								<p><html:text property="psuPercentage" maxlength="5" readonly="true"/><html:errors property="psuPercentage"/></p>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Govt. Undertaking</td>
								<td>
								<html:hidden property="govtUnderTaking"/>
								<%if(formObj.getGovtUnderTaking() == null || formObj.getGovtUnderTaking().equals("No")){ %>
								<input type="radio" name="govtUnderTaking" value="State"disabled="disabled"/> State
								<input type="radio" name="govtUnderTaking" value="Central" disabled="disabled"/> Central
								<input type="radio" name="govtUnderTaking" value="No"  checked="checked"  disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getGovtUnderTaking() != null && formObj.getGovtUnderTaking().equals("State")){ %>
								<input type="radio" name="govtUnderTaking" value="State"disabled="disabled"/> State
								<input type="radio" name="govtUnderTaking" value="Central" disabled="disabled"/> Central
								<input type="radio" name="govtUnderTaking" value="No"  checked="checked"  disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getGovtUnderTaking() != null && formObj.getGovtUnderTaking().equals("Central")){ %>
								<input type="radio" name="govtUnderTaking" value="State"disabled="disabled"/> State
								<input type="radio" name="govtUnderTaking" value="Central" disabled="disabled"/> Central
								<input type="radio" name="govtUnderTaking" value="No"  checked="checked"  disabled="disabled"/> No 
								<%} %>
								<html:errors property="govtUnderTaking"/>
								</td>
								<td class="fieldname">Banking Method</td>
								<td><bean:write name="ManualInputCustomerInfoForm"
									property="bankingMethod"></bean:write>&nbsp;</td>
							</tr>
							
							<tr class="odd">
								<td class="fieldname">SEMS Guidelines Applicable</td>
								<td>
								<html:hidden property="isSemsGuideApplicable"/>
								<%if(formObj.getIsSemsGuideApplicable() == null || formObj.getIsSemsGuideApplicable().equals("No")){ %>
								<input type="radio" name="isSemsGuideApplicable" value="Yes" disabled="disabled"/> Yes
								<input type="radio" name="isSemsGuideApplicable" value="No" checked="checked"  disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsSemsGuideApplicable() != null && formObj.getIsSemsGuideApplicable().equals("Yes")){ %>
								<input type="radio" name="isSemsGuideApplicable" value="Yes" checked="checked"  disabled="disabled"/> Yes
								<input type="radio" name="isSemsGuideApplicable" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isSemsGuideApplicable"/>
								</td>
								<td class="fieldname">Whether fails under IFC&rsquo;s
								Exclusion List</td>
								<td>
								<html:hidden property="isFailIfcExcluList"/>
								<%if(formObj.getIsFailIfcExcluList() == null || formObj.getIsFailIfcExcluList().equals("No")){ %>
									<input type="radio" name="isFailIfcExcluList" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isFailIfcExcluList" value="No" checked="checked"  disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsFailIfcExcluList() != null && formObj.getIsFailIfcExcluList().equals("Yes")){ %>
									<input type="radio" name="isFailIfcExcluList" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isFailIfcExcluList" value="No" disabled="disabled"/> No
								<%} %>
								
								<html:errors property="isFailIfcExcluList"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">TUFS</td>
								<td>
								<html:hidden property="isTufs"/>
								<%if(formObj.getIsTufs() == null || formObj.getIsTufs().equals("No")){ %>
									<input type="radio" name="isTufs" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isTufs" value="No"  checked="checked"  disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsTufs() != null && formObj.getIsTufs().equals("Yes")){ %>
									<input type="radio" name="isTufs" value="Yes" checked="checked" disabled="disabled"/> Yes 
									<input type="radio" name="isTufs" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isTufs"/>
								</td>
								<td class="fieldname">RBI Defaulter&rsquo;s list / Caution
								List</td>
								<td>
								<p>
								<html:hidden property="isRbiDefaulter"/>
								<%if(formObj.getIsRbiDefaulter() == null || formObj.getIsRbiDefaulter().equals("Yes")){ %>
									<input type="radio" name="isRbiDefaulter" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isRbiDefaulter" value="No" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsRbiDefaulter() != null && formObj.getIsRbiDefaulter().equals("No")){ %>
									<input type="radio" name="isRbiDefaulter" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isRbiDefaulter" value="No" checked="checked" disabled="disabled"/> No
								<%} %>
								<html:errors property="isRbiDefaulter"/>
								<p>
								<html:hidden property="rbiDefaulter"/>
								<%if(formObj.getRbiDefaulter() != null && formObj.getRbiDefaulter().equals("Company")){ %>
								<input type="radio" name="rbiDefaulter" value="Company" checked="checked" disabled="disabled"/> Company
								<input type="radio" name="rbiDefaulter" value="Directors" disabled="disabled"/> Directors
								<input type="radio" name="rbiDefaulter" value="Group Companies" disabled="disabled"/> Group Companies
								<%} %>
								<%if(formObj.getRbiDefaulter() != null && formObj.getRbiDefaulter().equals("Directors")){ %>
								<input type="radio" name="rbiDefaulter" value="Company" disabled="disabled"/> Company
								<input type="radio" name="rbiDefaulter" value="Directors"  checked="checked" disabled="disabled"/> Directors 
								<input type="radio" name="rbiDefaulter" value="Group Companies" disabled="disabled"/>Group Companies
								<%} %>
								<%if(formObj.getRbiDefaulter() != null && formObj.getRbiDefaulter().equals("Group Companies")){ %>
								<input type="radio" name="rbiDefaulter" value="Company"disabled="disabled"/> Company
								<input type="radio" name="rbiDefaulter" value="Directors" disabled="disabled"/> Directors
								<input type="radio" name="rbiDefaulter" value="Group Companies"  checked="checked" disabled="disabled"/> Group Companies
								<%} %>
								<%if(formObj.getRbiDefaulter() != null && formObj.getRbiDefaulter().equals("")){ %>
								<input type="radio" name="rbiDefaulter" value="Company"disabled="disabled"/> Company
								<input type="radio" name="rbiDefaulter" value="Directors" disabled="disabled"/> Directors
								<input type="radio" name="rbiDefaulter" value="Group Companies"  disabled="disabled"/> Group Companies
								<%} %>
								<html:errors property="rbiDefaulter"/>
								</p>
								</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Litigations Pending / contemplated by
								Banks / Financiers</td>
								<td>
								<html:hidden property="isLitigation"/>
								<%if(formObj.getIsLitigation() == null || formObj.getIsLitigation().equals("No")){ %>
								<input type="radio" name="isLitigation" value="Yes" disabled="disabled"/> Yes
								<input type="radio" name="isLitigation" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsLitigation() != null && formObj.getIsLitigation().equals("Yes")){ %>
								<input type="radio" name="isLitigation" value="Yes" checked="checked" disabled="disabled"/> Yes
								<input type="radio" name="isLitigation" value="No" disabled="disabled"/> No
								<%} %>
								
								<html:errors property="isLitigation"/>
								<html:text property="litigationBy" readonly="true"/><html:errors property="litigationBy"/>
								</td>
								<td class="fieldname">Interest of Directors / Senior
								officers / (Credit approvers) of the bank</td>
								<td>
								<html:hidden property="isInterestOfBank"/>
								<%if(formObj.getIsInterestOfBank() == null || formObj.getIsInterestOfBank().equals("No")){ %>
								<input type="radio" name="isInterestOfBank" value="Yes" disabled="disabled"/> Yes
								<input type="radio" name="isInterestOfBank" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsInterestOfBank() != null && formObj.getIsInterestOfBank().equals("Yes")){ %>
								<input type="radio" name="isInterestOfBank" value="Yes"  checked="checked" disabled="disabled"/> Yes
								<input type="radio" name="isInterestOfBank" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isInterestOfBank"/>
								<html:text property="interestOfBank" readonly="true"/><html:errors property="interestOfBank" />
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Adverse Remark (if Any)</td>
								<td>
								<html:hidden property="isAdverseRemark"/>
								<%if(formObj.getIsAdverseRemark() == null || formObj.getIsAdverseRemark().equals("No")){ %>
									<input type="radio" name="isAdverseRemark" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isAdverseRemark" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsAdverseRemark() != null && formObj.getIsAdverseRemark().equals("Yes")){ %>
									<input type="radio" name="isAdverseRemark" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isAdverseRemark" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isAdverseRemark"/>
								<html:text property="adverseRemark" readonly="true"/>
								<html:errors property="adverseRemark" /></td>
								<td class="fieldname">Audit<font color="red">*</font></td>
								<td>
								<html:hidden property="auditType"/>
								<%if(formObj.getAuditType() != null && formObj.getAuditType().equals("Internal Audit")){ %>
								<input type="radio" name="auditType" value="Internal Audit" checked="checked" disabled="disabled"/> Internal Audit
								<input type="radio" name="auditType" value="External Audit" disabled="disabled"/> External Audit
								<input type="radio" name="auditType" value="RBI Audit" disabled="disabled"/> RBI Audit
								<%} %>
								<%if(formObj.getAuditType() != null && formObj.getAuditType().equals("External Audit")){ %>
								<input type="radio" name="auditType" value="Internal Audit" disabled="disabled"/> Internal Audit
								<input type="radio" name="auditType" value="External Audit" checked="checked" disabled="disabled"/> External Audit 
								<input type="radio" name="auditType" value="RBI Audit" disabled="disabled"/> RBI Audit
								<%} %>
								<%if(formObj.getAuditType() != null && formObj.getAuditType().equals("RBI Audit")){ %>
								<input type="radio" name="auditType" value="Internal Audit" disabled="disabled"/> Internal Audit
								<input type="radio" name="auditType" value="External Audit" disabled="disabled"/> External Audit
								<input type="radio" name="auditType" value="RBI Audit" checked="checked" disabled="disabled"/> RBI Audit
								<%} %>
								<%if(formObj.getAuditType() != null && formObj.getAuditType().equals("")){ %>
								<input type="radio" name="auditType" value="Internal Audit" disabled="disabled"/> Internal Audit
								<input type="radio" name="auditType" value="External Audit" disabled="disabled"/> External Audit
								<input type="radio" name="auditType" value="RBI Audit"  disabled="disabled"/> RBI Audit
								<%} %>
								<html:errors property="auditType"/>
								  </td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Average Annual turnover (In Million INR)</td>
								<td><html:text property="avgAnnualTurnover" maxlength="23" readonly="true"/><html:errors property="avgAnnualTurnover"/></td>
								<td class="fieldname">RBI Industry Code</td>
								<td>
									<%=("".equals(value.getRbiIndustryCode()) || value.getRbiIndustryCode()==null)?"-":value.getRbiIndustryCode()+"-" %>
								<integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>"
												entryCode="<%=value.getRbiIndustryCode()%>" descWithCode="false"
												  display="true" /></td>
							</tr>
							<tr class="even">
								<td class="fieldname">Industry</td>
								<td><bean:write
									name="ManualInputCustomerInfoForm" property="industryName"></bean:write></td>
								<td class="fieldname">Industry Exposure % </td>
								<td><html:text property="industryExposer" maxlength="7" readonly="true"/><html:errors property="industryExposer"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Is the borrower a director (including
								the chairman/ Managing Director) of other banks</td>
								<td>
								<html:hidden property="isDirecOtherBank"/>
								<%if(formObj.getIsDirecOtherBank() == null || formObj.getIsDirecOtherBank().equals("No")){ %>
									<input type="radio" name="isDirecOtherBank" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isDirecOtherBank" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsDirecOtherBank() != null && formObj.getIsDirecOtherBank().equals("Yes")){ %>
									<input type="radio" name="isDirecOtherBank" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isDirecOtherBank" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isDirecOtherBank"/>
								<html:text property="direcOtherBank" readonly="true"/><html:errors property="direcOtherBank"/></td>
								<td class="fieldname">Is the partner / guarantor of the
								borrowing firm a director of other banks</td>
								<td>
								<html:hidden property="isPartnerOtherBank"/>
								<%if(formObj.getIsPartnerOtherBank() == null || formObj.getIsPartnerOtherBank().equals("No")){ %>
									<input type="radio" name="isPartnerOtherBank" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isPartnerOtherBank" value="No" checked="checked" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsPartnerOtherBank() != null && formObj.getIsPartnerOtherBank().equals("Yes")){ %>
									<input type="radio" name="isPartnerOtherBank" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isPartnerOtherBank" value="No" disabled="disabled"/> No
								<%} %>
								
								<html:errors property="isPartnerOtherBank"/>
								<html:text property="partnerOtherBank" readonly="true"/><html:errors property="partnerOtherBank"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Is the &ldquo;substantial&rdquo;
								shareholder / director / guarantor of the borrowing company a
								director of other banks</td>
								<td>
								<html:hidden property="isSubstantialOtherBank"/>
								<%if(formObj.getIsSubstantialOtherBank() == null || formObj.getIsSubstantialOtherBank().equals("No")){ %>
								<input type="radio" name="isSubstantialOtherBank" value="Yes" disabled="disabled"/> Yes
								<input type="radio" name="isSubstantialOtherBank" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsSubstantialOtherBank() != null && formObj.getIsSubstantialOtherBank().equals("Yes")){ %>
								<input type="radio" name="isSubstantialOtherBank" value="Yes" checked="checked" disabled="disabled"/> Yes
								<input type="radio" name="isSubstantialOtherBank" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isSubstantialOtherBank"/>
								<html:text property="substantialOtherBank" readonly="true"/><html:errors property="substantialOtherBank"/>
								</td>
								<td class="fieldname">Is the borrower a relative of HDFC
								Bank&rsquo;s Chairman / Managing directors or other directors</td>
								<td>
								<html:hidden property="isHdfcDirecRltv"/>
								<%if(formObj.getIsHdfcDirecRltv() == null || formObj.getIsHdfcDirecRltv().equals("No")){ %>
									<input type="radio" name="isHdfcDirecRltv" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isHdfcDirecRltv" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsHdfcDirecRltv() != null && formObj.getIsHdfcDirecRltv().equals("Yes")){ %>
									<input type="radio" name="isHdfcDirecRltv" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isHdfcDirecRltv" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isHdfcDirecRltv"/>
								<html:text property="hdfcDirecRltv" readonly="true"/><html:errors property="hdfcDirecRltv"/>
								</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Is the borrower a relative of the
								Chairman / Managing Directors / or other directors of other
								banks</td>
								<td>
								<html:hidden property="isObkDirecRltv"/>
								<%if(formObj.getIsObkDirecRltv() == null || formObj.getIsObkDirecRltv().equals("No")){ %>
									<input type="radio" name="isObkDirecRltv" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isObkDirecRltv" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsObkDirecRltv() != null && formObj.getIsObkDirecRltv().equals("Yes")){ %>
									<input type="radio" name="isObkDirecRltv" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isObkDirecRltv" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isObkDirecRltv"/>
								<html:text property="obkDirecRltv" readonly="true"/><html:errors property="obkDirecRltv"/>
								</td>
								<td class="fieldname">Is the partner/ guarantor / of the
								borrowing firm a relative of the Chairman / Managing Director or
								other directors of HDFC Bank or other Banks</td>
								<td>
								<html:hidden property="isPartnerDirecRltv"/>
								<%if(formObj.getIsPartnerDirecRltv() == null || formObj.getIsPartnerDirecRltv().equals("No")){ %>
									<input type="radio" name="isPartnerDirecRltv" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isPartnerDirecRltv" value="No" checked="checked" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsPartnerDirecRltv() != null && formObj.getIsPartnerDirecRltv().equals("Yes")){ %>
									<input type="radio" name="isPartnerDirecRltv" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isPartnerDirecRltv" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isPartnerDirecRltv"/>
								<html:text property="partnerDirecRltv" readonly="true"/><html:errors property="partnerDirecRltv"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Is the &ldquo;substantial&rdquo;
								shareholder / director / guarantor of the borrowing company a
								relative of the Chairman / Managing directors or other directors
								of HDFC Bank or other Banks</td>
								<td>
								<html:hidden property="isSubstantialRltvHdfcOther"/>
								<%if(formObj.getIsSubstantialRltvHdfcOther() == null || formObj.getIsSubstantialRltvHdfcOther().equals("No")){ %>
									<input type="radio" name="isSubstantialRltvHdfcOther" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isSubstantialRltvHdfcOther" value="No" checked="checked" disabled="disabled"/> No
								<%} %> 
								<%if(formObj.getIsSubstantialRltvHdfcOther() != null && formObj.getIsSubstantialRltvHdfcOther().equals("Yes")){ %>
									<input type="radio" name="isSubstantialRltvHdfcOther" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isSubstantialRltvHdfcOther" value="No" disabled="disabled"/> No
								<%} %> 
								<html:errors property="isSubstantialRltvHdfcOther"/>
								<html:text property="substantialRltvHdfcOther" readonly="true"/><html:errors property="substantialRltvHdfcOther"/>
								</td>
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Infrastructure Finance</td>
								<td>
								<html:hidden property="isInfrastructureFinanace"/>
								<%if(formObj.getIsInfrastructureFinanace() == null || formObj.getIsInfrastructureFinanace().equals("No")){ %>
								<input type="radio" name="isInfrastructureFinanace" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isInfrastructureFinanace" value="No" checked="checked" disabled="disabled"/> No
								<%} %> 
								<%if(formObj.getIsInfrastructureFinanace() != null && formObj.getIsInfrastructureFinanace().equals("Yes")){ %>
								<input type="radio" name="isInfrastructureFinanace" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isInfrastructureFinanace" value="No" disabled="disabled"/> No
								<%} %> 
								<html:errors property="isInfrastructureFinanace"/>
								</td>
								<td class="fieldname">
								<p>Type</p>
								</td>
								<td><bean:write name="ManualInputCustomerInfoForm"
									property="infrastructureFinanaceType"></bean:write>&nbsp;<html:errors property="infrastructureFinanaceType"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname">Project Finance</td>
								<td>
								<html:hidden property="isProjectFinance"/>
								<%if(formObj.getIsProjectFinance() == null || formObj.getIsProjectFinance().equals("No")){ %>
								<input type="radio" name="isProjectFinance" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isProjectFinance" value="No" checked="checked"  disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsProjectFinance() != null && formObj.getIsProjectFinance().equals("Yes")){ %>
								<input type="radio" name="isProjectFinance" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isProjectFinance" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isProjectFinance"/>
								</td>
								<td class="fieldname">Kisan Credit Card(KCC)</td>
								<td>
								<html:hidden property="isKisanCreditCard"/>
								<%if(formObj.getIsKisanCreditCard() == null || formObj.getIsKisanCreditCard().equals("No")){ %>
									<input type="radio" name="isKisanCreditCard" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isKisanCreditCard" value="No" checked="checked" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsKisanCreditCard() != null && formObj.getIsKisanCreditCard().equals("Yes")){ %>
									<input type="radio" name="isKisanCreditCard" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isKisanCreditCard" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isKisanCreditCard"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Permanent SSI Cert</td>
								<td>
								<html:hidden property="isPermenentSsiCert"/>
								<%if(formObj.getIsPermenentSsiCert() == null || formObj.getIsPermenentSsiCert().equals("No")
										|| formObj.getIsPermenentSsiCert().equals("")){ %>
									<input type="radio" name="isPermenentSsiCert" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isPermenentSsiCert" value="No" checked="checked"  disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsPermenentSsiCert() != null && formObj.getIsPermenentSsiCert().equals("Yes")){ %>
									<input type="radio" name="isPermenentSsiCert" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isPermenentSsiCert" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isPermenentSsiCert"/>
								</td>
								<td class="fieldname">Backed by Govt. </td>
								<td>
								<html:hidden property="isBackedByGovt"/>
								<%System.out.println("gggggggggg-----------------------------------------------"+formObj.getIsBackedByGovt()); %>
								<%if(formObj.getIsBackedByGovt() != null && formObj.getIsBackedByGovt().equals("State")){ %>
									<input type="radio" name="isBackedByGovt" value="State" checked="checked" disabled="disabled"/> State
									<input type="radio" name="isBackedByGovt" value="Central" disabled="disabled"/> Central
									<input type="radio" name="isBackedByGovt" value="No" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsBackedByGovt() != null && formObj.getIsBackedByGovt().equals("Central")){ %>
									<input type="radio" name="isBackedByGovt" value="State" disabled="disabled"/> State
									<input type="radio" name="isBackedByGovt" value="Central" checked="checked" disabled="disabled"/> Central
									<input type="radio" name="isBackedByGovt" value="No" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsBackedByGovt() == null || formObj.getIsBackedByGovt().equals("No") || formObj.getIsBackedByGovt().equals("")){ %>
									<input type="radio" name="isBackedByGovt" value="State" disabled="disabled"/> State
									<input type="radio" name="isBackedByGovt" value="Central" disabled="disabled"/> Central
									<input type="radio" name="isBackedByGovt" value="No" checked="checked" disabled="disabled"/> No
								<%} %>
								<html:errors property="isBackedByGovt"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Priority/Non priority Sector</td>
								<td>
								<html:hidden property="isPrioritySector"/>
								<%if(formObj.getIsPrioritySector() == null || formObj.getIsPrioritySector().equals("No")){ %>
								<input type="radio" name="isPrioritySector" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isPrioritySector" value="No" checked="checked"  disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsPrioritySector() != null && formObj.getIsPrioritySector().equals("Yes")){ %>
								<input type="radio" name="isPrioritySector" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isPrioritySector" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isPrioritySector"/>
								</td>
								<td class="fieldname">Capital Market Exposure</td>
								<td>
								<html:hidden property="isCapitalMarketExpos"/>
								<%if(formObj.getIsCapitalMarketExpos() == null || formObj.getIsCapitalMarketExpos().equals("No")){ %>
									<input type="radio" name="isCapitalMarketExpos" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isCapitalMarketExpos" value="No" checked="checked" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsCapitalMarketExpos() != null && formObj.getIsCapitalMarketExpos().equals("Yes")){ %>
									<input type="radio" name="isCapitalMarketExpos" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isCapitalMarketExpos" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isCapitalMarketExpos"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Real Estate Exposure</td>
								<td>
								<html:hidden property="isRealEstateExpos"/>
								<%if(formObj.getIsRealEstateExpos() == null || formObj.getIsRealEstateExpos().equals("No")){ %>
								<input type="radio" name="isRealEstateExpos" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isRealEstateExpos" value="No" checked="checked"  disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsRealEstateExpos() != null && formObj.getIsRealEstateExpos().equals("Yes")){ %>
								<input type="radio" name="isRealEstateExpos" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isRealEstateExpos" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isRealEstateExpos"/>
								</td>
								<td class="fieldname">&nbsp; </td>
								<td>&nbsp;	</td>
							</tr>
							<tr class="even">
							<td class="fieldname">1st Year </td>
							<td>
							<html:text property="firstYear" size="15" maxlength="4"  readonly="true"/>&nbsp; 
								<br></br><html:errors property="firstYear"/>
							</td>
							<td class="fieldname">1st year Turnover  </td>
							<td>
							<html:text property="firstYearTurnover"  readonly="true"/>&nbsp;
							<html:select property="firstYearTurnoverCurr"  value="<%=formObj.getFirstYearTurnoverCurr().trim()%>" disabled="true">
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                   <br></br> <html:errors property="firstYearTurnover"/>
							</td>
							</tr>
							<tr class="odd">
							
							<td class="fieldname">2nd Year  </td>
							<td>
							<html:text property="secondYear" size="15" maxlength="4" readonly="true"/>&nbsp;
						<br></br>	<html:errors property="secondYear"/>
							</td>
							<td class="fieldname">2nd year Turnover  </td>
							<td>
							<html:text property="secondYearTurnover"  readonly="true"/>&nbsp; 
						
                
                  		<html:select property="secondYearTurnoverCurr" value="<%=formObj.getSecondYearTurnoverCurr().trim()%>"  disabled="true">
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                    <br></br> <html:errors property="secondYearTurnover"/>
                    </td>
							
							</tr>
							
							<tr class="even">
							<td class="fieldname">3rd Year </td>
							<td>
							<html:text property="thirdYear" size="15" maxlength="4" readonly="true"/>&nbsp; 
							<br></br>	<html:errors property="thirdYear"/>
							</td>
							<td  class="fieldname">3rd year Turnover</td>
							<td>
							<html:text property="thirdYearTurnover" readonly="true"/>&nbsp; 
							<html:select property="thirdYearTurnoverCurr" value="<%=formObj.getThirdYearTurnoverCurr().trim()%>"  disabled="true">
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                   <br></br>  <html:errors property="thirdYearTurnover"/>
							</td>
							</tr>
							
						<!-- CRI start -->
												<tr class="odd">
										<td class="fieldname">Entity Type</td>
										<td><html:select property="entityType" style="width:250" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.ENTITY_TYPE%>"
													descWithCode="false" />
											</html:select> <html:errors property="msmeClassification" /></td>

										<td class="fieldname">
											<p>Is it SPV funding?</p>
										</td>
										<td><html:radio property="isSPVFunding"
												styleId="isSPVFunding" value="Yes"
												onclick="showHideWeakerSection();" disabled="true"  /> Yes <html:radio
												property="isSPVFunding" styleId="isSPVFunding" value="No"
												onclick="showHideWeakerSection();" disabled="true" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
									</tr>



									<tr class="even">
										<td class="fieldname">
											<p>Indirect Country Risk Exposure</p>
										</td>
										<td><input type="radio"
											name="indirectCountryRiskExposure" value="Yes"
											onclick="enableTag('criCountryName','salesPercentage');" disabled="true"/> Yes
											<input type="radio" name="indirectCountryRiskExposure"
											onclick="disableTag('criCountryName','salesPercentage');"
											checked="checked" value="No" disabled="true" /> No &nbsp; <html:errors
												property="indirectCountryRiskExposure" /></td>

										<td class="fieldname">
											<p>a)Country Name</p> </br>
											<p>b)% of Sales or Gross Revenue</p>
										</td>
										<td><html:select property="criCountryName" style="width:225"
												styleId="criCountryName" disabled="true"
												value="<%=formObj.getCriCountryName()%>" >

												<option value="">Please Select</option>
												<html:options collection="countryList" labelProperty="label"
													property="value" />

											</html:select> </br> </br> </br> <html:text property="salesPercentage" maxlength="20"
												value="<%=formObj.getSalesPercentage()%>"
												styleId="salesPercentage" readonly="true">
											</html:text> <html:errors property="salesPercentage" /></td>
									</tr>




									<tr class="odd">
										<td class="fieldname">Credit Guarantee Trust for Micro
											and Small Enterprises(CGTMSE)</td>
										<td><html:radio property="isCGTMSE" styleId="isCGTMSE"
												value="Yes" onclick="showHideWeakerSection();" disabled="true" /> Yes <html:radio
												property="isCGTMSE" styleId="isCGTMSE" value="No"
												onclick="showHideWeakerSection();" disabled="true" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
										<td class="fieldname">
											<p>Is it a Income Producing Real Estate(IPRE) Co.</p>
										</td>
										<td><html:radio property="isIPRE" styleId="isIPRE"
												value="Yes" onclick="showHideWeakerSection();" disabled="true" /> Yes <html:radio
												property="isIPRE" styleId="isIPRE" value="No"
												onclick="showHideWeakerSection();" disabled="true"/> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
									</tr>



									<tr class="even">
										<td class="fieldname">Financing for Accquisition of
											equity in Overseas Companies</td>
										<td><html:radio property="financeForAccquisition"
												styleId="financeForAccquisition" value="Yes"
												onclick="enableTag('facilityApproved','facilityAmount','securityName','securityValue');" disabled="true"/>
											Yes <html:radio property="financeForAccquisition"
												styleId="financeForAccquisition"
												onclick="disableTag('facilityApproved','facilityAmount','securityName','securityValue','securityType');"
												value="No" disabled="true"/> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
										<td class="fieldname">
											<p>a)Facility Approved</p> </br>
											<p>b)Facility Amount</p> </br>
											<p>c)Security Name</p> </br>
											<p>d)Security Type</p> </br>
											<p>d)Security Value</p>
										<td><html:select property="facilityApproved"
												styleId="facilityApproved" style="width:225" disabled="true">

												<option value="">Please Select</option>
												<html:options collection="facNameList" labelProperty="label"
													property="value" />


											</html:select> </br> </br> </br> <html:text property="facilityAmount" maxlength="20"
												styleId="facilityAmount" readonly="true"
												value="<%=formObj.getFacilityAmount()%>">
												<p>Rs</p>
											</html:text> <html:errors property="facilityAmount" /></br> </br> </br> <html:select
												property="securityName" style="width:225"
												styleId="securityName" disabled="true"
												onchange="refreshSubType(this);">
												<option value="">Please Select</option>
												<html:options collection="securityNameList"
													labelProperty="label" property="value" />




											</html:select> </br> </br> </br> <html:select property="securityType" style="width:225"
												styleId="securityType" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE%>"
													descWithCode="false" />
											</html:select> </br> </br> </br> <html:text property="securityValue" maxlength="20"
												styleId="securityValue" readonly="true"
												value="<%=formObj.getSecurityValue()%>">
												<p>Rs</p>
											</html:text> <html:errors property="securityValue" /></td>




									</tr>

									<tr class="odd">
										<td class="fieldname">Type of Company(Exposure to Indian
											JV Abroad/WOS Abroad/Overseas Step Down Subsidary.)</td>
										<td><html:radio property="companyType"
												styleId="companyType" value="Yes"
												onclick="enableTag('nameOfHoldingCompany','type');"  disabled="true"/> Yes <html:radio
												property="companyType"
												styleId="companyType" value="No"
												onclick="disableTag('nameOfHoldingCompany','type');"  disabled="true"/> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
										<td class="fieldname">
											<p>a)Name of Holding Company</p> </br>
											<p>b)Type</p>
										<td><html:textarea property="nameOfHoldingCompany"
												styleId="nameOfHoldingCompany" rows="3" cols="50" 
												value="<%=formObj.getNameOfHoldingCompany()%>"
												readonly="true">
											</html:textarea> </br> </br> </br> <html:select property="type" style="width:225"
												styleId="type" disabled="true"
												value="<%=formObj.getType()%>">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.TYPE_OF_COMPANY%>"
													descWithCode="false" />
											</html:select></td>
									</tr>



									<tr class="even">
										<td class="fieldname">Breach ,if any,in compliance with
											statutory prescriptions(from CS,CA,CWA,certification)</td>
										<td><html:radio property="ifBreachWithPrescriptions"
												styleId="ifBreachWithPrescriptions" value="Yes"
												onclick="enableTag('comments');" disabled="true"/> Yes <html:radio
												property="ifBreachWithPrescriptions"
												styleId="ifBreachWithPrescriptions" value="No"
												onclick="disableTag('comments');" disabled="true"/> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
										<td class="fieldname">
											<p>Please Provide details and comments there on</p>
										<td><html:textarea property="comments" 
												styleId="comments" rows="3" cols="50" 
												value="<%=formObj.getComments()%>" readonly="true">
											</html:textarea></td>
									</tr>

									<tr class="odd">
										<td class="fieldname">Category of Farmer</td>
										<td><html:select property="categoryOfFarmer"
												style="width:225" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CATEGORY_OF_FARMER%>"
													descWithCode="false" />
											</html:select></td>
										<td class="fieldname">
											<p>LandHolding(hectares)</p>
										<td><html:textarea property="landHolding" rows="3" cols="50" styleId="landHolding"
												value="<%=formObj.getLandHolding()%>" readonly="true">
											</html:textarea></td>
									</tr>

									<tr class="even">
										<td class="fieldname">Country of guarantor</td>
										<td><html:select property="countryOfGuarantor"
												style="width:225" disabled="true">
												<option value="">Please Select</option>
												<html:options collection="countryList" labelProperty="label"
													property="value" />
											</html:select></td>
										<td class="fieldname">
											<p>Is it a Affordable Housing Finance?</p>
										</td>
										<td><html:radio property="isAffordableHousingFinance"
												styleId="isAffordableHousingFinance" value="Yes"
												onclick="showHideWeakerSection();" disabled="true" /> Yes <html:radio
												property="isAffordableHousingFinance"
												styleId="isAffordableHousingFinance" value="No"
												onclick="showHideWeakerSection();" disabled="true" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
									</tr>








									<tr class="odd">
										<td class="fieldname">Exposure is in the restricted list
											of financing</td>

										<td><html:radio property="isInRestrictedList" value="Yes"
												styleId="isInRestrictedList"
												onclick="enableTag('restrictedFinancing');" disabled="true"/> Yes <html:radio
												property="isInRestrictedList" styleId="isInRestrictedList"
												value="No" onclick="disableTag('restrictedFinancing');" disabled="true" />
											No &nbsp; <html:errors property="isWeakerSection" /> <html:select
												property="restrictedFinancing" styleId="restrictedFinancing" value="<%=formObj.getRestrictedFinancing().trim()%>"
												style="width:225" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.RESTRICTED_FINANCING%>"
													descWithCode="false" />
											</html:select></td>


										<td class="fieldname">
											<p>Credit to restricted list of industries</p>
										</td>
										<td><html:radio property="restrictedIndustries"
												value="Yes" styleId="restrictedIndustries"
												onclick="enableTag('restrictedListIndustries');" disabled="true" /> Yes <html:radio
												property="restrictedIndustries"
												styleId="restrictedIndustries" value="No"
												onclick="disableTag('restrictedListIndustries');" disabled="true"/> No &nbsp; <html:errors
												property="isWeakerSection" /><html:select
												property="restrictedListIndustries" styleId="restrictedListIndustries" style="width:225" value="<%=formObj.getRestrictedListIndustries().trim()%>" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CREDIT_LIST_RESTRICTED_INDUSTRIES%>"
													descWithCode="false" />
											</html:select></td>
									</tr>



									<tr class="even">
										<td class="fieldname">Qualifying notes on accounts,if any
											,by the statutory Auditor of the borrower</td>

										<td><html:radio property="isQualifyingNotesPresent"
												styleId="isQualifyingNotesPresent" value="Yes"
												onclick="enableTag('stateImplications');" disabled="true"/> Yes <html:radio
												property="isQualifyingNotesPresent"
												styleId="isQualifyingNotesPresent" value="No"
												onclick="disableTag('stateImplications');" disabled="true" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>


										<td class="fieldname">
											<p>Please provide details and state implications on
												financials,liquidity,reputation and credit risk of the
												borrower</p>
										<td><html:textarea property="stateImplications"
												styleId="stateImplications"
												rows="3" cols="50"
												readonly="true">
											</html:textarea></td>
									</tr>






									<tr class="odd">
										<td class="fieldname">Borrower appears in the Reject
											Database of Credit</td>
										<td><html:radio property="isBorrowerInRejectDatabase"
												styleId="isBorrowerInRejectDatabase" value="Yes"
												onclick="enableTag('rejectHistoryReason')" disabled="true" /> Yes <html:radio
												property="isBorrowerInRejectDatabase"
												styleId="isBorrowerInRejectDatabase" value="No"
												onclick="disableTag('rejectHistoryReason')" disabled="true" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
										<td class="fieldname">
											<p>Provide reason for reject history</p>
										<td><html:textarea property="rejectHistoryReason"
												styleId="rejectHistoryReason" rows="3" cols="50"
												value="<%=formObj.getRejectHistoryReason()%>" readonly="true">
											</html:textarea>
										</td>
									</tr>


									<tr class="even">
										<td class="fieldname">Category for Capital & Commodity Exchange Business</td>
										<td><html:radio property="capitalForCommodityAndExchange"
												styleId="capitalForCommodityAndExchange" value="Broker"
												onclick="changeBrokerType('Broker');" disabled="true" /> Broker <html:radio
												property="capitalForCommodityAndExchange"
												styleId="capitalForCommodityAndExchange" value="Non Broker"
												onclick="changeBrokerType('Non Broker');" disabled="true" /> Non Broker &nbsp; </br> 
												
												<html:checkbox property="isBrokerTypeShare" styleId="isBrokerTypeShare" value="Y" disabled="true"/>
												Share Broker
												&nbsp;
												
												<html:checkbox property="isBrokerTypeCommodity" styleId="isBrokerTypeCommodity" value="Y" disabled="true"/>
												Commodity Broker
												
												</td>
										<td class="fieldname">
											<p></p>
										<td></td>
										</td>
										</td>
									</tr>




									<tr class="odd">
										<td class="fieldname">Object Finance :(Object finance
											refers to a method of funding the acquisition of physical
											assets (eg:ships,aircraft,satellites,railcars,and fleet)where
											the repayment of the exposure is dependant on the cash flows
											generated by the specefic assets that have been financed and
											pledged or assigned to the lender)</td>
										<td><html:radio property="objectFinance"
												styleId="objectFinance" value="Yes"
												onclick="showHideWeakerSection();" disabled="true" /> Yes <html:radio
												property="objectFinance" styleId="objectFinance" value="No"
												onclick="showHideWeakerSection();" disabled="true" /> No &nbsp;</td>
										<td class="fieldname">
											<p>Is it a Commodities Finance Customer?</p>
										<td><html:radio property="isCommodityFinanceCustomer"
												styleId="isCommodityFinanceCustomer" value="Yes"
												onclick="showHideWeakerSection();" disabled="true" /> Yes <html:radio
												property="isCommodityFinanceCustomer"
												styleId="isCommodityFinanceCustomer" value="No"
												onclick="showHideWeakerSection();" disabled="true" /> No</td>
										</td>
										</td>
									</tr>




									<tr class="even">
										<td class="fieldname">Restructured Borrower/Facility</td>
										<td><html:radio property="restructuedBorrowerOrFacility"
												styleId="restructuedBorrowerOrFacility" value="Yes"
												onclick="enableTag('facility','limitAmount');" disabled="true" /> Yes <html:radio
												property="restructuedBorrowerOrFacility"
												styleId="restructuedBorrowerOrFacility" value="No"
												onclick="disableTag('facility','limitAmount');" disabled="true"/> No</td>

										<td class="fieldname">

											<p>a)Facility</p> </br>
											<p>b)Limit Amount</p>

										</td>
										<td><html:select property="facility" styleId="facility"
												style="width:225" disabled="true">

												<option value="">Please Select</option>
												<html:options collection="facNameList" labelProperty="label"
													property="value"  />
											</html:select> </br> </br> </br> <html:text property="limitAmount" styleId="limitAmount"
												maxlength="20" readonly="true" >
											</html:text></td>


									</tr>



								<tr class="odd">
										<td class="fieldname">Conduct of Account with Other Banks</td>
										<td><html:radio property="conductOfAccountWithOtherBanks"
												styleId="conductOfAccountWithOtherBanks"
												value="Satisfactory"
												onclick="disableTag('crilicStatus','comment');" disabled="true" />
											Satisfactory <html:radio
												property="conductOfAccountWithOtherBanks"
												styleId="conductOfAccountWithOtherBanks" value="classified"
												onclick="enableTag('crilicStatus','comment');" disabled="true" />
											Classified</td>

										<td class="fieldname">

											<p>Crilc Status</p> </br>
											<p>Comment</p>

										</td>
										<td><html:select property="crilicStatus"
												styleId="crilicStatus" style="width:225" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CRILIC_STATUS%>"
													descWithCode="false" />
											</html:select> </br> </br> </br> <html:textarea property="comment" rows="3" cols="50"
												styleId="comment" value="<%=formObj.getComment()%>" readonly="true">
											</html:textarea></td>


									</tr>








									<tr class="even">
										<td class="fieldname">Subsidy Flag</td>
										<td>
										
										<%if(formObj.getSubsidyFlag()!=null && formObj.getSubsidyFlag().equals("Yes") ){%>
										<input type="radio"  disabled="disabled"  checked="checked"   name="subsidyFlag"  value="Yes"/> Yes 
												
												
										<input type="radio"  disabled="disabled"     name="subsidyFlag"  value="No"/>No
										<%}else{%>
										<input type="radio"  disabled="disabled"     name="subsidyFlag"  value="Yes"/> Yes 
												
												
										<input type="radio"  disabled="disabled"   checked="checked"   name="subsidyFlag"  value="No"/>No
										<%}%>
												
												
												</td>

										<td class="fieldname">Please mention the name of the
											holding company</td>
										<td><html:textarea property="holdingCompnay" rows="3" cols="50"
												value="<%= formObj.getHoldingCompnay()%>" readonly="true">
											</html:textarea></td>
									</tr>



									<tr class="odd">
										<td class="fieldname">
											<p>Caution list(Please provide necessary justification in
												the CAM)</p> </br>
											<p>Date of Caution List</p> </br>
											<p>Company</p> </br>
											<p>Directors</p> </br>
											<p>Group Companies</p>

										</td>
										<td><html:radio property="cautionList"
												styleId="cautionList" value="Yes"
												onclick="enableTag('Image998','company','directors','groupCompanies');" disabled="true" />
											Yes <html:radio property="cautionList" styleId="cautionList"
												value="No"
												onclick="disableTag('Image998','company','directors','groupCompanies');" disabled="true"/>
											No </br> </br> </br> <html:text property="dateOfCautionList" maxlength="20"
												styleId="Image998" readonly="true">
											</html:text> <img src="img/calendara.gif" name="Image724" border="0"
											id="Image724"
											onclick="return showCalendar('dateOfCautionList', 'dd/mm/y');"
											onmouseover="MM_swapImage('Image998','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" /></br> </br> </br> <html:text
												property="company" styleId="company" maxlength="100" style="width:250"
												value="<%=formObj.getCompany()%>" readonly="true">
											</html:text> </br> </br> </br> <html:text property="directors" styleId="directors" style="width:250"
												maxlength="100" value="<%=formObj.getDirectors()%>" readonly="true">
											</html:text> </br> </br> </br> <html:text property="groupCompanies"
												styleId="groupCompanies" maxlength="100" style="width:250"
												value="<%=formObj.getGroupCompanies()%>" readonly="true">
											</html:text></td>


										<td class="fieldname">
											<p>RBI Defaulter's List</p> </br>
											<p>Date of Caution List</p> </br>
											<p>Company</p> </br>
											<p>Directors</p> </br>
											<p>Group Companies</p>
										</td>
										<td><html:radio property="defaultersList"
												styleId="defaultersList" value="Yes"
												onclick="enableTag('Image999','rbiCompany','rbiDirectors','rbiGroupCompanies');" disabled="true"/>
											Yes <html:radio property="defaultersList"
												styleId="defaultersList" value="No"
												onclick="disableTag('Image999','rbiCompany','rbiDirectors','rbiGroupCompanies');" disabled="true" />
											No </br> </br> </br> <html:text property="rbiDateOfCautionList"
												maxlength="20" readonly="true" styleId="Image999" readonly="true">
											</html:text> <img src="img/calendara.gif" name="Image724" border="0"
											id="Image724"
											onclick="return showCalendar('rbiDateOfCautionList', 'dd/mm/y');"
											onmouseover="MM_swapImage('Image999','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" /> <html:errors
												property="aaApprovalDate" /> </br> </br> </br> <html:text
												property="rbiCompany" styleId="rbiCompany" maxlength="100" style="width:250"
												value="<%=formObj.getRbiCompany()%>" readonly="true">
											</html:text> </br> </br> </br> <html:text property="rbiDirectors" styleId="rbiDirectors" style="width:250"
												maxlength="100" value="<%=formObj.getRbiDirectors()%>" readonly="true">
											</html:text> </br> </br> </br> <html:text property="rbiGroupCompanies"
												styleId="rbiGroupCompanies" maxlength="100" style="width:250"
												value="<%=formObj.getRbiGroupCompanies()%>" readonly="true">
											</html:text></td>
									</tr>



									<tr class="even">
										<td class="fieldname">
											<p>1) Commercial Real Estate</p> </br>
											<p>2) Commercial Real Estate-Residential Housing</p> </br>
											<p>3) Residential Real Estate</p> </br>
											<p>4) Indirect Real Estate</p>

										</td>
										<td><html:radio property="commericialRealEstate"
												styleId="commericialRealEstate" value="Yes"
												onclick="enableTag('commericialRealEstateValue');" disabled="true" /> Yes <html:radio
												property="commericialRealEstate"
												styleId="commericialRealEstate" value="No"
												onclick="disableTag('commericialRealEstateValue');" disabled="true"/> No </br>
											<html:select property="commericialRealEstateValue"
												styleId="commericialRealEstateValue" style="width:225" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE%>"
													descWithCode="false" />
											</html:select> </br> </br> </br> <html:radio
												property="commericialRealEstateResidentialHousing"
												styleId="commericialRealEstateResidentialHousing"
												value="Yes" onclick="showHideWeakerSection();" disabled="true" /> Yes <html:radio
												property="commericialRealEstateResidentialHousing"
												styleId="commericialRealEstateResidentialHousing" value="No"
												onclick="showHideWeakerSection();" disabled="true" /> No </br> </br> </br> <html:radio
												property="residentialRealEstate"
												styleId="residentialRealEstate" value="Yes"
												onclick="showHideWeakerSection();" disabled="true"/> Yes <html:radio
												property="residentialRealEstate"
												styleId="residentialRealEstate" value="No"
												onclick="showHideWeakerSection();" disabled="true" /> No </br> </br> </br> <html:radio
												property="indirectRealEstate" styleId="indirectRealEstate"
												value="Yes" onclick="showHideWeakerSection();" disabled="true"/> Yes <html:radio
												property="indirectRealEstate" styleId="indirectRealEstate"
												value="No" onclick="showHideWeakerSection();" disabled="true"/> No</td>


										<td class="fieldname"></td>
										<td></td>
									</tr>

									<!-- CR for CRI END -->



								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="right">
							<h3 align="left">Add CRI Facility</h3> <input
							onclick="javascript : addCriFacilityList()" name="btnCri"
							type="button" id="btnCri" value="Attach Facility Details"
							class="btnNormal" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<hr />
						</td>
					</tr>
					<tr>
						<td>

							<table border="0" cellpadding="0" cellspacing="0" class="tblinfo"
								style="margin-top: 0" width="100%" align="center">
								<thead>
									<tr>
										<td>S/N</td>
										<td>Line No.</td>
										<td>Serial No.</td>
										<td>Facility For</td>
										<td>Facility Name</td>
										<td>Facility Amount</td>
										<td>Estate Type</td>
										<td>Priority Sector</td>
										<td>Action</td>
									</tr>
								</thead>
								<tbody>
									<%
										String strTemp = "";
									%>
									<logic:present name="facList">
										<logic:iterate id="ob" name="facList"
											type="com.integrosys.cms.app.customer.bus.OBCriFac"
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
												<td><integro:empty-if-null value="<%=ob.getLineNo()%>" />
												</td>
												<td><integro:empty-if-null
														value="<%=ob.getSerialNo()%>" /></td>
												<%
													strTemp = strTemp + ob.getFacilityFor() + "|";
												%>
												<td>
													<center>
														<integro:empty-if-null value="<%=ob.getFacilityFor()%>" />
														&nbsp;
													</center>
												</td>
												<td>
													<center>
														<integro:empty-if-null value="<%=ob.getFacilityName()%>" />
														&nbsp;
													</center>
												</td>
												<td>
												<!--  <center><%=ob.getFacilityAmount() %>&nbsp;</center>-->
												<center><integro:amount param="amount" decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),ob.getFacilityAmount())%>"/>&nbsp;</center>
												</td>
												<td> <integro:empty-if-null
													value="<%=ob.getEstateType() %>" /> / <integro:empty-if-null
													value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE, ob.getCommRealEstateType()) %>" />
													</td>
												<td><integro:empty-if-null
													value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.CommonCode_PRIORITY_SECTOR_Y, ob.getPrioritySector()) %>" />
													</td>
												<td>
												<center><select id="actionType<%=no%>"
													onchange="getActionFac('<%=no%>')">
													<option value="">-Select-</option>
												</select></center>
												</td>
											</tr>
										</logic:iterate>
										<%
											if (no == 0) {
										%>
										<tr class="odd">
											<td colspan="10"><bean:message
													key="label.global.not.found" /></td>
										</tr>
										<%
											}
										%>
									</logic:present>
									<%
										if (no != 0) {
									%>
									<html:hidden property="tempFacilityData" value="<%=strTemp%>" />
									<%
										}
									%>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
			</table>
		</td>
	</tr>
</table>


<%
	if (formObj.getCompanyType() == null || formObj.getCompanyType().equals("No")
			|| formObj.getCompanyType().equals("")) {
%>
<script language="javascript">
	document.all.companyType[1].checked = true;
</script>


<%
	} else {
%>
<script language="javascript">
	document.all.companyType[0].checked = true;
</script>
<%
	}
%>




<%
	if (formObj.getCapitalForCommodityAndExchange() == null || formObj.getCapitalForCommodityAndExchange().equals("")
			|| formObj.getCapitalForCommodityAndExchange().equals("Non Broker")) {
%>
<script language="javascript">
	document.all.capitalForCommodityAndExchange[1].checked = true;
</script>
<%
	} else if (formObj.getCapitalForCommodityAndExchange().equals("Broker")) {
%>
<script language="javascript">
	document.all.getCapitalForCommodityAndExchange[0].checked = true;
</script>
<%
	}
%>


<%
	if (formObj.getIsSPVFunding() == null
			|| formObj.getIsSPVFunding().equals("")
			|| formObj.getIsSPVFunding().equals("No")) {
%>
<script language="javascript">
	document.all.isSPVFunding[1].checked = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.isSPVFunding[0].checked = true;
</script>

<%
	}
%>





<%
	if (formObj.getIndirectRealEstate() == null
			|| formObj.getIndirectRealEstate().equals("")
			|| formObj.getIndirectRealEstate().equals("No")) {
%>
<script language="javascript">
	document.all.indirectRealEstate[1].checked = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.indirectRealEstate[0].checked = true;
</script>

<%
	}
%>





<%
	if (formObj.getResidentialRealEstate() == null
			|| formObj.getResidentialRealEstate().equals("")
			|| formObj.getResidentialRealEstate().equals("No")) {
%>
<script language="javascript">
	document.all.residentialRealEstate[1].checked = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.residentialRealEstate[0].checked = true;
</script>

<%
	}
%>










<%
	if (formObj.getCommericialRealEstateResidentialHousing() == null
			|| formObj.getCommericialRealEstateResidentialHousing()
					.equals("")
			|| formObj.getCommericialRealEstateResidentialHousing()
					.equals("No")) {
%>
<script language="javascript">
	document.all.commericialRealEstateResidentialHousing[1].checked = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.commericialRealEstateResidentialHousing[0].checked = true;
</script>

<%
	}
%>






<%
	if (formObj.getCommericialRealEstate() == null
			|| formObj.getCommericialRealEstate().equals("")
			|| formObj.getCommericialRealEstate().equals("No")) {
%>
<script language="javascript">
	document.all.commericialRealEstate[1].checked = true;

</script>
<%
	} else {
%>

<script language="javascript">
	document.all.commericialRealEstate[0].checked = true;

</script>

<%
	}
%>







<%
	if (formObj.getDefaultersList() == null
			|| formObj.getDefaultersList().equals("")
			|| formObj.getDefaultersList().equals("No")) {
%>
<script language="javascript">
	document.all.defaultersList[1].checked = true;
	document.getElementById('rbiCompany').disabled = true;
	document.getElementById('rbiDirectors').disabled = true;
	document.getElementById('rbiGroupCompanies').disabled = true;
	document.getElementById('Image999').disabled = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.defaultersList[0].checked = true;
	document.getElementById('rbiCompany').disabled = true;
	document.getElementById('rbiDirectors').disabled = true;
	document.getElementById('rbiGroupCompanies').disabled = true;
	document.getElementById('Image999').disabled = true;
</script>

<%
	}
%>



<!-- <script language="javascript"> // commented by Dayananda Laishram for IE 11 compatibility changes || Starts
	//A Shiv 230811 -->
<%
	if (formObj.getCautionList() == null
			|| formObj.getCautionList().equals("")
			|| formObj.getCautionList().equals("No")) {
%>
<script language="javascript">
	document.all.cautionList[1].checked = true;
	document.getElementById('Image998').disabled = true;
	document.getElementById('company').disabled = true;
	document.getElementById('directors').disabled = true;
	document.getElementById('groupCompanies').disabled = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.cautionList[0].checked = true;
	document.getElementById('Image998').disabled = true;
	document.getElementById('company').disabled = true;
	document.getElementById('directors').disabled = true;
	document.getElementById('groupCompanies').disabled = true;
</script>

<%
	}
%>


<%-- <%
	if (formObj.getIsTufs() == null || formObj.getIsTufs().equals("")
			|| formObj.getIsTufs().equals("No")) {
%>
<script language="javascript">
	document.all.subsidyFlag[1].checked = true;
	document.getElementById('subsidyFlag').disabled = true;
</script>
<%
	} else if (formObj.getIsTufs() == null
			|| formObj.getIsTufs().equals("")
			|| formObj.getIsTufs().equals("Yes")) {
%>
<script language="javascript">
	document.all.subsidyFlag[1].checked = true;
	document.getElementById('subsidyFlag').disabled = false;
</script>
<%
	}
%> --%>












<%
	if (formObj.getRestructuedBorrowerOrFacility() == null
			|| formObj.getRestructuedBorrowerOrFacility().equals("")
			|| formObj.getRestructuedBorrowerOrFacility().equals("No")) {
%>
<script language="javascript">
	document.all.restructuedBorrowerOrFacility[1].checked = true;
</script>
<%
	} else if (formObj.getRestructuedBorrowerOrFacility().equals("Yes")) {
%>
<script language="javascript">
	document.all.restructuedBorrowerOrFacility[0].checked = true;
</script>
<%
	}
%>







<%
	if (formObj.getIsCommodityFinanceCustomer() == null
			|| formObj.getIsCommodityFinanceCustomer().equals("")
			|| formObj.getIsCommodityFinanceCustomer().equals("No")) {
%>
<script language="javascript">
	document.all.isCommodityFinanceCustomer[1].checked = true;
</script>
<%
	} else if (formObj.getIsCommodityFinanceCustomer().equals("Yes")) {
%>
<script language="javascript">
	document.all.isCommodityFinanceCustomer[0].checked = true;
</script>
<%
	}
%>


<%
	if (formObj.getObjectFinance() == null
			|| formObj.getObjectFinance().equals("")
			|| formObj.getObjectFinance().equals("No")) {
%>
<script language="javascript">
	document.all.objectFinance[1].checked = true;
</script>
<%
	} else if (formObj.getObjectFinance().equals("Yes")) {
%>
<script language="javascript">
	document.all.objectFinance[0].checked = true;
</script>
<%
	}
%>




<%-- <%
	if (formObj.getOdfdCategory() == null
			|| formObj.getOdfdCategory().equals("")
			|| formObj.getOdfdCategory().equals("1")) {
%>
<script language="javascript">
	document.all.odfdCategory[0].checked = true;
</script>
<%
	} else if (formObj.getOdfdCategory() == null
			|| formObj.getOdfdCategory().equals("")
			|| formObj.getOdfdCategory().equals("2")) {
%>
<script language="javascript">
	document.all.odfdCategory[1].checked = true;
</script>
<%
	} else if (formObj.getOdfdCategory() == null
			|| formObj.getOdfdCategory().equals("")
			|| formObj.getOdfdCategory().equals("3")) {
%>
<script language="javascript">
	document.all.odfdCategory[2].checked = true;
</script>

<%
	}
%> --%>







<%
	if (formObj.getIsBorrowerInRejectDatabase() == null
			|| formObj.getIsBorrowerInRejectDatabase().equals("")
			|| formObj.getIsBorrowerInRejectDatabase().equals("No")) {
%>
<script language="javascript">
	document.all.isBorrowerInRejectDatabase[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsBorrowerInRejectDatabase().equals("Yes")) {
%>
<script language="javascript">
	document.all.isBorrowerInRejectDatabase[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isBorrowerInRejectDatabase[1].checked = true;
</script>
<%
	}
	}
%>







<%
	if (formObj.getIsQualifyingNotesPresent() == null
			|| formObj.getIsQualifyingNotesPresent().equals("")
			|| formObj.getIsQualifyingNotesPresent().equals("No")) {
%>
<script language="javascript">
	document.all.isQualifyingNotesPresent[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsQualifyingNotesPresent().equals("Yes")) {
%>
<script language="javascript">
	document.all.isQualifyingNotesPresent[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isQualifyingNotesPresent[1].checked = true;
</script>
<%
	}
	}
%>




<%
	if (formObj.getIsIPRE() == null || formObj.getIsIPRE().equals("")
			|| formObj.getIsIPRE().equals("No")) {
%>
<script language="javascript">
	document.all.isIPRE[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsIPRE().equals("Yes")) {
%>
<script language="javascript">
	document.all.isIPRE[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isIPRE[1].checked = true;
</script>
<%
	}
	}
%>






<%
	if (formObj.getIsCGTMSE() == null
			|| formObj.getIsCGTMSE().equals("")
			|| formObj.getIsCGTMSE().equals("No")) {
%>
<script language="javascript">
	document.all.isCGTMSE[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsCGTMSE().equals("Yes")) {
%>
<script language="javascript">
	document.all.indirectCountryRiskExposure[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.indirectCountryRiskExposure[1].checked = true;
</script>
<%
	}
	}
%>




<%
	if (formObj.getConductOfAccountWithOtherBanks() == null
			|| formObj.getConductOfAccountWithOtherBanks().equals("")
			|| formObj.getConductOfAccountWithOtherBanks().equals("Satisfactory")) {
%>
<script language="javascript">
	document.all.conductOfAccountWithOtherBanks[0].checked = true;
</script>
<%
	} else if (formObj.getConductOfAccountWithOtherBanks().equals("classified")) {
%>
<script language="javascript">
	document.all.indirectCountryRiskExposure[1].checked = true;
</script>
<%
	}
%>







<%
	if (formObj.getIndirectCountryRiskExposure() == null
			|| formObj.getIndirectCountryRiskExposure().equals("")
			|| formObj.getIndirectCountryRiskExposure().equals("No")) {
%>
<script language="javascript">
	document.all.indirectCountryRiskExposure[1].checked = true;

</script>
<%
	} else if (formObj.getIndirectCountryRiskExposure().equals("Yes")) {
%>
<script language="javascript">
	document.all.indirectCountryRiskExposure[0].checked = true;

</script>
<%
	} 
%>


<%
	if (formObj.getIsNbfs() == null || formObj.getIsNbfs().equals("") || formObj.getIsNbfs().equals("No")) {
%>
<script language="javascript">
	document.all.isNbfs[1].checked = true;
</script>
<%
	} else if (formObj.getIsNbfs().equals("Yes")) {
%>
<script language="javascript">
	document.all.isNbfs[0].checked = true;
</script>
<%
	} 
%>


<%
	if (formObj.getFinanceForAccquisition() == null
			|| formObj.getFinanceForAccquisition().equals("No")
			|| formObj.getFinanceForAccquisition().equals("")) {
%>
<script language="javascript">
	document.all.financeForAccquisition[1].checked = true;


</script>


<%
	} else if (formObj.getFinanceForAccquisition().equals("Yes")) {
%>
<script language="javascript">
document.all.financeForAccquisition[0].checked = true;

</script>
<%
	} else {
%>
<script language="javascript">
document.all.financeForAccquisition[1].checked = true;
</script>
<%
	}
%>




<%
	if (formObj.getIfBreachWithPrescriptions() == null
			|| formObj.getIfBreachWithPrescriptions().equals("")
			|| formObj.getIfBreachWithPrescriptions().equals("No")) {
%>
<script language="javascript">
	document.all.ifBreachWithPrescriptions[1].checked = true;
	
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.ifBreachWithPrescriptions[0].checked = true;
	
</script>

<%
	}
%>


<%
	if (formObj.getIsInRestrictedList() == null
			|| formObj.getIsInRestrictedList().equals("")
			|| formObj.getIsInRestrictedList().equals("No")) {
%>
<script language="javascript">
	document.all.isInRestrictedList[1].checked = true;
	
</script>
<%
	} else if (formObj.getIsInRestrictedList().equals("Yes")) {
%>
<script language="javascript">
	document.all.isInRestrictedList[0].checked = true;
	
</script>
<%
	}
%>

<%
	if (formObj.getRestrictedIndustries() == null
			|| formObj.getRestrictedIndustries().equals("") || formObj.getRestrictedIndustries().equals("No")) {
%>
<script language="javascript">
	document.all.restrictedIndustries[1].checked = true;
</script>
<%
	}else {
%>
<script language="javascript">
	document.all.restrictedIndustries[0].checked = true;
</script>
<%
	}
%>


<%
	if (formObj.getIsAffordableHousingFinance() == null
			|| formObj.getIsAffordableHousingFinance().equals("") || formObj.getIsAffordableHousingFinance().equals("No")) {
%>
<script language="javascript">
	document.all.isAffordableHousingFinance[1].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isAffordableHousingFinance[0].checked = true;
</script>
<%
	}
%>
<%
	if (formObj.getIsAffordableHousingFinance().equals("Yes")) {
%>
<script language="javascript">
	document.all.isWeakerSection[0].checked = true;

</script>
<%
	} else {
%>
<%
	if (formObj.getIsWeakerSection().equals("Yes")) {
%>
<script language="javascript">
document.all.isWeakerSection[0].checked = true;

</script>
<%
	} else {
%>
<script language="javascript">
document.all.isWeakerSection[0].checked = true;

</script>
<%
	}
	}
%>

<%
	if (formObj.getIsSemsGuideApplicable() == null
			|| formObj.getIsSemsGuideApplicable().equals("")) {
%>
<script language="javascript">
	document.all.isSemsGuideApplicable[1].checked = true;
</script>
<%
	}
%>

<%
	if (formObj.getIsFailIfcExcluList() == null
			|| formObj.getIsFailIfcExcluList().equals("")) {
%>
<script language="javascript">
	document.all.isFailIfcExcluList[1].checked = true;
</script>
<%
	}
%>

<%
	if (formObj.getIsTufs() == null || formObj.getIsTufs().equals("")) {
%>
<script language="javascript">
	document.all.isTufs[1].checked = true;
</script>
<%
	}
%>

<%
	if (formObj.getIsMinorityCommunity() == null
			|| formObj.getIsMinorityCommunity().equals("")) {
%>
<script language="javascript">
	document.all.isMinorityCommunity[1].checked = true;

</script>
<%
	} else {
%>
<%
	if (formObj.getIsMinorityCommunity().equals("Yes")) {
%>
<script language="javascript">
		document.all.isMinorityCommunity[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('minorityCommunity').disabled = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsCommoditiesExposer() == null
			|| formObj.getIsCommoditiesExposer().equals("")) {
%>
<script language="javascript">
	document.all.isCommoditiesExposer[1].checked = true;

</script>
<%
	} else {
%>
<%
	if (formObj.getIsCommoditiesExposer().equals("Yes")) {
%>
<script language="javascript">
	document.all.isCommoditiesExposer[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isCommoditiesExposer[1].checked = true;

</script>
<%
	}
	}
%>


<%
	if (formObj.getIsSensitive() == null
			|| formObj.getIsSensitive().equals("")) {
%>
<script language="javascript">
	document.all.isSensitive[1].checked = true;

</script>
<%
	} else {
%>
<%
	if (formObj.getIsSensitive().equals("Yes")) {
%>
<script language="javascript">
	document.all.isSensitive[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('commoditiesName').disabled = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsInfrastructureFinanace() == null
			|| formObj.getIsInfrastructureFinanace().equals("")) {
%>
<script language="javascript">
	document.all.isInfrastructureFinanace[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsInfrastructureFinanace().equals("Yes")) {
%>
<script language="javascript">
	document.all.isInfrastructureFinanace[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isInfrastructureFinanace[0].checked = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsLitigation() == null
			|| formObj.getIsLitigation().equals("")) {
%>
<script language="javascript">
	document.all.isLitigation[1].checked = true;
	document.getElementById('litigationBy').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsLitigation().equals("Yes")) {
%>
<script language="javascript">
document.all.isLitigation[0].checked = true;

</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isLitigation[0].checked = true;
</script>
<%
	}
	}
%>

<%
	if (formObj.getIsInterestOfBank() == null
			|| formObj.getIsInterestOfBank().equals("")) {
%>
<script language="javascript">
	document.all.isInterestOfBank[1].checked = true;

</script>
<%
	} else {
%>
<%
	if (formObj.getIsInterestOfBank().equals("Yes")) {
%>
<script language="javascript">
	document.all.isInterestOfBank[0].checked = true;

</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isInterestOfBank[0].checked = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsAdverseRemark() == null
			|| formObj.getIsAdverseRemark().equals("")) {
%>
<script language="javascript">
	document.all.isAdverseRemark[1].checked = true;

</script>
<%
	} else {
%>
<%
	if (formObj.getIsAdverseRemark().equals("Yes")) {
%>
<script language="javascript">
	document.all.isAdverseRemark[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isAdverseRemark[0].checked = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsDirecOtherBank() == null
			|| formObj.getIsDirecOtherBank().equals("")) {
%>
<script language="javascript">
	document.all.isDirecOtherBank[1].checked = true;

</script>
<%
	} else {
%>
<%
	if (formObj.getIsDirecOtherBank().equals("Yes")) {
%>
<script language="javascript">
	document.all.isDirecOtherBank[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isDirecOtherBank[0].checked = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsPartnerOtherBank() == null
			|| formObj.getIsPartnerOtherBank().equals("")) {
%>
<script language="javascript">
	document.all.isPartnerOtherBank[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsPartnerOtherBank().equals("Yes")) {
%>
<script language="javascript">
	document.all.isPartnerOtherBank[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isPartnerOtherBank[0].checked = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsSubstantialOtherBank() == null
			|| formObj.getIsSubstantialOtherBank().equals("")) {
%>
<script language="javascript">
	document.all.isSubstantialOtherBank[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsSubstantialOtherBank().equals("Yes")) {
%>
<script language="javascript">
	document.all.isSubstantialOtherBank[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isSubstantialOtherBank[0].checked = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsHdfcDirecRltv() == null
			|| formObj.getIsHdfcDirecRltv().equals("")) {
%>
<script language="javascript">
	document.all.isHdfcDirecRltv[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsHdfcDirecRltv().equals("Yes")) {
%>
<script language="javascript">
	document.all.isHdfcDirecRltv[0].checked = true
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isHdfcDirecRltv[0].checked = true
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsObkDirecRltv() == null
			|| formObj.getIsObkDirecRltv().equals("")) {
%>
<script language="javascript">
	document.all.isObkDirecRltv[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsObkDirecRltv().equals("Yes")) {
%>
<script language="javascript">
	document.all.isObkDirecRltv[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isObkDirecRltv[0].checked = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsPartnerDirecRltv() == null
			|| formObj.getIsPartnerDirecRltv().equals("")) {
%>
<script language="javascript">
	document.all.isPartnerDirecRltv[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsPartnerDirecRltv().equals("Yes")) {
%>
<script language="javascript">
	document.all.isPartnerDirecRltv[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isPartnerDirecRltv[0].checked = true;
</script>
<%
	}
	}
%>

<%
	if (formObj.getPsu() == null || formObj.getPsu().equals("")) {
%>
<script language="javascript">
	document.all.psu[2].checked = true;
	document.getElementById('psuPercentage').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getPsu().equals("State")
				|| formObj.getPsu().equals("Central")) {
%>
<script language="javascript">
	document.getElementById('psuPercentage').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('psuPercentage').disabled = true;
</script>
<%
	}
	}
%>

<%
	if (formObj.getGovtUnderTaking() == null
			|| formObj.getGovtUnderTaking().equals("")) {
%>
<script language="javascript">
	document.all.govtUnderTaking[2].checked = true;
</script>
<%
	}
%>

<%
	if (formObj.getIsSubstantialRltvHdfcOther() == null
			|| formObj.getIsSubstantialRltvHdfcOther().equals("")) {
%>
<script language="javascript">
	document.all.isSubstantialRltvHdfcOther[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsSubstantialRltvHdfcOther().equals("Yes")) {
%>
<script language="javascript">
	document.getElementById('substantialRltvHdfcOther').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('substantialRltvHdfcOther').disabled = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsRbiDefaulter() == null
			|| formObj.getIsRbiDefaulter().equals("")) {
%>
<script language="javascript">
	document.all.isRbiDefaulter[1].checked = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsRbiDefaulter().equals("Yes")) {
%>
<script language="javascript">
	document.all.rbiDefaulter[0].disabled = false;
	document.all.rbiDefaulter[1].disabled = false;
	document.all.rbiDefaulter[2].disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.rbiDefaulter[0].disabled = true;
	document.all.rbiDefaulter[1].disabled = true;
	document.all.rbiDefaulter[2].disabled = true;
</script>
<%
	}
	}
%>
<%
	if (formObj.getIsProjectFinance() == null
			|| formObj.getIsProjectFinance().equals("")
			|| formObj.getIsProjectFinance().equals("No")) {
%>
<script language="javascript">
	document.all.isProjectFinance[1].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isProjectFinance[0].checked = true;
</script>
<%
	}
	if (formObj.getIsKisanCreditCard() == null
			|| formObj.getIsKisanCreditCard().equals("")) {
%>
<script language="javascript">
	document.all.isKisanCreditCard[1].checked = true;
</script>
<%
	}
%>
<%
	if (formObj.getIsPermenentSsiCert() == null
			|| formObj.getIsPermenentSsiCert().equals("")) {
%>
<script language="javascript">
	document.all.isPermenentSsiCert[1].checked = true;
</script>
<%
	}
%>
<%
	if (formObj.getIsPrioritySector() == null
			|| formObj.getIsPrioritySector().equals("")) {
%>
<script language="javascript">
	document.all.isPrioritySector[1].checked = true;
</script>
<%
	}
%>
<%
	if (formObj.getIsCapitalMarketExpos() == null
			|| formObj.getIsCapitalMarketExpos().equals("")) {
%>
<script language="javascript">
	document.all.isCapitalMarketExpos[1].checked = true;
</script>
<%
	}
%>
<%
	if (formObj.getIsRealEstateExpos() == null
			|| formObj.getIsRealEstateExpos().equals("")) {
%>
<script language="javascript">
	document.all.isRealEstateExpos[1].checked = true;
</script>
<%
	}
%>
<%
	if (formObj.getIsBackedByGovt() == null
			|| formObj.getIsBackedByGovt().equals("")
			|| formObj.getIsBackedByGovt().equals("No")) {
%>
<script language="javascript">
	document.all.isBackedByGovt[2].checked = true;
</script>
<%
	} else if (formObj.getIsBackedByGovt().equals("State")) {
%>
<script language="javascript">
	document.all.isBackedByGovt[0].checked = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isBackedByGovt[1].checked = true;
</script>
<%
	}
	if ((formObj.getIsBackedByGovt() != null
			&& formObj.getIsBackedByGovt().equals("State") || formObj
			.getIsBackedByGovt().equals("Central"))
			|| (formObj.getIsInfrastructureFinanace() != null && formObj
					.getIsInfrastructureFinanace().equals("Yes"))
			|| (formObj.getIsKisanCreditCard() != null && formObj
					.getIsKisanCreditCard().equals("Yes"))
			|| (formObj.getIsProjectFinance() != null && formObj
					.getIsProjectFinance().equals("Yes"))
			|| (formObj.getIsPermenentSsiCert() != null && formObj
					.getIsPermenentSsiCert().equals("Yes"))
			|| (formObj.getIsPrioritySector() != null && formObj
					.getIsPrioritySector().equals("Yes"))
			|| (formObj.getIsCapitalMarketExpos() != null && formObj
					.getIsCapitalMarketExpos().equals("Yes"))
			|| (formObj.getIsRealEstateExpos() != null && formObj
					.getIsRealEstateExpos().equals("Yes"))) {
%>
<script language="javascript">
	document.getElementById('btnCri').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('btnCri').disabled = true;
</script>
<%
	}
%>


</html>
<!-- InstanceEnd -->


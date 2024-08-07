<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.commondata.app.CommonDataSingleton,
	com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>
<%@page import="java.util.*"%>
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
List currencyList = (ArrayList)session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.currencyList");
	
	if (!(currencyList == null)) {
		pageContext.setAttribute("currencyList", currencyList);
		session.setAttribute("currencyList", currencyList);
		 
		}
	List partyGroupList = (List) session
	.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGroupList");
	
	pageContext.setAttribute("partyGroupList", partyGroupList);
	
	
	
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
	<jsp:include page="cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="non_cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="udf_hidden_details.jsp"></jsp:include>
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
								<td width="30%"><html:textarea property="customerExtRating" styleId="customerExtRating" rows="5" cols="50"  readonly="true"></html:textarea></td>
							</tr>
							
							<tr class="odd">
							<html:hidden property="customerFyClouser"/>
										<td class="fieldname" width="20%">Customer FY Closure<font color="red">*</font></td>
										<td><html:select property="customerFyClouser" style="width:225" disabled="true">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.CUSTOMER_FY_CLOSUER%>"
									descWithCode="false" />
								</html:select><html:errors property="customerFyClouserError"/></td>
								     <td></td>
									</tr>
							<tr class="even">
								<td class="fieldname">NBFC</td>
								<td>
								<html:hidden property="isNbfs" styleId="isNbfs" />
								
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
								<html:hidden property="nbfsA" styleId="nbfsA"/>
								<html:hidden property="nbfsB" styleId="nbfsB"/>
								<p><integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_NBFC_A%>" entryCode="<%=value.getNbfsA() %>"
									descWithCode="false" display="true" /></p>
								<p><integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_NBFC_B%>" entryCode="<%=value.getNbfsB() %>"
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
								</html:select><html:errors property="msmeClassification"/>&nbsp;</td>
								<html:errors property="msmeClassification"/>
							</tr>
							<tr class="even">
								<td class="fieldname">
								<p>Weaker Section</p>
								</td>
								<td>
								<html:hidden property="isWeakerSection" styleId="isWeakerSection" />
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
								<html:hidden property="weakerSection" styleId="weakerSection" />
								<p><bean:write name="ManualInputCustomerInfoForm"
									property="weakerSection"></bean:write>&nbsp;<html:errors property="weakerSection"/></p>
								<p><html:text property="govtSchemeType"  readonly="true"/></p>
								</td>
							</tr>
							
							<tr class="odd">
								<td class="fieldname">Minority Community</td>
								<td>
								<html:hidden property="isMinorityCommunity" styleId="isMinorityCommunity" />
								<%if(formObj.getIsMinorityCommunity() != null && formObj.getIsMinorityCommunity().equals("Yes")){ %>
								<input type="radio" id="isMinorityCommunity" name="isMinorityCommunity" value="Yes" checked="checked" disabled="disabled"/> Yes
								<input type="radio" id="isMinorityCommunity" name="isMinorityCommunity" value="No" disabled="disabled"/> No
								<%} %>
								<%if(formObj.getIsMinorityCommunity() == null || formObj.getIsMinorityCommunity().equals("No")){ %>
								<input type="radio" id="isMinorityCommunity" name="isMinorityCommunity" value="Yes" disabled="disabled"/> Yes
								<input type="radio" id="isMinorityCommunity" name="isMinorityCommunity" value="No"  checked="checked" disabled="disabled"/> No
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
								<html:hidden property="isCommoditiesExposer" styleId="isCommoditiesExposer"/>
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
								<html:hidden property="isSensitive" styleId="isSensitive"/>
								<%if(formObj.getIsSensitive() != null && formObj.getIsSensitive().equals("Yes")){ %>
								<input type="radio" id="isSensitive" name="isSensitive" value="Yes" checked="checked" disabled="disabled"/> Yes
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
								<td>
								<integro:common-code
												categoryCode="<%=CategoryCodeConstant.CommonCode_COMMODITY_NAMES%>"
												entryCode="<%=value.getCommoditiesName()%>"
												descWithCode="false"  display="true" />
								<html:hidden property="commoditiesName" styleId="commoditiesName"/>
								<html:errors property="commoditiesName"/></td>
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
								<input type="radio" name="govtUnderTaking" value="State" checked="checked"  disabled="disabled"/> State
								<input type="radio" name="govtUnderTaking" value="Central" disabled="disabled"/> Central
								<input type="radio" name="govtUnderTaking" value="No"   disabled="disabled"/> No
								<%} %>
								<%if(formObj.getGovtUnderTaking() != null && formObj.getGovtUnderTaking().equals("Central")){ %>
								<input type="radio" name="govtUnderTaking" value="State"disabled="disabled"/> State
								<input type="radio" name="govtUnderTaking" value="Central"  checked="checked" disabled="disabled"/> Central
								<input type="radio" name="govtUnderTaking" value="No"   disabled="disabled"/> No 
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
								<%if(formObj.getIsRbiDefaulter() != null && formObj.getIsRbiDefaulter().equals("Yes")){ %>
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
								<input type="radio" name="rbiDefaulter" value="Group Companies" disabled="disabled"/> Group Companies
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
								<html:text property="litigationBy" readonly="true" styleId="litigationBy"/><html:errors property="litigationBy"/>
								</td>
								<td class="fieldname">Interest of Directors / Senior
								officers / (Credit approvers) of the bank</td>
								<td>
								<html:hidden property="isInterestOfBank" styleId="isInterestOfBank"/>
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
								<html:hidden property="isAdverseRemark" styleId="isAdverseRemark"/>
								<%if(formObj.getIsAdverseRemark() == null || formObj.getIsAdverseRemark().equals("No")){ %>
									<input type="radio" name="isAdverseRemark" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isAdverseRemark" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsAdverseRemark() != null && formObj.getIsAdverseRemark().equals("Yes")){ %>
									<input type="radio" name="isAdverseRemark" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isAdverseRemark" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isAdverseRemark"/>
								<html:text property="adverseRemark" readonly="true" styleId="adverseRemark"/>
								<html:errors property="adverseRemark" /></td>
								<td class="fieldname">Audit<font color="red">*</font></td>
								<td>
								<html:hidden property="auditType" styleId="auditType"/>
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
								<%=(value.getRbiIndustryCode()== null ||value.getRbiIndustryCode().equals("") )?"-":value.getRbiIndustryCode()+"-" %>
								<integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_RBI_CODE%>"
												entryCode="<%=value.getRbiIndustryCode()%>" descWithCode="false"
												 display="true" /></td>
							</tr>
							<tr class="even">
								<td class="fieldname">Industry</td>
								<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_INDUSTRY%>"
												entryCode="<%=value.getIndustryName()%>"
												descWithCode="false"  display="true" />	</td>
								<td class="fieldname">Industry Exposure % </td>
								<td><html:text property="industryExposer" maxlength="7" readonly="true"/><html:errors property="industryExposer"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Is the borrower a director (including
								the chairman/ Managing Director) of other banks</td>
								<td>
								<html:hidden property="isDirecOtherBank" styleId="isDirecOtherBank"/>
								<%if(formObj.getIsDirecOtherBank() == null || formObj.getIsDirecOtherBank().equals("No")){ %>
									<input type="radio" name="isDirecOtherBank" value="Yes" disabled="disabled"/> Yes
									<input type="radio" name="isDirecOtherBank" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsDirecOtherBank() != null && formObj.getIsDirecOtherBank().equals("Yes")){ %>
									<input type="radio" name="isDirecOtherBank" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" name="isDirecOtherBank" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isDirecOtherBank"/>
								<html:text property="direcOtherBank" readonly="true" styleId="direcOtherBank"/><html:errors property="direcOtherBank"/></td>
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
								<html:text property="partnerOtherBank" readonly="true" styleId="partnerOtherBank"/><html:errors property="partnerOtherBank"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Is the &ldquo;substantial&rdquo;
								shareholder / director / guarantor of the borrowing company a
								director of other banks</td>
								<td>
								<html:hidden property="isSubstantialOtherBank" styleId="isSubstantialOtherBank"/>
								<%if(formObj.getIsSubstantialOtherBank() == null || formObj.getIsSubstantialOtherBank().equals("No")){ %>
								<input type="radio" name="isSubstantialOtherBank" value="Yes" disabled="disabled"/> Yes
								<input type="radio" name="isSubstantialOtherBank" value="No" checked="checked" disabled="disabled"/> No 
								<%} %>
								<%if(formObj.getIsSubstantialOtherBank() != null && formObj.getIsSubstantialOtherBank().equals("Yes")){ %>
								<input type="radio" name="isSubstantialOtherBank" value="Yes" checked="checked" disabled="disabled"/> Yes
								<input type="radio" name="isSubstantialOtherBank" value="No" disabled="disabled"/> No
								<%} %>
								<html:errors property="isSubstantialOtherBank"/>
								<html:text property="substantialOtherBank" readonly="true" styleId="substantialOtherBank"/><html:errors property="substantialOtherBank"/>
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
								<html:hidden property="isInfrastructureFinanace" styleId="isInfrastructureFinanace"/>
								<%if(formObj.getIsInfrastructureFinanace() == null || formObj.getIsInfrastructureFinanace().equals("No")){ %>
								<input type="radio" id="isInfrastructureFinanace" name="isInfrastructureFinanace" value="Yes" disabled="disabled"/> Yes
									<input type="radio" id="isInfrastructureFinanace" name="isInfrastructureFinanace" value="No" checked="checked" disabled="disabled"/> No
								<%} %> 
								<%if(formObj.getIsInfrastructureFinanace() != null && formObj.getIsInfrastructureFinanace().equals("Yes")){ %>
								<input type="radio" id="isInfrastructureFinanace" name="isInfrastructureFinanace" value="Yes" checked="checked" disabled="disabled"/> Yes
									<input type="radio" id="isInfrastructureFinanace" name="isInfrastructureFinanace" value="No" disabled="disabled"/> No
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
							<html:select property="firstYearTurnoverCurr" value="<%=formObj.getFirstYearTurnoverCurr().trim() %>" disabled="true">
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
						
                
                  		<html:select property="secondYearTurnoverCurr" value="<%=formObj.getSecondYearTurnoverCurr().trim() %>" disabled="true">
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
							<html:select property="thirdYearTurnoverCurr" value="<%=formObj.getThirdYearTurnoverCurr().trim() %>" disabled="true">
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                   <br></br>  <html:errors property="thirdYearTurnover"/>
							</td>
							</tr>
							
							
										<!-- CRI start -->
											<tr class="odd">
										<td class="fieldname">Entity Type</td>
										<td><html:select property="entityType" style="width:250"
												value="<%=formObj.getEntityType()%>" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.ENTITY_TYPE%>"
													descWithCode="false" />
											</html:select> <html:errors property="entityType" /></td>

										<td class="fieldname">
											<p>Is it SPV funding?</p>
										</td>
										<td>
											<%
												if (formObj.getIsSPVFunding() != null
														&& formObj.getIsSPVFunding().equals("Yes")) {
											%>
											<input type="radio" name="isSPVFunding" value="Yes"
											 checked="checked" disabled="disabled" /> Yes
											
											<input
											type="radio" name="isSPVFunding" value="No"
											 disabled="disabled" /> No &nbsp; <%
 	}
 %> <%
 	if (formObj.getIsSPVFunding() != null && formObj.getIsSPVFunding().equals("No")) {
 %>
											<input type="radio" name="isSPVFunding" value="Yes"
										disabled="true"  /> Yes 
										
										<input
											type="radio" name="isSPVFunding" value="No"
											disabled="true" checked="checked" /> No
											&nbsp; <%}%> 
											
											<html:errors property="isWeakerSection" />
										</td>

										<html:hidden name="ManualInputCustomerInfoForm"
											property="entityType" />
									</tr>
									
									
									
									
									
									



									<tr class="even">
										<td class="fieldname">
											<p>Indirect Country Risk Exposure?</p>
										</td>
										<td>
											<%
												if (formObj.getIndirectCountryRiskExposure() != null
														&& formObj.getIndirectCountryRiskExposure().equals("Yes")) {
											%>
										
										
										
										<input type="radio"
											name="indirectCountryRiskExposure" value="Yes"
											disabled="true"  checked="checked" disabled="true" />Yes 
											
												<input type="radio" name="indirectCountryRiskExposure"
																					
											 value="No" disabled="true" /> No &nbsp;
											
											<%}else{%>
											
									<input type="radio"
											name="indirectCountryRiskExposure" value="Yes"
											disabled="true"   />Yes 
											
												<input type="radio" name="indirectCountryRiskExposure"
																					
											checked="checked" value="No" disabled="true" /> No &nbsp;
											
											<%}%>

											<html:errors
												property="indirectCountryRiskExposure" /></td>

										<td class="fieldname">
											<p>a)Country Name</p> </br>
											<p>b)% of Sales or Gross Revenue</p>
										</td>
										<td><html:select property="criCountryName" style="width:225"
												styleId="criCountryName" disabled="true" value="<%=formObj.getCriCountryName()%>" >
												<option value="">Please Select</option>
											<html:options collection="countryList" labelProperty="label"
												property="value" />
											</html:select> </br> </br> </br> <html:text property="salesPercentage" maxlength="20"
												value="<%=formObj.getSalesPercentage() %>" styleId="salesPercentage"
												readonly="true">
											</html:text> <html:errors property="countryName" /></td>
									</tr>




									<tr class="odd">
										<td class="fieldname">Credit Gaurantee Trust for Micro
											and Small Enterprises.(CGTMSE)</td>
											
											
											
										<td>
										
										<%if(formObj.getIsCGTMSE()!= null && formObj.getIsCGTMSE().equals("Yes")){%>
										
										<input type="radio" name="isCGTMSE" 
												value="Yes" disabled="true"  checked="true" /> Yes 
												
												
												<input type="radio"
												name="isCGTMSE"  value="No"
												disabled="true" /> No &nbsp;
												
												<%}else{%>
															<input type="radio" name="isCGTMSE" 
												value="Yes" disabled="true"   /> Yes 
												
												
												<input type="radio"
												name="isCGTMSE"  value="No"
												disabled="true" checked="true" /> No &nbsp;
												
												
												<%}%></td>
										<td class="fieldname">
											<p>Is it a Income Producing Real Estate(IPRE) Co.</p>
										</td>
										<td>
										
										<%if(formObj.getIsIPRE()!=null && formObj.getIsIPRE().equals("Yes")){%>
										
											<input type="radio"  disabled="true"  checked="checked"   name="isIPRE" 
												value="Yes"    /> Yes 
												
												<input type="radio"  disabled="true"     name="isIPRE"  value="No"
												 /> No &nbsp; <html:errors
												property="isWeakerSection" />
												
												<%}else{%>
																<input type="radio"  disabled="true"     name="isIPRE" 
												value="Yes"    /> Yes 
												
												<input type="radio"  disabled="true"  checked="checked"   name="isIPRE"  value="No"
												 /> No &nbsp; 
												
												
												<%}%>
																				
												
												</td>
									</tr>



									<tr class="even">
										<td class="fieldname">Financing for Accquisition of
											equity in Overseas Companies</td>
										<td>
										
												<%if(formObj.getFinanceForAccquisition()!=null && formObj.getFinanceForAccquisition().equals("Yes")){%>
												
												
										<input type="radio"  disabled="disabled"  checked="checked"   name="financeForAccquisition"/>
											Yes 
											
											
											<input type="radio" name="financeForAccquisition"	disabled="disabled" /> No &nbsp; 
												
												<%}else{%>
												
													<input type="radio"  disabled="disabled"     name="financeForAccquisition"/>
											Yes 
											
											
											<input type="radio" name="financeForAccquisition"	disabled="disabled"   checked="checked" /> No &nbsp;
												
												<%}%>
												
												</td>
										<td class="fieldname">
											<p>a)Facility Approved</p> </br>
											<p>b)Facility Amount</p> </br>
											<p>c)Security Name</p> </br>
											<p>d)Security Type</p> </br>
											<p>d)Security Value</p>
										<td><html:select property="facilityApproved"
												styleId="facilityApproved" style="width:225" disabled="true" value="<%=formObj.getFacilityApproved()%>">
													 			<option value="">Please Select</option>
											<html:options collection="facNameList" labelProperty="label"
												property="value" /> 
											</html:select> </br> </br> </br> <html:text property="facilityAmount" maxlength="20"
												styleId="facilityAmount" disabled="true"
												value="<%=formObj.getFacilityAmount() %>">
												<p>Rs</p>
											</html:text> </br> </br> </br> <html:select property="securityName" style="width:225"
												styleId="securityName" disabled="true"  value="<%=formObj.getSecurityName()%>">
												 			<option value="">Please Select</option>
											<html:options collection="securityNameList" labelProperty="label"
												property="value" /> 
											</html:select> </br> </br> </br> <html:select property="securityType" style="width:225"
												styleId="securityType" disabled="true" value="<%=formObj.getSecurityType()%>">
											<integro:common-code categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE %>" descWithCode="false" />
											</html:select> </br> </br> </br> <html:text property="securityValue" maxlength="20"
												styleId="securityValue" disabled="true" 	value="<%=formObj.getSecurityValue()%>">
												<p>Rs</p>
											</html:text></td>
									</tr>

									<tr class="odd">
										<td class="fieldname">Type of Company(Exposure to Indian
											JV Abroad/WOS Abroad/Overseas Step Down Subsidary.)</td>
										<td>
										<%if(formObj.getCompanyType()!=null   &&  formObj.getCompanyType().equals("Yes")) { %>
										
										<input type="radio"  disabled="true"  checked="checked"   name="companyType"
											 /> Yes 
											
											<input type="radio"  disabled="true"     name="companyType" /> No &nbsp;
											
											<%}else{%>
											
	                                       <input type="radio"  disabled="true"     name="companyType"
											 /> Yes 
											
											<input type="radio"  disabled="true"  checked="checked"    name="companyType" /> No &nbsp;
																		
											
											<%}%>
											</td>
										<td class="fieldname">
											<p>a)Name of Holding Company</p> </br>
											<p>b)Type</p>
										<td><html:textarea property="nameOfHoldingCompany"   styleId="nameOfHoldingCompany"
												rows="3" cols="50" value="<%=formObj.getNameOfHoldingCompany()%>" disabled="true">
											</html:textarea> </br> </br> </br>
											
										<html:select property="type" style="width:225"
												styleId="type" disabled="true" value="<%=formObj.getType()%>">
											<integro:common-code categoryCode="<%=CategoryCodeConstant.TYPE_OF_COMPANY %>" descWithCode="false" />
											</html:select> </td>
									</tr>



									<tr class="even">
										<td class="fieldname">Breach ,if any,in compliance with
											statutory prescriptions(from CS,CA,CWA,certification)</td>
										<td>
										
										<%if(formObj.getIfBreachWithPrescriptions() !=null &&  formObj.getIfBreachWithPrescriptions().equals("Yes") ) {%>
									<input type="radio"  disabled="true"  checked="checked"   name="ifBreachWithPrescriptions" value="Yes"
												 /> Yes 
												
											<input type="radio"  disabled="true"    name="ifBreachWithPrescriptions"  value="No"
												 /> No &nbsp; 
												 
												 <%}else{%>
												 			<input type="radio" disabled="true"     name="ifBreachWithPrescriptions" value="Yes"
												 /> Yes 
												
											<input type="radio"  disabled="true" checked="checked"   name="ifBreachWithPrescriptions"  value="No"
												 /> No &nbsp; 
												 
												 
												 <%}%>
											</td>
											
											
										<td class="fieldname">
											<p>Please Provide details and comments there on</p>
										<td><html:textarea property="comments" styleId="comments" rows="3" cols="50"
												value="<%=formObj.getComments()%>" readonly="true">
											</html:textarea></td>
									</tr>

									<tr class="odd">
										<td class="fieldname">Category of Farmer</td>
										<td><html:select property="categoryOfFarmer"
												style="width:225"  value="<%=formObj.getCategoryOfFarmer()%>" disabled="true">
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
												style="width:225"  value="<%=formObj.getCountryOfGuarantor()%>" disabled="true">
														<option value="">Please Select</option>
											<html:options collection="countryList" labelProperty="label"
												property="value" />
											</html:select></td>
										<td class="fieldname">
											<p>Is it a Affordable Housing Finance?</p>
										</td>
										<td>
										
										<%if(formObj.getIsAffordableHousingFinance() !=null && formObj.getIsAffordableHousingFinance().equals("Yes") ){%>
										
										<input type="radio"  disabled="true"  checked="checked"   name="isAffordableHousingFinance" value="Yes"
												 /> Yes 
												
										<input type="radio"  disabled="true"    name="isAffordableHousingFinance" value="No"
												 /> No &nbsp;
                                             <%}else{%>
											 		<input type="radio"  disabled="true"     name="isAffordableHousingFinance" value="Yes"
												 /> Yes 
												
										<input type="radio"  disabled="true"  checked="checked"   name="isAffordableHousingFinance" value="No"
												 /> No &nbsp;
											 <%}%>


												</td>
									</tr>








									<tr class="odd">
										<td class="fieldname">Exposure is in the restricted list
											of financing</td>

										<td>
										<%if(formObj.getIsInRestrictedList()!=null && formObj.getIsInRestrictedList().equals("Yes") ) {%>
										
										<input type="radio"  disabled="true"  checked="checked"   name="isInRestrictedList" value="Yes" 
											 /> Yes 
												
												<input type="radio"  disabled="true"     name="isInRestrictedList" 
												value="No"  /> No &nbsp;
											<%}else{%>
					<input type="radio"  disabled="true"     name="isInRestrictedList" value="Yes" 
											 /> Yes 
												
												<input type="radio"  disabled="true"  checked="checked"   name="isInRestrictedList" 
												value="No"  /> No &nbsp;

<%}%>
											<html:select
												property="restrictedFinancing"  value="<%=formObj.getRestrictedFinancing()%>" styleId="restrictedFinancing" style="width:225" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.RESTRICTED_FINANCING%>"
													descWithCode="false" />
											</html:select></td>


										<td class="fieldname">
											<p>Credit to restricted list of industries</p>
										</td>
										<td>	
										<%if(formObj.getRestrictedIndustries() !=null && formObj.getRestrictedIndustries().equals("Yes")   ){%>
										
										
										<input type="radio"  disabled="true"  checked="checked"   name="restrictedIndustries" value="Yes" /> Yes
												
												<input type="radio"  disabled="true"    name="restrictedIndustries"  
												value="No"  /> No &nbsp;
												
												
														<html:select
												property="restrictedListIndustries" styleId="restrictedListIndustries" style="width:225" value="<%=formObj.getRestrictedListIndustries().trim()%>"  disabled="true" >
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CREDIT_LIST_RESTRICTED_INDUSTRIES%>"
													descWithCode="false" />
											</html:select></td>
												
												
												<%}else{%>
														<input type="radio"  disabled="true"    name="restrictedIndustries" value="Yes" /> Yes
												
												<input type="radio"  disabled="true"    name="restrictedIndustries"   checked="checked"  value="No"  /> No &nbsp;
												
													<html:select
												property="restrictedListIndustries" styleId="restrictedListIndustries" style="width:225" value="<%=formObj.getRestrictedListIndustries().trim()%>"  disabled="true" >
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CREDIT_LIST_RESTRICTED_INDUSTRIES%>"
													descWithCode="false" />
											</html:select></td>
												<%}%>
												
										
									</tr>



									<tr class="even">
										<td class="fieldname">Qualifying notes on accounts,if any
											,by the statutory Auditor of the borrower</td>

										<td>
										
										<%if(formObj.getIsQualifyingNotesPresent() !=null && formObj.getIsQualifyingNotesPresent().equals("Yes") ) {%>
										<input type="radio"  disabled="true"  checked="checked"    name="isQualifyingNotesPresent"
												 value="Yes"
												 /> Yes 
												
												
											<input type="radio" disabled="true"    name="isQualifyingNotesPresent"
												 value="No"
												 /> No &nbsp; 
												 <%}else{%>
                                                  						<input type="radio"  disabled="true"   name="isQualifyingNotesPresent"
												 value="Yes"
												 /> Yes 
												
												
											<input type="radio"  disabled="true"  checked="checked"    name="isQualifyingNotesPresent"
												 value="No"
												 /> No &nbsp; 

<%}%>												  
												 </td>


										<td class="fieldname">
											<p>Please provide details and state implications on
												financials,liquidity,reputation and credit risk of the
												borrower</p>
										<td><html:textarea property="stateImplications" styleId="stateImplications"
												rows="3" cols="50" value="<%=formObj.getStateImplications()%>" readonly="true">
											</html:textarea></td>
									</tr>






									<tr class="odd">
										<td class="fieldname">Borrower appears in the Reject
											Database of Credit</td>
										<td>
										<%if(formObj.getIsBorrowerInRejectDatabase()!=null  &&  formObj.getIsBorrowerInRejectDatabase().equals("Yes") )  {%>
										
										<input type="radio"  disabled="true" checked="checked"
												name="isBorrowerInRejectDatabase" value="Yes"
												 /> Yes 


												 <input type="radio" disabled="true" 
												name="isBorrowerInRejectDatabase"
												 value="No"
												 /> No &nbsp; 
												 
												 <%}else{%>
												 <input type="radio"  disabled="true"  	name="isBorrowerInRejectDatabase" value="Yes" /> Yes 


												 <input type="radio"  disabled="true" checked="checked"	name="isBorrowerInRejectDatabase"	 value="No"/> No &nbsp; 
												 
												 <%}%>
												 
															 
												 
												 </td>
										<td class="fieldname">
											<p>Provide reason for reject history</p>
										<td><html:textarea property="rejectHistoryReason"
												styleId="rejectHistoryReason" rows="3" cols="50" value="<%=formObj.getRejectHistoryReason() %>" disabled="true">
											</html:textarea></td>
										</tr>


									<tr class="even">
										<td class="fieldname">Category for Capital & Commodity Exchange Business</td>
										<td>
										<%if(formObj.getCapitalForCommodityAndExchange()!=null && formObj.getCapitalForCommodityAndExchange().equals("Broker") ){%>
										      
											  <input type="radio"  disabled="true"  checked="checked"	name="capitalForCommodityAndExchange"
												 value="Broker"
											    /> Broker
											 
												<input type="radio"  disabled="true"  	name="capitalForCommodityAndExchange"
												 value="Non Broker"
											      /> Non Broker  &nbsp; </br> 	
											      
											      
											     <html:checkbox property="isBrokerTypeShare" styleId="isBrokerTypeShare" value="Y" disabled="true"/>
												Share Broker
												&nbsp;
												
												<html:checkbox property="isBrokerTypeCommodity" styleId="isBrokerTypeCommodity" value="Y" disabled="true"/>
												Commodity Broker
												
											       
													<%  
										}%> 
										 
										 
										 
										 <%if(formObj.getCapitalForCommodityAndExchange()!=null && formObj.getCapitalForCommodityAndExchange().equals("Non Broker") ){%>
										  <input type="radio"  disabled="true"  	name="capitalForCommodityAndExchange"
												 value="Broker"
											    /> Broker
											 
												<input type="radio"  disabled="true" checked="checked"  	name="capitalForCommodityAndExchange"
												 value="Non Broker"
											      /> Non Broker  &nbsp; </br> 	 
												
												 <html:checkbox property="isBrokerTypeShare" styleId="isBrokerTypeShare" value="Y" disabled="true"/>
												Share Broker
												&nbsp;
												
												<html:checkbox property="isBrokerTypeCommodity" styleId="isBrokerTypeCommodity" value="Y" disabled="true"/>
												Commodity Broker
                                         <%}%> 
                                         
                                        
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
										<td>
										
										 <%if(formObj.getObjectFinance()!=null && formObj.getObjectFinance().equals("Yes") ){%>
										<input type="radio"  disabled="true"  checked="checked" 	name="objectFinance"  value="Yes"/> Yes

									<input type="radio"  disabled="true"   	name="objectFinance"  value="No"/> No &nbsp;
												 
										<%}else{%>		 
													<input type="radio"  disabled="true"   	name="objectFinance"  value="Yes"
												onclick="showHideWeakerSection();" /> Yes

									<input type="radio"  disabled="true"  checked="checked"  	name="objectFinance"  value="No"
												 /> No &nbsp;
										
										<%}%>
												 
												 </td>
										<td class="fieldname">
											<p>Is it a Commodities Finance Customer?</p>
										<td>
										 <%if(formObj.getIsCommodityFinanceCustomer()!=null && formObj.getIsCommodityFinanceCustomer().equals("Yes") ){%>
										
										<input type="radio"  disabled="true"  checked="checked"  	name="isCommodityFinanceCustomer"	 value="Yes"/> Yes 
												 
												 
									<input type="radio"  disabled="true"    name="isCommodityFinanceCustomer" value="No"/> No
									
									<%}else{%>
									<input type="radio"  disabled="true"    	name="isCommodityFinanceCustomer"	 value="Yes"/> Yes 
												 
												 
									<input type="radio"  disabled="true"  checked="checked"   name="isCommodityFinanceCustomer" value="No"/> No
									<%}%>
									</td>
										</td>
										</td>
									</tr>




									<tr class="even">
										<td class="fieldname">Restructured Borrower/Facility</td>
										<td>
										
											 <%if(formObj.getRestructuedBorrowerOrFacility()!=null && formObj.getRestructuedBorrowerOrFacility().equals("Yes") ){%>
										
									<input type="radio"  disabled="true"  checked="checked"   name="restructuedBorrowerOrFacility" value="Yes" /> Yes 
									
									<input type="radio"  disabled="true"     name="restructuedBorrowerOrFacility" value="No" /> No
									<%}else{%>
									
									<input type="radio"  disabled="true"     name="restructuedBorrowerOrFacility" value="Yes" /> Yes 
									
									<input type="radio"  disabled="true"  checked="checked"   name="restructuedBorrowerOrFacility" value="No" /> No
									
									<%}%>
									
									</td>

										<td class="fieldname">

											<p>a)Facility</p> </br>
											<p>b)Limit Amount</p>

										</td>
										<td><html:select property="facility" style="width:225"  value="<%=formObj.getFacility()%>" disabled="true">
												<option value="">Please Select</option>
											<html:options collection="facNameList" labelProperty="label"
												property="value" /> 
											</html:select> </br> </br> </br> <html:text property="limitAmount" maxlength="20"
												value="<%=formObj.getLimitAmount()%>" disabled="true">
											</html:text></td>


									</tr>





									<tr class="odd">
										<td class="fieldname">Conduct of Account with Other Banks</td>
										<td>
										
										 <%if(formObj.getConductOfAccountWithOtherBanks()!=null && formObj.getConductOfAccountWithOtherBanks().equals("Satisfactory") ){%>
										<input type="radio"  disabled="true"  checked="checked"   name="conductOfAccountWithOtherBanks" value="Satisfactory"/> Satisfactory 
												
										<input type="radio"  disabled="true"     name="conductOfAccountWithOtherBanks" value="classified" /> Classified
										
										<%}else{%>
										
										<input type="radio"  disabled="true"     name="conductOfAccountWithOtherBanks" value="Satisfactory" /> Satisfactory 
												
										<input type="radio"  disabled="true"  checked="checked"     name="conductOfAccountWithOtherBanks" value="classified" /> Classified
										<%}%>
										</td>

										<td class="fieldname">

											<p>Crilc Status</p> </br>
											<p>Comment</p>

										</td>
										<td>
										<html:select property="crilicStatus"
												style="width:225" value="<%=formObj.getCrilicStatus()%>" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CRILIC_STATUS%>"
													descWithCode="false" />
											</html:select> </br> </br> </br> <html:textarea property="comment" rows="3" cols="50"
												value="<%=formObj.getComment() %>" disabled="true">
											</html:textarea></td>


									</tr>








							<tr class="even">
										<td class="fieldname">Subsidy Flag</td>
										<td>
										
										<%if(formObj.getSubsidyFlag()!=null && formObj.getSubsidyFlag().equals("Yes") ){%>
										<input type="radio"  disabled="true"  checked="checked"   name="subsidyFlag"  value="Yes"/> Yes 
												
												
										<input type="radio"  disabled="true"     name="subsidyFlag"  value="No"/>No
										<%}else{%>
										<input type="radio"  disabled="true"     name="subsidyFlag"  value="Yes"/> Yes 
												
												
										<input type="radio"  disabled="true"   checked="checked"   name="subsidyFlag"  value="No"/>No
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
										<td>
										<%if(formObj.getCautionList()!=null && formObj.getCautionList().equals("Yes") ){%>
										<input type="radio"  disabled="true"    checked="checked"   name="cautionList" value="Yes"/> Yes
										
										<input type="radio"  disabled="true"     name="cautionList" value="No"/> No </br> </br> </br> 
										
										<%}%>
										
										
										<%if(formObj.getCautionList()!=null && formObj.getCautionList().equals("No") ){%>
										
										<input type="radio" disabled="true" name="cautionList" value="Yes"/> Yes
										
										<input type="radio"  disabled="true"  checked="checked"    name="cautionList" value="No"/> No </br> </br> </br> 
										
										<%}%>

									  <html:text
												property="dateOfCautionList" maxlength="20" styleId="Image998"
												readonly="true" value="<%=formObj.getDateOfCautionList()%>">
											</html:text> <img src="img/calendara.gif" name="Image724" border="0"
											id="Image724"
											onclick="return showCalendar('dateOfCautionList', 'dd/mm/y');"
											onmouseover="MM_swapImage('Image998','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" /></br> </br> </br> 

											<html:text
												property="company" maxlength="100" style="width:250" value="<%=formObj.getCompany() %>" readonly="true">
											</html:text> </br> </br> </br> 
											<html:text property="directors" maxlength="100" style="width:250"
												value="<%=formObj.getDirectors() %>" readonly="true">
											</html:text> </br> </br> </br> 
											<html:text property="groupCompanies" maxlength="100" style="width:250"
													value="<%=formObj.getGroupCompanies() %>" readonly="true">
											</html:text>
											
											</td>


										<td class="fieldname">
											<p>RBI Defaulter's List</p> </br>
											<p>Date of Caution List</p> </br>
											<p>Company</p> </br>
											<p>Directors</p> </br>
											<p>Group Companies</p>
										</td>
										<td>
												<%if(formObj.getDefaultersList()!=null && formObj.getDefaultersList().equals("Yes") ){%>
										<input type="radio"  disabled="true"   checked="checked"   name="defaultersList" value="Yes" /> Yes 
										<input type="radio"  disabled="true"      name="defaultersList" value="No"/> No </br> </br> </br> 
										<%}else{%>
													<input type="radio"  disabled="true"      name="defaultersList" value="Yes" /> Yes 
										<input type="radio"  disabled="true"  checked="checked"     name="defaultersList" value="No"/> No </br> </br> </br> 
										<%}%>
										
										<html:text	property="rbiDateOfCautionList" maxlength="20"	readonly="true" styleId="Image999" value="<%=formObj.getRbiDateOfCautionList()%>"></html:text>
										<img src="img/calendara.gif" name="Image724" border="0"
											id="Image724"
											onclick="return showCalendar('rbiDateOfCautionList', 'dd/mm/y');"
											onmouseover="MM_swapImage('Image999','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" /> 
											
											<html:errors
												property="aaApprovalDate" /> </br> </br> </br> 
												
												<html:text
												property="rbiCompany" maxlength="100" style="width:250" value="<%=formObj.getRbiCompany() %>" readonly="true">
											</html:text> </br> </br> </br> <html:text property="rbiDirectors" maxlength="100" style="width:250"
												value="<%=formObj.getRbiDirectors() %>" readonly="true">
												
											</html:text> </br> </br> </br> <html:text property="rbiGroupCompanies" maxlength="100" readonly="true"
											style="width:250"	value="<%=formObj.getRbiGroupCompanies() %>">
											</html:text></td>
									</tr>



									<tr class="even">
										<td class="fieldname">
											<p>1) Commercial Real Estate</p> </br>
											<p>2) Commercial Real Estate-Residential Housing</p> </br>
											<p>3) Residential Real Estate</p> </br>
											<p>4) Indirect Real Estate</p>

										</td>
										<td>
												<%if(formObj.getCommericialRealEstate()!=null && formObj.getCommericialRealEstate().equals("Yes") ){%>
										   <input type="radio"  disabled="true"   checked="checked"   name="commericialRealEstate" value="Yes"/> Yes

											<input type="radio"  disabled="true"      name="commericialRealEstate" value="No"/> No </br>
											
											<%}else{%>
												   <input type="radio"  disabled="true"      name="commericialRealEstate" value="Yes"/> Yes

											<input type="radio"  disabled="true"  checked="checked"    name="commericialRealEstate" value="No"/> No
											<%}%>

												<html:select
												property="commericialRealEstateValue" style="width:225"  value="<%=formObj.getCommericialRealEstateValue()%>" disabled="true">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE%>"
													descWithCode="false" />
											</html:select> </br> </br> </br> 
											
												<%if(formObj.getCommericialRealEstateResidentialHousing()!=null && formObj.getCommericialRealEstateResidentialHousing().equals("Yes") ){%>
											<input type="radio"  disabled="true"  checked="checked"    name="commericialRealEstateResidentialHousing"
												value="Yes" /> Yes 
												
												
											<input type="radio"  disabled="true"     name="commericialRealEstateResidentialHousing" value="No"
												onclick="showHideWeakerSection();" /> No</br> </br> </br> 
												
												<%}else{%>
												
											<input type="radio"  disabled="true"      name="commericialRealEstateResidentialHousing"
												value="Yes" /> Yes 
												
												
											<input type="radio"  disabled="true"  checked="checked"    name="commericialRealEstateResidentialHousing" value="No"
												 /> No</br> </br> </br> 
												<%}%>
												
												<%if(formObj.getResidentialRealEstate()!=null && formObj.getResidentialRealEstate().equals("Yes") ){%>
												<input type="radio"  disabled="true" checked="checked"      name="residentialRealEstate"
												 value="Yes"
												 /> Yes


													<input type="radio"  disabled="true"      name="residentialRealEstate"
												 value="No"
												 /> No </br> </br> </br> 
												 <%}else{%>
												 
												 <input type="radio"  disabled="true"       name="residentialRealEstate"
												 value="Yes"
												 /> Yes


												<input type="radio"  disabled="true"  checked="checked"     name="residentialRealEstate"
												 value="No"
												 /> No </br> </br> </br> 
												 
												 <%}%>
												 
												 
												 <%if(formObj.getIndirectRealEstate()!=null && formObj.getIndirectRealEstate().equals("Yes") ){%>
											<input type="radio"  disabled="true"  checked="checked"     name="indirectRealEstate" 
												value="Yes" /> Yes 
												
												<input type="radio"  disabled="true"      name="indirectRealEstate" 
												value="No"  /> No
												
												<%}else{%>
												<input type="radio"  disabled="true"       name="indirectRealEstate" 
												value="Yes" /> Yes 
												
												<input type="radio"  disabled="true"  checked="checked"     name="indirectRealEstate" 
												value="No"  /> No
												<%}%>
												</td>
												

										<td class="fieldname"></td>
										<td></td>
									</tr>
							
							
							
							
							
							<!--CRI end  -->
							
										
							
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
					<h3 align="left">Add CRI Facility</h3>
					<input onclick="javascript : addCriFacilityList()"
								name="btnCri" type="button" id="btnCri"
								value="Attach Facility Details" class="btnNormal" disabled="disabled"/>
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
						<%String strTemp = ""; %>
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
												<td><integro:empty-if-null
													value="<%=ob.getLineNo() %>" /> </td>
												<td><integro:empty-if-null
													value="<%=ob.getSerialNo()%>" /> </td>
												<%
												strTemp = strTemp + ob.getFacilityFor()+"|";
												%>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getFacilityFor()%>" />&nbsp;</center>
												</td>
												<td>
												<center><integro:empty-if-null
													value="<%=ob.getFacilityName()%>" /> &nbsp;</center>
												</td>
												<td>
												<!-- <center><%=ob.getFacilityAmount()%>&nbsp;</center> -->
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
														<td colspan="10">
															<bean:message key="label.global.not.found" />
														</td>
													</tr>
													<%
														}
													%>
								</logic:present>
									<%
									if(no != 0){
										%>
										<html:hidden property="tempFacilityData" value="<%=strTemp %>"/>
										<%
										System.out.println("ffffffffffffff----"+strTemp);
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
	
	<script language="javascript">
	//A Shiv 230811
		
		 <%	if(formObj.getIsNbfs() == null || formObj.getIsNbfs().equals("")) { %>
				document.all.isNbfs[1].checked=true;
				document.getElementById('nbfsA').disabled = true;
				document.getElementById('nbfsB').disabled = true;
		<%	}else {%>
		<%if(formObj.getIsNbfs().equals("Yes")) { %>
				document.getElementById('nbfsA').disabled = false;
				document.getElementById('nbfsB').disabled = false;
		<% }else{ %>
				document.getElementById('nbfsA').disabled = true;
				document.getElementById('nbfsB').disabled = true;
		<% }
		}%>

		<% if(formObj.getIsWeakerSection() == null || formObj.getIsWeakerSection().equals("")) { %>
				document.all.isWeakerSection[1].checked=true;
				document.getElementById('weakerSection').disabled = true;
		<% }else{ %>
		<%if(formObj.getIsWeakerSection().equals("Yes")) { %>
				document.getElementById('weakerSection').disabled = false;
		<% }else{ %>
				document.getElementById('weakerSection').disabled = true;
		<% }} %>

		<% if(formObj.getIsSemsGuideApplicable() == null || formObj.getIsSemsGuideApplicable().equals("")) { %>
				document.all.isSemsGuideApplicable[1].checked=true;
		<% } %>

		<% if(formObj.getIsFailIfcExcluList() == null || formObj.getIsFailIfcExcluList().equals("")) { %>
				document.all.isFailIfcExcluList[1].checked=true;
		<% } %>

		<% if(formObj.getIsTufs() == null || formObj.getIsTufs().equals("")) { %>
				document.all.isTufs[1].checked=true;
		<% } %>
	
		<% if(formObj.getIsMinorityCommunity() == null || formObj.getIsMinorityCommunity().equals("")) { %>
				document.all.isMinorityCommunity[1].checked=true;
				document.getElementById('isMinorityCommunity').disabled = true;
		<% }else {%>
		<%if(formObj.getIsMinorityCommunity().equals("Yes")) { %>
				document.getElementById('isMinorityCommunity').disabled = false;
			<% }else{ %>
				document.getElementById('isMinorityCommunity').disabled = true;
			<% }} %>
			
			
			<% if(formObj.getIsCommoditiesExposer() == null || formObj.getIsCommoditiesExposer().equals("")) { %>
				document.all.isCommoditiesExposer[1].checked=true;
				document.all.isSensitive[0].disabled = true;
				document.all.isSensitive[1].disabled = true;
		<% }else{ %>
		<%if(formObj.getIsCommoditiesExposer().equals("Yes")) { %>
				document.all.isSensitive[0].disabled = false;
				document.all.isSensitive[1].disabled = false;
		<% }else{ %>
				document.all.isSensitive[0].disabled = true;
				document.all.isSensitive[1].disabled = true;
		<% } }%>

		<% if(formObj.getIsSensitive() == null || formObj.getIsSensitive().equals("")) { %>
			document.all.isSensitive[1].checked=true;
			document.getElementById('commoditiesName').disabled = true;
		<% }else{ %>
		<%if(formObj.getIsSensitive().equals("Yes")) { %>
				document.getElementById('commoditiesName').disabled = false;
		<% }else{ %>
				document.getElementById('commoditiesName').disabled = true;
		<% } }%>
		<% if(formObj.getIsInfrastructureFinanace() == null || formObj.getIsInfrastructureFinanace().equals("")) { %>
				document.all.isInfrastructureFinanace[1].checked=true;
				document.getElementById('isInfrastructureFinanace').disabled = true;
		<% }else {%>
		<%if(formObj.getIsInfrastructureFinanace().equals("Yes")) { %>
				document.getElementById('isInfrastructureFinanace').disabled = false;
		<% }else{ %>
				document.getElementById('isInfrastructureFinanace').disabled = true;
		<% } }%>
		<% if(formObj.getIsLitigation() == null || formObj.getIsLitigation().equals("")) { %>	
				document.all.isLitigation[1].checked=true;
				document.getElementById('litigationBy').disabled = true;
		<% }else {%>
	<%if(formObj.getIsLitigation().equals("Yes")) { %>
			document.getElementById('litigationBy').disabled = false;
	<% }else{ %>
			document.getElementById('litigationBy').disabled = true;
	<% } }%>

	<% if(formObj.getIsInterestOfBank() == null || formObj.getIsInterestOfBank().equals("")) { %>	
			document.all.isInterestOfBank[1].checked=true;
			document.getElementById('interestOfBank').disabled = true;
	<% }else{ %>
	<%if(formObj.getIsInterestOfBank().equals("Yes")) { %>
			document.getElementById('interestOfBank').disabled = false;
	<% }else{ %>
			document.getElementById('interestOfBank').disabled = true;
	<% }} %>
	<% if(formObj.getIsAdverseRemark() == null || formObj.getIsAdverseRemark().equals("")) { %>
			document.all.isAdverseRemark[1].checked=true;
			document.getElementById('adverseRemark').disabled = true;
	<% }else{ %>
	<%if(formObj.getIsAdverseRemark().equals("Yes")) { %>
			document.getElementById('adverseRemark').disabled = false;
	<% }else{ %>
			document.getElementById('adverseRemark').disabled = true;
	<% } }%>
	<% if(formObj.getIsDirecOtherBank() == null || formObj.getIsDirecOtherBank().equals("")) { %>
			document.all.isDirecOtherBank[1].checked=true;
			document.getElementById('direcOtherBank').disabled = true;
	<% }else {%>
	<%if(formObj.getIsDirecOtherBank().equals("Yes")) { %>
			document.getElementById('direcOtherBank').disabled = false;
	<% }else{ %>
			document.getElementById('direcOtherBank').disabled = true;
	<% }} %>
	<% if(formObj.getIsPartnerOtherBank() == null || formObj.getIsPartnerOtherBank().equals("")) { %>
			document.all.isPartnerOtherBank[1].checked=true;
	<% }else {%>
	<%if(formObj.getIsPartnerOtherBank().equals("Yes")) { %>
			document.getElementById('partnerOtherBank').disabled = false;
	<% }else{ %>
			document.getElementById('partnerOtherBank').disabled = true;
	<% } }%>
	<% if(formObj.getIsSubstantialOtherBank() == null || formObj.getIsSubstantialOtherBank().equals("")) { %>
			document.all.isSubstantialOtherBank[1].checked=true;
	<% }else{ %>
	<% if(formObj.getIsSubstantialOtherBank().equals("Yes")) { %>
			document.getElementById('substantialOtherBank').disabled = false;
	<% }else{ %>
			document.getElementById('substantialOtherBank').disabled = true;
	<% } }%>
	<% if(formObj.getIsHdfcDirecRltv() == null || formObj.getIsHdfcDirecRltv().equals("")) { %>
			document.all.isHdfcDirecRltv[1].checked=true;
	<% }else{ %>
	<%if(formObj.getIsHdfcDirecRltv().equals("Yes")) { %>
			document.getElementById('hdfcDirecRltv').disabled = false;
	<% }else{ %>
			document.getElementById('hdfcDirecRltv').disabled = true;
	<% } }%>
	<% if(formObj.getIsObkDirecRltv() == null || formObj.getIsObkDirecRltv().equals("")) { %>
			document.all.isObkDirecRltv[1].checked=true;
	<% }else {%>
	<%if(formObj.getIsObkDirecRltv().equals("Yes")) { %>
			document.getElementById('obkDirecRltv').disabled = false;
	<% }else{ %>
			document.getElementById('obkDirecRltv').disabled = true;
	<% } }%>
	<% if(formObj.getIsPartnerDirecRltv() == null || formObj.getIsPartnerDirecRltv().equals("")) { %>
				document.all.isPartnerDirecRltv[1].checked=true;
	<% }else {%>
	<%if(formObj.getIsPartnerDirecRltv().equals("Yes")) { %>
			document.getElementById('partnerDirecRltv').disabled = false;
	<% }else{ %>
			document.getElementById('partnerDirecRltv').disabled = true;
	<% } }%>

	<% if(formObj.getPsu() == null || formObj.getPsu().equals("")) { %>
			document.all.psu[2].checked=true;
			document.getElementById('psuPercentage').disabled = true;
	<% }else {%>
		<%if(formObj.getPsu().equals("State") || formObj.getPsu().equals("Central")) { %>
			document.getElementById('psuPercentage').disabled = false;
	<% }else{ %>
			document.getElementById('psuPercentage').disabled = true;
	<% } }%>

	<% if(formObj.getGovtUnderTaking() == null || formObj.getGovtUnderTaking().equals("")) { %>
			document.all.govtUnderTaking[2].checked=true;
	<% }%>
	
	<% if(formObj.getIsSubstantialRltvHdfcOther() ==null || formObj.getIsSubstantialRltvHdfcOther().equals("")) { %>
				document.all.isSubstantialRltvHdfcOther[1].checked=true;
	<% }else{ %>
	<%if(formObj.getIsSubstantialRltvHdfcOther().equals("Yes")) { %>
			document.getElementById('substantialRltvHdfcOther').disabled = false;
	<% }else{ %>
			document.getElementById('substantialRltvHdfcOther').disabled = true;
	<% } }%>
	<% if(formObj.getIsRbiDefaulter() == null || formObj.getIsRbiDefaulter().equals("")) { %>	
				document.all.isRbiDefaulter[1].checked=true;
	<% }else {%>
	<%if(formObj.getIsRbiDefaulter().equals("Yes")) { %>
			document.all.rbiDefaulter[0].disabled = false;
			document.all.rbiDefaulter[1].disabled = false;
			document.all.rbiDefaulter[2].disabled = false;
	<% }else{ %>
			document.all.rbiDefaulter[0].disabled = true;
			document.all.rbiDefaulter[1].disabled = true;
			document.all.rbiDefaulter[2].disabled = true;
	<% }} %>
	<% if(formObj.getIsProjectFinance() == null || formObj.getIsProjectFinance().equals("")) { %>
			document.all.isProjectFinance[1].checked=true;
	<% }%>
	<% if(formObj.getIsKisanCreditCard() == null || formObj.getIsKisanCreditCard().equals("")) { %>
			document.all.isKisanCreditCard[1].checked=true;
	<% }%>
	<% if(formObj.getIsPermenentSsiCert() == null || formObj.getIsPermenentSsiCert().equals("")) { %>
			document.all.isPermenentSsiCert[1].checked=true;
	<% }%>
	<% if(formObj.getIsBackedByGovt() == null || formObj.getIsBackedByGovt().equals("")) { %>
			document.all.isBackedByGovt[1].checked=true;	
	<% }%>
	<% if((formObj.getIsBackedByGovt() != null && formObj.getIsBackedByGovt().equals("Yes"))
			|| (formObj.getIsInfrastructureFinanace() != null && formObj.getIsInfrastructureFinanace().equals("Yes"))
			|| (formObj.getIsKisanCreditCard() != null && formObj.getIsKisanCreditCard().equals("Yes"))
			|| (formObj.getIsProjectFinance() != null && formObj.getIsProjectFinance().equals("Yes"))
			|| (formObj.getIsPermenentSsiCert() != null && formObj.getIsPermenentSsiCert().equals("Yes"))) { %>
			document.getElementById('btnCri').disabled = false;	
	<% }else {%>
			document.getElementById('btnCri').disabled = true;	
	<% }%> 
</script>

<!-- Uma:Added below for IE11 -->
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" styleId="cifId"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" styleId="pan"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="status" styleId="status"/>
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
</html>
<!-- InstanceEnd -->


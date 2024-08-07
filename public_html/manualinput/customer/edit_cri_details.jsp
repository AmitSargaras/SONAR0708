<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.base.businfra.search.SearchResult,com.integrosys.component.commondata.app.CommonDataSingleton,
	com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.user.MaintainUserForm,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.component.user.app.bus.CommonUserSearchCriteria,java.util.List,java.util.Vector"%>

<%@page import="com.integrosys.cms.ui.todo.TodoAction"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="java.util.ArrayList"%>

<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.*"%>
<script type="text/javascript" src="js/calendar.js"></script>

<%
	String context = request.getContextPath() + "/";

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
		
ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
request.setAttribute("ManualInputCustomerInfoForm",value);
/* value.getCustomerFyClouser();
if(.equals may) */
	int sno = 0;
	int no = 0;
	List facList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.facList");
	if (!(facList == null)) {
		pageContext.setAttribute("facList", facList);
	}
	List currencyList = (ArrayList) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.currencyList");

	if (!(currencyList == null)) {
		pageContext.setAttribute("currencyList", currencyList);
		session.setAttribute("currencyList", currencyList);

	}

	List countryList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.countryList");

	if (!(countryList == null)) {

		pageContext.setAttribute("countryList", countryList);
		//request.setAttribute("otherBankList", otherBankList);
	}

	List facNameList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.facNameList");

	if (!(facNameList == null)) {

		pageContext.setAttribute("facNameList", facNameList);
		//request.setAttribute("otherBankList", otherBankList);
	}

	List securityNameList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.securityNameList");

	if (!(securityNameList == null)) {

		pageContext.setAttribute("securityNameList", securityNameList);
		//request.setAttribute("otherBankList", otherBankList);
	}

	//------------------
	List lmtList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.lmtList");
	if (!(lmtList == null)) {
		pageContext.setAttribute("lmtList", lmtList);
	}

	List partyGroupList = (List) session
			.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.partyGroupList");

	pageContext.setAttribute("partyGroupList", partyGroupList);
	
	
	String camTypeForPartys = (String) session.getAttribute("com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerAction.camTypeForParty");
	System.out.println("camTypeForPartys========>"+camTypeForPartys);
	pageContext.setAttribute("camTypeForParty", camTypeForPartys);
	System.out.println("value.getCamTypePartyLevel()========>"+value.getCamTypePartyLevel());
	
	
	String yearEndPeriod = "";
	String yearEndPeriodMonth = "";
	String yearEndPeriodValue = "";
	if(value != null){
		yearEndPeriod = value.getYearEndPeriod();
		
		if(yearEndPeriod != null){
		String[] yearEndPeriodArray = yearEndPeriod.split("-");
		if(yearEndPeriodArray.length == 2){
			yearEndPeriodMonth = yearEndPeriodArray[1];
		}
		
		}
	}
	
	if(camTypeForPartys == null || "".equals(camTypeForPartys) || "Initial".equals(camTypeForPartys)) {
	if(yearEndPeriodMonth != null){
		yearEndPeriodMonth = yearEndPeriodMonth.toUpperCase();
		if(yearEndPeriodMonth.length() == 3){
		if(yearEndPeriodMonth.startsWith("JAN")){
			yearEndPeriodValue = "January Ending";
		}else if(yearEndPeriodMonth.startsWith("FEB")){
			yearEndPeriodValue = "February Ending";
		}else if(yearEndPeriodMonth.startsWith("MAR")){
			yearEndPeriodValue = "March Ending";
		}else if(yearEndPeriodMonth.startsWith("APR")){
			yearEndPeriodValue = "April Ending";
		}else if(yearEndPeriodMonth.startsWith("MAY")){
			yearEndPeriodValue = "May Ending";
		}else if(yearEndPeriodMonth.startsWith("JUN")){
			yearEndPeriodValue = "June Ending";
		}else if(yearEndPeriodMonth.startsWith("JUL")){
			yearEndPeriodValue = "July Ending";
		}else if(yearEndPeriodMonth.startsWith("AUG")){
			yearEndPeriodValue = "August Ending";
		}else if(yearEndPeriodMonth.startsWith("SEP")){
			yearEndPeriodValue = "September Ending";
		}else if(yearEndPeriodMonth.startsWith("OCT")){
			yearEndPeriodValue = "October Ending";
		}else if(yearEndPeriodMonth.startsWith("NOV")){
			yearEndPeriodValue = "November Ending";
		}else if(yearEndPeriodMonth.startsWith("DEC")){
			yearEndPeriodValue = "December Ending";
		}else{
			yearEndPeriodValue = value.getCustomerFyClouser();
		}
		}else{
			yearEndPeriodValue = value.getCustomerFyClouser();
		}
		
	}
	}else{
		yearEndPeriodValue = value.getCustomerFyClouser();
	}
	
	System.out.println("value.getYearEndPeriod()========>"+yearEndPeriodValue);
	
	
	
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

<!-- InstanceBegin template="Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->

<head>
<%@page import="com.integrosys.base.techinfra.mapper.MapperUtil"%>
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>

<script type="text/javascript" src="<%=context%>js/ajaxSecurityTypeDropdown.js"></script>
<%@page import="java.util.ArrayList"%>
<script type="text/javascript" src="js/itgUtilities.js"></script>
<script language="JavaScript" type="text/JavaScript">

<!--
	function MM_jumpMenu(targ, selObj, restore) { //v3.0
		eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value
				+ "'");
		if (restore)
			selObj.selectedIndex = 0;
	}

	function gotopage(aLocation) {
		window.location.href = aLocation;
	}

	function MM_swapImgRestore() { //v3.0
		var i, x, a = document.MM_sr;
		for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
			x.src = x.oSrc;
	}
	function MM_preloadImages() { //v3.0
		var d = document;
		if (d.images) {
			if (!d.MM_p)
				d.MM_p = new Array();
			var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
			for (i = 0; i < a.length; i++)
				if (a[i].indexOf("#") != 0) {
					d.MM_p[j] = new Image;
					d.MM_p[j++].src = a[i];
				}
		}
	}

	function MM_findObj(n, d) { //v4.01
		var p, i, x;
		if (!d)
			d = document;
		if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
			d = parent.frames[n.substring(p + 1)].document;
			n = n.substring(0, p);
		}
		if (!(x = d[n]) && d.all)
			x = d.all[n];
		for (i = 0; !x && i < d.forms.length; i++)
			x = d.forms[i][n];
		for (i = 0; !x && d.layers && i < d.layers.length; i++)
			x = MM_findObj(n, d.layers[i].document);
		if (!x && d.getElementById)
			x = d.getElementById(n);
		return x;
	}

	function MM_swapImage() { //v3.0
		var i, j = 0, x, a = MM_swapImage.arguments;
		document.MM_sr = new Array;
		for (i = 0; i < (a.length - 2); i += 3)
			if ((x = MM_findObj(a[i])) != null) {
				document.MM_sr[j++] = x;
				if (!x.oSrc)
					x.oSrc = x.src;
				x.src = a[i + 2];
			}
	}

	function saveForm() {
		document.getElementById('customerdetails').style.display = '';
	}

	function addCriFacilityList() {
		document.forms[0].action = "ManualInputCustomer.do?event=edit_cri_fac_list";

		document.forms[0].submit();
	}
	function addCriLimitList() {
		document.forms[0].action = "ManualInputCustomer.do?event=edit_cri_limit_list";

		document.forms[0].submit();
	}

	function getActionFac(ind, value) {

		if (value == "Remove") {
			document.forms[0].action = "ManualInputCustomer.do?event=edit_remove_cri_fac&index="
					+ ind;
			document.forms[0].submit();
		}
	}
	//-->

	function refreshSubType(dropdown) {
		var currVal = "";
		
		for (i = 0; i < dropdown.options.length; i++) {
			if (dropdown.options[i].selected == true) {
				currVal = dropdown.options[i].value;
			}
		}
		 var dep = 'securityType';
	     var url = '/cms/ManualInputCustomer.do?event=refresh_security_type&securityCode='+currVal;
	     
	     sendLoadDropdownReq(dep, url);
	     
	}

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
	 function changeComment() 
		{
				if (document.getElementById("crilicStatus").value == null || document.getElementById("crilicStatus").value == "") 
				{
					document.getElementById('comment').disabled = true;
					document.getElementById('comment').value = "";
				} else 
					{
						document.getElementById('comment').disabled = false;
					}
			
		} 
	function changeLandHolding() 
	{
		if (document.getElementById("categoryOfFarmer").value == null || document.getElementById("categoryOfFarmer").value == "") 
		{
			document.getElementById('landHolding').disabled = true;
			document.getElementById('landHolding').value = "";
		} else 
			{
				document.getElementById('landHolding').disabled = false;
			}
	}
	function changeSubsidy(value) 
	 {
	 		if(value == "No"){
	 			document.all.subsidyFlag[1].checked = true;
	 			document.all.subsidyFlag[0].disabled = true;
	 			document.all.subsidyFlag[1].disabled = true;
	 			document.getElementById('holdingCompnay').disabled = true;
	 			document.getElementById('holdingCompnay').value = "";
	 		} else{
	 			document.all.subsidyFlag[0].disabled = false;
	 			document.all.subsidyFlag[1].disabled = false;
	 		}
	 } 
	
	function changeBrokerType(value) 
	 {
	 		if(value == "Broker"){
	 			document.getElementById('isBrokerTypeShare').disabled = false;
	 			document.getElementById('isBrokerTypeCommodity').disabled = false;
	 			
	 		} else{
	 			document.getElementById('isBrokerTypeShare').disabled = true;
	 			document.getElementById('isBrokerTypeCommodity').disabled = true;
	 			document.getElementById('isBrokerTypeShare').checked = false;
	 			document.getElementById('isBrokerTypeCommodity').checked = false;
	 		}
	 }
	function changeRealEstate(value) 
	 {
	 		if(value == "commericialRealEstate"){
	 			
	 			document.getElementById('commericialRealEstateValue').disabled = false;
	 			document.all.commericialRealEstateResidentialHousing[1].checked = true;
	 			document.all.residentialRealEstate[1].checked = true;
	 			document.all.indirectRealEstate[1].checked = true;
	 			
	 		} else if(value == "commericialRealEstateResidentialHousing"){
	 			
	 			document.getElementById('commericialRealEstateValue').disabled = true;
	 			document.getElementById('commericialRealEstateValue').value = "";
	 			document.all.commericialRealEstate[1].checked = true;
	 			document.all.residentialRealEstate[1].checked = true;
	 			document.all.indirectRealEstate[1].checked = true;
	 			
	 		} else if(value == "residentialRealEstate"){
	 			
	 			document.getElementById('commericialRealEstateValue').disabled = true;
	 			document.getElementById('commericialRealEstateValue').value = "";
	 			document.all.commericialRealEstate[1].checked = true;
	 			document.all.commericialRealEstateResidentialHousing[1].checked = true;
	 			document.all.indirectRealEstate[1].checked = true;
	 			
	 		} else if(value == "indirectRealEstate"){
	 			
	 			document.getElementById('commericialRealEstateValue').disabled = true;
	 			document.getElementById('commericialRealEstateValue').value = "";
	 			document.all.commericialRealEstate[1].checked = true;
	 			document.all.commericialRealEstateResidentialHousing[1].checked = true;
	 			document.all.residentialRealEstate[1].checked = true;
	 			
	 		}
	 }
	
	function enableCal(calElementId){
		document.getElementById(calElementId).style.display = "";
	}
	function disableCal(calElementId){
		document.getElementById(calElementId).style.display = "none";
	}
</script>

<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
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
<!-- InstanceEndEditable -->
<html>

<bean:define id="formObj" name="ManualInputCustomerInfoForm"
	scope="request"
	type="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm" />

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<%-- <jsp:include page="cri_hidden_details.jsp"></jsp:include> --%>
	<jsp:include page="non_cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="udf_hidden_details.jsp"></jsp:include>
	<tr background="red">
		<td width="100%" colspan="4">
			<h3>CRI Details</h3>
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
										<td width="30%"><bean:write
												name="ManualInputCustomerInfoForm"
												property="customerNameShort"></bean:write> &nbsp;</td>
										<td class="fieldname" width="20%">Constitution</td>
										<td width="30%"><integro:common-code
												categoryCode="<%=CategoryCodeConstant.ENTITY%>"
												entryCode="<%=formObj.getEntity()%>" descWithCode="false"
												display="true" />&nbsp;</td>
									</tr>
									<tr class="even">
										<td class="fieldname" width="20%">PAN</td>
										<td width="30%"><bean:write
												name="ManualInputCustomerInfoForm" property="pan"></bean:write>&nbsp;</td>
										<td class="fieldname" width="20%">Customer RAM Id</td>
										<td width="30%"><html:text property="customerRamID"
												maxlength="20" value="<%=formObj.getCustomerRamID()%>">
											</html:text> <html:errors property="customerRamID" /></td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Customer APR Code</td>
										<td width="30%"><html:text property="customerAprCode"
												maxlength="10" value="<%=formObj.getCustomerAprCode()%>"></html:text>
											<html:errors property="customerAprCode" /></td>
										<td class="fieldname" width="20%">Customer External
											Rating</td>
										<td width="30%"><html:textarea
												property="customerExtRating" styleId="customerExtRating"
												rows="5" cols="50"></html:textarea> <html:errors
												property="customerExtRatingLengthError" /> <html:errors
												property="customerExtRating" /></td>
									</tr>
									<tr class="odd">
										<td class="fieldname" width="20%">Customer FY Closure<font color="red">*</font></td>
										<td><html:select property="customerFyClouser" value ="<%=yearEndPeriodValue%>"  style="width:225">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.CUSTOMER_FY_CLOSUER%>"
									descWithCode="false" />
									
								</html:select><html:hidden property="customerFyClouser"/><html:errors property="customerFyClouserError"/></td>
								     <td></td>
									</tr>
									<tr class="even">
										<td class="fieldname">NBFC</td>
										<td><html:radio property="isNbfs" styleId="isNbfs"
												value="Yes" onclick="showHideNbfs();" /> Yes <html:radio
												property="isNbfs" styleId="isNbfs" value="No"
												onclick="showHideNbfs();" /> No &nbsp; <html:errors
												property="isNbfs" />
										<td class="fieldname">
											<p>a)</p>
											<p>b)</p>
										</td>
										<td>
											<p>
												<html:select property="nbfsA" styleId="nbfsA"
													style="width:225">
													<integro:common-code
														categoryCode="<%=CategoryCodeConstant.CommonCode_NBFC_A%>"
														descWithCode="false" />
												</html:select>
												<html:errors property="nbfsA" />
											</p>
											<p>
												<html:select property="nbfsB" styleId="nbfsB"
													style="width:225">
													<integro:common-code
														categoryCode="<%=CategoryCodeConstant.CommonCode_NBFC_B%>"
														descWithCode="false" />
												</html:select>
												<html:errors property="nbfsB" />
											</p>
										</td>
									</tr>
									<tr class="odd">
										<td class="fieldname">Group Exposure</td>
										<td><logic:present name="partyGroupList">
												<logic:iterate id="ob" name="partyGroupList"
													type="com.integrosys.cms.app.partygroup.bus.OBPartyGroup"
													scope="page">
													<%
														if (formObj.getPartyGroupName() != null
																		&& formObj.getPartyGroupName().equals(
																				String.valueOf(ob.getId()))) {
													%>
													<html:text property="groupExposer"
														value="<%=String.valueOf(ob.getGroupExpLimit()
									.getAmountAsBigDecimal())%>"
														readonly="true"></html:text>
													<%
														}
													%>
												</logic:iterate>
											</logic:present> <!--<html:text property="groupExposer" size="30" maxlength="23" ></html:text>
								
								--></td>

								<td class="fieldname">MSME Classification</td>
								<td><html:select property="msmeClassification" style="width:225">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_MSME_CLASSIC%>"
									descWithCode="false" />
								</html:select><html:errors property="msmeClassification"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname">
								<p>Weaker Section</p>
								</td>
								<td>
								<p><html:radio property="isWeakerSection" styleId="isWeakerSection" value="Yes"  onclick="showHideWeakerSection();"/> Yes
								<p><html:radio property="isWeakerSection" styleId="isWeakerSection" value="No"  onclick="showHideWeakerSection();"/> No &nbsp;
								<html:errors property="isWeakerSection"/>
								</td>
								<td class="fieldname">Type</td>
								<td>
								<p><html:select property="weakerSection" styleId="weakerSection" style="width:225">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_WEAKER_SEC%>" descWithCode="false" />
								</html:select><html:errors property="weakerSection"/></p>

								<p><html:text property="govtSchemeType" styleId="govtSchemeType"  /></p>
								<html:errors property="govtSchemeType"/>

								</td>
							</tr>
							
							<tr class="odd">
								<td class="fieldname">Minority Community</td>
								<td>
								<p><html:radio property="isMinorityCommunity" value="Yes" onclick="showHideMinorityCommunity()"/> Yes 
								<html:radio property="isMinorityCommunity" value="No" onclick="showHideMinorityCommunity()" /> No  &nbsp;
								<html:errors property="isMinorityCommunity"/>
								<p><html:select property="minorityCommunity" styleId="minorityCommunity">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_MINORITY_COMMU%>"
									descWithCode="false" />
								</html:select><html:errors property="minorityCommunity"/></p>
								</td>
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr class="even">
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
								<td class="fieldname">Commodities Exposure</td>
								<td><html:radio property="isCommoditiesExposer" styleId="isCommoditiesExposer" value="Yes" onclick="showHideCommoditiesExposer()"/> Yes 
								<html:radio property="isCommoditiesExposer" styleId="isCommoditiesExposer" value="No" onclick="showHideCommoditiesExposer()" /> No  &nbsp;
								<html:errors property="isCommoditiesExposer"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Sensitive</td>
								<td><html:radio property="isSensitive" value="Yes" onclick="showHideSensitive()" /> Yes 
								<html:radio property="isSensitive" value="No" onclick="showHideSensitive()" /> No  &nbsp;
								<html:errors property="isSensitive"/>
								</td>
								<td class="fieldname">Commodity Name</td>
								<td><html:select property="commoditiesName" styleId="commoditiesName" style="width:225">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_COMMODITY_NAMES%>"
									descWithCode="false" />
								</html:select><html:errors property="commoditiesName"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname">Gross Investment (In plant and
								machinery) (INR)</td>
								<td>
								Rs.<html:text property="grossInvsInPM" maxlength="23" styleId="grossInvsInPM" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp; millions<html:errors property="msmeGrossInvsInPM"/>
								<html:errors property="grossInvsInPM"/></td>
								<td class="fieldname">Gross Investment (In equipment) (INR) </td>
								<td>Rs.<html:text property="grossInvsInEquip" maxlength="23"  styleId="grossInvsInEquip" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp; millions
								<html:errors property="grossInvsInEquip"/>
								<html:errors property="msmeGrossInvsInEquip"/>
								</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">PSU</td>
								<td>
								<p>
								<html:radio property="psu" value="State" onclick="showHidePsu();"/> State 
								<html:radio property="psu" value="Central" onclick="showHidePsu();"/> Central 
								<html:radio property="psu" value="No" onclick="showHidePsu();"/> No <html:errors property="psu"/>
								</p>
								</td>
								<td class="fieldname">Percentage of Shareholding</td>
								<td>
								<p><html:text property="psuPercentage" styleId="psuPercentage" maxlength="5"/><html:errors property="psuPercentage"/></p>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Govt. Undertaking</td>
								<td><html:radio property="govtUnderTaking" value="State" /> State 
								<html:radio property="govtUnderTaking" value="Central" /> Central 
								<html:radio property="govtUnderTaking" value="No" /> No 
								<html:errors property="govtUnderTaking"/>
								</td>
								<td class="fieldname">Banking Method</td>
								<td><bean:write name="ManualInputCustomerInfoForm"
									property="bankingMethod"></bean:write>&nbsp;</td>
							</tr>
							
							<tr class="odd">
								<td class="fieldname">SEMS Guidelines Applicable</td>
								<td><html:radio property="isSemsGuideApplicable" value="Yes" /> Yes 
								<html:radio property="isSemsGuideApplicable" value="No" /> No 
								<html:errors property="isSemsGuideApplicable"/>
								</td>
								<td class="fieldname">Whether fails under IFC&rsquo;s
								Exclusion List</td>
								<td><html:radio property="isFailIfcExcluList" value="Yes" /> Yes 
								<html:radio property="isFailIfcExcluList" value="No" /> No 
								<html:errors property="isFailIfcExcluList"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">TUFS</td>
								<td>
								<html:radio property="isTufs" value="Yes" onclick="changeSubsidy('Yes');"/> Yes 
								<html:radio property="isTufs" value="No" onclick="changeSubsidy('No');"/> No 
								<html:errors property="isTufs"/>
								</td>
								<td class="fieldname">RBI Defaulter&rsquo;s list / Caution
								List</td>
								<td>
								<p><html:radio property="isRbiDefaulter" styleId="isRbiDefaulter" value="Yes" onclick="showHideRbiDefaulter();" /> Yes 
								<html:radio property="isRbiDefaulter" styleId="isRbiDefaulter" value="No" onclick="showHideRbiDefaulter();" /> No 
								<html:errors property="isRbiDefaulter"/>
								<p>
								<html:radio property="rbiDefaulter" styleId="rbiDefaulter" value="Company" /> Company 
								<html:radio property="rbiDefaulter" styleId="rbiDefaulter" value="Directors" /> Directors 
								<html:radio property="rbiDefaulter" styleId="rbiDefaulter" value="Group Companies" /> Group Companies 
								<html:errors property="rbiDefaulter"/>
								</p>
								</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Litigations Pending / contemplated by
								Banks / Financiers</td>
								<td>
								<html:radio property="isLitigation" styleId="isLitigation" value="Yes" onclick="showHideLitigation();"/> Yes 
								<html:radio property="isLitigation" styleId="isLitigation" value="No" onclick="showHideLitigation();"/> No 
								<html:errors property="isLitigation"/>
								<html:text property="litigationBy" styleId="litigationBy" maxlength="100"/><html:errors property="litigationBy"/>
								</td>
								<td class="fieldname">Interest of Directors / Senior
								officers / (Credit approvers) of the bank</td>
								<td>
								<html:radio property="isInterestOfBank" styleId="isInterestOfBank" value="Yes" onclick="showHideInterestOfBank();"/> Yes 
								<html:radio property="isInterestOfBank" styleId="isInterestOfBank" value="No" onclick="showHideInterestOfBank();"/> No 
								<html:errors property="isInterestOfBank"/>
								<html:text property="interestOfBank" styleId="interestOfBank"/><html:errors property="interestOfBank" />
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Adverse Remark (if Any)</td>
								<td>
								<html:radio property="isAdverseRemark" styleId="isAdverseRemark" value="Yes" onclick="showHideAdverseRemark(1);" /> Yes 
								<html:radio property="isAdverseRemark" styleId="isAdverseRemark" value="No" onclick="showHideAdverseRemark(2);" /> No 
								<html:errors property="isAdverseRemark"/>
								<html:text property="adverseRemark" styleId="adverseRemark" />
								<html:errors property="adverseRemark" /></td>
								<td class="fieldname">Audit
								<%if(value.getAdverseRemark()!= null && value.getAdverseRemark().equals("Yes")){%>
								<font id="astrick" color="red">*</font>
								<%}else{%>
								<font id="astrick" color="red" style="display: none;">*</font>
								<%} %>
								
								</td>
								<td>
								<html:radio property="auditType" value="Internal Audit" /> Internal Audit 
								<html:radio property="auditType" value="External Audit" /> External Audit
								<html:radio property="auditType" value="RBI Audit" /> RBI Audit
								<html:errors property="auditType"/>
								  </td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Average Annual turnover (In Million INR)</td>
								<td><html:text property="avgAnnualTurnover" maxlength="23" styleId="avgAnnualTurnover" onblur="javascript:formatAmountAsCommaSeparated(this)"/><html:errors property="avgAnnualTurnover"/></td>
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
								<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.HDFC_INDUSTRY%>"
												entryCode="<%=value.getIndustryName()%>"
												descWithCode="false"  display="true" />	</td>
								<td class="fieldname">Industry Exposure % </td>
								<td><html:text property="industryExposer" maxlength="7"/><html:errors property="industryExposer"/></td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Is the borrower a director (including
								the chairman/ Managing Director) of other banks</td>
								<td><html:radio property="isDirecOtherBank" styleId="isDirecOtherBank" value="Yes" onclick="showHideDirecOtherBank();" /> Yes 
								<html:radio property="isDirecOtherBank" styleId="isDirecOtherBank" value="No" onclick="showHideDirecOtherBank();" /> No 
								<html:errors property="isDirecOtherBank"/>
								<html:text property="direcOtherBank" styleId="direcOtherBank"/><html:errors property="direcOtherBank"/></td>
								<td class="fieldname">Is the partner / guarantor of the
								borrowing firm a director of other banks</td>
								<td>
								<html:radio property="isPartnerOtherBank" styleId="isPartnerOtherBank" value="Yes" onclick="showHidePartnerOtherBank();" /> Yes 
								<html:radio property="isPartnerOtherBank" styleId="isPartnerOtherBank" value="No" onclick="showHidePartnerOtherBank();" /> No 
								<html:errors property="isPartnerOtherBank"/>
								<html:text property="partnerOtherBank" styleId="partnerOtherBank" /><html:errors property="partnerOtherBank"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Is the &ldquo;substantial&rdquo;
								shareholder / director / guarantor of the borrowing company a
								director of other banks</td>
								<td>
								<html:radio property="isSubstantialOtherBank" styleId="isSubstantialOtherBank" value="Yes" onclick="showHideSubstantialOtherBank();" /> Yes 
								<html:radio property="isSubstantialOtherBank" styleId="isSubstantialOtherBank" value="No" onclick="showHideSubstantialOtherBank();" /> No 
								<html:errors property="isSubstantialOtherBank"/>
								<html:text property="substantialOtherBank" styleId="substantialOtherBank" /><html:errors property="substantialOtherBank"/>
								</td>
								<td class="fieldname">Is the borrower a relative of HDFC
								Bank&rsquo;s Chairman / Managing directors or other directors</td>
								<td>
								<html:radio property="isHdfcDirecRltv" styleId="isHdfcDirecRltv" value="Yes" onclick="showHideHdfcDirecRltv();" /> Yes 
								<html:radio property="isHdfcDirecRltv" styleId="isHdfcDirecRltv" value="No" onclick="showHideHdfcDirecRltv();" /> No 
								<html:errors property="isHdfcDirecRltv"/>
								<html:text property="hdfcDirecRltv" styleId="hdfcDirecRltv" /><html:errors property="hdfcDirecRltv"/>
								</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Is the borrower a relative of the
								Chairman / Managing Directors / or other directors of other
								banks</td>
								<td>
								<html:radio property="isObkDirecRltv" styleId="isObkDirecRltv" value="Yes" onclick="showHideObkDirecRltv();" /> Yes 
								<html:radio property="isObkDirecRltv" styleId="isObkDirecRltv" value="No" onclick="showHideObkDirecRltv();" /> No 
								<html:errors property="isObkDirecRltv"/>
								<html:text property="obkDirecRltv" styleId="obkDirecRltv" /><html:errors property="obkDirecRltv"/>
								</td>
								<td class="fieldname">Is the partner/ guarantor / of the
								borrowing firm a relative of the Chairman / Managing Director or
								other directors of HDFC Bank or other Banks</td>
								<td>
								<html:radio property="isPartnerDirecRltv" styleId="isPartnerDirecRltv" value="Yes" onclick="showHidePartnerDirecRltv();"/> Yes 
								<html:radio property="isPartnerDirecRltv" styleId="isPartnerDirecRltv" value="No" onclick="showHidePartnerDirecRltv();"/> No 
								<html:errors property="isPartnerDirecRltv"/>
								<html:text property="partnerDirecRltv" styleId="partnerDirecRltv" /><html:errors property="partnerDirecRltv"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Is the &ldquo;substantial&rdquo;
								shareholder / director / guarantor of the borrowing company a
								relative of the Chairman / Managing directors or other directors
								of HDFC Bank or other Banks</td>
								<td>
								<html:radio property="isSubstantialRltvHdfcOther" styleId="isSubstantialRltvHdfcOther" value="Yes" onclick="showHideSubstantialRltvHdfcOther();" /> Yes 
								<html:radio property="isSubstantialRltvHdfcOther" styleId="isSubstantialRltvHdfcOther" value="No" onclick="showHideSubstantialRltvHdfcOther();" /> No 
								<html:errors property="isSubstantialRltvHdfcOther"/>
								<html:text property="substantialRltvHdfcOther" styleId="substantialRltvHdfcOther" /><html:errors property="substantialRltvHdfcOther"/>
								</td>
								<td class="fieldname">&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
							<tr class="odd">
								<td class="fieldname">Infrastructure Finance</td>
								<td>
								<html:radio property="isInfrastructureFinanace" styleId="isInfrastructureFinanace" value="Yes" onclick="showHideInfrastructureFinanace();showHideButtion();" /> Yes 
								<html:radio property="isInfrastructureFinanace" styleId="isInfrastructureFinanace" value="No" onclick="showHideInfrastructureFinanace();showHideButtion();" /> No 
								<html:errors property="isInfrastructureFinanace" />
								</td>
								<td class="fieldname">
								<p>Type</p>
								</td>
								<td><html:select property="infrastructureFinanaceType" styleId="infrastructureFinanaceType" style="width:350">
									<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_INFRA_FINANACE_TYPE%>"
									descWithCode="false" />
								</html:select><html:errors property="infrastructureFinanaceType"/></td>
							</tr>
							<tr class="even">
								<td class="fieldname">Project Finance</td>
								<td>
								<html:radio property="isProjectFinance" styleId="isProjectFinance" value="Yes" onclick="showHideButtion();" /> Yes 
								<html:radio property="isProjectFinance" styleId="isProjectFinance" value="No" onclick="showHideButtion();" /> No 
								<html:errors property="isProjectFinance"/>
								</td>
								<td class="fieldname">Kisan Credit Card(KCC)</td>
								<td>
								<html:radio property="isKisanCreditCard" styleId="isKisanCreditCard" value="Yes" onclick="showHideButtion();" /> Yes 
								<html:radio property="isKisanCreditCard" styleId="isKisanCreditCard" value="No" onclick="showHideButtion();" /> No 
								<html:errors property="isKisanCreditCard"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Permanent SSI Cert</td>
								<td>
								<html:radio property="isPermenentSsiCert" styleId="isPermenentSsiCert" value="Yes" onclick="showHideButtion();" /> Yes 
								<html:radio property="isPermenentSsiCert" styleId="isPermenentSsiCert" value="No" onclick="showHideButtion();" /> No 
								<html:errors property="isPermenentSsiCert"/>
								</td>
								<td class="fieldname">Backed by Govt. </td>
								<td>
								<html:radio property="isBackedByGovt" styleId="isBackedByGovt" value="State"  onclick="showHideButtion();" /> State 
								<html:radio property="isBackedByGovt" styleId="isBackedByGovt" value="Central" onclick="showHideButtion();" /> Central 
								<html:radio property="isBackedByGovt" styleId="isBackedByGovt" value="No" onclick="showHideButtion();" /> No 
								<html:errors property="isBackedByGovt"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Priority/Non priority Sector</td>
								<td>
								<html:radio property="isPrioritySector" styleId="isPrioritySector" value="Yes"  onclick="showHideButtion();" /> Yes 
								<html:radio property="isPrioritySector" styleId="isPrioritySector" value="No"  onclick="showHideButtion();" /> No 
								<html:errors property="isPrioritySector"/>
								</td>
								<td class="fieldname">Capital Market Exposure</td>
								<td>
								<html:radio property="isCapitalMarketExpos" styleId="isCapitalMarketExpos" value="Yes"  onclick="showHideButtion();" /> Yes 
								<html:radio property="isCapitalMarketExpos" styleId="isCapitalMarketExpos" value="No"  onclick="showHideButtion();" /> No 
								<html:errors property="isCapitalMarketExpos"/>
								</td>
							</tr>
							<tr class="even">
								<td class="fieldname">Real Estate Exposure</td>
								<td>
								<html:radio property="isRealEstateExpos" styleId="isRealEstateExpos" value="Yes"  onclick="showHideButtion();" /> Yes 
								<html:radio property="isRealEstateExpos" styleId="isRealEstateExpos" value="No"  onclick="showHideButtion();" /> No 
								<html:errors property="isRealEstateExpos"/>
								</td>
								<td class="fieldname">&nbsp; </td>
								<td>&nbsp;	</td>
							</tr>
							<tr class="even">
							<td class="fieldname">1st Year </td>
							<td>
						
							
								<html:select name="ManualInputCustomerInfoForm"
											property="firstYear" style="width:250px">
											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.CRI_TENURE_YEAR%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
								<br></br><html:errors property="firstYear"/>
							</td>
							<td class="fieldname">1st year Turnover  </td>
							<td>
							<html:text property="firstYearTurnover" styleId="firstYearTurnover" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp;
							
							
						 <% if(formObj.getFirstYearTurnoverCurr()==null || formObj.getFirstYearTurnoverCurr().trim().equals("")){%>
                  		<html:select property="firstYearTurnoverCurr" value="INR" >
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                  <%}else{ 
                 
                  %>
                  		<html:select property="firstYearTurnoverCurr" value="<%=formObj.getFirstYearTurnoverCurr().trim()%>" >
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                  <%} %>
						
                   <br></br> <html:errors property="firstYearTurnover"/>
							</td>
							</tr>
							<tr class="odd">
							
							<td class="fieldname">2nd Year  </td>
							<td>
							
							
								<html:select name="ManualInputCustomerInfoForm"
											property="secondYear" style="width:250px">
											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.CRI_TENURE_YEAR%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
							
						<br></br>	<html:errors property="secondYear"/>
							</td>
							<td class="fieldname">2nd year Turnover  </td>
							<td>
							<html:text property="secondYearTurnover" styleId="secondYearTurnover" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp; 
						
						
						 <% if(formObj.getSecondYearTurnoverCurr()==null || formObj.getSecondYearTurnoverCurr().trim().equals("")){%>
                  		<html:select property="secondYearTurnoverCurr" value="INR" >
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                  <%}else{ 
                 
                  %>
                  		<html:select property="secondYearTurnoverCurr" value="<%=formObj.getSecondYearTurnoverCurr().trim()%>" >
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                  <%} %>
					 <br></br> <html:errors property="secondYearTurnover"/>
                    </td>
							
							</tr>
							
							<tr class="even">
							<td class="fieldname">3rd Year </td>
							<td>
							
							
							<html:select name="ManualInputCustomerInfoForm"
											property="thirdYear" style="width:250px">
											<integro:common-code descWithCode="false"
												categoryCode="<%=CategoryCodeConstant.CRI_TENURE_YEAR%>"
												refEntryCode='<%=request.getParameter("newCollateralMainType") %>' />
										</html:select>
							<br></br>	<html:errors property="thirdYear"/>
							</td>
							<td  class="fieldname">3rd year Turnover</td>
							<td>
							<html:text property="thirdYearTurnover" styleId="thirdYearTurnover" onblur="javascript:formatAmountAsCommaSeparated(this)"/>&nbsp; 
							
							
								 <% if(formObj.getThirdYearTurnoverCurr()==null || formObj.getThirdYearTurnoverCurr().trim().equals("")){%>
                  		<html:select property="thirdYearTurnoverCurr" value="INR" >
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                  <%}else{ 
               
                  %>
                  		<html:select property="thirdYearTurnoverCurr" value="<%=formObj.getThirdYearTurnoverCurr().trim()%>" >
                  		<html:options collection="currencyList" property="value" labelProperty="label"/>
                    </html:select>
                  <%} %>
						 <br></br>  <html:errors property="thirdYearTurnover"/>
							</td>
							</tr>

									<!-- CR for CRI begin -->

									<tr class="odd">
										<td class="fieldname">Entity Type</td>
										<td><html:select property="entityType" style="width:250">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.ENTITY_TYPE%>"
													descWithCode="false" />
											</html:select> <html:errors property="msmeClassification" /></td>

										<td class="fieldname">
											<p>Is it SPV funding?</p>
										</td>
										<td><html:radio property="isSPVFunding"
												styleId="isSPVFunding" value="Yes"
												onclick="showHideWeakerSection();" /> Yes <html:radio
												property="isSPVFunding" styleId="isSPVFunding" value="No"
												onclick="showHideWeakerSection();" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
									</tr>



									<tr class="even">
										<td class="fieldname">
											<p>Indirect Country Risk Exposure?</p>
										</td>
										<td><html:radio property="indirectCountryRiskExposure" styleId="indirectCountryRiskExposure"
											 value="Yes"
											onclick="enableTag('criCountryName','salesPercentage');" /> Yes
											<html:radio property="indirectCountryRiskExposure" styleId="indirectCountryRiskExposure" 
											onclick="disableTag('criCountryName','salesPercentage');"
											 value="No" /> No &nbsp; <html:errors
												property="indirectCountryRiskExposure" /></td>

										<td class="fieldname">
											<p>a)Country Name</p> </br>
											<p>b)% of Sales or Gross Revenue</p>
										</td>
										<td><html:select property="criCountryName" style="width:225"
												styleId="criCountryName" disabled="true"
												value="<%=formObj.getCriCountryName()%>">

												<option value="">Please Select</option>
												<html:options collection="countryList" labelProperty="label"
													property="value" />

											</html:select><html:errors property="criCountryNameError" />  </br> </br> </br> <html:text property="salesPercentage" maxlength="20"
												value="<%=formObj.getSalesPercentage()%>"
												styleId="salesPercentage" disabled="true">
											</html:text> <html:errors property="salesPercentage" /></td>
									</tr>




									<tr class="odd">
										<td class="fieldname">Credit Guarantee Trust for Micro
											and Small Enterprises.(CGTMSE)</td>
										<td><html:radio property="isCGTMSE" styleId="isCGTMSE"
												value="Yes" onclick="showHideWeakerSection();" /> Yes <html:radio
												property="isCGTMSE" styleId="isCGTMSE" value="No"
												onclick="showHideWeakerSection();" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
										<td class="fieldname">
											<p>Is it a Income Producing Real Estate(IPRE) Co.</p>
										</td>
										<td><html:radio property="isIPRE" styleId="isIPRE"
												value="Yes" onclick="showHideWeakerSection();" /> Yes <html:radio
												property="isIPRE" styleId="isIPRE" value="No"
												onclick="showHideWeakerSection();" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
									</tr>



									<tr class="even">
										<td class="fieldname">Financing for Accquisition of
											equity in Overseas Companies</td>
										<td><html:radio property="financeForAccquisition"
												styleId="financeForAccquisition" value="Yes"
												onclick="enableTag('facilityApproved','facilityAmount','securityName','securityType','securityValue');" />
											Yes <html:radio property="financeForAccquisition"
												styleId="financeForAccquisition"
												onclick="disableTag('facilityApproved','facilityAmount','securityName','securityType','securityValue','securityType');"
												value="No" /> No &nbsp; <html:errors
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
												styleId="facilityAmount" disabled="true"
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
												styleId="securityType" disabled="true" value="<%=formObj.getSecurityType()%>">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.COMMON_CODE_SECURITY_TYPE%>"
													descWithCode="false" />
											</html:select> </br> </br> </br> <html:text property="securityValue" maxlength="20"
												styleId="securityValue" disabled="true"
												value="<%=formObj.getSecurityValue()%>">
												<p>Rs</p>
											</html:text> <html:errors property="securityValue" /></td>


									</tr>

									<tr class="odd">
										<td class="fieldname">Type of Company(Exposure to Indian
											JV Abroad/WOS Abroad/Overseas Step Down Subsidary.)</td>
										<td>
											<html:radio property="companyType"
												styleId="companyType" value="Yes"
												onclick="enableTag('nameOfHoldingCompany','type');" /> Yes <html:radio
												property="companyType"
												styleId="companyType" value="No"
												onclick="disableTag('nameOfHoldingCompany','type');" /> No &nbsp; <html:errors
												property="isWeakerSection" />
										</td>
										<td class="fieldname">
											<p>a)Name of Holding Company</p> </br>
											<p>b)Type</p>
										</td>
										<td><html:textarea property="nameOfHoldingCompany"
												styleId="nameOfHoldingCompany" rows="3" cols="50"
												value="<%=formObj.getNameOfHoldingCompany()%>"
												disabled="true">
											</html:textarea> <html:errors property="nameOfHoldingCompanyLengthError" /></br> </br> </br> <html:select property="type" style="width:225"
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
												onclick="enableTag('comments');" /> Yes <html:radio
												property="ifBreachWithPrescriptions"
												styleId="ifBreachWithPrescriptions" value="No"
												onclick="disableTag('comments');" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
										<td class="fieldname">
											<p>Please Provide details and comments there on</p>
										</td>
										<td><html:textarea property="comments" styleId="comments"
												rows="3" cols="50" value="<%=formObj.getComments()%>">
											</html:textarea>
											<html:errors property="commentsLengthError" />
										</td>
									</tr>

									<tr class="odd">
										<td class="fieldname">Category of Farmer</td>
										<td><html:select property="categoryOfFarmer"
												styleId="categoryOfFarmer"
												style="width:225" 
												onchange="changeLandHolding()">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CATEGORY_OF_FARMER%>"
													descWithCode="false" />
											</html:select></td>
										<td class="fieldname">
											<p>LandHolding(hectares)</p>
										</td>
										<td><html:textarea property="landHolding" rows="3" cols="50" styleId="landHolding"
												value="<%=formObj.getLandHolding()%>"  >
											</html:textarea>
											<html:errors property="landHoldingLengthError" />
										</td>
									</tr>

									<tr class="even">
										<td class="fieldname">Country of guarantor</td>
										<td><html:select property="countryOfGuarantor"
												style="width:225">
												<option value="">Please Select</option>
												<html:options collection="countryList" labelProperty="label"
													property="value" />
											</html:select></td>
										<td class="fieldname">
											<p>Is it a Affordable Housing Finance?</p>
										</td>
										<td><html:radio property="isAffordableHousingFinance"
												styleId="isAffordableHousingFinance" value="Yes"
												onclick="showHideWeakerSection();" /> Yes <html:radio
												property="isAffordableHousingFinance"
												styleId="isAffordableHousingFinance" value="No"
												onclick="showHideWeakerSection();" /> No &nbsp; <html:errors
												property="isWeakerSection" />
										</td>
									</tr>








									<tr class="odd">
										<td class="fieldname">Exposure is in the restricted list
											of financing</td>

										<td><html:radio property="isInRestrictedList" value="Yes"
												styleId="isInRestrictedList"
												onclick="enableTag('restrictedFinancing');" /> Yes <html:radio
												property="isInRestrictedList" styleId="isInRestrictedList"
												value="No" onclick="disableTag('restrictedFinancing');" />
											No &nbsp; <html:errors property="isWeakerSection" /> <html:select
												property="restrictedFinancing" styleId="restrictedFinancing"
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
												onclick="enableTag('restrictedListIndustries');" /> Yes <html:radio
												property="restrictedIndustries"
												styleId="restrictedIndustries" value="No"
												onclick="disableTag('restrictedListIndustries');" /> No &nbsp; <html:errors
												property="isWeakerSection" /> <html:select
												property="restrictedListIndustries" styleId="restrictedListIndustries" style="width:225" value="<%=formObj.getRestrictedListIndustries()%>">
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
												onclick="enableTag('stateImplications');" /> Yes <html:radio
												property="isQualifyingNotesPresent"
												styleId="isQualifyingNotesPresent" value="No"
												onclick="disableTag('stateImplications');" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>


										<td class="fieldname">
											<p>Please provide details and state implications on
												financials,liquidity,reputation and credit risk of the
												borrower</p>
										</td>
										<td><html:textarea property="stateImplications"
												styleId="stateImplications"  rows="3" cols="50">
											</html:textarea>
										
										<html:errors property="stateImplicationsLengthError" />
										</td>

									</tr>

									<tr class="odd">
										<td class="fieldname">Borrower appears in the Reject
											Database of Credit</td>
										<td><html:radio property="isBorrowerInRejectDatabase"
												styleId="isBorrowerInRejectDatabase" value="Yes"
												onclick="enableTag('rejectHistoryReason')" /> Yes <html:radio
												property="isBorrowerInRejectDatabase"
												styleId="isBorrowerInRejectDatabase" value="No"
												onclick="disableTag('rejectHistoryReason')" /> No &nbsp; <html:errors
												property="isWeakerSection" /></td>
										<td class="fieldname">
											<p>Provide reason for reject history</p>
										</td>
										<td><html:textarea property="rejectHistoryReason"
												styleId="rejectHistoryReason" rows="3" cols="50"
												value="<%=formObj.getRejectHistoryReason()%>">
											</html:textarea>
										 <html:errors property="rejectHistoryReasonLengthError" />
										 </td>

									</tr>


									<tr class="even">
										<td class="fieldname">Category for Capital & Commodity
											Exchange Business</td>
										<td><html:radio property="capitalForCommodityAndExchange"
												styleId="capitalForCommodityAndExchange" value="Broker"
												onclick="changeBrokerType('Broker');" /> Broker <html:radio
												property="capitalForCommodityAndExchange"
												styleId="capitalForCommodityAndExchange" value="Non Broker"
												onclick="changeBrokerType('Non Broker');" /> Non Broker &nbsp; </br> 
												
												
												<html:checkbox property="isBrokerTypeShare" styleId="isBrokerTypeShare" value="Y"/>
												Share Broker
												&nbsp;
												
												<html:checkbox property="isBrokerTypeCommodity" styleId="isBrokerTypeCommodity" value="Y"/>
												Commodity Broker
												
												
										</td>
										<td class="fieldname">
										</td>
										<td></td>
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
												onclick="showHideWeakerSection();" /> Yes <html:radio
												property="objectFinance" styleId="objectFinance" value="No"
												onclick="showHideWeakerSection();" /> No &nbsp;</td>
										<td class="fieldname">
											<p>Is it a Commodities Finance Customer?</p></td>
											</td>
										<td><html:radio property="isCommodityFinanceCustomer"
												styleId="isCommodityFinanceCustomer" value="Yes"
												onclick="showHideWeakerSection();" /> Yes <html:radio
												property="isCommodityFinanceCustomer"
												styleId="isCommodityFinanceCustomer" value="No"
												onclick="showHideWeakerSection();" /> No</td>
									</tr>




									<tr class="even">
										<td class="fieldname">Restructured Borrower/Facility</td>
										<td><html:radio property="restructuedBorrowerOrFacility"
												styleId="restructuedBorrowerOrFacility" value="Yes"
												onclick="enableTag('facility','limitAmount');" /> Yes <html:radio
												property="restructuedBorrowerOrFacility"
												styleId="restructuedBorrowerOrFacility" value="No"
												onclick="disableTag('facility','limitAmount');" /> No</td>

										<td class="fieldname">

											<p>a)Facility</p> </br>
											<p>b)Limit Amount</p>

										</td>
										<td><html:select disabled="true" property="facility" styleId="facility"
												style="width:225">

												<option value="">Please Select</option>
												<html:options collection="facNameList" labelProperty="label" 
													property="value" />
											</html:select> </br> </br> </br> <html:text disabled="true" property="limitAmount" styleId="limitAmount"
												maxlength="20" >
											</html:text><html:errors property="limitAmount" /></td>


									</tr>



									<tr class="odd">
										<td class="fieldname">Conduct of Account with Other Banks</td>
										<td><html:radio property="conductOfAccountWithOtherBanks"
												styleId="conductOfAccountWithOtherBanks"
												value="Satisfactory"
												onclick="disableTag('crilicStatus','comment');" />
											Satisfactory <html:radio
												property="conductOfAccountWithOtherBanks"
												styleId="conductOfAccountWithOtherBanks" value="classified"
												onclick="enableTag('crilicStatus');" />
											Classified</td>

										<td class="fieldname">

											<p>Crilc Status</p> </br>
											<p>Comment</p>

										</td>
										<td><html:select property="crilicStatus"
												styleId="crilicStatus" style="width:225" onchange="changeComment();">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CRILIC_STATUS%>"
													descWithCode="false" />
											</html:select> </br> </br> </br> <html:textarea property="comment" rows="3" cols="50"
												styleId="comment" value="<%=formObj.getComment()%>">
											</html:textarea>
											<html:errors property="commentLengthError" />
											</td>


									</tr>

									<tr class="even">
										<td class="fieldname">Subsidy Flag</td>
										<td><html:radio property="subsidyFlag"
												styleId="subsidyFlag" value="Yes" 
												onclick="enableTag('holdingCompnay');"/> Yes <html:radio
												property="subsidyFlag" styleId="subsidyFlag" value="No" 
												onclick="disableTag('holdingCompnay');"/>
											No</td>

										<td class="fieldname">Please mention the name of the
											holding company</td>
										<td><html:textarea property="holdingCompnay"
												styleId="holdingCompnay" rows="3" cols="50"
												value="<%=formObj.getHoldingCompnay()%>">
											</html:textarea>
											<html:errors property="holdingCompanyLengthError" />
										</td>
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
												onclick="enableTag('Image998','company','directors','groupCompanies');enableCal('Image724')" />
											Yes <html:radio property="cautionList" styleId="cautionList"
												value="No"
												onclick="disableTag('Image998','company','directors','groupCompanies');disableCal('Image724')" />
											No </br> </br> </br> <html:text property="dateOfCautionList" maxlength="20"
												styleId="Image998" readonly="true">
											</html:text> <img src="img/calendara.gif" name="Image724" border="0" style="display:none"
											id="Image724"
											onclick="return showCalendar('dateOfCautionList', 'dd/mm/y');"
											onmouseover="MM_swapImage('Image998','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" />
											<html:errors property="dateOfCautionListError" />
											</br> </br> </br> <html:text
												property="company" styleId="company" maxlength="100" style="width:250"
												value="<%=formObj.getCompany()%>">
											</html:text> </br> </br> </br> <html:text property="directors" styleId="directors" style="width:250"
												maxlength="100" value="<%=formObj.getDirectors()%>">
											</html:text> </br> </br> </br> <html:text property="groupCompanies"
												styleId="groupCompanies" maxlength="100" style="width:250"
												value="<%=formObj.getGroupCompanies()%>">
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
												onclick="enableTag('Image999','rbiCompany','rbiDirectors','rbiGroupCompanies');enableCal('Image725');" />
											Yes <html:radio property="defaultersList"
												styleId="defaultersList" value="No"
												onclick="disableTag('Image999','rbiCompany','rbiDirectors','rbiGroupCompanies');disableCal('Image725')" />
											No </br> </br> </br> <html:text property="rbiDateOfCautionList"
												maxlength="20" readonly="true" styleId="Image999">
											</html:text> <img src="img/calendara.gif" name="Image725" border="0" style="display:none"
											id="Image725"
											onclick="return showCalendar('rbiDateOfCautionList', 'dd/mm/y');"
											onmouseover="MM_swapImage('Image999','','img/calendarb.gif',1)"
											onmouseout="MM_swapImgRestore()" /> <html:errors
												property="aaApprovalDate" /> 
												<html:errors property="rbiDateOfCautionListError" /> </br> </br> </br> <html:text
												property="rbiCompany" styleId="rbiCompany" maxlength="100" style="width:250"
												value="<%=formObj.getRbiCompany()%>">
											</html:text> </br> </br> </br> <html:text property="rbiDirectors" styleId="rbiDirectors" style="width:250"
												maxlength="100" value="<%=formObj.getRbiDirectors()%>">
											</html:text> </br> </br> </br> <html:text property="rbiGroupCompanies" style="width:250"
												styleId="rbiGroupCompanies" maxlength="100"
												value="<%=formObj.getRbiGroupCompanies()%>">
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
												onclick="changeRealEstate('commericialRealEstate');" /> Yes <html:radio
												property="commericialRealEstate"
												styleId="commericialRealEstate" value="No"
												onclick="disableTag('commericialRealEstateValue');" /> No </br>
											<html:select styleId="commericialRealEstateValue"
												property="commericialRealEstateValue" style="width:225">
												<integro:common-code
													categoryCode="<%=CategoryCodeConstant.CommonCode_COMMERCIAL_REAL_ESTATE%>"
													descWithCode="false" />
											</html:select> </br> </br> </br> <html:radio
												property="commericialRealEstateResidentialHousing"
												styleId="commericialRealEstateResidentialHousing"
												value="Yes" onclick="changeRealEstate('commericialRealEstateResidentialHousing');" /> Yes <html:radio
												property="commericialRealEstateResidentialHousing"
												styleId="commericialRealEstateResidentialHousing" value="No"
												onclick="showHideWeakerSection();" /> No </br> </br> </br> <html:radio
												property="residentialRealEstate"
												styleId="residentialRealEstate" value="Yes"
												onclick="changeRealEstate('residentialRealEstate');" /> Yes <html:radio
												property="residentialRealEstate"
												styleId="residentialRealEstate" value="No"
												onclick="showHideWeakerSection();" /> No </br> </br> </br> <html:radio
												property="indirectRealEstate" styleId="indirectRealEstate"
												value="Yes" onclick="changeRealEstate('indirectRealEstate');" /> Yes <html:radio
												property="indirectRealEstate" styleId="indirectRealEstate"
												value="No" onclick="showHideWeakerSection();" /> No</td>


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
												<center><select onchange="getActionFac('<%=no%>' , this.value)">
													<option value="">-Select-</option>
													<option value="Remove">Remove</option>
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

	document.getElementById('nameOfHoldingCompany').disabled = true;
	document.getElementById('type').disabled = true;
</script>


<%
	} else if (formObj.getCompanyType().equals("Yes")) {
%>
<script language="javascript">
	document.all.companyType[0].checked = true;
	document.getElementById('nameOfHoldingCompany').disabled = false;
	document.getElementById('type').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.companyType[1].checked = true;
	document.getElementById('nameOfHoldingCompany').disabled = true;
	document.getElementById('type').disabled = true;
</script>
<%
	}
%>

<%
	if (formObj.getCategoryOfFarmer() == null || formObj.getCategoryOfFarmer().equals("")) {
%>
<script language="javascript">
	document.getElementById('landHolding').disabled = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.getElementById('landHolding').disabled = false;
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
	document.getElementById('commericialRealEstateValue').disabled = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.commericialRealEstate[0].checked = true;
	document.getElementById('commericialRealEstateValue').disabled = false;
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
	document.getElementById('isBrokerTypeShare').disabled = true;
	document.getElementById('isBrokerTypeCommodity').disabled = true;
	document.getElementById('isBrokerTypeShare').checked = false;
	document.getElementById('isBrokerTypeCommodity').checked = false;
</script>
<%
	} else if (formObj.getCapitalForCommodityAndExchange().equals("Broker")) {
%>
<script language="javascript">
	document.all.getCapitalForCommodityAndExchange[0].checked = true;
	document.getElementById('isBrokerTypeShare').disabled = false;
	document.getElementById('isBrokerTypeCommodity').disabled = false;
</script>
<%
	}
%>
<%
	if (formObj.getCapitalForCommodityAndExchange().equals("Broker")) {
%>
<script language="javascript">
	document.getElementById('isBrokerTypeShare').disabled = false;
	document.getElementById('isBrokerTypeCommodity').disabled = false;
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
	document.getElementById('Image725').style.display = "none";
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.defaultersList[0].checked = true;
	document.getElementById('rbiCompany').disabled = false;
	document.getElementById('rbiDirectors').disabled = false;
	document.getElementById('rbiGroupCompanies').disabled = false;
	document.getElementById('Image999').disabled = false;
	document.getElementById('Image725').style.display = "";
</script>

<%
	}
%>



<!-- <script language="javascript"> // commented by Dayananda Laishram for IE 11 compatibility changes || Starts
	//A Shiv 230811 -->
	
	 <%
	if (formObj.getSubsidyFlag() == null || formObj.getSubsidyFlag().equals("") || formObj.getSubsidyFlag().equals("No")) {
%>
<script language="javascript">
	document.all.subsidyFlag[1].checked = true;
	document.getElementById('holdingCompnay').disabled = true;
</script>
<%
	} else if (formObj.getSubsidyFlag().equals("Yes")) {
%>
<script language="javascript">
	document.all.subsidyFlag[0].checked = true;
	document.getElementById('holdingCompnay').disabled = false;
</script>
<%
	}
%> 
	
	
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
	document.getElementById('Image724').style.display = "none";
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.cautionList[0].checked = true;
	document.getElementById('Image998').disabled = false;
	document.getElementById('company').disabled = false;
	document.getElementById('directors').disabled = false;
	document.getElementById('groupCompanies').disabled = false;
	document.getElementById('Image724').style.display = "";
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
	document.getElementById('facility').disabled = true;
	document.getElementById('limitAmount').disabled = true;
</script>
<%
	} else if (formObj.getRestructuedBorrowerOrFacility() == null
			|| formObj.getRestructuedBorrowerOrFacility().equals("")
			|| formObj.getRestructuedBorrowerOrFacility().equals("Yes")) {
%>
<script language="javascript">
	document.all.restructuedBorrowerOrFacility[0].checked = true;
	document.getElementById('facility').disabled = false;
	document.getElementById('limitAmount').disabled = false;
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
	} else if (formObj.getIsCommodityFinanceCustomer() == null
			|| formObj.getIsCommodityFinanceCustomer().equals("")
			|| formObj.getIsCommodityFinanceCustomer().equals("Yes")) {
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
	} else if (formObj.getObjectFinance() == null
			|| formObj.getObjectFinance().equals("")
			|| formObj.getObjectFinance().equals("Yes")) {
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
	document.getElementById('rejectHistoryReason').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsBorrowerInRejectDatabase().equals("Yes")) {
%>
<script language="javascript">
	document.all.isBorrowerInRejectDatabase[0].checked = true;
	document.getElementById('rejectHistoryReason').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isBorrowerInRejectDatabase[1].checked = true;
	document.getElementById('rejectHistoryReason').disabled = true;
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
	document.getElementById('stateImplications').disabled = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.isQualifyingNotesPresent[0].checked = true;
	document.getElementById('stateImplications').disabled = false;
</script>
<%
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
	document.all.isIPRE[0].checked = true;
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
	document.all.indirectCountryRiskExposure[0].checked = true;
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
	document.getElementById('crilicStatus').disabled = true;
	document.getElementById('comment').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getConductOfAccountWithOtherBanks().equals("classified")) {
%>
<script language="javascript">
	document.all.conductOfAccountWithOtherBanks[1].checked = true;
	document.getElementById('crilicStatus').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.conductOfAccountWithOtherBanks[0].checked = true;
	document.getElementById('crilicStatus').disabled = true;
	document.getElementById('comment').disabled = true;
</script>
<%
	}
	}
%>

<%
	if (formObj.getCrilicStatus() == null || formObj.getCrilicStatus().equals("")) {
%>
<script language="javascript">
	document.getElementById('comment').disabled = true;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('comment').disabled = false;
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
	document.getElementById('criCountryName').disabled = true;
	document.getElementById('salesPercentage').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIndirectCountryRiskExposure().equals("Yes")) {
%>
<script language="javascript">
	document.all.indirectCountryRiskExposure[0].checked = true;
	document.getElementById('criCountryName').disabled = false;
	document.getElementById('salesPercentage').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('criCountryName').disabled = true;
	document.getElementById('salesPercentage').disabled = true;
</script>
<%
	}
	}
%>

<%
	if (formObj.getIsNbfs() == null || formObj.getIsNbfs().equals("")) {
%>
<script language="javascript">
	document.all.isNbfs[1].checked = true;
	document.getElementById('nbfsA').disabled = true;
	document.getElementById('nbfsB').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsNbfs().equals("Yes")) {
%>
<script language="javascript">
	document.getElementById('nbfsA').disabled = false;
	document.getElementById('nbfsB').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('nbfsA').disabled = true;
	document.getElementById('nbfsB').disabled = true;
</script>
<%
	}
	}
%>


<%
	if (formObj.getFinanceForAccquisition() == null || formObj.getFinanceForAccquisition().equals("No")
			|| formObj.getFinanceForAccquisition().equals("")) {
%>
<script language="javascript">
	document.all.financeForAccquisition[1].checked = true;

	document.getElementById('facilityApproved').disabled = true;
	document.getElementById('facilityAmount').disabled = true;
	document.getElementById('securityName').disabled = true;
	document.getElementById('securityType').disabled = true;
	document.getElementById('securityValue').disabled = true;
</script>


<%
	} else if (formObj.getFinanceForAccquisition().equals("Yes")) {
%>
<script language="javascript">
	document.all.financeForAccquisition[0].checked = true;
	document.getElementById('facilityApproved').disabled = false;
	document.getElementById('facilityAmount').disabled = false;
	document.getElementById('securityName').disabled = false;
	document.getElementById('securityType').disabled = false;
	document.getElementById('securityValue').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.financeForAccquisition[1].checked = true;
	document.getElementById('facilityApproved').disabled = true;
	document.getElementById('facilityAmount').disabled = true;
	document.getElementById('securityName').disabled = true;
	document.getElementById('securityType').disabled = true;
	document.getElementById('securityValue').disabled = true;
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
	document.getElementById('comments').disabled = true;
</script>
<%
	} else {
%>

<script language="javascript">
	document.all.ifBreachWithPrescriptions[0].checked = true;
	document.getElementById('comments').disabled = false;
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
	document.getElementById('restrictedFinancing').disabled = true;
</script>
<%
	} else if (formObj.getIsInRestrictedList().equals("Yes")) {
%>
<script language="javascript">

	document.all.isInRestrictedList[0].checked = true;
	document.getElementById('restrictedFinancing').disabled = false;
</script>
<%
	}
%>

<%
	if (formObj.getRestrictedIndustries() == null
			|| formObj.getRestrictedIndustries().equals("")) {
%>
<script language="javascript">
	document.all.restrictedIndustries[1].checked = true;
</script>
<%
	}
%>

<%
	if (formObj.getIsAffordableHousingFinance() == null
			|| formObj.getIsAffordableHousingFinance().equals("")) {
%>
<script language="javascript">
	document.all.isAffordableHousingFinance[1].checked = true;
</script>
<%
	}
%>



<%
	if (formObj.getIsWeakerSection() == null
			|| formObj.getIsWeakerSection().equals("")) {
%>
<script language="javascript">
	document.all.isWeakerSection[1].checked = true;
	document.getElementById('weakerSection').disabled = true;
	document.getElementById('govtSchemeType').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsWeakerSection().equals("Yes")) {
%>
<script language="javascript">
	document.getElementById('weakerSection').disabled = false;
	document.getElementById('govtSchemeType').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('weakerSection').disabled = true;
	document.getElementById('govtSchemeType').disabled = true;
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
	if (formObj.getIsTufs() == null || formObj.getIsTufs().equals("")|| formObj.getIsTufs().equals("No")) {
	%>
	<script language="javascript">
		document.all.isTufs[1].checked = true;
		document.all.subsidyFlag[0].disabled = true;
		document.all.subsidyFlag[1].disabled = true;
		//document.getElementById('subsidyFlag')[1].disabled = true;
	</script>
	<%
	}else {
			if (formObj.getIsTufs().equals("Yes")) {
		%>
		<script language="javascript">
			document.all.isTufs[0].checked = true;
			document.all.subsidyFlag[0].disabled = false;
			document.all.subsidyFlag[1].disabled = false;
		</script>
		<%
			} else {
		%>
		<script language="javascript">
			document.all.isTufs[1].checked = true;
			document.all.subsidyFlag[0].disabled = true;
			document.all.subsidyFlag[1].disabled = true;
		</script>
		<%
			}
			}
		%>

<%
	if (formObj.getIsMinorityCommunity() == null
			|| formObj.getIsMinorityCommunity().equals("")) {
%>
<script language="javascript">
	document.all.isMinorityCommunity[1].checked = true;
	document.getElementById('minorityCommunity').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsMinorityCommunity().equals("Yes")) {
%>
<script language="javascript">
	document.getElementById('minorityCommunity').disabled = false;
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
	document.all.isSensitive[0].disabled = true;
	document.all.isSensitive[1].disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsCommoditiesExposer().equals("Yes")) {
%>
<script language="javascript">
	document.all.isSensitive[0].disabled = false;
	document.all.isSensitive[1].disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.all.isSensitive[0].disabled = true;
	document.all.isSensitive[1].disabled = true;
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
	document.getElementById('commoditiesName').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsSensitive().equals("Yes")) {
%>
<script language="javascript">
	document.getElementById('commoditiesName').disabled = false;
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
	document.getElementById('infrastructureFinanaceType').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsInfrastructureFinanace().equals("Yes")) {
%>
<script language="javascript">
	document.getElementById('infrastructureFinanaceType').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('infrastructureFinanaceType').disabled = true;
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
	document.getElementById('litigationBy').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('litigationBy').disabled = true;
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
	document.getElementById('interestOfBank').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsInterestOfBank().equals("Yes")) {
%>
<script language="javascript">
	document.getElementById('interestOfBank').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('interestOfBank').disabled = true;
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
	document.getElementById('adverseRemark').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsAdverseRemark().equals("Yes")) {
%>
<script language="javascript">
	document.getElementById('adverseRemark').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('adverseRemark').disabled = true;
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
	document.getElementById('direcOtherBank').disabled = true;
</script>
<%
	} else {
%>
<%
	if (formObj.getIsDirecOtherBank().equals("Yes")) {
%>
<script language="javascript">
	document.getElementById('direcOtherBank').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('direcOtherBank').disabled = true;
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
	document.getElementById('partnerOtherBank').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('partnerOtherBank').disabled = true;
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
	document.getElementById('substantialOtherBank').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('substantialOtherBank').disabled = true;
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
	document.getElementById('hdfcDirecRltv').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('hdfcDirecRltv').disabled = true;
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
	document.getElementById('obkDirecRltv').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('obkDirecRltv').disabled = true;
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
	document.getElementById('partnerDirecRltv').disabled = false;
</script>
<%
	} else {
%>
<script language="javascript">
	document.getElementById('partnerDirecRltv').disabled = true;
</script>
<%
	}
	}
%>

<%
	if (formObj.getPsu() == null || formObj.getPsu().equals("")) {
%>
<script language="javascript">
	document.all.psu[1].checked = true;
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
	document.all.govtUnderTaking[1].checked = true;
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


<%
	if (formObj.getRestrictedIndustries() == null
			|| formObj.getRestrictedIndustries().equals("")||formObj.getRestrictedIndustries().equals("No")) {
%>
<script language="javascript">
	document.all.restrictedIndustries[1].checked = true;
	document.getElementById('restrictedListIndustries').disabled = true;
</script>
<%
	}else{
%>
<script language="javascript">
	document.all.restrictedIndustries[0].checked = true;
	document.getElementById('restrictedListIndustries').disabled = false;
</script>
<%}%>
<!-- </script> commented  By Dayananda Ends-->

<!-- Uma:Added below for IE11 -->
<html:hidden name="ManualInputCustomerInfoForm" property="cifId"
	styleId="cifId" />
<html:hidden name="ManualInputCustomerInfoForm" property="pan"
	styleId="pan" />
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
<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIds" />
</html>
<!-- InstanceEnd -->


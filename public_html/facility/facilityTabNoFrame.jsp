
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<%@page import="java.util.Map"%>
<%@page import="org.apache.struts.action.ActionMessages"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.integrosys.cms.host.stp.common.IStpConstants" %>

<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function sbmForm(nextTab) {
		enableAll();
		document.forms[0].event.value = "<%=FacilityMainAction.EVENT_NAVIGATE_WO_FRAME%>";
		document.forms[0].nextTab.value = nextTab;
		document.forms[0].submit();
	}
	function save_whole_obj() {
		enableAll();
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_SAVE_WHOLE_OBJ_WO_FRAME%>";
		document.forms[0].submit();
	}
	function submit_whole_obj() {
		enableAll();
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_SUBMIT_WO_FRAME%>";
		document.forms[0].submit();
	}

	function enableAll(){
		var el = document.forms[0].elements;
		for(var i=0;i<el.length;i++){
			el[i].disabled=false;
		}
	}
</script>
</head>
<%
	String event = request.getParameter("event");
	String tabState = (String) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.tabState");

	Map errorMap = (Map) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.errorMap");
	String currentTab = (String) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.currentTab");
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	String frame = (String) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.frame");
	System.out.println("frame: "+frame);
	
	String applicationLawType = limitProfile.getApplicationLawType() == null ? ICMSConstant.AA_LAW_TYPE_CONVENTIONAL : limitProfile.getApplicationLawType() ;
    String allowInsurance = (String) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.allowInsurance");
    String islamicStpMsgType = (String) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.islamicStpMsgType");
	String applicationType = limitProfile.getApplicationType();
	
    String styleTabFacilityMaster = "tabNormal";
	String styleTabBNMCodes = "tabNormal";
	String styleTabOfficer = "tabNormal";
	String styleTabRelationship = "tabNormal";
	String styleTabInsurance = "tabNormal";
	String styleTabFacIslamicMaster = "tabNormal";
	String styleTabFacIslamicBBa = "tabNormal";
	String styleTabMultiTierFin = "tabNormal";
	String styleTabFacMessage = "tabNormal";
	String styleTabFacIslamicRental = "tabNormal";
	String styleTabFacSecDeposit = "tabNormal";
	String styleTabFacIncremental = "tabNormal";
	String styleTabFacReduction = "tabNormal";
	
	if (currentTab != null) {
		if (FacilityMainAction.TAB_MASTER.equals(currentTab)
				|| FacilityMainAction.TAB_MASTER_WO_FRAME.equals(currentTab)) {
			styleTabFacilityMaster = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_BNM_CODES_WO_FRAME.equals(currentTab)) {
			styleTabBNMCodes = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_OFFICER.equals(currentTab)
				|| FacilityMainAction.TAB_OFFICER_WO_FRAME.equals(currentTab)) {
			styleTabOfficer = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_RELATIONSHIP.equals(currentTab)
				|| FacilityMainAction.TAB_RELATIONSHIP_WO_FRAME.equals(currentTab)) {
			styleTabRelationship = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_INSURANCE_WO_FRAME.equals(currentTab)) {
			styleTabInsurance = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_ISLAMIC_MASTER_WO_FRAME.equals(currentTab)) {
			styleTabFacIslamicMaster = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_ISLAMIC_BBA_VARI_PACKAGE_WO_FRAME.equals(currentTab)) {
			styleTabFacIslamicBBa = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_MULTI_TIER_FINANCING_WO_FRAME.equals(currentTab)) {
			styleTabMultiTierFin = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_FACILITY_MESSAGE.equals(currentTab)) {
			styleTabFacMessage = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_ISLAMIC_RENTAL_RENEWAL.equals(currentTab)) {
			styleTabFacIslamicRental = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_ISLAMIC_SECURITY_DEPOSIT.equals(currentTab)) {
			styleTabFacSecDeposit = "tabCurrent";	
		}
		else if (FacilityMainAction.TAB_FACILITY_INCREMENTAL.equals(currentTab)) {
			styleTabFacIncremental = "tabCurrent";
		}
		else if (FacilityMainAction.TAB_FACILITY_REDUCTION.equals(currentTab)) {
			styleTabFacReduction = "tabCurrent";
		}			
	}
	if (errorMap != null) {
		if (((ActionMessages) errorMap.get("facilityMaster")) != null) {
			styleTabFacilityMaster = "tabError";
		}
		if (((ActionMessages) errorMap.get("bnmCodes")) != null) {
			styleTabBNMCodes = "tabError";
		}
		if (((ActionMessages) errorMap.get("officer")) != null) {
			styleTabOfficer = "tabError";
		}
		if (((ActionMessages) errorMap.get("relationship")) != null) {
			styleTabRelationship = "tabError";
		}
		if (((ActionMessages) errorMap.get("insurance")) != null) {
			styleTabInsurance = "tabError";
		}
		if (((ActionMessages) errorMap.get("islamicMaster")) != null) {
			styleTabFacIslamicMaster = "tabError";
		}
		if (((ActionMessages) errorMap.get("islamicBbaVariPackage")) != null) {
			styleTabFacIslamicBBa = "tabError";
		}
		if (((ActionMessages) errorMap.get("multiTierFinancing")) != null) {
			styleTabMultiTierFin = "tabError";
		}
		if (((ActionMessages) errorMap.get("islamicRentalRenewal")) != null) {
			styleTabFacIslamicRental  = "tabError";
		}
		if (((ActionMessages) errorMap.get("islamicSecurityDeposit")) != null) {
			styleTabFacSecDeposit = "tabError";
		}		
		if (((ActionMessages) errorMap.get("incremental")) != null) {
			styleTabFacIncremental = "tabError";
		}
		if (((ActionMessages) errorMap.get("reduction")) != null) {
			styleTabFacReduction = "tabError";
		}			
	}
%>
<body>
<table width="100%" height="100%">
	<tr>
		<td width="65%" valign="bottom">
		<table border="0" cellpadding="0px" cellspacing="0px"
			style="overflow: hidden;">
			<tr style="text-align: left">
				<td class="<%=styleTabFacilityMaster %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_MASTER_WO_FRAME %>');"><bean:message
					key="label.facility.master" /></a></td>
				<td class="<%=styleTabBNMCodes %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_BNM_CODES_WO_FRAME %>');"><bean:message
					key="label.facility.bnm.codes" /></a></td>
				<td class="<%=styleTabOfficer %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_OFFICER_WO_FRAME %>');"><bean:message
					key="label.facility.officer" /></a></td>
				<td class="<%=styleTabRelationship %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_RELATIONSHIP_WO_FRAME %>');"><bean:message
					key="label.facility.relationship" /></a></td>
                <% if (StringUtils.equals(allowInsurance, "Y")) {%>
				<td class="<%=styleTabInsurance %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_INSURANCE_WO_FRAME %>');"><bean:message
					key="label.facility.insurance" /></a></td>
                <% } %>
				<% if (applicationLawType.equals(ICMSConstant.AA_LAW_TYPE_ISLAM)) { %>
                    <% if (StringUtils.isNotBlank(islamicStpMsgType) && islamicStpMsgType.equals(IStpConstants.STP_ISLAMIC_LOAN_TYPE_MASTER)) { %>
                    <td class="<%=styleTabFacIslamicMaster %>"><a
                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_MASTER_WO_FRAME %>');"><bean:message
                        key="label.facility.islamic.master.tab" /></a></td>
                    <% } %>
                    <% if (StringUtils.isNotBlank(islamicStpMsgType) && islamicStpMsgType.equals(IStpConstants.STP_ISLAMIC_LOAN_TYPE_BBA)) { %>
                    <td class="<%=styleTabFacIslamicBBa %>"><a
                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_BBA_VARI_PACKAGE_WO_FRAME %>');"><bean:message
                        key="label.facility.islamic.bba.tab" /></a></td>
                        <% if (applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO) ||
                        		applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO_HP)) { %>
	                    <td class="<%=styleTabFacIslamicRental %>"><a
	                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_RENTAL_RENEWAL %>');"><bean:message
	                        key="label.facility.islamic.rental.renewal" /></a></td>
	                    <td class="<%=styleTabFacSecDeposit %>"><a
	                        href="javascript:sbmForm('<%=FacilityMainAction.TAB_ISLAMIC_SECURITY_DEPOSIT %>');"><bean:message
	                        key="label.facility.islamic.security.deposit" /></a></td>        
                        <% } %>                           
                    <% } %>
                <% } %>
                <td class="<%=styleTabMultiTierFin %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_MULTI_TIER_FINANCING_WO_FRAME %>');"><bean:message
					key="label.facility.multitierfin.tab" /></a></td>
			<% if (applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO) ||
					applicationType.equals(ICMSConstant.APPLICATION_TYPE_CO_HP)) { %>
				<%--					
                <td class="<%=styleTabFacMessage %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_FACILITY_MESSAGE %>');"><bean:message
					key="label.facility.message" /></a></td> --%>	
					
                <td class="<%=styleTabFacIncremental %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_FACILITY_INCREMENTAL %>');"><bean:message
					key="label.facility.incremental" /></a></td>
                <td class="<%=styleTabFacReduction %>"><a
					href="javascript:sbmForm('<%=FacilityMainAction.TAB_FACILITY_REDUCTION %>');"><bean:message
					key="label.facility.reduction" /></a></td>							
				<% } %>						
			</tr>
		</table>
		</td>
		<td width="35%">
		<table border="0" width="10%" cellpadding="0" cellspacing="0"
			align="right">
			<tr>
				<td valign="baseline" style="text-align: right"><a href="#"
					onclick="save_whole_obj()" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)"><img
					src="img/save1.gif" name="Image3311" border="0" id="Image331" /></a></td>
				<%
					if (!FacilityMainAction.EVENT_PREPARE_CLOSE.equals(event)
							&& !FacilityMainAction.EVENT_PREPARE_CLOSE.equals(tabState)) {
				%>
				<td valign="baseline" style="text-align: right"><a href="#"
					onclick="submit_whole_obj()" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3312','','img/submit2.gif',1)"><img
					src="img/submit1.gif" name="Image3312" border="0" id="Image332" /></a></td>
				<%
					}
				%>
				<td valign="baseline" style="text-align: right"><a
					href="ToDo.do?event=prepare&isMenu=Y"
					onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3313','','img/cancel2.gif',1)"><img
					src="img/cancel1.gif" name="Image3313" border="0" id="Image333" /></a></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>

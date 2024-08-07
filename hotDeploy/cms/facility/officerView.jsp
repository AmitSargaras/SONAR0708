
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityOfficer"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.officer.OfficerForm"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<%@page import="java.util.List"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>

<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>

</head>
<%
	String[] style = { "even", "odd" };
	int count = 0;

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	IFacilityOfficer facilityOfficerActual = (IFacilityOfficer) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityOfficerActual");
	IFacilityOfficer facilityOfficerObj = (IFacilityOfficer) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityOfficerObj");
	ILimit limit = facilityMasterObj.getLimit();

	OfficerForm form = (OfficerForm) request.getAttribute("FacilityOfficerForm");
	String event = form.getEvent();

	String styleRelationshipCode = "fieldname";
	String styleOfficerType = "fieldname";
	String styleOfficer = "fieldname";

	if (facilityOfficerObj != null && facilityOfficerActual != null) {
		if (!CompareOBUtil.compOB(facilityOfficerActual, facilityOfficerObj, "RelationshipCodeEntryCode")) {
			styleRelationshipCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityOfficerActual, facilityOfficerObj, "OfficerTypeEntryCode")) {
			styleOfficerType = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityOfficerActual, facilityOfficerObj, "OfficerEntryCode")) {
			styleOfficer = "fieldnamediff";
		}
	}
	
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
%>
<body>
<html:form action="FacilityOfficer.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.officer" /></h3>
				</td>
			</tr>
			<tr>
				<td>
				<hr>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.aa.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td width="30%"><%=limitProfile.getBCAReference()%></td>
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.code" /></span><bean:message key="label.mandatory" /></td>
							<td width="30%"><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.sequence.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=limit.getFacilitySequence()%></td>
							<td class="<%=styleRelationshipCode %>"><span class="stp"><bean:message
								key="label.facility.relationship.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td><integro:common-code
								categoryCode="<%=CategoryCodeConstant.OFFICER_RELATIONSHIP%>"
								entryCode="<%=facilityOfficerObj.getRelationshipCodeEntryCode()%>"
								display="true" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message
								key="label.facility.officer.sequence.no" /></td>
                            <td><%if(StringUtils.isNotBlank(form.getSequenceNumber()) && !form.getSequenceNumber().equalsIgnoreCase("null")){%>
                                <integro:empty-if-null
                                value="<%=form.getSequenceNumber()%>" />
                                <%}%>&nbsp;</td>
							<td class="<%=styleOfficerType %>"><span class="stp"><bean:message
								key="label.facility.officer.type" /></span><bean:message
								key="label.mandatory" /></td>
							<td><integro:common-code
								categoryCode="<%=CategoryCodeConstant.OFFICER_TYPE%>"
								entryCode="<%=facilityOfficerObj.getOfficerTypeEntryCode()%>"
								display="true" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleOfficer %>"><span class="stp"><bean:message
								key="label.facility.officer" /></span></td>
							<td><integro:common-code
								categoryCode="<%=CategoryCodeConstant.OFFICER%>"
								entryCode="<%=facilityOfficerObj.getOfficerEntryCode()%>"
								display="true" /></td>
							<td class="fieldname"><span class="stp">&nbsp;</span></td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>
				<table width="150" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td>
						<%
						if(!FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER_PROCESS.equals(form.getEvent())){
							if (FacilityMainAction.TAB_OFFICER_CHECKER.equals(event)
										|| FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(event)
										|| FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER.equals(event)) {
						%> <a href="FacilityOfficer.do?event=officer_checker"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
							}
								else if (FacilityMainAction.EVENT_VIEW_DETAIL_ONLY.equals(event)) {
						%> <a href="FacilityOfficer.do?event=officer_view_no_frame"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
							}
								else if (FacilityMainAction.EVENT_VIEW_DETAIL_ONLY_WITH_FRAME.equals(event)) {
						%> <a href="FacilityOfficer.do?event=officer_view"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
							}
						}else{
						%><a href="FacilityOfficer.do?event=officer_checker_process"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%} %>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
</body>
</html>
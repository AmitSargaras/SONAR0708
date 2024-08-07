
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.officer.OfficerForm"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function create() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_SAVE %>";
		document.forms[0].submit();
	}
	function update() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_UPDATE %>";
		document.forms[0].submit();
	}
	function createNoFrame() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_SAVE_WO_FRAME %>";
		document.forms[0].submit();
	}
	function updateNoFrame() {
		document.forms[0].event.value="<%=FacilityMainAction.EVENT_UPDATE_WO_FRAME %>";
		document.forms[0].submit();
	}
</script>
</head>
<%
	String[] style = { "even", "odd" };
	int count = 0;

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();
	OfficerForm form = (OfficerForm) request.getAttribute("FacilityOfficerForm");
	String event = null;
	if (form != null) {
		event = form.getEvent();
	}

    String officer_Indicator = "";
    if (StringUtils.isNotBlank(form.getRelationshipCodeEntryCode()))
    {
        if (ICMSConstant.OFFICER_RELATIONSHIP_AR.equals(form.getRelationshipCodeEntryCode())) {
            officer_Indicator = ICMSConstant.OFFICER_INDICATOR_A;
        } else if (ICMSConstant.OFFICER_RELATIONSHIP_EV.equals(form.getRelationshipCodeEntryCode())) {
            officer_Indicator = ICMSConstant.OFFICER_INDICATOR_E;
        } else if (ICMSConstant.OFFICER_RELATIONSHIP_MK.equals(form.getRelationshipCodeEntryCode())) {
            officer_Indicator = ICMSConstant.OFFICER_INDICATOR_M;
        } else if (ICMSConstant.OFFICER_RELATIONSHIP_PR.equals(form.getRelationshipCodeEntryCode())) {
            officer_Indicator = ICMSConstant.OFFICER_INDICATOR_P;
        } else if (ICMSConstant.OFFICER_RELATIONSHIP_RE.equals(form.getRelationshipCodeEntryCode())) {
            officer_Indicator = ICMSConstant.OFFICER_INDICATOR_R;
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
				<td width="70%">
				<html:errors property="uniqueCombination" />
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
							<td><%=limit.getFacilitySequence()%>&nbsp;</td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.relationship.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="relationshipCodeEntryCode" onchange="refreshDropdown()">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.OFFICER_RELATIONSHIP%>"
									descWithCode="true" />
							</html:select><html:errors property="relationshipCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message
								key="label.facility.officer.sequence.no" /></td>
							<td><%if(StringUtils.isNotBlank(form.getSequenceNumber()) && !form.getSequenceNumber().equalsIgnoreCase("null")){%>
                                <integro:empty-if-null
								value="<%=form.getSequenceNumber()%>" />
								<html:hidden property="sequenceNumber" />
                                <%}%>&nbsp;</td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.officer.type" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="officerTypeEntryCode">
                                <% if (("").equals(officer_Indicator)) { %>
                                <integro:common-code
                                        categoryCode="<%=CategoryCodeConstant.OFFICER_TYPE%>"/>
                                <% } else { %>
                                <integro:common-code
                                        categoryCode="<%=CategoryCodeConstant.OFFICER_TYPE%>" refEntryCode="<%=officer_Indicator%>" />
                                <% } %>
                            </html:select>
                                <html:errors property="officerTypeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.officer" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="officerEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.OFFICER%>" />
							</html:select><html:errors property="officerEntryCode" /></td>
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
						<%
							if (FacilityMainAction.EVENT_EDIT.equals(event)) {
						%>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="update()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
							src="img/ok1.gif" name="Image3311" border="0" id="Image331"/> </a></td>
						<%
							}
								else if (FacilityMainAction.EVENT_EDIT_WO_FRAME.equals(event)) {
						%>

						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="updateNoFrame()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
							src="img/ok1.gif" name="Image3311" border="0" id="Image331"/> </a></td>
						<%
							}
								else if (FacilityMainAction.EVENT_ADD.equals(event)) {
						%>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="create()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
							src="img/ok1.gif" name="Image3311" border="0" id="Image331" /> </a></td>
						<%
							}
								else if (FacilityMainAction.EVENT_ADD_WO_FRAME.equals(event)) {
						%>
						<td width="75" valign="baseline" align="center"><a href="#"
							onclick="createNoFrame()" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img
							src="img/ok1.gif" name="Image3311" border="0" id="Image331" /> </a></td>
						<%
							}
								if (FacilityMainAction.EVENT_EDIT_WO_FRAME.equals(event)
										|| FacilityMainAction.EVENT_ADD_WO_FRAME.equals(event)) {
						%>

						<td width="75" valign="baseline" align="center"><a
							href="FacilityOfficer.do?event=list_no_frame&startIdx=0"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3312','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image3312" border="0" id="Image332" /> </a></td>
						<%
							}
								else {
						%>
						<td width="75" valign="baseline" align="center"><a
							href="FacilityOfficer.do?event=list&startIdx=0" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3312','','img/cancel2.gif',1)"><img
							src="img/cancel1.gif" name="Image3312" border="0" id="Image332" /> </a></td>
						<%
							}
						%>
					</tr>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
</body>

<script type="text/javascript">
    function refreshDropdown() {
        document.forms[0].event.value="<%=event%>";
		document.forms[0].submit();
    }
</script>

</html>
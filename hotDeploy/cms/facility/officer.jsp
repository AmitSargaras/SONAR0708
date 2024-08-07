
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityOfficer"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.officer.OfficerForm"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script type="text/javascript">
	function addNew() {
		document.forms[0].event.value = "<%=FacilityMainAction.EVENT_ADD %>";
		document.forms[0].submit();
	}
	function addNewNoFrame() {
		document.forms[0].event.value = "<%=FacilityMainAction.EVENT_ADD_WO_FRAME %>";
		document.forms[0].submit();
	}
	function MM_jumpMenu(targ,selObj,restore){ //v3.0
		eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
		if (restore) selObj.selectedIndex=0;
	}
</script>
</head>
<%
	String[] style = { "even", "odd" };
	int count = 0;
	
	String isProcess = request.getParameter("isProcess");
	boolean isProcessHere = false;
	if(isProcess!=null&&isProcess.equals("true")){
		isProcessHere = true ; 
	}
	
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	List compareResultsList = (List) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.compareResultsOfficerList");
	if (compareResultsList != null) {
		pageContext.setAttribute("compareResultsList", compareResultsList);
	}
	ILimit limit = facilityMasterObj.getLimit();
	//IFacilityOfficer[] facilityOfficers = (IFacilityOfficer[]) request.getAttribute("facilityOfficers");
	OfficerForm form = (OfficerForm) request.getAttribute("FacilityOfficerForm");
	String event = null;
	if (form != null) {
		event = form.getEvent();
	}
	
	String temp = "0";
	if ((String) request.getAttribute("startIdx") != null) {
		temp = (String) request.getAttribute("startIdx");
	}
	int startIdx = Integer.parseInt(temp);
	int recordSize = 0;
	if (request.getAttribute("recordSize") != null) {
		recordSize = Integer.parseInt((String) request.getAttribute("recordSize"));
	}
%>
<body>

<table width="100%" height="100%" cellspacing="0" cellpadding="0"
	border="0">
	<tr>
		<td valign="top"><html:form action="FacilityOfficer.do">
			<html:hidden property="event" />
			<input type="hidden" name="nextTab">
			<table width="97%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td width="70%">
						<h3><bean:message key="label.facility.officer" /></h3>
						</td>
						<td width="30%"><bean:message key="label.indicate.mandatory" /></td>
					</tr>
					<tr>
						<td colspan="2">
						<hr>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="tblInfo">
							<tbody>
								<tr class="<%=style[count++%2] %>">
									<td width="20%" class="fieldname"><span class="stp"><bean:message
										key="label.facility.aa.no" /></span><bean:message
										key="label.mandatory" /></td>
									<td width="30%"><%=limitProfile.getBCAReference()%></td>
									<td width="20%" class="fieldname"><span class="stp"><bean:message
										key="label.facility.sequence.no" /></span><bean:message
										key="label.mandatory" /></td>
									<td width="30%"><%=limit.getFacilitySequence()%></td>
								</tr>
								<tr class="<%=style[count++%2] %>">
									<td class="fieldname"><span class="stp"><bean:message
										key="label.facility.code" /></span><bean:message
										key="label.mandatory" /></td>
									<td colspan="3"><integro:empty-if-null
										value="<%=limit.getFacilityCode() %>" /></td>
								</tr>
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
						<td>&nbsp;</td>
					</tr>
					<tr>
						<%
							if (!FacilityMainAction.TAB_OFFICER_CHECKER.equals(event)
										&& !FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(event)
										&& !FacilityMainAction.TAB_OFFICER_VIEW_WO_FRAME.equals(event)
										&& !FacilityMainAction.EVENT_NAVIGATE_VIEW_WO_FRAME.equals(event)
										&& !FacilityMainAction.EVENT_NAVIGATE_VIEW.equals(event)
										&& !FacilityMainAction.TAB_OFFICER_VIEW.equals(event)&&!isProcessHere) {
						%>
						<%
							if (FacilityMainAction.EVENT_LIST_WO_FRAME.equals(event)
											|| FacilityMainAction.EVENT_SAVE_WO_FRAME.equals(event)
											|| FacilityMainAction.EVENT_UPDATE_WO_FRAME.equals(event)
											|| FacilityMainAction.EVENT_DELETE_WO_FRAME.equals(event)) {
						%>
						<td colspan="2" style="text-align: right"><input
							type="button" value="<bean:message key="label.add.new"/>"
							name="Button" class="btnNormal" style="width: 80"
							onClick="addNewNoFrame();" /></td>
						<%
							}
									else {
						%>
						<td colspan="2" style="text-align: right"><input
							type="button" value="<bean:message key="label.add.new"/>"
							name="Button" class="btnNormal" style="width: 80"
							onClick="addNew();" /></td>
						<%
							}
								}
						%>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2">
						<table width="100%" border="0" cellpadding="0" cellspacing="0"
							class="tblInfo">
							<thead>
								<tr>
									<td width="3%"><bean:message key="label.global.sn" /></td>
									<td width="15%"><bean:message
										key="label.facility.relationship.code" /></td>
									<td width="20%"><bean:message
										key="label.facility.officer.sequence.no" /></td>
									<td width="25%"><bean:message
										key="label.facility.officer.type" /></td>
									<td width="25%"><bean:message key="label.facility.officer" /></td>
									<td width="12%"><bean:message key="label.global.action" /></td>
								</tr>
							</thead>
							<tbody>
								<%
									if (!(isProcessHere)
											//(FacilityMainAction.TAB_OFFICER_CHECKER.equals(event) || FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(event)
													) {
								%>
								<logic:empty name="facilityOfficers">
									<tr class="odd">
										<td colspan="6"><bean:message
											key="label.global.not.found" /></td>
									</tr>
								</logic:empty>
								<logic:notEmpty name="facilityOfficers">
									<logic:iterate id="facilityOfficer" name="facilityOfficers"
										type="com.integrosys.cms.app.limit.bus.IFacilityOfficer"
										indexId="indexId">
										<tr class="<%=style[(indexId.intValue())%2] %>">
											<td class="index"><%=(indexId.intValue() + 1 + startIdx)%></td>
											<td style="text-align: center"><%=facilityOfficer.getRelationshipCodeEntryCode()%></td>
											<td><integro:empty-if-null
												value="<%=facilityOfficer.getHostSequenceNumber()%>" /></td>
											<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.OFFICER_TYPE%>"
												entryCode="<%=facilityOfficer.getOfficerTypeEntryCode()%>"
												display="true" /></td>
											<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.OFFICER%>"
												entryCode="<%=facilityOfficer.getOfficerEntryCode()%>"
												display="true" /></td>
											<td style="text-align: center">
											<%
												if (!FacilityMainAction.TAB_OFFICER_CHECKER.equals(event)
																				&& !FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(form
																						.getEvent())
																				&& !FacilityMainAction.EVENT_NAVIGATE_VIEW_WO_FRAME.equals(event)
																				&& !FacilityMainAction.TAB_OFFICER_VIEW_WO_FRAME.equals(event)
																				&& !FacilityMainAction.EVENT_NAVIGATE_VIEW.equals(event)
																				&& !FacilityMainAction.TAB_OFFICER_VIEW.equals(event)) {
											%> <select onchange="MM_jumpMenu('self',this,0)">
												<option value="#"><bean:message
													key="label.please.select" /></option>
												<%
													if (FacilityMainAction.EVENT_LIST_WO_FRAME.equals(event)) {
												%>
												<option
													value="FacilityOfficer.do?event=<%=FacilityMainAction.EVENT_EDIT_WO_FRAME %>&key=<%=(indexId.intValue() + startIdx) %>"><bean:message
													key="label.edit" /></option>
												<option
													value="FacilityOfficer.do?event=<%=FacilityMainAction.EVENT_DELETE_WO_FRAME %>&key=<%=(indexId.intValue() + startIdx) %>"><bean:message
													key="label.global.delete" /></option>
												<%
													}
																				else {
												%>
												<option
													value="FacilityOfficer.do?event=<%=FacilityMainAction.EVENT_EDIT %>&key=<%=(indexId.intValue() + startIdx) %>"><bean:message
													key="label.edit" /></option>
												<option
													value="FacilityOfficer.do?event=<%=FacilityMainAction.EVENT_DELETE %>&key=<%=(indexId.intValue() + startIdx) %>"><bean:message
													key="label.global.delete" /></option>
												<%
													}
												%>
											</select> <%
 	}
 							else {
 								if (FacilityMainAction.TAB_OFFICER_CHECKER.equals(event)
 										|| FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(form
 												.getEvent())) {
 %> <a
												href="FacilityOfficer.do?event=view_detail_checker&key=<%=(indexId.intValue() + startIdx) %>"
												style="text-align: center"><bean:message
												key="label.view" /></a> <%
 	}
 								else if (FacilityMainAction.EVENT_NAVIGATE_VIEW_WO_FRAME
 										.equals(event)
 										|| FacilityMainAction.TAB_OFFICER_VIEW_WO_FRAME.equals(event)) {
 %><a
												href="FacilityOfficer.do?event=view_detail_only&key=<%=(indexId.intValue() + startIdx) %>"
												style="text-align: center"><bean:message
												key="label.view" /></a> <%
 	}
 								else if (FacilityMainAction.EVENT_NAVIGATE_VIEW.equals(event)
 										|| FacilityMainAction.TAB_OFFICER_VIEW.equals(event)) {
 %><a
												href="FacilityOfficer.do?event=view_detail_only_w_frame&key=<%=(indexId.intValue() + startIdx) %>"
												style="text-align: center"><bean:message
												key="label.view" /></a> <%
 	}
 							}
 %>
											</td>
										</tr>
									</logic:iterate>
								</logic:notEmpty>
								<%
									}
										else {
								%>
								<logic:empty name="compareResultsList">
									<tr class="odd">
										<td colspan="6"><bean:message
											key="label.global.not.found" /></td>
									</tr>
								</logic:empty>
								<logic:notEmpty name="compareResultsList">
									<logic:iterate id="result" name="compareResultsList"
										type="com.integrosys.base.techinfra.diff.CompareResult"
										indexId="indexId">
										<%
											IFacilityOfficer facilityOfficer = (IFacilityOfficer) result.getObj();
										%>
										<tr class="<%=style[(indexId.intValue())%2] %>">
											<td class="<%=result.getKey()%>"><%=(indexId.intValue() + 1 + startIdx)%></td>
											<td style="text-align: center"><%=facilityOfficer.getRelationshipCodeEntryCode()%></td>
											<td><integro:empty-if-null
												value="<%=facilityOfficer.getHostSequenceNumber()%>" /></td>
											<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.OFFICER_TYPE%>"
												entryCode="<%=facilityOfficer.getOfficerTypeEntryCode()%>"
												display="true" /></td>
											<td><integro:common-code
												categoryCode="<%=CategoryCodeConstant.OFFICER%>"
												entryCode="<%=facilityOfficer.getOfficerEntryCode()%>"
												display="true" /></td>
											<td style="text-align: center">
											<%
												if (!FacilityMainAction.TAB_OFFICER_CHECKER.equals(event)
																				&& !FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(form
																						.getEvent())
																				&& !FacilityMainAction.EVENT_NAVIGATE_VIEW_WO_FRAME.equals(event)
																				&& !FacilityMainAction.TAB_OFFICER_VIEW_WO_FRAME.equals(event)
																				&& !FacilityMainAction.EVENT_NAVIGATE_VIEW.equals(event)
																				&& !FacilityMainAction.TAB_OFFICER_VIEW.equals(event)&&!isProcessHere) {
											%> <select onchange="MM_jumpMenu('self',this,0)">
												<option value="#"><bean:message
													key="label.please.select" /></option>
												<%
													if (FacilityMainAction.EVENT_LIST_WO_FRAME.equals(event)) {
												%>
												<option
													value="FacilityOfficer.do?event=<%=FacilityMainAction.EVENT_EDIT_WO_FRAME %>&key=<%=indexId.intValue() + startIdx %>"><bean:message
													key="label.edit" /></option>
												<option
													value="FacilityOfficer.do?event=<%=FacilityMainAction.EVENT_DELETE_WO_FRAME %>&key=<%=indexId.intValue() + startIdx %>"><bean:message
													key="label.global.delete" /></option>
												<%
													}
																				else {
												%>
												<option
													value="FacilityOfficer.do?event=<%=FacilityMainAction.EVENT_EDIT %>&key=<%=indexId.intValue() + startIdx %>"><bean:message
													key="label.edit" /></option>
												<option
													value="FacilityOfficer.do?event=<%=FacilityMainAction.EVENT_DELETE %>&key=<%=indexId.intValue() + startIdx %>"><bean:message
													key="label.global.delete" /></option>
												<%
													}
												%>
											</select> <%
 	}
 							else {
 								if(!isProcessHere){
 								if (FacilityMainAction.TAB_OFFICER_CHECKER.equals(event)
 										|| FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(form
 												.getEvent())) {
 %> <a
												href="FacilityOfficer.do?event=view_detail_checker&key=<%=indexId.intValue() + startIdx %>"
												style="text-align: center"><bean:message
												key="label.view" /></a> <%
 	}
 								else if (FacilityMainAction.EVENT_NAVIGATE_VIEW_WO_FRAME
 										.equals(event)
 										|| FacilityMainAction.TAB_OFFICER_VIEW_WO_FRAME.equals(event)) {
 %><a
												href="FacilityOfficer.do?event=view_detail_only&key=<%=indexId.intValue() + startIdx %>"
												style="text-align: center"><bean:message
												key="label.view" /></a> <%
 	}
 								else if (FacilityMainAction.EVENT_NAVIGATE_VIEW.equals(event)
 										|| FacilityMainAction.TAB_OFFICER_VIEW.equals(event)) {
 %><a
												href="FacilityOfficer.do?event=view_detail_only_w_frame&key=<%=indexId.intValue() + startIdx %>"
												style="text-align: center"><bean:message
												key="label.view" /></a> <%
 	}
 					}else{ %>											
										<a href="FacilityOfficer.do?event=view_detail_checker_process&key=<%=indexId.intValue() + startIdx %>"
										   style="text-align: center"><bean:message
										   key="label.view" /></a>

<%}
 								} %>
											</td>
										</tr>
									</logic:iterate>
								</logic:notEmpty>
								<%
									}
								%>
							</tbody>
						</table>
						</td>
					</tr>
                    <tr>
                        <td colspan="2"><html:errors property="officerErrors" />&nbsp;</td>
                    </tr>
                </tbody>
			</table>
		</html:form></td>
	</tr>
	<% if (recordSize > FacilityMainAction.RECORD_PER_PAGE) { %>
	<tr valign="bottom">
		<td height="25">
		<table id="generalPurposeBar" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td style="font-size: 8px; font-family: sans-serif;">
				<%
					if (FacilityMainAction.EVENT_LIST_WO_FRAME.equals(event)) {
				%> <integro:pageindex
					pageIndex='<%= new PageIndex(startIdx, FacilityMainAction.RECORD_PER_PAGE, recordSize)%>'
					url='<%="FacilityOfficer.do?event=list_no_frame&startIdx="%>'
					submitFlag='<%= new Boolean(false)%>' /> <%
 	}
 	else {
 %> <integro:pageindex
					pageIndex='<%= new PageIndex(startIdx, FacilityMainAction.RECORD_PER_PAGE, recordSize)%>'
					url='<%="FacilityOfficer.do?event=list&startIdx="%>'
					submitFlag='<%= new Boolean(false)%>' /> <%
 	}
 %>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<% } %>
</table>
</body>

</html>
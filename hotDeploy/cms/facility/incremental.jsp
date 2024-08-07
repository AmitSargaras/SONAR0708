<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile" %>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit" %>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.app.limit.bus.OBFacilityIncremental"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction "%>
<%@page import="java.util.List" %>
<%@page import="java.util.Locale" %>
<%@page import="com.integrosys.cms.ui.common.UIUtil" %>
<%@page import="com.integrosys.base.uiinfra.tag.PageIndex"%>

<script type="text/javascript">
	function submitForm(event, key) {
		document.forms[0].event.value = event;
		document.forms[0].key.value = key;
		document.forms[0].submit();
	}
</script>

<% 
	String[] style = { "even", "odd" };
	int count = 0;
	
	String isProcess = request.getParameter("isProcess");
	boolean isProcessHere = false;
	if(isProcess!=null&&isProcess.equals("true")){
		isProcessHere = true ; 
	}
	Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");	
	
	ILimit limit = facilityMasterObj.getLimit();	
	
	String event = request.getParameter("event");
	
	String temp = "0";
	if ((String) request.getAttribute("startIdx") != null) {
		temp = (String) request.getAttribute("startIdx");
	}
	int startIdx = Integer.parseInt(temp);
	int recordSize = 0;
	if (request.getAttribute("recordSize") != null) {
		recordSize = Integer.parseInt((String) request.getAttribute("recordSize"));
	}	
	
	String nextEvent = null;	
%>

<html:form action="FacilityIncremental.do">
	<html:hidden property="event" />
	<input type="hidden" name="key">
	<input type="hidden" name="nextTab">

	<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
		<tr>
			<td valign="top">
				<table width="97%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblFormSection">
					<thead>
						<tr>
							<td width="70%">
							<h3><bean:message key="label.facility.incremental" /></h3>
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
					</tbody>
				</table>
				<br/>
				<table width="97%" border="0" align="center" cellpadding="3" cellspacing="0" class="tblInput">
					<thead>
						<tr>
							<td width="5%"><bean:message key="label.global.sn"/></td>
							<td width="10%"><bean:message key="label.facility.incremental.number"/></td>
							<td width="10%"><bean:message key="label.facility.date.entry"/></td>
							<td width="15%"><bean:message key="label.facility.incremental.amount"/></td>
							<td width="15%"><bean:message key="label.facility.limit"/></td>
							<td width="15%"><bean:message key="label.status"/></td>
							<td width="15%"><bean:message key="label.documentation.status"/></td>
							<td width="15%"><bean:message key="label.global.action"/></td>
						</tr>
					</thead>
					<tbody>
					<%
							String labelAction = "label.view";
							if (FacilityMainAction.EVENT_LIST_WO_FRAME.equals(event)) {
								nextEvent = FacilityMainAction.EVENT_EDIT_WO_FRAME;
								labelAction = "label.edit";
							} else if (FacilityMainAction.EVENT_LIST.equals(event)) {
								nextEvent = FacilityMainAction.EVENT_EDIT;
								labelAction = "label.edit";
							} else if (FacilityMainAction.TAB_FACILITY_INCREMENTAL_CHECKER.equals(event)
 										|| FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(event)) {
								nextEvent = FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER;
							} else if (FacilityMainAction.EVENT_NAVIGATE_VIEW_WO_FRAME.equals(event)
 										|| FacilityMainAction.TAB_FACILITY_INCREMENTAL_VIEW_WO_FRAME.equals(event)) {
								nextEvent = FacilityMainAction.EVENT_VIEW_DETAIL_ONLY;
							} else if (FacilityMainAction.EVENT_NAVIGATE_VIEW.equals(event)
										|| FacilityMainAction.TAB_FACILITY_INCREMENTAL_VIEW.equals(event)) {
								nextEvent = FacilityMainAction.EVENT_VIEW_DETAIL_ONLY_WITH_FRAME;
							} else if (isProcessHere) {
								nextEvent = FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER_PROCESS;
							}
					%>
						<logic:empty name="facilityIncrementals">
							<tr class="odd">
								<td colspan="8"><bean:message
									key="label.global.not.found" /></td>
							</tr>
						</logic:empty>
						<logic:notEmpty name="facilityIncrementals">
							<%
								if (!isProcessHere) {
							%>													
							<logic:iterate id="incremental" name="facilityIncrementals"
								type="com.integrosys.cms.app.limit.bus.OBFacilityIncremental"
								indexId="indexId">
								<tr class="<%=style[(indexId.intValue())%2] %>">
									<td class="index"><%=(indexId.intValue() + 1 + startIdx)%></td>
									<td><%= incremental.getIncrementalNumber()!=null?incremental.getIncrementalNumber().toString():"-" %></td>
									<td><integro:date object="<%=incremental.getDateEntered() %>"></integro:date>&nbsp;</td>
									<td><integro:empty-if-null value="<%=UIUtil.mapNumberObjectToString(incremental.getIncrementalLimit(), locale, 2) %>"/></td>
									<td><integro:empty-if-null value="<%=UIUtil.mapNumberObjectToString(incremental.getOriginalLimit(), locale, 2) %>"/></td>
									<td><integro:common-code categoryCode="<%=CategoryCodeConstant.FACILITY_STATUS %>" entryCode="<%=incremental.getFacilityStatus() %>" display="true"/> &nbsp;</td>
									<td><integro:common-code categoryCode="<%=CategoryCodeConstant.LMT_STATUS %>" entryCode="<%=incremental.getDocumentationStatusEntryCode() %>" display="true"/> &nbsp;</td>
									<td><a href="#" onclick="submitForm('<%=nextEvent%>', '<%=(indexId.intValue() + startIdx) %>')">
										<bean:message key="<%=labelAction %>"/></a>
									</td>								
								</tr>								
							</logic:iterate>
							<% } else { %>
							<logic:iterate id="result" name="facilityIncrementals"
								type="com.integrosys.base.techinfra.diff.CompareResult"
								indexId="indexId">		
								<%
									OBFacilityIncremental incremental = (OBFacilityIncremental)result.getObj();
								%>
								<tr class="<%=style[(indexId.intValue())%2] %>">
									<td class="<%=result.getKey()%>"><%=(indexId.intValue() + 1 + startIdx)%></td>
									<td><%= incremental.getIncrementalNumber()!=null?incremental.getIncrementalNumber().toString():"-" %></td>
									<td><integro:date object="<%=incremental.getDateEntered() %>"></integro:date>&nbsp;</td>
									<td><integro:empty-if-null value="<%=UIUtil.mapNumberObjectToString(incremental.getIncrementalLimit(), locale, 2) %>"/></td>
									<td><integro:empty-if-null value="<%=UIUtil.mapNumberObjectToString(incremental.getOriginalLimit(), locale, 2) %>"/></td>
									<td><integro:common-code categoryCode="<%=CategoryCodeConstant.FACILITY_STATUS %>" entryCode="<%=incremental.getFacilityStatus() %>" display="true"/> &nbsp;</td>
									<td><integro:common-code categoryCode="<%=CategoryCodeConstant.LMT_STATUS %>" entryCode="<%=incremental.getDocumentationStatusEntryCode() %>" display="true"/> &nbsp;</td>
									<%
										String keyStr = String.valueOf(indexId.intValue() + startIdx);
										if (isProcessHere){
											keyStr = incremental.getCmsReferenceId().toString();
										}
									%>
									<td><a href="#" onclick="submitForm('<%=nextEvent%>', '<%=keyStr %>')">
										<bean:message key="<%=labelAction %>"/></a>
									</td>								
								</tr>								
							</logic:iterate>																						
							<% } %>							
						</logic:notEmpty>					
					</tbody>
				</table>              
			</td>
		</tr>
        <tr>
            <td colspan="2"><html:errors property="incrementalErrors" />&nbsp;</td>
        </tr>		
	</table>
	
	<% if (recordSize > FacilityMainAction.RECORD_PER_PAGE) { %>
		<table id="generalPurposeBar" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td style="font-size: 8px; font-family: sans-serif;">
				<%
					String listEvent = FacilityMainAction.EVENT_LIST;
					if (FacilityMainAction.EVENT_LIST_WO_FRAME.equals(event)) {
						listEvent = FacilityMainAction.EVENT_LIST_WO_FRAME;
					}
					String pageindexUrl = "FacilityIncremental.do?event="+listEvent+"&startIdx=";
				%> 
				<integro:pageindex
					pageIndex='<%= new PageIndex(startIdx, FacilityMainAction.RECORD_PER_PAGE, recordSize)%>'
					url='<%=pageindexUrl%>'
					submitFlag='<%= new Boolean(false)%>' /> 
				</td>
			</tr>
		</table>
 	<%  } %>		
</html:form>
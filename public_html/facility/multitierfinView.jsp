
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMultiTierFinancing"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.multitierfin.MultiTierFinForm"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>

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
	IFacilityMultiTierFinancing multiTierFinActual = (IFacilityMultiTierFinancing) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.multiTierFinActual");
	IFacilityMultiTierFinancing multiTierFinObj = (IFacilityMultiTierFinancing) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.multiTierFinObj");
	ILimit limit = facilityMasterObj.getLimit();

	MultiTierFinForm form = (MultiTierFinForm) request.getAttribute("FacilityMultiTierFinForm");
	String event = form.getEvent();

	String styleTierTerm = "fieldname";
	String styleTierTermCode = "fieldname";
	String styleRate = "fieldname";
    String styleGracePeriod = "fieldname";
	if (multiTierFinObj != null && multiTierFinActual != null) {
		if (!CompareOBUtil.compOB(multiTierFinActual, multiTierFinObj, "tierTerm")) {
			styleTierTerm = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(multiTierFinActual, multiTierFinObj, "tierTermCode")) {
			styleTierTermCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(multiTierFinActual, multiTierFinObj, "rate")) {
			styleRate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(multiTierFinActual, multiTierFinObj, "gracePeriod")) {
			styleGracePeriod = "fieldnamediff";
		}
	}
	
	String lastEvent = request.getParameter("lastEvent");
	if (lastEvent == null || lastEvent.trim().length() == 0) {
		lastEvent = null;
	}
%>
<body>
<html:form action="FacilityMultiTierFin.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.multitierfin" /></h3>
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
							<td width="30%"><%=limit.getLimitID()%></td>
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.code" /></span></td>
							<td width="30%"><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.sequence.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=limit.getFacilitySequence()%></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.branch.no" /></span><bean:message key="label.mandatory" /></td>
							<td><integro:empty-if-null
								value="<%=limit.getBookingLocation().getOrganisationCode() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.seq.no" /></span></td>
							<td>
								<% if (multiTierFinObj != null) { %>
									<integro:empty-if-null value="<%= multiTierFinObj.getTierSeqNo()%>" />
								<% } else { %>
									&nbsp;-
								<% } %>
							</td>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleTierTerm %>"><span class="stp"><bean:message key="label.facility.multitierfin.tier.term" /></span><bean:message
								key="label.mandatory" /></td>
							<td><% if (multiTierFinObj != null) { %>
									<integro:empty-if-null value="<%= multiTierFinObj.getTierTerm()%>" />
								<% } else { %>
									&nbsp;-
								<% } %>
							</td>
							<td class="<%=styleTierTermCode %>"><span class="stp"><bean:message key="label.facility.multitierfin.tier.term.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
								<%
									if (multiTierFinObj != null && multiTierFinObj.getTierTermCode()!= null) {
										String tierTermCode = String.valueOf(multiTierFinObj.getTierTermCode());
								%>
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.LIMIT_TENOR%>"
									entryCode="<%=tierTermCode%>"
									display="true" />
								<%
									} else {
								%>-<%
									}
								%>
								</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleRate %>"><span class="stp"><bean:message key="label.facility.interest.rate" /></span><bean:message
								key="label.mandatory" /></td>
							<td><% if (multiTierFinObj != null && multiTierFinObj.getRate() != null) { %>
									<integro:empty-if-null value="<%= multiTierFinObj.getRate()%>" />
								<% } else { %>
									&nbsp;-
								<% } %>
							</td>
							<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.rate.number" /></span></td>
							<td><bean:write name="FacilityMultiTierFinForm" property="rateNumber"/>&nbsp;</td>
						</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.rate.variance" /></span></td>
								<td><bean:write name="FacilityMultiTierFinForm" property="rateVariance"/>&nbsp;</td>
								<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.variance.code" /></span></td>
								<td><bean:write name="FacilityMultiTierFinForm" property="varianceCode"/>&nbsp;</td>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=styleGracePeriod %>"><span class="stp"><bean:message key="label.facility.multitierfin.grace.period" /></span></td>
								<td><%String gracePeriod = (form.getGracePeriod()==null?"":form.getGracePeriod()); %>
								<%if(gracePeriod.equals("Y")){%><bean:message key="label.common.yes" />
									<%}else if(gracePeriod.equals("N")){%><bean:message key="label.common.no" />
									<%}else if(gracePeriod.equals(" ")){%><bean:message key="label.common.not.avail" />
									<%} %>&nbsp;
								<html:errors property="gracePeriod" /></td>
								<td class="fieldname"><span class="stp"><bean:message key="label.facility.multitierfin.payment.amount" /></span></td>
								<td><bean:write name="FacilityMultiTierFinForm" property="paymentAmount"/>&nbsp;</td>
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
						if (lastEvent != null) {
						%>
							<a
							href="FacilityMultiTierFin.do?event=<%=lastEvent%>"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
						}
						else if(!FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER_PROCESS.equals(form.getEvent())){
							if (FacilityMainAction.TAB_MULTI_TIER_FINANCING_CHECKER.equals(form.getEvent())
										|| FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(form.getEvent())
										|| FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER.equals(event)) {
						%> <a href="FacilityMultiTierFin.do?event=multi_tier_financing_checker"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
							}
								else if (FacilityMainAction.EVENT_VIEW_DETAIL_ONLY.equals(form.getEvent())) {
						%> <a
							href="FacilityMultiTierFin.do?event=multi_tier_financing_view_no_frame"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
							}
								else if (FacilityMainAction.EVENT_VIEW_DETAIL_ONLY_WITH_FRAME.equals(form.getEvent())) {
						%> <a
							href="FacilityMultiTierFin.do?event=multi_tier_financing_view"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
							}
						} else {
						%><a
							href="FacilityMultiTierFin.do?event=multi_tier_financing_checker_process"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<% }%></td>
					</tr>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
</body>
</html>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityRelationship"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.relationship.RelationshipForm"%>
<%@page
	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>		

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
	IFacilityRelationship facilityRelationshipActual = (IFacilityRelationship) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityRelationshipActual");
	IFacilityRelationship facilityRelationshipObj = (IFacilityRelationship) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityRelationshipObj");
	ILimit limit = facilityMasterObj.getLimit();
    ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	RelationshipForm form = (RelationshipForm) request.getAttribute("FacilityRelationshipForm");
	String event = form.getEvent();

	String styleAccountRelationship = "fieldname";
	String styleShareHolderPercentage = "fieldname";
	String styleGuaranteePercentageAmount = "fieldname";
	String styleReceiveMailCode = "fieldname";
	String styleHoldMailCode = "fieldname";
	String styleNameAssociatedWithFacilityOrder = "fieldname";
	String styleNameConjunctionPosition = "fieldname";
	String styleNameConjunction = "fieldname";
	String styleProfitRatio = "fieldname";
	String styleDividendRatio = "fieldname";

	if (facilityRelationshipObj != null && facilityRelationshipActual != null) {
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj,
				"accountRelationshipEntryCode")) {
			styleAccountRelationship = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj, "shareHolderPercentage")) {
			styleShareHolderPercentage = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj, "guaranteePercentage")
				|| !CompareOBUtil
						.compOB(facilityRelationshipActual, facilityRelationshipObj, "guaranteeAmount")) {
			styleGuaranteePercentageAmount = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj, "receiveMailCode")) {
			styleReceiveMailCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj, "holdMailCodeEntryCode")) {
			styleHoldMailCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj,
				"nameAssociateWithFacilityOrder")) {
			styleNameAssociatedWithFacilityOrder = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj,
				"nameConjunctionPosition")) {
			styleNameConjunctionPosition = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj, "nameConjunction")) {
			styleNameConjunction = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj, "profitRatio")) {
			styleProfitRatio = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityRelationshipActual, facilityRelationshipObj, "dividendRatio")) {
			styleDividendRatio = "fieldnamediff";
		}
	}
%>
<body>
<html:form action="FacilityRelationship.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.relationship" /></h3>
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
								key="label.facility.code" /></span></td>
							<td width="30%"><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.sequence.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=limit.getFacilitySequence()%></td>
							<td class="fieldname"><span class="stp">&nbsp;</span></td>
							<td>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message
								key="label.facility.cif.no" /></td>
							<td><integro:empty-if-null
								value="<%=facilityRelationshipObj.getCmsLegalEntity().getLEReference() %>" />
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.customer.rs.entity.name" /></span><bean:message
								key="label.mandatory" /></td>
							<td><integro:empty-if-null
								value="<%=facilityRelationshipObj.getCmsLegalEntity().getLegalName() %>" />
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleAccountRelationship %>"><span class="stp"><bean:message
								key="label.facility.account.relationship" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityRelationshipObj.getAccountRelationshipEntryCode() != null) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.RELATIONSHIP%>"
								entryCode="<%=facilityRelationshipObj.getAccountRelationshipEntryCode()%>"
								display="true" descWithCode="true" /> <%
 	}
 %>
							</td>
							<td class="<%=styleShareHolderPercentage %>"><span
								class="stp"><bean:message
								key="label.facility.share.holder.percentage" /></span></td>
							<td><integro:empty-if-null
								value="<%=facilityRelationshipObj.getShareHolderPercentage() %>" />
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleGuaranteePercentageAmount %>"><span
								class="stp"><bean:message
								key="label.facility.guarantee.percentage.amount" /></span></td>
							<td colspan="3">
							<%
								if (facilityRelationshipObj.getGuaranteePercentage() != null) {
							%> <%=facilityRelationshipObj.getGuaranteePercentage()%> % <%
 	}
 		else if (facilityRelationshipObj.getGuaranteeAmount() != null) {
 %> <integro:amount
								amount="<%=facilityRelationshipObj.getGuaranteeAmount() %>"></integro:amount>
							<%
								}
							%>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.address.sequence.number" /></span></td>
							<td><integro:empty-if-null value="<%=facilityRelationshipObj.getHostAddressSequenceNumber()%>" />&nbsp;</td>
							<td class="<%=styleReceiveMailCode %>"><span class="stp"><bean:message
								key="label.facility.receive.mail.code" /></span></td>
							<td>
							<%
								if (facilityRelationshipObj.getReceiveMailCode() != null) {
							%> <%=facilityRelationshipObj.getReceiveMailCode().booleanValue() ? "Yes" : "No"%>
							<%
								}
									else {
							%><integro:empty-if-null
								value="<%=facilityRelationshipObj.getReceiveMailCode() %>" /> <%
 	}
 %>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleHoldMailCode %>"><span class="stp"><bean:message
								key="label.facility.hold.mail.code" /></span></td>
							<td>
							<%
								if (facilityRelationshipObj.getHoldMailCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityRelationshipObj.getHoldMailCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.HOLD_MAIL%>"
								entryCode="<%=facilityRelationshipObj.getHoldMailCodeEntryCode()%>"
								display="true" descWithCode="true" /><%
 	}
 %>
							&nbsp;</td>
							<td class="<%=styleNameAssociatedWithFacilityOrder %>"><span
								class="stp"><bean:message
								key="label.facility.name.associated.with.facility.order" /></span></td>
							<td><integro:empty-if-null
								value="<%=facilityRelationshipObj.getNameAssociateWithFacilityOrder() %>" />&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleNameConjunctionPosition %>"><span
								class="stp"><bean:message
								key="label.facility.name.conjunction.position" /></span></td>
							<td><%
							if (facilityRelationshipObj.getNameConjunctionPosition()!=null){ 
									if(facilityRelationshipObj.getNameConjunctionPosition().toString().equals("E")){%>
								<bean:message key="label.common.end" />
									<%}else if (facilityRelationshipObj.getNameConjunctionPosition().toString().equals("B")){ %>
										<bean:message key="label.common.before" />
									<%} %> <%}else{ %> - <%} %>&nbsp;
							</td>
							<td class="<%=styleNameConjunction %>"><span class="stp"><bean:message
								key="label.facility.name.conjunction" /></span></td>
							<td>
							<%
								if (facilityRelationshipObj.getNameConjunction() != null
											&& StringUtils.isNotBlank(facilityRelationshipObj.getNameConjunction())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.NAME_CONJUNCTION%>"
								entryCode="<%=facilityRelationshipObj.getNameConjunction()%>"
								display="true" /> <%
 	}
 %>
							&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleProfitRatio %>"><span class="stp"><bean:message
								key="label.facility.profit.ratio" /></span></td>
							<td><integro:empty-if-null
								value="<%=facilityRelationshipObj.getProfitRatio() %>" /></td>
							<td class="<%=styleDividendRatio %>"><span class="stp"><bean:message
								key="label.facility.dividend.ratio" /></span></td>
							<td><integro:empty-if-null
								value="<%=facilityRelationshipObj.getDividendRatio() %>" /></td>
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
							if (FacilityMainAction.TAB_RELATIONSHIP_CHECKER.equals(form.getEvent())
										|| FacilityMainAction.EVENT_NAVIGATE_WO_FRAME_CHECKER.equals(form.getEvent())
										|| FacilityMainAction.EVENT_VIEW_DETAIL_CHECKER.equals(event)) {
						%> <a href="FacilityRelationship.do?event=relationship_checker"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
							}
								else if (FacilityMainAction.EVENT_VIEW_DETAIL_ONLY.equals(form.getEvent())) {
						%> <a
							href="FacilityRelationship.do?event=relationship_view_no_frame"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
							}
								else if (FacilityMainAction.EVENT_VIEW_DETAIL_ONLY_WITH_FRAME.equals(form.getEvent())) {
						%> <a
							href="FacilityRelationship.do?event=relationship_view"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%
							}
						}else{
						%>
						<a
							href="FacilityRelationship.do?event=relationship_checker_process"
							onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4412','','img/return2.gif',1)"><img
							src="img/return1.gif" name="Image4412" border="0" id="Image4412" /></a>
						<%} %></td>
					</tr>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
</body>
</html>
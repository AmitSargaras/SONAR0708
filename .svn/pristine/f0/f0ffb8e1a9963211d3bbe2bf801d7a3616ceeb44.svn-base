
<%@page import="com.integrosys.cms.ui.collateral.pledge.PledgeForm"%>
<%@page import="com.integrosys.cms.app.collateral.bus.ICollateralLimitMap"%>
<%@page import="com.integrosys.cms.ui.collateral.CollateralAction"%>
<%@ page import="com.integrosys.cms.ui.collateral.SecuritySubTypeUtil"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
	String[] style = { "even", "odd" };
	int count = 1;
	PledgeForm form = (PledgeForm) request.getAttribute("PledgeForm");
%>

<html:form action="<%=actionNameStr%>">
<html:hidden property="event" />
<input type="hidden" name="limitId" />
<input type="hidden" name="from_event" value="<%=request.getParameter("from_event")%>"/>
<input type="hidden" name="subtype" value="<%=request.getParameter("subtype")%>">

<%@ include file="/collateral/common/mandatory_flag.jsp" %>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
		<tr>
		<td> <h3><bean:message key="label.pledge.add.linkage.title"/></h3></td>
		</tr>
		<tr>
		<td><hr/></td>
		</tr>
	</thead>
	<tbody>
		<tr>
		<td colspan="2">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td colspan="4"><bean:message key="label.facility.collateral.information"/></td>
				</tr>
			</thead>
			<tbody>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname" width="20%"><bean:message key="label.collateral.type"/> </td>
				<td width="30%"><bean:write name="PledgeForm" property="collateralType"/>&nbsp;</td>
				<td class="fieldname" width="20%"><bean:message key="label.collateral.subtype"/></td>
				<td width="30%"><bean:write name="PledgeForm" property="collateralSubType"/>&nbsp;</td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.collateral.id"/> </td>
				<td><bean:write name="PledgeForm" property="collateralId"/>&nbsp;</td>
				<td class="fieldname"><bean:message key="label.collateral.sibs.id"/></td>
				<td><bean:write name="PledgeForm" property="sibsCollateralId"/>&nbsp;</td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td colspan="4"><bean:message key="label.facility.information"/></td>
				</tr>
			</thead>
			<tbody>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname" width="20%"><bean:message key="label.pledge.facility.no"/> </td>
				<td width="30%"><bean:write name="PledgeForm" property="facilityNo" />&nbsp;</td>
				<td class="fieldname" width="20%"><bean:message key="label.facility.description"/></td>
				<td width="30%">
				<%if (form.getFacilityDescription() != null) { %><integro:common-code categoryCode="<%=CategoryCodeConstant.FACILITY_TYPE%>" entryCode="<%=form.getFacilityDescription() %>" display="true"/><%}else { %>-<%} %></td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.pledge.sibs.application.no"/> </td>
				<td><bean:write name="PledgeForm" property="sibsApplicationNo"/>&nbsp;</td>
				<td class="fieldname"><bean:message key="label.pledge.sibs.facility.code"/></td>
				<td><bean:write name="PledgeForm" property="sibsFacilityCode"/>&nbsp;</td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.pledge.sibs.facility.seq"/> </td>
				<td><bean:write name="PledgeForm" property="sibsFacilitySeq"/>&nbsp;</td>
				<td class="fieldname"><bean:message key="label.pledge.activate.limit"/></td>
				<td><bean:write name="PledgeForm" property="activatedLimit"/>&nbsp;</td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.pledge.approved.limit"/> </td>
				<td><bean:write name="PledgeForm" property="approvedLimit"/>&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
		<td>
			<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
			<thead>
				<tr>
				<td colspan="4"><bean:message key="label.security.charge.infor"/></td>
				</tr>
			</thead>
			<tbody>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname" width="15%"><bean:message key="label.pledge.amount"/> </td>
				<td width="85%">
				<%if (String.valueOf(ICollateralLimitMap.CHARGE_INFO_PERCENTAGE_USAGE).equals(form.getChargeInfoUsageIndicator())) { %>
					<bean:write name="PledgeForm" property="pledgeAmountPercentage"/>&nbsp;%
				<%} else if (String.valueOf(ICollateralLimitMap.CHARGE_INFO_AMOUNT_USAGE).equals(form.getChargeInfoUsageIndicator())) { %>
					<bean:write name="PledgeForm" property="currency"/>&nbsp;<bean:write name="PledgeForm" property="pledgeAmount"/>
				<%} %>&nbsp;
				</td>
				</tr>
				<tr class="<%=style[count++%2] %>">
				<td class="fieldname"><bean:message key="label.pledge.amount.draw"/></td>
				<td>
				<%if (String.valueOf(ICollateralLimitMap.CHARGE_INFO_PERCENTAGE_USAGE).equals(form.getAmountDrawIndicator())) { %>
					<bean:write name="PledgeForm" property="amountDrawPercentage"/>&nbsp;%
				<%} else if (String.valueOf(ICollateralLimitMap.CHARGE_INFO_AMOUNT_USAGE).equals(form.getAmountDrawIndicator())) { %>
					<bean:write name="PledgeForm" property="currency"/>&nbsp;<bean:write name="PledgeForm" property="amountDraw"/>
				<%} %>&nbsp;
				</td>
				</tr>
			</tbody>
		</table>
		</td>
		</tr>
	</tbody>
</table>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    
    <tr>
    <td colspan="2" width="100" valign="baseline" align="center">
        <a href="<%=actionNameStr%>?event=<%=CollateralAction.EVENT_READ_RETURN%>&from_event=<%=request.getParameter("from_event")%>&subtype=<%=request.getParameter("subtype")%>" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)">
            <img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>
    </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>
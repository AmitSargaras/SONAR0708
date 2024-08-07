<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	int rowIdx = Integer.parseInt(request.getParameter("rowIdx"));
%>
<script language="JavaScript" type="text/JavaScript">
	function setPhysInspStat(val){
        if (val == '1') {
            document.getElementById("spanPIS").style.visibility = "visible";
        } else if (val == '0') {
            document.getElementById("spanPIS").style.visibility = "hidden";
        }
    }
</script>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname"><bean:message
		key="label.maturity.date" /><span
		class="mandatoryPerfection">*</span></td>
	<td><html:text property="collateralMaturityDate" readonly="true"
		size="15" maxlength="11" /> <img src="img/calendara.gif"
		name="Image723" border="0" id="Image723"
		onclick="showCalendar('collateralMaturityDate', 'dd/mm/y')"
		onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
		onmouseout="MM_swapImgRestore()" /> <html:errors
		property="collateralMaturityDate" /></td>
		<td>
                &nbsp;
                </td>
                <td>
                &nbsp;
                </td>
	<%--<td class="fieldname"><bean:message
		key="label.security.physical.inspection.status" />
		<span id="spanPIS" style="visibility:hidden"><bean:message key="label.mandatory"/></span></td>
	<td><html:select property="inspectionStatus">
		<integro:common-code categoryCode="<%=CategoryCodeConstant.PHYSICAL_INSPECTION_STATUS %>" />
	</html:select><html:errors property="inspectionStatus" /></td>
--%></tr>
<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.price.list"/>
	&nbsp;<span><bean:message key="label.mandatory"/></span></td>
    <td><html:text property="plist" maxlength="15"/> &nbsp; <html:errors property="plist"/></td>
    <td class="fieldname">&nbsp;</td>
    <td>&nbsp;</td>
</tr>--%>
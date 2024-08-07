<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="java.util.Iterator"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
	int rowIdx = Integer.parseInt(request.getParameter("rowIdx"));
	String formName = request.getParameter("formName");
%>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname">
		<bean:message key="label.security.asset.purchase.price"/><bean:message key="label.mandatory"/></td>
    <td><html:text property="purchasePrice" maxlength="15"/>&nbsp;
        &nbsp; <html:errors property="purchasePrice"/></td>
    <td class="fieldname">
        <bean:message key="label.security.asset.purchase.date"/></td>
    <td><html:text property="datePurchase" readonly="true" size="15" maxlength="11"/>
            <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('datePurchase', 'dd/mm/y')"
                 onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
            &nbsp;<html:errors property="datePurchase"/></td>
<!--    <td class="fieldname"><bean:message key="label.security.purchase.currency"/> </td>
    <td><html:select property="vesselPurchaseCurrency"  >
            <option value="" ><bean:message key="label.please.select"/></option>
            <html:options name="currencyCode" labelName="currencyCode"/>
        </html:select>&nbsp;
        <html:errors property="vesselPurchaseCurrency"/></td>-->
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.residual.asset.life"/></td>
    <td><bean:write name="<%=formName%>" property="residualAssetLife"/>&nbsp;
        <bean:write name="<%=formName%>" property="residualAssetLifeUOM"/></td>
    <td class="fieldname"><bean:message key="label.security.asset.residual.scrap.value"/></td>
    <td><html:text property="vesselScrapValue" maxlength="15"/>
        &nbsp;<html:errors property="vesselScrapValue"/></td>
</tr>

<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname"><bean:message key="label.security.asset.asset.value"/>&nbsp;
		<span id="spanASSETVALUE" >
			<bean:message key="label.mandatory"/></span></td>
	<td><html:text property="vesselAssetValue" maxlength="15"/>&nbsp;
		<html:errors property="vesselAssetValue"/></td>
	<td class="fieldname"><bean:message key="label.security.asset.ageofasset"/> </td>
	<td><span id="docPerfectAge"></span><bean:write name="<%=formName%>" property="vesselDocPerfectAge"/></td>
</tr>
				
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.asset.value"/></td>
    <td><html:text property="vesselAssetValue" maxlength="15"/>
        &nbsp;<html:errors property="vesselAssetValue"/></td>
    <td class="fieldname"><bean:message key="label.security.asset.ageofasset"/></td>
<!--    <td><html:text property="vesselDocPerfectAge" maxlength="15" readonly="true"/>
        &nbsp;Year(s)<html:errors property="vesselDocPerfectAge"/></td>-->
    <td><span id="spanVesselDocPerfectAge">0</span>&nbsp;Years(s)</td>
		<html:hidden property="vesselDocPerfectAge"/>
</tr>--%>

<%--
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname"><bean:message key="label.security.leaseAgreement.exchange.control.approval.obtained"/></td>
	<td><html:select property="approvalObtained">
			<integro:common-code
				categoryCode="<%=CategoryCodeConstant.OPTION_LIST%>" />
		</html:select><html:errors property="approvalObtained" /></td>
	<td class="fieldname"><bean:message key="label.security.leaseAgreement.exchange.control.date"/></td>
	<td><html:text property="approvalDate" readonly="true" size="15" maxlength="11"/>
            <img src="img/calendara.gif" name="Image723" border="0" id="Image723" onclick="showCalendar('approvalDate', 'dd/mm/y')"
                 onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
            &nbsp;<html:errors property="approvalDate"/></td>
</tr>
--%>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname"><bean:message key="label.security.asset.tradein.value"/></td>
	<td><html:text property="tradeInValue" maxlength="15"/>
        &nbsp;<html:errors property="tradeInValue"/></td>
	<td class="fieldname"><bean:message key="label.security.asset.tradein.deposit"/></td>
	<td><html:text property="tradeInDeposit" maxlength="15"/>
        &nbsp;<html:errors property="tradeInDeposit"/></td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.asset.remarks.sec.env.risk"/> </td>
    <td colspan="3">
        <html:textarea property="remarkEnvRisk" rows="5" cols="120" style="width:100%" />
        &nbsp; <html:errors property="remarkEnvRisk"/></td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="fieldname"><bean:message key="label.security.description.vessel"/></td>
    <td colspan="3">
        <html:textarea property="description" rows="5" cols="120" style="width:100%" />&nbsp;
        <html:errors property="description"/></td>
</tr>



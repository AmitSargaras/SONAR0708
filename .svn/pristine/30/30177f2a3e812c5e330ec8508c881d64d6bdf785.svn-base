<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil" %>
<%@ page import="com.integrosys.cms.ui.common.FrequencyList" %>
<%@ page import="com.integrosys.cms.ui.collateral.BookingLocationList" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.ui.collateral.ExchangeControlList" %>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>


			<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/common/common_physical_inspection_read.jsp" %>
			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
			        <bean:message key="label.security.maturity.date"/>&nbsp;
			        <span class="mandatoryPerfection">*</span></td>
			    <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>" />&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isCGCPledged")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><integro:boolean-display style="yn" value="<%=iCol.getIsCGCPledged()%>"/></td>
			</tr>

			<%@ include file="/collateral/assetbased/asset_environment_risk_read.jsp" %>
			<%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
			<%@ include file="/collateral/common/common_fields_read.jsp" %>

<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.loc"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
	<td colspan="3"><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getCollateralLocation())%>" />&nbsp;</td>
</tr>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"securityOrganization")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<span class=stp><bean:message key="label.branch.name"/></span>&nbsp;<span class="mandatory">*</span></td>
	<td colspan="3"><%String orgCode=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,iCol.getSecurityOrganization())+ " ("+iCol.getSecurityOrganization()+")";%>
		<integro:empty-if-null value="<%=orgCode%>" />&nbsp;</td>
</tr> 
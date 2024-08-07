<%@ page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%-- <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">
		<bean:message key="label.security.loc"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
	<td colspan="3"><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getCollateralLocation())%>" />&nbsp;</td>
</tr> --%>


<tr>
    <td colspan="2" align="center">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"primarySecurityAddress")?"fieldname":"fieldnamediff"):"fieldname"%>">
		Primary Security - Address</td>
		<td width="30%"><integro:wrapper value="<%=iCol.getPrimarySecurityAddress()%>" lineLength="45"/></td>
		
		<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"securityValueAsPerCAM")?"fieldname":"fieldnamediff"):"fieldname"%>">
		Security value required as per CAM</td>
		<td width="30%">
		<integro:date object="<%=iCol.getSecurityValueAsPerCAM()%>"/>
		</td>
</tr> 

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"secondarySecurityAddress")?"fieldname":"fieldnamediff"):"fieldname"%>">
		Secondary Security - Address</td>
		<td width="30%"><integro:wrapper value="<%=iCol.getSecondarySecurityAddress()%>" lineLength="45"/></td>
		
		<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"securityMargin")?"fieldname":"fieldnamediff"):"fieldname"%>">
		Security Margin</td>
		<td width="30%"><integro:empty-if-null value="<%=iCol.getSecurityMargin()%>"/></td>
</tr> 


<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"chargePriority")?"fieldname":"fieldnamediff"):"fieldname"%>">
		Charge Priority</td>
		<td width="30%"><integro:empty-if-null value="<%=iCol.getChargePriority()%>"/></td>
		
		<td class="fieldname"></td>
		<td width="30%"></td>
</tr> 
</tbody>
		</table>
	</td>
</tr>
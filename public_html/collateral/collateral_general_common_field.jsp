<%@page import="com.integrosys.cms.app.collateral.bus.ICollateral"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,java.util.List,org.apache.struts.util.LabelValueBean,java.util.Iterator"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge"%>
<%@page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@page import="java.util.ArrayList"%>

<%

/* ICollateralTrxValue itrxValueNew = (ICollateralTrxValue) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.serviceColObj");
Locale localeNew = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
//System.out.println("<<<<<<<<<<<CERSAI TEST>>>>>>>>>>>"+itrxValue7.getStagingCollateral().getCersaiId());
ICollateral objIColNew = itrxValueNew.getStagingCollateral();
CollateralForm aFormNew = (CollateralForm) request.getAttribute(formName);
if(itrxValueNew!=null && itrxValueNew.getStagingCollateral()!=null && aFormNew != null){

	 ICollateral objIColNew = itrxValueNew.getStagingCollateral(); 
	//if (StringUtils.isNotBlank(objIColNew.getSecurityValueAsPerCAM())) {
		aFormNew.setSecurityValueAsPerCAM(UIUtil.mapOBDate_FormString(localeNew, objIColNew.getSecurityValueAsPerCAM()));
	//}
}

String primaryAddress = objIColNew.getPrimarySecurityAddress();
// String securityValueAsPerCAM = iCol.getSecurityValueAsPerCAM();	
 String secondarySecurityAddress = objIColNew.getSecondarySecurityAddress();
 String securityMargin = objIColNew.getSecurityMargin();
 String chargePriority = objIColNew.getChargePriority(); */

 Locale localeNew = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."+ com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
 String primaryAddress = iCol.getPrimarySecurityAddress();
 String secondarySecurityAddress = iCol.getSecondarySecurityAddress();
 String securityMargin = iCol.getSecurityMargin();
 String chargePriority = iCol.getChargePriority(); 
 String securityValueAsPerCAM = UIUtil.mapOBDate_FormString(localeNew, iCol.getSecurityValueAsPerCAM())	;
%>

<tr>
    <td colspan="2" align="center">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">

		<td class="fieldname">Primary Security - Address</td>
		
        <td><html:text property="primarySecurityAddress" styleId="primarySecurityAddress" maxlength="200" value ="<%=primaryAddress%>"/>	
		
	<td class="fieldname">Security value required as per CAM</td>
    
		<td class="even">
	            		<html:text property="securityValueAsPerCAM" name="<%=formName %>" value="<%=securityValueAsPerCAM %>" readonly="true"/> 
	            		<img src="img/calendara.gif" alt="calender" name="Image723" border="0" id="Image725" onclick="showCalendar('securityValueAsPerCAM', 'dd/mm/y')"
						onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)"
						onmouseout="MM_swapImgRestore()" />&nbsp;
						<html:errors property="securityValueAsPerCAM" />
				</td>
	
</tr> 

<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">

		<td class="fieldname">Secondary Security - Address</td>	
	<td><html:text property="secondarySecurityAddress" styleId="secondarySecurityAddress" maxlength="200" value ="<%=secondarySecurityAddress%>" />	
	
	<td class="fieldname">Security Margin</td>
    
		<td><html:text property="securityMargin" maxlength="5" value ="<%=securityMargin%>" />&nbsp;
		<html:errors property="securityMarginError" />
		</td>
</tr> 



<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">

			<td class="fieldname">Charge Priority</td>
			<td><html:select property="chargePriority" styleId="chargePriority1" value="<%=chargePriority%>">
			<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_CHARGE_PRIORITY%>" descWithCode="false" />
			</html:select> 
			<html:errors property="chargePriority" /></td>
			<td class="fieldname"></td>
    
    	<td>
            
		</td>
	
</tr> 

</tbody>
		</table>
	</td>
</tr>

<script>

</script>
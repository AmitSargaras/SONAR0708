<%@page import="com.integrosys.cms.app.collateral.bus.ICollateral"%>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,java.util.List,org.apache.struts.util.LabelValueBean,java.util.Iterator"%>
<%@ page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@ page import="com.integrosys.cms.app.collateral.bus.type.asset.subtype.gcharge.IGeneralCharge,
				com.integrosys.cms.ui.collateral.assetbased.assetgencharge.AssetGenChargeForm"%>

<%
	AssetGenChargeForm form = (AssetGenChargeForm) request.getAttribute("AssetGenChargeForm");
	pageContext.setAttribute("AssetGenChargeForm", form);
	String collateralLoc=(String)request.getAttribute("collateralLoc");
	
	List orgList = new ArrayList();
	if(prefix.equals("Other"))
	{
		  orgList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.others.OthersAction.orgList");
		 // orgList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.others.othersa.OthersaAction.orgList");
		  
	}
	else if(prefix.equals("Asset"))
	{
		  orgList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.orgList"); 
	}
	else if(prefix.equals("Ins"))
	{
		  orgList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.insprotection.InsProtectionAction.orgList"); 
	}
	else if(prefix.equals("Mark"))
	{
		  orgList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction.orgList"); 
	}
	else if(prefix.equals("Cash"))
	{
		  orgList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.cash.CashAction.orgList"); 
	}
	else if(prefix.equals("Gte"))
	{
		  orgList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction.orgList"); 
	}
	else if(prefix.equals("NoCollateral"))
	{
		  orgList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.nocollateral.NoCollateralAction.orgList"); 
	}
	else if(prefix.equals("Property"))
	{
		  orgList = (List)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.orgList"); 
	}
   
	pageContext.setAttribute("orgList",orgList);
	
%>


<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">

	<td class="fieldname">
		<bean:message key="label.security.loc"/>
		
	</td>

	<td colspan="3">

		<html:select property="collateralLoc" onchange="changeOrgByCountry()" disabled="true" >

			<option value="" >
				<bean:message key="label.please.select"/>
			</option>

			<html:options name="countryValues" labelName="countryLabels"/>

		</html:select>

		<html:errors property="collateralLoc"/>
	</td>
	
</tr>
 --%>
<%@page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@page import="java.util.ArrayList"%><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname">
		<bean:message key="label.security.loc"/> </td>
	<td width="30"><%--<integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getCollateralLocation())%>" />&nbsp; --%>
<integro:empty-if-null value="<%=countryNme%>" />&nbsp;</td>

	<td class="fieldname">
	<bean:message key="label.security.backend.code.name"/> </td>
	<td width="30%">
	<%String collCode = "";
	if(iCol.getCollateralCode()!=null){
	collCode = iCol.getCollateralCode();
	}
	 %>
	<html:select property="collateralCode"  value="<%=collCode%>" disabled="true">
		      <option value="">Please Select </option>	
                      <html:options collection="collateralList" property="value" labelProperty="label"/>
                    </html:select>&nbsp;
		    &nbsp;<html:errors property="collateralCode" />	
	</td>
	<html:hidden property="colCodeHiddenValue" value="<%=collCode%>"/>
</tr>
 <%-- Add by govind s:collateralLoc --%>
<html:hidden property="collateralLoc"/>

<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	<td class="fieldname">
		<span > <bean:message key="label.branch.name"/></span>
		
	</td>

	<td colspan="3">

		<html:select property="securityOrganization" disabled="true">
			<integro:common-code categoryCode="<%= ICMSConstant.CATEGORY_CODE_BKGLOC%>" descWithCode="true"/>

			<option value="" >
				<bean:message key="label.please.select"/>
			</option>

			<html:options name="organizationValues" labelName="organizationLabels"/>

		</html:select>

		<html:errors property="securityOrganization"/>

	</td>
<td colspan="3"><%String orgCode=CommonDataSingleton.getCodeCategoryLabelByValue(ICMSConstant.ORG_CODE,iCol.getSecurityOrganization())+ " ("+iCol.getSecurityOrganization()+")";%>
		<integro:empty-if-null value="<%=orgCode%>" />
		&nbsp; </td>
	<input type="hidden" name="isOrgChange" value="N"/>
</tr>
--%>
<%String brCode = "";
	if(iCol.getSecurityOrganization()!=null){
		brCode = iCol.getSecurityOrganization();
	}
	//System.out.println("brCode ==>"+ brCode);
	 %>
<input type="hidden" name="isOrgChange" value="N"/>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
<%if(prefix.equals("Property")){ %>
	<td class="fieldname">
		<span ><bean:message key="label.branch.name"/>&nbsp;<span class="mandatoryPerfection">*</span></span></td>		
		<%}else{ %>
		<td class="fieldname">
		<span ><bean:message key="label.branch.name"/></span></td>	
		<%} %>
	<td ><html:select styleId="SO" property="securityOrganization"  value="<%=brCode%>" onchange="javascript:refreshBranchDetail(this);">
      <option value="">Please Select </option>	
         <html:options collection="orgList" property="value" labelProperty="label" />
      </html:select>&nbsp;<html:errors property="securityOrganization" />
	</td>
	<%	
	String typeOfCharge = "";
	ICollateral oldCollateral1 = null;
	if (ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE.equals(iCol.getCollateralSubType().getSubTypeCode())) { 
		oldCollateral1 = (IGeneralCharge) itrxValue.getStagingCollateral();
		typeOfCharge = oldCollateral1.getTypeOfCharge();
	}
	%>
	
	<%	if (ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE.equals(iCol.getCollateralSubType().getSubTypeCode())) { 
	%>
	<td class="fieldname">Type of Charge<font color="#FF0000">*
	</font>
	</td>
    
    	<td>
            <html:select property ="typeOfCharge" styleId="typeOfCharge" value ="<%=typeOfCharge%>" >
			<integro:common-code categoryCode="<%=CategoryCodeConstant.CommonCode_TYPE_CHARGE%>" descWithCode="false" />
			</html:select>
			<html:errors property="typeOfCharge" />
		</td>
	<%} %>
</tr> 



<%	if (ICMSConstant.COLTYPE_ASSET_GENERAL_CHARGE.equals(iCol.getCollateralSubType().getSubTypeCode())) { %>
	<tr class="<%=(rowIdx++) % 2 == 0 ? "even" : "odd"%>">
		<td class="fieldname">Banking Arrangement<font color="#FF0000">*</font></td>
		<td><html:select property="bankingArrangement" styleId="bankingArrangement" style="width:250px">
				<integro:common-code descWithCode="false"
					categoryCode="<%=com.integrosys.cms.ui.limit.CategoryCodeConstant.BANKING_ARRANGEMENT%>" />
			</html:select> <html:errors property="bankingArrangementError" /></td>
		<td class="fieldname"></td>
		<td></td>
	</tr>
	
<% } %>


<script>
<!--
	function changeOrgByCountry() {
		enableAllFormElements();
		document.forms[0].event.value = "prepare_form";
		document.forms[0].isOrgChange.value = 'Y';
		document.forms[0].submit();
	}
//-->
</script>
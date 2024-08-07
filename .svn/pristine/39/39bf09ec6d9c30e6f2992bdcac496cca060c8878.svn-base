<%@page import="java.math.BigDecimal"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@ page import="java.util.*,
				com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
				com.integrosys.cms.app.collateral.bus.type.property.IPropertyCollateral,
				com.integrosys.cms.ui.collateral.property.CategoryLandUseList,
				com.integrosys.cms.ui.collateral.property.LandAreaUOMList,
                com.integrosys.cms.ui.common.FrequencyList,				
				com.integrosys.cms.ui.collateral.property.PropertyTypeList,
				com.integrosys.cms.ui.collateral.property.PropertyUsageList,
				com.integrosys.cms.ui.collateral.property.PropertyCompletionStatusList,
				com.integrosys.cms.ui.collateral.property.RealEstateUsageList,
				com.integrosys.cms.ui.common.CommonCodeList,	
				com.integrosys.cms.ui.collateral.CategoryCodeConstant,
				com.integrosys.cms.app.common.constant.ICMSConstant,
                com.integrosys.cms.ui.collateral.ExchangeControlList,
                com.integrosys.cms.ui.collateral.LEList,                 				
                com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%

	String actionStr1 = "com.integrosys.cms.ui.collateral.property.PropertyAction";
	ICollateralTrxValue itrxValue1 = (ICollateralTrxValue)session.getAttribute(actionStr1+".serviceColObj");
	
	Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	
	IPropertyCollateral oldCollateral1 = (IPropertyCollateral) itrxValue1.getCollateral();
	IPropertyCollateral newCollateral1 = (IPropertyCollateral) itrxValue1.getStagingCollateral();
	

	String fromEvent1 = request.getParameter("fromEvent");
	IPropertyCollateral iCol1 = "read".equals(fromEvent1)?
			(IPropertyCollateral)itrxValue1.getCollateral():(IPropertyCollateral) itrxValue1.getStagingCollateral();
	
	String isProcess1Str1 = request.getParameter("isProcess");
	boolean isProcess1 = isProcess1Str1.equals("true");
	String subtype1 = request.getParameter("subtype");
	String formName1 = subtype1+"Form";	
	//PropertyForm colForm = (PropertyForm) request.getAttribute(formName1);
	int rowIdx1= Integer.parseInt(request.getParameter("rowIdxInteger"));
	
	String cityName_v1 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cityName_v1");
	String stateName_v1 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.stateName_v1");
	String regionName_v1 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.regionName_v1");
	String countryName_v1 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.countryName_v1");
	
	String valuationAgencyName_v1 = (String) request.getAttribute("valuationAgencyName_v1");
	System.out.println("formName1:"+formName1+" countryName_v1:"+countryName_v1 );
	
	CommonCodeList commonCodeCategoryofLandUse = CommonCodeList .getInstance(null, null, CategoryCodeConstant.CATEGORY_OF_LAND_USE, null);
	String totalAmt_v1=null;
	
	
	if(iCol1.getTotalPropertyAmount_v1()!=null){
	Amount amt_v1=iCol1.getTotalPropertyAmount_v1();
	totalAmt_v1=amt_v1.getAmountAsBigDecimal().toString();
	}
	
	System.out.println("subtype1:"+subtype1);
	List preValDateList_v1 = null;
	preValDateList_v1 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.preValDateList_v1");
	
	System.out.println(" view preValDateList_v1:"+preValDateList_v1);
	pageContext.setAttribute("preValDateList_v1", preValDateList_v1);
	
	
	String cityName_v2 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cityName_v2");
	String stateName_v2 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.stateName_v2");
	String regionName_v2 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.regionName_v2");
	String countryName_v2 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.countryName_v2");
	
	String valuationAgencyName_v2 = (String) request.getAttribute("valuationAgencyName_v2");
	
	String cityName_v3 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cityName_v3");
	String stateName_v3 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.stateName_v3");
	String regionName_v3 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.regionName_v3");
	String countryName_v3 = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.countryName_v3");
	
	String valuationAgencyName_v3 = (String) request.getAttribute("valuationAgencyName_v3");
	System.out.println("formName1:"+formName1+" countryName_v3:"+countryName_v3 );
	
	//CommonCodeList commonCodeCategoryofLandUse = CommonCodeList .getInstance(null, null, CategoryCodeConstant.CATEGORY_OF_LAND_USE, null);
	String totalAmt_v3=null;
	
	
	if(iCol1.getTotalPropertyAmount_v3()!=null){
	Amount amt_v3=iCol1.getTotalPropertyAmount_v3();
	totalAmt_v3=amt_v3.getAmountAsBigDecimal().toString();
	}
	
	
%>


<%@page import="com.integrosys.cms.ui.collateral.property.propcommgeneral.PropCommGeneralForm"%>
<%@page import="com.integrosys.cms.ui.collateral.property.PropertyForm"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@page import="com.integrosys.base.businfra.currency.Amount"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>	

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname" width="20%"><bean:message key="label.security.property.revaluationOverride"/></td>
			
<%--             <td width="30%"><html:checkbox name="PropCommGeneralForm" property="revalOverride" styleClass="nonedit" styleId="revalOverride" /></td>
 --%>		 
 					<td width="30%">
								<%if(newCollateral1.getRevalOverride() != null && "on".equals(newCollateral1.getRevalOverride().trim())){ %>
									<input type="checkbox" checked="checked" disabled="disabled">
								<%}else{ %>
									<input type="checkbox" disabled="disabled">	
								<%} %>
							</td>
 
            <td  width="20%"></td>
			<td width="30%"></td>
		
		</tr>
		</table>
		</td>
	</tr>
 </tbody>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="label.security.property.valuation1"/></h3></td>
     </tr>
        <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="50%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<%-- <td class="fieldname" width="20%">&nbsp;</td>
			<td width="30%"><html:select name="PropCommGeneralForm" property="preValDate_v1"  styleId="preValDate_v1" >
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="preValDateList_v1" labelProperty="label" property="value" />
              	</html:select>&nbsp;
              
			</td> --%>
		    <td class="fieldname" width="20%"><bean:message key="label.security.property.revaluation"/></td>
			<td width="30%"><integro:date object="<%=newCollateral1.getValcreationdate_v1() %>"/>&nbsp;</td>
			
		</tr>
		</table>
		</td>
	</tr>
 </tbody>
</table>

	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
     <tr> 
      <td> <h3><bean:message key="title.property.information"/></h3></td>
   </tr>        
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
	
<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"totalPropertyAmount_v1")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
			Total Property Amount <span class="mandatoryPerfection"> * </span></td>
			<%if(totalAmt_v1!=null){ %>
			<td width="30%">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
						<td style="border:none">
							<span class="totalAmt_v1_InNum">
								<integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),totalAmt_v1)%>" />
							</span>&nbsp;
						</td>
						<td style="border:none">
							<textarea id="totalAmt_v1_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
					<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
						<td colspan="2">
							<html:errors property="loaMasterTotalPropertyV1Error"/>
						</td>
					</tr>
				</table>
			 </td>
			<%}else{ %>
			<td width="30%">-&nbsp;</td>
			<%} %>
				<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"valuationDate_v1")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
				Date of Valuation&nbsp; <span class="mandatoryPerfection"> * </span></td>
				<%if(iCol1.getValuationDate_v1()!=null){ %>
				<td width="30%"><integro:date object="<%=iCol1.getValuationDate_v1()%>"/>&nbsp;</td>
				<%}else{ %>
				<td width="30%">-&nbsp;</td>
				<%} %>
			
				</tr>
	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"valuatorCompany_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">Valuation Company &nbsp;<span class="mandatoryPerfection"> * </span></td>
			<td >
				<integro:empty-if-null value="<%=valuationAgencyName_v1%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="valuatorCompany_v1"/>&nbsp;
			</td>
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"categoryOfLandUse_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">Category of Land Used </td>
			<td><integro:empty-if-null value="<%=commonCodeCategoryofLandUse.getCommonCodeLabel(iCol1.getCategoryOfLandUse_v1()) %>"/>&nbsp;</td>
		</tr>	

	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"developerName_v1")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.property.dev.occu.name"/>
		  	</td>
			<td><integro:wrapper  value="<%=newCollateral1.getDeveloperName_v1() %>"/>&nbsp;</td>
				
	</tr>
	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"country_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.country"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=countryName_v1%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="country_v1"/>&nbsp;
			</td>
			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"region_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.region"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=regionName_v1%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="region_v1"/>
			</td>
		</tr>
			
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"locationState_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.state"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=stateName_v1%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="locationState_v1"/>&nbsp;
			</td>
			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"nearestCity_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.city"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=cityName_v1%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="nearestCity_v1"/>&nbsp;
			</td>
		</tr>

		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"pinCode_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">Pincode</td>
			<%if(iCol1.getPinCode_v1()!=null && !iCol1.getPinCode_v1().equals("")){ %>
			<td><%=iCol1.getPinCode_v1() %>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>		
			
			
		</tr>

		
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?((CompareOBUtil.compOB(newCollateral1,oldCollateral1,"landArea_v1") && CompareOBUtil.compOB(newCollateral1,oldCollateral1,"landAreaUOM_v1"))?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.land.area"/>
				<%if(subtype1.equals("PropLandUrban")||subtype1.equals("PropAgri")){ %>
				<span class="mandatoryPerfection">*</span>
				<% }%>
				</td>
				
				<%if(iCol1.getLandArea_v1()!=0){ %>
				    <td><%=String.valueOf(iCol1.getLandArea_v1()) %>&nbsp;<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,iCol1.getLandAreaUOM_v1())%>"/></td>
				<%}else{ %>
					<td>-&nbsp;</td>
					<%} %>
			
				<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"inSqftLandArea_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.property.land.area.sqft"/>
				</td>
				
				<%if(iCol1.getInSqftLandArea_v1()!=0){ %>
					<td><%=new BigDecimal(iCol1.getInSqftLandArea_v1()) %>&nbsp;</td>
				<%}else{ %>
					<td>-&nbsp;</td>
				<%} %>
						
		</tr>
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<%if(!((subtype1.equals("PropLandUrban"))||(subtype1.equals("PropAgri")))){%>
		    <td class="<%=isProcess1?((CompareOBUtil.compOB(newCollateral1,oldCollateral1,"builtupArea_v1") && CompareOBUtil.compOB(newCollateral1,oldCollateral1,"builtupAreaUOM_v1"))?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.build.up.area"/>
				<%
				String aa = PropertyCompletionStatusList.getInstance ().getPropertyCompletionStatusLabel (""+iCol1.getPropertyCompletionStatus_v1 ());
				if(aa!=null){
				if(!(aa.equals("Under Construction")||aa.equals(""))){ %>
					<%--<span class="mandatoryPerfection"> * </span>
				--%><%}}%>
				<span class="mandatoryPerfection"> * </span>
				</td>
			<%if(iCol1.getBuiltupArea_v1()!=0){ %>
				    <td><%=String.valueOf(iCol1.getBuiltupArea_v1()) %> &nbsp; <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,iCol1.getBuiltupAreaUOM_v1())%>" /></td>
			<%}else{ %>
					<td>-&nbsp;</td>
					<%} }else{%>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
			<%} %>
			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"inSqftBuiltupArea_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.build.up.area.sqft"/>
				
				</td>
				<%if(iCol1.getInSqftBuiltupArea_v1()!=0){ %>
			<td colspan="3"><%=String.valueOf(iCol1.getInSqftBuiltupArea_v1()) %>&nbsp;</td>
			<%}else{ %>
			<td colspan="3">-&nbsp;</td>
			<%} %>
			
		   
		</tr>
		<!-- Start Santosh -->
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Land Value 
				<%
				if(null!=iCol1.getPropertyType() && PropertyTypeList.getInstance().getPropertyTypeLabel(iCol1.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
						<td style="border:none">
							<span class="landValue_v1_InNum"><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol1.getLandValue_v1()))%></span>
						</td>
						<td style="border:none">
							<textarea id="landValue_v1_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
			</td>
			<td class="fieldname">
				Building Value 
				<%if(null!=iCol1.getPropertyType() &&!PropertyTypeList.getInstance().getPropertyTypeLabel(iCol1.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
						<td style="border:none">
							<span class="buildingValue_v1_InNum"><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol1.getBuildingValue_v1()))%></span>
						</td>
						<td style="border:none">
							<textarea id="buildingValue_v1_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Reconstruction value of the Building 
				<%if(null!=iCol1.getPropertyType() && !PropertyTypeList.getInstance().getPropertyTypeLabel(iCol1.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
						<td style="border:none">
							<span class="reconstructionValueOfTheBuilding_v1_InNum"><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol1.getReconstructionValueOfTheBuilding_v1()))%></span>
						</td>
						<td style="border:none">
							<textarea id="reconstructionValueOfTheBuilding_v1_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
			</td>	
		<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"propertyCompletionStatus_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.completion.status"/></td>
		  	<td><integro:empty-if-null value='<%= PropertyCompletionStatusList.getInstance ().getPropertyCompletionStatusLabel (""+iCol1.getPropertyCompletionStatus_v1 ()) %>'/>&nbsp;</td>
		
		</tr>
		<!-- End Santosh -->
</table>
</td></tr></tbody>
</table>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="label.security.additional.information"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
		
	     <tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
    <td width="20%" class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"isPhysicalInspection_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification"/>&nbsp;<%--<span class="mandatoryPerfection">*</span></td>--%><span class="mandatoryPerfection">*</span></td>
    <td width="30%" ><integro:boolean-display style="yn" value="<%=iCol1.getIsPhysicalInspection_v1()%>"/>&nbsp;</td>
    <% boolean physicalUpdated = false;
        if (isProcess1) {
            physicalUpdated = CompareOBUtil.compOB(newCollateral1, oldCollateral1, "physicalInspectionFreq")||(iCol1.getPhysicalInspectionFreq() < 0);
            physicalUpdated = physicalUpdated && CompareOBUtil.compOB(newCollateral1, oldCollateral1, "physicalInspectionFreqUnit_v1");
        }
    %>
    <td class="<%=isProcess1?(physicalUpdated?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification.frequency"/><span class="mandatoryPerfection">*</span>
       
    </td>
    
        <% if (iCol1.getPhysicalInspectionFreqUnit_v1()!=null){ %>
        <td>
        <integro:common-code-single entryCode="<%=iCol1.getPhysicalInspectionFreqUnit_v1()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
        <% }else{ %>
        <td>-&nbsp;</td>
        <%} %>
        &nbsp;
    
</tr>
  <tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
	            <% if (iCol1.getIsPhysicalInspection_v1()) { %>
	                    <td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"lastPhysicalInspectDate_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                        <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% } else { %>
	                <td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"lastPhysicalInspectDate_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% }%>
	            <%if( iCol1.getLastPhysicalInspectDate_v1()!=null){%>
	            <td><integro:date object="<%=iCol1.getLastPhysicalInspectDate_v1() %>"/>&nbsp;</td>
	            <%}else {%>
	            <td>-&nbsp;</td>
	            <%} %>
	            <td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"nextPhysicalInspectDate_v1")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            <bean:message key="label.security.next.phy.verification.date"/><span class="mandatoryPerfection">*</span></td>
	            <%if(iCol1.getNextPhysicalInspectDate_v1()!=null){ %>
	            <td><integro:date object="<%=iCol1.getNextPhysicalInspectDate_v1()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td>-&nbsp;</td>
	            <%} %>
	            
	        </tr>
			
			<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">              
		  <td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"remarksProperty_v1")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.remarks"/></td>
		  <td colspan="3"><integro:wrapper value="<%=iCol1.getRemarksProperty_v1()%>" />&nbsp;</td>
		</tr>
		</table>
	</td></tr>
	</tbody>
	</table>
	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
		<thead>
    		<tr>
      			<td> <h3><bean:message key="label.security.property.valuation2"/></h3></td>
     		</tr>
        	<tr>
      			<td><hr/></td>
    		</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<td class="fieldname" width="20%"><bean:message key="label.security.property.valuation2.waiver"/></td>
							<td width="30%">
								<%if(iCol1.getWaiver() != null && iCol1.getWaiver().trim().equals("on")){ %>
									<input type="checkbox" checked="checked" disabled="disabled">
								<%}else{ %>
									<input type="checkbox" disabled="disabled">	
								<%} %>
							</td>
							<td class="fieldname" width="20%">
								<bean:message key="label.security.property.valuation2.deferral"/></td>
							<td width="30%">
								<%if(iCol1.getDeferral() != null && iCol1.getDeferral().trim().equals("on")){ %>
									<input type="checkbox" checked="checked" disabled="disabled">
								<%}else{ %>
									<input type="checkbox" disabled="disabled">	
								<%} %>
							</td>
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<td class="fieldname" width="20%">
								<bean:message key="label.security.property.valuation2.deferralId"/>&nbsp;
								<span class="mandatoryPerfection" id="deferralId"> * </span>
							</td>
							<td width="30%"><%=iCol1.getDeferralId() == null ? "-" : iCol1.getDeferralId()%></td>
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<!-- <td class="fieldname" width="20%">&nbsp;</td>
							<td width="30%">&nbsp;</td> -->
		    				<td class="fieldname" width="20%"><bean:message key="label.security.property.revaluation"/></td>
							<td width="30%"><integro:date object="<%=newCollateral1.getValcreationdate_v2() %>"/>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
 		</tbody>
	</table>
	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
		<thead>
     		<tr> 
      			<td><h3><bean:message key="title.property.information"/></h3></td>
   			</tr>        
    		<tr>
      			<td><hr/></td>
    		</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"totalPropertyAmount_v2")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
								Total Property Amount <span class="mandatoryPerfection"> * </span>
							</td>
							<%if(iCol1.getTotalPropertyAmount_v2()!=null){ %>
							<td width="30%">
								<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
									<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>">
										<td style="border:none">
				 							<span class="totalPropertyAmount_v2_InNum"><integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),
				 								iCol1.getTotalPropertyAmount_v2().getAmountAsBigDecimal().toString())%>" /></span>	&nbsp;
				 						</td>
				 						<td style="border:none">
				 							<textarea id="totalPropertyAmount_v2_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
				 						</td>
				 					</tr>

									<tr class="<%=(rowIdx1) % 2 == 0 ? "even" : "odd"%>">
										<td colspan="2"><html:errors property="loaMasterTotalPropertyV2Error" /></td>
									</tr>
							</table>		
			 				</td>
							<%}else{ %>
							<td width="30%">-&nbsp;</td>
							<%} %>
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"valuationDate_v2")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
								Date of Valuation&nbsp; <span class="mandatoryPerfection"> * </span>
							</td>
							<%if(iCol1.getValuationDate_v2()!=null){ %>
							<td width="30%"><integro:date object="<%=iCol1.getValuationDate_v2()%>"/>&nbsp;</td>
							<%}else{ %>
							<td width="30%">-&nbsp;</td>
							<%} %>
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"valuatorCompany_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								Valuation Company &nbsp;<span class="mandatoryPerfection"> * </span>
							</td>
							<td>
								<integro:empty-if-null value="<%=valuationAgencyName_v2%>"/>&nbsp;
								<html:hidden name="<%=formName1%>" property="valuatorCompany_v2"/>&nbsp;
							</td>
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"categoryOfLandUse_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								Category of Land Used 
							</td>
							<td>
								<integro:empty-if-null value="<%=commonCodeCategoryofLandUse.getCommonCodeLabel(iCol1.getCategoryOfLandUse_v2()) %>"/>&nbsp;
							</td>
						</tr>	
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"developerName_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.property.dev.occu.name"/>
			  				</td>
							<td><integro:wrapper value="<%=newCollateral1.getDeveloperName_v2() %>"/>&nbsp;</td>
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">			
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"country_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.country"/><span class="mandatoryPerfection"> * </span></td>
							<td>
								<integro:empty-if-null value="<%=countryName_v2%>"/>&nbsp;
								<html:hidden name="<%=formName1%>" property="country_v2"/>&nbsp;
							</td>
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"region_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.region"/><span class="mandatoryPerfection"> * </span></td>
							<td>
								<integro:empty-if-null value="<%=regionName_v2%>"/>&nbsp;
								<html:hidden name="<%=formName1%>" property="region_v2"/>
							</td>
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">			
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"locationState_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.state"/><span class="mandatoryPerfection"> * </span></td>
							<td>
								<integro:empty-if-null value="<%=stateName_v2%>"/>&nbsp;
								<html:hidden name="<%=formName1%>" property="locationState_v2"/>&nbsp;
							</td>
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"nearestCity_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.city"/><span class="mandatoryPerfection"> * </span></td>
							<td>
								<integro:empty-if-null value="<%=cityName_v2%>"/>&nbsp;
								<html:hidden name="<%=formName1%>" property="nearestCity_v2"/>&nbsp;
							</td>
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"pinCode_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">Pincode</td>
								<%if(iCol1.getPinCode_v2()!=null && !iCol1.getPinCode_v2().equals("")){ %>
								<td><%=iCol1.getPinCode_v2() %>&nbsp;</td>
								<%}else{ %>
								<td>-&nbsp;</td>
								<%} %>		
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<td class="<%=isProcess1?((CompareOBUtil.compOB(newCollateral1,oldCollateral1,"landArea_v2") && CompareOBUtil.compOB(newCollateral1,oldCollateral1,"landAreaUOM_v2"))?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.property.land.area"/>
								<%if(subtype1.equals("PropLandUrban")||subtype1.equals("PropAgri")){ %>
								<span class="mandatoryPerfection">*</span>
								<% }%>
							</td>
							<%if(iCol1.getLandArea_v2()!=0){ %>
					    	<td>
					    		<%=String.valueOf(iCol1.getLandArea_v2()) %>&nbsp;<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,iCol1.getLandAreaUOM_v2())%>"/></td>
							<%}else{ %>
							<td>-&nbsp;</td>
							<%} %>
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"inSqftLandArea_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.property.land.area.sqft"/>
							</td>
							<%if(iCol1.getInSqftLandArea_v2()!=0){ %>
							<td><%=new BigDecimal(iCol1.getInSqftLandArea_v2()) %>&nbsp;</td>
							<%}else{ %>
							<td>-&nbsp;</td>
							<%} %>
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<%if(!((subtype1.equals("PropLandUrban"))||(subtype1.equals("PropAgri")))){%>
				   			 <td class="<%=isProcess1?((CompareOBUtil.compOB(newCollateral1,oldCollateral1,"builtupArea_v2") 
				   					 && CompareOBUtil.compOB(newCollateral1,oldCollateral1,"builtupAreaUOM_v2"))?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.property.build.up.area"/>
							<%
								String aa = PropertyCompletionStatusList.getInstance().getPropertyCompletionStatusLabel(""+iCol1.getPropertyCompletionStatus_v2());
								if(aa!=null){
								if(!(aa.equals("Under Construction")||aa.equals(""))){ %>
							<%}}%>
								<span class="mandatoryPerfection"> * </span>
							</td>
							<%if(iCol1.getBuiltupArea_v2()!=0){ %>
					    	<td>
					    		<%=String.valueOf(iCol1.getBuiltupArea_v2()) %> &nbsp; 
					    		<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,iCol1.getBuiltupAreaUOM_v2())%>"/>
					    	</td>
							<%}else{ %>
							<td>-&nbsp;</td>
							<%} }else{%>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
							<%} %>
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"inSqftBuiltupArea_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.property.build.up.area.sqft"/>
							</td>
							<%if(iCol1.getInSqftBuiltupArea_v2()!=0){ %>
							<td colspan="3"><%=String.valueOf(iCol1.getInSqftBuiltupArea_v2()) %>&nbsp;</td>
							<%}else{ %>
							<td colspan="3">-&nbsp;</td>
							<%} %>
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<td class="fieldname">
								Land Value 
								<%
								if(null!=iCol1.getPropertyType() && PropertyTypeList.getInstance().getPropertyTypeLabel(iCol1.getPropertyType()).contains("LAND")) {%>
								<span class="mandatoryPerfection"> * </span>
								<%} %>
							</td>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
									<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
										<td style="border:none">
											<span class="landValue_v2_InNum"><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol1.getLandValue_v2()))%></span>
										</td>
										<td style="border:none">
											<textarea id="landValue_v2_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
										</td>
									</tr>
								</table>
							<td class="fieldname">
								Building Value 
								<%if(null!=iCol1.getPropertyType() &&!PropertyTypeList.getInstance().getPropertyTypeLabel(iCol1.getPropertyType()).contains("LAND")) {%>
								<span class="mandatoryPerfection"> * </span>
								<%} %>
							</td>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
									<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
										<td style="border:none">
											<span class="buildingValue_v2_InNum"><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol1.getBuildingValue_v2()))%></span>
										</td>
										<td style="border:none">
											<textarea id="buildingValue_v2_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
											</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
							<td class="fieldname">
								Reconstruction value of the Building 
								<%if(null!=iCol1.getPropertyType() && !PropertyTypeList.getInstance().getPropertyTypeLabel(iCol1.getPropertyType()).contains("LAND")) {%>
								<span class="mandatoryPerfection"> * </span>
								<%} %>
							</td>
							<td>
								<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
									<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
										<td style="border:none">
											<span class="reconstructionValueOfTheBuilding_v2_InNum"><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol1.getReconstructionValueOfTheBuilding_v2()))%></span>
										</td>
										<td style="border:none">
											<textarea id="reconstructionValueOfTheBuilding_v2_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
										</td>
									</tr>
								</table>
							</td> 
							<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"propertyCompletionStatus_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
								<bean:message key="label.security.property.completion.status"/>
							</td>
			  				<td>
			  					<integro:empty-if-null value='<%= PropertyCompletionStatusList.getInstance().getPropertyCompletionStatusLabel(""+iCol1.getPropertyCompletionStatus_v2()) %>'/>&nbsp;
			  				</td>
						</tr>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
		<thead>
    		<tr>
      			<td> <h3><bean:message key="label.security.additional.information"/></h3>
      			</td>
    		</tr>
    		<tr>
      			<td><hr/></td>
    		</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
	     				<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
    						<td width="20%" class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"isPhysicalInspection_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
       							<bean:message key="label.security.phy.verification"/>&nbsp;<span class="mandatoryPerfection">*</span>
       						</td>
    						<td width="30%" ><integro:boolean-display style="yn" value="<%=iCol1.getIsPhysicalInspection_v2()%>"/>&nbsp;</td>
    						<% boolean physicalUpdated2 = false;
        					if (isProcess1) {
           						physicalUpdated2 = CompareOBUtil.compOB(newCollateral1, oldCollateral1, "physicalInspectionFreq")||(iCol1.getPhysicalInspectionFreq() < 0);
            					physicalUpdated2 = physicalUpdated2 && CompareOBUtil.compOB(newCollateral1, oldCollateral1, "physicalInspectionFreqUnit_v2");
        					}
        					%>
    						<td class="<%=isProcess1?(physicalUpdated2?"fieldname":"fieldnamediff"):"fieldname"%>">
        						<bean:message key="label.security.phy.verification.frequency"/><span class="mandatoryPerfection">*</span>
						    </td>
					        <% if (iCol1.getPhysicalInspectionFreqUnit_v2()!=null){ %>
        					<td>
        						<integro:common-code-single entryCode="<%=iCol1.getPhysicalInspectionFreqUnit_v2()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
        					<% }else{ %>
        					<td>-&nbsp;</td>
        					<%} %>
						</tr>
  						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
	            			<% if (iCol1.getIsPhysicalInspection_v2()) { %>
	                    	<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"lastPhysicalInspectDate_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                        	<bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span>
	                        </td>
	            			<% } else { %>
	                		<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"lastPhysicalInspectDate_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    		<bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            			<% }%>
	            			<%if( iCol1.getLastPhysicalInspectDate_v2()!=null){%>
	            			<td><integro:date object="<%=iCol1.getLastPhysicalInspectDate_v2() %>"/>&nbsp;</td>
	            			<%}else {%>
	            			<td>-&nbsp;</td>
	            			<%} %>
	            			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"nextPhysicalInspectDate_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            				<bean:message key="label.security.next.phy.verification.date"/><span class="mandatoryPerfection">*</span>
	            			</td>
	            			<%if(iCol1.getNextPhysicalInspectDate_v2()!=null){ %>
	            			<td><integro:date object="<%=iCol1.getNextPhysicalInspectDate_v2()%>"/>&nbsp;</td>
	            			<%}else{ %>
	            			<td>-&nbsp;</td>
	            			<%} %>
	        			</tr>
						<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">              
		  					<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"remarksProperty_v2")?"fieldname":"fieldnamediff"):"fieldname"%>">
		  						<bean:message key="label.remarks"/>
		  					</td>
		  					<td colspan="3"><integro:wrapper value="<%=iCol1.getRemarksProperty_v2()%>" />&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="label.security.property.valuation3"/></h3></td>
     </tr>
     <tr>
      			<td><hr/></td>
    		</tr>
     <tr><td>
		<table width="50%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<%-- <td class="fieldname" width="20%">&nbsp;</td>
			<td width="30%"><html:select name="PropCommGeneralForm" property="preValDate_v1"  styleId="preValDate_v1" >
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="preValDateList_v1" labelProperty="label" property="value" />
              	</html:select>&nbsp;
              
			</td> --%>
		    <td class="fieldname" width="20%"><bean:message key="label.security.property.revaluation"/></td>
			<td width="30%"><integro:date object="<%=newCollateral1.getValcreationdate_v3() %>"/>&nbsp;</td>
			
		</tr>
		</table>
		</td>
	</tr>
     <tr> 
      <td> <h3><bean:message key="title.property.information"/></h3></td>
   </tr>        
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
	
<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"totalPropertyAmount_v3")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
			Total Property Amount <span class="mandatoryPerfection"> * </span></td>
			<%if(totalAmt_v3!=null){ %>
			<td width="30%">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
						<td style="border:none">
							<span class="totalAmt_v3_InNum">
								<integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),totalAmt_v3)%>" />
							</span>
						</td>
						<td style="border:none">
							<textarea id="totalAmt_v3_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
					
					<tr class="<%=(rowIdx1) % 2 == 0 ? "even" : "odd"%>">
						<td colspan="2"><html:errors property="loaMasterTotalPropertyV3Error" /></td>
					</tr>
					
				</table>
			</td>	
			<%}else{ %>
			<td width="30%">-&nbsp;</td>
			<%} %>
				<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"valuationDate_v3")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
				Date of Valuation&nbsp; <span class="mandatoryPerfection"> * </span></td>
				<%if(iCol1.getValuationDate_v3()!=null){ %>
				<td width="30%"><integro:date object="<%=iCol1.getValuationDate_v3()%>"/>&nbsp;</td>
				<%}else{ %>
				<td width="30%">-&nbsp;</td>
				<%} %>
			
				</tr>
	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"valuatorCompany_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">Valuation Company &nbsp;<span class="mandatoryPerfection"> * </span></td>
			<td >
				<integro:empty-if-null value="<%=valuationAgencyName_v3%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="valuatorCompany_v3"/>&nbsp;
			</td>
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"categoryOfLandUse_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">Category of Land Used </td>
			<td><integro:empty-if-null value="<%=commonCodeCategoryofLandUse.getCommonCodeLabel(iCol1.getCategoryOfLandUse_v3()) %>"/>&nbsp;</td>
		</tr>	

	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"developerName_v3")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.property.dev.occu.name"/>
		  	</td>
			<td><integro:wrapper  value="<%=newCollateral1.getDeveloperName_v3() %>"/>&nbsp;</td>
				
	</tr>
	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"country_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.country"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=countryName_v3%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="country_v3"/>&nbsp;
			</td>
			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"region_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.region"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=regionName_v3%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="region_v3"/>
			</td>
		</tr>
			
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"locationState_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.state"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=stateName_v3%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="locationState_v3"/>&nbsp;
			</td>
			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"nearestCity_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.city"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=cityName_v3%>"/>&nbsp;
				<html:hidden name="<%=formName1%>" property="nearestCity_v3"/>&nbsp;
			</td>
		</tr>

		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"pinCode_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">Pincode</td>
			<%if(iCol1.getPinCode_v3()!=null && !iCol1.getPinCode_v3().equals("")){ %>
			<td><%=iCol1.getPinCode_v3() %>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>		
			
			
		</tr>

		
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess1?((CompareOBUtil.compOB(newCollateral1,oldCollateral1,"landArea_v3") && CompareOBUtil.compOB(newCollateral1,oldCollateral1,"landAreaUOM_v3"))?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.land.area"/>
				<%if(subtype1.equals("PropLandUrban")||subtype1.equals("PropAgri")){ %>
				<span class="mandatoryPerfection">*</span>
				<% }%>
				</td>
				
				<%if(iCol1.getLandArea_v3()!=0){ %>
				    <td><%=String.valueOf(iCol1.getLandArea_v3()) %>&nbsp;<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,iCol1.getLandAreaUOM_v3())%>"/></td>
				<%}else{ %>
					<td>-&nbsp;</td>
					<%} %>
			
				<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"inSqftLandArea_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.property.land.area.sqft"/>
				</td>
				
				<%if(iCol1.getInSqftLandArea_v3()!=0){ %>
					<td><%=new BigDecimal(iCol1.getInSqftLandArea_v3()) %>&nbsp;</td>
				<%}else{ %>
					<td>-&nbsp;</td>
				<%} %>
						
		</tr>
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<%if(!((subtype1.equals("PropLandUrban"))||(subtype1.equals("PropAgri")))){%>
		    <td class="<%=isProcess1?((CompareOBUtil.compOB(newCollateral1,oldCollateral1,"builtupArea_v3") && CompareOBUtil.compOB(newCollateral1,oldCollateral1,"builtupAreaUOM_v3"))?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.build.up.area"/>
				<%
				String aa = PropertyCompletionStatusList.getInstance ().getPropertyCompletionStatusLabel (""+iCol1.getPropertyCompletionStatus_v3 ());
				if(aa!=null){
				if(!(aa.equals("Under Construction")||aa.equals(""))){ %>
					<%--<span class="mandatoryPerfection"> * </span>
				--%><%}}%>
				<span class="mandatoryPerfection"> * </span>
				</td>
			<%if(iCol1.getBuiltupArea_v3()!=0){ %>
				    <td><%=String.valueOf(iCol1.getBuiltupArea_v3()) %> &nbsp; <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,iCol1.getBuiltupAreaUOM_v3())%>" /></td>
			<%}else{ %>
					<td>-&nbsp;</td>
					<%} }else{%>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
			<%} %>
			
			<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"inSqftBuiltupArea_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.build.up.area.sqft"/>
				
				</td>
				<%if(iCol1.getInSqftBuiltupArea_v3()!=0){ %>
			<td colspan="3"><%=String.valueOf(iCol1.getInSqftBuiltupArea_v3()) %>&nbsp;</td>
			<%}else{ %>
			<td colspan="3">-&nbsp;</td>
			<%} %>
			
		   
		</tr>
		<!-- Start Santosh -->
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Land Value 
				<%
				if(null!=iCol1.getPropertyType() && PropertyTypeList.getInstance().getPropertyTypeLabel(iCol1.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
						<td style="border:none">
							<span class="landValue_v3_InNum"><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol1.getLandValue_v3()))%></span>
						</td>
						<td style="border:none">
							<textarea id="landValue_v3_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
			</td>
			<td class="fieldname">
				Building Value 
				<%if(null!=iCol1.getPropertyType() &&!PropertyTypeList.getInstance().getPropertyTypeLabel(iCol1.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
						<td style="border:none">
							<span class="buildingValue_v3_InNum"><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol1.getBuildingValue_v3()))%></span>
						</td>
						<td style="border:none">
							<textarea id="buildingValue_v3_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Reconstruction value of the Building 
				<%if(null!=iCol1.getPropertyType() && !PropertyTypeList.getInstance().getPropertyTypeLabel(iCol1.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx1)%2==0?"even":"odd"%>" >
						<td style="border:none">
							<span class="reconstructionValueOfTheBuilding_v3_InNum"><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol1.getReconstructionValueOfTheBuilding_v3()))%></span>
						</td>
						<td style="border:none">
							<textarea id="reconstructionValueOfTheBuilding_v3_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
			</td> 
		<td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"propertyCompletionStatus_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.completion.status"/></td>
		  	<td><integro:empty-if-null value='<%= PropertyCompletionStatusList.getInstance ().getPropertyCompletionStatusLabel (""+iCol1.getPropertyCompletionStatus_v3 ()) %>'/>&nbsp;</td>
		
		</tr>
		<!-- End Santosh -->
</table>
</td></tr></tbody>
</table>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
    <tr>
      <td> <h3><bean:message key="label.security.additional.information"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
	</thead>
	<tbody>
	<tr><td>
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
		
	     <tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
    <td width="20%" class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"isPhysicalInspection_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification"/>&nbsp;<%--<span class="mandatoryPerfection">*</span></td>--%><span class="mandatoryPerfection">*</span></td>
    <td width="30%" ><integro:boolean-display style="yn" value="<%=iCol1.getIsPhysicalInspection_v3()%>"/>&nbsp;</td>
    <% boolean physicalUpdated3 = false;
        if (isProcess1) {
            physicalUpdated3 = CompareOBUtil.compOB(newCollateral1, oldCollateral1, "physicalInspectionFreq")||(iCol1.getPhysicalInspectionFreq() < 0);
            physicalUpdated3 = physicalUpdated3 && CompareOBUtil.compOB(newCollateral1, oldCollateral1, "physicalInspectionFreqUnit_v3");
        }
    %>
    <td class="<%=isProcess1?(physicalUpdated3?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification.frequency"/><span class="mandatoryPerfection">*</span>
       
    </td>
    
        <% if (iCol1.getPhysicalInspectionFreqUnit_v3()!=null){ %>
        <td>
        <integro:common-code-single entryCode="<%=iCol1.getPhysicalInspectionFreqUnit_v3()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
        <% }else{ %>
        <td>-&nbsp;</td>
        <%} %>
        &nbsp;
    
</tr>
  <tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
	            <% if (iCol1.getIsPhysicalInspection_v3()) { %>
	                    <td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"lastPhysicalInspectDate_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                        <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% } else { %>
	                <td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"lastPhysicalInspectDate_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% }%>
	            <%if( iCol1.getLastPhysicalInspectDate_v3()!=null){%>
	            <td><integro:date object="<%=iCol1.getLastPhysicalInspectDate_v3() %>"/>&nbsp;</td>
	            <%}else {%>
	            <td>-&nbsp;</td>
	            <%} %>
	            <td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"nextPhysicalInspectDate_v3")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            <bean:message key="label.security.next.phy.verification.date"/><span class="mandatoryPerfection">*</span></td>
	            <%if(iCol1.getNextPhysicalInspectDate_v3()!=null){ %>
	            <td><integro:date object="<%=iCol1.getNextPhysicalInspectDate_v3()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td>-&nbsp;</td>
	            <%} %>
	            
	        </tr>
			
			<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">              
		  <td class="<%=isProcess1?(CompareOBUtil.compOB(newCollateral1,oldCollateral1,"remarksProperty_v3")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.remarks"/></td>
		  <td colspan="3"><integro:wrapper value="<%=iCol1.getRemarksProperty_v3()%>" />&nbsp;</td>
		</tr>
		</table>
	
	</tbody>
</table>
<script>
	var deferral = document.getElementById("deferral");
	if(deferral && deferral.checked){
		document.getElementById("deferralId").style.display = '';
	}else
		document.getElementById("deferralId").style.display = 'none';
</script>
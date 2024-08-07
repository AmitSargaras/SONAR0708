<%@page import="com.integrosys.cms.app.collateral.bus.type.property.IPropertyValuation1"%>
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
/* 	ICollateralTrxValue itrxValue1 = (ICollateralTrxValue)session.getAttribute(actionStr1+".serviceColObj"); */
	
	Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	
/* 	IPropertyCollateral oldCollateral1 = (IPropertyCollateral) itrxValue1.getCollateral();
	IPropertyCollateral newCollateral1 = (IPropertyCollateral) itrxValue1.getStagingCollateral(); */
	

	String fromEvent1 = request.getParameter("fromEvent");
	IPropertyValuation1 propertyValuationObj=(IPropertyValuation1)session.getAttribute(actionStr1+".propertyValuation1");
	System.out.println("propertyValuationObj: "+propertyValuationObj);
	
	String isProcess1Str1 = request.getParameter("isProcess");
	boolean isProcess1 = isProcess1Str1.equals("true");
	
	System.out.println("isProcess1:"+isProcess1);
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
	
	
	if(propertyValuationObj.getTotalPropertyAmontV1()!=null){
//	Amount amt_v1=propertyValuationObj.getTotalPropertyAmontV1();
	totalAmt_v1=propertyValuationObj.getTotalPropertyAmontV1();
	}
	String strttt=String.format ("%.0f", propertyValuationObj.getLandValueIRBV1());
	System.out.println("subtype1:"+subtype1);
	List preValDateList_v1 = null;
	preValDateList_v1 = (List) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.preValDateList_v1");
	
	System.out.println(" view preValDateList_v1:"+preValDateList_v1);
	pageContext.setAttribute("preValDateList_v1", preValDateList_v1);
%>


<%@page import="com.integrosys.cms.ui.collateral.property.propcommgeneral.PropCommGeneralForm"%>
<%@page import="com.integrosys.cms.ui.collateral.property.PropertyForm"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@page import="com.integrosys.base.businfra.currency.Amount"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>	
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
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
			<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname" width="20%"><bean:message key="label.security.property.previous.valuation.date"/></td>
			<td width="30%"><%-- <html:select name="PropCommGeneralForm" property="preValDate_v1"  styleId="preValDate_v1" >
              		<option value=""><bean:message key="label.please.select"/></option>
              		<html:options collection="preValDateList_v1" labelProperty="label" property="value" />
              	</html:select>&nbsp; --%>
              
			</td>
		    <td class="fieldname" width="20%"><bean:message key="label.security.property.revaluation"/></td>
			<td width="30%"><integro:date object="<%=propertyValuationObj.getValCreationDateV1() %>"/>&nbsp;</td>
			
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
			<td class="fieldname" width="20%">
			Total Property Amount <span class="mandatoryPerfection"> * </span></td>
			<%if(totalAmt_v1!=null){ %>
			<td width="30%">
			 <integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),totalAmt_v1)%>" />	&nbsp;</td>
			<%}else{ %>
			<td width="30%">-&nbsp;</td>
			<%} %>
				<td class="fieldname" width="20%">
				Date of Valuation&nbsp; <span class="mandatoryPerfection"> * </span></td>
				<%if(propertyValuationObj.getValuationDateV1()!=null){ %>
				<td width="30%"><integro:date object="<%=propertyValuationObj.getValuationDateV1()%>"/>&nbsp;</td>
				<%}else{ %>
				<td width="30%">-&nbsp;</td>
				<%} %>
			
				</tr>
	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname">Valuation Company &nbsp;<span class="mandatoryPerfection"> * </span></td>
			<td >
				<integro:empty-if-null value="<%=valuationAgencyName_v1%>"/>&nbsp;
				
			</td>
			<td class="fieldname">Category of Land Used </td>
			<td><integro:empty-if-null value="<%=commonCodeCategoryofLandUse.getCommonCodeLabel(propertyValuationObj.getCategoryOfLandUseV1()) %>"/>&nbsp;</td>
		</tr>	

	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname"><bean:message key="label.security.property.dev.occu.name"/>
		  	</td>
			<td><integro:wrapper  value="<%= propertyValuationObj.getDeveloperNameV1()%>"/>&nbsp;</td>
				
	</tr>
	<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">			
			<td class="fieldname">
				<bean:message key="label.security.country"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=countryName_v1%>"/>&nbsp;
			
			</td>
			
			<td class="fieldname">
				<bean:message key="label.security.region"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=regionName_v1%>"/>&nbsp;
				
			</td>
		</tr>
			
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">			
			<td class="fieldname">
				<bean:message key="label.security.state"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=stateName_v1%>"/>&nbsp;
				
			</td>
			
			<td class="fieldname">
				<bean:message key="label.security.city"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=cityName_v1%>"/>&nbsp;
				
			</td>
		</tr>

		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname">Pincode</td>
			<%if(propertyValuationObj.getPincodeV1()!=null && !propertyValuationObj.getPincodeV1().equals("")){ %>
			<td><%=propertyValuationObj.getPincodeV1() %>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>		
			
			
		</tr>

		
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.land.area"/>
				<%if(subtype1.equals("PropLandUrban")||subtype1.equals("PropAgri")){ %>
				<span class="mandatoryPerfection">*</span>
				<% }%>
				</td>
				
				<%if(propertyValuationObj.getLandAreaV1()!=0){ %>
				    <td><%=String.valueOf(propertyValuationObj.getLandAreaV1()) %>&nbsp;<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,propertyValuationObj.getLandAreaUOMV1())%>"/></td>
				<%}else{ %>
					<td>-&nbsp;</td>
					<%} %>
			
				<td class="fieldname">
					<bean:message key="label.security.property.land.area.sqft"/>
				</td>
				
				<%if(propertyValuationObj.getInSqfLandAreaV1()!=0){ %>
					<td><%=new BigDecimal(propertyValuationObj.getInSqfLandAreaV1()) %>&nbsp;</td>
				<%}else{ %>
					<td>-&nbsp;</td>
				<%} %>
						
		</tr>
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<%if(!((subtype1.equals("PropLandUrban"))||(subtype1.equals("PropAgri")))){%>
		    <td class="fieldname">
				<bean:message key="label.security.property.build.up.area"/>
				<%
				String aa = PropertyCompletionStatusList.getInstance ().getPropertyCompletionStatusLabel (""+propertyValuationObj.getPropertyCompletionStatusV1());
				if(aa!=null){
				if(!(aa.equals("Under Construction")||aa.equals(""))){ %>
					<%--<span class="mandatoryPerfection"> * </span>
				--%><%}}%>
				<span class="mandatoryPerfection"> * </span>
				</td>
			<%if(propertyValuationObj.getBuildupAreaV1()!=0){ %>
				    <td><%=String.valueOf(propertyValuationObj.getBuildupAreaV1()) %> &nbsp; <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,propertyValuationObj.getBuildupAreaUOMV1())%>" /></td>
			<%}else{ %>
					<td>-&nbsp;</td>
					<%} }else{%>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
			<%} %>
			
			<td class="fieldname">
				<bean:message key="label.security.property.build.up.area.sqft"/>
				
				</td>
				<%if(propertyValuationObj.getInSqfbuildupAreaV1()!=0){ %>
			<td colspan="3"><%=String.valueOf(propertyValuationObj.getInSqfbuildupAreaV1()) %>&nbsp;</td>
			<%}else{ %>
			<td colspan="3">-&nbsp;</td>
			<%} %>
			
		   
		</tr>
		<!-- Start Santosh -->
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Land Value 
				<%
				if(null!=propertyValuationObj.getPropertyType() && PropertyTypeList.getInstance().getPropertyTypeLabel(propertyValuationObj.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td><%=String.format ("%.0f", propertyValuationObj.getLandValueIRBV1()) %></td>
			<td class="fieldname">
				Building Value 
				<%if(null!=propertyValuationObj.getPropertyType() &&!PropertyTypeList.getInstance().getPropertyTypeLabel(propertyValuationObj.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td><%=String.format ("%.0f", propertyValuationObj.getBuildingValueIRBV1())%></td>
		</tr>
		<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Reconstruction value of the Building 
				<%if(null!=propertyValuationObj.getPropertyType() && !PropertyTypeList.getInstance().getPropertyTypeLabel(propertyValuationObj.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", propertyValuationObj.getReconstructionValueIRBV1()))%></td> 
		<td class="fieldname">
				<bean:message key="label.security.property.completion.status"/></td>
		  	<td><integro:empty-if-null value='<%= PropertyCompletionStatusList.getInstance ().getPropertyCompletionStatusLabel (""+propertyValuationObj.getPropertyCompletionStatusV1()) %>'/>&nbsp;</td>
		
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
    <td width="20%" class="fieldname">
        <bean:message key="label.security.phy.verification"/>&nbsp;<%--<span class="mandatoryPerfection">*</span></td>--%><span class="mandatoryPerfection">*</span></td>
    <td width="30%" ><integro:boolean-display style="yn" value="<%=propertyValuationObj.getIsPhyInspectionV1()%>"/>&nbsp;</td>
    <% boolean physicalUpdated = false;
        /* if (isProcess1) {
            physicalUpdated = CompareOBUtil.compOB(newCollateral1, oldCollateral1, "physicalInspectionFreq")||(propertyValuationObj.getPhyInspectionFreqUnitV1() < 0);
            physicalUpdated = physicalUpdated && CompareOBUtil.compOB(newCollateral1, oldCollateral1, "physicalInspectionFreqUnit_v1");
        } */
    %>
    <td class="fieldname">
        <bean:message key="label.security.phy.verification.frequency"/><span class="mandatoryPerfection">*</span>
       
    </td>
    
        <% if (propertyValuationObj.getPhyInspectionFreqUnitV1()!=null){ %>
        <td>
        <integro:common-code-single entryCode="<%=propertyValuationObj.getPhyInspectionFreqUnitV1()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
        <% }else{ %>
        <td>-&nbsp;</td>
        <%} %>
        &nbsp;
    
</tr>
  <tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">
	            <% if (propertyValuationObj.getIsPhyInspectionV1()) { %>
	                    <td class="fieldname">
	                        <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% } else { %>
	                <td class="fieldname">
	                    <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% }%>
	            <%if( propertyValuationObj.getLastPhyInspectionDateV1()!=null){%>
	            <td><integro:date object="<%=propertyValuationObj.getLastPhyInspectionDateV1() %>"/>&nbsp;</td>
	            <%}else {%>
	            <td>-&nbsp;</td>
	            <%} %>
	            <td class="fieldname">
	            <bean:message key="label.security.next.phy.verification.date"/><span class="mandatoryPerfection">*</span></td>
	            <%if(propertyValuationObj.getNextPhyInspectionDateV1()!=null){ %>
	            <td><integro:date object="<%=propertyValuationObj.getNextPhyInspectionDateV1()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td>-&nbsp;</td>
	            <%} %>
	            
	        </tr>
			
			<tr class="<%=(rowIdx1++)%2==0?"even":"odd"%>">              
		  <td class="fieldname"><bean:message key="label.remarks"/></td>
		  <td colspan="3"><integro:wrapper value="<%=propertyValuationObj.getRemarksPropertyV1()%>" />&nbsp;</td>
		</tr>
		</table>
	</td></tr>
	</tbody>
</table>


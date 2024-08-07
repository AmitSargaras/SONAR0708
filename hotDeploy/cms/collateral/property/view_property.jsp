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

	String actionStr = "com.integrosys.cms.ui.collateral.property.PropertyAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
	
	Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
	
	IPropertyCollateral oldCollateral = (IPropertyCollateral) itrxValue.getCollateral();
	IPropertyCollateral newCollateral = (IPropertyCollateral) itrxValue.getStagingCollateral();
	
	String claim="";
	
	if(newCollateral.getClaim()!=null && !newCollateral.getClaim().equals("")){
	if(newCollateral.getClaim().equals("Y")){
		claim="Yes";
	}
	else if(newCollateral.getClaim().equals("N")){
		claim="No";
	}
	}

	String fromEvent = request.getParameter("fromEvent");
	IPropertyCollateral iCol = "read".equals(fromEvent)?
			(IPropertyCollateral)itrxValue.getCollateral():(IPropertyCollateral) itrxValue.getStagingCollateral();
	
	String isProcessStr = request.getParameter("isProcess");
	boolean isProcess = isProcessStr.equals("true");
	String subtype = request.getParameter("subtype");
	String formName = subtype+"Form";	
	PropertyForm colForm = (PropertyForm) request.getAttribute(formName);
	int rowIdx= Integer.parseInt(request.getParameter("rowIdxInteger"));
	
	String cityName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.cityName");
	String stateName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.stateName");
	String regionName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.regionName");
	String countryName = (String) session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.countryName");
	
	String valuationAgencyName = (String) request.getAttribute("valuationAgencyName");
	
	HashMap bankListMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.bankListMap");
	
	
	CommonCodeList commonCodeCategoryofLandUse = CommonCodeList .getInstance(null, null, CategoryCodeConstant.CATEGORY_OF_LAND_USE, null);
	String totalAmt=null;
	String saleValue=null;
	
	if(iCol.getTotalPropertyAmount()!=null){
	Amount amt=iCol.getTotalPropertyAmount();
	totalAmt=amt.getAmountAsBigDecimal().toString();
	}
	if(iCol.getSalePurchaseValue()!=null){
		Amount amt=iCol.getSalePurchaseValue();
		saleValue=amt.getAmountAsBigDecimal().toString();
		
		//Phase 3 CR:comma separated
		saleValue=UIUtil.formatWithCommaAndDecimal(saleValue);
	}
%>


<%@page import="com.integrosys.cms.ui.collateral.property.propcommgeneral.PropCommGeneralForm"%>
<%@page import="com.integrosys.cms.ui.collateral.property.PropertyForm"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.base.businfra.currency.CurrencyCode"%>
<%@page import="com.integrosys.base.businfra.currency.Amount"%>
<%@page import="com.integrosys.cms.app.common.util.CommonUtil"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%><table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
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
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyId")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
			  	Property Id
			</td>
			<td width="30%"><integro:empty-if-null value="<%= iCol.getPropertyId()  %>"/></td>
			
			<td class="fieldname">
				Borrower's Name <span class="mandatoryPerfection"> * </span>
			</td>
			<td colspan="30%"><integro:wrapper value="<%=iCol.getDescription()%>" />&nbsp;</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyType")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
			  	<bean:message key="label.security.property.type"/><span class="mandatoryPerfection"> * </span>
			</td>
			<td width="30%"><integro:empty-if-null value="<%=PropertyTypeList.getInstance ().getPropertyTypeLabel ( iCol.getPropertyType() ) %>"/></td>
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyUsage")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.property.usage"/></td>
			<td><integro:empty-if-null value="<%= PropertyUsageList.getInstance ().getPropertyUsageLabel (iCol.getPropertyUsage ()) %>"/></td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getSalePurchaseValue(),((oldCollateral==null)?null:oldCollateral.getSalePurchaseValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.sale.purchage.agree.val"/> </td>
			
			<%if(saleValue!=null){ %>
			<td><%=saleValue %>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"salePurchaseDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Mortgage Creation Date&nbsp;</td>
				<%if(iCol.getSalePurchaseDate()!=null){ %>
				<td><integro:date object="<%=iCol.getSalePurchaseDate()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %>
			
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"typeOfMargage")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Type of Mortage <span class="mandatoryPerfection"> * </span></td>
			<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_MORTGAGE_TYPE,iCol.getTypeOfMargage())%>" />&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"valuationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Valuation Date&nbsp; <span class="mandatoryPerfection"> * </span></td>
				<%if(iCol.getValuationDate()!=null){ %>
				<td><integro:date object="<%=iCol.getValuationDate()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %>
			
			
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"morgageCreatedBy")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Mortage Created By <span class="mandatoryPerfection"> * </span></td>
			<td><integro:empty-if-null value="<%=bankListMap.get(newCollateral.getMorgageCreatedBy())%>" />&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentReceived")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Document Received </td>
			<% if(newCollateral.getDocumentReceived() != null && !newCollateral.getDocumentReceived().equals("") 
					&& newCollateral.getDocumentReceived().equalsIgnoreCase("Y")){
			%>
				<td><%="Yes" %></td>
			<%}else{ %>
				<td><%="No" %></td>
			<%} %>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentBlock")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Document Block </td>
			<% if(newCollateral.getDocumentBlock() != null && !newCollateral.getDocumentBlock().equals("") 
					&& newCollateral.getDocumentBlock().equalsIgnoreCase("on")){
			%>
				<td><input type="checkbox" checked="checked" disabled="disabled" /> </td>
			<%}else{ %>
				<td><input type="checkbox" disabled="disabled" /> </td>
			<%} %>	
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"binNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Bin Number&nbsp;</td>
				<%if(iCol.getBinNumber()!=null && !iCol.getBinNumber().equals("")&&!iCol.getBinNumber().equals("null")){ %>
			<td><%=iCol.getBinNumber()%>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"totalPropertyAmount")?"fieldname":"fieldnamediff"):"fieldname"%>">
			Total Property Amount <span class="mandatoryPerfection"> * </span></td>
			<%if(totalAmt!=null){ %>
			<td>
			 <integro:amount  param="amount"  decimal="2" amount="<%=UIUtil.convertToAmount(locale,CommonUtil.getBaseCurrency(),totalAmt)%>" />	&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
	<!--  Added by Pramod Katkar for New Filed CR on 23-08-2013-->
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"claim")?"fieldname":"fieldnamediff"):"fieldname"%>">
			Prior Claim <span class="mandatoryPerfection"> * </span></td>
			<td>
				<%if(claim!=null && !claim.equals("")){ %>
			<%=claim %>
			<%}else{ %>-
			<%} %>
			&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Type Of Claim -:</b>&nbsp;&nbsp;
			<%if(iCol.getClaimType()!=null && !iCol.getClaimType().equals("")){ %>
			<integro:common-code-single entryCode="<%=iCol.getClaimType()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.TYPE_OF_CLAIM%>" descWithCode="false" />
			<%}else{ %>-
			<%} %>
			
			</td>
			<!--End by Pramod Katkar-->
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"mortageRegisteredRef")?"fieldname":"fieldnamediff"):"fieldname"%>">Mortage Registered Reference &nbsp;</td>
			<%if(iCol.getMortageRegisteredRef()!=null && !iCol.getMortageRegisteredRef().equals("")){ %>
			<td colspan="3"><%=iCol.getMortageRegisteredRef() %>&nbsp;</td>
			<%}else{ %>
			<td colspan="3">-&nbsp;</td>
			<%} %>
			
		</tr>			
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"locationState")?"fieldname":"fieldnamediff"):"fieldname"%>">Valuation Company &nbsp;<span class="mandatoryPerfection"> * </span></td>
			<td colspan="3">
				<integro:empty-if-null value="<%=valuationAgencyName%>"/>&nbsp;
				<html:hidden name="<%=formName%>" property="valuatorCompany"/>&nbsp;
			</td>
		</tr>
						
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"developerName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.property.dev.occu.name"/>
		  	</td>
			<td><integro:wrapper  value="<%=newCollateral.getDeveloperName() %>"/>&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"devGrpCo")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.property.dev.occu.name.dtls"/> <span class="mandatoryPerfection"> * </span></td>
			<td><integro:wrapper  value="<%=newCollateral.getDevGrpCo() %>"/>&nbsp;</td>
		</tr>

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"projectName")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.prj.name"/></td>
            <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VEHICLE_DEALER,iCol.getProjectName())%>"/>&nbsp;</td>
            
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lotNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.title.lot.no"/>
				</td>
			<td>
			<integro:common-code categoryCode="LOT_NO" entryCode="<%=iCol.getLotNumberPrefix()%>" display="true" descWithCode="false"/>&nbsp;
			<integro:empty-if-null value="<%=iCol.getLotNo()%>" />&nbsp;</td>				
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyLotLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">Advocate/ Lawyer Name <span class="mandatoryPerfection"> * </span></td>
			 <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_ADV_NAME,iCol.getAdvocateLawyerName())%>"/>&nbsp;</td>
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyLotLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">Category of Land Used </td>
			<td><integro:empty-if-null value="<%=commonCodeCategoryofLandUse.getCommonCodeLabel(iCol.getCategoryOfLandUse()) %>"/>&nbsp;</td>
			
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyLotLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">Property Lot Location</td>
			<%if(iCol.getPropertyLotLocation()!=null && !iCol.getPropertyLotLocation().equals("")){ %>
			<td colspan="3"><%=iCol.getPropertyLotLocation() %>&nbsp;</td>
			<%}else{ %>
			<td colspan="3">-&nbsp;</td>
			<%} %>
		</tr>
			
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"country")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.country"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=countryName%>"/>&nbsp;
				<html:hidden name="<%=formName%>" property="country"/>&nbsp;
			</td>
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"region")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.region"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=regionName%>"/>&nbsp;
				<html:hidden name="<%=formName%>" property="region"/>
			</td>
		</tr>
			
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"locationState")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.state"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=stateName%>"/>&nbsp;
				<html:hidden name="<%=formName%>" property="locationState"/>&nbsp;
			</td>
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nearestCity")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.city"/><span class="mandatoryPerfection"> * </span></td>
			<td>
				<integro:empty-if-null value="<%=cityName%>"/>&nbsp;
				<html:hidden name="<%=formName%>" property="nearestCity"/>&nbsp;
			</td>
		</tr>

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"pinCode")?"fieldname":"fieldnamediff"):"fieldname"%>">Pincode</td>
			<%if(iCol.getPinCode()!=null && !iCol.getPinCode().equals("")){ %>
			<td><%=iCol.getPinCode() %>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>		
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"locationState")?"fieldname":"fieldnamediff"):"fieldname"%>">Other City</td>
			<%if(iCol.getOtherCity()!=null && !iCol.getOtherCity().equals("")){ %>
			<td><%=iCol.getOtherCity() %>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
		</tr>

		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?((CompareOBUtil.compOB(newCollateral,oldCollateral,"landArea") && CompareOBUtil.compOB(newCollateral,oldCollateral,"landAreaUOM"))?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.land.area"/>
				<%if(subtype.equals("PropLandUrban")||subtype.equals("PropAgri")){ %>
				<span class="mandatoryPerfection">*</span>
				<% }%>
				</td>
				
				<%if(iCol.getLandArea()!=0){ %>
				    <td><%=String.valueOf(iCol.getLandArea()) %>&nbsp;<integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,iCol.getLandAreaUOM())%>"/></td>
				<%}else{ %>
					<td>-&nbsp;</td>
					<%} %>
			
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"inSqftLandArea")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.property.land.area.sqft"/>
				</td>
				
				<%if(iCol.getInSqftLandArea()!=0){ %>
					<td><%=String.valueOf(iCol.getInSqftLandArea()) %>&nbsp;</td>
				<%}else{ %>
					<td>-&nbsp;</td>
				<%} %>
						
		</tr>
				

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<%if(!((subtype.equals("PropLandUrban"))||(subtype.equals("PropAgri")))){%>
		    <td class="<%=isProcess?((CompareOBUtil.compOB(newCollateral,oldCollateral,"builtupArea") && CompareOBUtil.compOB(newCollateral,oldCollateral,"builtupAreaUOM"))?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.build.up.area"/>
				<%
				String aa = PropertyCompletionStatusList.getInstance ().getPropertyCompletionStatusLabel (""+iCol.getPropertyCompletionStatus ());
				if(aa!=null){
				if(!(aa.equals("Under Construction")||aa.equals(""))){ %>
					<%--<span class="mandatoryPerfection"> * </span>
				--%><%}}%>
				<span class="mandatoryPerfection"> * </span>
				</td>
			<td><bean:write name="<%=formName%>" property="builtUpArea" /> &nbsp; <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AREA_UOM,iCol.getBuiltupAreaUOM())%>" /></td>
			<% }else{%>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
			<%} %>
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"inSqftBuiltUpArea")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.build.up.area.sqft"/>
				
				</td>
				<%if(iCol.getInSqftBuiltUpArea()!=0){ %>
			<td colspan="3"><%=String.valueOf(iCol.getInSqftBuiltUpArea()) %>&nbsp;</td>
			<%}else{ %>
			<td colspan="3">-&nbsp;</td>
			<%} %>
			
		   
		</tr>

		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyAddress")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Property Address 1 <span class="mandatoryPerfection"> * </span>
				</td>
			<td><integro:wrapper value="<%=iCol.getPropertyAddress()%>" />&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyAddress2")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Property Address 2
				</td>
			<td><integro:wrapper value="<%=iCol.getPropertyAddress2()%>" />&nbsp;</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyAddress3")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Property Address 3
				</td>
			<td><integro:wrapper value="<%=iCol.getPropertyAddress3()%>" />&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyAddress4")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Property Address 4
				</td>
			<td><integro:wrapper value="<%=iCol.getPropertyAddress4()%>" />&nbsp;</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyAddress5")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Property Address 5
				</td>
			<td><integro:wrapper value="<%=iCol.getPropertyAddress5()%>" />&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyAddress6")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Property Address 6
				</td>
			<td><integro:wrapper value="<%=iCol.getPropertyAddress6()%>" />&nbsp;</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Property Description <span class="mandatoryPerfection"> * </span>
				</td>
			<td><integro:wrapper value="<%=iCol.getDescription()%>" />&nbsp;</td>
			
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyCompletionStatus")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.completion.status"/></td>
		  	<td><integro:empty-if-null value='<%= PropertyCompletionStatusList.getInstance ().getPropertyCompletionStatusLabel (""+iCol.getPropertyCompletionStatus ()) %>'/>&nbsp;</td>
		</tr>
		<!-- Start Santosh -->
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Land Value 
				<%
				if(null!=iCol.getPropertyType() && PropertyTypeList.getInstance().getPropertyTypeLabel(iCol.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol.getLandValue()))%></td>
			<td class="fieldname">
				Building Value 
				<%if(null!=iCol.getPropertyType() &&!PropertyTypeList.getInstance().getPropertyTypeLabel(iCol.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol.getBuildingValue()))%></td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Reconstruction value of the Building 
				<%if(null!=iCol.getPropertyType() && !PropertyTypeList.getInstance().getPropertyTypeLabel(iCol.getPropertyType()).contains("LAND")) {%>
				<span class="mandatoryPerfection"> * </span>
				<%} %>
			</td>
			<td><%=UIUtil.formatWithCommaAndDecimal(String.format ("%.0f", iCol.getReconstructionValueOfTheBuilding()))%></td> 
		</tr>
		<!-- End Santosh -->
		</table>
	</td></tr>
	</tbody>
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
	     <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isPhysicalInspection")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification"/>&nbsp;<%--<span class="mandatoryPerfection">*</span></td>--%><span class="mandatoryPerfection">*</span></td>
    <td width="30%" ><integro:boolean-display style="yn" value="<%=iCol.getIsPhysicalInspection()%>"/>&nbsp;</td>
    <% boolean physicalUpdated = false;
        if (isProcess) {
            physicalUpdated = CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreq")||(iCol.getPhysicalInspectionFreq() < 0);
            physicalUpdated = physicalUpdated && CompareOBUtil.compOB(newCollateral, oldCollateral, "physicalInspectionFreqUnit");
        }
    %>
    <td class="<%=isProcess?(physicalUpdated?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.phy.verification.frequency"/><span class="mandatoryPerfection">*</span>
       
    </td>
    
        <% if (iCol.getPhysicalInspectionFreqUnit()!=null){ %>
        <td>
        <integro:common-code-single entryCode="<%=iCol.getPhysicalInspectionFreqUnit()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
        <% }else{ %>
        <td>-&nbsp;</td>
        <%} %>
        &nbsp;
    
</tr>
  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
	            <% if (iCol.getIsPhysicalInspection()) { %>
	                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                        <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% } else { %>
	                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"lastPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    <bean:message key="label.security.last.phy.verification.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
	            <% }%>
	            <%if( iCol.getLastPhysicalInspectDate()!=null){%>
	            <td><integro:date object="<%=iCol.getLastPhysicalInspectDate() %>"/>&nbsp;</td>
	            <%}else {%>
	            <td>-&nbsp;</td>
	            <%} %>
	            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextPhysicalInspectDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            <bean:message key="label.security.next.phy.verification.date"/><span class="mandatoryPerfection">*</span></td>
	            <%if(iCol.getNextPhysicalInspectDate()!=null){ %>
	            <td><integro:date object="<%=iCol.getNextPhysicalInspectDate()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td>-&nbsp;</td>
	            <%} %>
	            
	        </tr>

		

		<%@ include file="/collateral/common/common_environmental_risky_read.jsp" %>

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"tsrDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            <bean:message key="label.security.date.tsr"/><span class="mandatoryPerfection">*</span></td>
	            <%if(iCol.getTsrDate()!=null){ %>
	            <td><integro:date object="<%=iCol.getTsrDate()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td>-&nbsp;</td>
	            <%} %>
	
      	  
			
			
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"tsrFrequency")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.tsr.frequency"/>
				</td>
				
				<% if (iCol.getTsrFrequency()!=null){ %>
     		   <td>
   			     <integro:common-code-single entryCode="<%=iCol.getTsrFrequency()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
   			     <% }else{ %>
  			      <td>-&nbsp;</td>
  	     		 <%} %>
				
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"nextTsrDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            <bean:message key="label.security.next.tsr.date"/><span class="mandatoryPerfection">*</span></td>
	            <%if(iCol.getNextTsrDate()!=null){ %>
	            <td><integro:date object="<%=iCol.getNextTsrDate()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td>-&nbsp;</td>
	            <%} %>
	            
	            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"cersiaRegistrationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
	            <bean:message key="label.security.cersia.registration.date"/></td>
	            <%if(iCol.getCersiaRegistrationDate()!=null){ %>
	            <td><integro:date object="<%=iCol.getCersiaRegistrationDate()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td>-&nbsp;</td>
	            <%} %>
		
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Constitution<font color="#FF0000">*
			</font>
			</td>
				<%
					String collCode = "";
					if (iCol.getConstitution() != null) {
						collCode = iCol.getConstitution();
					}
				
				if( iCol.getConstitution()!=null && iCol.getConstitution()!=""){%>
	            <td><html:select property ="constitution" styleId="constitution" value ="<%=iCol.getConstitution()%>" disabled="true">
					<integro:common-code categoryCode="<%=CategoryCodeConstant.ENTITY%>" descWithCode="false" />
					</html:select>
					<html:errors property="constitution" />&nbsp;</td>
	            <%}else {%>
	           
	            <td><html:select property ="constitution" styleId="constitution" value="<%=collCode%>" disabled="true">
	            <option value="">Please Select </option>	
					</html:select>
					<html:errors property="constitution" />&nbsp;</td>

	            <%} %>
	        
		</tr>
		
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"envRiskyRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.remarks.sec.env.risk"/> </td>
			<td colspan="3">
		     <integro:wrapper value="<%=iCol.getEnvRiskyRemarks()%>" />&nbsp;</td>
		</tr>

		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">              
		  <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remarksProperty")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.remarks"/></td>
		  <td colspan="3"><integro:wrapper value="<%=iCol.getRemarksProperty()%>" />&nbsp;</td>
		</tr>

		</table>
	</td></tr>
	</tbody>
</table>

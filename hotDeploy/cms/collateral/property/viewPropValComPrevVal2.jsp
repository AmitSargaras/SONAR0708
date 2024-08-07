<%@page import="com.integrosys.cms.app.collateral.bus.type.property.IPropertyValuation2"%>
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
/* ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
	
	
	 IPropertyCollateral oldCollateral = (IPropertyCollateral) itrxValue.getCollateral();
	IPropertyCollateral newCollateral = (IPropertyCollateral) itrxValue.getStagingCollateral(); */
	
	IPropertyValuation2 propertyValuation2=(IPropertyValuation2)session.getAttribute(actionStr+".propertyValuation2");
	String claim="";
	
	if(propertyValuation2.getClaim()!=null && !propertyValuation2.getClaim().equals("")){
	if(propertyValuation2.getClaim().equals("Y")){
		claim="Yes";
	}
	else if(propertyValuation2.getClaim().equals("N")){
		claim="No";
	}
	}

	String fromEvent = request.getParameter("fromEvent");

	
	String isProcessStr = request.getParameter("isProcess");
	boolean isProcess = isProcessStr.equals("true");
	/* String subtype = request.getParameter("subtype");
	String formName = subtype+"Form";	
	PropertyForm colForm = (PropertyForm) request.getAttribute(formName); */
	int rowIdx= Integer.parseInt(request.getParameter("rowIdxInteger"));
	
	HashMap bankListMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.bankListMap");
	
	
	String saleValue=null;
	
	if(propertyValuation2.getSalePurchaseValue()!=null){
	//	Amount amt=propertyValuation2.getSalePurchaseValue();
		saleValue=propertyValuation2.getSalePurchaseValue();
		
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
			
			<td class="fieldname" width="20%">
			  	Property Id
			</td>
			<td width="30%"><integro:empty-if-null value="<%= propertyValuation2.getPropertyId()  %>"/></td>
			
			<td class="fieldname">
				Borrower's Name <span class="mandatoryPerfection"> * </span>
			</td>
			<td colspan="30%"><integro:wrapper value="<%=propertyValuation2.getDescOfAsset()%>" />&nbsp;</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
			<td class="fieldname" width="20%">
			  	<bean:message key="label.security.property.type"/><span class="mandatoryPerfection"> * </span>
			</td>
			<td width="30%"><integro:empty-if-null value="<%=PropertyTypeList.getInstance ().getPropertyTypeLabel ( propertyValuation2.getPropertyType() ) %>"/></td>
			
			<td class="fieldname">
				<bean:message key="label.security.property.property.usage"/></td>
			<td><integro:empty-if-null value="<%= PropertyUsageList.getInstance ().getPropertyUsageLabel (propertyValuation2.getPropertyUsage ()) %>"/></td>
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.sale.purchage.agree.val"/> </td>
			
			<%if(saleValue!=null){ %>
			<td><%=saleValue %>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
			<td class="fieldname">
				<bean:message key="label.security.property.dateof.receipt.title.deed"/></td>
				<%if(propertyValuation2.getDateOfReceiptTitleDeed()!=null){ %>
				<td><integro:date object="<%=propertyValuation2.getDateOfReceiptTitleDeed()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %>	
			
				
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<td class="fieldname">
				<bean:message key="label.security.property.previous.mortgage.creation.date"/>&nbsp;</td>
				<%if(propertyValuation2.getPreviousMortCreationDate()!=null){ %>
				<td><integro:date object="<%=propertyValuation2.getPreviousMortCreationDate()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %>
			<td class="fieldname">
				Mortgage Creation /Extension date	&nbsp;</td>
				<%if(propertyValuation2.getSalePurchaseDate()!=null){ %>
				<td><integro:date object="<%=propertyValuation2.getSalePurchaseDate()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %>	
			
		</tr>
		
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				<bean:message key="label.security.property.legal.audit.date"/></td>
			
			<%if(propertyValuation2.getLegalAuditDate()!=null){ %>
			<td><integro:date object="<%=propertyValuation2.getLegalAuditDate()%>"/>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
			<td class="fieldname"><bean:message key="label.security.property.intervening.period.search.date"/></td>
				<%if(propertyValuation2.getInterveingPeriSerachDate()!=null){ %>
				<td><integro:date object="<%=propertyValuation2.getInterveingPeriSerachDate()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %>
			
		</tr>
		
	
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Type of Mortage <span class="mandatoryPerfection"> * </span></td>
			<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_MORTGAGE_TYPE,propertyValuation2.getMortgageType())%>" />&nbsp;</td>
			<td class="fieldname">
				Document Received </td>
			<% if(propertyValuation2.getDocumentReceived() != null && !propertyValuation2.getDocumentReceived().equals("") 
					&& propertyValuation2.getDocumentReceived().equalsIgnoreCase("Y")){
			%>
				<td><%="Yes" %></td>
			<%}else{ %>
				<td><%="No" %></td>
			<%} %>
			
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Mortage Created By <span class="mandatoryPerfection"> * </span></td>
			<td><integro:empty-if-null value="<%=bankListMap.get(propertyValuation2.getMortgagecretaedBy())%>" />&nbsp;</td>
			<td class="fieldname">
				Bin Number&nbsp;</td>
				<%if(propertyValuation2.getBinNumber()!=null && !propertyValuation2.getBinNumber().equals("")&&!propertyValuation2.getBinNumber().equals("null")){ %>
			<td><%=propertyValuation2.getBinNumber()%>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Document Block </td>
			<% if(propertyValuation2.getDocumentBlock() != null && !propertyValuation2.getDocumentBlock().equals("") 
					&& propertyValuation2.getDocumentBlock().equalsIgnoreCase("on")){
			%>
				<td><input type="checkbox" checked="checked" disabled="disabled" /> </td>
			<%}else{ %>
				<td><input type="checkbox" disabled="disabled" /> </td>
			<%} %>	
			<!--  Added by Pramod Katkar for New Filed CR on 23-08-2013-->
			<td class="fieldname">
			Prior Claim <span class="mandatoryPerfection"> * </span></td>
			<td>
				<%if(claim!=null && !claim.equals("")){ %>
			<%=claim %>
			<%}else{ %>-
			<%} %>
			&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Type Of Claim -:</b>&nbsp;&nbsp;
			<%if(propertyValuation2.getClaimType()!=null && !propertyValuation2.getClaimType().equals("")){ %>
			<integro:common-code-single entryCode="<%=propertyValuation2.getClaimType()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.TYPE_OF_CLAIM%>" descWithCode="false" />
			<%}else{ %>-
			<%} %>
			
			</td>
			<!--End by Pramod Katkar-->
			
		</tr>
		
		
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Mortage Registered Reference &nbsp;</td>
			<%if(propertyValuation2.getMortageRegisteredRef()!=null && !propertyValuation2.getMortageRegisteredRef().equals("")){ %>
			<td colspan="3"><%=propertyValuation2.getMortageRegisteredRef() %>&nbsp;</td>
			<%}else{ %>
			<td colspan="3">-&nbsp;</td>
			<%} %>
			
		</tr>			
		
						
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    <td class="fieldname">Advocate/ Lawyer Name <span class="mandatoryPerfection"> * </span></td>
			 <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_ADV_NAME,propertyValuation2.getAdvocateLawyerName())%>"/>&nbsp;</td>
			 
			<td class="fieldname"><bean:message key="label.security.property.dev.occu.name.dtls"/> <span class="mandatoryPerfection"> * </span></td>
			<td><integro:wrapper  value="<%=propertyValuation2.getDeveloperGroupCompany() %>"/>&nbsp;</td>
		</tr>

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname"><bean:message key="label.security.prj.name"/></td>
            <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VEHICLE_DEALER,propertyValuation2.getProjectName())%>"/>&nbsp;</td>
            
			<td class="fieldname">
				<bean:message key="label.security.property.title.lot.no"/>
				</td>
			<td>
			<integro:common-code categoryCode="LOT_NO" entryCode="<%=propertyValuation2.getLotNumberPrefix()%>" display="true" descWithCode="false"/>&nbsp;
			<integro:empty-if-null value="<%=propertyValuation2.getLotNo()%>" />&nbsp;</td>				
		</tr>
		
		
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">Property Lot Location</td>
			<%if(propertyValuation2.getPropertyLotLocation()!=null && !propertyValuation2.getPropertyLotLocation().equals("")){ %>
			<td ><%=propertyValuation2.getPropertyLotLocation() %>&nbsp;</td>
			<%}else{ %>
			<td >-&nbsp;</td>
			<%} %>
			<td class="fieldname">Other City</td>
			<%if(propertyValuation2.getOtherCity()!=null && !propertyValuation2.getOtherCity().equals("")){ %>
			<td><%=propertyValuation2.getOtherCity() %>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
		</tr>
			
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Property Address 1 <span class="mandatoryPerfection"> * </span>
				</td>
			<td><integro:wrapper value="<%=propertyValuation2.getPropertyAddress()%>" />&nbsp;</td>
			<td class="fieldname">
				Property Address 2
				</td>
			<td><integro:wrapper value="<%=propertyValuation2.getPropertyAddress2()%>" />&nbsp;</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Property Address 3
				</td>
			<td><integro:wrapper value="<%=propertyValuation2.getPropertyAddress3()%>" />&nbsp;</td>
			<td class="fieldname">
				Property Address 4
				</td>
			<td><integro:wrapper value="<%=propertyValuation2.getPropertyAddress4()%>" />&nbsp;</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Property Address 5
				</td>
			<td><integro:wrapper value="<%=propertyValuation2.getPropertyAddress5()%>" />&nbsp;</td>
			<td class="fieldname">
				Property Address 6
				</td>
			<td><integro:wrapper value="<%=propertyValuation2.getPropertyAddress6()%>" />&nbsp;</td>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="fieldname">
				Property Description <span class="mandatoryPerfection"> * </span>
				</td>
			<td><integro:wrapper value="<%=propertyValuation2.getDescOfAsset()%>" />&nbsp;</td>
			
			
		</tr>
		<%@ include file="/collateral/addtionalDocumentFacilityDetails/view_additionalDocFacilityDetailsStatus_previousVal.jsp"%>
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


		

		<%@ include file="/collateral/common/comEnvRiskyPrevVal2.jsp" %>

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		
			<td class="fieldname" width="20%">
	            <bean:message key="label.security.date.tsr"/><span class="mandatoryPerfection">*</span></td>
	            <%if(propertyValuation2.getTsrDate()!=null){ %>
	            <td width="30%"><integro:date object="<%=propertyValuation2.getTsrDate()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td width="30%">-&nbsp;</td>
	            <%} %>
	
      	  
			
			
				<td class="fieldname">
					<bean:message key="label.security.tsr.frequency"/>
				</td>
				
				<% if (propertyValuation2.getTsrFrequency()!=null){ %>
     		   <td>
   			     <integro:common-code-single entryCode="<%=propertyValuation2.getTsrFrequency()%>"  display="true"
                                    		categoryCode="<%=CategoryCodeConstant.FREQUENCY%>" descWithCode="false" /></td>
   			     <% }else{ %>
  			      <td>-&nbsp;</td>
  	     		 <%} %>
				
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			
				<td class="fieldname">
	            <bean:message key="label.security.next.tsr.date"/><span class="mandatoryPerfection">*</span></td>
	            <%if(propertyValuation2.getNextTsrDate()!=null){ %>
	            <td><integro:date object="<%=propertyValuation2.getNextTsrDate()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td>-&nbsp;</td>
	            <%} %>
	            
	            <td class="fieldname">
	            <bean:message key="label.security.cersia.registration.date"/></td>
	            <%if(propertyValuation2.getCersaiRegDate()!=null){ %>
	            <td><integro:date object="<%=propertyValuation2.getCersaiRegDate()%>"/>&nbsp;</td>
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
					if (propertyValuation2.getConstitution() != null) {
						collCode = propertyValuation2.getConstitution();
					}
				
				if( propertyValuation2.getConstitution()!=null && propertyValuation2.getConstitution()!=""){%>
	            <td><html:select property ="constitution" styleId="constitution" value ="<%=propertyValuation2.getConstitution()%>" disabled="true">
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
			<td class="fieldname"><bean:message key="label.security.asset.remarks.sec.env.risk"/> </td>
			<td colspan="3">
		     <integro:wrapper value="<%=propertyValuation2.getEnvironmentRiskRemark()%>" />&nbsp;</td>
		</tr>

		
		

		</table>
	</td></tr>
	</tbody>
</table>

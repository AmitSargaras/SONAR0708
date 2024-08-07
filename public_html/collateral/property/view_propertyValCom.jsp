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
                com.integrosys.base.techinfra.diff.CompareResult,                 				
                com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ page import="org.apache.commons.lang.StringUtils" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%

	String actionStr = "com.integrosys.cms.ui.collateral.property.PropertyAction";
	ICollateralTrxValue itrxValue = (ICollateralTrxValue)session.getAttribute(actionStr+".serviceColObj");
	
	
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
	/* String subtype = request.getParameter("subtype");
	String formName = subtype+"Form";	
	PropertyForm colForm = (PropertyForm) request.getAttribute(formName); */
	int rowIdx= Integer.parseInt(request.getParameter("rowIdxInteger"));
	
	HashMap bankListMap = (HashMap)session.getAttribute("com.integrosys.cms.ui.collateral.property.PropertyAction.bankListMap");
	
	
	String saleValue=null;
	
	if(iCol.getSalePurchaseValue()!=null){
		Amount amt=iCol.getSalePurchaseValue();
		saleValue=amt.getAmountAsBigDecimal().toString();
		
		//Phase 3 CR:comma separated
		saleValue=UIUtil.formatWithCommaAndDecimal(saleValue);
	}
	
	String subtype = request.getParameter("subtype");
	String prefix = request.getParameter("prefix");
	
	
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
				<bean:message key="label.security.property.sale.purchage.agree.val"/><span class="mandatoryPerfection"> * </span>
			</td>
			
			<%if(saleValue!=null){ %>
			<td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<tr class="<%=(rowIdx)%2==0?"even":"odd"%>" >
						<td style="border:none">
							<span class="salePurchaseValue_InNum"><%=saleValue %></span>&nbsp;
						</td>
						<td style="border:none">
							<textarea id="salePurchaseValue_InWords" readonly="readonly" rows="3" cols="25" style="resize: none;"></textarea>
						</td>
					</tr>
				</table>
			</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"dateOfReceiptTitleDeed")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.dateof.receipt.title.deed"/></td>
				<%if(iCol.getDateOfReceiptTitleDeed()!=null){ %>
				<td><integro:date object="<%=iCol.getDateOfReceiptTitleDeed()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %>	
			
				
		</tr>
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		<%-- <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"previousMortCreationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.previous.mortgage.creation.date"/>&nbsp;</td>
				<%if(iCol.getPreviousMortCreationDate()!=null){ %>
				<td><integro:date object="<%=iCol.getPreviousMortCreationDate()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %> --%>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"salePurchaseDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Mortgage Creation /Extension date	&nbsp;</td>
				<%if(iCol.getSalePurchaseDate()!=null){ %>
				<td><integro:date object="<%=iCol.getSalePurchaseDate()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %>	
			
		</tr>
		
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"legalAuditDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.property.legal.audit.date"/></td>
			
			<%if(iCol.getLegalAuditDate()!=null){ %>
			<td><integro:date object="<%=iCol.getLegalAuditDate()%>"/>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
			<%} %>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"interveingPeriSearchDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.property.intervening.period.search.date"/></td>
				<%if(iCol.getInterveingPeriSearchDate()!=null){ %>
				<td><integro:date object="<%=iCol.getInterveingPeriSearchDate()%>"/>&nbsp;</td>
				<%}else{ %>
				<td>-&nbsp;</td>
				<%} %>
			
		</tr>
		
	
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"typeOfMargage")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Type of Mortage <span class="mandatoryPerfection"> * </span></td>
			<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_MORTGAGE_TYPE,iCol.getTypeOfMargage())%>" />&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"documentReceived")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Document Received </td>
			<% if(null != newCollateral.getDocumentReceived()  && !newCollateral.getDocumentReceived().trim().isEmpty()
					&& "Y".equals(newCollateral.getDocumentReceived().trim())){
			%>
				<td><%="Yes" %></td>
			<%}else if(null != newCollateral.getDocumentReceived()  && !newCollateral.getDocumentReceived().trim().isEmpty()
					&& "N".equals(newCollateral.getDocumentReceived().trim())){ %>
				<td><%="No" %></td>
			<%} else{%>
				<td><%="-"%></td>
			<%} %>
		</tr>
		
		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"morgageCreatedBy")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Mortage Created By <span class="mandatoryPerfection"> * </span></td>
			<td><integro:empty-if-null value="<%=bankListMap.get(newCollateral.getMorgageCreatedBy())%>" />&nbsp;</td>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"binNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
				Bin Number&nbsp;</td>
				<%if(iCol.getBinNumber()!=null && !iCol.getBinNumber().equals("")&&!iCol.getBinNumber().equals("null")){ %>
			<td><%=iCol.getBinNumber()%>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
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
		    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyLotLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">Advocate/ Lawyer Name <span class="mandatoryPerfection"> * </span></td>
			 <td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.HDFC_ADV_NAME,iCol.getAdvocateLawyerName())%>"/>&nbsp;</td>
			 
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
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"propertyLotLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">Property Lot Location</td>
			<%if(iCol.getPropertyLotLocation()!=null && !iCol.getPropertyLotLocation().equals("")){ %>
			<td ><%=iCol.getPropertyLotLocation() %>&nbsp;</td>
			<%}else{ %>
			<td >-&nbsp;</td>
			<%} %>
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"otherCity")?"fieldname":"fieldnamediff"):"fieldname"%>">Other City</td>
			<%if(iCol.getOtherCity()!=null && !iCol.getOtherCity().equals("")){ %>
			<td><%=iCol.getOtherCity() %>&nbsp;</td>
			<%}else{ %>
			<td>-&nbsp;</td>
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
			
			
		</tr>
		<%@ include file="/collateral/addtionalDocumentFacilityDetails/view_additionalDocFacilityDetailsStatus_summary.jsp"%>
		
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


		

		<%@ include file="/collateral/common/common_environmental_risky_read.jsp" %>

		<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		
			<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"tsrDate")?"fieldname":"fieldnamediff"):"fieldname"%>" width="20%">
	            <bean:message key="label.security.date.tsr"/><span class="mandatoryPerfection">*</span></td>
	            <%if(iCol.getTsrDate()!=null){ %>
	            <td width="30%"><integro:date object="<%=iCol.getTsrDate()%>"/>&nbsp;</td>
	            <%}else{ %>
	            <td width="30%">-&nbsp;</td>
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

		
		

		</table>
	</td></tr>
	</tbody>
</table>

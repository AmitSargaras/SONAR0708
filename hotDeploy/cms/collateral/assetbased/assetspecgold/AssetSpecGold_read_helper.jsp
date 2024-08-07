<%--Beatified and formatted by jj--%>
<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecplant.PlantEquipTypeList,
                 java.util.List,
                 java.util.ArrayList,
				 java.text.SimpleDateFormat,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.Arrays,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecgold.AssetSpecGoldForm,
                 java.util.Comparator,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargegold.ISpecificChargeGold,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecgold.GoldTypeList,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecgold.GoldGradeList,
                 com.integrosys.cms.ui.collateral.assetbased.assetspecgold.GoldUOMList,
                 com.integrosys.cms.ui.collateral.*,
				 com.integrosys.cms.ui.common.CommonCodeList" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header$
     *
     * Purpose: Helper page to display data for read and process
     * Description: Type - Asset Based (Gold Type)
     *
     * @author $Author: shphoon $<br>
     * @version $Revision: 1.2 $
     * Date: $Date: 2007/03/15 03:38:23 $
     * Tag: $Name:  $
     */
%>

<%
    ISpecificChargeGold oldCollateral = (ISpecificChargeGold) itrxValue.getCollateral();
    ISpecificChargeGold newCollateral = (ISpecificChargeGold) itrxValue.getStagingCollateral();
    

    String prefix = "Asset";
    String subtype = "AssetSpecGold";
    String formName = subtype+"Form";    
    String formActionName = subtype+"Collateral.do";
    String insuranceCheck=  (String) session.getAttribute("com.integrosys.cms.ui.collateral.assetbased.AssetBasedAction.insuranceCheck");

    
	AssetSpecGoldForm colForm = (AssetSpecGoldForm) request.getAttribute(formName);
    String goldUnitPriceCurrency = colForm.getGoldUnitPriceCurrency()==null?"":colForm.getGoldUnitPriceCurrency();
    Amount goldUnitPrice = iCol.getGoldUnitPrice();
	String getStr = "";
	boolean isNull = false;
	
	if("".equals(goldUnitPriceCurrency) && null!=goldUnitPrice){
		goldUnitPriceCurrency=goldUnitPrice.getCurrencyCode();
	}
	if(goldUnitPriceCurrency.equals("")||goldUnitPrice==null){
		isNull = true;
	}else{
		getStr = goldUnitPriceCurrency + " " + UIUtil.formatWithCommaAndDecimal(String.valueOf(goldUnitPrice.getAmountAsDouble()));
	}
	

%>

<tbody>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" align="center">
        <tbody>
             <%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<!--  Added by Pramod Katkar for New Filed CR on 21-08-2013-->
<%if("process".equals(from_event)){ %>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_object.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%}else{ %>
<tr>
    <td colspan="2">
		<table width="98%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%} %>
<!--End by Pramod Katkar-->
</tbody>
<tr>
</tbody>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
<%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<%--Govind S: Commented as required for HDFC Dev 04/07/2011
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
--%>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"assetType")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.gold.type"/>&nbsp;</td>
                <td width="30%"><% if (iCol.getAssetType() != null) { %>
                    <%--<integro:empty-if-null value="<%=GoldTypeList.getInstance().getGoldTypeItem(iCol.getAssetType().trim())%>"/><% } %>&nbsp;</td>--%>
                    <integro:empty-if-null value="<%=iCol.getAssetType().trim()%>"/><% } %>&nbsp;</td>
                <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"goldGrade")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.gold.grade"/>&nbsp;</td>
                <td width="30%"><% if (iCol.getGoldGrade() != null) { %>
                    <%--<integro:empty-if-null value="<%=GoldGradeList.getInstance().getGoldGradeItem(iCol.getGoldGrade().trim())%>"/><% } %>&nbsp;</td>--%>
                    <integro:empty-if-null value="<%=iCol.getGoldGrade().trim()%>"/><% } %>&nbsp;</td>
                    
            </tr>
            
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%--Govind S: Commented as required for HDFC Dev 04/07/2011
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"purchaseReceiptNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.purchase.receipt.num"/></span></td>
                <td><integro:empty-if-null value="<%=iCol.getPurchaseReceiptNo()%>"/>&nbsp;</td>
            --%>
                 <td class="fieldname" >
					<bean:message key="label.predeal.unit.price.feed"/></td>
                <td><%if(isNull){ %>-
                <%}else{ %>
                	<%=getStr %>&nbsp;
                    <% if (iCol.getGoldUnitPrice() != null) {
                         if (iCol.getGoldUnitPriceUOM() != null) { %>
                            /&nbsp;<integro:empty-if-null value="<%=GoldUOMList.getInstance().getGoldUOMItem(iCol.getGoldUnitPriceUOM().trim())%>"/><% } %>
                        <% } }%>&nbsp; 
					(<%=colForm.getFeedGoldUnitPrice()==null?"-":colForm.getFeedGoldUnitPrice() %>)
                </td>
 				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral, oldCollateral,"goldWeight")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.weight"/></td>
                <td><bean:write name="AssetSpecGoldForm" property="goldWeight"/>&nbsp;
                    <% if (iCol.getGoldWeight() != ICMSConstant.DOUBLE_INVALID_VALUE) {
                          if (iCol.getGoldUOM() != null) { %>
                            <integro:empty-if-null value="<%=GoldUOMList.getInstance().getGoldUOMItem(iCol.getGoldUOM().trim())%>"/><% } %>&nbsp;
                        <% } %>
                </td>
                
            </tr>
            
			<%--Govind S: Commented as required for HDFC Dev 04/07/2011
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"certExpiryDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.cert.expiry.date"/></td>
                <td><integro:date object="<%=iCol.getCertExpiryDate()%>"/>&nbsp;</td>
            </tr>
            --%>
			<%--Govind S: Commented as required for HDFC Dev 04/07/2011
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getPurchasePrice(),((oldCollateral==null)?null:oldCollateral.getPurchasePrice()),"Amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <span class=stp><bean:message key="label.security.purchase.value"/></span><bean:message key="label.mandatory"/></td>
                <td width="30%"><bean:write name="AssetSpecGoldForm" property="purchasePrice"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.perfection.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><integro:date object="<%=iCol.getPerfectionDate()%>" />&nbsp;</td>
            </tr>
			
            <%@ include file="/collateral/assetbased/asset_environment_risk_read.jsp" %>
            <%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
		
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getAuctionPrice(),
                	((oldCollateral==null)?null:oldCollateral.getPurchasePrice()),"Amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <span class=stp><bean:message key="label.security.auction.price"/></span></td>
                <td width="30%"><bean:write name="AssetSpecGoldForm" property="auctionPrice"/>&nbsp;</td>
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"auctioneer")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.auctioneer"/></span></td>
                <td><integro:empty-if-null value="<%=iCol.getAuctioneer()%>"/>&nbsp;</td>
            </tr>
			
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"auctionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp><bean:message key="label.security.auction.date"/></span></td>
                <td><integro:date object="<%=iCol.getAuctionDate()%>"/>&nbsp;</td>
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getSalesProceed(),((oldCollateral==null)?null:oldCollateral.getSalesProceed()),"Amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <span class=stp><bean:message key="label.security.asset.sales.proceed"/></span></td>
                <td width="30%"><bean:write name="AssetSpecGoldForm" property="salesProceed"/>&nbsp;</td>
            </tr>
--%>
            <%@ include file="/collateral/common/common_physical_inspection_read.jsp" %>
	
	<%--Govind S: Commented as required for HDFC Dev 04/07/2011		
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.maturity.date"/></td>
                <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>"/>&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
          
                       
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="fieldname">
					<bean:message key="label.security.borrower.collateral" /></td>
				<td><%=iCol.getIsBorrowerDependency() ? "Yes" : (!iCol.getIsBorrowerDependency() ? "No" : "-")%></td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isCGCPledged")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><integro:boolean-display style="yn" value="<%=iCol.getIsCGCPledged()%>"/></td>
			</tr>
			
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"envRiskyRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.asset.remarks.sec.env.risk"/></td>
                <td colspan="3"><integro:wrapper value="<%=iCol.getEnvRiskyRemarks()%>"/>&nbsp;</td>
            </tr>
--%>		
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.description"/></td>
				<td colspan="3">
					<% if (iCol.getRemarks() != null && !"".equals(iCol.getRemarks().trim())){ %>
						<integro:wrapper value="<%=iCol.getRemarks()%>"/>
					<%} else{ %>
						-
					<% }%>
					&nbsp;</td>
			</tr>
			
           <%--  <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.remarks"/>&nbsp;</td>
                <td colspan="3"><integro:wrapper value="<%=iCol.getRemarks()%>" />&nbsp;</td>
            </tr>--%>
            
            <%-- <%@ include file="/collateral/common/view_security_instrument.jsp" %> --%>
        </tbody>
		</table>
	</td>
</tr>
<tr><td>&nbsp;</td></tr>
</tbody>
</table>

<%--Govind S:HDFC 04/07/2011
<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>

<%@ include file="/collateral/assetbased/view_charge_summary.jsp" %>

 <!--View two valuation details-->
<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
 --%>
 
 
<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %>
<%
if(!"no".equals(insuranceCheck)) {
%>

<jsp:include page="/collateral/view_security_coverage.jsp" />
<%
}
%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>




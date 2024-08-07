<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.schargeothers.ISpecificChargeOthers,
                 java.util.List,
                 java.util.ArrayList,
				 java.text.SimpleDateFormat,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 java.util.Arrays,
                 com.integrosys.cms.ui.collateral.LEList,
                 java.util.Comparator,
				 com.integrosys.cms.ui.common.CommonCodeList" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetspecother/AssetSpecOther_read_helper.jsp,v 1.48 2006/09/29 03:38:15 nkumar Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Asset Based
*
* @author $Author: nkumar $<br>
* @version $Revision: 1.48 $
* Date: $Date: 2006/09/29 03:38:15 $
* Tag: $Name:  $
*/
%>

<%
    ISpecificChargeOthers oldCollateral = (ISpecificChargeOthers) itrxValue.getCollateral();
    ISpecificChargeOthers newCollateral = (ISpecificChargeOthers) itrxValue.getStagingCollateral();
    String subtype = "AssetSpecOther";
    String prefix = "Asset";
    String formName = subtype+"Form";
	String formActionName = subtype+"Collateral.do";
	
	AssetSpecOtherForm colForm = (AssetSpecOtherForm) request.getAttribute(formName);


%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
  
<%@page import="com.integrosys.cms.ui.collateral.assetbased.assetspecother.AssetSpecOtherForm"%><tbody>
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
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_object.jsp" %>
             <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%}else{ %>
<tr>
    <td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" >
        <tbody>
             <%@ include file="/collateral/view_common_security_fields.jsp" %>
             <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
<%} %>
<!--End by Pramod Katkar-->
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
	</tr>
	<tr>
		<td colspan="2"><hr/></td>
	</tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"goodStatus")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <span ><bean:message key="label.security.asset.goods.status"/>
                    
                    </span>
                   
                    </td>
                <td colspan="3">
                <integro:common-code
								categoryCode="<%=CategoryCodeConstant.GOODS_STATUS%>"
								entryCode="<%=iCol.getGoodStatus()%>"
								display="true" />&nbsp;</td>
            </tr>
            <%@ include file="/collateral/assetbased/asset_environment_risk_read.jsp" %><%--
            <%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
            --%><%--<%@ include file="/collateral/common/common_fields_read.jsp" %>
            
            --%>
            
            
            <%@ include file="/collateral/common/common_physical_inspection_read.jsp" %>
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<%--use Exchange Ctrl Date as a start date by sachin patil--%>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"exchangeCtrlDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.asset.start.date" /></td>
			<td ><integro:date object="<%=iCol.getExchangeCtrlDate()%>"/>
				&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.perfection.date"/></td>
				<td><integro:date object="<%=iCol.getPerfectionDate()%>" />&nbsp;</td>
				
					</tr>
			<%--<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>

            --%><tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.maturity.date" /></td>
                <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>"/> &nbsp;</td>
                <td>
                &nbsp;
                </td>
                <td>
                &nbsp;
                </td>
                
                 
                <%--<td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getNetRealisableAmount(),oldCollateral.getNetRealisableAmount(),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.valuation.reserve.price"/></td>
            <td width="30%"><bean:write name="<%=formName%>" property="netRealisableSecValue"/>&nbsp;</td>
          
	--%>
	
   
                
            	<%--<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"assetType")?"fieldname":"fieldnamediff"):"fieldname"%>">
        			<bean:message key="label.security.asset.other.type"/> &nbsp;<bean:message key="label.mandatory"/></td>
    			<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.AB_OTHERS_TYPE, iCol.getAssetType())%>"/>&nbsp;</td>
        	--%></tr>

			<%--<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isCGCPledged")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><integro:boolean-display style="yn" value="<%=iCol.getIsCGCPledged()%>"/></td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
		
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"envRiskyRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.remarks.sec.env.risk"/></td>
				<td colspan="3"><integro:wrapper lineLength="150" value="<%=iCol.getEnvRiskyRemarks()%>" />&nbsp;</td>
            </tr>
			
            --%>
            <%-- assetValue field is used for asset value at the time of collateral booking  by Scahin Patil
--%>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <%--use registration Fee as a Residual scrap value by sachin patil--%>
	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getScrapValue(),((oldCollateral==null)?null:oldCollateral.getScrapValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.residual.scrap.value.new"/></td>
    <td><!--<bean:write name="<%=formName %>" property="scrapValue"/>-->
    <%if(null!=iCol.getScrapValue() && !"".equals(iCol.getScrapValue())){ %>
     <%=UIUtil.formatWithCommaAndDecimal(iCol.getScrapValue().getAmountAsBigDecimal().toPlainString()) %>
     <%} %>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getAssetValue(),((oldCollateral==null)?null:oldCollateral.getAssetValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
        <bean:message key="label.security.asset.asset.value.collat.booking"/>
        <%--<span id="spanASSETVALUE"><bean:message key="label.mandatory"/></span>
        --%></td>
    <td><!-- <bean:write name="<%=formName %>" property="assetValue"/>-->
     <%if(null!=iCol.getAssetValue() && !"".equals(iCol.getAssetValue())){ %>
    <%=UIUtil.formatWithCommaAndDecimal(iCol.getAssetValue().getAmountAsBigDecimal().toPlainString()) %>
     <%} %>&nbsp;</td>
            </tr>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
                   <span ><bean:message key="label.security.desc.asset"/></span></td>
				<td colspan="3"><integro:wrapper lineLength="200" value="<%=iCol.getRemarks()%>" />&nbsp;</td>
            </tr>
			
            
        </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>



<%--<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>


--%><%--<%@ include file="/collateral/assetbased/view_charge_summary.jsp" %>

  --%><!--View two valuation details-->
<%--<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
--%><%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
<%--<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %>
--%>
<%--<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp"%>
--%>
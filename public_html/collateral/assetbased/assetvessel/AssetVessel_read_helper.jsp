<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.*,
                 com.integrosys.cms.ui.collateral.assetbased.RankList,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.vessel.IVessel,
                 com.integrosys.cms.ui.collateral.assetbased.assetvessel.CoverageTypeList,
                 com.integrosys.cms.ui.collateral.assetbased.assetvessel.VesselTypeList,
                 java.util.List,
                 java.util.ArrayList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.FrequencyList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.collateral.LEList,
                 java.util.Arrays,
				 java.text.SimpleDateFormat,
                 java.util.Comparator" %>

<%
    IVessel oldCollateral = (IVessel) itrxValue.getCollateral();
    IVessel newCollateral = (IVessel) itrxValue.getStagingCollateral();
    IVessel iCol1 = (IVessel) itrxValue.getCollateral();
    String subtype = "AssetVessel";
    String prefix = "Asset";
    String formName = subtype+"Form";
	String formActionName = subtype+"Collateral.do";
   
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<tbody>
<tr>
<td colspan="2">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
    <tbody>

     <%@ include file="/collateral/assetbased/view_common_asset.jsp" %>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%"
                 class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getPurchasePrice(),((oldCollateral==null)?null:oldCollateral.getPurchasePrice()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <bean:message key="label.security.asset.purchase.price"/>&nbsp;<bean:message key="label.mandatory"/></td>
            <td width="30%"><bean:write name="AssetVesselForm" property="purchasePrice"/>&nbsp;</td>
            <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"purchaseDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <span class=stp><bean:message key="label.security.asset.purchase.date"/></span></td>
            <td width="30%"><integro:date object="<%=iCol.getPurchaseDate()%>"/> &nbsp;</td>
         </tr>
<%--         
			<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselPurchaseCurrency")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.purchase.currency"/></td>
            <td width="30%"><bean:write name="AssetVesselForm" property="vesselPurchaseCurrency"/>&nbsp;</td>
--%>
		 
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"residualAssetLife")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <bean:message key="label.security.asset.residual.asset.life"/></td>
            <td><bean:write name="AssetVesselForm" property="residualAssetLife"/>&nbsp;
				<integro:empty-if-null value="<%=FrequencyList.getInstance().getFrequencyValue(iCol.getResidualAssetLifeUOM())%>"/></td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getScrapValue(),((oldCollateral==null)?null:oldCollateral.getScrapValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <span class=stp><bean:message key="label.security.asset.residual.scrap.value"/></span></td>
            <td><bean:write name="AssetVesselForm" property="vesselScrapValue"/>&nbsp;</td>
        </tr>
		 
        <%-- <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral.getAssetValue(),((oldCollateral==null)?null:oldCollateral.getAssetValue()),"amount")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <bean:message key="label.security.asset.asset.value"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselAssetValue"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"docPerfectAge")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <bean:message key="label.security.asset.ageofasset"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselDocPerfectAge"/>&nbsp;Year(s)</td>
        </tr>--%>

<%--         
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isExchangeCtrlObtained")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <bean:message key="label.security.leaseAgreement.exchange.control.approval.obtained"/></td>
            <td>
            <integro:common-code
				categoryCode="<%=CategoryCodeConstant.OPTION_LIST%>"
				entryCode="<%=newCollateral.getIsExchangeCtrlObtained() %>"
				display="true" />
            &nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral, oldCollateral,"exchangeCtrlDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <bean:message key="label.security.leaseAgreement.exchange.control.date"/></td>
            <td><bean:write name="AssetVesselForm" property="approvalDate"/>&nbsp;</td>
        </tr>
--%>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral, oldCollateral,"tradeInValue")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <bean:message key="label.security.asset.tradein.value"/></td>
            <td><bean:write name="AssetVesselForm" property="tradeInValue"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"tradeInDeposit")?"fieldname":"fieldnamediff"):"fieldname"%>">
                 <bean:message key="label.security.asset.tradein.deposit"/></td>
            <td><bean:write name="AssetVesselForm" property="tradeInDeposit"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"envRiskyRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.asset.remarks.sec.env.risk"/></td>
            <td colspan="3"><integro:wrapper value="<%=iCol.getEnvRiskyRemarks()%>"/>&nbsp;</td>
        </tr>
		
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<span class=stp><bean:message key="label.security.description.vessel"/></span>&nbsp;</td>
            <td colspan="3"><integro:wrapper value="<%=iCol.getRemarks()%>"/>&nbsp;</td>
        </tr>
        
    </tbody>
</table>
</td>
</tr>

<tr><td colspan="2">&nbsp;</td></tr>
<tr><td colspan="2">&nbsp;</td></tr>
<tr>
<td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td width="20%"  class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"assetType")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.vessel.type"/> &nbsp;<bean:message key="label.mandatory"/></td>
			<td width="30%"><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VESSEL_TYPE, iCol.getAssetType())%>"/>&nbsp;</td>
            <td width="20%"   class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselName")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.vessel.name"/></td>
            <td width="30%"><integro:empty-if-null value="<%=iCol.getVesselName()%>"/>&nbsp;</td>
        </tr>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"regCountry")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <span class=stp><bean:message key="label.security.port.reg"/></span></td>
			<td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getRegCountry())%>" />&nbsp; </td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselState")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.vessel.state"/></td>
			<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.VESSEL_STATE_TYPE, iCol.getVesselState())%>"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"insurers")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.asset.insurer"/></td>
            <td><bean:write name="AssetVesselForm" property="insurers"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"registrationDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.asset.registration.date"/> </td>
            <td width="30%"><integro:date object="<%=iCol.getRegistrationDate()%>"/> &nbsp;</td>
         </tr>


        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselExptOccupDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
               <bean:message key="label.security.expected.occupancy.date"/></td>
            <td><% if (!(iCol == null)) { %>
                <integro:date object="<%=iCol.getVesselExptOccupDate()%>"/>
                <% } %> &nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselExptOccup")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.expected.occupancy"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselExptOccup"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselOccupType")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.occupancy.type"/></td>
			<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.OCCUPANCY_TYPE, iCol.getVesselOccupType())%>"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselBuildYear")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.built.year"/> &nbsp;<bean:message key="label.mandatory"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselBuildYear"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselBuilder")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.builder"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselBuilder"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselMainReg")?"fieldname":"fieldnamediff"):"fieldname"%>">
               <bean:message key="label.security.main.reg"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselMainReg"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselLength")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.length"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselLength"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselWidth")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.width"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselWidth"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselDepth")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.secrity.depth"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselDepth"/>&nbsp;</td>

            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselDeckLoading")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.deck.load"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselDeckLoading"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselDeckWeight")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.deck.weight"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselDeckWeight"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselSideBoard")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.side.board"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselSideBoard"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselBOW")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.bow"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselBOW"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselDECK")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.deck"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselDECK"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselDeckThickness")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.deck.thickness"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselDeckThickness"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselBottom")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.bottom"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselBottom"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselWinchDrive")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.winch.drive"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselWinchDrive"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselBHP")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.bhp"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselBHP"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselSpeed")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.speed"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselSpeed"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselUse")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.vessel.use"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselUse"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselAnchor")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.anchor"/></td>
            <td><bean:write name="AssetVesselForm" property="vesselAnchor"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselAnchorDrive")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.anchor.drive"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselAnchorDrive"/>&nbsp;</td>
        </tr>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselConstructPlace")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.place.construction"/> </td>
			<td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getVesselConstructPlace())%>" />&nbsp; </td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselConstructCountry")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.country.construction"/> </td>
			<td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getVesselConstructCountry())%>" />&nbsp; </td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselCharterContract")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.charter.contract"/> </td>
             <td><integro:boolean-display style="yn" value="<%=iCol.getVesselCharterContract()%>"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselChartererName")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.charterer.name"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselChartererName"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselCharterPeriod")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.charter.period"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselCharterPeriod"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselClassSociety")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.class.society"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselClassSociety"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselCharterAmt")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.charter.amount"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselCharterAmt"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselCharterCurrency")?"fieldname":"fieldnamediff"):"fieldname"%>">
                <bean:message key="label.security.charter.currency"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselCharterCurrency"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselCharterRateUnit")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.charter.rate"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselCharterRateUnit"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselCharterRateUnitOTH")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.charter.rate.other"/> </td>
            <td><bean:write name="AssetVesselForm" property="vesselCharterRateUnitOTH"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"pubTransport")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<span class=stp><bean:message key="label.security.asset.public.transport"/></span><bean:message key="label.mandatory"/></td>
            <td><bean:write name="AssetVesselForm" property="pubTransport"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"chattelSoldDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<span class=stp><bean:message key="label.security.asset.date.chattel.sold"/></span></td>
            <td><bean:write name="AssetVesselForm" property="chattelSoldDate"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"rlSerialNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<span class=stp><bean:message key="label.security.asset.rl.serialno"/></span></td>
            <td><bean:write name="AssetVesselForm" property="rlSerialNumber"/>&nbsp;</td>
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"repossessionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<span class=stp><bean:message key="label.security.asset.repossession.date"/></span></td>
            <td><bean:write name="AssetVesselForm" property="repossessionDate"/>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"modelNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<span class=stp><bean:message key="label.security.asset.model"/></span></td>
			<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ASSET_MODEL_TYPE, iCol.getModelNo())%>"/>&nbsp;</td>
            <td class="fieldname">&nbsp; </td>
            <td>&nbsp;</td>
        </tr>

        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"vesselCharterRemarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
				<bean:message key="label.security.charter.remark"/></td>
            <td colspan="3">
                <bean:write name="AssetVesselForm" property="vesselCharterRemarks"/>&nbsp;</td>
        </tr>
        <%--
			<%@ include file="/collateral/common/view_security_instrument.jsp" %>
		--%>
        </tbody>
     </table>
</td>

</tr>
</tbody>

<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>

<%--
	<%@ include file="/collateral/secapportion/view_apportion_summary.jsp" %> 
--%>

<%@ include file="/collateral/assetbased/view_charge_summary.jsp" %>

<%-- View three valuation details --%>
<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>

<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %>



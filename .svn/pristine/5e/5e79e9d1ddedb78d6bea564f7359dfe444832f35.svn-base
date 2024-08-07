<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.asset.OBAssetBasedCollateral,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.*,
				 java.text.SimpleDateFormat,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recopen.IReceivableOpen,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.assetbased.NatureOfAssignmentList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
				 com.integrosys.base.businfra.currency.Amount"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    String natureOfAssignment = null;
    String amt1 = null;
    Date dateLegallyAssigned = null;
    pageContext.setAttribute("obj", iCol);
    ILimitCharge ilimitcharge[] = iCol.getLimitCharges();

    if (ilimitcharge.length > 0) {
        natureOfAssignment = ilimitcharge[0].getNatureOfCharge();
        Amount amountOfAssignment = ilimitcharge[0].getChargeAmount();
        if (amountOfAssignment != null && amountOfAssignment.getCurrencyCode() != null) {
            amt1 = CurrencyManager.convertToString(request.getLocale(), amountOfAssignment);
        } else {
            amt1 = "-";
        }
        dateLegallyAssigned = ilimitcharge[0].getLegalChargeDate();

    } else {
        natureOfAssignment = "-";
        amt1 = "-";

    }

    IReceivableOpen oldCollateral = (IReceivableOpen) itrxValue.getCollateral();
    IReceivableOpen newCollateral = (IReceivableOpen) itrxValue.getStagingCollateral();
    boolean isOnlyOneNull = false;
    boolean isBothNull = false;
    ILimitCharge oldLimit = null;
    if (oldCollateral != null &&
    		oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
        oldLimit = oldCollateral.getLimitCharges()[0];
    }

    ILimitCharge newLimit = null;
    if (newCollateral != null) {
        if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
            newLimit = newCollateral.getLimitCharges()[0];
        }
    }
    boolean isOldNewLimitNull = (oldLimit == null) && (newLimit == null);
    ILimitCharge[] limit = iCol.getLimitCharges();
    ILimitCharge objLimit = null;
    if (limit != null && limit.length > 0) {
        objLimit = limit[0];
    }
    boolean isLimitNull = (objLimit == null);
    boolean isOldNewColNull = false;
    isOnlyOneNull = (oldLimit == null) ^ (newLimit == null);
    isOldNewColNull = (oldLimit == null) && (newLimit == null);
    Amount newChargeAmt = null;
    Amount oldChargeAmt = null;
    if (newLimit != null)
        newChargeAmt = newLimit.getChargeAmount();
    if (oldLimit != null)
        oldChargeAmt = oldLimit.getChargeAmount();

    Amount amt;

    String subtype = "AssetRecOpen";
    String prefix = "Asset";
    String formName = subtype+"Form";
	String formActionName = subtype+"Collateral.do";

%>


<!-- InstanceBeginEditable name="Content" -->

<tbody>
    <tr>
        <td colspan="2">
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
			</tbody>
        </table>
		</td>
	</tr>
</tbody>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
</table>

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
              <%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
              <%@ include file="/collateral/common/common_fields_read.jsp" %>

             <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.maturity.date" />&nbsp;<span class="mandatoryPerfection">*</span></td>
                <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>"/> &nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.charge.type"/>&nbsp;<bean:message key="label.mandatory"/></td>
				<td><% if (!isLimitNull) { %>
					<integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
					<% } %>&nbsp;</td>
            </tr>


			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=(isProcess?((CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"amount"))?"fieldname":"fieldnamediff"):"fieldname")%>">
					<bean:message key="label.security.amount.assignment"/>&nbsp;<bean:message key="label.mandatory"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
				<td><%=amt1%>&nbsp;</td>
				<td class="<%=(isProcess?((CompareOBUtil.compOB(newLimit,oldLimit,"natureOfCharge"))?"fieldname":"fieldnamediff"):"fieldname")%>">
					<bean:message key="label.security.nature.assignment"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=NatureOfAssignmentList.getInstance().getNatureOfAssignmentItem(natureOfAssignment)%>"/>&nbsp;</td>
			</tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=(isProcess?((CompareOBUtil.compOB(newLimit,oldLimit,"legalChargeDate"))?"fieldname":"fieldnamediff"):"fieldname")%>">
					<bean:message key="label.security.asset.date.legally"/></td>
				<td><integro:date object="<%=dateLegallyAssigned%>"/>&nbsp;</td>
				<td class="fieldname">
					<bean:message key="label.security.asset.remaining.contract.period"/>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			
		<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
		
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"approvedBuyer")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.asset.approved.buyer" /> </td>
                <td><bean:write  name="AssetRecOpenForm" property="approvedBuyer"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"approvedBuyerLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.asset.approved.buyer.loc" /> </td>
                <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getApprovedBuyerLocation())%>"/>&nbsp;</td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		        <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"invoiceType")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.asset.types.invoices" /></td>
				<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.INVOICE_TYPE, iCol.getInvoiceType())%>"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isCGCPledged")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><integro:boolean-display style="yn" value="<%=iCol.getIsCGCPledged()%>"/></td>
            </tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"remarks")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<span class=stp> <bean:message key="label.security.asset.description"/></span> </td>
				<td colspan="3">
					<% if (iCol.getRemarks() != null && !"".equals(iCol.getRemarks().trim())){ %>
						<integro:wrapper value="<%=iCol.getRemarks()%>"/>
					<%} else{ %>
						-
					<% }%>
					&nbsp;</td>
			</tr>

     			<%--<%@ include file="/collateral/common/view_security_instrument.jsp" %> --%>
            </tbody>
        </table></td>
    </tr>
</tbody>
</table>
<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>


 <!--View two valuation details-->
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>

<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %>

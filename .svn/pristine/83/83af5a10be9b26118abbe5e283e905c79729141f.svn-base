<%@ page import="com.integrosys.cms.app.collateral.trx.ICollateralTrxValue,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.Date,
				 java.text.SimpleDateFormat,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.collateral.bus.type.asset.subtype.recspecnoa.IReceivableSpecificNoAgent,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.assetbased.NatureOfAssignmentList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.collateral.BookingLocationList,	                 
				 com.integrosys.base.businfra.currency.Amount,
				 com.integrosys.cms.ui.common.CommonCodeList" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/collateral/assetbased/assetrecspecnonagent/assetRecSpecNonAgent_read.jsp
     * Purpose: Read Collateral
     * Description: Type - AssetBased, Subtype - Assetrecspecnonagent
     *
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.50 $
     * Date: $Date: 2006/10/27 08:25:19 $
     * Tag: $Name:  $
     */
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/emulation.js"></script>
    <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
    <script language="JavaScript" src="js/itgCheckForm.js"></script>
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>

    <script language="JavaScript" type="text/JavaScript">
        function MM_preloadImages() { //v3.0
            var d = document;
            if (d.images) {
                if (!d.MM_p) d.MM_p = new Array();
                var i,j = d.MM_p.length,a = MM_preloadImages.arguments;
                for (i = 0; i < a.length; i++)
                    if (a[i].indexOf("#") != 0) {
                        d.MM_p[j] = new Image;
                        d.MM_p[j++].src = a[i];
                    }
            }
        }

        function gotopage(aLocation) {
            window.location = aLocation;
        }

    </script>
    
</head>

<body>
<%
    String natureOfAssignment = null;
    String amt1 = null;
    String dtlegallyassigned = null;
    pageContext.setAttribute("obj", iCol);
    ILimitCharge ilimitcharge[] = iCol.getLimitCharges();
    Date dateLegallyAssigned = null;
    if (ilimitcharge.length > 0) {
        natureOfAssignment = ilimitcharge[0].getNatureOfCharge();
        Amount amountOfAssignment = ilimitcharge[0].getChargeAmount();
        if (amountOfAssignment != null && amountOfAssignment.getCurrencyCode() != null) {
            amt1 = CurrencyManager.convertToString(request.getLocale(), amountOfAssignment);
        } else {
            amt1 = "-";
        }
        dateLegallyAssigned = ilimitcharge[0].getLegalChargeDate();
        dtlegallyassigned = DateUtil.convertToDisplayDate(dateLegallyAssigned);

    } else {
        natureOfAssignment = "-";
        amt1 = "-";
        dtlegallyassigned = "-";

    }


    IReceivableSpecificNoAgent oldCollateral = (IReceivableSpecificNoAgent) itrxValue.getCollateral();
    IReceivableSpecificNoAgent newCollateral = (IReceivableSpecificNoAgent) itrxValue.getStagingCollateral();
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

    String subtype = "AssetRecSpecNonAgent";
    String prefix = "Asset";
    String formName = subtype+"Form";
	String formActionName = subtype+"Collateral.do";
   
%>

<tbody>
    <tr>
        <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
			<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
        </tbody>
        </table>
    </td>
</tr>
</tbody>
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
                <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>"/>&nbsp;</td>
                <td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.charge.type" />&nbsp; <span class="mandatory"/></td>
                <td><% if (!isLimitNull) { %>
                        <integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
                    <% } %>&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=(isProcess?((CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"amount"))?"fieldname":"fieldnamediff"):"fieldname")%>">
                    <bean:message key="label.security.asset.amountdesc.assignment"/> &nbsp;<bean:message key="label.mandatory"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
                <td><%=amt1%>&nbsp;</td>
                <td class="<%=(isProcess?((CompareOBUtil.compOB(newLimit,oldLimit,"natureOfCharge"))?"fieldname":"fieldnamediff"):"fieldname")%>">
                    <bean:message key="label.security.asset.nature.assignment"/> &nbsp; <span class="mandatoryPerfection"/></td>
                <td><integro:empty-if-null value="<%=NatureOfAssignmentList.getInstance().getNatureOfAssignmentItem(natureOfAssignment)%>"/>&nbsp;</td>
            </tr>
			
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=(isProcess?((CompareOBUtil.compOB(newLimit,oldLimit,"legalChargeDate"))?"fieldname":"fieldnamediff"):"fieldname")%>">
                    <bean:message key="label.security.asset.date.legally" /></td>
                <td><integro:date object="<%=dateLegallyAssigned%>"/>&nbsp;</td>
                <td class="fieldname">
					<bean:message key="label.security.asset.remaining.contract.period"/>&nbsp;</td>
                <td width="30%">&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isOwnProceedsOfReceivables")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.asset.proceeds.receivables.control" /></td>
				<td><% if (iCol.getIsOwnProceedsOfReceivables()) { %>
						<bean:message key="label.common.yes"/>
					<% } else { %>
						<bean:message key="label.common.no"/>
					<% } %>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"ownAccNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.proceeds.receivables.credit" /></td>
                <td><bean:write  name="AssetRecSpecNonAgentForm" property="proceedRecToBank"/>&nbsp;</td>
			</tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"bankAccNoLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.location.bank" /> </td>
				<td>
				<integro:common-code display="true" categoryCode="40"  entryCode="<%=iCol.getBankAccNoLocation() %>"/>
		        <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"invoiceType")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.asset.types.invoices" /></td>
				<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.INVOICE_TYPE, iCol.getInvoiceType())%>"/>&nbsp;</td>
            </tr>

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isExchangeCtrlObtained")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.exchange.ctr.app" /> </td>
				<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.EXCHANGE_CONTROL, iCol.getIsExchangeCtrlObtained())%>"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"exchangeCtrlDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.exchange.ctr.app.date" /></td>
				<td><integro:date object="<%=iCol.getExchangeCtrlDate()%>"/>
					&nbsp;</td>
			</tr>
		
<%--           <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"approvedBuyer")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.asset.approved.buyer" /> </td>
                <td><bean:write  name="AssetRecSpecNonAgentForm" property="approvedBuyer"/>&nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"approvedBuyerLocation")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.asset.approved.buyer.loc" /> </td>
                <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getApprovedBuyerLocation())%>"/>&nbsp;</td>
            </tr>--%>

			<!--added  for gcms-->
<%--			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"projectName")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.prj.name" /> </td>
		    	<td><bean:write property="projectName"name="AssetRecSpecNonAgentForm" />&nbsp;</td>
		    	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"dateAwarded")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.doa" /></td>
		    	<td><integro:empty-if-null value="<%=iCol.getDateAwarded()%>"/>&nbsp;</td>
			</tr>
			
			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		    	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"letterInstructFlag")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.irr.loi" /></td>
		    	<td><% if (iCol.getLetterInstructFlag()) { %>
						<bean:message key="label.common.yes"/>
					<% } else { %>
						<bean:message key="label.common.no"/>
					<% } %> &nbsp;</td>
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"letterUndertakeFlag")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.lou" /></td> </td>
				<td><% if (iCol.getLetterUndertakeFlag()) { %>
						<bean:message key="label.common.yes"/>
					<% } else { %>
						<bean:message key="label.common.no"/>
					<% } %>&nbsp;</td>
			</tr>	

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"blanketAssignment")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    <bean:message key="label.security.prj.name.ba" /></td>
				<td><bean:write property="blanketAssignment" name="AssetRecSpecNonAgentForm" />&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp; </td>
			</tr> --%>
			<!--end  for gcms-->

			<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isCGCPledged")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.security.asset.cgc.pledged"/> </td>
				<td><integro:boolean-display style="yn" value="<%=iCol.getIsCGCPledged()%>"/></td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp; </td>
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
			
			<%-- <%@ include file="/collateral/common/view_security_instrument.jsp" %> --%>
			</tbody>
			</table>
	</td>
</tr>
</tbody>
</table>

<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>

 <!--View two valuation details-->
<%@ include file="/collateral/common/view_valuation_from_los.jsp"%>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>

<%@ include file="/collateral/insurancepolicy/view_insurance_summary.jsp" %>

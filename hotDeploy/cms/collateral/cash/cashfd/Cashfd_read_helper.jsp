<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.cms.app.collateral.bus.type.cash.ICashDeposit,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 java.util.List,
                 java.util.ArrayList,
				 java.text.SimpleDateFormat,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.cash.NatureOfChargeList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.app.collateral.bus.type.cash.subtype.cashfd.ICashFd" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>


<%
   
    ICashFd oldCollateral = (ICashFd) itrxValue.getCollateral();
    ICashFd newCollateral = (ICashFd) itrxValue.getStagingCollateral();

    String prefix = "Cash";
    String subtype = "CashFd";
    String formName = subtype +"Form";
    String formActionName = subtype + "Collateral.do";

%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<!-- InstanceBeginEditable name="Content" -->

<tbody>
<tr>
    <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
                <%
                    ILimitCharge[] limit = iCol.getLimitCharges();
                    ILimitCharge objLimit = null;
                    if (limit != null && limit.length > 0) {
                        objLimit = limit[0];
                    }
                    ILimitCharge oldLimit = null;
                    ILimitCharge newLimit = null;
                    Amount oldChargeAmt = null;
                    Amount newChargeAmt = null;
                    if (isProcess) {
                        if (oldCollateral !=null && oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
                            oldLimit = oldCollateral.getLimitCharges()[0];
                        }
                        if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
                            newLimit = newCollateral.getLimitCharges()[0];
                        }
                        if (oldLimit != null) {
                            oldChargeAmt = oldLimit.getChargeAmount();
                        }
                        if (newLimit != null) {
                            newChargeAmt = newLimit.getChargeAmount();
                        }
                    }
                    boolean isLimitNull = (objLimit == null);
                %>
            </tbody>
        </table>
    </td>
</tr>
<tr>
    <td colspan="2">&nbsp;</td>
</tr>
 <%@ include file="/collateral/view_collateral_general_common_field.jsp" %>
</tbody>
</table>

<!--CERSAI Fields JSP and Prefix field required -->
 <%@ include file="/collateral/common/view_common_cersai_fields.jsp" %>

<%--<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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
				<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
				
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral, oldCollateral,"isInterestCapitalisation")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    <bean:message key="label.security.internet.capitalisation"/>&nbsp;<bean:message key="label.mandatory"/></td>
                    <td width="30%"><integro:boolean-display style="yn" value="<%=iCol.getIsInterestCapitalisation()%>"/>&nbsp;</td>
                    <td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"natureOfCharge")?"fieldname":"fieldnamediff"):"fieldname"%>">
	                    <bean:message key="label.security.nature.pledge"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
                    <td width="30%">
						<% if (!isLimitNull) { %>
	                        <integro:empty-if-null value="<%=NatureOfChargeList.getInstance().getNatureOfChargeItem(objLimit.getNatureOfCharge())%>"/>
                        <% } %> &nbsp; </td>
                </tr>

                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <% boolean changed = false;
                        if (isProcess) {
                            if (newChargeAmt != null && oldChargeAmt == null) {
                                if (newChargeAmt.getAmount() != 0) {
                                    changed = true;
                                }
                            } else if (newChargeAmt != null && oldChargeAmt != null) {
                                changed = !CompareOBUtil.compOB(newChargeAmt, oldChargeAmt, "amount");
                            }
                        }
                    %>
                    <td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>">
                    	<bean:message key="label.security.amount.pledge"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
                    <td><% if (!isLimitNull) { %>
	                        <bean:write name="CashFdForm" property="amtCharge"/>
                        <% } %> &nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"legalChargeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.date.legal.pledge"/></td>
                    <td><% if (!isLimitNull) { %>
	                        <integro:date object="<%=objLimit.getLegalChargeDate()%>"/>
                        <% } %> &nbsp; </td>
                </tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    	<bean:message key="label.security.pledge.type"/>&nbsp;<bean:message key="label.mandatory"/></td>
                    <td><% if (!isLimitNull) { %>
                        <integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
                        <% } %>&nbsp;</td>
					<td class="fieldname">
						<bean:message key="label.security.borrower.collateral" /></td>
					<td><%=iCol.getIsBorrowerDependency() ? "Yes" : (!iCol.getIsBorrowerDependency() ? "No" : "-")%></td>
				</tr>

                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"creditCardRefNumber")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    	<bean:message key="label.security.credit.card.fd"/></td>
	                <td><bean:write name="CashFdForm" property="creditCardRefNumber"/>&nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isCGCPledged")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    	<bean:message key="label.security.cgc.pledged"/></td>
                    <td width="30%"><integro:boolean-display style="yn" value="<%=iCol.getIsCGCPledged()%>"/>&nbsp;</td>
                </tr>

                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">  
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"issuer")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    	<span class=stp><bean:message key="label.security.security.issuer"/></span>&nbsp;<bean:message key="label.mandatory"/></td>
	                <td><bean:write name="CashFdForm" property="issuer"/></td>
					<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"perfectionDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
						<bean:message key="label.security.perfection.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
					<td><integro:date object="<%=iCol.getPerfectionDate()%>" />&nbsp;</td>
                </tr>
				
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">  
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"priCaveatGuaranteeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    	<bean:message key="label.security.private.caveat"/></td>
					<td><integro:date object="<%=iCol.getPriCaveatGuaranteeDate()%>"/></td>
					<td class="fieldname">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>

				
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">  
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"description")?"fieldname":"fieldnamediff"):"fieldname"%>">
                    	<bean:message key="label.security.description.fd"/>&nbsp;</td>
	                <td colspan="3"><bean:write name="CashFdForm" property="description"/>&nbsp;</td>

				
                <%@ include file="/collateral/common/view_security_instrument.jsp" %>
            </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>
<%@ include file="/collateral/common/view_valuation_input_into_gcms.jsp"%>
--%><%--<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>
--%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
	<tr>
		<td width="20%"><h3>FD Rebooking</h3></td>
		<%System.out.println("colForm.getFdRebooking() "+itrxValue.getStagingCollateral().getFdRebooking());
		if(null!=itrxValue.getStagingCollateral().getFdRebooking() && "Y".equals(itrxValue.getStagingCollateral().getFdRebooking().trim())) {%>
		<td width="30%" disabled=true>
			<input type="radio" id="fdRebooking" name="fdRebooking" value="Yes" checked>Yes
            <input type="radio" id="fdRebooking" name="fdRebooking" value="No" >No 
            	</td>
            <%}else if(null!=itrxValue.getStagingCollateral().getFdRebooking() && "N".equals(itrxValue.getStagingCollateral().getFdRebooking().trim())){ %>
            <td width="30%" disabled=true>
			<input type="radio" id="fdRebooking" name="fdRebooking" value="Yes" >Yes
            <input type="radio" id="fdRebooking" name="fdRebooking" value="No" checked>No       
            	</td>      
            <%}else{ %>
            <td width="30%" disabled=true>
            <input type="radio" id="fdRebooking" name="fdRebooking" value="Yes" >Yes
            <input type="radio" id="fdRebooking" name="fdRebooking" value="No" >No   
            	</td>          
            <%} %>
		<td></td><td></td>
	</tr>
	<tr>
		<td colspan="4"><hr/></td>
	</tr>
</thead>
</table>
<%@ include file="/collateral/cash/cashfd/list_FixedDeposit_read.jsp" %>

<%--<%@ include file="/collateral/common/view_system_valuation.jsp" %>
<%@ include file="/collateral/common/view_valuation_from_los.jsp" %>
<%@ include file="/collateral/common/view_netRV.jsp" %>

--%><br>

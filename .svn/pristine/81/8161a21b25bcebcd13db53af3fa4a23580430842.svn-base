<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.ICollateral,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.collateral.bus.type.insurance.subtype.creditderivative.ICreditDerivative,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.collateral.LEList,
                 com.integrosys.cms.ui.collateral.ExchangeControlList,
                 com.integrosys.cms.ui.collateral.ChargeTypeList,
                 com.integrosys.cms.ui.collateral.insprotection.NatureOfChargeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.cms.ui.collateral.BookingLocationList"%>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/insprotection/inscrdtderiv/InsCrdtDeriv_read_helper.jsp,v 1.34 2006/07/27 01:57:53 jzhan Exp $
*
* Purpose: Helper page to display data for read and process
* Description: Type - Insurance, Subtype - Credit Derivatives
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.34 $
* Date: $Date: 2006/07/27 01:57:53 $
* Tag: $Name:  $
*/
%>

<%
    ICreditDerivative oldCollateral = (ICreditDerivative) itrxValue.getCollateral();
    ICreditDerivative newCollateral = (ICreditDerivative) itrxValue.getStagingCollateral();
    String prefix = "Ins";
    String subtype = "InsCrdtDeriv";
    String formName = subtype+"Form";
    String formActionName = subtype+"Collateral.do";
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
  <tbody>
    <tr>
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
			<%@ include file="/collateral/common/view_basic_security_fields.jsp" %>
<%--            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              <td class="fieldname"><bean:message key="label.security.fsv"/></td>
              <td>
              <integro:currency amount="<%=iCol.getSCIFSV()%>" param="amount" />&nbsp;
              </td>
				<td class="fieldname">&nbsp;</td>
				<td>&nbsp;</td>          
          </tr>
            <tr class="even">
            <%@ include file="/collateral/common/common_security_custodian_read.jsp" %>
            <td class="fieldname">&nbsp;</td>
            <td>&nbsp;</td>
            </tr>--%>
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
                    if (oldCollateral != null && oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
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
        </table></td>
    </tr>
  </tbody>
</table>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
	<thead>
		<tr>
			<td colspan="2"><h3><bean:message key="label.security.additional.information"/></h3></td>
		</tr>
		<tr>
			<td><hr/></td>
		</tr>
	</thead>
	<tbody>
    <tr>
      <td colspan="2">
	
		<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
               	<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"description")?"fieldname":"fieldnamediff"):"fieldname"%>">
               		<bean:message key="label.credit.derivative.instrument.desc"/></td>
               	<td colspan="3"><integro:wrapper value="<%=iCol.getDescription()%>" />&nbsp;</td>
            </tr>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              	<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.security.maturity.date"/>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td width="30%"><integro:date object="<%=iCol.getCollateralMaturityDate()%>" />&nbsp;</td>
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"iSDADate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.isda.master.agreement.date"/>&nbsp;<span class="mandatory">*</span></td>
              	<td width="30%"><integro:date object="<%=iCol.getISDADate()%>" />&nbsp;</td>
            </tr>
            
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"treasuryDocDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.treasury.doc.date"/>&nbsp;<span class="mandatory">*</span></td>
              	<td width="30%"><integro:date object="<%=iCol.getTreasuryDocDate()%>" />&nbsp;</td>
            	<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isBankRiskConfirmation")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.bank.risk.approval.confirmation"/>&nbsp;<span class="mandatoryPerfection">*</span>&nbsp;</td>
              	<td><%  String bankRisk = "";
                  		if (iCol.getIsBankRiskConfirmation() != null) {
                  		if (iCol.getIsBankRiskConfirmation().equals(ICMSConstant.TRUE_VALUE)) {
                      		bankRisk = "Yes";
                  		} else if (iCol.getIsBankRiskConfirmation().equals(ICMSConstant.FALSE_VALUE)) {
                      		bankRisk = "No";
                  		} else if (iCol.getIsBankRiskConfirmation().equals(ICMSConstant.NOT_AVAILABLE_VALUE)) {
                      		bankRisk = "Not Applicable";
                  		} } %>
              		<%=bankRisk%>&nbsp;</td>
            </tr>
            
			<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
			
<%--              <tr class="odd">
            <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isExchangeCtrlObtained")?"fieldname":"fieldnamediff"):"fieldname"%>">
              <bean:message key="label.security.exchange.ctr.app"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=ExchangeControlList.getInstance().getExchangeControlItem(iCol.getIsExchangeCtrlObtained())%>"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
              </tr> --%>

            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"natureOfCharge")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.security.nature.charge"/>&nbsp;<span class="mandatoryPerfection">*</span>&nbsp;</td>
              	<td><% if (!isLimitNull) { %>
                		<integro:empty-if-null value="<%=NatureOfChargeList.getInstance().getNatureOfChargeItem(objLimit.getNatureOfCharge())%>"/>
                	<% } %> &nbsp; </td>
                    <% boolean changed = false;
                	if (isProcess) {
                    	if (newChargeAmt != null && oldChargeAmt == null) {
                        	if (newChargeAmt.getAmount() != 0) {
                            	changed = true;
                        	}
                    	} else if (newChargeAmt != null && oldChargeAmt != null) {
                        	changed = !CompareOBUtil.compOB(newChargeAmt,oldChargeAmt,"amount");
                    		}
                		}
            		%>
            	<td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>">
            		<bean:message key="label.security.amount.charge"/>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
              	<td><% if (!isLimitNull && objLimit.getChargeAmount() != null &&
                      objLimit.getChargeAmount().getCurrencyCode() != null) { %>
              		<bean:write name="InsCrdtDerivForm" property="amtCharge"/>
              		<% } %> &nbsp;</td>
            </tr>
            
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"legalChargeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
              		<bean:message key="label.security.date.legal.charge"/>&nbsp;<span class="mandatory">*</span>&nbsp;</td>
              	<td><% if (!isLimitNull && objLimit.getLegalChargeDate() != null) { %>
              			<integro:date object="<%=objLimit.getLegalChargeDate()%>" />
               		<% } %> &nbsp; </td>
              	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeConfirmationDate")?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.confirmation.charge.date"/></td>
              	<td><% if (!isLimitNull) { %>
              			<integro:date object="<%=objLimit.getChargeConfirmationDate()%>" />
                	<% } %> &nbsp; </td>
            </tr>
            
            <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            	<td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
            		<bean:message key="label.security.charge.type"/>&nbsp;<span class="mandatory">*</span>&nbsp;</td>
            	<td><% if (!isLimitNull) { %>
            			<integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
            		<% } %>&nbsp;</td>
				<td width="20%" class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"arrInsurer")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.credit.arr.insurer"/>&nbsp;</td>
				<td><integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue(CategoryCodeConstant.ARR_INSURER, iCol.getArrInsurer())%>"/></td>
            </tr>
           <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">   
  				<td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"insurancePremium")?"fieldname":"fieldnamediff"):"fieldname"%>">
					<bean:message key="label.insurance.premium.amount"/></td>
               <td><bean:write name ="<%=formName %>" property="premiumAmount"/>&nbsp;</td>
				<td class="fieldname">&nbsp;</td>
              	<td>&nbsp;</td>
            </tr>
			<%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
			<%@ include file="/collateral/common/common_fields_read.jsp" %>              
             <%--<%@ include file="/collateral/common/view_security_instrument.jsp" %>--%>

          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>

<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>

<%@ include file="/collateral/common/view_system_valuation.jsp"%>
<%@ include file="/collateral/common/view_netRV.jsp" %>


<br>
 

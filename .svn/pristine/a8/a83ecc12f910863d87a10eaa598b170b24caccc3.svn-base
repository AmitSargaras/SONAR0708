<%@ page import="com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.collateral.bus.ICollateralPledgor,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.collateral.bus.IValuation,
                 com.integrosys.cms.app.collateral.bus.type.guarantee.subtype.gteinwardlc.IGteinwardLC,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.collateral.bus.ILimitCharge,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.FrequencyList,
                 java.lang.*,
				 java.text.SimpleDateFormat" %>
<%@ page import="com.integrosys.cms.ui.collateral.*" %>
<%@ page import="com.integrosys.cms.ui.common.CommonCodeList" %>


<%
    //itrxValue from
    IGteinwardLC oldCollateral = (IGteinwardLC) itrxValue.getCollateral();
    IGteinwardLC newCollateral = (IGteinwardLC) itrxValue.getStagingCollateral();

    String prefix = "Gte";
    String subtype = "GteInwardLC";
    String formName = "GteInwardLCForm";
    String formActionName = subtype+"Collateral.do";
	String claimDate = "";
%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
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
<!--                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="fieldname"><bean:message key="label.security.fsv"/></td>
                    <td>
                        <integro:currency amount="<%=iCol.getSCIFSV()%>" param="amount"/>&nbsp;
                    </td>
                    <%  
                        boolean changed = false;
                        if (isProcess) {
                            if (oldCollateral != null && oldCollateral.getHoldingPeriod() == null && newCollateral.getHoldingPeriod() != null) {
                                if (newCollateral.getHoldingPeriod() != null) {
                                    changed = true;
                                }
                            } else if (oldCollateral != null && oldCollateral.getHoldingPeriod() != null && newCollateral.getHoldingPeriod() != null) {
                                changed = !CompareOBUtil.compOB(newCollateral,oldCollateral,"holdingPeriod");
                                if(!changed){
                                    changed = !CompareOBUtil.compOB(newCollateral,oldCollateral,"holdingPeriodTimeUnit");
                                }
                            }
                        }
                    %>
                    <td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.holding.period"/>&nbsp;</td>
                    <td><% if (!(iCol== null)) { 
                           String holdingPeriod = "";
                           if(iCol.getHoldingPeriod() != null && iCol.getHoldingPeriod() == new Long(0)){
                               holdingPeriod = String.valueOf(iCol.getHoldingPeriod());
                           }
                           if(iCol.getHoldingPeriodTimeUnit() != null && iCol.getHoldingPeriodTimeUnit().equals("null")){
                               holdingPeriod = holdingPeriod + "&nbsp;" + FrequencyList.getInstance().getFrequencyValue(iCol.getHoldingPeriodTimeUnit()); 
                            }%>
                        <integro:empty-if-null value="<%=holdingPeriod%>"/>
                        <% } %> &nbsp;
                    </td>
                </tr>-->
                <%
                    ILimitCharge[] limit = iCol.getLimitCharges();
                    ILimitCharge objLimit = null;
                    if (limit != null && limit.length > 0) {
                        objLimit = limit[0];
                    }
                    ILimitCharge oldLimit = null;
                    ILimitCharge newLimit = null;
                    if (isProcess) {
                        if (oldCollateral != null && oldCollateral.getLimitCharges() != null && oldCollateral.getLimitCharges().length > 0) {
                            oldLimit = oldCollateral.getLimitCharges()[0];
                        }

                        if (newCollateral.getLimitCharges() != null && newCollateral.getLimitCharges().length > 0) {
                            newLimit = newCollateral.getLimitCharges()[0];
                        }
                    }
                    boolean isLimitNull = (objLimit == null);
                %>
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"description")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.desc.guarantees"/></td>
                    <td colspan="3"><integro:wrapper value="<%=iCol.getDescription()%>"/>&nbsp;</td>
                </tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.security.claim.period"/>&nbsp;</td>
                    <td><% if (!(iCol== null)) { 
                           String claimPeriod = "";
                           if(iCol.getClaimPeriod() == null ){
                        	   claimPeriod = String.valueOf(iCol.getClaimPeriod());
                          	 if(claimPeriod == null || claimPeriod.equals("null"))
  	                           {
  	                        	   claimPeriod ="-"; 	                        	   
  	                           }
                           }
                           if(iCol.getClaimPeriodUnit() != null && !iCol.getClaimPeriodUnit().equals("null")){
                        	   claimPeriod = String.valueOf(iCol.getClaimPeriod());
                          	 if(claimPeriod == null || claimPeriod.equals("null"))
  	                           {
  	                        	   claimPeriod ="-"; 	                        	   
  	                           }
                               claimPeriod = claimPeriod + "&nbsp;" + FrequencyList.getInstance().getFrequencyValue(iCol.getClaimPeriodUnit()); 
                            }
							if (iCol.getClaimDate()==null) claimDate = "-";
							else {
							  claimDate = (new SimpleDateFormat("dd/MMM/yyyy")).format(iCol.getClaimDate());
							}  
							%>
                        <integro:empty-if-null value="<%=claimPeriod%>"/>
                        <% } %> &nbsp;
                    </td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"claimDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
						<bean:message key="label.security.claim.date"/></td>
                    <td><%=claimDate%></td>
                </tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"referenceNo")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.ref.num.guarantee"/></td>
                    <td><integro:empty-if-null value="<%=iCol.getReferenceNo()%>"/>&nbsp;</td>

                    <td class="<%=isProcess?((CompareOBUtil.compOB(newCollateral.getGuaranteeAmount(),((oldCollateral==null)?null:oldCollateral.getGuaranteeAmount()),"amount"))?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.guarantee.amt"/>&nbsp;<span class="mandatory">*</span>&nbsp;</td>
                    <td><bean:write name="GteInwardLCForm" property="amtGuarantee"/>&nbsp;</td>
                </tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"guaranteeDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <span class=stp><bean:message key="label.security.guarantee.date"/></span>&nbsp;</td>
                    <td><integro:date object="<%=iCol.getGuaranteeDate()%>"/> &nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"beneficiaryName")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.beneficiary.name"/></td>
                    <td><integro:empty-if-null value="<%=iCol.getBeneficiaryName()%>"/>&nbsp;</td>
                </tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td width="20%"
                        class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"isBankCountryRiskApproval")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.bank.country.risk.approval"/>&nbsp;</td>
                    <td><% String bankRisk = "";
                        if (iCol.getIsBankCountryRiskApproval() != null) {
                            if (iCol.getIsBankCountryRiskApproval().equals(ICMSConstant.TRUE_VALUE)) {
                                bankRisk = "Yes";
                            } else if (iCol.getIsBankCountryRiskApproval().equals(ICMSConstant.FALSE_VALUE)) {
                                bankRisk = "No";
                            } else if (iCol.getIsBankCountryRiskApproval().equals(ICMSConstant.NOT_AVAILABLE_VALUE)) {
                                bankRisk = "Not Applicable";
                            }
                        } %>
                        <%=bankRisk%>&nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newLimit,oldLimit,"chargeType")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.charge.type"/>&nbsp;<span class="mandatory">*</span></td>
                    <td><% if (!isLimitNull) { %>
                        <integro:empty-if-null value="<%=ChargeTypeList.getInstance().getChargeTypeItem(objLimit.getChargeType())%>"/>
                        <% } %>&nbsp;</td>
                </tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"issuingBank")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <span class=stp><bean:message key="label.security.issuing.bank"/></span>&nbsp;</td>
                    <td><integro:empty-if-null value="<%=iCol.getIssuingBank()%>"/>&nbsp;</td>
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"issuingBankCountry")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.issuing.bank.country"/></td>
                    <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(iCol.getIssuingBankCountry())%>"/>
                        &nbsp;</td>
                </tr>
				
				<%@ include file="/collateral/common/common_exchange_control_read.jsp" %>
				<%@ include file="/collateral/common/common_legal_enforceability_read.jsp" %>
                <%@ include file="/collateral/common/common_fields_read.jsp" %>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"collateralMaturityDate")?"fieldname":"fieldnamediff"):"fieldname"%>">
                       <span class=stp><bean:message key="label.security.maturity.date"/></span>&nbsp;<span class="mandatory">*</span>&nbsp;<span class="mandatoryPerfection">*</span></td>
                    <td><integro:date object="<%=iCol.getCollateralMaturityDate()%>"/> &nbsp;</td>
					<td class="fieldname">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				
				<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=isProcess?(CompareOBUtil.compOB(newCollateral,oldCollateral,"comments")?"fieldname":"fieldnamediff"):"fieldname"%>">
                        <bean:message key="label.security.comments"/></td>
                    <td colspan="3"><integro:wrapper value="<%=iCol.getComments()%>"/>&nbsp;</td>
                </tr>
		
                 <%--<%@ include file="/collateral/common/view_security_instrument.jsp" %> --%>
            </tbody>
        </table>
    </td>
</tr>
</tbody>
</table>

<%@ include file="/collateral/view_pledgor_read.jsp" %>
<%@ include file="/collateral/view_pledge_read.jsp" %>


<!--View valuation details-->
<%@ include file="/collateral/common/view_system_valuation.jsp" %>
<%@ include file="/collateral/common/view_valuation_from_los.jsp" %>
<%@ include file="/collateral/common/view_netRV.jsp" %>


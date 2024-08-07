
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.app.limit.trx.IFacilityTrxValue"%>

<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<%@page import="com.integrosys.cms.app.limit.bus.IFacilityIslamicMaster"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
</head>
<%
	String isProcess = request.getParameter("isProcess");
	boolean isProcessHere = false;
	if(isProcess!=null&&isProcess.equals("true")){
		isProcessHere = true ; 
	}

	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
		+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	IFacilityTrxValue facilityTrxValue = (IFacilityTrxValue) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityTrxValue");
	IFacilityIslamicMaster facilityIslamicMasterStaging = null;
	IFacilityIslamicMaster facilityIslamicMasterActual = null;
	if (facilityTrxValue != null) {
		if (facilityTrxValue.getStagingFacilityMaster() != null) {
			facilityIslamicMasterStaging = facilityTrxValue.getStagingFacilityMaster().getFacilityIslamicMaster();
		}
		if (facilityTrxValue.getFacilityMaster() != null) {
			facilityIslamicMasterActual = facilityTrxValue.getFacilityMaster().getFacilityIslamicMaster();
		}
	}
	else {
		facilityIslamicMasterStaging = ((IFacilityMaster) session
				.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj"))
				.getFacilityIslamicMaster();
	}
	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
							.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	
	ILimit limit = facilityMasterObj.getLimit();
	String[] style = { "even", "odd" };
	int count = 0;
	String styleGppPaymentMode = "fieldname";
	String styleGppCalculationMethod = "fieldname";
	String styleGppTerm = "fieldname";
	String styleGppTermCode = "fieldname";
	String styleSecurityDepOfMonth = "fieldname";
	String styleSecurityDepPercentage = "fieldname";
	String styleSecurityDepAmount = "fieldname";
	String styleCustomerInterestRate = "fieldname";
	String styleFulrelProfitCalcMethod = "fieldname";
	String styleFixedAmountRefund = "fieldname";
	String styleCompoundMethod = "fieldname";
	String styleDateStopCompounding = "fieldname";
	String styleRefundGppProfitValue = "fieldname";
	String styleRefundFulrelProfitValue = "fieldname";
	String styleCommissionRate = "fieldname";
	String styleFixedCommissionAmount = "fieldname";
	String styleCommissionTerm = "fieldname";
	String styleCommissionExpiryDate = "fieldname";
	String styleExcCmpInPmtAmt = "fieldname";
	String styleSptfDualPaymentModeValue = "fieldname";
	String styleSnpAgreementDate = "fieldname";
	String stylefullRelPft12Method = "fieldname";
	String stylefixedRefundAmount = "fieldname";
	String snpTermCodeValue = "fieldname";
	
	System.out.println("facilityIslamicMasterActual : " + facilityIslamicMasterActual);
	if (facilityIslamicMasterActual != null&&isProcessHere) {
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "gppPaymentModeValue")) {
			styleGppPaymentMode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "gppCalculationMethodValue")) {
			styleGppCalculationMethod = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "gppTerm")) {
			styleGppTerm = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "gppTermCode")) {
			styleGppTermCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging,
				"securityDepOfMonth")) {
			styleSecurityDepOfMonth = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging,
				"securityDepPercentage")) {
			styleSecurityDepPercentage = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "securityDepAmount")) {
			styleSecurityDepAmount = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "customerInterestRate")) {
			styleCustomerInterestRate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "fulrelProfitCalcMethod")) {
			styleFulrelProfitCalcMethod = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging,
				"compoundingMethod")) {
			styleCompoundMethod = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging,
				"dateStopCompounding")) {
			styleDateStopCompounding = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "refundGppProfitValue")) {
			styleRefundGppProfitValue = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "refundFulrelProfitValue")) {
			styleRefundFulrelProfitValue = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "commissionRate")) {
			styleCommissionRate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "fixedCommissionAmount")) {
			styleFixedCommissionAmount = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "commissionTerm")) {
			styleCommissionTerm = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "commissionExpiryDate")) {
			styleCommissionExpiryDate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "excCmpInPmtAmt")) {
			styleExcCmpInPmtAmt = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "sptfDualPaymentModeValue")) {
			styleSptfDualPaymentModeValue = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "snpAgreementDate")) {
			styleSnpAgreementDate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "fullRelPft12Method")) {
			stylefullRelPft12Method = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "fixedRefundAmount")) {
			stylefixedRefundAmount = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicMasterActual, facilityIslamicMasterStaging, "snpTermCodeValue")) {
			snpTermCodeValue = "fieldnamediff";
		}
	}
	
	IFacilityIslamicMaster islamicMaster = null;
	if (facilityMasterObj != null) {
		islamicMaster = facilityMasterObj.getFacilityIslamicMaster();
	}
%>
<body>
<html:form action="FacilityIslamicMaster.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.islamic.master" /></h3>
				</td>
				<td width="30%"><bean:message key="label.indicate.mandatory" /></td>
			</tr>
			<tr>
				<td colspan="2">
				<hr>
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<thead>
						<tr>
							<td colspan="4" style="text-align: left"><bean:message
								key="label.facility.-.islamic.master" /></td>
						</tr>
					</thead>
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.aa.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td width="30%"><%=limitProfile.getBCAReference()%></td>
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.sequence.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td width="30%"><%=limit.getFacilitySequence()%></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.code" /></span><bean:message key="label.mandatory" /></td>
							<td><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" /></td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.branch.no" /></span><bean:message key="label.mandatory" /></td>
							<td><integro:empty-if-null
								value="<%=limit.getBookingLocation().getOrganisationCode() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleGppPaymentMode %>"><span class="stp"><bean:message key="label.facility.islamic.gpp.payment.mode" /></span><bean:message key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityIslamicMaster() != null) {
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.GPP_PAYMENT_MODE %>"
									entryCode="<%=facilityMasterObj.getFacilityIslamicMaster().getGppPaymentModeValue() %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>
							 <td class="<%=styleGppCalculationMethod %>"><span class="stp"><bean:message key="label.facility.islamic.gpp.calculation.method" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityIslamicMaster() != null) {
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.GPP_CALCULATION_METHOD %>"
									entryCode="<%=facilityMasterObj.getFacilityIslamicMaster().getGppCalculationMethodValue() %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleGppTerm %>"><span class="stp"><bean:message key="label.facility.islamic.gpp.term" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityIslamicMaster() != null) {
							%> 
									<integro:empty-if-null value="<%=facilityMasterObj.getFacilityIslamicMaster().getGppTerm() %>" />
							<%
								}
							%>
							</td>
							 <td class="<%=styleGppTermCode %>"><span class="stp"><bean:message key="label.facility.islamic.gpp.code" /></span></td>
							<td>
							<%
								if (islamicMaster != null && islamicMaster.getGppTermCode() != null) {
									String termCode = islamicMaster.getGppTermCode().toString();
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.LIMIT_TENOR %>"
									entryCode="<%=termCode %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.selling.price" /></span></td>
							<td><integro:amount amount="<%=facilityMasterObj.getFacilityIslamicMaster().getSellingPriceAmount() %>" decimal="2" /></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.total.gpp.amount" /></span></td>
							<td><integro:amount amount="<%=facilityMasterObj.getFacilityIslamicMaster().getGppTotalAmount() %>" decimal="2" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleSecurityDepOfMonth %>"><span class="stp"><bean:message key="label.facility.islamic.sec.dep.of.month" /></span></td>
							<td>
							<%
								if (islamicMaster != null) {
							%> 
									<integro:empty-if-null value="<%=islamicMaster.getSecurityDepOfMonth() %>" />
							<%
								}
							%>&nbsp;
							</td>
							 <td class="<%=styleSecurityDepPercentage%>"><span class="stp"><bean:message key="label.facility.islamic.sec.dep.percentage" /></span></td>
							<td>
							<%
								if (islamicMaster != null) {
							%> 
									<integro:empty-if-null value="<%=islamicMaster.getSecurityDepPercentage() %>" />
							<%
								}
							%>&nbsp;							
							</td>						
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleSecurityDepAmount%>"><span class="stp"><bean:message key="label.facility.islamic.sec.dep.amount" /></span></td>
							<td><%if(facilityMasterObj!=null&&facilityMasterObj.getFacilityIslamicMaster()!=null
									&&facilityMasterObj.getFacilityIslamicMaster().getSecurityDepAmount()!=null){ %>
							MYR&nbsp;<bean:write name="FacilityIslamicMasterForm" property="securityDepAmount"/></td>
									<%} %>&nbsp;

							 <td class="<%=styleCustomerInterestRate %>"><span class="stp"><bean:message key="label.facility.islamic.pricing.tier1.rate" /></span><bean:message key="label.mandatory" /></td>
							<td>
							<%
								if (islamicMaster != null) {
							%> 
									<integro:empty-if-null value="<%=islamicMaster.getCustomerInterestRate() %>" />
							<%
								}
							%>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleFulrelProfitCalcMethod %>"><span class="stp"><bean:message key="label.facility.islamic.fulrel.profit.calc.method" /></span></td>
							<td>
							<%
								if (islamicMaster != null && islamicMaster.getFulrelProfitCalcMethod() != null) {
									String fulrelProfitCalcMethod = islamicMaster.getFulrelProfitCalcMethod();
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FULREL_PROFIT_CALC_METHOD %>"
									entryCode="<%=fulrelProfitCalcMethod %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>
							 <td class="<%=styleFixedAmountRefund %>"><span class="stp"><bean:message key="label.facility.islamic.fixed.amount.refund" /></span></td>
							 <td>
							<%
								if (islamicMaster != null&&islamicMaster.getFixedRefundAmount()!=null) {
							%> 
									MYR&nbsp;<bean:write name="FacilityIslamicMasterForm" property="fixedRefundAmount"/>
							<%
								}
							%>&nbsp;
							</td>						
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleCompoundMethod %>"><span class="stp"><bean:message key="label.facility.islamic.computing.method" /></span><bean:message key="label.mandatory" /></td>
							<td>
							<%
								if (islamicMaster.getCompoundingMethod() != null) {
							%> <%=islamicMaster.getCompoundingMethod().booleanValue() ? "Yes"
							: "No"%>
							<%
							 	}
							%>&nbsp;
							</td>
							 <td class="<%=styleDateStopCompounding %>"><span class="stp"><bean:message key="label.facility.islamic.date.stop.compounding" /></span></td>
							<td><integro:date
								object="<%=islamicMaster != null ? islamicMaster.getDateStopCompounding() : null%>"></integro:date>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleRefundGppProfitValue %>"><span class="stp"><bean:message key="label.facility.islamic.refund.gpp.profit" /></span></td>
							<td>
							<%
								if (islamicMaster != null && islamicMaster.getRefundGppProfitValue() != null) {
									String refundGppProfitValue = islamicMaster.getRefundGppProfitValue();
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.REFUND_GPP_PROFIT %>"
									entryCode="<%=refundGppProfitValue %>" 
									display="true"/>
							<%
								}
							%>&nbsp;						
							</td>
							<td class="<%=styleRefundFulrelProfitValue %>"><span class="stp"><bean:message key="label.facility.islamic.refund.fulrel.profit" /></span></td>
							<td>
							<%
								if (islamicMaster != null && islamicMaster.getRefundFulrelProfitValue() != null) {
									String refundFulrelProfitValue = islamicMaster.getRefundFulrelProfitValue();
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.REFUND_GPP_PROFIT %>"
									entryCode="<%=refundFulrelProfitValue %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleCommissionRate %>"><span class="stp"><bean:message key="label.facility.islamic.commission.rate" /></span></td>
							<td>
							<%
								if (islamicMaster != null) {
							%> 
									<integro:empty-if-null value="<%=islamicMaster.getCommissionRate() %>" />
							<%
								}
							%>&nbsp;
							</td>
							 <td class="<%=styleFixedCommissionAmount %>"><span class="stp"><bean:message key="label.facility.islamic.fixed.commission.amount" /></span></td>
							<td>
							<%
								if (islamicMaster != null&&islamicMaster.getFixedCommissionAmount()!=null) {
							%> 
									MYR&nbsp;<bean:write name="FacilityIslamicMasterForm" property="fixedCommissionAmount"/>
							<%
								}
							%>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleCommissionTerm %>"><span class="stp"><bean:message key="label.facility.islamic.commission.term" /></span></td>
							<td>
							<%
								if (islamicMaster != null) {
							%> 
									<integro:empty-if-null value="<%=islamicMaster.getCommissionTerm() %>" />
							<%
								}
							%>&nbsp;
							</td>
							 <td class="<%=styleCommissionExpiryDate %>"><span class="stp"><bean:message key="label.facility.islamic.commission.expiry.date" /></span></td>
							<td><integro:date
								object="<%=islamicMaster != null ? islamicMaster.getCommissionExpiryDate() : null%>"></integro:date>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleExcCmpInPmtAmt %>"><span class="stp"><bean:message key="label.facility.islamic.exc.cmp.pmtamt" /></span><bean:message key="label.mandatory" /></td>
							<td>
							<%
								if (islamicMaster.getExcCmpInPmtAmt() != null) {
							%> <%=islamicMaster.getExcCmpInPmtAmt().booleanValue() ? "Yes"
							: "No"%>
							<%
							 	}
							%>&nbsp;
							</td>
							 <td class="<%=styleSptfDualPaymentModeValue %>"><span class="stp"><bean:message key="label.facility.islamic.sptf.dual.repayment" /></span></td>
							<td>
							<%
								if (islamicMaster != null && islamicMaster.getSptfDualPaymentModeValue() != null) {
									String sptfDualPaymentModeValue = islamicMaster.getSptfDualPaymentModeValue();
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.SPTF_DUAL_PAYMENT_MODE %>"
									entryCode="<%=sptfDualPaymentModeValue %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
								</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleSnpAgreementDate %>"><span class="stp"><bean:message key="label.facility.islamic.snp.agreement.date" /></span></td>
							<td><integro:date
								object="<%=islamicMaster != null ? islamicMaster.getSnpAgreementDate() : null%>"></integro:date>&nbsp;
							</td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.duration.snp.date" /></span></td>
							<td>
							<%if(facilityMasterObj.getFacilityIslamicMaster().getGppDurationForSnp()!=null){ %>
								<%String gppDurationForSnp = facilityMasterObj.getFacilityIslamicMaster().getGppDurationForSnp().toString(); 
								if(gppDurationForSnp.equals("Y")){%><bean:message key="label.common.yes" />
								<%}else if(gppDurationForSnp.equals("N")){ %><bean:message key="label.common.no" /><%}%>
							<%}else{ %><bean:message key="label.common.not.avail" /><%} %>&nbsp;</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.snp.term" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getFacilityIslamicMaster().getSnpTerm()%>"/> </td>
							 <td class="<%=snpTermCodeValue %>"><span class="stp"><bean:message key="label.facility.islamic.snp.term.code" /></span></td>
							<td>
							<%
								if (islamicMaster != null && islamicMaster.getSnpTermCodeValue() != null) {
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.LIMIT_TENOR %>"
									entryCode="<%=islamicMaster.getSnpTermCodeValue() %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=stylefullRelPft12Method %>"><span class="stp"><bean:message key="label.facility.islamic.fullRelPft12Method" /></span><bean:message key="label.mandatory" /></td>
							<td>
							<%
								if (islamicMaster.getFullRelPft12Method() != null) {
							%> <%=islamicMaster.getFullRelPft12Method().booleanValue() ? "Yes"
							: "No"%>
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.sptf.grace.exp.date" /></span></td>
							<td><%if(facilityMasterObj.getFacilityIslamicMaster().getGraceExpSPTFDate()==null){ %>-
								<%}else{ %>
								<integro:date
								object="<%=facilityMasterObj != null ? facilityMasterObj.getFacilityIslamicMaster().getGraceExpSPTFDate() : null%>"></integro:date>
								<%}%></td>							
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr><td height="100">&nbsp;</td></tr>
		</tbody>
	</table>
</html:form>
</body>
</html>
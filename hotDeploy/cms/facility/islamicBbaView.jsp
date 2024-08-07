
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

<%@page import="com.integrosys.cms.app.limit.bus.IFacilityIslamicBbaVariPackage"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="org.apache.commons.lang.StringUtils"%>

<%@page import="com.integrosys.cms.app.limit.bus.IFacilityIslamicBbaVariPackage"%><html>
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
	IFacilityIslamicBbaVariPackage facilityIslamicBbaStaging = null;
	IFacilityIslamicBbaVariPackage facilityIslamicBbaActual = null;

	if (facilityTrxValue != null) {
		if (facilityTrxValue.getStagingFacilityMaster() != null) {
			facilityIslamicBbaStaging = facilityTrxValue.getStagingFacilityMaster().getFacilityIslamicBbaVariPackage();
		}
		if (facilityTrxValue.getFacilityMaster() != null) {
			facilityIslamicBbaActual = facilityTrxValue.getFacilityMaster().getFacilityIslamicBbaVariPackage();
		}
	}
	else {
		facilityIslamicBbaStaging = ((IFacilityMaster) session
				.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj"))
				.getFacilityIslamicBbaVariPackage();
	}
	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
		.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	
	ILimit limit = facilityMasterObj.getLimit();
	String[] style = { "even", "odd" };
	int count = 0;
	String styleCustProfRate = "fieldname";
	String styleRebateMethod = "fieldname";
	String styleGppPaymentMode = "fieldname";
	String styleGppCalculationMethod = "fieldname";
	String styleGppTerm = "fieldname";
	String styleGppTermCode = "fieldname";
	String styleFulrelProfitCalMethod = "fieldname";
	String styleFullReleaseProfit = "fieldname";
	String styleRefundFulrelProfit = "fieldname";
	String styleInstallment = "fieldname";
	String styleFinalPaymentAmount = "fieldname";
	
	
	if (facilityIslamicBbaActual != null&&isProcessHere) {
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, "custProfRate")) {
			styleCustProfRate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, "rebateMethod")) {
			styleRebateMethod = "fieldnamediff";
		}		
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, "gppPaymentMode")) {
			styleGppPaymentMode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, "gppCalculationMethod")) {
			styleGppCalculationMethod = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, "gppTerm")) {
			styleGppTerm = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, "gppTermCode")) {
			styleGppTermCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, 	"fullReleaseProfit")) {
			styleFullReleaseProfit = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, "refundFullReleaseProfit")) {
			styleRefundFulrelProfit = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, "installment")) {
			styleInstallment = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityIslamicBbaActual, facilityIslamicBbaStaging, "finalPaymentAmount")) {
			styleFinalPaymentAmount = "fieldnamediff";
		}
	}
	
	IFacilityIslamicBbaVariPackage islamicBba = null;
	if (facilityMasterObj != null) {
		islamicBba = facilityMasterObj.getFacilityIslamicBbaVariPackage();
	}
%>
<body>
<html:form action="FacilityIslamicBbaVariPackage.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.islamic.bba" /></h3>
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
								key="label.facility.-.islamic.bba" /></td>
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
							 <td class="<%=styleCustProfRate %>"><span class="stp"><bean:message key="label.facility.islamic.cust.prof.rate" /></span><bean:message key="label.mandatory" /></td>
							<td>
							<%
								if (islamicBba != null) {
								%> 
										<integro:empty-if-null value="<%=islamicBba.getCustProfRate() %>" />
								<%
									}
								%>&nbsp;
							</td>
							 <td class="<%=styleRebateMethod %>"><span class="stp"><bean:message key="label.facility.islamic.rebate.method" /></span></td>
							<td>
							<%
								if (islamicBba != null && islamicBba.getRebateMethod() != null) {
									String rebateMethod = String.valueOf(islamicBba.getRebateMethod());
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.REBATE_METHOD %>"
									entryCode="<%=rebateMethod %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleGppPaymentMode %>"><span class="stp"><bean:message key="label.facility.islamic.gpp.payment.mode" /></span><bean:message key="label.mandatory" /></td>
							<td>
							<%
								if (islamicBba != null && islamicBba.getGppPaymentMode() != null) {
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.GPP_PAYMENT_MODE %>"
									entryCode="<%=islamicBba.getGppPaymentMode() %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>
							 <td class="<%=styleGppCalculationMethod %>"><span class="stp"><bean:message key="label.facility.islamic.gpp.calculation.method" /></span></td>
							<td>
							<%
								if (islamicBba != null && islamicBba.getGppCalculationMethod() != null) {
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.GPP_CALCULATION_METHOD %>"
									entryCode="<%=islamicBba.getGppCalculationMethod()%>" 
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
								if (islamicBba != null && islamicBba.getGppTermCode() != null) {
									String termCode = islamicBba.getGppTermCode().toString();
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.PRIME_REVIEW_TERM_CODE %>"
									entryCode="<%=termCode %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleFullReleaseProfit %>"><span class="stp"><bean:message key="label.facilitu.islamic.bba.full.release.profit" /></span><bean:message key="label.mandatory" /></td>
							<td>
							<%
								if (islamicBba.getFullReleaseProfit() != null) {
							%> <%=islamicBba.getFullReleaseProfit().booleanValue() ? "Yes"
							: "No"%>
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleRefundFulrelProfit %>"><span class="stp"><bean:message key="label.facility.islamic.refund.fulrel.profit" /></span></td>
							<td>
							<%
								if (islamicBba != null && islamicBba.getRefundFullReleaseProfit() != null) {
									String refundFulRelProfit = String.valueOf(islamicBba.getRefundFullReleaseProfit());
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.REFUND_FULREL_PROFIT %>"
									entryCode="<%=refundFulRelProfit %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>						
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleFulrelProfitCalMethod %>"><span class="stp"><bean:message key="label.facility.islamic.fulrel.profit.calc.method" /></span></td>
							<td>
							<%
								if (islamicBba != null && islamicBba.getFulrelProfitCalMethod() != null) {
									String fulrelProfitCalcMethod = String.valueOf(islamicBba.getFulrelProfitCalMethod());
							%> <integro:common-code
									categoryCode="<%=CategoryCodeConstant.FULREL_PROFIT_CALC_METHOD %>"
									entryCode="<%=fulrelProfitCalcMethod %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>
							 <td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>						
						</tr>

						<tr class="<%=style[count++%2] %>">
							 <td class="<%=styleInstallment %>"><span class="stp"><bean:message key="label.facility.installment.amount" /></span></td>
							<td>MYR&nbsp;
							<%
								if (islamicBba != null) {
							%> 
									<integro:amount amount="<%=islamicBba.getInstallment() %>" />
							<%
								}
							%>&nbsp;
							</td>	
							 <td class="<%=styleFinalPaymentAmount %>"><span class="stp"><bean:message key="label.facility.final.payment.amount" /></span></td>
							<td>MYR&nbsp;
							<%
								if (islamicBba != null) {
							%> 
									<integro:amount amount="<%=islamicBba.getFinalPaymentAmount() %>" />
							<%
								}
							%>&nbsp;
							</td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.selling.price" /></span></td>
							<td><integro:amount amount="<%=islamicBba.getSellingPrice() %>"/></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.total.gpp.amount" /></span></td>
							<td><integro:amount amount="<%=islamicBba.getTotalGppAmount() %>"/></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.total.profit" /></span></td>
							<td><integro:amount amount="<%=facilityMasterObj.getFacilityIslamicBbaVariPackage().getTotalProfit() %>" /></td>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>	
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
</body>
</html>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<%@page import="java.util.*"%>

<%
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();

	String[] style = { "even", "odd" };
	int count = 0;
%>
<html>
<head>
<title>Untitled Document</title>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/JavaScript">
function setVisibility(elementID,visibility){
  	document.getElementById(elementID).style.visibility = visibility;
} 

</script>
</head>
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
				<td width="30%" align="right"><bean:message key="label.indicate.mandatory" /></td>
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
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.payment.mode" /></span><bean:message key="label.mandatory" /></td>
							<td><html:select property="gppPaymentModeValue">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.GPP_PAYMENT_MODE%>" descWithCode="true" />
								</html:select><html:errors property="gppPaymentModeValue" />
							</td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.calculation.method" /></span></td>
							<td><html:select property="gppCalculationMethodValue">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.GPP_CALCULATION_METHOD%>" descWithCode="true" />
								</html:select><html:errors property="gppCalculationMethodValue" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.term" /></span></td>
							<td><html:text property="gppTerm" />
								<html:errors property="gppTerm" />
							</td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.code" /></span></td>
							<td><html:select property="gppTermCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.LIMIT_TENOR%>" />
								</html:select><html:errors property="gppTermCode" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.selling.price" /></span></td>
							<td><integro:amount amount="<%=facilityMasterObj.getFacilityIslamicMaster().getSellingPriceAmount() %>" decimal="2" /></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.total.gpp.amount" /></span></td>
							<td><integro:amount amount="<%=facilityMasterObj.getFacilityIslamicMaster().getGppTotalAmount() %>" decimal="2" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.sec.dep.of.month" /></span></td>
							<td><html:text property="securityDepOfMonth" />
							    <html:errors property="securityDepOfMonth" />
							</td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.sec.dep.percentage" /></span></td>
							<td><html:text property="securityDepPercentage" />
							    <html:errors property="securityDepPercentage" /></td>						
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.sec.dep.amount" /></span></td>
							<td>MYR&nbsp;<html:text property="securityDepAmount" />
							    		<html:errors property="securityDepAmount" /></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.pricing.tier1.rate" /></span><bean:message key="label.mandatory" /></td>
							<td><html:text property="customerInterestRate" />
							    <html:errors property="customerInterestRate" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.fulrel.profit.calc.method" /></span></td>
							<td><html:select property="fulrelProfitCalcMethod">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.FULREL_PROFIT_CALC_METHOD%>" descWithCode="true" />
								</html:select><html:errors property="fulrelProfitCalcMethod" /></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.fixed.amount.refund" /></span></td>
							<td>MYR&nbsp;<html:text property="fixedRefundAmount" maxlength="20" size="20" />
							    <html:errors property="fixedRefundAmount" /></td>						
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.computing.method" /></span><bean:message key="label.mandatory" /></td>
							<td><html:radio property="compoundingMethod" value="Y"
								styleId="standbyLineYes">
								<label for="standbyLineYes"><bean:message
									key="label.common.yes" /></label>
							</html:radio>&nbsp;<html:radio property="compoundingMethod" value="N"
								styleId="standbyLineNo">
								<label for="standbyLineNo"><bean:message
									key="label.common.no" /></label>
							</html:radio></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.date.stop.compounding" /></span></td>
							<td><html:text property="dateStopCompounding"
								styleId="cgcBnmApprovedDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('dateStopCompounding', 'dd/mm/y');" /> 
								<html:errors property="dateStopCompounding" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.refund.gpp.profit" /></span></td>
							<td><html:select property="refundGppProfitValue" >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.REFUND_GPP_PROFIT%>" />
								</html:select>
							    <html:errors property="refundGppProfitValue" /></td>
							<td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.refund.fulrel.profit" /></span></td>
							<td><html:select property="refundFulrelProfitValue" >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.REFUND_FULREL_PROFIT%>" descWithCode="true" />
								</html:select>
							    <html:errors property="refundFulrelProfitValue" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.commission.rate" /></span></td>
							<td><html:text property="commissionRate" />
							    <html:errors property="commissionRate" /></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.fixed.commission.amount" /></span></td>
							<td>MYR<html:text property="fixedCommissionAmount" />
							    <html:errors property="fixedCommissionAmount" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.commission.term" /></span></td>
							<td><html:text property="commissionTerm" />
							    <html:errors property="commissionTerm" /></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.commission.expiry.date" /></span></td>
							<td><html:text property="commissionExpiryDate"
								styleId="commissionExpiryDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('commissionExpiryDate', 'dd/mm/y');" /> 
								<html:errors property="commissionExpiryDate" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.exc.cmp.pmtamt" /></span><bean:message key="label.mandatory" /></td>
							<td><html:radio property="excCmpInPmtAmt" value="Y"
								styleId="standbyLineYes">
								<label for="standbyLineYes"><bean:message
									key="label.common.yes" /></label>
								</html:radio>&nbsp;
								<html:radio property="excCmpInPmtAmt" value="N" styleId="standbyLineNo"/>
								<label for="standbyLineNo"><bean:message
									key="label.common.no" /></label>
							</td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.sptf.dual.repayment" /></span></td>
							<td><html:select property="sptfDualPaymentModeValue">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.SPTF_DUAL_PAYMENT_MODE%>" descWithCode="true" />
								</html:select><html:errors property="sptfDualPaymentModeValue" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.snp.agreement.date" /></span></td>
							<td><html:text property="snpAgreementDate"
								styleId="snpAgreementDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('snpAgreementDate', 'dd/mm/y');" /> 
								<html:errors property="snpAgreementDate" /></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.duration.snp.date" /></span></td>
							<td><html:radio property="gppDurationForSnp" value="Y" styleId="gppDurationForSnpYes">
								<label for="gppDurationForSnpYes"><bean:message key="label.common.yes" /></label>
								</html:radio>&nbsp;
								<html:radio property="gppDurationForSnp" value="N" styleId="gppDurationForSnpNoNo">
								<label for="gppDurationForSnpNo"><bean:message key="label.common.no" /></label>
                                </html:radio>&nbsp;
                                <html:radio property="gppDurationForSnp" value="" styleId="gppDurationForSnpNoNA" />
								<label for="gppDurationForSnpNA"><bean:message key="label.common.not.avail" /></label>
                            <html:errors property="gppDurationForSnp" />
                            </td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.snp.term" /></span></td>
                            <td><html:text property="snpTerm" />
							    <html:errors property="snpTerm" /></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.snp.term.code" /></span></td>
							<td><html:select property="snpTermCodeValue">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.LIMIT_TENOR%>" />
								</html:select><html:errors property="snpTermCodeValue" /></td>						
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.fullRelPft12Method" /></span><bean:message key="label.mandatory" /></td>
							<td><html:radio property="fullRelPft12Method" value="Y"
								styleId="standbyLineYes">
								<label for="standbyLineYes"><bean:message
									key="label.common.yes" /></label>
								</html:radio>&nbsp;
								<html:radio property="fullRelPft12Method" value="N" styleId="standbyLineNo"/>
								<label for="standbyLineNo"><bean:message
									key="label.common.no" /></label></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.sptf.grace.exp.date" /></span></td>
							<td><%if(facilityMasterObj.getFacilityIslamicMaster().getGraceExpSPTFDate()==null){ %>-
								<%}else{ %>
								<integro:date
								object="<%=facilityMasterObj != null ? facilityMasterObj.getFacilityIslamicMaster().getGraceExpSPTFDate() : null%>"></integro:date>
								<%}%>
							<html:errors property="graceExpSPTFDate" /></td>						
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
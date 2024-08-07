
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>

<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<%@page
	import="com.integrosys.cms.ui.limit.facility.insurance.InsuranceForm"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<html>
<head>
<title>Untitled Document</title>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
</head>
<%
	String[] style = { "even", "odd" };
	int count = 1;
	
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	InsuranceForm form = (InsuranceForm) request.getAttribute("FacilityInsuranceForm");
	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();
%>
<body>
<html:form action="FacilityInsurance.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.insurance" /></h3>
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
							<td colspan="3"><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" /></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<thead>
						<tr>
							<td colspan="9" style="text-align: center;"><bean:message
								key="label.facility.insurance1" /></td>

						</tr>
					</thead>
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.type.of.coverage" /></span></td>
							<td width="80%"><html:select
								property="coverageTypeEntryCode"
								value='<%=form != null && form.getCoverageTypeEntryCode() != null ? form.getCoverageTypeEntryCode()[0] : "" %>'>
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.INSURANCE_TYPE%>" />
							    </html:select> <html:errors property="coverageType[0]" />
                            </td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.insurance.company" /></span></td>
							<td><html:select property="insuranceCompanyEntryCode"
								value='<%=form != null && form.getInsuranceCompanyEntryCode() != null ? form.getInsuranceCompanyEntryCode()[0] : "" %>'>
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.INSURER_NAME%>" />
							</html:select></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.policy.no" /></span></td>
							<td><html:text property="policyNumber"
								value='<%=form != null && form.getPolicyNumber() != null && StringUtils.isNotBlank(form.getPolicyNumber()[0]) ? form.getPolicyNumber()[0] : "" %>'></html:text></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.prop.no/cv.note" /></span></td>
							<td><html:text property="propNumberOrCvNote"
								value='<%=form != null && form.getPropNumberOrCvNote() != null && StringUtils.isNotBlank(form.getPropNumberOrCvNote()[0]) ? form.getPropNumberOrCvNote()[0] : "" %>'></html:text></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.amount.insured" /></span></td>
							<td><%=form != null && form.getInsuredAmountCurrency() != null
								&& StringUtils.isNotBlank(form.getInsuredAmountCurrency()[0]) ? form
								.getInsuredAmountCurrency()[0] : limit.getApprovedLimitAmount().getCurrencyCode()%> <html:text
								property="insuredAmount"
								value='<%=form != null && form.getInsuredAmount() != null && StringUtils.isNotBlank(form.getInsuredAmount()[0]) ? form.getInsuredAmount()[0] : "" %>'></html:text>
							<html:errors property="insuredAmount[0]" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.insurance.premium" /></span></td>
							<td><%=form != null && form.getInsurancePremiumAmountCurrency() != null
						&& StringUtils.isNotBlank(form.getInsurancePremiumAmountCurrency()[0]) ? form
						.getInsurancePremiumAmountCurrency()[0] : limit.getApprovedLimitAmount().getCurrencyCode()%> <html:text
								property="insurancePremiumAmount"
								value='<%=form != null && form.getInsurancePremiumAmount() != null && StringUtils.isNotBlank(form.getInsurancePremiumAmount()[0]) ? form.getInsurancePremiumAmount()[0] : "" %>'></html:text>
							<html:errors property="insurancePremiumAmount[0]" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.issued.date" /></span></td>
							<td><html:text property="issuedDate" styleId="issuedDate1"
								maxlength="11" size="12" readonly="true"
								value='<%=form != null && form.getIssuedDate() != null && StringUtils.isNotBlank(form.getIssuedDate()[0]) ? form.getIssuedDate()[0] : "" %>'></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('issuedDate1', 'dd/mm/y');" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.expiry.date" /></span></td>
							<td><html:text property="expiryDate" styleId="expiryDate1"
								maxlength="11" size="12" readonly="true"
								value='<%=form != null && form.getExpiryDate() != null && StringUtils.isNotBlank(form.getExpiryDate()[0]) ? form.getExpiryDate()[0] : "" %>'></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('expiryDate1', 'dd/mm/y');" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.effective.date" /></span></td>
							<td><html:text property="effectiveDate"
								styleId="effectiveDate1" maxlength="11" size="12"
								readonly="true"
								value='<%=form != null && form.getEffectiveDate() != null && StringUtils.isNotBlank(form.getEffectiveDate()[0]) ? form.getEffectiveDate()[0] : "" %>'></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('effectiveDate1', 'dd/mm/y');" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bank/cust/dev.arr.in" /></span></td>
							<td><html:radio property="arrangementIndicator[0]" value="B"
								styleId="arrangementIndicator1B">
								<label for="arrangementIndicator1B">B</label>
							</html:radio> <html:radio property="arrangementIndicator[0]" value="C"
								styleId="arrangementIndicator1C">
								<label for="arrangementIndicator1C">C</label>
							</html:radio> <html:radio property="arrangementIndicator[0]" value="D"
								styleId="arrangementIndicator1D">
								<label for="arrangementIndicator1D">D</label>
							</html:radio></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.remarks" /></span></td>
							<td><html:text property="remarksInsurance"
								value='<%=form != null && form.getRemarksInsurance() != null && StringUtils.isNotBlank(form.getRemarksInsurance()[0]) ? form.getRemarksInsurance()[0] : "" %>'></html:text></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<thead>
						<tr>
							<td colspan="9" style="text-align: center;"><bean:message
								key="label.facility.insurance2" /></td>

						</tr>
					</thead>
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.type.of.coverage" /></span></td>
							<td width="80%"><html:select
								property="coverageTypeEntryCode"
								value='<%=form != null && form.getCoverageTypeEntryCode() != null ? form.getCoverageTypeEntryCode()[1] : "" %>'>
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.INSURANCE_TYPE%>" />
							    </html:select> <html:errors property="coverageType[1]" />
                            </td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.insurance.company" /></span></td>
							<td><html:select property="insuranceCompanyEntryCode"
								value='<%=form != null && form.getInsuranceCompanyEntryCode() != null ? form.getInsuranceCompanyEntryCode()[1] : "" %>'>
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.INSURER_NAME%>" />
							</html:select></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.policy.no" /></span></td>
							<td><html:text property="policyNumber"
								value='<%=form != null && form.getPolicyNumber() != null && StringUtils.isNotBlank(form.getPolicyNumber()[1]) ? form.getPolicyNumber()[1] : "" %>'></html:text></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.prop.no/cv.note" /></span></td>
							<td><html:text property="propNumberOrCvNote"
								value='<%=form != null && form.getPropNumberOrCvNote() != null && StringUtils.isNotBlank(form.getPropNumberOrCvNote()[1]) ? form.getPropNumberOrCvNote()[1] : "" %>'></html:text></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.amount.insured" /></span></td>
							<td><%=form != null && form.getInsuredAmountCurrency() != null
								&& StringUtils.isNotBlank(form.getInsuredAmountCurrency()[1]) ? form
								.getInsuredAmountCurrency()[1] : limit.getApprovedLimitAmount().getCurrencyCode()%> <html:text
								property="insuredAmount"
								value='<%=form != null && form.getInsuredAmount() != null && StringUtils.isNotBlank(form.getInsuredAmount()[1]) ? form.getInsuredAmount()[1] : "" %>'></html:text>
							<html:errors property="insuredAmount[1]" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.insurance.premium" /></span></td>
							<td><%=form != null && form.getInsurancePremiumAmountCurrency() != null
						&& StringUtils.isNotBlank(form.getInsurancePremiumAmountCurrency()[1]) ? form
						.getInsurancePremiumAmountCurrency()[1] : limit.getApprovedLimitAmount().getCurrencyCode()%> <html:text
								property="insurancePremiumAmount"
								value='<%=form != null && form.getInsurancePremiumAmount() != null && StringUtils.isNotBlank(form.getInsurancePremiumAmount()[1]) ? form.getInsurancePremiumAmount()[1] : "" %>'></html:text>
							<html:errors property="insurancePremiumAmount[1]" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.issued.date" /></span></td>
							<td><html:text property="issuedDate" styleId="issuedDate2"
								maxlength="11" size="12" readonly="true"
								value='<%=form != null && form.getIssuedDate() != null && StringUtils.isNotBlank(form.getIssuedDate()[1]) ? form.getIssuedDate()[1] : "" %>'></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('issuedDate2', 'dd/mm/y');" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.expiry.date" /></span></td>
							<td><html:text property="expiryDate" styleId="expiryDate2"
								maxlength="11" size="12" readonly="true"
								value='<%=form != null && form.getExpiryDate() != null && StringUtils.isNotBlank(form.getExpiryDate()[1]) ? form.getExpiryDate()[1] : "" %>'></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('expiryDate2', 'dd/mm/y');" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.effective.date" /></span></td>
							<td><html:text property="effectiveDate"
								styleId="effectiveDate2" maxlength="11" size="12"
								readonly="true"
								value='<%=form != null && form.getEffectiveDate() != null && StringUtils.isNotBlank(form.getEffectiveDate()[1]) ? form.getEffectiveDate()[1] : "" %>'></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('effectiveDate2', 'dd/mm/y');" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bank/cust/dev.arr.in" /></span></td>
							<td><html:radio property="arrangementIndicator[1]" value="B"
								styleId="arrangementIndicator2B">
								<label for="arrangementIndicator2B">B</label>
							</html:radio> <html:radio property="arrangementIndicator[1]" value="C"
								styleId="arrangementIndicator2C">
								<label for="arrangementIndicator2C">C</label>
							</html:radio> <html:radio property="arrangementIndicator[1]" value="D"
								styleId="arrangementIndicator2D">
								<label for="arrangementIndicator2D">D</label>
							</html:radio></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.remarks" /></span></td>
							<td><html:text property="remarksInsurance" 
								value='<%=form != null && form.getRemarksInsurance() != null && StringUtils.isNotBlank(form.getRemarksInsurance()[1]) ? form.getRemarksInsurance()[1] : "" %>'></html:text></td>
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
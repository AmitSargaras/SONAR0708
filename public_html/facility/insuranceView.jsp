
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>

<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>

<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityInsurance"%>
<%@page import="com.integrosys.cms.app.limit.bus.OBFacilityInsurance"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.integrosys.cms.app.limit.trx.IFacilityTrxValue"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>

<%@page import="org.apache.commons.lang.StringUtils"%>
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
	
	String isProcess = request.getParameter("isProcess");
	boolean isProcessHere = false;
	if(isProcess!=null&&isProcess.equals("true")){
		isProcessHere = true ; 
	}
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	IFacilityTrxValue facilityTrxValue = (IFacilityTrxValue) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityTrxValue");
	IFacilityMaster facilityMasterObj = null;
	IFacilityMaster facilityMasterObjActual = null;
	if (facilityTrxValue != null) {
		facilityMasterObj = facilityTrxValue.getStagingFacilityMaster();
		facilityMasterObjActual = facilityTrxValue.getFacilityMaster();
	}
	else {
		facilityMasterObj = (IFacilityMaster) session
				.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	}
	
	Set setFacilityInsuranceStaging = facilityMasterObj.getFacilityInsuranceSet();
	//IFacilityMaster facilityMasterObj = (IFacilityMaster) session
	//		.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();
	IFacilityInsurance[] facilityInsurancesStaging = null;
	List listFacilityInsurance = null;
	if (setFacilityInsuranceStaging != null) {
		Iterator iter = setFacilityInsuranceStaging.iterator();
		facilityInsurancesStaging = new OBFacilityInsurance[setFacilityInsuranceStaging.size()];
		listFacilityInsurance = new ArrayList();
		while (iter.hasNext()) {
			IFacilityInsurance temp = (IFacilityInsurance) iter.next();
			facilityInsurancesStaging[temp.getOrder()] = temp;
		}
		for (int i = 0; i < setFacilityInsuranceStaging.size(); i++) {
			listFacilityInsurance.add(facilityInsurancesStaging[i]);
		}
	}
	if (listFacilityInsurance != null) {
		pageContext.setAttribute("listFacilityInsurance", listFacilityInsurance);
	}

	String[] styleTypeOfCoverage = { "fieldname", "fieldname" };
	String[] styleInsuranceCompany = { "fieldname", "fieldname" };
	String[] stylePolicyNo = { "fieldname", "fieldname" };
	String[] stylePropNoCvNote = { "fieldname", "fieldname" };
	String[] styleAmountInsured = { "fieldname", "fieldname" };
	String[] styleInsurancepremium = { "fieldname", "fieldname" };
	String[] styleIssuedDate = { "fieldname", "fieldname" };
	String[] styleExpiryDate = { "fieldname", "fieldname" };
	String[] styleEffectiveDate = { "fieldname", "fieldname" };
	String[] styleBankCustDevArrIn = { "fieldname", "fieldname" };
	String[] styleRemarks = { "fieldname", "fieldname" };

	if (facilityMasterObjActual != null) {
		Set setFacilityInsuranceActual = facilityMasterObjActual.getFacilityInsuranceSet();
		IFacilityInsurance[] facilityInsurancesActual = new OBFacilityInsurance[setFacilityInsuranceActual
				.size()];
		Iterator iter = setFacilityInsuranceActual.iterator();
		while (iter.hasNext()) {
			IFacilityInsurance temp = (IFacilityInsurance) iter.next();
			facilityInsurancesActual[temp.getOrder()] = temp;
		}
		if(isProcessHere){
			for (int i = 0; i < facilityInsurancesStaging.length; i++) {
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i], 
						facilityInsurancesStaging[i],"coverageTypeEntryCode")) {
					styleTypeOfCoverage[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i], 
						facilityInsurancesStaging[i],"insuranceCompanyEntryCode")) {
					styleInsuranceCompany[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i], 
								facilityInsurancesStaging[i], "policyNumber")) {
					stylePolicyNo[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i],  
						facilityInsurancesStaging[i],"propNumberOrCvNote")) {
					stylePropNoCvNote[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i],  
						facilityInsurancesStaging[i],"insuredAmount")) {
					styleAmountInsured[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i],  
						facilityInsurancesStaging[i],"insurancePremiumAmount")) {
					styleInsurancepremium[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i], 
						facilityInsurancesStaging[i], "issuedDate")) {
					styleIssuedDate[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i], 
						facilityInsurancesStaging[i], "expiryDate")) {
					styleExpiryDate[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i],  
						facilityInsurancesStaging[i],"effectiveDate")) {
					styleEffectiveDate[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i],  
						facilityInsurancesStaging[i],"arrangementIndicator")) {
					styleBankCustDevArrIn[i] = "fieldnamediff";
				}
				if (!CompareOBUtil.compOB(facilityInsurancesActual.length==0?null:facilityInsurancesActual[i], 
						facilityInsurancesStaging[i], "remarks")) {
					styleRemarks[i] = "fieldnamediff";
				}
			}
		}
	}
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
			<logic:notEmpty name="listFacilityInsurance">
			<logic:iterate id="facilityInsurance"
				collection="<%=listFacilityInsurance %>" indexId="indexId"
				type="com.integrosys.cms.app.limit.bus.IFacilityInsurance">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="tblInfo">
						<thead>
							<tr>
								<%
									if (indexId.intValue() == 0) {
								%>
								<td colspan="9" style="text-align: center;"><bean:message
									key="label.facility.insurance1" /></td>
								<%
									}
													else if (indexId.intValue() == 1) {
								%>

								<td colspan="9" style="text-align: center;"><bean:message
									key="label.facility.insurance2" /></td>
								<%
									}
								%>
							</tr>
						</thead>
						<tbody>
							<tr class="<%=style[count++%2] %>">
								<td width="20%"
									class="<%=styleTypeOfCoverage[indexId.intValue()] %>"><span
									class="stp"><bean:message
									key="label.facility.type.of.coverage" /></span></td>
								<td width="80%">
								<%
									if (facilityInsurance.getCoverageTypeEntryCode() != null
															&& StringUtils.isNotBlank(facilityInsurance.getCoverageTypeEntryCode())) {
								%>
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.INSURANCE_TYPE%>"
									entryCode="<%=facilityInsurance.getCoverageTypeEntryCode()%>"
									display="true" />
								<%
									}
													else {
								%>-<%
									}
								%>
								</td>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=styleInsuranceCompany[indexId.intValue()] %>"><span
									class="stp"><bean:message
									key="label.facility.insurance.company" /></span></td>
								<td>
								<%
									if (facilityInsurance.getInsuranceCompanyEntryCode() != null
															&& StringUtils.isNotBlank(facilityInsurance.getInsuranceCompanyEntryCode())) {
								%>
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.INSURER_NAME%>"
									entryCode="<%=facilityInsurance.getInsuranceCompanyEntryCode()%>"
									display="true" />
								<%
									}
													else {
								%>-<%
									}
								%>
								</td>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=stylePolicyNo[indexId.intValue()] %>"><span
									class="stp"><bean:message key="label.facility.policy.no" /></span></td>
								<td><integro:empty-if-null
									value="<%=facilityInsurance.getPolicyNumber()%>" /></td>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=stylePropNoCvNote[indexId.intValue()] %>"><span
									class="stp"><bean:message
									key="label.facility.prop.no/cv.note" /></span></td>
								<td><integro:empty-if-null
									value="<%=facilityInsurance.getPropNumberOrCvNote()%>" /></td>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=styleAmountInsured[indexId.intValue()] %>"><span
									class="stp"><bean:message
									key="label.facility.amount.insured" /></span></td>
								<%if(facilityInsurance.getInsuredAmount()!=null&&facilityInsurance.getInsuredAmount().getAmount()>=0){ %>
								<td><integro:amount
									amount="<%=facilityInsurance.getInsuredAmount() %>"></integro:amount>
								</td>
								<%}else{ %>
								<td>&nbsp;</td>
								<%}%>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=styleInsurancepremium[indexId.intValue()] %>"><span
									class="stp"><bean:message
									key="label.facility.insurance.premium" /></span></td>
								<%if(facilityInsurance.getInsurancePremiumAmount()!=null&&facilityInsurance.getInsurancePremiumAmount().getAmount()>=0){ %>
								<td><integro:amount
									amount="<%=facilityInsurance.getInsurancePremiumAmount() %>"></integro:amount>
								</td>
								<%}else{ %>
								<td>&nbsp;</td>
								<%}%>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=styleIssuedDate[indexId.intValue()] %>"><span
									class="stp"><bean:message
									key="label.facility.issued.date" /></span></td>
								<td><integro:date
									object="<%=facilityInsurance.getIssuedDate() %>"></integro:date>
								</td>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=styleExpiryDate[indexId.intValue()] %>"><span
									class="stp"><bean:message
									key="label.facility.expiry.date" /></span></td>
								<td><integro:date
									object="<%=facilityInsurance.getExpiryDate() %>"></integro:date>
								</td>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=styleEffectiveDate[indexId.intValue()] %>"><span
									class="stp"><bean:message
									key="label.facility.effective.date" /></span></td>
								<td><integro:date
									object="<%=facilityInsurance.getEffectiveDate() %>"></integro:date>
								</td>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=styleBankCustDevArrIn[indexId.intValue()] %>"><span
									class="stp"><bean:message
									key="label.facility.bank/cust/dev.arr.in" /></span></td>
								<td><%=facilityInsurance.getArrangementIndicator()%></td>
							</tr>
							<tr class="<%=style[count++%2] %>">
								<td class="<%=styleRemarks[indexId.intValue()] %>"><span
									class="stp"><bean:message key="label.remarks" /></span></td>
								<td>
								<%
									if (StringUtils.isNotBlank(facilityInsurance.getRemarks())) {
								%>
								<%=facilityInsurance.getRemarks()%>
								<%
									}
													else {
								%>-<%
									}
								%>
								</td>
							</tr>
						</tbody>
					</table>
					</td>
				</tr>
			</logic:iterate>
			</logic:notEmpty>
		</tbody>
	</table>
</html:form>
</body>
</html>
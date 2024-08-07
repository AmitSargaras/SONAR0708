
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.app.limit.trx.IFacilityTrxValue"%>

<%@page	import="com.integrosys.cms.ui.limit.facility.main.FacilityMainAction"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile,
				com.integrosys.base.businfra.currency.Amount,
				com.integrosys.base.uiinfra.common.ICommonEventConstant,
				com.integrosys.cms.ui.common.constant.IGlobalConstant" %>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>

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
	int count = 0;
	String isProcess = request.getParameter("isProcess");
	boolean isProcessHere = false;
	if(isProcess!=null&&isProcess.equals("true")){
		isProcessHere = true ; 
	}

	ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	
	ILimit limit = (ILimit) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.limit");
	IFacilityTrxValue facilityTrxValue = (IFacilityTrxValue) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityTrxValue");
	IFacilityMaster facilityMasterObj = null;
	IFacilityMaster facilityMasterActual = null;
	if (facilityTrxValue != null) {
		facilityMasterObj = facilityTrxValue.getStagingFacilityMaster();
		facilityMasterActual = facilityTrxValue.getFacilityMaster();
	}
	else {
		facilityMasterObj = (IFacilityMaster) session
				.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	}
	
	boolean isLoanAccountType = false;
	if(limit!=null&&limit.getAccountType()!=null&&"L".equals(limit.getAccountType())){
		isLoanAccountType = true;
	}
	
	//IFacilityMaster facilityMasterObj = (IFacilityMaster) session
	//		.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	if (limit == null) {
		limit = facilityMasterObj.getLimit();
	}
	String cmsLimitId = request.getParameter("cmsLimitId");
	if (cmsLimitId == null) {
		cmsLimitId = String.valueOf(limit.getLimitID());
	}
	String styleInstallmentAmount = "fieldname";
	String styleDrawingLimit = "fieldname";
	String styleApprovedAmount = "fieldName";
	String styleFinancedAmount = "fieldName";
	String styleTerm = "fieldName";
	String styleTermCode = "fieldName";
	String styleInterestRate = "fieldName";
	String styleOfficer = "fieldName";
	String styleSpread = "fieldName";
	String styleGracePeriod = "fieldName";
	String styleGraceCode = "fieldName";
	String styleFinalPaymentAmount = "fieldname";
	String styleRequiredSecurityCoverage = "fieldname";
	String styleAcfNo = "fieldname";
	String styleLoanPurposeCode = "fieldname";
	String styleProductPackageCode = "fieldname";
	String styleDateOfferAccepted = "fieldname";
	String styleDateOfOffer = "fieldname";
	String styleApprovedBy = "fieldname";
	String styleDateApproved = "fieldname";
	String styleCancRejCode = "fieldname";
	String styleCancRejDate = "fieldname";
	String styleCarCode = "fieldname";
	String styleLimitStatus = "fieldname";
	String styleFacilityStatus = "fieldname";
	String styleCarCodeFlag = "fieldname";
	String styleRateType = "fieldname";
	String styleSpreadSign = "fieldname";
	String stylePrimeRateFloor = "fieldname";
	String stylePrimeRateCeiling = "fieldname";
	String stylePrimeReviewDate = "fieldname";
	String stylePrimeReviewTerm = "fieldname";
	String stylePrimeReviewTermCode = "fieldname";
	String styleApplicationSource = "fieldname";
	//String styleLimitCurrency = "fieldname";
	String styleODExcessRateVarCode = "fieldname";
	String styleODExcessRateVar = "fieldname";
	String styleDealerNumberLLPCode = "fieldname";
	String styleCommissionFees = "fieldname";
	String styleHandlingFees = "fieldname";
	String styleSubsidyAmount = "fieldname";
	String styleOthersFee = "fieldname";
	String styleComissionRate = "fieldname";
	String styleComissionBasis = "fieldname";
	String styleMaximumComission = "fieldname";
	String styleMinimumComission = "fieldname";
	String styleFacCommitmentRate = "fieldname";
	String styleFacCommitmentRateNo = "fieldname";
	String styleMainFacility = "fieldname";
	String styleMainFacilityAANo = "fieldname";
	String styleMainFacilityCode = "fieldname";
	String styleMainFacilitySeqNo = "fieldname";
	String styleStandByLine = "fieldname";
	String styleRevolvingNonRevolving = "fieldname";
	String styleRevOnOSBalOrORGAMT = "fieldname";
	String styleFloorPledgedLimit = "fieldname";
	String styleRetentionSum = "fieldname";
	String styleRetentionPeriod = "fieldname";
	String styleAllowIncentive = "fieldname";
	String styleDateApprovedByCGCBNM = "fieldname";
	String styleEffectiveCostOfFund = "fieldname";
	String styleEcofAdministrationCost = "fieldname";
	String styleEcofRate = "fieldname";
	String styleEcofVariance = "fieldname";
	String styleEcofVarianceCode = "fieldname";
	String styleFacilityAvalDate = "fieldname";
	String styleFacilityAvalPeriod = "fieldname";
	String styleDepartmentCode = "fieldname";
	String styleRefinanceFromBank = "fieldname";
	String styleSolicitorName = "fieldname";
	if (facilityMasterActual != null&&isProcessHere) {
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "installmentAmount")) {
			styleInstallmentAmount = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "approvedAmount")) {
			styleApprovedAmount = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "financedAmount")) {
			styleFinancedAmount = "fieldnamediff";
		}
		/*
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "drawingLimitAmount")) {
			styleDrawingLimit = "fieldnamediff";
		}*/
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "finalPaymentAmount")) {
			styleFinalPaymentAmount = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "requiredSecurityCoverage")) {
			styleRequiredSecurityCoverage = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "acfNo")) {
			styleAcfNo = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "loanPurposeEntryCode")) {
			styleLoanPurposeCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "productPackageCodeEntryCode")) {
			styleProductPackageCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "offerAcceptedDate")) {
			styleDateOfferAccepted = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "offerDate")) {
			styleDateOfOffer = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "personApprovedEntryCode")) {
			styleApprovedBy = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "approvedDate")) {
			styleDateApproved = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "cancelOrRejectEntryCode")) {
			styleCancRejCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "cancelOrRejectDate")) {
			styleCancRejDate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "carEntryCode")) {
			styleCarCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "limitStatusEntryCode")) {
			styleLimitStatus = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "facilityStatusEntryCode")) {
			styleFacilityStatus = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "carCodeFlag")) {
			styleCarCodeFlag = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "term")) {
			styleTerm = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "termCodeEntryCode")) {
			styleTermCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityGeneral(), facilityMasterObj.getFacilityGeneral(), "officerEntryCode")) {
			styleOfficer = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(), "interestRateTypeEntryCode")) {
			styleRateType = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(), "spreadSign")) {
			styleSpreadSign = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(), "primeRateFloor")) {
			stylePrimeRateFloor = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(), "primeRateCeiling")) {
			stylePrimeRateCeiling = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(), "primeReviewDate")) {
			stylePrimeReviewDate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(), "primeReviewTerm")) {
			stylePrimeReviewTerm = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(), "interestRate")) {
			styleInterestRate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityInterest(), facilityMasterObj.getFacilityInterest(), "spread")) {
			styleSpread = "fieldnamediff";
		}
		//if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "drawingLimitAmount")) {
		//	styleLimitCurrency = "fieldnamediff";
		//}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "OdExcessRateVarCode")) {
			styleODExcessRateVarCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "odExcessRateVar")) {
			styleODExcessRateVar = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "dealerNumberOrLppCodeEntryCode")) {
			styleDealerNumberLLPCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityPayment(), facilityMasterObj.getFacilityPayment(), "gracePeriodEntryCode")) {
			styleGracePeriod = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityPayment(), facilityMasterObj.getFacilityPayment(), "gracePeriodCodeEntryCode")) {
			styleGraceCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(), "commissionFeesAmount")) {
			styleCommissionFees = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(), "handlingFeesAmount")) {
			styleHandlingFees = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(), "subsidyAmount")) {
			styleSubsidyAmount = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(), "othersFeeAmount")) {
			styleOthersFee = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(), "commissionRate")) {
			styleComissionRate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(), "commissionBasisEntryCode")) {
			styleComissionBasis = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(), "maximumCommissionAmount")) {
			styleMaximumComission = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(), "minimumCommissionAmount")) {
			styleMinimumComission = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual.getFacilityFeeCharge(), facilityMasterObj.getFacilityFeeCharge(), "facilityCommitmentRate")) {
			styleFacCommitmentRate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "mainFacility")) {
			styleMainFacility = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "mainFacilityAaNumber")) {
			styleMainFacilityAANo = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "mainFacilityCode")) {
			styleMainFacilityCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "mainFacilitySequenceNumber")) {
			styleMainFacilitySeqNo = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "standbyLine")) {
			styleStandByLine = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "revolvingIndicator")) {
			styleRevolvingNonRevolving = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "revolvingOnCriteriaIndicator")) {
			styleRevOnOSBalOrORGAMT = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "floorPledgedLimitAmount")) {
			styleFloorPledgedLimit = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "retentionSumAmount")) {
			styleRetentionSum = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "retentionPeriod")) {
			styleRetentionPeriod = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "allowIncentive")) {
			styleAllowIncentive = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "cgcBnmApprovedDate")) {
			styleDateApprovedByCGCBNM = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "effectiveCostOfFund")) {
			styleEffectiveCostOfFund = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "ecofAdministrationCostAmount")) {
			styleEcofAdministrationCost = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "ecofRate")) {
			styleEcofRate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "ecofVariance")) {
			styleEcofVariance = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "ecofVarianceCode")) {
			styleEcofVarianceCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "facilityAvailDate")) {
			styleFacilityAvalDate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "facilityAvailPeriod")) {
			styleFacilityAvalPeriod = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "departmentCodeEntryCode")) {
			styleDepartmentCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "refinanceFromBankEntryCode")) {
			styleRefinanceFromBank = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityMasterActual, facilityMasterObj, "solicitorName")) {
			styleSolicitorName = "fieldnamediff";
		}
	}
%>
<body>
<html:form action="FacilityMaster.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.master" /></h3>
				</td>
				<td width="30%" style="text-align: right"><bean:message
					key="label.indicate.mandatory" /></td>
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
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
					<thead>
						<tr>
							<td colspan="9" style="text-align: left"><bean:message key="label.facility.-.master" /></td>
						</tr>
					</thead>
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname" width="20%"><bean:message
								key="label.facility.cms.limit.id" /></td>
							<td width="30%" colspan="3"><integro:empty-if-null
								value="<%=cmsLimitId %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname" width="20%"><span class="stp"><bean:message
								key="label.facility.aa.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td width="30%"><%=profile.getBCAReference()%></td>
							<td class="fieldname" width="20%"><span class="stp"><bean:message
								key="label.facility.code" /></span><bean:message key="label.mandatory" /></td>
							<td width="30%"><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.sequence.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=limit.getFacilitySequence()%></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.branch.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td><integro:empty-if-null
								value="<%=limit.getBookingLocation().getOrganisationCode() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.product.type" /></span><bean:message
								key="label.mandatory" /></td>
							<td><integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limit.getProductCode() %>" descWithCode="false"/>&nbsp;
								</td>
							<td class="<%=styleFinancedAmount%>"><span class="stp"><bean:message
								key="label.facility.amount.financed" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj != null &&facilityMasterObj.getFacilityGeneral()!=null
										&&facilityMasterObj.getFacilityGeneral().getFinancedAmount() != null) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityGeneral().getFinancedAmount() %>" decimal="2" ></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.date.entered" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? 
									(facilityMasterObj.getFacilityGeneral()==null?null:
											facilityMasterObj.getFacilityGeneral().getEnteredDate()) : null%>"></integro:date>&nbsp;</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.application.date" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? 
										(facilityMasterObj.getFacilityGeneral()==null?null:
												facilityMasterObj.getFacilityGeneral().getApplicationDate()) : null%>"></integro:date>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleApprovedAmount%>"><span class="stp"><bean:message
								key="label.limit.approved.limit" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityGeneral()!=null && facilityMasterObj.getFacilityGeneral().getApprovedAmount() != null) {
							%> <integro:amount amount="<%=facilityMasterObj.getFacilityGeneral().getApprovedAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
							<td	class="<%=styleInstallmentAmount %>"><span
								class="stp"><bean:message
								key="label.facility.installment.amount" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityGeneral()!=null
										&&facilityMasterObj.getFacilityGeneral().getInstallmentAmount() != null) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityGeneral().getInstallmentAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleDrawingLimit %>"><span class="stp"><bean:message
								key="label.limit.drawing.limit" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getDrawingLimitAmount() != null) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getDrawingLimitAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleFinalPaymentAmount %>"><span class="stp"><bean:message
								key="label.facility.final.payment.amount" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityGeneral()!=null
										&&facilityMasterObj.getFacilityGeneral().getFinalPaymentAmount() != null) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityGeneral().getFinalPaymentAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleTermCode%>"><span class="stp"><bean:message
								key="label.facility.term.code" /></span>
									<% if (isLoanAccountType)  { %><bean:message key="label.mandatory" /><%}%></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityGeneral() != null&&facilityMasterObj.getFacilityGeneral().getTermCodeEntryCode()!=null) {
							%> <integro:common-code
									categoryCode="<%=facilityMasterObj.getFacilityGeneral().getTermCodeCategoryCode() %>"
									entryCode="<%=facilityMasterObj.getFacilityGeneral().getTermCodeEntryCode() %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleTerm%>"><span class="stp"><bean:message
								key="label.facility.term" />
									<% if (isLoanAccountType)  { %><bean:message key="label.mandatory" /><%}%></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityGeneral() != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityGeneral().getTerm() %>" />
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleRequiredSecurityCoverage %>"><bean:message
								key="label.limit.required.security.coverage" /></td>
							<%if(facilityMasterObj!=null&&facilityMasterObj.getRequiredSecurityCoverage()!=null){ %>
							<td><%=(Float.parseFloat(facilityMasterObj.getRequiredSecurityCoverage())<0) ? "-" : facilityMasterObj.getRequiredSecurityCoverage() %></td>
							<%}else {%><td>&nbsp;</td><%} %>
							<td class="<%=styleAcfNo %>"><span class="stp"><bean:message
								key="label.facility.acf.no" /></span>
								<% if (!ICMSConstant.APPLICATION_TYPE_HP.equals(profile.getApplicationType())) { %>
								<bean:message key="label.mandatory" />
								<% } %>
							</td>
							<%if(facilityMasterObj!=null){ %>
							<td><integro:empty-if-null
								value="<%=facilityMasterObj.getAcfNo() %>" /></td>
							<%}else {%><td>&nbsp;</td><%} %>
						</tr>
						<tr class="<%=style[count++%2] %>">

							<td class="<%=styleLoanPurposeCode %>"><span class="stp"><bean:message
								key="label.facility.loan.purpose.code" /></span>								
								<bean:message key="label.mandatory" />
							</td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null
										&&StringUtils.isNotBlank(facilityMasterObj.getFacilityGeneral().getLoanPurposeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.LOAN_PURPOSE%>"
								entryCode="<%=facilityMasterObj.getFacilityGeneral().getLoanPurposeEntryCode()%>"
								display="true" />
							<%
 								}
 							%>&nbsp;
							</td>
							<td class="<%=styleProductPackageCode %>"><span class="stp"><bean:message
								key="label.facility.product.package.code" /></span></td>

							<td>
							<%
								if (facilityMasterObj!=null
										&&StringUtils.isNotBlank(facilityMasterObj.getProductPackageCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.PRODUCT_PACKAGE%>"
								entryCode="<%=facilityMasterObj.getProductPackageCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="4"></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleDateOfferAccepted %>" width="20%"><span class="stp"><bean:message
								key="label.facility.date.offer.accepted" /></span><bean:message
								key="label.mandatory" /></td>
							<%if(facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null){ %>
							<td width="30%"><integro:date
								object="<%=facilityMasterObj.getFacilityGeneral().getOfferAcceptedDate() %>"></integro:date>&nbsp;
							</td>
							<%}else{ %><td width="30%">&nbsp;</td><%} %>
							<td class="<%=styleDateOfOffer %>" width="20%"><span class="stp"><bean:message
								key="label.facility.date.offer" /></span><bean:message
								key="label.mandatory" /></td>
							<%if(facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null){ %>
							<td width="30%"><integro:date
								object="<%=facilityMasterObj.getFacilityGeneral().getOfferDate() %>"></integro:date>&nbsp;
							</td>
							<%}else{ %><td width="30%">&nbsp;</td><%} %>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleApprovedBy %>"><span class="stp"><bean:message
								key="label.facility.approved.by" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null
										&&StringUtils.isNotBlank(facilityMasterObj.getFacilityGeneral().getPersonApprovedEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.APPROVED_BY%>"
								entryCode="<%=facilityMasterObj.getFacilityGeneral().getPersonApprovedEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleDateApproved %>"><span class="stp"><bean:message
								key="label.facility.date.approved" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%if(facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null){ %>
							<integro:date
								object="<%=facilityMasterObj.getFacilityGeneral().getApprovedDate() %>"></integro:date>
							<% }%>
							&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleCancRejCode %>"><span class="stp"><bean:message
								key="label.facility.cancel.reject.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null
										&&StringUtils.isNotBlank(facilityMasterObj.getFacilityGeneral().getCancelOrRejectEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.CANC_REJ_CODE%>"
								entryCode="<%=facilityMasterObj.getFacilityGeneral().getCancelOrRejectEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleCancRejDate %>"><span class="stp"><bean:message
								key="label.facility.cancel.reject.date" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? 
										(facilityMasterObj.getFacilityGeneral()==null?null:
												facilityMasterObj.getFacilityGeneral().getCancelOrRejectDate()) : null%>"></integro:date>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="4"></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleCarCode %>" width="20%"><span class="stp"><bean:message
								key="label.facility.car.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td width="30%">
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null
										&&StringUtils.isNotBlank(facilityMasterObj.getFacilityGeneral().getCarEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.CAR_CODE%>"
								entryCode="<%=facilityMasterObj.getFacilityGeneral().getCarEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleOfficer%>" width="20%"><span class="stp"><bean:message
								key="label.facility.officer" /></span><bean:message
								key="label.mandatory" /></td>
							<td width="30%">
							<%
								if (facilityMasterObj != null&&facilityMasterObj.getFacilityGeneral()!=null) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.OFFICER%>"
								entryCode="<%=facilityMasterObj.getFacilityGeneral().getOfficerEntryCode()%>"
								display="true" />
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleLimitStatus %>"><span class="stp"><bean:message
								key="label.documentation.status" /></span><bean:message key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null
										&&StringUtils.isNotBlank(facilityMasterObj.getFacilityGeneral().getLimitStatusEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.LMT_STATUS%>"
								entryCode="<%=facilityMasterObj.getFacilityGeneral().getLimitStatusEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleFacilityStatus %>"><span class="stp"><bean:message
								key="label.facility.status" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null
										&&StringUtils.isNotBlank(facilityMasterObj.getFacilityGeneral().getFacilityStatusEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.FACILITY_STATUS%>"
								entryCode="<%=facilityMasterObj.getFacilityGeneral().getFacilityStatusEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleInterestRate%>"><span class="stp"><bean:message
								key="label.facility.interest.rate" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj != null&&facilityMasterObj.getFacilityInterest()!=null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityInterest().getInterestRate() %>" />
							<%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleCarCodeFlag %>"><span class="stp"><bean:message
								key="label.facility.car.code.flag" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityGeneral()!=null
										&&facilityMasterObj.getFacilityGeneral().getCarCodeFlag() != null) {
							%> <%=facilityMasterObj.getFacilityGeneral().getCarCodeFlag().booleanValue() ? "Yes"
							: "No"%>
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleSpread%>"><span class="stp"><bean:message
								key="label.facility.spread" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null&&facilityMasterObj.getFacilityInterest()!=null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityInterest().getSpread() %>" />&nbsp;
							<%
								}
							%>
							</td>
							<td class="<%=styleRateType%>"><span class="stp"><bean:message
								key="label.facility.rate.type" /></span></td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityInterest()!=null
										&&StringUtils.isNotBlank(facilityMasterObj.getFacilityInterest().getInterestRateTypeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.FAC_RATE%>"
								entryCode="<%=facilityMasterObj.getFacilityInterest().getInterestRateTypeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleSpreadSign %>"><span class="stp"><bean:message
								key="label.facility.spread.sign" /></span></td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityInterest()!=null&&
										facilityMasterObj.getFacilityInterest().getSpreadSign() != null ) {
									if(facilityMasterObj.getFacilityInterest().getSpreadSign().toString().equals(" ")){
							%> (N/A) <%}else{ %>
								(<%=facilityMasterObj.getFacilityInterest().getSpreadSign()%>)
							<%
								}}
							%>&nbsp;
							</td>
							<td class="<%=stylePrimeRateFloor %>"><span class="stp"><bean:message
								key="label.facility.prime.rate.floor" /></span></td>
							<% if (facilityMasterObj !=null && facilityMasterObj.getFacilityInterest() != null){ %>
							<td><integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityInterest().getPrimeRateFloor()%>" /></td>
							<% } else { %>
								<td>&nbsp;</td>
							<% } %>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=stylePrimeRateCeiling %>"><span class="stp"><bean:message
								key="label.facility.prime.rate.ceiling" /></span></td>
							<% if (facilityMasterObj !=null && facilityMasterObj.getFacilityInterest() != null){ %>
							<td><integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityInterest().getPrimeRateCeiling()%>" /></td>
							<% } else { %>
								<td>&nbsp;</td>
							<% } %>
							<td class="<%=stylePrimeReviewDate %>"><span class="stp"><bean:message
								key="label.facility.prime.review.date" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? 
										(facilityMasterObj.getFacilityInterest()==null? null :
												facilityMasterObj.getFacilityInterest().getPrimeReviewDate()) : null%>"></integro:date>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=stylePrimeReviewTerm %>"><span class="stp"><bean:message
								key="label.facility.prime.review.term" /></span></td>
							<%if (facilityMasterObj !=null && facilityMasterObj.getFacilityInterest() != null){ %>
							<td><integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityInterest().getPrimeReviewTerm()%>" /></td>
							<%}else{ %>
								<td>&nbsp;</td>
							<%} %>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.prime.review.term.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityInterest()!=null&&
										StringUtils.isNotBlank(facilityMasterObj.getFacilityInterest().getPrimeReviewTermCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.PRIME_REVIEW_TERM_CODE%>"
								entryCode="<%=facilityMasterObj.getFacilityInterest().getPrimeReviewTermCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleApplicationSource %>"><span class="stp"><bean:message
								key="label.facility.application.source" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj!=null&&
										StringUtils.isNotBlank(facilityMasterObj.getApplicationSourceEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.APPLICATION_SOURCE%>"
								entryCode="<%=facilityMasterObj.getApplicationSourceEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.limit.currency" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityCurrencyCode() %>" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleODExcessRateVarCode %>"><span class="stp"><bean:message
								key="label.facility.od.excess.rate.var.code" /></span></td>
							<td>
							<% if (facilityMasterObj != null && StringUtils.isNotBlank(facilityMasterObj.getOdExcessRateVarCode())) { %>
							<integro:yesno-display value="<%=facilityMasterObj.getOdExcessRateVarCode() %>"/>
							<%} %>&nbsp;</td>
							<td class="<%=styleODExcessRateVar %>"><span class="stp"><bean:message
								key="label.facility.od.excess.rate.var" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getOdExcessRateVar()%>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleDealerNumberLLPCode %>"><span class="stp"><bean:message
								key="label.facility.dealer.number.llp.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj!=null&&
										StringUtils.isNotBlank(facilityMasterObj.getDealerNumberOrLppCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.DEALER%>"
								entryCode="<%=facilityMasterObj.getDealerNumberOrLppCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.late.charge.type" /></span></td>
							<td><%=facilityMasterObj != null && facilityMasterObj.getFacilityFeeCharge() != null
						&& facilityMasterObj.getFacilityFeeCharge().getLateChargeType() != null ? (String
						.valueOf(facilityMasterObj.getFacilityFeeCharge().getLateChargeType())) : ("-")%></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleCommissionFees %>"><span class="stp"><bean:message
								key="label.facility.commission.fees" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityFeeCharge() != null
											&& facilityMasterObj.getFacilityFeeCharge().getCommissionFeesAmount() != null
											&&facilityMasterObj.getFacilityFeeCharge().getCommissionFeesAmount().getAmount()>=0) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityFeeCharge().getCommissionFeesAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleHandlingFees %>"><span class="stp"><bean:message
								key="label.facility.handling.fees" /></span></td>
							<td><%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityFeeCharge() != null
											&& facilityMasterObj.getFacilityFeeCharge().getHandlingFeesAmount() != null
											&&facilityMasterObj.getFacilityFeeCharge().getHandlingFeesAmount().getAmount()>=0) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityFeeCharge().getHandlingFeesAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleSubsidyAmount %>"><span class="stp"><bean:message
								key="label.facility.subsidy.amount" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityFeeCharge() != null 
										&& facilityMasterObj.getFacilityFeeCharge().getSubsidyAmount() != null
										&&facilityMasterObj.getFacilityFeeCharge().getSubsidyAmount().getAmount()>=0) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityFeeCharge().getSubsidyAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleOthersFee %>"><span class="stp"><bean:message
								key="label.facility.others.fee" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityFeeCharge() != null 
										&& facilityMasterObj.getFacilityFeeCharge().getOthersFeeAmount() != null
										&&facilityMasterObj.getFacilityFeeCharge().getOthersFeeAmount().getAmount()>=0) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityFeeCharge().getOthersFeeAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleComissionRate %>"><span class="stp"><bean:message
								key="label.facility.commission.rate" /></span></td>
							<td>
							<% if (facilityMasterObj != null && facilityMasterObj.getFacilityFeeCharge() != null) { %>
							<integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityFeeCharge().getCommissionRate()%>" />
								<%} else {%>-<%} %>
							</td>
							<td class="<%=styleComissionBasis %>"><span class="stp"><bean:message
								key="label.facility.commission.basis" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityFeeCharge() != null && 
										StringUtils.isNotBlank(facilityMasterObj.getFacilityFeeCharge().getCommissionBasisEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.COMMISSION_BASIS%>"
								entryCode="<%=facilityMasterObj.getFacilityFeeCharge().getCommissionBasisEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleMaximumComission %>"><span class="stp"><bean:message
								key="label.facility.maximum.commission" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityFeeCharge() != null
											&& facilityMasterObj.getFacilityFeeCharge().getMaximumCommissionAmount() != null
											&&facilityMasterObj.getFacilityFeeCharge().getMaximumCommissionAmount().getAmount()>=0) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityFeeCharge().getMaximumCommissionAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleMinimumComission %>"><span class="stp"><bean:message
								key="label.facility.minimum.commission" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityFeeCharge() != null
											&& facilityMasterObj.getFacilityFeeCharge().getMinimumCommissionAmount() != null
											&&facilityMasterObj.getFacilityFeeCharge().getMinimumCommissionAmount().getAmount()>=0) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityFeeCharge().getMinimumCommissionAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.standby.line.fac.code" /></span></td>
							<td><%=facilityMasterObj != null && facilityMasterObj.getStandByLineFacilityCode() != null ? (facilityMasterObj
								.getStandByLineFacilityCode())
								: ("-")%>&nbsp;</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.standby.line.fac.seq" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getStandByLineFacilityCodeSequence()%>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.expiry.date" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? 
									(facilityMasterObj.getLimit()==null? null :
									facilityMasterObj.getLimit().getLimitExpiryDate()) : null %>"></integro:date>&nbsp;</td>
							<td class="<%=styleFacCommitmentRate %>"><span class="stp"><bean:message
								key="label.facility.fac.commitment.rate" /></span></td>
							<td>
							<%if (facilityMasterObj != null  && facilityMasterObj.getFacilityFeeCharge() != null) { %>
							<integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityFeeCharge().getFacilityCommitmentRate()%>" />
								<%} else { %>-<%} %>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.fac.commitment.rate.no" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityFeeCharge() != null && StringUtils.isNotBlank(facilityMasterObj.getFacilityFeeCharge()
											.getFacilityCommitmentRateNumberEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.FAC_RATE%>"
								entryCode="<%=facilityMasterObj.getFacilityFeeCharge().getFacilityCommitmentRateNumberEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.last.maint.date" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? facilityMasterObj.getLastMaintenanceDate() : null %>"></integro:date></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.original.amount" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityGeneral()!=null
										&&facilityMasterObj.getFacilityGeneral().getOriginalAmount() != null) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityGeneral().getOriginalAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleMainFacility %>"><span class="stp"><bean:message
								key="label.facility.main.facility" /></span></td>
                            <td><%if(facilityMasterObj != null){%>
                                <integro:boolean-display value="<%=facilityMasterObj.getMainFacility()%>" style="yn" />
                                <%}%>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleMainFacilityAANo %>"><span class="stp"><bean:message
								key="label.facility.main.facility.aa.no" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj==null?null:facilityMasterObj.getMainFacilityAaNumber()%>" /></td>
							<td class="<%=styleMainFacilityCode %>"><span class="stp"><bean:message
								key="label.facility.main.facility.code" /></span></td>
							<td><%=facilityMasterObj != null && facilityMasterObj.getMainFacilityCode() != null ? (facilityMasterObj
								.getMainFacilityCode())
								: ("-")%>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleMainFacilitySeqNo %>"><span class="stp"><bean:message
								key="label.facility.main.facility.seq.no" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getMainFacilitySequenceNumber()%>" /></td>
							<td class="<%=styleStandByLine %>"><span class="stp"><bean:message
								key="label.facility.standby.line" /></span></td>
							<td><%=ICMSConstant.TRUE_VALUE.equals(facilityMasterObj.getStandbyLine()) ? "Yes" : "No"%></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.level" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getLevel()%>" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.amount.utilised" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null &&facilityMasterObj.getFacilityGeneral()!=null&&
										facilityMasterObj.getFacilityGeneral().getUtilisedAmount() != null) {
							%> <integro:amount
								amount="<%=facilityMasterObj != null ? facilityMasterObj.getFacilityGeneral().getUtilisedAmount() : null%>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.spec.provision" /></span></td>
							<td><%=facilityMasterObj != null && facilityMasterObj.getSpecProvision() != null ? (String
						.valueOf(facilityMasterObj.getSpecProvision())) : ("-")%></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.int.in.suspense" /></span></td>
							<td><%=facilityMasterObj != null && facilityMasterObj.getIntInSuspense() != null ? (String
						.valueOf(facilityMasterObj.getIntInSuspense())) : ("-")%></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.os.balance" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getLimit() != null
											&& facilityMasterObj.getLimit().getOutstandingAmount() != null) {
							%> <integro:amount
								amount="<%=facilityMasterObj != null ? facilityMasterObj.getLimit().getOutstandingAmount() : null %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
<%--
							<td class="fieldname"><span class="stp"><bean:message key="label.facility.payment.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityPayment() != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityPayment().getPaymentCodeEntryCode() %>" />
							<%
								}
							%>&nbsp;
							</td> --%>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.payment.frequency" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityPayment() != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityPayment().getPaymentFrequencyEntryCode() %>" />
							<%
								}
							%>
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.payment.freq.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityPayment() != null) {
							%>  <integro:common-code
								categoryCode="<%=ICMSUIConstant.FREQ_TYPE%>"
								entryCode="<%=facilityMasterObj.getFacilityPayment().getPaymentFrequencyCodeEntryCode()%>"
								display="true" />
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.int.payment.frequency" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityPayment() != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityPayment().getInterestPaymentFrequencyEntryCode() %>" />
							<%
								}
							%>&nbsp;
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.int.payment.freq.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityPayment() != null) {
							%> <integro:common-code
								categoryCode="<%=ICMSUIConstant.FREQ_TYPE%>"
								entryCode="<%=facilityMasterObj.getFacilityPayment().getInterestPaymentFrequencyCodeEntryCode()%>"
								display="true" />
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleGracePeriod%>"><span class="stp"><bean:message
								key="label.facility.grace.period" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityPayment() != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityPayment().getGracePeriodEntryCode() %>" />
							<%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleGraceCode%>"><span class="stp"><bean:message
								key="label.facility.grace.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityPayment() != null) {
							%>  <integro:common-code
                                 categoryCode="28"
                                 entryCode="<%=facilityMasterObj.getFacilityPayment().getGracePeriodCodeEntryCode()%>"
                                 display="true" />
            				<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleRevolvingNonRevolving %>"><span class="stp"><bean:message
								key="label.facility.revolving.non.revolving" /></span><bean:message
								key="label.mandatory" /></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getRevolvingIndicator() %>" /></td>
							<td class="<%=styleRevOnOSBalOrORGAMT %>"><span class="stp"><bean:message
								key="label.facility.rev.on.os.bal.or.orgamt" /></span>
                                <%if(facilityMasterObj!=null&&
                                		StringUtils.isNotBlank(facilityMasterObj.getRevolvingIndicator()) && facilityMasterObj.getRevolvingIndicator().equals("R")){%>
                                    <bean:message	key="label.mandatory" /><%}%></td>
							<td>
                                <%
                                    if (facilityMasterObj!=null&&
                                    		StringUtils.isNotBlank(facilityMasterObj.getRevolvingOnCriteriaIndicator())) {
                                %>
                                <integro:common-code
								 categoryCode="<%=CategoryCodeConstant.REVOLVE_OS_BAL%>"
								 entryCode="<%=facilityMasterObj.getRevolvingOnCriteriaIndicator()%>"
								 display="true" />
                                <%
                                     }
                                %>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleFloorPledgedLimit %>"><span class="stp"><bean:message
								key="label.facility.floor.pledged.limit" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFloorPledgedLimitAmount() != null
										&&facilityMasterObj.getFloorPledgedLimitAmount().getAmount()>=0) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFloorPledgedLimitAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.actual.pledged.limit" /></span></td>
							<td><integro:amount
								amount="<%=facilityMasterObj != null ? facilityMasterObj.getActualPledgedLimitAmount() : null %>" decimal="2"></integro:amount></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.alt.schedule" /></span></td>
                            <td><%if(facilityMasterObj.isAltSchedule() != null){%>
                                <integro:boolean-display value="<%=facilityMasterObj.isAltSchedule().booleanValue()%>" style="yn" />
                                <%}%>&nbsp;</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.avail.period.in.mths" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getAvailPeriodInMonths()%>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.avail.period.in.days" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getAvailPeriodInDays()%>" /></td>
							<td class="<%=styleRetentionSum %>"><span class="stp"><bean:message
								key="label.facility.retention.sum" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getRetentionSumAmount() != null
										&&facilityMasterObj.getRetentionSumAmount().getAmount()>=0) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getRetentionSumAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleRetentionPeriod %>"><span class="stp"><bean:message
								key="label.facility.retention.period" /></span></td>
							<td>
							<%if(facilityMasterObj!=null&&facilityMasterObj.getRetentionPeriod()!=null){ %>
							<integro:empty-if-null
								value="<%=facilityMasterObj.getRetentionPeriod().floatValue()<0?null: 
								facilityMasterObj.getRetentionPeriod()%>" /><%} %>&nbsp;</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.retention.period.code" /></span></td>
							<td><%
								if (facilityMasterObj != null) {
							    %> <integro:common-code
                                 categoryCode="<%=ICMSUIConstant.FREQ_TYPE%>"
                                 entryCode="<%=facilityMasterObj.getRetentionPeriodCode()%>"
                                 display="true" />
                                <%
                                    }
                                %>&nbsp;
                            </td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.disbursement.manner" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getDisbursementManner() %>" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.cal.1st.instl.date" /></span></td>
							<td><integro:empty-if-null value="<%= facilityMasterObj==null?null:facilityMasterObj.getCalFirstInstlDate()%>"/>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.iso.referral.no" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getIsoReferralNumber() %>" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleAllowIncentive %>"><span class="stp"><bean:message
								key="label.facility.allow.incentive" /></span></td>
							<td>
							<% if (facilityMasterObj!=null&&facilityMasterObj.getAllowIncentive() != null) { %>
							<%=facilityMasterObj.getAllowIncentive().booleanValue() ? "Yes" : "No"%>
							<%} %>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleDateApprovedByCGCBNM %>"><span class="stp"><bean:message
								key="label.facility.date.approved.by.cgc/bnm" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? facilityMasterObj.getCgcBnmApprovedDate() : null%>"></integro:date></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.alternate.rate" /></span></td>
							<td>
                                <% if (facilityMasterObj != null && StringUtils.isNotBlank(facilityMasterObj.getAlternateRate())) { %>
                                <integro:yesno-display value="<%=facilityMasterObj.getAlternateRate()%>"/>
                                <%} %>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.credit.line.indicator" /></span></td>
							<td>
                                <% if (facilityMasterObj != null && StringUtils.isNotBlank(facilityMasterObj.getCreditLineIndicator())) { %>
                                <integro:yesno-display value="<%=facilityMasterObj.getCreditLineIndicator()%>"/>
                                <%} %>&nbsp;</td>
							<td class="fieldname">&nbsp;</span></td>
							<td>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleEffectiveCostOfFund %>"><span class="stp"><bean:message
								key="label.facility.effective.cost.of.fund" /></span></td>
							<td>
							<%if (facilityMasterObj!=null&&facilityMasterObj.getEffectiveCostOfFund() != null) { %>
							<%=facilityMasterObj.getEffectiveCostOfFund().booleanValue() ? "Yes" : "No"%>
							<%} %>&nbsp;
							</td>
							<td class="<%=styleEcofAdministrationCost %>"><span class="stp"><bean:message
								key="label.facility.ecof.administration.cost" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null && facilityMasterObj.getEcofAdministrationCostAmount() != null
										&&facilityMasterObj.getEcofAdministrationCostAmount().getAmount()>=0) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getEcofAdministrationCostAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleEcofRate %>"><span class="stp"><bean:message
								key="label.facility.ecof.rate" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getEcofRate()%>" /></td>
							<td class="<%=styleEcofVariance %>"><span class="stp"><bean:message
								key="label.facility.ecof.variance" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getEcofVariance()%>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleEcofVarianceCode %>"><span class="stp"><bean:message
								key="label.facility.ecof.variance.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj!=null&&
										StringUtils.isNotBlank(facilityMasterObj.getEcofVarianceCode())) {
							%> (<%=facilityMasterObj.getEcofVarianceCode()%>) <%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleFacilityAvalDate %>"><span class="stp"><bean:message
								key="label.facility.facility.aval.date" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj==null?null:facilityMasterObj.getFacilityAvailDate() %>"></integro:date>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleFacilityAvalPeriod %>"><span class="stp"><bean:message
								key="label.facility.facility.aval.period" /></span></td>
							<td><integro:empty-if-null
								value="<%=facilityMasterObj==null?null:facilityMasterObj.getFacilityAvailPeriod()%>" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.date.instructed" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? (facilityMasterObj.getDateInstructed() != null ? facilityMasterObj.getDateInstructed() : null) : null%>"></integro:date>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.solicitor.reference" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getSolicitorReference() %>" />
							<%
							 	}
							%>
							</td>
							<td class="<%=styleDepartmentCode %>"><span class="stp"><bean:message
								key="label.facility.department.code" /></span><bean:message key="label.mandatory" />
                            </td>
							<td>
							<%
								if (facilityMasterObj!=null&&StringUtils.isNotBlank(facilityMasterObj.getDepartmentCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.DEPARTMENT%>"
								entryCode="<%=facilityMasterObj.getDepartmentCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleRefinanceFromBank %>"><span class="stp"><bean:message
								key="label.facility.refinance.from.bank" /></span></td>
							<td>
							<%
								if (facilityMasterObj!=null&&StringUtils.isNotBlank(facilityMasterObj.getRefinanceFromBankEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.REFINANCE_BANK%>"
								entryCode="<%=facilityMasterObj.getRefinanceFromBankEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleSolicitorName %>"><span class="stp"><bean:message
								key="label.facility.solicitor.name" /></span></td>
							<td><integro:empty-if-null
								value="<%=facilityMasterObj==null?null:facilityMasterObj.getSolicitorName() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.lawyer.code" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj==null?null:facilityMasterObj.getLawyerCodeEntryCode()%>"/>-<integro:common-code categoryCode="<%=CategoryCodeConstant.SOLICITOR%>"
								entryCode="<%=facilityMasterObj==null?null:facilityMasterObj.getLawyerCodeEntryCode()%>"
								display="true" />&nbsp;
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.par.value.shares" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj==null?null:facilityMasterObj.getParValueShares()%>"/>&nbsp;</td>
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
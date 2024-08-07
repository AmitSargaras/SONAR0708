
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.ui.limit.facility.master.FacilityMasterForm"%>
<%@page import="com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@page import="com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.integrosys.cms.app.common.constant.PropertiesConstantHelper" %>

<%@page import="java.util.*"%>
<%@ page import="com.integrosys.cms.ui.common.constant.ICMSUIConstant" %>
<html>
<head>
<title>Untitled Document</title>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script>

function setComBasisMandatory(){
	var commissionRate = document.getElementById("commissionRateID").value;
	if(commissionRate!=null&&!(trim(commissionRate,' ').length==0)&&commissionRate!=0){
		document.getElementById("comBasisMandatoryID").style.visibility = "visible";
	  }else{
		  document.getElementById("comBasisMandatoryID").style.visibility = "hidden";
	  }
}

function setRevolOnCriterialInd(){
	if(document.getElementById("revolvingIndicatorYes").checked){
		document.getElementById("revolOnCriterialIndID").style.visibility = "visible";
        document.getElementById("revolvingOnCriteriaIndicator").disabled = false;
	  }else{
		document.getElementById("revolOnCriterialIndID").style.visibility = "hidden";
        document.getElementById("revolvingOnCriteriaIndicator").disabled = true;
        document.getElementById("revolvingOnCriteriaIndicator").value = "";
      }
}

function setVisibility(elementID,visibility){
  	document.getElementById(elementID).style.visibility = visibility;
}

function enablePendingFacilityFields() {
	document.forms[0].financedAmount.disabled=false;
	document.forms[0].approvedLimitAmount.disabled=false;
	document.forms[0].termCodeEntryCode.disabled=false;
	document.forms[0].term.diabled=false;
	document.forms[0].interestRate.disabled=false;
	document.forms[0].interestRateTypeEntryCode.disabled=false;
	document.forms[0].officerEntryCode.disabled=false;
	document.forms[0].spreadSign.disabled=false;
	document.forms[0].spread.disabled=false;
	document.forms[0].gracePeriodEntryCode.disabled=false;
	document.forms[0].gracePeriodCodeEntryCode.disabled=false;
}
</script>

</head>
<%
	ILimitProfile profile = (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);	

	String[] style = { "even", "odd" };
	int count = 0;

	ILimit limit = (ILimit) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.limit");
	
	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	if (limit == null) {
		limit = facilityMasterObj.getLimit();
	}
	String cmsLimitId = request.getParameter("cmsLimitId");
	if (cmsLimitId == null) {
		cmsLimitId = String.valueOf(limit.getLimitID());
	}
	Map errorMap = (Map) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.errorMap");
	if (errorMap != null) {
	}
	String currencyCode = limit.getApprovedLimitAmount().getCurrencyCode();

	String productDesc = null;
	if(limit!=null){
		productDesc = limit.getProductDesc();
	}
	String interestRateTypeEntryCode = null;
	String spreadSign = null;
	String minimumCommissionAmount = null;
	String maximumCommissionAmount = null; 
	String othersFeeAmount = null; 
	String subsidyAmount = null; 
	String handlingFeesAmount = null; 
	String commissionFeesAmount = null; 
	String floorPledgedLimitAmount = null; 
	String retentionSumAmount = null; 
	String ecofAdministrationCostAmount = null; 
	if(facilityMasterObj!=null){
		if(facilityMasterObj.getFloorPledgedLimitAmount()!=null){
			floorPledgedLimitAmount = facilityMasterObj.getFloorPledgedLimitAmount().getAmount()<0?"0.00":
				String.valueOf(facilityMasterObj.getFloorPledgedLimitAmount().getAmount());
		}
		if(facilityMasterObj.getRetentionSumAmount()!=null){
			retentionSumAmount = facilityMasterObj.getRetentionSumAmount().getAmount()<0?"0.00":
				String.valueOf(facilityMasterObj.getRetentionSumAmount().getAmount());
		}
		if(facilityMasterObj.getEcofAdministrationCostAmount()!=null){
			ecofAdministrationCostAmount = facilityMasterObj.getEcofAdministrationCostAmount().getAmount()<0?"0.00":
				String.valueOf(facilityMasterObj.getEcofAdministrationCostAmount().getAmount());
		}
		
		if(facilityMasterObj.getFacilityFeeCharge()!=null){
			if(facilityMasterObj.getFacilityFeeCharge().getMinimumCommissionAmount()!=null){
				minimumCommissionAmount = facilityMasterObj.getFacilityFeeCharge().getMinimumCommissionAmount().getAmount()<0?"0.00":
					String.valueOf(facilityMasterObj.getFacilityFeeCharge().getMinimumCommissionAmount().getAmount());
			}
			if(facilityMasterObj.getFacilityFeeCharge().getCommissionFeesAmount()!=null){
				commissionFeesAmount = facilityMasterObj.getFacilityFeeCharge().getCommissionFeesAmount().getAmount()<0?"0.00":
					String.valueOf(facilityMasterObj.getFacilityFeeCharge().getCommissionFeesAmount().getAmount());
			}
			if(facilityMasterObj.getFacilityFeeCharge().getHandlingFeesAmount()!=null){
				handlingFeesAmount = facilityMasterObj.getFacilityFeeCharge().getHandlingFeesAmount().getAmount()<0?"0.00":
					String.valueOf(facilityMasterObj.getFacilityFeeCharge().getHandlingFeesAmount().getAmount());
			}
			if(facilityMasterObj.getFacilityFeeCharge().getSubsidyAmount()!=null){
				subsidyAmount = facilityMasterObj.getFacilityFeeCharge().getSubsidyAmount().getAmount()<0?"0.00":
					String.valueOf(facilityMasterObj.getFacilityFeeCharge().getSubsidyAmount().getAmount());
			}
			if(facilityMasterObj.getFacilityFeeCharge().getOthersFeeAmount()!=null){
				othersFeeAmount = facilityMasterObj.getFacilityFeeCharge().getOthersFeeAmount().getAmount()<0?"0.00":
					String.valueOf(facilityMasterObj.getFacilityFeeCharge().getOthersFeeAmount().getAmount());
			}
			if(facilityMasterObj.getFacilityFeeCharge().getMaximumCommissionAmount()!=null){
				maximumCommissionAmount = facilityMasterObj.getFacilityFeeCharge().getMaximumCommissionAmount().getAmount()<0?"0.00":
					String.valueOf(facilityMasterObj.getFacilityFeeCharge().getMaximumCommissionAmount().getAmount());
			}
		}
		
		if(facilityMasterObj.getFacilityInterest()!=null){
			interestRateTypeEntryCode = facilityMasterObj.getFacilityInterest().getInterestRateTypeEntryCode();
			spreadSign = String.valueOf(facilityMasterObj.getFacilityInterest().getSpreadSign());
		}
	}

    String defaultRevolvingInd = (String)request.getAttribute("defaultRevolvingInd");
    boolean isLoanAccountType =  "L".equals(limit.getAccountType());

    boolean isEnablePendingFields = false;
    if (PropertiesConstantHelper.isPendingFacilityFieldsEnable()) {
    	if (PropertiesConstantHelper.isMigrationDataFieldsEnable()) {
    		if (ICMSConstant.TRUE_VALUE.equals(profile.getMigratedInd())) 
    			isEnablePendingFields = true;
    	} else {
    		isEnablePendingFields = true;
    	}
    }
%>
<body>
<html:form action="FacilityMaster.do">
	<html:hidden property="event" />
	<html:hidden property="productDesc" value="<%=productDesc %>"/>
	<%-- <html:hidden property="interestRateTypeEntryCode" value="<%=interestRateTypeEntryCode %>"/> --%>
	<%-- <html:hidden property="spreadSign" value="<%=spreadSign %>"/> --%>
	<html:hidden property="aaType" value="<%=profile.getApplicationType() %>"/>
    <%--<html:hidden property="defaultRevolveInd" value="<%=defaultRevolvingInd%>"/>--%>
    <input type="hidden" name="defaultRevolveInd" value="<%=defaultRevolvingInd%>">
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
				<table width="100%" border="0" cellpadding="0" cellspacing="0"
					class="tblInfo">
					<thead>
						<tr>
							<td colspan="9" style="text-align: left"><bean:message
								key="label.facility.-.master" /></td>

						</tr>
					</thead>
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname" width="20%"><bean:message
								key="label.facility.cms.limit.id" /></td>
							<td width="30%"><integro:empty-if-null
								value="<%=cmsLimitId %>" /></td>
							<td class="fieldname" width="20%">&nbsp;</td>
							<td width="30%">&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.aa.no" /></span><bean:message
								key="label.mandatory" /><html:errors property="aaNo" /></td>
							<td><%=profile.getBCAReference()%></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.code" /></span><bean:message key="label.mandatory" /></td>
							<td><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" /><html:errors property="facilityCode" /></td>
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
								value="<%=limit.getBookingLocation().getOrganisationCode() %>" /><html:errors property="branchNumber" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.product.type" /></span><bean:message
								key="label.mandatory" /></td>
							<td><integro:common-code display="true" categoryCode="<%= ICMSConstant.COMMON_CODE_PRODUCT_TYPE %>" entryCode="<%= limit.getProductCode() %>" descWithCode="false"/>&nbsp;
								<html:hidden property="productDesc"/>
								<html:errors property="productDesc" />
							</td>

							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.amount.financed" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%=currencyCode%>&nbsp;<html:text property="financedAmount" disabled="true"></html:text>
<%--
							<%
								if (facilityMasterObj != null && facilityMasterObj.getFacilityGeneral().getFinancedAmount() != null) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityGeneral().getFinancedAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>
--%>
							<html:errors property="amountFinanced" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.date.entered" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? facilityMasterObj.getFacilityGeneral().getEnteredDate() : null%>"></integro:date></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.application.date" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? facilityMasterObj.getFacilityGeneral().getApplicationDate() : null%>"></integro:date>
								<html:errors property="applicationDate" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.limit.approved.limit" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%=currencyCode%>&nbsp;<html:text property="approvedLimitAmount" disabled="true"></html:text>
<%--
							<%
								if (limit != null && limit.getApprovedLimitAmount() != null) {
							%> <integro:amount amount="<%=limit.getApprovedLimitAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>
--%>
							<html:errors property="approvedLimit" />
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.installment.amount" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=currencyCode%>&nbsp;<html:text
								property="installmentAmount"></html:text> <html:errors
								property="installmentAmount" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.limit.drawing.limit" /></span></td>
							<td><%-- <%=currencyCode%>&nbsp;<html:text property="drawingLimitAmount"></html:text> --%>
							<integro:amount amount="<%=limit.getDrawingLimitAmount() %>" decimal="2" />
							<html:hidden property="drawingLimitAmount" />
							<html:errors property="drawingLimitAmount" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.final.payment.amount" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=currencyCode%>&nbsp;<html:text
								property="finalPaymentAmount"></html:text> <html:errors
								property="finalPaymentAmount" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.term.code" /></span>
								<% if (isLoanAccountType)  { %><bean:message key="label.mandatory" /><%}%></td>
							<td>
							<html:select property="termCodeEntryCode" disabled="true">
								<integro:common-code categoryCode="28" />
							</html:select>
<%--
							<%
								if (facilityMasterObj != null) {
							%> <integro:common-code
									categoryCode="<%=facilityMasterObj.getLimit().getLimitTenorUnitNum() %>"
									entryCode="<%=facilityMasterObj.getLimit().getLimitTenorUnit() %>" 
									display="true"/>
							<%
								}
							%>&nbsp;
--%>
							<html:errors property="termCode"/>
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.term" />
									<% if (isLoanAccountType)  { %><bean:message key="label.mandatory" /><%}%></td>
							<td>
							<html:text property="term" disabled="true"></html:text>
<%--
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getLimit().getLimitTenor() %>" />
							<%
								}
							%>
--%>						
							<html:errors property="term"/>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><bean:message
								key="label.limit.required.security.coverage" /></td>
							<td><html:text property="requiredSecurityCoverage"></html:text>
							<html:errors property="requiredSecurityCoverage" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.acf.no" /></span>
								<% if (!ICMSConstant.APPLICATION_TYPE_HP.equals(profile.getApplicationType())) { %>
								<bean:message key="label.mandatory" />
								<% } %>
							</td>
							<td><html:text property="acfNo" cols="25"></html:text> <html:errors
								property="acfNo" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.loan.purpose.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="loanPurposeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.LOAN_PURPOSE%>" />
							</html:select> <html:errors property="loanPurposeEntryCode" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.product.package.code" /></span></td>
							<td><html:select property="productPackageCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.PRODUCT_PACKAGE%>" />
							</html:select></td>
						</tr>
						<tr>
							<td colspan="4"></td>
						</tr>
						<%
								boolean isDateOfferAcceptedDisabled
									= facilityMasterObj.getFacilityGeneral() != null 
										&& facilityMasterObj.getFacilityGeneral().getOfferAcceptedDate() != null;
										
								boolean isDateOfferDisabled
									= facilityMasterObj.getFacilityGeneral() != null 
										&& facilityMasterObj.getFacilityGeneral().getOfferDate() != null;
										
								pageContext.setAttribute("isDateOfferAcceptedDisabled", new Boolean(isDateOfferAcceptedDisabled));
								pageContext.setAttribute("isDateOfferDisabled", new Boolean(isDateOfferDisabled));
						%>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.date.offer.accepted" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:text property="offerAcceptedDate"
								styleId="offerAcceptedDate1" maxlength="11" size="12"
								readonly="true" disabled="<%=isDateOfferAcceptedDisabled%>"></html:text>
								<logic:equal name="isDateOfferAcceptedDisabled" value="false">
								<img src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('offerAcceptedDate1', 'dd/mm/y');" />
								</logic:equal>
							<html:errors property="offerAcceptedDate" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.date.offer" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:text property="offerDate" styleId="offerDate1"
								maxlength="11" size="12" readonly="true" disabled="<%=isDateOfferDisabled%>"></html:text>
								<logic:equal name="isDateOfferDisabled" value="false">
								<img src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('offerDate1', 'dd/mm/y');" /> 
								</logic:equal>
								<html:errors property="offerDate" /></td>
						</tr>
						<%
								boolean isPersonApprovedEntryCodeDisabled
									= facilityMasterObj.getFacilityGeneral() != null 
										&& facilityMasterObj.getFacilityGeneral().getPersonApprovedEntryCode() != null
										&& facilityMasterObj.getFacilityGeneral().getPersonApprovedEntryCode().length() > 0;

								boolean isApprovedDaterDisabled
									= facilityMasterObj.getFacilityGeneral() != null 
										&& facilityMasterObj.getFacilityGeneral().getApprovedDate() != null;
										
								pageContext.setAttribute("isApprovedDaterDisabled", new Boolean(isApprovedDaterDisabled));
						%>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.approved.by" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="personApprovedEntryCode" disabled="<%=isPersonApprovedEntryCodeDisabled%>">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.APPROVED_BY%>" />
							</html:select> <html:errors property="personApprovedEntryCode" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.date.approved" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:text property="approvedDate"
								styleId="approvedDate" maxlength="11" size="12" readonly="true" disabled="<%=isApprovedDaterDisabled%>"></html:text>
								<logic:equal name="isApprovedDaterDisabled" value="false">
								<img src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('approvedDate', 'dd/mm/y');" /> 
								</logic:equal>
								<html:errors property="approvedDate" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.cancel.reject.code" /></span><span id="cancelCodeMandatoryID"><bean:message key="label.mandatory"/></span></td>
							<td><html:select property="cancelOrRejectEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.CANC_REJ_CODE%>" />
							</html:select></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.cancel.reject.date" />
                                <span id="cancelDateMandatoryLabelID"><bean:message key="label.mandatory" /></span></span></td>
							<td>
                                <span id="cancelDateMandatoryID">
                                <html:text property="cancelOrRejectDate"
								styleId="cancelOrRejectDate" maxlength="11" size="12"
								readonly="true"></html:text><img src="img/calendara.gif"
								name="cldr" border="0"
								onClick="return showCalendar('cancelOrRejectDate', 'dd/mm/y');" />
                                </span>
                                <html:errors property="cancelOrRejectDate" />
                            </td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.car.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="carEntryCode" value="NC">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.CAR_CODE%>" />
							</html:select> <html:errors property="carEntryCode" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.officer" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%	
								boolean isOfficerDropDownDisabled 
									= facilityMasterObj.getFacilityGeneral() != null 
										&& facilityMasterObj.getFacilityGeneral().getOfficerEntryCode() != null
										&& facilityMasterObj.getFacilityGeneral().getOfficerEntryCode().length() > 0
										&& CommonDataSingleton.getCodeCategoryLabelByValue(
											CategoryCodeConstant.OFFICER, facilityMasterObj.getFacilityGeneral().getOfficerEntryCode()) != null;
							%>
							<html:select property="officerEntryCode" disabled="<%=isOfficerDropDownDisabled%>">
								<integro:common-code categoryCode="<%=CategoryCodeConstant.OFFICER%>" descWithCode="true" />
							</html:select>
<%--
							<%
								if (facilityMasterObj != null&&facilityMasterObj.getFacilityGeneral()!=null) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.OFFICER%>"
								entryCode="<%=facilityMasterObj.getFacilityGeneral().getOfficerEntryCode()%>"
								display="true" />
							<%
								}
							%>
--%>
							<html:errors property="officer"/>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.documentation.status" /></span><bean:message key="label.mandatory" /></td>
							<td><html:select property="limitStatusEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.LMT_STATUS%>" />
							</html:select> <html:errors property="limitStatusEntryCode" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.status" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="facilityStatusEntryCode" onchange="javascript:setCancelRejectDateMandatory()" >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.FACILITY_STATUS%>" />
							</html:select> <html:errors property="facilityStatusEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.interest.rate" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<html:text property="interestRate" disabled="true"></html:text>
<%--
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityInterest().getInterestRate() %>" />
							<%
								}
							%>
--%>
							<html:errors property="interestRate" />
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.car.code.flag" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:radio property="carCodeFlag" value="Y"
								styleId="carFlagYes">
								<label for="carFlagYes"><bean:message
									key="label.common.yes" /></label>
							</html:radio>&nbsp;<html:radio property="carCodeFlag" value="N"
								styleId="carFlagNo" >
								<label for="carFlagNo"><bean:message
									key="label.common.no" /></label>
							</html:radio> <html:errors property="carCodeFlag" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.spread" /></span>
						<!-- <span id="spreadMandatoryID"><bean:message key="label.mandatory" /></span> -->
							</td>
							<td>
							<html:text property="spread" disabled="true"></html:text>
<%--
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityInterest().getSpread() %>" />
							<%
								}
							%>
--%>
							<html:errors property="spread" />
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.rate.type" /></span></td>
							<td>
							<html:select property="interestRateTypeEntryCode" disabled="true">
								<integro:common-code categoryCode="<%=CategoryCodeConstant.FAC_RATE%>" />
							</html:select>
<%--
							<%
								if (facilityMasterObj!=null&&facilityMasterObj.getFacilityInterest()!=null
										&&StringUtils.isNotBlank(facilityMasterObj.getFacilityInterest().getInterestRateTypeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.FAC_RATE%>"
								entryCode="<%=facilityMasterObj.getFacilityInterest().getInterestRateTypeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>
--%>					
							&nbsp;
							<html:errors property="interestRateTypeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.spread.sign" /></span>
					<!-- <span id="spreadSignMandatoryID"><bean:message key="label.mandatory" /></span> -->
						</td>
								<td>
<%--
							<%if(facilityMasterObj != null&&facilityMasterObj.getFacilityInterest()!=null && facilityMasterObj.getFacilityInterest().getSpreadSign()!=null){ %>
								(<integro:empty-if-null value="<%=facilityMasterObj.getFacilityInterest().getSpreadSign()%>" />)
								<%} %>&nbsp;
--%>
							<html:radio property="spreadSign" value="-"
								styleId="spreadSignNeg" disabled="true">
								<label for="spreadSignNeg">-</label>
							</html:radio>&nbsp;<html:radio property="spreadSign" value="+"
								styleId="spreadSignPos" disabled="true">
								<label for="spreadSignPos">+</label>
							</html:radio>&nbsp;<html:radio property="spreadSign" value=" "
								styleId="spreadSignNA" disabled="true">
								<label for="spreadSignNA"><bean:message
									key="label.common.not.avail" /></label>
							</html:radio>

							<html:errors property="spreadSign" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.prime.rate.floor" /></span></td>
							<td><html:text property="primeRateFloor"></html:text> <html:errors
								property="primeRateFloor" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.prime.rate.ceiling" /></span></td>
							<td><html:text property="primeRateCeiling"></html:text> <html:errors
								property="primeRateCeiling" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.prime.review.date" /></span></td>
							<td>
							<html:text property="primeReviewDate"
								styleId="primeReviewDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('primeReviewDate', 'dd/mm/y');" /> <html:errors
								property="primeReviewDate" />
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.prime.review.term" /></span><span id="primeReviewTermID"><bean:message
								key="label.mandatory" /></span></td>
							<td><html:text property="primeReviewTerm" onkeyup="javascript:setPrimeReviewMandatory();" ></html:text> <html:errors
								property="primeReviewTerm" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.prime.review.term.code" /></span><span id="primeReviewTermCodeID"><bean:message
								key="label.mandatory" /></span></td>
							<td><html:select property="primeReviewTermCodeEntryCode" onchange="javascript:setPrimeReviewMandatory();" >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.PRIME_REVIEW_TERM_CODE%>" />
							</html:select>
                            <html:errors property="primeReviewTermCodeEntryCode" />
                            </td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.application.source" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="applicationSourceEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.APPLICATION_SOURCE%>" />
							</html:select> <html:errors property="applicationSourceEntryCode" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.limit.currency" /></span></td>
							<td>
							<html:select property="facilityCurrencyCode" disabled="true">
								<integro:currency-list />
							</html:select>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.od.excess.rate.var.code" /></span></td>
							<td>
							<html:radio property="odExcessRateVarCode" value="-"
								styleId="odExcessRateVarCodeNeg">
								<label for="odExcessRateVarCodeNeg">-</label>
							</html:radio>&nbsp;<html:radio property="odExcessRateVarCode" value="+"
								styleId="odExcessRateVarCodePos">
								<label for="odExcessRateVarCodePos">+</label>
							</html:radio>&nbsp;<html:radio property="odExcessRateVarCode" value=" "
								styleId="odExcessRateVarCodeNA" >
								<label for="odExcessRateVarCodeNA"><bean:message
									key="label.common.not.avail" /></label>
							</html:radio><html:errors property="odExcessRateVarCode"/> </td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.od.excess.rate.var" /></span></td>
							<td>
							<html:text property="odExcessRateVar"></html:text> <html:errors property="odExcessRateVar"/>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.dealer.number.llp.code" /></span></td>
							<td><html:select property="dealerNumberOrLppCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.DEALER%>" descWithCode="true" />
							</html:select>
                            <html:errors property="dealerNumberOrLppCodeEntryCode"/>
                            </td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.late.charge.type" /></span></td>
							<td><%=facilityMasterObj != null
						&& facilityMasterObj.getFacilityFeeCharge().getLateChargeType() != null ? (String
						.valueOf(facilityMasterObj.getFacilityFeeCharge().getLateChargeType())) : ("-")%></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.commission.fees" /></span></td>
							<td><%=currencyCode%>&nbsp;<html:text property="commissionFeesAmount" value="<%=commissionFeesAmount %>" ></html:text>
							<html:errors property="commissionFeesAmount" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.handling.fees" /></span><span id="handlingFeesMandatoryID" ></span></td>
							<td><%=currencyCode%>&nbsp;<html:text property="handlingFeesAmount" value="<%=handlingFeesAmount %>" ></html:text> <html:errors
								property="handlingFeesAmount" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.subsidy.amount" /></span></td>
							<td><%=currencyCode%>&nbsp;<html:text property="subsidyAmount" value="<%=subsidyAmount %>"></html:text> <html:errors
								property="subsidyAmount" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.others.fee" /></span></td>
							<td><%=currencyCode%>&nbsp;<html:text property="othersFeeAmount" value="<%=othersFeeAmount %>"></html:text> <html:errors
								property="othersFeeAmount" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.commission.rate" /></span></td>
							<td><html:text property="commissionRate" styleId="commissionRateID" onchange="setComBasisMandatory()" ></html:text> <html:errors
								property="commissionRate" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.commission.basis" /></span>
								<span id="comBasisMandatoryID" ><bean:message key="label.mandatory" /></span></td>
							<td><html:select property="commissionBasisEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.COMMISSION_BASIS%>" />
							</html:select> <html:errors property="commissionBasisEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.maximum.commission" /></span></td>
							<td><%=currencyCode%>&nbsp;<html:text property="maximumCommissionAmount" value="<%=maximumCommissionAmount %>"></html:text>
							<html:errors property="maximumCommissionAmount" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.minimum.commission" /></span></td>
							<td><%=currencyCode%>&nbsp;<html:text property="minimumCommissionAmount" value="<%=minimumCommissionAmount %>"></html:text>
							<html:errors property="minimumCommissionAmount" /></td>
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
								object="<%=facilityMasterObj != null ? facilityMasterObj.getLimit().getLimitExpiryDate() : null %>"></integro:date></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.fac.commitment.rate" /></span></td>
							<td><html:text property="facilityCommitmentRate"></html:text>
							<html:errors property="facilityCommitmentRate" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.fac.commitment.rate.no" /></span></td>
							<td><html:select
								property="facilityCommitmentRateNumberEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.FAC_RATE%>" />
							</html:select></td>
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
								if (facilityMasterObj != null && facilityMasterObj.getFacilityGeneral().getOriginalAmount() != null) {
							%> <integro:amount
								amount="<%=facilityMasterObj.getFacilityGeneral().getOriginalAmount() %>" decimal="2"></integro:amount>
							<%
								}
							%>&nbsp;
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.main.facility" /></span></td>
							<td><%if(facilityMasterObj != null){%>
                                <integro:boolean-display value="<%=facilityMasterObj.getMainFacility()%>" style="yn" />
                                <%}%>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.main.facility.aa.no" /></span></td>
							<td>
							<html:text property="mainFacilityAaNumber"></html:text>
							<html:errors property="mainFacilityAaNumber" />
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.main.facility.code" /></span></td>
							<td>
							<html:text property="mainFacilityCode"></html:text>
							<html:errors property="mainFacilityCode" />
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.main.facility.seq.no" /></span></td>
							<td>
							<html:text property="mainFacilitySequenceNumber"></html:text>
							<html:errors property="mainFacilitySequenceNumber" />
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.standby.line" /></span></td>
							<td><html:radio property="standbyLine" value="Y"
								styleId="standbyLineYes">
								<label for="standbyLineYes"><bean:message
									key="label.common.yes" /></label>
							</html:radio>&nbsp;<html:radio property="standbyLine" value="N"
								styleId="standbyLineNo">
								<label for="standbyLineNo"><bean:message
									key="label.common.no" /></label>
							</html:radio></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.level" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getLevel()%>" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.amount.utilised" /></span></td>
							<td><integro:amount
								amount="<%=facilityMasterObj != null ? facilityMasterObj.getFacilityGeneral().getUtilisedAmount() : null%>" decimal="2"></integro:amount></td>
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
							    %>
                                <integro:amount
								amount="<%=facilityMasterObj != null ? facilityMasterObj.getLimit().getOutstandingAmount() : null %>" decimal="2"></integro:amount>
                                <%
                                    }
                                %>&nbsp;
                            </td>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
<%-- 
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.payment.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityPayment().getPaymentCodeEntryCode() %>" />
							<%
								}
							%>
							</td> --%>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.payment.frequency" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null) {
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
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityPayment().getInterestPaymentFrequencyEntryCode() %>" />
							<%
								}
							%>
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.int.payment.freq.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null) {
							%>  <integro:common-code
								categoryCode="<%=ICMSUIConstant.FREQ_TYPE%>"
								entryCode="<%=facilityMasterObj.getFacilityPayment().getInterestPaymentFrequencyCodeEntryCode()%>"
								display="true" />
							<%
								}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.grace.period" /></span></td>
							<td>
							<html:text property="gracePeriodEntryCode" disabled="true"></html:text>
<%--
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityPayment().getGracePeriodEntryCode() %>" />
							<%
								}
							%>
--%>
							<html:errors property="gracePeriodEntryCode" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.grace.code" /></span></td>
							<td>
							<html:select property="gracePeriodCodeEntryCode" disabled="true">
								<integro:common-code categoryCode="28" descWithCode="true" />
							</html:select>
<%--
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityPayment().getGracePeriodCodeEntryCode() %>" />
							<%
								}
							%>
--%>
							<html:errors property="gracePeriodCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.revolving.non.revolving" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:radio property="revolvingIndicator" value="N"
								styleId="revolvingIndicatorNo" onclick="setRevolOnCriterialInd()">
								<label for="revolvingIndicatorNo"><bean:message
									key="label.facility.non.revolving" /></label>
							</html:radio>&nbsp;<html:radio property="revolvingIndicator" value="R"
								styleId="revolvingIndicatorYes" onclick="setRevolOnCriterialInd()">
								<label for="revolvingIndicatorYes"><bean:message
									key="label.facility.revolving" /></label>
							</html:radio> <html:errors property="revolvingIndicator" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.rev.on.os.bal.or.orgamt" /></span>
                                <span id="revolOnCriterialIndID" ><bean:message key="label.mandatory" /></span></td>
							<td><html:select property="revolvingOnCriteriaIndicator">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.REVOLVE_OS_BAL%>" />
							</html:select>
                            <html:errors property="revolvingOnCriteriaIndicator" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.floor.pledged.limit" /></span></td>
							<td>
							<%=currencyCode%>&nbsp;<html:text property="floorPledgedLimitAmount" value="<%=floorPledgedLimitAmount %>" ></html:text>
							<html:errors property="floorPledgedLimitAmount" />
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.actual.pledged.limit" /></span></td>
							<td><integro:amount
								amount="<%=facilityMasterObj != null ? facilityMasterObj.getActualPledgedLimitAmount() : null %>" decimal="2" ></integro:amount></td>
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
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.retention.sum" /></span></td>
							<td><%=currencyCode%>&nbsp;<html:text property="retentionSumAmount" value="<%=retentionSumAmount %>"></html:text> <html:errors
								property="retentionSumAmount" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.retention.period" /></span></td>
							<td><html:text property="retentionPeriod"></html:text> <html:errors
								property="retentionPeriod" /></td>
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
								value="<%=facilityMasterObj.getDisbursementManner() %>" /> <%
 	}
 %>
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.cal.1st.instl.date" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getCalFirstInstlDate()%>"/>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.iso.referral.no" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getIsoReferralNumber() %>" /> <%
 	}
 %>
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.allow.incentive" /></span></td>
							<td><html:radio property="allowIncentive" value="Y"
								styleId="allowIncentiveYes">
								<label for="allowIncentiveYes"><bean:message
									key="label.common.yes" /></label>
							</html:radio>&nbsp;<html:radio property="allowIncentive" value="N"
								styleId="allowIncentiveNo">
								<label for="allowIncentiveNo"><bean:message
									key="label.common.no" /></label>
							</html:radio></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.date.approved.by.cgc/bnm" /></span></td>
							<td>
							<html:text property="cgcBnmApprovedDate"
								styleId="cgcBnmApprovedDate" maxlength="11" size="12" readonly="true"></html:text><img
								src="img/calendara.gif" name="cldr" border="0"
								onClick="return showCalendar('cgcBnmApprovedDate', 'dd/mm/y');" /> <html:errors
								property="cgcBnmApprovedDate" />
							</td>
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
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.effective.cost.of.fund" /></span></td>
							<td><html:radio property="effectiveCostOfFund" value="Y"
								styleId="effectiveCostOfFundYes">
								<label for="effectiveCostOfFundYes"><bean:message
									key="label.common.yes" /></label>
							</html:radio>&nbsp;<html:radio property="effectiveCostOfFund" value="N"
								styleId="effectiveCostOfFundNo">
								<label for="effectiveCostOfFundNo"><bean:message
									key="label.common.no" /></label>
							</html:radio></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.ecof.administration.cost" /></span></td>
							<td><%=currencyCode %>&nbsp;<html:text property="ecofAdministrationCostAmount" value="<%=ecofAdministrationCostAmount %>"></html:text>
							<html:errors property="ecofAdministrationCostAmount" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.ecof.rate" /></span></td>
							<td><html:text property="ecofRate"></html:text> <html:errors
								property="ecofRate" /></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.ecof.variance" /></span></td>
							<td><html:text property="ecofVariance"></html:text> <html:errors
								property="ecofVariance" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.ecof.variance.code" /></span></td>
							<td><html:radio property="ecofVarianceCode" value="-"
								styleId="ecofVarianceCodeNeg">
								<label for="ecofVarianceCodeNeg">-</label>
							</html:radio>&nbsp;<html:radio property="ecofVarianceCode" value="+"
								styleId="ecofVarianceCodeYes">
								<label for="ecofVarianceCodeYes">+</label>
                            </html:radio>&nbsp;<html:radio property="ecofVarianceCode" value=""
								styleId="ecofVarianceCodeNA">
								<label for="ecofVarianceCodeNA"><bean:message
									key="label.common.not.avail" /></label>
							</html:radio> <html:errors property="ecofVarianceCode"/></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.facility.aval.date" /></span></td>
							<td><html:text property="facilityAvailDate"
								styleId="facilityAvailDate1" maxlength="11" size="12"
								readonly="true"></html:text><img src="img/calendara.gif"
								name="cldr" border="0"
								onClick="return showCalendar('facilityAvailDate1', 'dd/mm/y');" /> <html:errors
								property="facilityAvailDate" />
                            </td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.facility.aval.period" /></span></td>
							<td><html:text property="facilityAvailPeriod"></html:text></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.date.instructed" /></span></td>
							<td><integro:date
								object="<%=facilityMasterObj != null ? facilityMasterObj.getDateInstructed() : null%>"></integro:date>
								<html:errors property="dateInstructed"/>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.solicitor.reference" /></span></td>
							<td>
							<%
								if (facilityMasterObj != null) {
							%> <integro:empty-if-null
								value="<%=facilityMasterObj.getSolicitorReference() %>" /> <%
 	}
 %>
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.department.code" /></span><bean:message key="label.mandatory" /></td>
							<td><html:select property="departmentCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.DEPARTMENT%>" />
							</html:select><html:errors property="departmentCodeEntryCode"/></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.refinance.from.bank" /></span></td>
							<td><html:select property="refinanceFromBankEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.REFINANCE_BANK%>" />
							</html:select></td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.solicitor.name" /></span></td>
							<td><html:text property="solicitorName"></html:text></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.lawyer.code" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getLawyerCodeEntryCode()%>"/>-<integro:common-code categoryCode="<%=CategoryCodeConstant.SOLICITOR%>"
								entryCode="<%=facilityMasterObj.getLawyerCodeEntryCode()%>"
								display="true" /><html:errors property="lawyerCode"/>
							</td>
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.par.value.shares" /></span></td>
							<td><integro:empty-if-null value="<%=facilityMasterObj.getParValueShares()%>"/>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>

<script>

function setCancelRejectDateMandatory(){
    var facStatus = document.getElementById("facilityStatusEntryCode").value;
    if ('<%=ICMSConstant.FACILITY_STATUS_CANCELLED%>' == facStatus
        || '<%=ICMSConstant.FACILITY_STATUS_REJECTED%>' == facStatus)
	{
		setVisibility("cancelDateMandatoryID","visible");
		setVisibility("cancelDateMandatoryLabelID","visible");
		setVisibility("cancelCodeMandatoryID","visible");
	}else{
		setVisibility("cancelDateMandatoryID","hidden");
		setVisibility("cancelDateMandatoryLabelID","hidden");
		setVisibility("cancelCodeMandatoryID","hidden");
        document.getElementById("cancelOrRejectDate").value='';
	}
}

function setPrimeReviewMandatory(){
    var primeReviewTerm = document.getElementById("primeReviewTerm").value;
    var primeReviewTermEntry = document.getElementById("primeReviewTermCodeEntryCode").value;
    if ( (primeReviewTerm > 0 && (primeReviewTermEntry == null || primeReviewTermEntry == ""))
         ||
         (primeReviewTermEntry != null && primeReviewTermEntry != "" && primeReviewTerm <= 0)){
        setVisibility("primeReviewTermID","visible");
        setVisibility("primeReviewTermCodeID","visible");
    }else{
        setVisibility("primeReviewTermID","hidden");
        setVisibility("primeReviewTermCodeID","hidden");
    }
}
    setPrimeReviewMandatory();
	setComBasisMandatory();
	//setComRateHandlingMandatory();
    setRevolOnCriterialInd();
    setCancelRejectDateMandatory();

function setSpreadMandatory(){   
    var valueStr = document.getElementById("interestRateTypeEntryCode").value;
	if(valueStr!=null&&valueStr!=''){
		setVisibility("spreadMandatoryID","visible");
		setVisibility("spreadSignMandatoryID","visible");
		}else{
		setVisibility("spreadMandatoryID","hidden");
		setVisibility("spreadSignMandatoryID","hidden");
	}
}

//	setSpreadMandatory();
	
    var defaultRevolveInd = document.getElementById("defaultRevolveInd").value;
    if ('Y' == defaultRevolveInd) {
        document.getElementById("revolvingIndicatorYes").disabled = true;
    }

    <% if (isEnablePendingFields) { %>
    	enablePendingFacilityFields();
    <% } %>

</script>

</body>
</html>

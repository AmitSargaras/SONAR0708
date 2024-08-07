<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.trx.IFacilityTrxValue"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.app.limit.bus.OBFacilityIslamicRentalRenewal" %>

<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.ui.limit.facility.rentalrenewal.FacilityIslamicRentalRenewalForm" %>

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
	IFacilityMaster facilityMasterObj = (IFacilityMaster) session.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();
	
	OBFacilityIslamicRentalRenewal actualObj = null;
	OBFacilityIslamicRentalRenewal stageObj = null;
	FacilityIslamicRentalRenewalForm form = (FacilityIslamicRentalRenewalForm)request.getAttribute("FacilityIslamicRentalRenewalForm");
	
	if (facilityTrxValue != null) {
		if (facilityTrxValue.getFacilityMaster() != null)
			actualObj = facilityTrxValue.getFacilityMaster().getFacilityIslamicRentalRenewal();
		
		if (facilityTrxValue.getStagingFacilityMaster() != null)
			stageObj = facilityTrxValue.getStagingFacilityMaster().getFacilityIslamicRentalRenewal();
	} else {
		stageObj = facilityMasterObj.getFacilityIslamicRentalRenewal();
	}
	
	String[] style = { "even", "odd" };
	int count = 0;
	
	String styleRenewalTerm = "fieldname";
	String styleRenewalRate = "fieldname";
	String stylePrimeRateNumber = "fieldname";
	String stylePrimeVariance = "fieldname";
	String stylePrimeVarianceCode = "fieldname";
	
	if (isProcessHere && stageObj != null) {
		if (!CompareOBUtil.compOB(actualObj, stageObj, "renewalTerm") ||
				!CompareOBUtil.compOB(actualObj, stageObj, "renewalTermCodeEntryCode")) {
			styleRenewalTerm = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "renewalRate")) {
			styleRenewalRate = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "primeRateNumberEntryCode")) {
			stylePrimeRateNumber = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "primeVariance")) {
			stylePrimeVariance = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "primeVarianceCode")) {
			stylePrimeVarianceCode = "fieldnamediff";
		}
	}	
%>

<html:form action="FacilityIslamicRentalRenewal.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.islamic.rental.renewal" /></h3>
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
							 <td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td colspan="2">
					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						class="tblInput">
						<tr class="<%=style[count++%2] %>">
							<td width="20%" class="<%=styleRenewalTerm %>"><span class="stp"><bean:message
									key="label.facility.renewal.term" /></span>
							</td>
							<td width="30%">
								<bean:write name="FacilityIslamicRentalRenewalForm" property="renewalTerm"/>
								&nbsp;
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.PRIME_REVIEW_TERM_CODE%>"
									entryCode="<%=form.getRenewalTermCode()%>"
									display="true" />
							</td>
							<td width="20%" class="<%= styleRenewalRate %>"><span class="stp"><bean:message
									key="label.facility.renewal.rate" /></span><bean:message key="label.mandatory" />
							</td>
							<td width="30%">
								<bean:write name="FacilityIslamicRentalRenewalForm" property="renewalRate"/>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=stylePrimeRateNumber %>"><span class="stp">
								<bean:message key="label.facility.prime.rate.number" /></span>
								<bean:message key="label.mandatory" />
							</td>
							<td>
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.FAC_RATE%>"
									entryCode="<%=form.getPrimeRateNumber()%>"
									display="true"/>			
							</td>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=stylePrimeVariance %>">
								<span class="stp"><bean:message key="label.facility.prime.variance" /></span>
							</td>
							<td>
								<bean:write name="FacilityIslamicRentalRenewalForm" property="primeVariance"/>
							</td>
							<td class="<%=stylePrimeVarianceCode %>">
								<span class="stp"><bean:message key="label.facility.prime.variance.code" /></span>
							</td>
							<td>
								<bean:write name="FacilityIslamicRentalRenewalForm" property="primeVarianceCode"/>								
							</td>
						</tr>
					</table>				
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
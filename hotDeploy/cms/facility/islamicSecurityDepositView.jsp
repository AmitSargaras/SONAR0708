<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.app.limit.trx.IFacilityTrxValue"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.app.limit.bus.OBFacilityIslamicSecurityDeposit" %>

<%@page import=" com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.ui.limit.facility.securitydeposit.FacilityIslamicSecDepositForm" %>

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
	
	OBFacilityIslamicSecurityDeposit actualObj = null;
	OBFacilityIslamicSecurityDeposit stageObj = null;
	FacilityIslamicSecDepositForm form = (FacilityIslamicSecDepositForm)request.getAttribute("FacilityIslamicSecDepositForm");
	
	if (facilityTrxValue != null) {
		if (facilityTrxValue.getFacilityMaster() != null)
			actualObj = facilityTrxValue.getFacilityMaster().getFacilityIslamicSecurityDeposit();
		
		if (facilityTrxValue.getStagingFacilityMaster() != null)
			stageObj = facilityTrxValue.getStagingFacilityMaster().getFacilityIslamicSecurityDeposit();
	} else {
		stageObj = facilityMasterObj.getFacilityIslamicSecurityDeposit();
	}
	
	String[] style = { "even", "odd" };
	int count = 0;	
	
	String styleNumberOfMonth = "fieldname";
	String styleSecurityDeposit = "fieldname";
	String styleFixSecDepositAmt = "fieldname";
	String styleOriginSecDepositAmt = "fieldname";
	String styleRecalSdUponReview = "fieldname";
	String styleMthB4PrintRenewalRpt = "fieldname";
	String styleRemarks = "fieldname";
	if (isProcessHere && stageObj != null) {
		if (!CompareOBUtil.compOB(actualObj, stageObj, "numberOfMonth")) {
			styleNumberOfMonth = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "securityDeposit")) {
			styleSecurityDeposit = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "fixSecurityDepositAmount")) {
			styleFixSecDepositAmt = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "originalSecurityDepositAmount")) {
			styleOriginSecDepositAmt = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "isRecalculateUponReview")) {
			styleRecalSdUponReview = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "monthBeforePrintRenewalReport")) {
			styleMthB4PrintRenewalRpt = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(actualObj, stageObj, "remarks")) {
			styleRemarks = "fieldnamediff";
		}		
	}
%>

<html:form action="FacilityIslamicSecurityDeposit.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.islamic.security.deposit" /></h3>
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
							<td class="<%=styleNumberOfMonth %>" width="20%"><span class="stp"><bean:message
									key="label.facility.number.months" /></span>
							</td>
							<td width="30%">
								<bean:write name="FacilityIslamicSecDepositForm" property="numberOfMonth"/>	&nbsp;				
							</td>
							<td class="<%=styleSecurityDeposit %>" width="20%"><span class="stp"><bean:message
									key="label.facility.islamic.security.deposit" /></span>
							</td>
							<td width="30%">
								<bean:write name="FacilityIslamicSecDepositForm" property="securityDeposit"/> %
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleFixSecDepositAmt %>"><span class="stp"><bean:message
									key="label.facility.fix.sec.deposit.amt" /></span>
							</td>
							<td>
								<bean:write name="FacilityIslamicSecDepositForm" property="fixedSecDepositAmt"/> &nbsp;
							</td>	
							<td class="<%=styleOriginSecDepositAmt %>"><span class="stp"><bean:message
									key="label.facility.original.sec.deposit.amt" /></span>
							</td>
							<td>
								<bean:write name="FacilityIslamicSecDepositForm" property="originalSecDepositAmt"/> &nbsp;
							</td>													
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleRecalSdUponReview %>"><span class="stp"><bean:message
									key="label.facility.recal.sd.upon.review" /></span>
							</td>
							<td>
								<integro:yesno-display value="<%=form.getRecallSDUponRenewalInd() %>"/>
							</td>	
							<td class="<%=styleMthB4PrintRenewalRpt %>"><span class="stp"><bean:message
									key="label.facility.mth.b4.print.renewal.rpt" /></span>
							</td>
							<td>
								<bean:write name="FacilityIslamicSecDepositForm" property="mthB4PrintRenewalRpt"/> &nbsp;
							</td>													
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleRemarks %>"><span class="stp"><bean:message
									key="label.remarks" /></span>
							</td>
							<td>
								<bean:write name="FacilityIslamicSecDepositForm" property="remark"/> &nbsp;
							</td>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>					
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>
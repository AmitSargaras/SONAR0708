
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

<%@page import="com.integrosys.cms.app.limit.bus.IFacilityBnmCodes"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
</head>
<%
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
		+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
	
	String isProcess = request.getParameter("isProcess");
	boolean isProcessHere = false;
	if(isProcess!=null&&isProcess.equals("true")){
		isProcessHere = true ; 
	}


	IFacilityTrxValue facilityTrxValue = (IFacilityTrxValue) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityTrxValue");
	IFacilityBnmCodes facilityBNMCodesStaging = null;
	IFacilityBnmCodes facilityBNMCodesActual = null;
	IFacilityMaster facilityMasterObj = null;
	if (facilityTrxValue != null) {
		if (facilityTrxValue.getStagingFacilityMaster() != null) {
			facilityBNMCodesStaging = facilityTrxValue.getStagingFacilityMaster().getFacilityBnmCodes();
		}
		if (facilityTrxValue.getFacilityMaster() != null) {
			facilityBNMCodesActual = facilityTrxValue.getFacilityMaster().getFacilityBnmCodes();
		}
		facilityMasterObj = facilityTrxValue.getStagingFacilityMaster();
	}
	else {
		facilityBNMCodesStaging = ((IFacilityMaster) session
				.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj"))
				.getFacilityBnmCodes();
		facilityMasterObj = (IFacilityMaster) session
				.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	}
	
	IFacilityBnmCodes bnm = facilityMasterObj.getFacilityBnmCodes();
	
	ILimit limit = facilityMasterObj.getLimit();
	String[] style = { "even", "odd" };
	int count = 0;
	String styleBNMIndustryCode = "fieldname";
	String styleBNMSectorCode = "fieldname";
	String styleBNMStateCode = "fieldname";
	String styleBNMBumNRCCCode = "fieldname";
	String styleBNMSmallScaleCode = "fieldname";
	String styleBNMPrescribedRateCode = "fieldname";
	String styleBNMRelationshipCode = "fieldname";
	String styleBNMGoodsFinancedCd1 = "fieldname";
	String styleBNMGoodsFinancedCd2 = "fieldname";
	String styleBNMExemptedCode = "fieldname";
	String styleBNMTierSequenceNo = "fieldname";
	String styleExmptedCode = "fieldname";
	String styleBNMPurposeCode = "fieldname";
	if (facilityBNMCodesActual != null&&isProcessHere) {
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging, "industryCodeEntryCode")) {
			styleBNMIndustryCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging, "sectorCodeEntryCode")) {
			styleBNMSectorCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging, "stateCodeEntryCode")) {
			styleBNMStateCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging, "bumiOrNrccCodeEntryCode")) {
			styleBNMBumNRCCCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging,
				"smallScaleCodeCodeEntryCode")) {
			styleBNMSmallScaleCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging,
				"prescribedRateCodeEntryCode")) {
			styleBNMPrescribedRateCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging, "relationshipCodeEntryCode")) {
			styleBNMRelationshipCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging,
				"goodsFinancedCodeOneEntryCode")) {
			styleBNMGoodsFinancedCd1 = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging,
				"goodsFinancedCodeTwoEntryCode")) {
			styleBNMGoodsFinancedCd2 = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging, "exemptedCodeEntryCode")) {
			styleBNMExemptedCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging, "bnmTierSeqEntryCode")) {
			styleBNMTierSequenceNo = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging, "exemptedCodeIndicator")) {
			styleExmptedCode = "fieldnamediff";
		}
		if (!CompareOBUtil.compOB(facilityBNMCodesActual, facilityBNMCodesStaging, "purposeCodeEntryCode")) {
			styleBNMPurposeCode = "fieldnamediff";
		}
	}
%>
<body>
<html:form action="FacilityBNMCodes.do">
	<html:hidden property="event" />
	<input type="hidden" name="nextTab">
	<table width="97%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td width="70%">
				<h3><bean:message key="label.facility.bnm.codes" /></h3>
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
							<td colspan="9" style="text-align: left"><bean:message
								key="label.facility.-.bnm.codes" /></td>

						</tr>
					</thead>
					<tbody>
						<tr class="<%=style[count++%2] %>">
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.aa.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td width="30%"><%=limitProfile.getBCAReference()%>&nbsp;</td>
							<td width="20%" class="fieldname"><span class="stp"><bean:message
								key="label.facility.code" /></span><bean:message key="label.mandatory" /></td>
							<td width="30%"><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" />&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.sequence.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=limit.getFacilitySequence()%>&nbsp;</td>
							<td class="<%=styleBNMIndustryCode %>"><span class="stp"><bean:message
								key="label.facility.bnm.industry.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getIndustryCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes().getIndustryCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_INDUSTRY%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getIndustryCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleBNMSectorCode %>"><span class="stp"><bean:message
								key="label.facility.bnm.sector.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getSectorCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes().getSectorCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.CUSTOMER_TYPE%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getSectorCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleBNMStateCode %>"><span class="stp"><bean:message
								key="label.facility.bnm.state.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getStateCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes().getStateCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_STATE%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getStateCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleBNMBumNRCCCode %>"><span class="stp"><bean:message
								key="label.facility.bnm.bumi/nrcc.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getBumiOrNrccCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes().getBumiOrNrccCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_BUMI_NRCC%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getBumiOrNrccCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleBNMSmallScaleCode %>"><span class="stp"><bean:message
								key="label.facility.bnm.small.scale.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getSmallScaleCodeCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes()
													.getSmallScaleCodeCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_SML_SCALE%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getSmallScaleCodeCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleBNMPrescribedRateCode %>"><span
								class="stp"><bean:message
								key="label.facility.bnm.prescribed.rate.code" /></span></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getPrescribedRateCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes()
													.getPrescribedRateCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_PRSCB_RT%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getPrescribedRateCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleBNMRelationshipCode %>"><span class="stp"><bean:message
								key="label.facility.bnm.relationship.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getRelationshipCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes()
													.getRelationshipCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_RELSHIP%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getRelationshipCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleBNMGoodsFinancedCd1 %>"><span class="stp"><bean:message
								key="label.facility.bnm.goods.financed.cd1" /></span></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getGoodsFinancedCodeOneEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes()
													.getGoodsFinancedCodeOneEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_GOOD_FINANCE_1%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getGoodsFinancedCodeOneEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleBNMGoodsFinancedCd2 %>"><span class="stp"><bean:message
								key="label.facility.bnm.goods.financed.cd2" /></span></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getGoodsFinancedCodeTwoEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes()
													.getGoodsFinancedCodeTwoEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_GOOD_FINANCE_2%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getGoodsFinancedCodeTwoEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleBNMExemptedCode %>"><span class="stp"><bean:message
								key="label.facility.bnm.exempted.code" /></span>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getExemptedCodeIndicator() != null&&
										facilityMasterObj.getFacilityBnmCodes().getExemptedCodeIndicator().charValue()=='Y') {
							%>
								<bean:message key="label.mandatory" />
							<%
								}
							%>
							</td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getExemptedCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes().getExemptedCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_EXMPT_CODE%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getExemptedCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
							<td class="<%=styleBNMTierSequenceNo %>"><span class="stp"><bean:message
								key="label.facility.bnm.tier.sequence.no" /></span></td>
							<td>
							<% if (facilityMasterObj.getFacilityBnmCodes() != null) { %>
								<integro:empty-if-null
								value="<%=facilityMasterObj.getFacilityBnmCodes().getHostTierSequenceNumber() %>" />
							<% } %>
							&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="<%=styleExmptedCode %>"><span class="stp"><bean:message
								key="label.facility.exempted.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getExemptedCodeIndicator() != null) {
							%> <integro:yesno-display
								value="<%=facilityMasterObj.getFacilityBnmCodes().getExemptedCodeIndicator().charValue()%>" />
							<%
								}
							%>&nbsp;
							</td>
							<td class="<%=styleBNMPurposeCode %>"><span class="stp"><bean:message
								key="label.facility.bnm.purpose.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td>
							<%
								if (facilityMasterObj.getFacilityBnmCodes() != null &&
									facilityMasterObj.getFacilityBnmCodes().getPurposeCodeEntryCode() != null
											&& StringUtils.isNotBlank(facilityMasterObj.getFacilityBnmCodes().getPurposeCodeEntryCode())) {
							%> <integro:common-code
								categoryCode="<%=CategoryCodeConstant.BNM_PURPOSE%>"
								entryCode="<%=facilityMasterObj.getFacilityBnmCodes().getPurposeCodeEntryCode()%>"
								display="true" />
							<%
							 	}
							%>&nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.basel.sa.finalised"/></span>
							</td>
							<td>
								<integro:common-code categoryCode="<%=bnm.getBaselSAFinalisedCategoryCode() %>"
									entryCode="<%=bnm.getBaselSAFinalisedEntryCode() %>" display="true"/> &nbsp;
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.basel.irb.concept"/></span>
							</td>
							<td>
								<integro:common-code categoryCode="<%=bnm.getBaselIRBCategoryCode() %>"
									entryCode="<%=bnm.getBaselIRBEntryCode() %>" display="true"/> &nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.basel.sa.concept"/></span>
							</td>
							<td>
								<integro:common-code categoryCode="<%=bnm.getBaselSAConceptCategoryCode() %>"
									entryCode="<%=bnm.getBaselSAConceptEntryCode() %>" display="true"/> &nbsp;
							</td>
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
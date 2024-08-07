
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimit"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityMaster"%>
<%@page import="com.integrosys.cms.ui.common.constant.IGlobalConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitProfile"%>
<%@page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@page import="com.integrosys.cms.app.limit.bus.IFacilityBnmCodes" %>

<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>

<script language="JavaScript" type="text/JavaScript">
function setVisibility(elementID,visibility){
  	document.getElementById(elementID).style.visibility = visibility;
} 

</script>
</head>
<%
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();
	IFacilityBnmCodes bnm = facilityMasterObj.getFacilityBnmCodes();
	
	String[] style = { "even", "odd" };
	int count = 0;
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
							<td  class="fieldname"><span class="stp"><bean:message
								key="label.facility.aa.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td><%=limitProfile.getBCAReference()%></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname" ><span class="stp"><bean:message
								key="label.facility.code" /></span><bean:message key="label.mandatory" /></td>
							<td ><integro:empty-if-null
								value="<%=limit.getFacilityCode() %>" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.sequence.no" /></span><bean:message
								key="label.mandatory" /></td>
							<td colspan="3"><%=limit.getFacilitySequence()%></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.relationship.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td ><html:select property="relationshipCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_RELSHIP%>" />
							</html:select><html:errors property="relationshipCodeEntryCode" /></td>
						</tr>						
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.sector.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td ><html:select property="sectorCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.CUSTOMER_TYPE%>" descWithCode="true" source="<%=limit.getSourceId() %>" />
							</html:select><html:errors property="sectorCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.state.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td ><html:select property="stateCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_STATE%>" />
							</html:select><html:errors property="stateCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.bumi/nrcc.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td ><html:select property="bumiOrNrccCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_BUMI_NRCC%>" />
							</html:select><html:errors property="bumiOrNrccCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.small.scale.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td ><html:select property="smallScaleCodeCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_SML_SCALE%>" />
							</html:select><html:errors property="smallScaleCodeCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.goods.financed.cd1" /></span></td>
							<td ><html:select property="goodsFinancedCodeOneEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_GOOD_FINANCE_1%>" />
							</html:select><html:errors property="goodsFinancedCodeOneEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.goods.financed.cd2" /></span></td>
							<td ><html:select property="goodsFinancedCodeTwoEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_GOOD_FINANCE_2%>" />
							</html:select><html:errors property="goodsFinancedCodeTwoEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.exempted.code" /></span><span id="exemptedEntryCodeMandatory"><bean:message
								key="label.mandatory"  /></span></td>
							<td ><html:select property="exemptedCodeEntryCode" >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_EXMPT_CODE%>" descWithCode="true" />
							</html:select><html:errors property="exemptedCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.tier.sequence.no" /></span></td>
							<td >
							<integro:empty-if-null value="<%=facilityMasterObj.getFacilityBnmCodes().getHostTierSequenceNumber() %>"/>
							<html:errors property="hostTierSequenceNumber" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.exempted.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td ><html:radio property="exemptedCodeIndicator" value="Y"
								styleId="exemptedCodeYes" onclick="setVisibility('exemptedEntryCodeMandatory','visible')" >
								<label for="exemptedCodeYes"><bean:message
									key="label.common.yes" /></label>
							</html:radio>&nbsp;<html:radio property="exemptedCodeIndicator" value="N"
								styleId="exemptedCodeNo" onclick="setVisibility('exemptedEntryCodeMandatory','hidden')" >
								<label for="exemptedCodeNo"><bean:message
									key="label.common.no" /></label>
							</html:radio><html:errors property="exemptedCodeIndicator" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.purpose.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="purposeCodeEntryCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_PURPOSE%>" descWithCode="true" />
							</html:select><html:errors property="purposeCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.prescribed.rate.code" /></span></td>
							<td><html:select property="prescribedRateCodeEntryCode"   >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_PRSCB_RT%>" />
							</html:select><html:errors property="prescribedRateCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.bnm.industry.code" /></span><bean:message
								key="label.mandatory" /></td>
							<td><html:select property="industryCodeEntryCode"  >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.BNM_INDUSTRY%>" descWithCode="true" />
							</html:select><html:errors property="industryCodeEntryCode" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.basel.sa.finalised"/></span>
							</td>
							<td>
								<integro:common-code categoryCode="<%=bnm.getBaselSAFinalisedCategoryCode() %>"
									entryCode="<%=bnm.getBaselSAFinalisedEntryCode() %>" display="true"/> &nbsp;
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
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
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</html:form>

<script> 
	  if (document.forms[0].exemptedCodeIndicator[0].checked){
	     setVisibility('exemptedEntryCodeMandatory','visible');
	  }else{
		  setVisibility('exemptedEntryCodeMandatory','hidden');
		  }
</script>
</body>
</html>


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


<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>

<script language="JavaScript" type="text/JavaScript">
function setVisibility(elementID,visibility){
  	document.getElementById(elementID).style.visibility = visibility;
} 

function setRefundFullRelProMandatory(){
	var valueStr = document.getElementById("fulrelProfitCalMethod").value;
	if(valueStr=='F'){
		setVisibility("refundFullRelProMandatoryID","visible");
	}else{
		setVisibility("refundFullRelProMandatoryID","hidden");
	}
}

</script>
</head>
<%
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();
	String[] style = { "even", "odd" };
	int count = 0;
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
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.islamic.cust.prof.rate" /></span><bean:message key="label.mandatory" /></td>
							<td><html:text property="custProfRate" />
								<html:errors property="custProfRate" /></td>
							 <td class="fieldname"><span class="stp"><bean:message
								key="label.facility.islamic.rebate.method" /></span><bean:message key="label.mandatory" /></td>
							<td><html:select property="rebateMethod">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.REBATE_METHOD%>" />
								</html:select><html:errors property="rebateMethod" /></td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.payment.mode" /></span><bean:message key="label.mandatory" /></td>
							<td><html:select property="gppPaymentMode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.GPP_PAYMENT_MODE%>" />
								</html:select><html:errors property="gppPaymentMode" />
							</td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.calculation.method" /></span><bean:message key="label.mandatory" /></td>
							<td><html:select property="gppCalculationMethod">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.GPP_CALCULATION_METHOD%>" />
								</html:select><html:errors property="gppCalculationMethod" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.term" /></span><bean:message key="label.mandatory" /></td>
							<td><html:text property="gppTerm" />
								<html:errors property="gppTerm" />
							</td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.gpp.code" /></span><bean:message key="label.mandatory" /></td>
							<td><html:select property="gppTermCode">
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.PRIME_REVIEW_TERM_CODE%>" />
								</html:select><html:errors property="gppTermCode" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facilitu.islamic.bba.full.release.profit" /></span><bean:message key="label.mandatory" /></td>
							<td><html:radio property="fullReleaseProfit" value="Y"
								styleId="standbyLineYes">
								<label for="standbyLineYes"><bean:message
									key="label.common.yes" /></label>
							</html:radio>&nbsp;<html:radio property="fullReleaseProfit" value="N"
								styleId="standbyLineNo">
								<label for="standbyLineNo"><bean:message
									key="label.common.no" /></label>
							</html:radio></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.refund.fulrel.profit" /></span>
							<span id="refundFullRelProMandatoryID" ><bean:message key="label.mandatory" /></span></td>
							<td><html:select property="refundFullReleaseProfit" >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.REFUND_FULREL_PROFIT%>" />
								</html:select>
							    <html:errors property="refundFullReleaseProfit" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.fulrel.profit.calc.method" /></span><bean:message key="label.mandatory" /></td>
							<td><html:select property="fulrelProfitCalMethod" onchange="setRefundFullRelProMandatory()" >
								<integro:common-code
									categoryCode="<%=CategoryCodeConstant.FULREL_PROFIT_CALC_METHOD%>" />
								</html:select><html:errors property="fulrelProfitCalMethod" /></td>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>	
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.installment.amount" /></span></td>
							<td>MYR<html:text property="installment" />
							    <html:errors property="installment" /></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.final.payment.amount" /></span><bean:message key="label.mandatory" /></td>
							<td><html:text property="finalPaymentAmount" />
							    <html:errors property="finalPaymentAmount" /></td>							
						</tr>
						<tr class="<%=style[count++%2] %>">
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.selling.price" /></span></td>
							<td><integro:amount amount="<%=facilityMasterObj.getFacilityIslamicBbaVariPackage().getSellingPrice() %>"/></td>
							 <td class="fieldname"><span class="stp"><bean:message key="label.facility.islamic.total.gpp.amount" /></span></td>
							<td><integro:amount amount="<%=facilityMasterObj.getFacilityIslamicBbaVariPackage().getTotalGppAmount() %>"/></td>							
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
<script>
	setRefundFullRelProMandatory();
</script>
</body>
</html>
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

<script language="JavaScript" src="js/defaultImageFunction.js"></script>
<script language="JavaScript" src="js/helperFunctions.js"></script>
<%
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();

	String[] style = { "even", "odd" };
	int count = 0;
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
							<td width="20%" class="fieldname"><span class="stp"><bean:message
									key="label.facility.renewal.term" /></span>
							</td>
							<td width="30%">
								<html:text property="renewalTerm"/>
								<html:errors property="renewalTerm"/> 
								&nbsp;
								<html:select property="renewalTermCode">
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.PRIME_REVIEW_TERM_CODE%>"/>
								</html:select>
								<html:errors property="renewalTermCode" />							
							</td>
							<td width="20%" class="fieldname"><span class="stp"><bean:message
									key="label.facility.renewal.rate" /></span><bean:message key="label.mandatory" />
							</td>
							<td width="30%">
								<html:text property="renewalRate"/>
								<html:errors property="renewalRate"/>
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp">
								<bean:message key="label.facility.prime.rate.number" /></span>
								<bean:message key="label.mandatory" />
							</td>
							<td>
								<html:select property="primeRateNumber">
									<integro:common-code
										categoryCode="<%=CategoryCodeConstant.FAC_RATE%>"/>
								</html:select>		
								<html:errors property="primeRateNumber"/>					
							</td>
							<td class="fieldname">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.prime.variance" /></span>
							</td>
							<td>
								<html:text property="primeVariance"/>
								<html:errors property="primeVariance"/>							
							</td>
							<td class="fieldname">
								<span class="stp"><bean:message key="label.facility.prime.variance.code" /></span>
							</td>
							<td>
								<html:radio property="primeVarianceCode" value="-">-</html:radio>&nbsp;
								<html:radio property="primeVarianceCode" value="+">+</html:radio>
								<html:errors property="primeVarianceCode"/>								
							</td>
						</tr>
					</table>				
				</td>
			</tr>
		</tbody>
	</table>	
</html:form>

<script language="JavaScript" type="text/JavaScript">
	disableAllFormElements();
</script>

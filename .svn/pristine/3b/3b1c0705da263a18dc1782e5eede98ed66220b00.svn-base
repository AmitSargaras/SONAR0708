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
<%@page import=" com.integrosys.cms.app.common.constant.ICMSConstant"%>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>

<%
	ILimitProfile limitProfile = (ILimitProfile) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "."
			+ IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);

	IFacilityMaster facilityMasterObj = (IFacilityMaster) session
			.getAttribute("com.integrosys.cms.ui.limit.facility.main.FacilityMainAction.facilityMasterObj");
	ILimit limit = facilityMasterObj.getLimit();

	String[] style = { "even", "odd" };
	int count = 0;
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
							<td class="fieldname" width="20%"><span class="stp"><bean:message
									key="label.facility.number.months" /></span>
							</td>
							<td width="30%">
								<html:text property="numberOfMonth"/>
								<html:errors property="numberOfMonth"/> 							
							</td>
							<td class="fieldname" width="20%"><span class="stp"><bean:message
									key="label.facility.islamic.security.deposit" /></span>
							</td>
							<td width="30%">
								<html:text property="securityDeposit"/> %
								<html:errors property="securityDeposit"/> 							
							</td>
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
									key="label.facility.fix.sec.deposit.amt" /></span>
							</td>
							<td>
								<html:text property="fixedSecDepositAmt"/>
								<html:errors property="fixedSecDepositAmt"/> 							
							</td>	
							<td class="fieldname"><span class="stp"><bean:message
									key="label.facility.original.sec.deposit.amt" /></span>
							</td>
							<td>
								<html:text property="originalSecDepositAmt"/>
								<html:errors property="originalSecDepositAmt"/> 							
							</td>													
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
									key="label.facility.recal.sd.upon.review" /></span>
							</td>
							<td>
								<html:radio property="recallSDUponRenewalInd" value="<%=ICMSConstant.TRUE_VALUE %>">
									<bean:message key="label.common.yes"/>
								</html:radio>
								<html:radio property="recallSDUponRenewalInd" value="<%=ICMSConstant.FALSE_VALUE %>">
									<bean:message key="label.common.no"/> 
								</html:radio>
								<html:errors property="recallSDUponRenewalInd"/> 							
							</td>	
							<td class="fieldname"><span class="stp"><bean:message
									key="label.facility.mth.b4.print.renewal.rpt" /></span>
							</td>
							<td>
								<html:text property="mthB4PrintRenewalRpt" />
								<html:errors property="mthB4PrintRenewalRpt"/> 							
							</td>													
						</tr>
						<tr class="<%=style[count++%2] %>">
							<td class="fieldname"><span class="stp"><bean:message
									key="label.remarks" /></span>
							</td>
							<td>
								<html:text property="remark" size="50"/>
								<html:errors property="remark"/>
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

<script language="JavaScript" type="text/JavaScript">
	disableAllFormElements();
</script>
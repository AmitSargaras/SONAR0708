<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>

<%
	InsuranceCoverageDtlsForm insuranceCoverageDtlsForm = (InsuranceCoverageDtlsForm) request
	.getAttribute("insuranceCoverageDtlsForm");
	String icId=insuranceCoverageDtlsForm.getInsuranceCoverageId();
	String event = (String) request.getAttribute("event");
	String flag = (String) request.getAttribute("flag");

	pageContext.setAttribute("InsuranceCoverageDtlsObj",
			insuranceCoverageDtlsForm);
	String rmId = insuranceCoverageDtlsForm.getId();
%> 

<%@page import="com.integrosys.cms.ui.insurancecoveragedtls.InsuranceCoverageDtlsForm"%><html>
<head>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>

<script language="JavaScript" type="text/JavaScript">

	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}

	function submitPage(idx) {
		var chk = window.confirm("Are you sure?");
		if(chk==true){
			document.forms[0].action="InsuranceCoverageDtls.do?event=maker_submit_remove&ICId="+idx;
			document.forms[0].submit();
		}	
	}
		
	function addNew() {
	    document.forms[0].action = "InsuranceCoverageDtls.do?event=prepare_create_insurance_coverage_dtls";
	    document.forms[0].submit();
	}

</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<html:form action="InsuranceCoverage.do">
		<input type="hidden"
			name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0" />
		<input type="hidden" name="status"
			value="<%=ICMSConstant.STATE_NOTIFICATION_DELETED%>" />
		<html:hidden  name="insuranceCoverageDtlsForm" property="insuranceCoverageId"/>
		<html:hidden name="insuranceCoverageDtlsForm" property="insuranceCoverageCode" />
		<html:hidden name="insuranceCoverageDtlsForm" property="insuranceType" />
		<html:hidden name="insuranceCoverageDtlsForm" property="insuranceCategoryName" />
		<html:hidden name="insuranceCoverageDtlsForm" property="id" />
		<html:hidden name="insuranceCoverageDtlsForm" property="creationDate" />
		<html:hidden name="insuranceCoverageDtlsForm" property="createdBy" />
		<html:hidden name="insuranceCoverageDtlsForm" property="lastUpdateBy" />
		<html:hidden name="insuranceCoverageDtlsForm" property="lastUpdateDate" />
		<html:hidden name="insuranceCoverageDtlsForm" property="status" />
		<html:hidden name="insuranceCoverageDtlsForm" property="deprecated" />
		<html:hidden name="insuranceCoverageDtlsForm" property="versionTime" />

		<tr>

			<td width="100%" height="100%" valign="bottom">
			<table width="100%" height="100%" border="0" align="center"
				cellpadding="0" cellspacing="0" class="tblFormSection"
				id="contentWindow">
				<tr height="95%">
					<td valign="top">
					<table width="96%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tblFormSection">
						<tr>

							<td width="70%">

							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="99%">
								<tbody>
									<tr>
										<%
											if (event.equals("prepare_maker_submit_remove")) {
										%>
											<td>
												<h3>Insurance Coverage Details:Delete</h3>
											</td>
										<%
											} else {
										%>
											<td>
												<h3>Insurance Coverage Details:View</h3>
											</td>
										<%
											}
										%>
									</tr>
									<tr>
										<td colspan="2">
										<hr />
										<br />
										</td>
										
									</tr>
									
									<tr>
										<td colspan="2">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<tbody>
												<tr class="even">
													<td class="fieldname" width="20%">Insurance Type</td>
													<td width="30%"><%=insuranceCoverageDtlsForm.getInsuranceType()%>&nbsp;
													</td>
													<td class="fieldname" width="20%">Insurance Category Name</td>
													<td width="30%"><%=insuranceCoverageDtlsForm.getInsuranceCategoryName()%>&nbsp;
													</td>
												</tr>
											</tbody>

										</table>
										</td>
									</tr>
							</table>
					</table>

					<table align="center" width="94%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td colspan="0">
							<br />
							<table width="150" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td>&nbsp;</td>
								</tr>
								<%
									if (event.equals("prepare_maker_submit_remove")) {
								%>
								<tr align="center">
									<td width="100" valign="baseline" align="center"><a
										href="#" onMouseOut="MM_swapImgRestore()"
										onMouseOver="MM_swapImage('Image3311','','img/delete2.gif',1)"
										onClick="submitPage('<%=icId%>')"><img
										src="img/delete1.gif" name="Image3311" border="0"
										id="Image3311" /></a></td>
									<td width="100" valign="baseline" align="center"><a
										href="InsuranceCoverage.do?event=view_insurance_coverage_by_index&ICId=<%=icId %>"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
										src="img/cancel1.gif" name="Image4411" border="0"
										id="Image4411" /></a></td>
								</tr>

								<%
									} else {
								%>
								<tr align="center">
									<td width="100" valign="baseline" align="center"><a
										href="InsuranceCoverage.do?event=view_insurance_coverage_by_index&ICId=<%=icId %>"
										onmouseout="MM_swapImgRestore()"
										onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
										src="img/return1.gif" name="Image4411" border="0"
										id="Image4411" /></a></td>
								</tr>
								<%
									}
								%>
							</table>
							</td>
						</tr>
					</table>

					</td>
		</tr>
	</html:form>
</table>
</body>
</html>


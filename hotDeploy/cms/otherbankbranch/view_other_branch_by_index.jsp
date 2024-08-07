<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBranchForm"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.IOtherBranch"%>
<%
	OtherBranchForm otherBranchForm = (OtherBranchForm) request
			.getAttribute("OtherBranchForm");
	String event = (String) request.getAttribute("event");

	pageContext.setAttribute("OtherBranchObj", otherBranchForm);

	String BranchId = otherBranchForm.getId();
	String BankId = otherBranchForm.getOtherBankId();
%> 
<%
String actionStr1 = "com.integrosys.cms.ui.otherbankbranch.OtherBranchAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
<html>
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

	function submitPage (idx) {
		var chk = window.confirm("Are you sure?");
		if(chk==true){
			document.forms[0].action="OtherBranch.do?event=maker_submit_remove_branch&BranchId="+idx;
			document.forms[0].submit();
		}	
	}
		


</script>
</head>
<body>
<table align="center" width="80%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<html:form action="OtherBranch.do">
		<input type="hidden"
			name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0" />
		<input type="hidden" name="status"
			value="<%=ICMSConstant.STATE_NOTIFICATION_DELETED%>" />

		
		

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
							<%
								if (event.equals("prepare_maker_submit_remove_branch")) {
							%>
							<td>
							<h3>Delete Other Branch</h3>
							</td>
							<%
								} else {
							%>
							<td>
							<h3>View Other Branch</h3>
							</td>
							<%
								}
							%>
						</tr>

						<tr>
							<td width="70%">
							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="99%">
								<tbody>
									<tr>
										<td colspan="2">
										<hr />
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<tbody>
												<tr class="even">
													<td class="fieldname">Branch Code</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getOtherBranchCode() %>" /></td>
													<td class="fieldname" width="15%">Branch Name</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getOtherBranchName() %>" /></td>
												</tr>
												<tr class="odd">
													<td class="fieldname">Bank Code</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getOtherBankCode()%>" /></td>
													<td class="fieldname" width="15%">Bank Name</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getOtherBankName() %>" /></td>
												</tr>
												<tr class="odd">
													<td class="fieldname">RBI Code</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getBranchRbiCode()%>" /></td>
													<td class="fieldname" width="15%">&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
												<tr class="even">
													<td class="fieldname" width="15%">Address</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getBranchAddress()%>" /></td>
													<td class="fieldname">City</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getBranchCity()%>" /></td>
												</tr>
												<tr class="odd">
													<td class="fieldname">State</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getBranchState()%>" /></td>
													<td class="fieldname">Region</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getBranchRegion()%>" /></td>
												</tr>
												<tr class="even">
													<td class="fieldname">Country</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getBranchCountry()%>" /></td>
													<td class="fieldname">Telephone No.</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getBranchContactNo()%>" /></td>
												</tr>
												<tr class="odd">
													<td class="fieldname">Bank email ID</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getBranchContactMailId()%>" /></td>
													<td class="fieldname">Fax No.</td>
													<td><integro:empty-if-null
														value="<%=otherBranchForm.getBranchFaxNo()%>" /></td>
												</tr>
												<tr class="even">
													<td class="fieldname">Status</td>
													<td><%= otherBranchForm.getStatus().equalsIgnoreCase("ACTIVE")?"ENABLED":"DISABLED"%></td>
													<td class="fieldname">&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
												
											</tbody>

										</table>
										</td>
									</tr>
							</table>
					</table>
					<table width="150" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<%
							if (event.equals("prepare_maker_submit_remove_branch")) {
						%>
						<tr align="center">
							<td width="100" valign="baseline" align="center"><a href="#"
								onMouseOut="MM_swapImgRestore()"
								onMouseOver="MM_swapImage('Image3311','','img/delete2.gif',1)"
								onClick="submitPage('<%=BranchId%>')"><img
								src="img/delete1.gif" name="Image3311" border="0" id="Image3311" /></a></td>
							<td width="100" valign="baseline" align="center"><a
								href="OtherBank.do?event=view_other_bank_by_index&BankId=<%=BankId%>"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>

							</td>
						</tr>

						<%}else if(event.equals("prepare_maker_submit_remove_branch_delete")){%>
						<tr align="center">
							<td width="100" valign="baseline" align="center"><a href="#"
								onMouseOut="MM_swapImgRestore()"
								onMouseOver="MM_swapImage('Image3311','','img/delete2.gif',1)"
								onClick="submitPage('<%=BranchId%>')"><img
								src="img/delete1.gif" name="Image3311" border="0" id="Image3311" /></a></td>
							<td width="100" valign="baseline" align="center"><a
								href="OtherBank.do?event=prepare_maker_submit_remove&BankId=<%=BankId%>"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>

							</td>
						</tr>
						
							<%} else if(event.equalsIgnoreCase("view_other_branch_by_index_delete")){%>
								
							<tr align="center">
										<td width="100" valign="baseline" align="center"><a
											href="OtherBank.do?event=prepare_maker_submit_remove&BankId=<%=BankId%>"
											onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
											src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
										</td>
									</tr>
							
						<%}else {
								if (!event.equalsIgnoreCase("checker_view_other_branch")) {
									%>
									<tr align="center">
										<td width="100" valign="baseline" align="center"><a
											href="OtherBank.do?event=view_other_bank_by_index&BankId=<%=BankId%>"
											onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
											src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
										</td>
									</tr>
									<%
											}else{
									%>
									<tr align="center">
										<td width="100" valign="baseline" align="center"><a
											href="OtherBank.do?event=checker_view_other_bank&BankId=<%=BankId%>"
											onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
											src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
										</td>
									</tr>
									<%
											}
							}
						%>
					</table>
					</td>
					<html:hidden name="OtherBranchForm" property="otherBranchCode" />
		<html:hidden name="OtherBranchForm" property="otherBranchName" />
		<html:hidden name="OtherBranchForm" property="otherBankId" />
		<html:hidden name="OtherBranchForm" property="otherBankCode" />
		<html:hidden name="OtherBranchForm" property="branchAddress" />
		<html:hidden name="OtherBranchForm" property="branchCity" />
		<html:hidden name="OtherBranchForm" property="branchState" />
		<html:hidden name="OtherBranchForm" property="branchRegion" />
		<html:hidden name="OtherBranchForm" property="branchCountry" />
		<html:hidden name="OtherBranchForm" property="branchContactNo" />
		<html:hidden name="OtherBranchForm" property="branchContactMailId" />
		<html:hidden name="OtherBranchForm" property="id" />
		<html:hidden name="OtherBranchForm" property="createdBy" />
		<html:hidden name="OtherBranchForm" property="creationDate" />
		<html:hidden name="OtherBranchForm" property="lastUpdateBy" />
		<html:hidden name="OtherBranchForm" property="lastUpdateDate" />
		<html:hidden name="OtherBranchForm" property="status" />
		<html:hidden name="OtherBranchForm" property="deprecated" />
		<html:hidden name="OtherBranchForm" property="branchFaxNo" />
		<html:hidden name="OtherBranchForm" property="versionTime" />
		<html:hidden name="OtherBranchForm" property="branchCityId" />
		<html:hidden name="OtherBranchForm" property="branchStateId" />
		<html:hidden name="OtherBranchForm" property="branchRegionId" />
		<html:hidden name="OtherBranchForm" property="branchCountryId" />
				</tr>
			</table>

			</td>
		</tr>
	</html:form>
</table>
</body>
</html>


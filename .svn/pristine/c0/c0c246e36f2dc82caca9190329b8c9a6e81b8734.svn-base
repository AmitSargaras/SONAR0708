<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>

<%
	InsuranceCoverageForm insuranceCoverageForm = (InsuranceCoverageForm) request
			.getAttribute("insuranceCoverageForm");
	SearchResult notificationList = (SearchResult) request.getAttribute("insuranceCoverageDetailsList");
	Collection resultList = null;
	int listSize = 0;
	int sno = 0;
	String ICId = null;
	if (notificationList != null) {
		resultList = notificationList.getResultList();
		listSize = resultList.size();
		pageContext.setAttribute("listSize", Integer.toString(listSize));
		pageContext.setAttribute("insuranceCoverageDetailsList", resultList);
	}	

	String event = (String) request.getAttribute("event");
	String flag = (String) request.getAttribute("flag");

	pageContext.setAttribute("InsuranceCoverageObj",
			insuranceCoverageForm);
	String rmId = insuranceCoverageForm.getId();
%> 

<%@page import="com.integrosys.cms.ui.insurancecoverage.InsuranceCoverageForm"%><html>
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
		var lstSize = document.getElementById("listSize").value;
		if(lstSize!=0){
			alert("Insurance Coverage Details Present. First Delete all Details.");
		}else{
			var chk = window.confirm("Are you sure?");
			if(chk==true){
				document.forms[0].action="InsuranceCoverage.do?event=maker_submit_remove";
				document.forms[0].submit();
			}
		}		
	}
		
	function addNew(idx) {
	    document.forms[0].action = "InsuranceCoverageDtls.do?event=prepare_create_insurance_coverage_dtls&ICId="+idx;
	    document.forms[0].submit();
	}

</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<html:form action="InsuranceCoverage.do">
		<input type="hidden" name="listSize" value="<%=listSize %>"/>
		<html:hidden name="insuranceCoverageForm" property="insuranceCoverageCode" />
		<html:hidden name="insuranceCoverageForm" property="companyName" />
		<html:hidden name="insuranceCoverageForm" property="address" />
		<html:hidden name="insuranceCoverageForm" property="contactNumber" />
		<html:hidden name="insuranceCoverageForm" property="id" />
		<html:hidden name="insuranceCoverageForm" property="createdBy" />
		<html:hidden name="insuranceCoverageForm" property="lastUpdateBy" />
		<html:hidden name="insuranceCoverageForm" property="lastUpdateDate" />
		<html:hidden name="insuranceCoverageForm" property="status" />
		<html:hidden name="insuranceCoverageForm" property="deprecated" />
		<html:hidden name="insuranceCoverageForm" property="versionTime" />

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
													<td class="fieldname" width="20%">Insurance Coverage Code</td>
													<td width="30%"><%=insuranceCoverageForm
										.getInsuranceCoverageCode()%>&nbsp;
													</td>
													<td class="fieldname" width="20%">Company Name</td>
													<td width="30%"><%=insuranceCoverageForm.getCompanyName()%>&nbsp;
													</td>
												</tr>
												<tr class="odd">	
													<td class="fieldname" width="20%">Address</td>
													<td width="30%"><%=insuranceCoverageForm.getAddress()%>&nbsp;
													</td>
													<td class="fieldname">Contact Number</td>
													<td><%=insuranceCoverageForm.getContactNumber()%>&nbsp;</td>
												</tr>
											</tbody>

										</table>
										</td>
									</tr>
							</table>
					</table>

					<table align="center" width="94%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td valign="bottom" align="right"><input type="button"
								name="Submit" value="Add" class="btnNormal" onclick="addNew('<%=rmId%>')" />
								
							</td>

						</tr>
						<tr>
							<td colspan="0">
							<br />
							<table width="100%" border="0" cellpadding="0" cellspacing="0"
								class="tblInfo">
								<thead>
									<tr>
										<td width="5%">S/N</td>
										<td width="10%">Insurance Type</td>
										<td width="15%">Insurance Category Name</td>
										<td width="10%">Action</td>
									</tr>
								</thead>
								<tbody>
									<logic:greaterThan name="listSize" value="0">
										<logic:iterate id="OB" name="insuranceCoverageDetailsList"
											type="com.integrosys.cms.app.insurancecoveragedtls.bus.OBInsuranceCoverageDtls"
											scope="page">
											<%
															String rowClass = "";
																		sno++;
																		if (sno % 2 != 0) {
																			rowClass = "odd";
																		} else {
																			rowClass = "even";
																		}
														%>
														<tr class="<%=rowClass%>">
															<%
															ICId = Long.toString(OB.getId());
															%>
															<td class="index"><%=sno%></td>

															<td><%=OB.getInsuranceType()%></td>

															<td><%=OB.getInsuranceCategoryName()%></td>

															<td><select name="chooseAction"
																onchange="MM_jumpMenu('self',this,0)">
																<option value="#" selected="selected">Please Select</option>

																<option
																	value="InsuranceCoverageDtls.do?event=view_insurance_coverage_dtls_by_index&ICId=<%=ICId%>">View</option>

																<option
																	value="InsuranceCoverageDtls.do?event=prepare_maker_submit_edit&ICId=<%=ICId%>">Edit</option>

																<option
																	value="InsuranceCoverageDtls.do?event=prepare_maker_submit_remove&ICId=<%=ICId%>">Delete</option>

															</select></td>

														</tr>
										</logic:iterate>
									</logic:greaterThan>
									<logic:equal name="listSize" value="0">
										<tr>
											<td colspan="4">Sorry,No Records Found</td>
										</tr>
									</logic:equal>
								</tbody>

							</table>
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
										onClick="submitPage('<%=rmId%>')"><img
										src="img/delete1.gif" name="Image3311" border="0"
										id="Image3311" /></a></td>
									<td width="100" valign="baseline" align="center"><a
										href="InsuranceCoverage.do?event=list_insurance_coverage"
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
										href="InsuranceCoverage.do?event=list_insurance_coverage"
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



<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.*,com.integrosys.cms.ui.holiday.MaintainHolidayForm,com.integrosys.cms.app.holiday.trx.IHolidayTrxValue,com.integrosys.cms.app.holiday.trx.OBHolidayTrxValue"%>
<%
	InsuranceCoverageForm insuranceCoverageForm = (InsuranceCoverageForm) request.getAttribute("insuranceCoverageForm");
	IInsuranceCoverageTrxValue insuranceCoverageTrx = (IInsuranceCoverageTrxValue)session.getAttribute("com.integrosys.cms.ui.insurancecoverage.InsuranceCoverageAction.IInsuranceCoverageTrxValue");
	
	
	SearchResult sr = (SearchResult) request
			.getAttribute("insuranceCoverageList");

	if (sr != null) {
		List holidayList = new ArrayList(sr.getResultList());
		pageContext.setAttribute("insuranceCoverageList",
				holidayList);
	}

	String event = request.getParameter("event");

	int sno = 0;
	int startIndex = 0;
	int counter = 0;
%>



<%@page import="com.integrosys.cms.ui.relationshipmgr.RelationshipMgrForm"%>
<%@page import="com.integrosys.cms.app.relationshipmgr.trx.IRelationshipMgrTrxValue"%>
<%@page import="com.integrosys.cms.ui.insurancecoverage.InsuranceCoverageForm"%>
<%@page import="com.integrosys.cms.app.insurancecoverage.trx.IInsuranceCoverageTrxValue"%><html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
		<!-- InstanceEndEditable -->

		<!-- InstanceBeginEditable name="CssStyle" -->

		<!-- InstanceEndEditable -->
		<!-- InstanceBeginEditable name="head" -->
		<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
function cancelPage(){
	
    document.forms[0].action="ToDo.do?event=totrack";
    
    document.forms[0].submit();
}
function submitPage(event) {
	document.forms[0].action="InsuranceCoverage.do?event=maker_confirm_insert_close";
    document.forms[0].submit();
}

//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='InsuranceCoverage.do?'>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">

				<tbody>
					<tr>
						<td valign="top">
							<table width="70%" border="0" align="center" cellpadding="0"
								cellspacing="0" class="tblFormSection">
								<thead>
									<br>
									<tr>
										<td>
											<h3>
												View Relationship Manager
											</h3>
										</td>
									</tr>
									<tr>
										<td>
											<hr />
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<hr />
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0" class="tblInfo">
												<thead>
													<tr>
														<td width="5%">S/N</td>
														<td width="16%">Insurance Company Code</td>
														<td width="30%">Compnay Name</td>
														<td width="16%">Address</td>
														<td width="30%">Contact Number</td>
													</tr>
												</thead>
												<tbody>
													<logic:present name="insuranceCoverageList">
														<logic:iterate id="ob" name="insuranceCoverageList"
															type="com.integrosys.cms.app.insurancecoverage.bus.OBInsuranceCoverage"
															scope="page">
															<%
																String rowClass = "";
																				sno++;
																				if (sno % 2 != 0) {
																					rowClass = "odd";
																				} else {
																					rowClass = "even";
																				}
																				// boolean isSuperUser = MaintainTeamUtil.isSuperUser(ob.getLoginID());
															%>
															<tr class="<%=rowClass%>">
																<td class="index"><%=sno%></td>
																<td><integro:empty-if-null value="<%=ob.getInsuranceCoverageCode()%>" />&nbsp;
																</td>
																<td><integro:empty-if-null value="<%=ob.getCompanyName()%>" />
																</td>
																<td><integro:empty-if-null value="<%=ob.getAddress()%>" />
																</td>
																<td><%=Long.toString(ob.getContactNumber())%> 
															</td>	
															</tr>
														</logic:iterate>
														<%
															if (sno == 0) {
														%>
														<tr class="odd">
															<td colspan="10">
																<bean:message key="label.global.not.found" />
															</td>
														</tr>
														<%
															}
														%>
													</logic:present>
													<logic:notPresent name="insuranceCoverageList">
														<tr class="odd">
															<td colspan="10">
																<bean:message key="label.global.not.found" />
															</td>
														</tr>
													</logic:notPresent>
												</tbody>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table width="100%" border="0" align="center" cellpadding="0"
												cellspacing="0" class="tblInfo">
												<tbody>
													<tr>
														<td class="fieldname">
															Remarks
														</td>
														<td class="odd">
															<textarea name="remarks" rows="4" style="width: 90%"></textarea>
														</td>
													</tr>
													<tr>
														<td class="fieldname">
															Last Action By
														</td>
														<td class="even"><%=insuranceCoverageTrx.getUserInfo()%>&nbsp;
														</td>
													</tr>
													<tr class="odd">
														<td class="fieldname">
															Last Remarks Made
														</td>
														<td><%=insuranceCoverageTrx.getRemarks() != null ? insuranceCoverageTrx
								.getRemarks()
								: ""%>&nbsp;
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>

								</tbody>
							</table>

							<table width="130" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="65">
										&nbsp;
									</td>
									<td width="65">
										&nbsp;
									</td>
								</tr>
								<tr>


									<td colspan="2">
										<%
											if ((event.equals("maker_draft_close_process"))) {
										%>
										<a href="#" onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)"
											onClick="submitPage('maker_draft_close_process')"> <img
												src="img/close1a.gif" name="Image3311" border="0"
												id="Image3311" /> </a>&nbsp;&nbsp;
										<%
											} else {
										%>
										<a href="#" onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image3311','','img/close2a.gif',1)"
											onClick="submitPage('maker_prepare_close')"> <img
												src="img/close1a.gif" name="Image3311" border="0"
												id="Image3311" /> </a>&nbsp;&nbsp;
										<%
											}
										%>
									</td>
									<td colspan="2">
										<a href="ToDo.do" onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)">
											<img src="img/cancel1.gif" name="Image2" width="70"
												height="20" border="0" id="Image2" /> </a> &nbsp;
									</td>

								</tr>
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
							</table>
							</td>
							</tr>
							</tbody>
							</table>
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>

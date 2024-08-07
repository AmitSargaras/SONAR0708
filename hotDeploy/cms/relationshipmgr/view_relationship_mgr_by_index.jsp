<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection,com.integrosys.cms.app.relationshipmgr.bus.OBLocalCAD,com.integrosys.cms.ui.relationshipmgr.ILocalCAD"%>

<%
	RelationshipMgrForm relationshipMgrForm = (RelationshipMgrForm) request
			.getAttribute("relationshipMgrForm");
	String event = (String) request.getAttribute("event");
	String flag = (String) request.getAttribute("flag");

	pageContext.setAttribute("RelationshipMgrObj", relationshipMgrForm);
	String rmId = relationshipMgrForm.getId();
	
	String Rcode = (String) request.getAttribute("RMCode");
	String Rname = (String) request.getAttribute("RMName");

	int startIndex = 0;
	String ind = (String) request.getAttribute("startIndex");
	if (ind != null && (!ind.equals("")))
		startIndex = Integer.parseInt(ind);

	System.out.println(ind);
//		String pageUrl="RelationshipMgr.do?event=paginate&startIndex=";
	String pageUrl = "RelationshipMgr.do?event=paginate&RMCode="+Rcode+"&RMName="+Rname+"&startIndex="+ind;
	List localCADs = (List)session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.localCADs");
	System.out.println("localCADs "+localCADs);
	pageContext.setAttribute("localCADList", localCADs);
	pageContext.setAttribute("localCADs", localCADs);
%> 
<%
String actionStr1 = "com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
%>
<%@page import="com.integrosys.cms.ui.relationshipmgr.RelationshipMgrForm"%><html>
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
		var chk = window.confirm("Are you Sure to Delete this Record?");
		if(chk==true){
			document.forms[0].action="RelationshipMgr.do?event=maker_submit_remove&RMId="+idx;
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
	<html:form action="RelationshipMgr.do">
	<input type="hidden" name="startIndex" />
		
		<html:hidden name="relationshipMgrForm" property="relationshipMgrCode" />
		<html:hidden name="relationshipMgrForm" property="relationshipMgrName" />
		<html:hidden name="relationshipMgrForm" property="reportingHeadName" />
		<html:hidden name="relationshipMgrForm" property="relationshipMgrMailId" />
		<html:hidden name="relationshipMgrForm" property="reportingHeadMailId" />
		<html:hidden name="relationshipMgrForm" property="region" />
		<html:hidden name="relationshipMgrForm" property="regionId" />
		<html:hidden name="relationshipMgrForm" property="id" />
		<html:hidden name="relationshipMgrForm" property="createdBy" />
		<html:hidden name="relationshipMgrForm" property="lastUpdateBy" />
		<html:hidden name="relationshipMgrForm" property="lastUpdateDate" />
		<html:hidden name="relationshipMgrForm" property="status" />
		<html:hidden name="relationshipMgrForm" property="deprecated" />
		<html:hidden name="relationshipMgrForm" property="versionTime" />
		<html:hidden name="relationshipMgrForm" property="reportingHeadEmployeeCode" />
		
		<html:hidden name="relationshipMgrForm" property="relationshipMgrCity" />
		<html:hidden name="relationshipMgrForm" property="relationshipMgrState" />
		<html:hidden name="relationshipMgrForm" property="relationshipMgrMobileNo" />
		<html:hidden name="relationshipMgrForm" property="reportingHeadMobileNo" />
		<html:hidden name="relationshipMgrForm" property="reportingHeadRegion" />
				<html:hidden name="relationshipMgrForm" property="wboRegion" />
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
												<h3>Relationship Manager Details:Delete</h3>
											</td>
										<%}else{ %>
											<td>
												<h3>Relationship Manager Details:View</h3>
											</td>
										<% } %>
									</tr>
									<tr>
										<td colspan="2">
										<hr />
										<br />
										</td>
										
									</tr>
			<tr>
				<td>
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					class="tblInput">
					<thead>
					</thead>
					<tbody>
						<tr class="even">
							<td class="fieldname" width="20%">RM Employee Code</td>
							<td width="30%"><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrCode()%>"/>&nbsp;
							</td>
						
							<td class="fieldname" width="20%">RM Name</td>
							<td width="30%"><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrName()%>"/>&nbsp;
							</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">RM E-mail ID</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrMailId()%>"/>&nbsp;</td>
						
							<td class="fieldname">RM Mobile No.</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrMobileNo()%>"/>&nbsp;</td>
						</tr>
						<tr class="even">	
							<td class="fieldname">RM Region</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getRegion()%>"/>&nbsp;</td>

							<td class="fieldname">RM City</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrCity()%>"/>&nbsp;</td>
						</tr>	
						<tr class="odd">	
							<td class="fieldname">RM State</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrState()%>"/>&nbsp;</td>

							<td class="fieldname">WBO Region</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getWboRegion()%>"/>&nbsp;</td>
						</tr>									
						<tr class="even">				
							<td class="fieldname">Supervisor Name</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadName()%>"/>&nbsp;</td>

							<td class="fieldname">Supervisor Employee Code</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadEmployeeCode()%>"/>&nbsp;</td>
						</tr>
						<tr class="odd">				
							<td class="fieldname">Supervisor Email ID</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadMailId()%>"/>&nbsp;</td>

							<td class="fieldname">Supervisor Mobile No.</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadMobileNo()%>"/>&nbsp;</td>
						</tr>
						 <tr class="even">  
							<td class="fieldname">Supervisor Region</td>
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadRegion()%>"/>&nbsp;</td>							  <td class="fieldname" >Status</td>
			                  <td><%= relationshipMgrForm.getStatus().equalsIgnoreCase("ACTIVE")?"ENABLED":"DISABLED"%></td>
			                 
			                  </td>
			               							                
			                  
			             </tr>
					</tbody>
				</table>
				</td>
			</tr>
										 <tr>
							<td width="100%">
							<h3>Local CAD Details</h3>
							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="100%">
								<tbody>
									<tr class="odd">
									<hr/>
									</tr>
									<tr>
										<td colspan="2">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<thead>
												<tr>
													<td width="5%">S/N</td>
													<td width="10%">Local CAD Employee Code</td>
													<td width="15%">Local CAD Name</td>
													<td width="20%">Local CAD Email ID</td>
													<td width="10%">Mobile Number</td>
													<td width="10%">Supervisor Name</td>
													<td width="20%">Supervisor Email</td>
													<td width="10%">Mobile Number</td>
												</tr>
											</thead>
											<tbody>
													<logic:present name="localCADList" >
															<logic:iterate id="localCADlist" name="localCADList"
																indexId="localCAD" 
															type="com.integrosys.cms.app.relationshipmgr.bus.OBLocalCAD">

																			<tr>
																			<% ILocalCAD localCAD1 =(ILocalCAD) localCADlist; 
																			%>
																				<td>
																							<%=localCAD.intValue() + 1%>
														 									</td>
																								<td><%=localCAD1.getLocalCADEmployeeCode()%>
																								</td>
																								<td><%=localCAD1.getLocalCADName()%>
																								</td>
																								<td><%=localCAD1.getLocalCADEmailID()%>
																								</td>
																								<td> <%=localCAD1.getLocalCADmobileNo()%>
																								 </td>
																								<td> <%=localCAD1.getLocalCADSupervisorName()%></td>
																								 <td> <%=localCAD1.getLocalCADSupervisorEmail()%>
																								</td>
																								<td><%=localCAD1.getLocalCADSupervisorMobileNo()%>
																								 </td>
																																					</tr>
																</logic:iterate>
													</logic:present>
 

											</tbody>
										</table>
										</td>
									</tr>
								</tbody>
							 </table>
							 </td>
							 	</tr>	
							</table>
					</table>
					<table width="100" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<%
							if (event.equals("prepare_maker_submit_remove")) {
						%>
						<tr align="center">
							<td width="100" valign="baseline" align="center"><a href="#"
								onMouseOut="MM_swapImgRestore()"
								onMouseOver="MM_swapImage('Image3311','','img/delete2.gif',1)"
								onClick="submitPage('<%=rmId%>')"><img src="img/delete1.gif"
								name="Image3311" border="0" id="Image3311" /></a></td>
							<td width="100" valign="baseline" align="center"><a
								href="<%=pageUrl %>"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>

							</td>
						</tr>

						<%
							} else {
						%>
						<tr align="center">
							<td width="100" valign="baseline" align="center"><a
								href="<%=pageUrl %>"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
								src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
							</td>
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


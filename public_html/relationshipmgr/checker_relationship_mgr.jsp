
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import=" com.integrosys.base.techinfra.logger.DefaultLogger,
		     com.integrosys.component.user.app.bus.ICommonUser,
		     com.integrosys.component.user.app.constant.UserConstant,
		     com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
		     com.integrosys.cms.app.user.trx.OBUserTrxValue,
		     java.util.List,
		     com.integrosys.cms.ui.common.CountryList,
		     com.integrosys.component.bizstructure.app.bus.ITeam,
		     com.integrosys.cms.ui.common.constant.IGlobalConstant,
		     com.integrosys.base.uiinfra.common.ICommonEventConstant,
		     com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
		     com.integrosys.base.techinfra.util.DateUtil,
		     com.integrosys.base.techinfra.propertyfile.PropertyManager,
		     java.util.HashMap,
		     java.util.Locale,
		     java.util.Arrays,com.integrosys.cms.app.relationshipmgr.bus.OBLocalCAD,com.integrosys.cms.ui.relationshipmgr.ILocalCAD"%>
<%

	RelationshipMgrForm relationshipMgrForm = (RelationshipMgrForm) request.getAttribute("relationshipMgrForm");
	IRelationshipMgrTrxValue relationshipMgrTrx = (IRelationshipMgrTrxValue)session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.IRelationshipMgrTrxValue");
	String submitEvent = "checker_approve_edit";
	String rejectEvent = "checker_reject_edit";
	
	String trxId = (String) request.getAttribute("TrxId");
	
	List localCADs = (List)session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.localCADs");
	System.out.println("localCADs "+localCADs);
	pageContext.setAttribute("localCADList", localCADs);
	pageContext.setAttribute("localCADs", localCADs);
	
	List removedLocalCADs = (List)session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.removedLocalCADs");
	System.out.println("removedLocalCADs "+removedLocalCADs);
	//pageContext.setAttribute("localCADList", localCADs);
	pageContext.setAttribute("removedLocalCADs", removedLocalCADs);
	
%>



<%@page import="com.integrosys.cms.ui.relationshipmgr.RelationshipMgrForm"%>
<%@page import="com.integrosys.cms.app.relationshipmgr.trx.IRelationshipMgrTrxValue"%><html>
	<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<!-- InstanceBeginEditable name="doctitle" -->
		<title>Untitled Document</title>
		<!-- InstanceEndEditable -->

		<!-- InstanceBeginEditable name="CssStyle" -->

		<!-- InstanceEndEditable -->
		<!-- InstanceBeginEditable name="head" -->
		<script language="JavaScript" type="text/JavaScript">

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
		    document.forms[0].action="RelationshipMgr.do?event=view_relationship_mgr";
		    document.forms[0].submit();
		}
		function approvePage() {
		    document.forms[0].action="RelationshipMgr.do?event=checker_approve_edit";
		    document.forms[0].submit();
		}
		function rejectPage() {
		    document.forms[0].action="RelationshipMgr.do?event=checker_reject_edit";
		    document.forms[0].submit();
		}
		function cancelPage(){
		    document.forms[0].action="ToDo.do?event=prepare";
		    document.forms[0].submit();
		}

</script>
		<!-- InstanceEndEditable -->
	</head>

<html:form action='RelationshipMgr.do?'>
	<input type="hidden" name="TrxId" value="<%=trxId %>"></input>

	<body>
	<!-- InstanceBeginEditable name="Content" -->
	<table width="80%" border="0" align="center" cellpadding="0"
		cellspacing="0" class="tblFormSection">
		<thead>
			<tr>
				<td>
				<h3>Maintain Relationship Manager</h3>
				</td>
			</tr>
			<tr>
				<td>
				<hr />
				</td>
			</tr>
		</thead>
		<tbody>
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
							<td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadRegion()%>"/>&nbsp;</td>	
							  <td class="fieldname" >Status</td>
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
																			if("PENDING_CREATE".equals(localCAD1.getStatus())){
																			%>
																				<td bgcolor="#638FC7">
																							<%=localCAD.intValue() + 1%>
														 									</td>
														 									<%}
																			else if("PENDING_DELETE".equals(localCAD1.getStatus()) ){%>
																					<td bgcolor="orange">
																							<%=localCAD.intValue() + 1%>
														 									</td>
														 									
																			<%}
																			else{%>
														 									<td>
																							<%=localCAD.intValue() + 1%>
														 									</td>
														 									<%} %>
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
							 	<tr></tr>
			<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="even"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea>
								<br/><html:errors property="remarksError"/>
							</td>
								
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="odd"><%=relationshipMgrTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="even">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=relationshipMgrTrx.getRemarks() != null ? relationshipMgrTrx
						.getRemarks() : ""%>&nbsp;</td>
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
			<td width="65">&nbsp;</td>
			<td width="65">&nbsp;</td>
		</tr>

		<tr>

			<td><a href="javascript:approvePage()"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img
				src="img/approve1.gif" name="Image8" width="80" height="20"
				border="0" id="Image8" /></a></td>
			<td><a href="javascript:rejectPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img
				src="img/reject1.gif" name="Image9" width="70" height="20"
				border="0" id="Image9" /></a></td>
			<td><a href="javascript:cancelPage();"
				onmouseout="MM_swapImgRestore()"
				onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img
				src="img/cancel1.gif" name="Image1" border="0" id="Image1" /></a></td>

		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
	</table>

	<!-- InstanceEndEditable -->
	</body>
<html:hidden property="status"/>	
<%--  <html:hidden property="localCADs" value="<%=localCADs %>"/> --%>
<%-- 		<input type="hidden" name="localCADList" value="<%=localCADs %>"></input> --%>
</html:form>
<!-- InstanceEnd -->
</html>

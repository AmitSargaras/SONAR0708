
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays"%>
<%
	RelationshipMgrForm relationshipMgrForm = (RelationshipMgrForm) request
			.getAttribute("relationshipMgrForm");
	IRelationshipMgrTrxValue relationshipMgrTrx = (IRelationshipMgrTrxValue) session
			.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.IRelationshipMgrTrxValue");
%>

<%@page import="com.integrosys.cms.app.relationshipmgr.trx.IRelationshipMgrTrxValue"%>
<%@page import="com.integrosys.cms.ui.relationshipmgr.RelationshipMgrForm"%><html>
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


//-->
</script>
		<!-- InstanceEndEditable -->
	</head>

	<html:form action='RelationshipMgr.do?'>
		<body>
			<!-- InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<br>
					<tr>
						<td>
							<h3>
								View Relationship Manager Details
							</h3>
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
							<td width="70%">
							<h3>Local CAD Details</h3>
							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="99%">
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
													<td width="10%">Local CAD Email ID</td>
													<td width="10%">Mobile Number</td>
													<td width="10%">Supervisor Name</td>
													<td width="10%">Supervisor Email</td>
													<td width="10%">Mobile Number</td>
													<td width="10%">Action</td>
												</tr>
											</thead>
											<tbody>
													<logic:present name="localCADList">
															<logic:iterate id="localCADlist" name="localCADList"
																indexId="localCAD"
															type="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr">

																			<tr>
																			<% IRelationshipMgr localCAD1 =(IRelationshipMgr) localCADlist; 
																			%>
																				<td>
																							<%=localCAD.intValue() + 1%>
														 									</td>
																								<td><%=localCAD1.getRelationshipMgrCode()%>
																								</td>
																								<td><%=localCAD1.getRelationshipMgrName()%>
																								</td>
																								<td><%=localCAD1.getRelationshipMgrMailId()%>
																								</td>
																								<td> <%=localCAD1.getRelationshipMgrMobileNo()%>
																								 </td>
																								<td> <%=localCAD1.getReportingHeadName()%></td>
																								 <td> <%=localCAD1.getReportingHeadMailId()%>
																								</td>
																								<td><%=localCAD1.getReportingHeadMobileNo()%>
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
			<tr>
				<td>
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="even"><%=relationshipMgrTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="odd">
							<td class="fieldname">Last Remarks Made</td>
							<td><%=relationshipMgrTrx.getRemarks() != null ? relationshipMgrTrx
								.getRemarks()
								: ""%>&nbsp;</td>
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


					<td colspan="4">
						<center>
							<a href="javascript:cancelPage();"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
									src="img/return1.gif" name="Image4411" border="0"
									id="Image4411" />
							</a>
						</center>
						&nbsp;
					</td>

				</tr>
				<tr>
					<td>
						&nbsp;
					</td>
					<td>
						&nbsp;
					</td>
				</tr>
			</table>


			<!-- InstanceEndEditable -->
		</body>
	</html:form>
	<!-- InstanceEnd -->
</html>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ page
	import="com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.component.user.app.bus.ICommonUser,
	com.integrosys.component.user.app.constant.UserConstant,com.integrosys.cms.app.bizstructure.proxy.CMSTeamProxy,
	com.integrosys.cms.app.user.trx.OBUserTrxValue,java.util.List,com.integrosys.cms.ui.common.CountryList,
	com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.cms.ui.common.constant.IGlobalConstant,
	com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.bizstructure.MaintainTeamUtil,
	com.integrosys.base.techinfra.util.DateUtil,com.integrosys.cms.app.common.constant.ICMSConstant,
	com.integrosys.base.techinfra.propertyfile.PropertyManager,java.util.HashMap,java.util.Locale,java.util.Arrays,
	com.integrosys.cms.app.relationshipmgr.bus.OBLocalCAD,com.integrosys.cms.ui.relationshipmgr.ILocalCAD"%>
<%
	RelationshipMgrForm relationshipMgrForm = (RelationshipMgrForm) request
			.getAttribute("relationshipMgrForm");
	IRelationshipMgrTrxValue relationshipMgrTrx = (IRelationshipMgrTrxValue) session
			.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.IRelationshipMgrTrxValue");
	
	String event = (String) request.getAttribute("event");
	System.out.println("Maker_resubmit_relationship_mgr.jsp => Event=>"+event);
	if(event==null){
		event = relationshipMgrForm.getEvent();
	} 

	pageContext.setAttribute("event", event);
	List regionList = null;
	
	regionList = (List) session
	.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.regionList");
	pageContext.setAttribute("regionList", regionList);
	
	String trxId = (String) request.getAttribute("TrxId");
	
	System.out.println("getFromState>>>>>"+relationshipMgrTrx.getFromState());
	
	List localCADs = (List)session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.localCADs");
	System.out.println("localCADs "+localCADs);
	pageContext.setAttribute("localCADList", localCADs);
	pageContext.setAttribute("localCADs", localCADs);
%>


<%@page import="com.integrosys.cms.ui.relationshipmgr.RelationshipMgrForm"%>
<%@page import="com.integrosys.cms.app.relationshipmgr.trx.IRelationshipMgrTrxValue"%><html>
<!--	 InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
	<head>
		<title>Untitled Document</title>
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
		
	    document.forms[0].action="ToDo.do?event=totrack";
	    
	    document.forms[0].submit();
	}
	
	function submitPage () {
		document.forms[0].action="RelationshipMgr.do?event=maker_confirm_resubmit_edit";
	    document.forms[0].submit();
	}
	function submitDraftPage () {
		document.forms[0].action="RelationshipMgr.do?event=maker_confirm_resubmit_draft";
	    document.forms[0].submit();
	}
	
	function submitUpdateDraftPage () {
		document.forms[0].action="RelationshipMgr.do?event=maker_confirm_resubmit_update";
	    document.forms[0].submit();
	}
	
	function addCad(){
		
		var eventForward = '<%=event%>';
		var relationshipMgrCode = document
					.getElementById("relationshipMgrCode").value;
			var rmCode = document.getElementById("cadEmployeeCode").value;
			
			if(eventForward == 'maker_update_save_process' || eventForward == 'addResubmitCad_draft' || eventForward == 'addResubmitCad_draft_error' || eventForward == 'removeResubmitCad_draft' || eventForward == 'removeResubmitCad_draft_error'){
				eventForward = 'addResubmitCad_draft';
			}
			else if(eventForward == 'maker_prepare_resubmit' || eventForward == 'addResubmitCad_rejected' || eventForward == 'removeResubmitCad_rejected_error' || eventForward == 'addResubmitCad_rejected_error' || eventForward == 'removeResubmitCad_rejected'){
				eventForward = 'addResubmitCad_rejected';
			}
			else{
				eventForward = 'addResubmitCad';
			}
 			/* var branch = document.getElementById("cadBranchCode").value;  */
			
			/* var branch = ''; */
			if (null == rmCode || "" == rmCode) {
				alert("Employee Code is mandatory");

			} else {
				if (relationshipMgrCode == rmCode) {
					alert("Employee Code and RM Employee Code cannot be same.");
				} else {
					document.forms[0].action = "RelationshipMgr.do?event="+eventForward+"&rmCode="
							/* + rmCode + "&branchCode=" + branch + "&action=edit"; */
					+ rmCode + "&action=edit";
					document.forms[0].submit();
				}
			}
		}

		function removeCAD(e) {
			var eventForward = '<%=event%>';
			var confirmation = confirm("Are you sure you want to remove the Details?");
			var rmCode = e;

			if(eventForward == 'maker_update_save_process' || eventForward == 'removeResubmitCad_draft' || eventForward == 'removeResubmitCad_draft_error' || eventForward == 'addResubmitCad_draft' || eventForward == 'addResubmitCad_draft_error'){
				eventForward = 'removeResubmitCad_draft';
			}
			else if(eventForward == 'maker_prepare_resubmit' || eventForward == 'removeResubmitCad_rejected'){
				eventForward = 'removeResubmitCad_rejected';
			}
			else{
				eventForward = 'removeResubmitCad';
			}
			
			if (confirmation == true) {
				document.forms[0].action = "RelationshipMgr.do?event="+eventForward+"&rmCode="
						+ rmCode + "&action=edit";
				document.forms[0].submit();
			}
		}

		function fillRegionId(){
			var region = document.getElementById("region").value;
			
		document.getElementById("regionId").value = region;
		

	}
//
</script>
<!--		 InstanceEndEditable -->
	</head>

	<html:form action='RelationshipMgr.do?'>
		<body>
		<input type="hidden" name="TrxId" value="<%=trxId %>" />
<!--			 InstanceBeginEditable name="Content" -->
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tblFormSection">
				<thead>
					<tr>
						<td>
							<br>
							<h3>
								Maintain Relationship Manager
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
													<td class="fieldname">RM Employee Code<font
														color="red">*</font></td>
													<td><%=relationshipMgrForm.getRelationshipMgrCode()%>&nbsp;</td>	
													<td class="fieldname" width="15%">RM Name</td>
													<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrName()%>"/>&nbsp;
														<html:hidden property="relationshipMgrName" value="<%=relationshipMgrForm.getRelationshipMgrName()%>"/> </td>
												</tr>
												<tr class="odd">
													<td class="fieldname" width="15%">RM Email ID</td>
													<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrMailId()%>"/>&nbsp; 
														<html:hidden property="relationshipMgrMailId" value="<%=relationshipMgrForm.getRelationshipMgrMailId()%>"/>
													</td>

													<td class="fieldname" width="15%">RM Mobile No.</td>
													<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrMobileNo()%>"/>&nbsp; 
													<html:hidden property="relationshipMgrMobileNo" value="<%=relationshipMgrForm.getRelationshipMgrMobileNo()%>"/>
													</td>													
												</tr>
												<tr class="even">
													<td class="fieldname">RM Region <font color="red">*</font></td>
<td><html:select styleId="region"
																				property="region"
																				value="<%=relationshipMgrForm.getRegion()%>"
																				onchange="javascript:fillRegionId()">
																				<option value="">Please Select</option>
																		 	<html:options collection="regionList"
																					property="label" labelProperty="label" />
																			</html:select>&nbsp; 
														                  	<html:hidden property="regionId" styleId="regionId"/>														
																			<html:errors
																				property="regionError" /></td>

												
													<td class="fieldname" width="15%">RM City</td>
													<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrCity()%>"/>&nbsp;
														<html:hidden property="relationshipMgrCity" value="<%=relationshipMgrForm.getRelationshipMgrCity()%>"/></td>
												</tr>
												<tr class="odd">
													<td class="fieldname" width="15%">RM State</td>
													<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrState()%>"/>&nbsp;	
													<html:hidden property="relationshipMgrState" value="<%=relationshipMgrForm.getRelationshipMgrState()%>"/></td>
													
													<td class="fieldname">WBO Region <font color="red">*</font></td>
<td>
																			<html:select styleId="wboRegion"
																				property="wboRegion"
																				value="<%=relationshipMgrForm.getWboRegion()%>">
																				<option value="">Please Select</option>
																			<html:options collection="regionList"
																					property="label" labelProperty="label" />
																			</html:select>&nbsp; 
													<html:errors property="wboregionError" />
																		</td>
												</tr>
												<tr class="even">
													<td class="fieldname">Supervisor Name </td>
													<td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadName()%>"/>&nbsp;
													<html:hidden property="reportingHeadName" value="<%=relationshipMgrForm.getReportingHeadName()%>"/></td>
													
													 <td class="fieldname">Supervisor Employee Code</td>
									                 <td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadEmployeeCode()%>"/>&nbsp;
									                 <html:hidden property="reportingHeadEmployeeCode" value="<%=relationshipMgrForm.getReportingHeadEmployeeCode()%>"/>
									                 </td>
												</tr>
												
												 <tr class="odd">  
														<td class="fieldname">Supervisor Email ID</td>
														<td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadMailId()%>"/>&nbsp;
														<html:hidden property="reportingHeadMailId" value="<%=relationshipMgrForm.getReportingHeadMailId()%>"/></td>
														
													<td class="fieldname">Supervisor Mobile No.</td>
														<td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadMobileNo()%>"/>
														<html:hidden property="reportingHeadMobileNo" value="<%=relationshipMgrForm.getReportingHeadMobileNo()%>"/></td>							                 
								                </tr>
								                <tr class="even">
								                	<td class="fieldname">Supervisor Region <font color="red">*</font></td>
													<td><%-- <integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadRegion()%>"/>
													<html:hidden property="reportingHeadRegion" value="<%=relationshipMgrForm.getReportingHeadRegion()%>"/> --%>
													<html:select styleId="reportingHeadRegion"
																				property="reportingHeadRegion"
																				value="<%=relationshipMgrForm.getReportingHeadRegion()%>">
																				<option value="">Please Select</option>
																			<html:options collection="regionList"
																					property="label" labelProperty="label" />
																			</html:select>&nbsp;
													<html:errors property="supervisorregionError" /></td>
															  <td class="fieldname" >Status</td>
			                  <%-- <td><%= relationshipMgrForm.getStatus().equalsIgnoreCase("ACTIVE")?"ENABLED":"DISABLED"%></td> --%>
			                  <td>
					                  	<%
					                  		if( relationshipMgrForm.getStatus().equalsIgnoreCase("ACTIVE") ){
					                  	%>
					                  	<input type="radio" name="status" checked="checked" value="ACTIVE" ><%=ICMSConstant.STATE_ENABLE.toString()%></input>
				                  		<input type="radio" name="status" value="INACTIVE" ><%=ICMSConstant.STATE_DISABLE.toString()%></input>
				                  		<%}else{%>
				                  			<input type="radio" name="status"  value="ACTIVE" ><%=ICMSConstant.STATE_ENABLE.toString()%></input>
					                  		<input type="radio" name="status" checked="checked" value="INACTIVE" ><%=ICMSConstant.STATE_DISABLE.toString()%></input>
				                  		<%} %>
					                  </td>
			                 
			                  </td>
			               							                
			                  
			             </tr>
											</tbody>
										</table>
     </td>
                </tr><tr>
							<td width="100%">
							<h3>Add Local CAD Details</h3>
							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="100%">
								<tbody>
									<tr>
										<td colspan="2">
										<hr/>
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<tbody>
												<tr class="odd">
<%-- 													<td class="fieldname" width = "20%">Branch Code <font color="red">*</font></td>
													<td width = "30%">
														<html:select name="relationshipMgrForm" property="cadBranchCode" styleId="cadBranchCode">
										                  		<option value="">Please Select</option>
										                  		<html:options collection="regionList" labelProperty="label" property="value" />
										                </html:select>
														<html:errors property="cadBranchCodeError" /></td> --%>
													<td class="fieldname" width = "20%">Employee Code <font color="red">*</font></td>
													<td width = "20%">
														<html:text name="relationshipMgrForm" property="cadEmployeeCode" styleId="cadEmployeeCode" maxlength="10"></html:text>
														<html:button property="addCAD" value="ADD" onclick="addCad();"></html:button>
														<html:errors property="cadEmployeeCodeError" /></td>
													</td>
												</tr> 
											</tbody>
										</table>
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
													<td width="15%">Local CAD Email ID</td>
													<td width="10%">Mobile Number</td>
													<td width="10%">Supervisor Name</td>
													<td width="15%">Supervisor Email</td>
													<td width="10%">Mobile Number</td>
													<td width="10%">Action</td>
												</tr>
											</thead>
											<tbody>
													<logic:present name="localCADList">
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
																								<td>	<a href="#" onclick="removeCAD('<%=localCAD1.getLocalCADEmployeeCode()%>')">Remove</a>
																								</td>													</tr>
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
							 	</tbody>
							 </table>
							 </td>
							 	</tr>	
				</table>
						</td>
					</tr>
			<tr>
				<td>
				<table width="80%" border="0" align="center" cellpadding="0"
					cellspacing="0" class="tblInfo">
					<tbody>
						<tr>
							<td class="fieldname">Remarks</td>
							<td class="even"><textarea name="remarks" rows="4"
								style="width: 90%"></textarea></td>
						</tr>
						<tr>
							<td class="fieldname">Last Action By</td>
							<td class="odd"><%=relationshipMgrTrx.getUserInfo()%>&nbsp;</td>
						</tr>
						<tr class="even">
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
					<td valign="baseline" align="center">
						&nbsp;
					</td>
					<td valign="baseline" align="center">
						&nbsp;
					</td>
				</tr>
				<tr>

			<% if(event.equals("maker_save_process")){ %>
				<td valign="baseline" align="center">
				<a href="#" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
					onClick="submitDraftPage()"><img src="img/submit1.gif"
					name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
				</td>
				<td valign="baseline" align="center">
				<a
					href="ToDo.do" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
					src="img/cancel1.gif" name="Image2" width="70" height="20"
					border="0" id="Image2" /></a> &nbsp;
				</td>
			<% }else if(event.equals("maker_update_save_process") || "addResubmitCad_draft".equals(event) || "removeResubmitCad_draft".equals(event) || "removeResubmitCad_draft_error".equals(event) || "addResubmitCad_draft_error".equals(event)){ %>
				<td valign="baseline" align="center">
				<a href="#" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
					onClick="submitUpdateDraftPage()"><img src="img/submit1.gif"
					name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
				</td>
				<td valign="baseline" align="center">	
					 <a
					href="ToDo.do" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
					src="img/cancel1.gif" name="Image2" width="70" height="20"
					border="0" id="Image2" /></a> &nbsp;
				</td>
			<% }else{ %>	
				<td valign="baseline" align="center">
				<a href="#" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image3311','','img/submit2.gif',1)"
					onClick="submitPage()"><img src="img/submit1.gif"
					name="Image3311" border="0" id="Image3311" /></a>&nbsp;&nbsp;
				</td>
				<td valign="baseline" align="center">	
					 <a
					href="ToDo.do" onmouseout="MM_swapImgRestore()"
					onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img
					src="img/cancel1.gif" name="Image2" width="70" height="20"
					border="0" id="Image2" /></a> &nbsp;
				</td>
			<% } %>

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


<!--			 InstanceEndEditable -->
		</body>
		<html:hidden  name="relationshipMgrForm" property="relationshipMgrCode" styleId="relationshipMgrCode" value="<%=relationshipMgrForm.getRelationshipMgrCode() %>"/>
		<html:hidden  name="relationshipMgrForm" property="id" />
		<html:hidden  name="relationshipMgrForm" property="createdBy" />
		<html:hidden  name="relationshipMgrForm" property="lastUpdateBy" />
		<html:hidden  name="relationshipMgrForm" property="lastUpdateDate" />
		<html:hidden  name="relationshipMgrForm" property="status" />
		<html:hidden  name="relationshipMgrForm" property="deprecated" />
		<html:hidden  name="relationshipMgrForm" property="versionTime" />
		
	</html:form>
<!--	 InstanceEnd -->
</html>

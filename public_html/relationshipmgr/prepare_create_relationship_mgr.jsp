<%@page import="com.integrosys.cms.ui.relationshipmgr.LocalCADForm"%>
<%@ page import="com.integrosys.component.notification.bus.INotification,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 java.util.ArrayList,
                 com.integrosys.component.notification.bus.OBNotification,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.relationshipmgr.RelationshipMgrForm"%>
<%@page import="com.integrosys.cms.ui.relationshipmgr.IRelationshipMgr"%>
<%@page import="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr,com.integrosys.cms.app.relationshipmgr.bus.OBLocalCAD,com.integrosys.cms.ui.relationshipmgr.ILocalCAD"%>
<%
RelationshipMgrForm relationshipMgrForm = (RelationshipMgrForm) request.getAttribute("relationshipMgrForm");

List regionList = (List)session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.regionList");
if(regionList!=null){

}
pageContext.setAttribute("regionList", regionList);

List localCADs = (List)request.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.localCADs");

if(null == localCADs){
	localCADs = new ArrayList();
}else{
	pageContext.setAttribute("localCADs", localCADs);	
	pageContext.setAttribute("localCADList", localCADs);
}

//RelationshipMgrForm relationshipMgrForm = (RelationshipMgrForm)request.getAttribute("relationshipMgrForm");

pageContext.setAttribute("relationshipMgrForm", relationshipMgrForm);
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
	function savePage() {		
		document.forms[0].action="RelationshipMgr.do?event=maker_save_create_relationship_mgr";
		document.forms[0].submit();
	}
	function submitPage() {
		var rmCode = document.getElementById("relationshipMgrCode").value;
		document.forms[0].action="RelationshipMgr.do?event=maker_submit_create_relationship_mgr&RMCode="+rmCode;
		document.forms[0].submit();
	}
	
	function populateFields(){
		var relationshipMgrCode = document.getElementById("relationshipMgrCode").value;
		var rmCode = document.getElementById("cadEmployeeCode").value;
		if(relationshipMgrCode == rmCode){
			alert("Employee Code and RM Employee Code cannot be same.");
		}else{
		document.forms[0].action="RelationshipMgr.do?event=populateFields&RMCode="+relationshipMgrCode;
		document.forms[0].submit();
		}
	}

	function addCad(){
		var relationshipMgrCode =  document.getElementById("relationshipMgrCode").value;
		var rmCode = document.getElementById("cadEmployeeCode").value;
/* 		var branch = document.getElementById("cadBranchCode").value; */
		if(null == rmCode || "" == rmCode){
			alert("Employee Code is mandatory");
		}else{
			if(relationshipMgrCode == rmCode){
				alert("Employee Code and RM Employee Code cannot be same.");
			}else{
				document.forms[0].action="RelationshipMgr.do?event=addCad&rmCode="+rmCode;
				document.forms[0].submit();
			}
		}
	}
	
	function removeCAD(e){
		var confirmation = confirm("Are you sure you want to remove the Details?");
		var rmCode = e;
		
		if(confirmation == true){
			document.forms[0].action="RelationshipMgr.do?event=removeCad&rmCode="+rmCode;
			document.forms[0].submit();
		}		
	}

	function isAlphaNumeric(event) {
		var character = String.fromCharCode(window.event.keyCode);
		return isValid(character);
	}
	
	function isValid(str) {
		return !/[~`!@#$%\^&*()+=_\-\[\]\\ ';,./{}|\\":<>\?]/g.test(str);
	}
	
	function fillRegionId(){
			var region = document.getElementById("region").value;
		
		document.getElementById("regionId").value = region;
	}
</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<html:form action="RelationshipMgr.do">
		<input type="hidden"
			name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0" />

		<tr>

			<td width="100%" height="100%" valign="bottom">
			<table width="100%" height="100%" border="0" align="center"
				cellpadding="0" cellspacing="0" class="tblFormSection"
				id="contentWindow">
				<tr height="95%">
					<td valign="top">
					<table width="96%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tblFormSection">
						<br />
						<br />
						<tr>
							<td width="70%">
							<h3>Add Relationship Manager Details</h3>
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
													<td class="fieldname">RM Employee Code<font
														color="red">*</font></td>
													<td><html:text name="relationshipMgrForm" maxlength="10"
														property="relationshipMgrCode" styleId="relationshipMgrCode" onkeypress="return isAlphaNumeric(event);" onblur="populateFields(this);" size="30"/> <html:errors
														property="relationshipMgrCodeError" />
														<html:errors property="relationshipMgrCodeExistError" />
													<br/><html:errors property="spaceError"/>
				                  					<br/><html:errors property="specialCharacterCodeError"/>
				                  					
													<td class="fieldname" width="15%">RM Name</td>
													<td><html:text name="relationshipMgrForm"
														property="relationshipMgrName" style="background:#B4CFEC" size="30" maxlength="50" readonly = "true"/>
				  					                <br/></td>
												</tr>
												<tr class="odd">
													<td class="fieldname" width="15%">RM Email ID</td>
													<td><html:text name="relationshipMgrForm"
														property="relationshipMgrMailId" style="background:#B4CFEC" maxlength="50"  size="30" readonly = "true"/> 
													</td>

													<td class="fieldname" width="15%">RM Mobile No.</td>
													<td><html:text name="relationshipMgrForm"
														property="relationshipMgrMobileNo" style="background:#B4CFEC" maxlength="50"  size="30" readonly = "true"/> 
													</td>													
												</tr>
												<tr class="even">
													<td class="fieldname">RM Region <font color="red">*</font></td>
													<td>
														<html:select name="relationshipMgrForm" property="region" styleId="region" onchange="fillRegionId();">
									                  		<option value="">Please Select</option>
									                  		<html:options collection="regionList" labelProperty="label" property="value" />									                  		
									                  	<html:hidden property="regionId" styleId="regionId"/>
									                  	</html:select>
														<html:errors property="regionError" /></td>
												
													<td class="fieldname" width="15%">RM City</td>
													<td><html:text name="relationshipMgrForm"
														property="relationshipMgrCity" style="background:#B4CFEC" maxlength="50"  size="30" readonly = "true"/> 
													</td>
												</tr>
												<tr class="odd">
													<td class="fieldname" width="15%">RM State</td>
													<td><html:text name="relationshipMgrForm"
														property="relationshipMgrState" style="background:#B4CFEC" maxlength="50"  size="30" readonly = "true"/> 
													</td>
													
													<td class="fieldname">WBO Region <font color="red">*</font></td>
													<td>
														<html:select name="relationshipMgrForm" property="wboRegion">
									                  		<option value="">Please Select</option>
									                  		<html:options collection="regionList" labelProperty="label" property="value" />
									                  	</html:select>
														<html:errors property="wboregionError" /></td>
												</tr>
												<tr class="even">
													<td class="fieldname">Supervisor Name </td>
													<td><html:text name="relationshipMgrForm"
														property="reportingHeadName" style="background:#B4CFEC" maxlength="50" size="30" readonly = "true"></html:text> 
													</td>
													
													 <td class="fieldname">Supervisor Employee Code</td>
									                 <td><html:text name="relationshipMgrForm" property="reportingHeadEmployeeCode" style="text-transform: uppercase" 
									                	 tabindex="1" size="30" maxlength="30" style="background:#B4CFEC" readonly = "true"/>
            	 														<html:errors property="employeeIdError" />
													 </td>
												</tr>
												
												 <tr class="odd">  
														<td class="fieldname">Supervisor Email ID</td>
														<td><html:text name="relationshipMgrForm"
														property="reportingHeadMailId" style="background:#B4CFEC" maxlength="50" size="30" readonly = "true"/></td>
														
													<td class="fieldname">Supervisor Mobile No.</td>
														<td><html:text name="relationshipMgrForm"
														property="reportingHeadMobileNo" style="background:#B4CFEC" maxlength="50" size="30" readonly = "true"/></td>
									                  </td>							                 
								                </tr>
								                <tr class="even">
								                	<td class="fieldname">Supervisor Region <font color="red">*</font></td>
													<td>
														<html:select name="relationshipMgrForm" property="reportingHeadRegion">
									                  		<option value="">Please Select</option>
									                  		<html:options collection="regionList" labelProperty="label" property="value" />
									                  	</html:select>
														<html:errors property="supervisorregionError" /></td>
														<td class="fieldname"></td>
														<td></td>
								                </tr>								                
											</tbody>

										</table>
										</td>
									</tr>
						<tr>
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
													<td width = "30%">
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
					</table>

					<br />
					<hr width="94%" align="center"></hr>

					<table width="100" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr align="center">
							<td width="100" valign="baseline" align="center"><a href="#"
								onMouseOut="MM_swapImgRestore()"
								onMouseOver="MM_swapImage('Image2211','','img/save2.gif',1)"
								onClick="savePage()"><img src="img/save1.gif"
								name="Image2211" border="0" id="Image2211" /></a></td>
							<td width="100" valign="baseline" align="center"><a href="#"
								onMouseOut="MM_swapImgRestore()"
								onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)"
								onClick="submitPage()"><img src="img/submit1.gif"
								name="Image3311" border="0" id="Image3311" /></a></td>
							<td width="100" valign="baseline" align="center"><a
								href="RelationshipMgr.do?event=list_relationship_manager"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>

							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
					<html:hidden  name="relationshipMgrForm" property="employeeId" value="<%=relationshipMgrForm.getEmployeeId()%>"/>
								<%-- 	<html:hidden property="localCADs" value="<%localCADs%>"/> --%>
			</td>
		</tr>
	</html:form>
</table>
</body>
</html>


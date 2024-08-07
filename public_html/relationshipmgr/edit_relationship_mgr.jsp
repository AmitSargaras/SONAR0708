<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection,com.integrosys.cms.app.relationshipmgr.bus.OBLocalCAD,com.integrosys.cms.ui.relationshipmgr.ILocalCAD,com.integrosys.cms.app.relationshipmgr.trx.IRelationshipMgrTrxValue, 
com.integrosys.cms.app.relationshipmgr.trx.OBRelationshipMgrTrxValue,com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr,com.integrosys.cms.ui.relationshipmgr.IRelationshipMgr"%>
<%
	RelationshipMgrForm relationshipMgrForm = (RelationshipMgrForm) request
			.getAttribute("relationshipMgrForm");
	String event = (String) request.getAttribute("event");

	
	IRelationshipMgrTrxValue trxVal = (OBRelationshipMgrTrxValue) session
			.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.IRelationshipMgrTrxValue");
	System.out.println("IRelationshipMgrTrxValue trxVal ==================>"+trxVal);
	
	IRelationshipMgr relaMgr = (OBRelationshipMgr) session
			.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.RelationshipMgrObjNew");
	System.out.println("IRelationshipMgr relaMgr ==================>"+relaMgr);
	
	
	pageContext.setAttribute("RelationshipMgrObj", relationshipMgrForm);

	String RMId = relationshipMgrForm.getId();
	
	List regionList = null;
	regionList = (List) session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.regionList");
	System.out.print("--------------------->"+regionList);
	pageContext.setAttribute("regionList", regionList);
	
	List localCADs = (List)session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.localCADs");
	System.out.println("localCADs "+localCADs);
	pageContext.setAttribute("localCADList", localCADs);
	pageContext.setAttribute("localCADs", localCADs);
	
	List removedLocalCADs = (List)session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.removedLocalCADs");
	System.out.println("removedLocalCADs "+removedLocalCADs);
	//pageContext.setAttribute("localCADList", localCADs);
	pageContext.setAttribute("removedLocalCADs", removedLocalCADs);
	
%> 
<%
String actionStr1 = "com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }


String Rcode = (String) request.getAttribute("RMCode");
String Rname = (String) request.getAttribute("RMName");

int startIndex = 0;
String ind = (String) request.getAttribute("startIndex");

if(relationshipMgrForm != null){
	if(ind == null){
		ind = Integer.toString(relationshipMgrForm.getStartIndex());
	}
	System.out.println("relationshipMgrForm startindex=>"+relationshipMgrForm.getStartIndex());
}

if (ind != null && (!ind.equals("")))
	startIndex = Integer.parseInt(ind);

System.out.println("Ind =>"+ind);
pageContext.setAttribute("startIndex", ind);

//	String pageUrl="RelationshipMgr.do?event=paginate&startIndex=";
String pageUrl = "RelationshipMgr.do?event=paginate&RMCode="+Rcode+"&RMName="+Rname+"&startIndex="+ind;
%>
<%@page import="com.integrosys.cms.ui.relationshipmgr.RelationshipMgrForm,com.integrosys.cms.app.relationshipmgr.bus.OBLocalCAD,com.integrosys.cms.ui.relationshipmgr.ILocalCAD"%><html>
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
		var index = '<%=ind%>';
		document.forms[0].action="RelationshipMgr.do?event=maker_submit_edit&RMId="+idx+"&startIndex="+index;
		document.forms[0].submit();
	}
	function saveToDraft(){
		document.forms[0].action="RelationshipMgr.do?event=maker_save_update_relationship_mgr";
		document.forms[0].submit();
	}
		
	function addCad(){
	var relationshipMgrCode = document
				.getElementById("relationshipMgrCode").value;
		var rmCode = document.getElementById("cadEmployeeCode").value;
/* 		var branch = document.getElementById("cadBranchCode").value; */
		if (null == rmCode || "" == rmCode) {
			alert("Employee Code is mandatory");

		} else {
			if (relationshipMgrCode == rmCode) {
				alert("Employee Code and RM Employee Code cannot be same.");
			} else {
				document.forms[0].action = "RelationshipMgr.do?event=addEditCad&rmCode="
						+ rmCode + "&action=edit";
				document.forms[0].submit();
			}
		}
	}

	function removeCAD(e) {
		var confirmation = confirm("Are you sure you want to remove the Details?");
		var rmCode = e;
		var index = '<%=ind%>';

		if (confirmation == true) {
			document.forms[0].action = "RelationshipMgr.do?event=removeEditCad&rmCode="
					+ rmCode + "&action=edit&startIndex="+index;
			document.forms[0].submit();
		}
	}
	
	function fillRegionId(){
		var region = document.getElementById("region").value;
		
	document.getElementById("regionId").value = region;
	

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
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<html:form action="RelationshipMgr.do">
<input type="hidden" name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0"/>

  <tr >

	<td width="100%" height="100%" valign="bottom" >
      <table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="contentWindow">
    <tr height="95%">
        <td valign="top">
            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
                <tr>
                    <td width="70%">
                                 <table id="111" border="0" cellpadding="0" cellspacing="0" width="99%">
                                   <tbody> 
                                   <tr>
										<td>
										<h3>Relationship Manager Details:Edit</h3>
										</td>
									</tr>                                 
                <tr>
                    <td colspan="2">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                        <tbody>
<tr class="even">
													<td class="fieldname">RM Employee Code<font
														color="red">*</font></td>
													<td><%=relationshipMgrForm.getRelationshipMgrCode()%>&nbsp;
													<html:errors
														property="relationshipMgrCodeError" /> </td>	
													<td class="fieldname" width="15%">RM Name</td>
													<td><integro:empty-if-null value="<%=relationshipMgrForm.getRelationshipMgrName()%>"/>&nbsp;
														<html:hidden property="relationshipMgrName" value="<%=relationshipMgrForm.getRelationshipMgrName()%>"/></td>
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
													<%-- <td><integro:empty-if-null value="<%=relationshipMgrForm.getRegion()%>"/>&nbsp;
														<html:hidden property="region" value="<%=relationshipMgrForm.getRegion()%>"/>
														<html:hidden property="regionId" value="<%=relationshipMgrForm.getRegion()%>"/>
														<html:errors property="regionError" />
														</td> --%>
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

																		<td class="fieldname">WBO Region <font
																			color="red">*</font></td>
																		<td>
																			<%-- <integro:empty-if-null value="<%=relationshipMgrForm.getWboRegion()%>"/>&nbsp;
													<html:hidden property="wboRegion" value="<%=relationshipMgrForm.getWboRegion()%>"/> --%>
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
													<%-- <td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadName()%>"/>&nbsp; 
													<html:hidden property="reportingHeadName" value="<%=relationshipMgrForm.getReportingHeadName()%>"/></td>--%>
													<td><integro:empty-if-null value="<%=relaMgr.getReportingHeadName()%>"/>&nbsp;
													<html:hidden property="reportingHeadName" value="<%=relaMgr.getReportingHeadName()%>"/></td>
													
													 <td class="fieldname">Supervisor Employee Code</td>
									                 <%-- <td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadEmployeeCode()%>"/>&nbsp;
									                 <html:hidden property="reportingHeadEmployeeCode" value="<%=relationshipMgrForm.getReportingHeadEmployeeCode()%>"/> --%>
									                 <td><integro:empty-if-null value="<%=relaMgr.getReportingHeadEmployeeCode()%>"/>&nbsp;
									                 <html:hidden property="reportingHeadEmployeeCode" value="<%=relaMgr.getReportingHeadEmployeeCode()%>"/>
									                 </td>
												</tr>
												
												 <tr class="odd">  
														<td class="fieldname">Supervisor Email ID</td>
														<%-- <td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadMailId()%>"/>&nbsp;
														<html:hidden property="reportingHeadMailId" value="<%=relationshipMgrForm.getReportingHeadMailId()%>"/></td> --%>
														<td><integro:empty-if-null value="<%=relaMgr.getReportingHeadMailId()%>"/>&nbsp;
														<html:hidden property="reportingHeadMailId" value="<%=relaMgr.getReportingHeadMailId()%>"/></td>
														
													<td class="fieldname">Supervisor Mobile No.</td>
														<%-- <td><integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadMobileNo()%>"/>
														<html:hidden property="reportingHeadMobileNo" value="<%=relationshipMgrForm.getReportingHeadMobileNo()%>"/></td> --%>	
														<td><integro:empty-if-null value="<%=relaMgr.getReportingHeadMobileNo()%>"/>
														<html:hidden property="reportingHeadMobileNo" value="<%=relaMgr.getReportingHeadMobileNo()%>"/></td>						                 
								                </tr>
								                <tr class="even">
								                	<td class="fieldname">Supervisor Region <font color="red">*</font></td>
													<td><%-- <integro:empty-if-null value="<%=relationshipMgrForm.getReportingHeadRegion()%>"/>
													<html:hidden property="reportingHeadRegion" value="<%=relationshipMgrForm.getReportingHeadRegion()%>"/> --%>
													<html:select styleId="reportingHeadRegion"
																				property="reportingHeadRegion"
																				value="<%=relaMgr.getReportingHeadRegion()%>">
																				<option value="">Please Select</option>
																			<html:options collection="regionList"
																					property="label" labelProperty="label" />
																			</html:select>&nbsp;
													<html:errors property="supervisorregionError" /></td>		
									  <td class="fieldname" >Status</td>
					                  <td>
					                  	<%
					                  		if( relaMgr.getStatus().equalsIgnoreCase("ACTIVE") ){
					                  	%>
					                  	<input type="radio" name="status" checked="checked" value="ACTIVE" ><%=ICMSConstant.STATE_ENABLE.toString()%></input>
				                  		<input type="radio" name="status" value="INACTIVE" ><%=ICMSConstant.STATE_DISABLE.toString()%></input>
				                  		<%}else{%>
				                  			<input type="radio" name="status"  value="ACTIVE" ><%=ICMSConstant.STATE_ENABLE.toString()%></input>
					                  		<input type="radio" name="status" checked="checked" value="INACTIVE" ><%=ICMSConstant.STATE_DISABLE.toString()%></input>
				                  		<%} %>
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
					<table width="100" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr align="center">
							<td><a href="#"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('saveImage','','img/save2.gif',1)"><img
								src="img/save1.gif" name="saveImage" border="0" 
								onclick="saveToDraft()"/></a></td>
							<td width="100" valign="baseline" align="center"><a href="#"
								onMouseOut="MM_swapImgRestore()"
								onMouseOver="MM_swapImage('Image3311','','img/submit2.gif',1)"
								onClick="submitPage('<%=RMId%>')"><img
								src="img/submit1.gif" name="Image3311" border="0" id="Image3311" /></a></td>
							<td width="100" valign="baseline" align="center"><a
								href="<%=pageUrl %>"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>

							</td>
						</tr>
					</table>
					</td>
    </tr>
</table>

</td>
</tr>
<html:hidden  name="relationshipMgrForm" property="relationshipMgrCode" styleId="relationshipMgrCode" value="<%=relationshipMgrForm.getRelationshipMgrCode()%>"/>
<html:hidden  name="relationshipMgrForm" property="id" />
<html:hidden  name="relationshipMgrForm" property="createdBy" />
<html:hidden  name="relationshipMgrForm" property="lastUpdateBy" />
<html:hidden  name="relationshipMgrForm" property="lastUpdateDate" />
<html:hidden  name="relationshipMgrForm" property="status" />
<html:hidden  name="relationshipMgrForm" property="deprecated" />
<html:hidden  name="relationshipMgrForm" property="versionTime" />
<html:hidden  name="relationshipMgrForm" property="employeeId" value="<%=relationshipMgrForm.getEmployeeId()%>"/>



</html:form>
</table>
</body>
</html>


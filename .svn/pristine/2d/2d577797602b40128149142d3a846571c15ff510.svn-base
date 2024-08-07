<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.login.CMSGlobalSessionConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	SearchResult notificationList = (SearchResult) session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.relationshipMgrList");
	String loginUser = (String) session.getAttribute("com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction.loginUser");
	pageContext.setAttribute("loginUser", loginUser);
	String RMId = "";
	int index = 0;
	int sno = 0;
	List resultList = null;
	int totalCount = 0;
	int listSize = 0;
	if (notificationList != null) {
		resultList = (List)notificationList.getResultList();
		totalCount = notificationList.getNItems();
		listSize = resultList.size();
		pageContext.setAttribute("listSize", Integer.toString(listSize));
		
		if (!(resultList == null)) {
			TreeMap soretedMap= new TreeMap();
			for(int i=0;i<resultList.size();i++)
			{
				OBRelationshipMgr ob=(OBRelationshipMgr)resultList.get(i);
			
					soretedMap.put(ob.getRelationshipMgrCode().toUpperCase(),ob);
				
			}

			resultList = new ArrayList(soretedMap.values());
			}
		
		
		pageContext.setAttribute("RelationshipMgrList", resultList);
	}
	

	String Rcode = (String) request.getAttribute("RMCode");
	String Rname = (String) request.getAttribute("RMName");
	
	int startIndex = 0;
	String ind = (String) request.getAttribute("startIndex");
	if (ind != null && (!ind.equals("")))
		startIndex = Integer.parseInt(ind);

	System.out.print(" startIndex : " + startIndex);
	 String teamTypeMemID=(String)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+CMSGlobalSessionConstant.TEAM_TYPE_MEMBERSHIP_ID);
		long teamTypeMembershipID = Long.parseLong(teamTypeMemID); 
		
		boolean isEditAccess = ((teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SC_MAKER) ||(teamTypeMembershipID == ICMSConstant.TEAM_TYPE_CAD_MAKER) ||
		(teamTypeMembershipID == ICMSConstant.TEAM_TYPE_SC_MAKER_WFH));
		
	
//		String pageUrl="RelationshipMgr.do?event=paginate&startIndex=";
	String pageUrl = "RelationshipMgr.do?event=paginate&RMCode="+Rcode+"&RMName="+Rname+"&startIndex=";
%> 



<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.relationshipmgr.RelationshipManagerAction"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr"%><html>
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

	function addNew() {
	    document.forms[0].action = "RelationshipMgr.do?event=prepare_create_relationship_mgr";
	    document.forms[0].submit();
	}

	function searchRM()
    {	
	    var rmCode = document.getElementById("txtRMCode").value;
        var rmName = document.getElementById("txtRMName").value;
        if(rmCode=='' && rmName==''){
	        document.forms[0].action = "RelationshipMgr.do?event=list_relationship_manager";
	        document.forms[0].submit();
        }else{
	    	document.forms[0].action  = "RelationshipMgr.do?event=list_relationship_manager&RMCode="+rmCode+"&RMName="+rmName;
		    document.forms[0].submit();
        }        
    }

	function uploadRM() {
		document.forms[0].action="RelationshipMgr.do?event=maker_prepare_upload_relationship_mgr";
	    document.forms[0].submit();
	}

</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<html:form action="RelationshipMgr.do">
		<input type="hidden" name="RMId" />
		<input type="hidden" name="startIndex" />

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
							<td width="100%" valign="bottom"><h3>Relationship Manager</h3>
                                    <hr />
							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="99%">
								<tr>
									<td>
									<font size="2"> RM Code : <html:text
										size="25" maxlength="30" property="txtRMCode" styleId="txtRMCode" /> &nbsp;&nbsp; RM Name : <html:text
										size="25" maxlength="50" property="txtRMName" styleId="txtRMName"/> &nbsp;&nbsp;
									&nbsp;&nbsp;</font>
									<a href="#" target="_self"><img src="img/search.gif"
										border="0" onclick="searchRM()" /></a></td>
								</tr>
								
								<html:hidden property="txtRMCode" value="<%=Rcode %>"/>
								<html:hidden property="txtRMName" value="<%=Rname %>"/>
								
								<tr>
									<td><html:errors property="searchTextError"/></td>
								</tr>
								<% if (isEditAccess) { %>                    
		                          <tr>
											<td valign="bottom" align="right"><input type="button"
												name="Submit" value="Add New" class="btnNormal" onclick="addNew()" />
											
												<input type="button" name="fileupload" value="Upload" class="btnNormal" onclick="uploadRM()"/>
											</td>
										</tr>
								<% } else { %>
								 <tr> <td>&nbsp;</td><tr>
								<% } %>
							

								<tr>
										<td colspan="2">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<thead>
												<tr>
													<td width="5%">S/N</td>
													<td width="10%">RM Employee Code</td>
													<td width="15%">RM Name</td>
													<td width="10%">RM Region</td>
													<td width="10%">WBO Region</td>
													<td width="10%">Supervisor Name</td>
													<td width="10%">Status</td>
													<td width="10%">Action</td>
												</tr>
											</thead>
											<tbody>
												<%
													sno = startIndex;
												%>
												<logic:greaterThan name="listSize" value="0">
													<logic:iterate id="OB" name="RelationshipMgrList"
														type="com.integrosys.cms.app.relationshipmgr.bus.OBRelationshipMgr"
														scope="page"
														length="10" offset="<%=String.valueOf(startIndex) %>">
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
																RMId = Long.toString(OB.getId());
															%>
															<td class="index"><%=sno%></td>
															
															
															

															<td><%=OB.getRelationshipMgrCode()%></td>

															<td><%=OB.getRelationshipMgrName()%></td>

															<td><%=OB.getRegion().getRegionName()%></td>

															<td><%=OB.getWboRegion()%></td>

															<td><integro:empty-if-null value="<%=OB.getReportingHeadName()%>" /></td>
															
															<td><% if(OB.getStatus().equals("ACTIVE") ){%>Enable
                                 							<%}else{ %>Disable<%}%></td>
                                 							
															<td><select name="chooseAction"
																onchange="MM_jumpMenu('self',this,0)">
																<option value="#" selected="selected">Please Select</option>

																<option
																	value="RelationshipMgr.do?event=view_relationship_mgr_by_index&RMId=<%=RMId%>&RMCode=<%=Rcode %>&RMName=<%=Rname %>&startIndex=<%=startIndex%>">View</option>
																<%
									
																 if (isEditAccess) {  
																%>
																<option
																	value="RelationshipMgr.do?event=prepare_maker_submit_edit&RMId=<%=RMId%>&RMCode=<%=Rcode %>&RMName=<%=Rname %>&startIndex=<%=startIndex%>">Edit</option>

																<option
																	value="RelationshipMgr.do?event=prepare_maker_submit_remove&RMId=<%=RMId%>&RMCode=<%=Rcode %>&RMName=<%=Rname %>&startIndex=<%=startIndex%>">Delete</option>
																<% } %>				
															</select></td>

														</tr>
													</logic:iterate>
												</logic:greaterThan>
												<logic:equal name="listSize" value="0">
													<tr>
														<td colspan="13">Sorry,No Records Found</td>
													</tr>
												</logic:equal>
											</tbody>
										</table>
										</td>
									</tr>
							</table>
							</td>
							</tr>
							
					</table>
					</td>
				</tr>
				<%
					if (notificationList != null) {
				%>
				<tr>
					<td height="25">
					<table id="generalPurposeBar" width="100%" border="0"
						cellspacing="0" cellpadding="5" align="center">
						<tr>
							<td valign="middle"><integro:pageindex
								pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
								url="<%=pageUrl %>"/>
							</td>
						</tr>
					</table>
					</td>
				</tr>
				<%
					}
				%>
			</table>

			</td>
		</tr>
	</html:form>
</table>
</body>
</html>


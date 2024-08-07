<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
	SearchResult notificationList = (SearchResult) session.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBankAction.OtherBankList");
	String loginUser = (String) session.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBankAction.loginUser");
	String event = (String) session.getAttribute("com.integrosys.cms.ui.otherbankbranch.OtherBankAction.event");
	
	pageContext.setAttribute("loginUser", event);
	pageContext.setAttribute("loginUser", event);
	
	String bankId = "";
	int index = 0;
	int sno = 0;
	Collection resultList = null;
	int totalCount = 0;
	int listSize = 0;
	if (notificationList != null) {
		resultList = notificationList.getResultList();
		totalCount = notificationList.getNItems();
		listSize = resultList.size();
		pageContext.setAttribute("listSize", Integer.toString(listSize));
		pageContext.setAttribute("OtherBankList", resultList);
	}
	
	int startIndex=0;
	String ind= (String) request.getAttribute("startIndex");
	if(ind!=null && (!ind.equals("")))
		 startIndex = Integer.parseInt(ind);
	
	System.out.print(" startIndex : "+startIndex);
	

%> 



<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankAction"%><html>
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

	function searchOtherBank()
    {	
        var bankCode = document.getElementById("bankCode").value;
        var bankName = document.getElementById("bankName").value;
        document.forms[0].action = "OtherBank.do?event=view_other_bank&BankCode="+bankCode+"&BankName="+bankName;
        document.forms[0].submit();
    }

	function searchCheckerOtherBank()
    {	
        var bankCode = document.getElementById("bankCode").value;
        var bankName = document.getElementById("bankName").value;
        document.forms[0].action = "OtherBank.do?event=checker_list_other_bank&BankCode="+bankCode+"&BankName="+bankName;
        document.forms[0].submit();
    }
	
	function addNew() {
	    document.forms[0].action = "OtherBank.do?event=prepare_create_other_bank";
	    document.forms[0].submit();
	}

	function uploadValuationAgency() {
		document.forms[0].action="OtherBank.do?event=maker_prepare_upload_other_bank";
		    document.forms[0].submit();
		}

</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<html:form action="OtherBank.do">
		<input type="hidden" name="BankId" />
		<input type="hidden" name="startIndex" />
		<input type="hidden" name="event" />
		<tr>

			<td width="100%" height="100%" valign="bottom">
			<table width="100%" height="100%" border="0" align="center"
				cellpadding="0" cellspacing="0" class="tblFormSection"
				id="contentWindow">
				<tr height="95%">
					<td valign="top">
					<div id="contentCanvas" style="height: 100%; width: 100%;">
					<table width="96%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tblFormSection">
						<tr>
							<td width="70%">
							<h3>Other Bank List</h3>
							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="99%">
								<tr>
										<td colspan="2">
										<hr />
										</td>
									</tr>
								<tbody>
									
									<tr>
										
										<%
									
											if (!event.equalsIgnoreCase("checker_list_other_bank")) {
										%>
										<td>Bank Code: &nbsp;<input type="text" size="25" maxlength="30"
											id="bankCode" /> 
											&nbsp;&nbsp;
											Bank Name: &nbsp;<input type="text" size="25" maxlength="50"
											id="bankName" /> 
											&nbsp;
											<a href="#" target="_self"><img src="img/search.gif" border="0" onclick="searchOtherBank()" /></a>
										</td>
										<% }else{ %>	
										<td>Bank Code: &nbsp;<input type="text" size="25" maxlength="30"
											id="bankCode" /> 
											&nbsp;&nbsp;
											Bank Name: &nbsp;<input type="text" size="25" maxlength="50"
											id="bankName" /> 
											&nbsp;
											<a href="#" target="_self"><img src="img/search.gif" border="0" onclick="searchCheckerOtherBank()" /></a>
										</td>
										
										<%
										}
											if (!event.equalsIgnoreCase("checker_list_other_bank")) {
										%>
										<td  valign="bottom" align="right">
											<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
											<input type="button" name="Submit" value="Upload" class="btnNormal" onclick="uploadValuationAgency()"/>
						
										</td>
										<% } %>
										
									</tr>
									
									<tr>
										<td><html:errors property="searchTextError"/></td>
									</tr>

									<tr>
										<td colspan="2">
										<br />
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<thead>
												<tr>
													<td width="5%">S/N</td>
													<td width="10%">Bank Code</td>
													<td width="15%">Bank Name</td>
													<td width="10%">City</td>
													<td width="10%">State</td>
													<td width="10%">Region</td>
													<td width="10%">Country</td>
													<td width="10%">Status</td>
													<td width="10%">Action</td>
												</tr>
											</thead>
											<tbody>
												<% sno = startIndex; %>
												<logic:greaterThan name="listSize" value="0">
													<logic:iterate id="OB" name="OtherBankList"
														type="com.integrosys.cms.app.otherbank.bus.OBOtherBank"
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
																bankId = Long.toString(OB.getId());
															%>
															<td class="index"><%=sno%></td>

															<td><%=OB.getOtherBankCode()%></td>

															<td><%=OB.getOtherBankName()%></td>

															<td><%=OB.getCity()==null?"&nbsp;":OB.getCity().getCityName()%></td>

															<td><%=OB.getState()==null?"&nbsp;":OB.getState().getStateName()%></td>
	
															<td><%=OB.getRegion()==null?"&nbsp;":OB.getRegion().getRegionName()%></td>
	
															<td><%=OB.getCountry()==null?"&nbsp;":OB.getCountry().getCountryName()%></td>
															
															<td><% if(OB.getStatus().equals("ACTIVE")){%>Enable
                                 							<%}else{ %>Disable<%}%></td>


															<td><select name="chooseAction"
																onchange="MM_jumpMenu('self',this,0)">
																<option value="#" selected="selected">Please Select</option>

																<%
									
																	if (event.equalsIgnoreCase("checker_list_other_bank")) {
																%>	
																<option
																	value="OtherBank.do?event=checker_view_other_bank&BankId=<%=bankId%>&startIndex=<%=startIndex%>">View</option>
																<%
																	}
																else if (!event.equalsIgnoreCase("checker_list_other_bank")) {
																%>			
																<option
																	value="OtherBank.do?event=view_other_bank_by_index&BankId=<%=bankId%>&startIndex=<%=startIndex%>">View</option>
																	
																<option
																	value="OtherBank.do?event=prepare_maker_submit_edit&BankId=<%=bankId%>">Edit</option>

																<option
																	value="OtherBank.do?event=prepare_maker_submit_remove&BankId=<%=bankId%>">Delete</option>
																<% }else{ %>
																<option
																	value="OtherBank.do?event=checker_view_other_bank&BankId=<%=bankId%>&startIndex=<%=startIndex%>">View</option>
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
									</tr>
							</table>
					</table>
					</div>
					</td>
				</tr>
				<% if(notificationList != null) {%>
				<tr>
					<td height="25">
					<table id="generalPurposeBar" width="100%" border="0"
						cellspacing="0" cellpadding="5" align="center">
						<tr>
						<%if (!event.equalsIgnoreCase("checker_list_other_bank")) {%>
							<td valign="middle"><integro:pageindex
								pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
								url="OtherBank.do?event=paginate&startIndex=" />
							</td>
							<%} else  {%>
							<td valign="middle"><integro:pageindex
								pageIndex="<%=new PageIndex(startIndex, 10, listSize)%>"
								url="OtherBank.do?event=paginate&startIndex=" />
							</td>
							<%} %>
							
						</tr>
					</table>
					</td>
				</tr>
				<%} %>
			</table>

			</td>
		</tr>
	</html:form>
</table>
</body>
</html>


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

<%
	SearchResult notificationList = (SearchResult)request.getAttribute("OtherBranchList");	
	String branchId = null;
	int index=0;
	int sno = 0;
	int startInd = 0;
	Collection resultList = null;
	int totalCount = 0;
	if (notificationList!=null) {
		resultList = notificationList.getResultList();
		startInd = notificationList.getStartIndex();
		totalCount = notificationList.getNItems();
		pageContext.setAttribute("listSize",Integer.toString(resultList.size()));
		pageContext.setAttribute("OtherBranchList",resultList);
	}
%> 



<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBranchAction"%><html>
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

	function searchBankBranch()
    {	
	    var searchType = document.getElementById("srcType").value;
        var searchText = document.getElementById("searchText").value;
        if(searchType=='' && searchText==''){
	        document.forms[0].action = "OtherBranch.do?event=view_other_branch";
	        document.forms[0].submit();
        }else{
        	if(searchType!='' && searchText==''){
        		alert("Please enter search text");
        	}else if(searchType=='' && searchText!=''){
        		alert("Please select search type");		        
	        }else{
	            document.forms[0].action  = "OtherBranch.do?event=view_other_branch&searchType="+searchType+"&searchVal="+searchText;
		        document.forms[0].submit();
	        }
        }        
    }

	function addNew() {
	    document.forms[0].action = "OtherBranch.do?event=prepare_create_other_bank_branch";
	    document.forms[0].submit();
	}
	

</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	<html:form action="OtherBank.do">
		<input type="hidden"
			name="<%=ICMSConstant.PARAM_NOTIFICATION_START_INDEX%>" value="0" />
		<input type="hidden" name="status"
			value="<%=ICMSConstant.STATE_NOTIFICATION_DELETED%>" />
		<input type="hidden" name="totalNotificationCount"
			value="<%= notificationList.getNItems() %>" />

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
							<fieldset><legend class="headerStyle"><b>Other
							Branch List</b></legend>
							<table id="111" border="0" cellpadding="0" cellspacing="0"
								width="99%">
								<tbody>
									<tr>
										<td>Search Branch : &nbsp; <select id="srcType"
											onchange="">
											<option value="">Please Select</option>
											<option value="1">Bank Code</option>
											<option value="2">Branch Code</option>
											<option value="3">Branch Name</option>
											<option value="4">City</option>
											<option value="5">State</option>
											<option value="6">Region</option>
											<option value="7">Country</option>
										</select> &nbsp; <input type="text" size="30" id="searchText" /> <a
											href="#" target="_self"><img src="img/search.gif"
											border="0" onclick="searchBankBranch()" /></a>
										</td>
										
										<td  valign="bottom" align="right">
											<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
										</td>
										
									</tr>

									<tr>
										<td colspan="2">
										<hr />
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<table width="100%" border="0" cellpadding="0" cellspacing="0"
											class="tblInfo">
											<thead>
												<tr>
													<td width="5%">S/N</td>
													<td width="10%">Branch Code</td>
													<td width="15%">Branch Name</td>
													<td width="10%">Bank Code</td>
													<td width="15%">Bank Name</td>
													<td width="15%">Address</td>
													<td width="10%">City</td>
													<td width="10%">State</td>
													<td width="10%">Region</td>
													<td width="10%">Country</td>
													<td width="10%">Action</td>
												</tr>
											</thead>
											<tbody>
												<logic:greaterThan name="listSize" value="0">
													<logic:iterate id="OB" name="OtherBranchList"
														type="com.integrosys.cms.app.otherbranch.bus.OBOtherBranch"
														scope="page">
														<%
					                                       String rowClass="";
					                                       sno++;
					                                      if(sno%2!=0){
					                                           rowClass="odd";
					                                       }else{
					                                           rowClass="even";
					                                       }
					
					                          			%>
														<tr class="<%=rowClass%>">
															<% branchId =Long.toString(OB.getId()); %>
															<td class="index"><%=sno%></td>

															<td><%=OB.getOtherBranchCode()%></td>

															<td><%=OB.getOtherBranchName()%></td>


															<td><%=OB.getOtherBankCode().getOtherBankCode() %></td>

															<td><%=OB.getOtherBankCode().getOtherBankName()%></td>

															<td><%=OB.getAddress()%></td>

															<td><%=OB.getCity()%></td>

															<td><%=OB.getState()%></td>

															<td><%=OB.getRegion()%></td>

															<td><%=OB.getCountry()%></td>


															<td><select name="chooseAction"
																onchange="MM_jumpMenu('self',this,0)">
																<option value="#" selected="selected">Please Select</option>

																<option
																	value="OtherBranch.do?event=view_other_branch_by_index&BranchId=<%=branchId %>">View</option>

																<option
																	value="OtherBranch.do?event=prepare_edit_branch&BranchId=<%=branchId %>">Edit</option>

																<option
																	value="OtherBranch.do?event=prepare_maker_submit_remove_branch&BranchId=<%=branchId %>">Delete</option>

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
							</fieldset>
					</table>
					</div>
					</td>
				</tr>

			</table>

			</td>
		</tr>
	</html:form>
</table>
</body>
</html>


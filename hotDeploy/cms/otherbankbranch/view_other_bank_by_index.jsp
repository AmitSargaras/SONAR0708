<%@ page import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankForm"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.IOtherBank"%>

<%
	OtherBankForm otherBankForm = (OtherBankForm) request
			.getAttribute("OtherBankForm");
	String loginUser = (String) request.getAttribute("loginUser");
	String event = (String) request.getAttribute("event");
	String flag = (String) request.getAttribute("flag");	
	String BCode = (String) request.getAttribute("BranchCode");
	String BName = (String) request.getAttribute("BranchName");
	String BState = (String) request.getAttribute("State");
	String BCity = (String) request.getAttribute("City");
	
	String branchId = null;
	pageContext.setAttribute("OtherBankObj", otherBankForm);
	String BankId = otherBankForm.getId();
	int listSize = 0;
	int sno = 0;
	
	SearchResult notificationList = (SearchResult)request.getAttribute("otherBranchList");
	
	
	Collection resultList = null;
	if (notificationList != null) {
		resultList = notificationList.getResultList();
		listSize = resultList.size();		
		pageContext
				.setAttribute("listSize", Integer.toString(listSize));
		pageContext.setAttribute("OtherBranchList", resultList);
	}

	pageContext.setAttribute("event", event);
	int startIndex = 0;
	String ind = (String) request.getAttribute("startIndex");
	if (ind != null && (!ind.equals("")))
		startIndex = Integer.parseInt(ind);
	
	
	int startIndx = 0;
	String indx = (String) request.getAttribute("startIndx");
	if (indx != null && (!indx.equals("")))
		startIndx = Integer.parseInt(indx);
	
	String pageUrl = "OtherBank.do?event=paginate_branch&BankId="+BankId+"&BranchCode="+BCode+"&BranchName="+BName+"&State="+BState+"&City="+BCity+"&startIndx=";
%> 

<%
String actionStr1 = "com.integrosys.cms.ui.otherbankbranch.OtherBankAction";
	String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
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

	function submitPage (idx) {
		if(<%=flag%>==true){
			alert("Please delete all the branches present for this bank first");
		}else{
			var chk = window.confirm("Are you sure?");
			if(chk==true){
				document.forms[0].action="OtherBank.do?event=maker_submit_remove&BankId="+idx;
				document.forms[0].submit();
			}	
		}	
	}

	function searchBankBranch()
    {	
	    var BankId = document.getElementById("id").value;
	    var BranchCode = document.getElementById("txtBranchCode").value;
        var BranchName = document.getElementById("txtBranchName").value;
        var State = document.getElementById("txtState").value;
        var City = document.getElementById("txtCity").value;
        if(BranchCode=='' && BranchName==''&& State=='' && City==''){
	        document.forms[0].action = "OtherBank.do?event=view_other_bank_by_index&BankId="+BankId;
	        document.forms[0].submit();
        }else{
	    	document.forms[0].action  = "OtherBank.do?event=view_other_bank_by_index&BankId="+BankId+"&BranchCode="+BranchCode+"&BranchName="+BranchName+"&State="+State+"&City="+City;
		    document.forms[0].submit();
        }        
    }

	function searchCheckerBankBranch()
    {	
		var BankId = document.getElementById("id").value;
	    var BranchCode = document.getElementById("txtBranchCode").value;
        var BranchName = document.getElementById("txtBranchName").value;
        var State = document.getElementById("txtState").value;
        var City = document.getElementById("txtCity").value;
        if(BranchCode=='' && BranchName==''&& State=='' && City==''){
	        document.forms[0].action = "OtherBank.do?event=checker_view_other_bank&BankId="+BankId;
	        document.forms[0].submit();
        }else{
	    	document.forms[0].action  = "OtherBank.do?event=checker_view_other_bank&BankId="+BankId+"&BranchCode="+BranchCode+"&BranchName="+BranchName+"&State="+State+"&City="+City;
		    document.forms[0].submit();
        }        
    }
	
	function addNew() {
		var bankCode = document.getElementById("otherBankCode").value;
		var bankName = document.getElementById("otherBankName").value;
		var bankId = document.getElementById("id").value;
	    document.forms[0].action = "OtherBranch.do?event=prepare_create_other_bank_branch&otherBankId="+bankId+"&otherBankCode="+bankCode+"&otherBankName="+bankName;
	    document.forms[0].submit();
	}

	function uploadValuationAgency() {
		var bankId = document.getElementById("id").value;
		document.forms[0].action="OtherBranch.do?event=maker_prepare_upload_other_bankbranch&otherBankId="+bankId;
		    document.forms[0].submit();
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
	<html:form action="OtherBank.do">
		<input type="hidden" name="startIndex" />
		<input type="hidden" name="startIndx" />

		<html:hidden name="OtherBankForm" property="otherBankCode" styleId="otherBankCode" />
		<html:hidden name="OtherBankForm" property="otherBankName" styleId="otherBankName" />
		<html:hidden name="OtherBankForm" property="address" styleId="address" />
		<html:hidden name="OtherBankForm" property="city"  styleId="city" />
		<html:hidden name="OtherBankForm" property="state"  styleId="state"/>
		<html:hidden name="OtherBankForm" property="region"  styleId="region" />
		<html:hidden name="OtherBankForm" property="country"  styleId="country" />
		<html:hidden name="OtherBankForm" property="contactNo"  styleId="contactNo" />
		<html:hidden name="OtherBankForm" property="contactMailId" styleId="contactMailId" />
		<html:hidden name="OtherBankForm" property="id" styleId="id" />
		<html:hidden name="OtherBankForm" property="createdBy"  styleId="createdBy" />
		<html:hidden name="OtherBankForm" property="lastUpdateBy"  styleId="lastUpdateBy" />
		<html:hidden name="OtherBankForm" property="lastUpdateDate"  styleId="lastUpdateDate" />
		<html:hidden name="OtherBankForm" property="status"  styleId="status" />
		<html:hidden name="OtherBankForm" property="deprecated"  styleId="deprecated" />
		<html:hidden name="OtherBankForm" property="faxNo"  styleId="faxNo" />
		<html:hidden name="OtherBankForm" property="versionTime"  styleId="versionTime" />
		
		<html:hidden name="OtherBankForm" property="cityId"  styleId="cityId" />
		<html:hidden name="OtherBankForm" property="stateId"  styleId="stateId" />
		<html:hidden name="OtherBankForm" property="regionId"  styleId="regionId" />
		<html:hidden name="OtherBankForm" property="countryId"  styleId="countryId" />
		
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
							<%if(event.equals("prepare_maker_submit_remove")){ %>
							<h3>Delete Other Bank</h3>
							<%}else{ %>
							<h3>View Other Bank</h3>
							<%} %>
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
													<td class="fieldname">Bank Code</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getOtherBankCode()%>" /></td>
													<td class="fieldname" width="15%">Bank Name</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getOtherBankName()%>" /></td>
												</tr>
												<tr class="odd">
													<td class="fieldname" width="15%">Address</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getAddress()%>" /></td>
													<td class="fieldname">City</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getCity()%>" /></td>
												</tr>
												<tr class="even">
													<td class="fieldname">State</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getState()%>" /></td>
													<td class="fieldname">Region</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getRegion()%>" /></td>
												</tr>
												<tr class="odd">
													<td class="fieldname">Country</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getCountry()%>" /></td>
													<td class="fieldname">Telephone No.</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getContactNo()%>" /></td>
												</tr>
												<tr class="even">
													<td class="fieldname">Bank email ID</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getContactMailId()%>" /></td>
													<td class="fieldname">Fax No</td>
													<td><integro:empty-if-null value="<%=otherBankForm.getFaxNo()%>" /></td>
												</tr>
												<tr class="even">
													<td class="fieldname">Status</td>
													<td><%= otherBankForm.getStatus().equalsIgnoreCase("ACTIVE")?"ENABLED":"DISABLED"%></td>
													<td class="fieldname">&nbsp;</td>
													<td>&nbsp;</td>
												</tr>
											</tbody>

										</table>
										</td>
									</tr>
							</table>
					</table>
					
					<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:0">
						<tr >
							<%
									
									if (!event.equalsIgnoreCase("checker_view_other_bank")) {
										
									%>
							<td ><br /><font size="2">
								Branch Code :  <html:text size="25" property="txtBranchCode" styleId="txtBranchCode" maxlength="30"/> &nbsp;&nbsp; 
								Branch Name :  <html:text size="25" property="txtBranchName" styleId="txtBranchName"  maxlength="50"/> &nbsp;&nbsp;
								State :  <html:text size="25" property="txtState" styleId="txtState" maxlength="30"/> &nbsp;&nbsp; 
								City :  <html:text size="25" property="txtCity" styleId="txtCity" maxlength="30" />&nbsp;&nbsp;</font>
								<a href="#" target="_self"><img src="img/search.gif" border="0"
								onclick="searchBankBranch()" /></a></td>
								
								<html:hidden property="txtBranchCode" value="<%=BCode %>"/>
								<html:hidden property="txtBranchName" value="<%=BName %>"/>
								<html:hidden property="txtState" value="<%=BState %>"/>
								<html:hidden property="txtCity" value="<%=BCity %>"/>
							<%}else{ %>
								<td ><br /><font size="2">
								Branch Code :  <html:text size="25" property="txtBranchCode" styleId="txtBranchCode" maxlength="30"/> &nbsp;&nbsp; 
								Branch Name :  <html:text size="25" property="txtBranchName" styleId="txtBranchName" maxlength="50"/> &nbsp;&nbsp;
								State :  <html:text size="25" property="txtState" styleId="txtState" maxlength="30"/> &nbsp;&nbsp; 
								City :  <html:text size="25" property="txtCity" styleId="txtCity" maxlength="30" />&nbsp;&nbsp;</font>
								<a href="#" target="_self"><img src="img/search.gif" border="0"
								onclick="searchCheckerBankBranch()" /></a></td>
								
								<html:hidden property="txtBranchCode" value="<%=BCode %>"/>
								<html:hidden property="txtBranchName" value="<%=BName %>"/>
								<html:hidden property="txtState" value="<%=BState %>"/>
								<html:hidden property="txtCity" value="<%=BCity %>"/>
							<%} %>
							
						</tr>
						
						<tr>
							<td><html:errors property="searchTextError"/></td>
						</tr>
								
						<tr>
							<td align="center">
							<br />
							<fieldset>
							<table width="100%">
								<tr>
									<td>
									<h3>Bank Branch Details</h3>
									</td>
								</tr>
								<tr>
									<td colspan="2">
									<hr />
									</td>
								</tr>
								<%
									
									if (!event.equalsIgnoreCase("checker_view_other_bank")&&!event.equalsIgnoreCase("prepare_maker_submit_remove")) {
										
									%>	
								<tr>
									<td  valign="bottom" align="right">
											<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
										    <input type="button" name="Submit" value="Upload" class="btnNormal" onclick="uploadValuationAgency()"/>
							
										</td>
								</tr>
								<% } %>
								
								<tr>
									<td colspan="2">
									<table width="100%" border="0" cellpadding="0" cellspacing="0"
										class="tblInfo" align="center">
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
												<td width="10%">Status</td>
												<td width="10%">Action</td>
											</tr>
										</thead>
										<tbody>
											<%
											sno = startIndx;
											%>
											<logic:greaterThan name="listSize" value="0">
												<logic:iterate id="OB" name="OtherBranchList"
													type="com.integrosys.cms.app.otherbranch.bus.OBOtherBranch"
													scope="page"
													length="10" offset="<%=String.valueOf(startIndx) %>">
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
															branchId = Long.toString(OB.getId());
														%>
														<td class="index"><%=sno%></td>

														<td><integro:empty-if-null value="<%=OB.getOtherBranchCode()%>" /></td>

														<td><integro:empty-if-null value="<%=OB.getOtherBranchName()%>" /></td>


														<td><%=OB.getOtherBankCode()==null?"&nbsp;":OB.getOtherBankCode().getOtherBankCode()%></td>

														<td><%=OB.getOtherBankCode()==null?"&nbsp;":OB.getOtherBankCode().getOtherBankName()%></td>
																			
														<td><integro:empty-if-null value="<%=OB.getAddress()%>" /></td>
														
														<td><%=OB.getCity()==null?"&nbsp;":OB.getCity().getCityName()%></td>

														<td><%=OB.getState()==null?"&nbsp;":OB.getState().getStateName()%></td>

														<td><%=OB.getRegion()==null?"&nbsp;":OB.getRegion().getRegionName()%></td>

														<td><%=OB.getCountry()==null?"&nbsp;":OB.getCountry().getCountryName()%></td>
														
														<td><% if(OB.getStatus().equals("ACTIVE")){%>Enable
                                 						<%}else{ %>Disable<%}%></td>


														<td><select name="chooseAction"
															onchange="MM_jumpMenu('self',this,0)">
															<option value="#" selected="selected">Please
															Select</option>
															
															<%
									
															if (event.equalsIgnoreCase("checker_view_other_bank")) {
															%>			
															<option
																value="OtherBranch.do?event=checker_view_other_branch&BranchId=<%=branchId%>&startIndx=<%=startIndx%>">View</option>
															
															<%}else if(event.equals("prepare_maker_submit_remove")){  %>
															
															<option
																value="OtherBranch.do?event=view_other_branch_by_index_delete&BranchId=<%=branchId%>&startIndx=<%=startIndx%>">View</option>					

															<option
																value="OtherBranch.do?event=prepare_maker_submit_remove_branch_delete&BranchId=<%=branchId%>">Delete</option>
															<% } else{%>
																<option
																value="OtherBranch.do?event=view_other_branch_by_index&BranchId=<%=branchId%>&startIndx=<%=startIndx%>">View</option>
															
															<option
																value="OtherBranch.do?event=prepare_edit_branch&BranchId=<%=branchId%>">Edit</option>

															<option
																value="OtherBranch.do?event=prepare_maker_submit_remove_branch&BranchId=<%=branchId%>">Delete</option>
															<%} %>
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
								<%
									if (notificationList != null) {
								%>
								<tr>
									<td height="25">
									<table id="generalPurposeBar" width="100%" border="0"
										cellspacing="0" cellpadding="5" align="center">
										<tr>
											<td valign="middle"><integro:pageindex 
												pageIndex="<%=new PageIndex(startIndx, 10, listSize)%>"
												url="<%=pageUrl %>" />
											</td>
										</tr>
									</table>
									</td>
								</tr>
								<%
									}
								%>
							</table>
							</fieldset>
							</td>
						</tr>
						
					</table>

				
					<table width="150" border="0" align="center" cellpadding="0"
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
								onClick="submitPage('<%=BankId%>')"><img
								src="img/delete1.gif" name="Image3311" border="0" id="Image3311" /></a></td>
							<td width="100" valign="baseline" align="center"><a
								href="OtherBank.do?event=view_other_bank&startIndex=<%=startIndex%>"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img
								src="img/cancel1.gif" name="Image4411" border="0" id="Image4411" /></a>

							</td>
						</tr>

						<%
							} else {
								if (!event.equalsIgnoreCase("checker_view_other_bank")) {
						%>
						<tr align="center">
							<td width="100" valign="baseline" align="center"><a
								href="OtherBank.do?event=view_other_bank&startIndex=<%=startIndex%>"
								onmouseout="MM_swapImgRestore()"
								onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
								src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
							</td>
						</tr>
						<%
								}else{
									%>
									<tr align="center">
										<td width="100" valign="baseline" align="center"><a
											href="OtherBank.do?event=checker_list_other_bank&startIndex=<%=startIndex%>"
											onmouseout="MM_swapImgRestore()"
											onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img
											src="img/return1.gif" name="Image4411" border="0" id="Image4411" /></a>
										</td>
									</tr>
									<%			
								}
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


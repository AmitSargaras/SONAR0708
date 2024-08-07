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
<%@page import="java.util.List"%>
<%@page import="java.util.Collection"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankForm"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.IOtherBank"%>
<%
	SearchResult notificationList = (SearchResult) request.getAttribute("otherBankList");
	
	String bankId = (String) request.getAttribute("otherBankId");
	String bankCode = (String) request.getAttribute("otherBankCode");
	String bankName = (String) request.getAttribute("otherBankName");
	
	IOtherBank otherBank = (IOtherBank) request.getAttribute("otherBank");
	long BankId = Long.parseLong(bankId);
	Collection resultList = null;
	int listSize = 0;
	if (notificationList != null) {
		resultList = notificationList.getResultList();
		listSize = resultList.size();
		pageContext.setAttribute("listSize", Integer.toString(listSize));
		pageContext.setAttribute("OtherBankList", resultList);
	}	
	
	
	String context = request.getContextPath() + "/";
	System.out.println("************************************ "
			+ context);

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	System.out.println("************************************ "
			+ basePath);
	List list = (ArrayList) request.getAttribute("cityList");

	System.out.println("************************************ "
			+ list.size());
%> 

<html>
<head>

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/javascript"
	src="<%=context%>js/itgUtilities.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<link href="<%=context%>css/smartlender-print.css" media="print"
	rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript"><!--

	function MM_jumpMenu(targ,selObj,restore){ //v3.0
	  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
	  if (restore) selObj.selectedIndex=0;
	 
	}

	function refreshRegionId(dropdown)
	{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 if(curSel==""){
			clearDisplayDropdown('branchStateId');
			clearDisplayDropdown('branchCityId');
	}
	 var dep = 'branchRegionId';
	 var url = '/cms/OtherBank.do?event=refresh_region_id&countryId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}
	function refreshStateId(dropdown)
	{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 if(curSel==""){
			clearDisplayDropdown('branchCityId');
	}
	 var dep = 'branchStateId';
	 var url = '/cms/OtherBank.do?event=refresh_state_id&regionId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}
	
	function refreshCityId(dropdown)
	{
	 var curSel = "";
	 for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }
	 var dep = 'branchCityId';
	 var url = '/cms/OtherBank.do?event=refresh_city_id&stateId='+curSel;
	 sendLoadDropdownReq(dep, url);
	}

	function submitPage() {
		document.forms[0].action="OtherBranch.do?event=maker_submit_create_other_bank_branch";
		document.forms[0].submit();
	}
		
	function savePage() {
		document.forms[0].action="OtherBranch.do?event=maker_save_create_other_bank_branch";
		document.forms[0].submit();
	}

</script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0"
	cellspacing="0">
	
	<html:form action="OtherBranch.do">
	<input type="hidden" name="otherBankId" value="<%=bankId %>" />
	<input type="hidden" name="otherBankCode" value="<%=bankCode %>" />
	<input type="hidden" name="otherBankName" value="<%=bankName %>" />
		<tr>

			<td width="100%" height="100%" valign="bottom">
			<table width="100%" height="100%" border="0" align="center"
				cellpadding="0" cellspacing="0" class="tblFormSection"
				id="contentWindow">
				<tr>
					<td>
					<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Branch Details:Add</h3>
					</td>
				</tr>
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
													<td><%=bankCode %></td>
													<td class="fieldname" width="15%">Bank Name</td>
													<td><%=bankName %></td>
												</tr>

												<tr class="odd">
													<td class="fieldname">Branch Code </td>
													<td><html:text property="otherBranchCode" maxlength="30" style="background:#B4CFEC" disabled="true"/> <html:errors
														property="otherBranchCodeError" /></td>
													<td class="fieldname" width="15%">Branch Name <font
														color="red">*</font>
													<br/><bean:message key="error.string.branch.name"/></td>
													<td><html:text property="otherBranchName"
														maxlength="50" /> <html:errors
														property="otherBranchNameError" /></td>

												</tr>

												<tr class="even">
													<td class="fieldname" width="15%">RBI Code</td>
													<td><html:text name="OtherBranchForm"
														property="branchRbiCode" maxlength="9"></html:text> <html:errors
														property="branchRbiCodeError" /></td>
													<td class="fieldname" width="15%">&nbsp;</td>
													<td>&nbsp;</td>
												</tr>

												<tr class="odd">
													<td class="fieldname" width="15%">Address</td>
													<td><html:textarea name="OtherBranchForm" property="branchAddress" cols="45" rows="5"></html:textarea> 
													<html:errors property="branchAddressError" /></td>
													<td class="fieldname">Country</td>
													<td><html:select name="OtherBranchForm"
														property="branchCountryId"
														onchange="javascript:refreshRegionId(this)">
														<option value="">Please Select</option>
														<html:options collection="countryList"
															labelProperty="label" property="value" />
													</html:select></td>
												</tr>

												<tr class="even">
													<td class="fieldname">Region</td>
													<td><html:select name="OtherBranchForm"
														property="branchRegionId"
														onchange="javascript:refreshStateId(this)">
														<option value="">Please Select</option>
														<html:options collection="regionList"
															labelProperty="label" property="value" />
													</html:select></td>

													<td class="fieldname">State</td>
													<td><html:select name="OtherBranchForm"
														property="branchStateId"
														onchange="javascript:refreshCityId(this)">
														<option value="">Please Select</option>
														<html:options collection="stateList" labelProperty="label"
															property="value" />
													</html:select></td>
												</tr>
												<tr class="odd">
													<td class="fieldname">City</td>
													<td width="25%"><html:select name="OtherBranchForm"
														property="branchCityId">
														<option value="">Please Select</option>
														<html:options collection="cityList" labelProperty="label"
															property="value" />
													</html:select></td>
													
													<td class="fieldname">Telephone Number</td>
													<td><html:text name="OtherBranchForm"
														property="branchContactNo" maxlength="15" /> <html:errors
														property="branchContactNoError" /></td>
												</tr>
												<tr class="even">
													<td class="fieldname">Bank email ID</td>
													<td><html:text name="OtherBranchForm"
														property="branchContactMailId" maxlength="50"></html:text>
													<html:errors property="branchContactMailIdError" /></td>
													<td class="fieldname">Fax no.</td>
													<td><html:text name="OtherBranchForm"
														property="branchFaxNo" maxlength="15" /> <html:errors
														property="branchFaxNoError" /></td>
												</tr>
												<tr class="even">  
												  <td class="fieldname" >Status</td>
								                  <td>
								                  	<input type="radio" name="status" checked="checked" value="ACTIVE" disabled="disabled"><%=ICMSConstant.STATE_ENABLE.toString()%></input>
								                  	<input type="radio" name="status" value="INACTIVE" disabled="disabled"><%=ICMSConstant.STATE_DISABLE.toString()%></input>
								                  </td>
								                  <td class="fieldname">&nbsp;</td>
								                  <td>&nbsp;
								                  </td>
								                </tr>
											</tbody>

										</table>
										</td>
									</tr>
							</table>
					</table>
					<table width="150" border="0" align="center" cellpadding="0"
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
								href="OtherBank.do?event=view_other_bank_by_index&BankId=<%=BankId %>"
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
		</tr>`
</html:form>
</table>
</body>
</html>


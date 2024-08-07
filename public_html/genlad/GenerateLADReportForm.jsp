<%@page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer"%>
<%@page
	import="com.integrosys.cms.app.systemBankBranch.bus.OBSystemBankBranch"%>
<%@page
	import="com.integrosys.component.user.app.bus.OBSearchCommonUser"%>
<%@page
	import="com.integrosys.cms.app.customer.bus.OBCustomerSearchResult"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>
<%@page import="com.integrosys.cms.ui.poi.report.ReportForm"%>
<%@ page
	import="com.integrosys.component.notification.bus.INotification,com.integrosys.base.businfra.search.SearchResult,com.integrosys.base.uiinfra.tag.PageIndex,java.util.ArrayList,com.integrosys.component.notification.bus.OBNotification,com.integrosys.base.techinfra.logger.DefaultLogger,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="java.util.*"%>
<%@page import="com.integrosys.cms.ui.otherbankbranch.OtherBankAction"%><html>

<head>
<%
	String context = request.getContextPath() + "/";
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	List departmentList = new ArrayList();
	pageContext.setAttribute("departmentList", departmentList);

	List managerList = new ArrayList();
	pageContext.setAttribute("managerList", managerList);

	List relationshipMgrList = (List) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.relationshipMgrList");
	pageContext
			.setAttribute("relationshipMgrList", relationshipMgrList);

	String searchCustomerName = (String) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.searchCustomerName");

	if (searchCustomerName != null) {
		pageContext.setAttribute("searchCustomerName",
				searchCustomerName);
	} else {
		searchCustomerName = "";
		pageContext.setAttribute("searchCustomerName", "");
	}

	String segment = (String) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.segment");

	String filePath = (String) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.filePath");
	if (segment != null) {
		pageContext.setAttribute("segment", segment);
	} else {
		segment = "";
		pageContext.setAttribute("segment", "");
	}

	List dateList = (List) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.dateList");
	pageContext.setAttribute("dateList", dateList);

	List yearList = (List) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.yearList");
	pageContext.setAttribute("yearList", yearList);

	String dateValue = (String) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.dateValue");
	pageContext.setAttribute("dateValue", dateValue);

	String isRecordAvailable = (String) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.isRecordAvailable");
	pageContext.setAttribute("isRecordAvailable", isRecordAvailable);

	String recordAlreadyPresent = (String) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.recordAlreadyPresent");
	pageContext.setAttribute("recordAlreadyPresent",
			recordAlreadyPresent);

	String currentYear = (String) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.currentYear");
	pageContext.setAttribute("currentYear", currentYear);

	String dueMonth = (String) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.dueMonth");
	if (dueMonth != null) {
		dateValue = dueMonth;
		pageContext.setAttribute("dateValue", dateValue);
	} else {
		dueMonth = "";
		pageContext.setAttribute("dateValue", dueMonth);
	}

	String dueYear = (String) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.dueYear");
	if (dueYear != null) {
		currentYear = dueYear;
		pageContext.setAttribute("currentYear", dueYear);
	} else {
		dueYear = "";
		pageContext.setAttribute("currentYear", dueYear);
	}

	Boolean isRMUser = (Boolean) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.isRMUser");
	pageContext.setAttribute("isRMUser", isRMUser);
	
	System.out.println("isRMUser:"+isRMUser);
	List resultList = (List) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.resultList");
	pageContext.setAttribute("resultList", resultList);

	String isRMValue = "";

	if (isRMUser) {
		isRMValue = (String) session
				.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.isRMValue");
		pageContext.setAttribute("isRMValue", isRMValue);
	} else {
		isRMValue = (String) session
				.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.relationshipMgr");
		pageContext.setAttribute("isRMValue", isRMValue);
	}
	
	if(null==isRMValue){
		isRMValue="";
	}
	System.out.println("isRMValue:"+isRMValue);
	OBCustomerSearchResult searchResult = (OBCustomerSearchResult) session
			.getAttribute("com.integrosys.cms.ui.genlad.GenerateLADAction.customerObject");

	org.apache.struts.action.ActionErrors errors = (org.apache.struts.action.ActionErrors) (request
			.getAttribute("org.apache.struts.action.ERROR"));
%>
<link rel="stylesheet" type="text/css" media="all"
	href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/validation.js"></script>
<script type="text/javascript" src="<%=context%>js/ajaxDropdown.js"></script>
<script language="JavaScript" type="text/JavaScript">
	function searchCustomer() { //v3.0

		if (document.forms[0].searchCustomerName.value == ""
				|| document.forms[0].searchCustomerName.value == null) {
			alert("Please enter customer name to search.");
			return;
		}
		
			if (document.forms[0].searchCustomerName.value.length<3) {
			alert("The Valid range for a party name is between 3 and 50.");
			return;
		}

		document.forms[0].event.value = "list";
		document.forms[0].submit();
	}

	function submitReport() { //v3.0
		var select = document.forms[0].relationshipMgrId;

		var relationshipManager = select.options[select.selectedIndex].text;
		var relationshipManagerId = select.options[select.selectedIndex].value;
		
		document.forms[0].action = "GenerateLAD.do?event=generate_report&relationshipManagerId="+relationshipManagerId+"&relationshipManagerName="+relationshipManager;		
		//document.forms[0].relationshipMgr.value = relationshipManager;
		//document.forms[0].event.value = "generate_report";
		document.forms[0].submit();

	}

	function refresh() {
		document.forms[0].event.value = "lad_report";
		document.forms[0].submit();

	}
</script>
</head>
<body>
	<br>
	<br>
	<table width="70%" border="0" cellpadding="0" cellspacing="0"
		align="center" class="tblInfo">
		<html:form action="GenerateLAD.do">


			<tr class="even">
				<td><html:hidden property="event" /></td>
				<td><html:hidden property="relationshipMgr" /></td>
			</tr>

			<tr class="even">
				<td class="fieldname" width="30%">RM Name</td>
				<td width="70%"><html:select name="GenerateLADForm"
						property="relationshipMgrId" style="width:250px"
						value="<%=isRMValue%>" disabled="<%=isRMUser%>">
						<option value="">Please Select</option>
						<html:options collection="relationshipMgrList"
							labelProperty="label" property="value" />
					</html:select></td>
			</tr>

			<br>

			<tr class="even">
				<td class="fieldname" width="%30">Party Name</td>
				<td width="%70"><input type="text" name="searchCustomerName"
					value="<%=searchCustomerName%>" /> &nbsp;&nbsp;&nbsp; <input
					class="btnNormal" id="searchCustomerButton" type="button"
					value="Search Party" onclick="searchCustomer()" /> &nbsp; <html:errors
						property="customerNameError" /> &nbsp; <html:errors
						property="filterPartyError" /></td>
			</tr>



			<tr>
				<td colspan="2">

					<div id="partyDet">
						<%
							if (searchResult != null) {
						%>

						<table width="80%" class="tblFormSection" border="0"
							align="center" cellpadding="0" cellspacing="0" id="custsearch"
							style="margin-top: 15px">
							<tr>
								<td>
									<table width="100%" class="tblinfo" style="margin-top: 0"
										border="0" cellspacing="0" cellpadding="0">
										<thead>
											<tr align="center">
												<td colspan="2" align="center">Selected Customer
													Details</td>
											</tr>
											<tr>
												<td width="18%"><bean:message
														key="label.list.party.name" /><br /></td>
												<td width="11%"><bean:message key="label.list.party.id" /><br />
											</tr>

										</thead>
										<tbody>

											<tr class="even">
												<td><integro:htmltext
														value="<%=searchResult.getCustomerName()%>" />&nbsp;<br>
												</td>

												<td><integro:empty-if-null
														value="<%=searchResult.getLegalReference()%>" />&nbsp;<br>
													<html:hidden property="partyId"
														value="<%=String.valueOf(searchResult.getLegalReference())%>" />


													<html:hidden property="party"
														value="<%=String.valueOf(searchResult.getCustomerName())%>" />

												</td>

											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
						<%
							}
						%>
					</div>
				</td>
			</tr>










			<tr class="even">
				<td class="fieldname" width="30%">Due Month <font color="red">*</font></td>
				<td width="70%"><html:select name="GenerateLADForm"
						property="dueMonth" style="width:250px" value="<%=dateValue%>">
					
						<html:options collection="dateList" labelProperty="label"
							property="value" />
					</html:select></td>
			</tr>
			<tr class="even">
				<td width="30%" class="fieldname">Year <font color="red">*</font></td>
				<td width="70%"><html:select name="GenerateLADForm"
						property="dueYear" style="width:250px" value="<%=currentYear%>">
					
						<html:options collection="yearList" labelProperty="label"
							property="value" />
					</html:select></td>

			</tr>

			<tr class="even">
				<td class="fieldname" width="30%">Segment</td>
				<td width="70%"><html:select name="GenerateLADForm"
						property="segment" style="width:250px" value="<%=segment%>">
						<integro:common-code
							categoryCode="<%=CategoryCodeConstant.HDFC_SEGMENT%>" />
					</html:select> <br> <html:errors property="customerSegmentError" /></td>

			</tr>


			<table width="150" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="85">&nbsp;</td>
					<td width="65">&nbsp;</td>
				</tr>
				<tr>


					<td width="65"><input class="btnNormal" id="Image3"
						type="button" value="Generate LAD" onclick="submitReport();this.value='Generating..';this.disabled=true;" /></td>
					<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
					<td>&nbsp</td>
					<td width="65"><input class="btnNormal" id="Image3"
						type="button" value="Refresh" onclick="refresh();this.value='Refreshing..';this.disabled=true;" /></td>

				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>

			<%
				if (resultList != null && !resultList.isEmpty()) {
			%>

			<table width="100%" class="tblinfo" style="margin-top: 0" border="0"
				cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<td width="3%"><bean:message key="label.global.sn" /></td>
						<td width="15%"><bean:message key="label.rm.name" /></td>
						<td width="15%"><bean:message key="label.ladparty.name" />
						<td width="15%"><bean:message key="label.party.duemonth" />
						<td width="15%"><bean:message key="label.party.dueyear" />
						<td width="15%"><bean:message key="label.segment" />
						<td width="15%"><bean:message
								key="label.party.reportgeneratedate" />
						<td width="15%"><bean:message key="label.status" /></td>
						<td width="15%"><bean:message key="label.total.records" /></td>
						<td width="15%"><bean:message key="label.file.name" /></td>
						<td width="15%"><bean:message key="label.download" /></td>
					</tr>






				</thead>
				<tbody>


					<%
						int count = 1;
								for (Iterator iterator = resultList.iterator(); iterator
										.hasNext();) {
									Map partyMap = (Map) iterator.next();
									String rm_name = (String) partyMap.get("RM_NAME");
									String party_name = (String) partyMap.get("PARTY_NAME");

									String due_month = (String) partyMap.get("DUE_MONTH");
									String due_year = (String) partyMap.get("DUE_YEAR");
									String report_generation_date = (String) partyMap
											.get("REPORT_GENERATE_DATE");
									String segment_val = (String) partyMap.get("SEGMENT");
									String status = (String) partyMap.get("STATUS");
									String total_records = (String) partyMap
											.get("TOTAL_RECORDS");

									String report_name = (String) partyMap
											.get("REPORT_NAME");

									String zipath = "/cms/ladDocument/" + report_name;
									String className = "even";
									if (count % 2 != 0) {
										className = "odd";
									}
					%>

					<tr class=<%=className%>>
						<td width="3%"><center>
								<integro:empty-if-null value="<%=count++%>" />
							</center></td>
						<td width="15%"><integro:empty-if-null value="<%=rm_name%>" /></td>
						<td width="15%"><integro:empty-if-null
								value="<%=party_name%>" /></td>
						<td width="15%"><integro:empty-if-null value="<%=due_month%>" /></td>
						<td width="15%"><integro:empty-if-null value="<%=due_year%>" /></td>
						<td width="15%"><integro:empty-if-null
								value="<%=segment_val%>" /></td>
						<td width="15%"><integro:empty-if-null
								value="<%=report_generation_date%>" /></td>
						<td width="15%"><integro:empty-if-null value="<%=status%>" /></td>
						<td width="15%"><center>
								<integro:empty-if-null value="<%=total_records%>" />
							</center></td>
						<td width="15%"><integro:empty-if-null
								value="<%=report_name%>" /></td>
						<%
							if (status.equals("Success") ||status.equals("Partial Success")) {
						%>
						<td width="15%"><a href=<%=zipath%>>download</a></td>
						<%-- 	<td width="15%"><a href="<%="/"+filePath%>">download</a></td> --%>
						<%
							} else {
						%>
						<td width="15%"><integro:empty-if-null value="download" /></td>
						<%
							}
						%>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
			<%
				}
			%>

			<%
				if (isRecordAvailable != null && isRecordAvailable.equals("N")) {
			%>
			<script>
				alert("No record Found");
			</script>
			<%
				} else if (isRecordAvailable != null
							&& isRecordAvailable.equals("Y")
							&& recordAlreadyPresent != null
							&& recordAlreadyPresent.equals("Y")) {
							
			%>
			<script>
				alert("Records already created");
			</script>
			<%
				}
			%>


		</html:form>
</body>
</html>


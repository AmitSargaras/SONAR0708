<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.base.techinfra.beanloader.BeanController,
				com.integrosys.base.techinfra.propertyfile.PropertyManager,
				com.integrosys.base.techinfra.util.DateUtil"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
  
  
<html>
<head>
<title>View Transaction Status</title>
<%@ include file="/console/console_include.jsp" %>

<%
	String trxType = request.getParameter("trxType");
	String trxDate = request.getParameter("trxDate");
	String status = request.getParameter("status");
	String reference_id = request.getParameter("reference_id");
	String hostAANum = request.getParameter("hostAANum");
	boolean isFirstTime = (trxType == null && trxDate == null && status == null && 
			reference_id == null && hostAANum == null);
	
	String queryStatus = "";
	
	if (reference_id == null || reference_id.equals("null")) reference_id = "";
	if (trxDate == null || trxDate.equals("null")) trxDate = "";
	if (hostAANum == null || hostAANum.equals("null")) hostAANum = "";
	
	if (status != null && status.trim().length() > 0) 
	{
		if (status.equals("PENDING_CHECKER")) {
			queryStatus = "'PENDING_UPDATE', 'PENDING_CREATE', 'PENDING_DELETE', 'PENDING_RETRY'";
		} else {
			queryStatus = "'"+status+"'";
		}
	} 

	int recordsPerPage = 100;

	String datasourcename = PropertyManager.getValue("dbconfig.db1.name", "CMSPool");
	String schema = "";

	long startIndex = 0;
	long endIndex = 10;	
	Properties connProperties = null;

    try {
		String queryStr = "select transaction_id, from_state, status, transaction_type, transaction_subtype, "
			+" transaction_date, reference_id, staging_reference_id, team_id, "
			+" (select t.ABBREVIATION from cms_team t where t.TEAM_ID = trx.team_id) as team_name, "
			+" opsdesc, legal_name, legal_id, customer_name, customer_id, "
			+" limit_profile_ref_num, user_info, cur_trx_history_id "
			+" from transaction trx "
			+" where 1 = 1 ";
		
		if (trxDate != null && trxDate.length() > 0) {
			queryStr += " and date(transaction_date) = date('"+trxDate+"') ";
		/*	
		} else if ((trxType == null || trxType.length() == 0) &&
				(queryStatus == null || queryStatus.length() == 0)){
			queryStr += " and date(transaction_date) =  current date ";
			trxDate = DateUtil.formatTime(new Date(), "yyyy-MM-dd");
		*/
		}

		if (trxType != null && trxType.length() > 0) {
			queryStr += " and transaction_type = '"+trxType+"' ";
		}
		
		if (queryStatus != null && queryStatus.length() > 0) {
			queryStr += " and status in ("+queryStatus+") ";
		}
		
		if (reference_id != null && 
				reference_id.trim().length() > 0) {
			if (trxType.equals("FACILITY")) {
				queryStr += " and reference_id = (select id "
					+" from cms_facility_master "
					+" where cms_lsp_appr_lmts_id = "+reference_id
					+" fetch first rows only)";
			} else {
				queryStr += " and reference_id = "+reference_id + " ";
			}
		}
		
		if (hostAANum != null && hostAANum.trim().length() > 0) {
			queryStr += " and limit_profile_ref_num = '"+hostAANum+"' ";
		}
		
		if (!isFirstTime)
			connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

%>
<%!
	boolean isReferenceIdEditable(String type) {
		if (type == null) return false;
		return (type.equals("LIMIT") || type.equals("COL") ||
				type.equals("CHECKLIST") || type.equals("FACILITY"));
	}
%>
<script type="text/javascript">
<!--
	<% if (!isFirstTime) { %>
	var recordsPerPage = <%=recordsPerPage%>;

	<%
		java.sql.ResultSet rs = (java.sql.ResultSet) connProperties.get("rs");
	%>

	var header = [<%=getJavascriptArrayStringForHeaderByResultSet(rs)%>];

	var data = [<%=getJavascriptArrayStringForDataByResultSet(rs)%>];

	var dataLength = data.length;
	
	<% } %>

	function showResults(num) {
		var i = 0;
		var displayDiv = document.getElementById('display');

		var tableHtmlText = [];
		tableHtmlText.push('<table class="sortable draggable" id="eaiview" width="100%">');
		tableHtmlText.push('<thead><tr>');
		
		for (i=0; i<header.length; i++) {
			tableHtmlText.push('<th onmouseleave="mouseout(this,\'header-over\')" onmouseenter="mouseover(this,\'header-over\')">');
			tableHtmlText.push(header[i]);
			tableHtmlText.push('</th>');
		}
		tableHtmlText.push('</tr></thead>');

		i=0;
		for (i=num*recordsPerPage; i<((num+1)*recordsPerPage) && i<dataLength; i++) {
			tableHtmlText.push('<tr onmouseleave="highlight_row(this,\'\')" onmouseenter="highlight_row(this,\'row-highlight\')">');
			var j=0;
			for (j=0; j<data[i].length; j++) {
				tableHtmlText.push('<td>');
				tableHtmlText.push(data[i][j]);
				tableHtmlText.push('</td>');
			}
			
			tableHtmlText.push('</tr>');
		}
		tableHtmlText.push('</table>');

		displayDiv.innerHTML = tableHtmlText.join('');
	}
	
	function preparePagesAndResults() {
		var paginationDiv = document.getElementById('pagination');
		var resultsDiv = document.getElementById('results');
		
		var pages = Math.ceil(dataLength / recordsPerPage);

		var paginationHtmlText = [];
		for (var i=0; i<pages; i++) {
			paginationHtmlText.push('<a href="javascript: showResults(');
			paginationHtmlText.push(i);
			paginationHtmlText.push(')" style="text-decoration:none">');
			paginationHtmlText.push((i+1));
			paginationHtmlText.push('</a>');
			if ((i+1) < pages) {
				paginationHtmlText.push(' | ');
			}
		}
		paginationDiv.innerHTML = "Page: " + paginationHtmlText.join('');
		
		if (dataLength == 0) {
			resultsDiv.innerHTML = '<font color="blue"><b>Sorry, there are no records found.</b></font><br><br>';
		}
		else {
			resultsDiv.innerHTML = '<font color="blue"><b>Total records found: ' + dataLength + '</b></font><br><br>';
		}
	}
	
	window.onload = function() {
		window.scrollTo(0,99999);
		<%if (isReferenceIdEditable(trxType)) { %>
		document.getElementById('ref_id').style.visibility='visible';
		<% } %>
	};

	function checkShowRefInput(objTrxType) {
		if (objTrxType == '') {
			document.getElementById('ref_id').style.visibility='hidden';	
			document.getElementById('reference_id').value='';		
		} else if (objTrxType == 'LIMIT' || objTrxType == 'COL' || 
				objTrxType == 'CHECKLIST' || objTrxType == 'FACILITY') {
			document.getElementById('ref_id').style.visibility='visible'; 
		} else {
			document.getElementById('ref_id').style.visibility='hidden';
			document.getElementById('reference_id').value='';	
		}		
	}
-->
</script>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>View Transaction Status</strong></td>
  </tr>
</table><br>





<form name="myform" action="transaction_viewer.jsp" METHOD=POST>
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="20%" align="left">Transaction Date:</td>
			<td align="left">
				<input type="text"  size="12" maxlength="10" name="trxDate" value="<%=trxDate %>"/>(yyyy-mm-dd)
			</td>
			<td width="20%" align="left">Status:</td>
			<td align="left">
				<select name="status" size="1" >
					<option value="">All</option>
					<option <%= ("ACTIVE".equals(status)) ? "selected" : "" %> value="ACTIVE">Active / Implemented</option>
					<option <%= ("DRAFT".equals(status)) ? "selected" : "" %> value="DRAFT">Save as draft</option>
					<option <%= ("REJECTED".equals(status)) ? "selected" : "" %> value="REJECTED">Rejected</option>
					<option <%= ("PENDING_CHECKER".equals(status)) ? "selected" : "" %> value="PENDING_CHECKER">Pending Checker</option>
					<option <%= ("PENDING_PERFECTION".equals(status)) ? "selected" : "" %> value="PENDING_PERFECTION">Pending Perfection</option>
				</select>
			</td>	
		</tr>
		<tr>
			<td width="20%" align="left">Transaction Type: </td>
			<td align="left">
				<select name="trxType" size="1" onchange="checkShowRefInput(this.value)">
					<option value="">All</option>
					<option <%= ("FACILITY".equals(trxType)) ? "selected" :"" %> value="FACILITY">Facility</option>
					<option <%= ("COL".equals(trxType)) ? "selected" :"" %> value="COL">Collateral</option>
					<option <%= ("CHECKLIST".equals(trxType)) ? "selected" :"" %> value="CHECKLIST">Checklist</option>
					<option <%= ("TEMPLATE".equals(trxType)) ? "selected" :"" %> value="TEMPLATE">Checklist Template</option>
					<option <%= ("USER".equals(trxType)) ? "selected" :"" %> value="USER">User</option>
					<option <%= ("TEAM".equals(trxType)) ? "selected" :"" %> value="TEAM">Team</option>
					<option <%= ("TAT_DOC".equals(trxType)) ? "selected" :"" %> value="TAT_DOC">TAT</option>
					<option <%= ("LIMIT".equals(trxType)) ? "selected" :"" %> value="LIMIT">Limit</option>
				</select>

				<td width="20%" align="left">Reference ID: </td>
				<td align="left" id="ref_id" style="visibility:hidden">
					<input type="text" id="reference_id" name="reference_id" size="25" maxlength="20" value="<%=reference_id %>"/>
				</td>
		</tr>
		<tr><td>Host AA Number: </td>
			<td><input type="text" name="hostAANum" size="30" maxlength="30" value="<%= hostAANum%>" /></td>
		</tr>
	</table>
</form>

	<center>
		<a href="javascript: document.myform.submit();"><img src="<%=request.getContextPath()%>/img/refresh1.gif" border="0"></a>
		<hr>
	</center>
	<br>

	<center>
	<div id="display"></div>
	<br>
	</center>
<hr><br>
<div id="pagination"></div>
<br>
<div id="results"></div>
<%

    } catch (Exception e) {
		e.printStackTrace(System.err);
		out.println("<font color='red'>Exception OCCURRED:" + e.getMessage() + "</font>");

    } finally {
		closeDatabaseConnection(connProperties);
		connProperties = null;
    }
    
%>

	<center>
		<hr>
		<a href="javascript: document.myform.submit();"><img src="<%=request.getContextPath()%>/img/refresh1.gif" border="0"></a>
	</center>

<script language="Javascript" type="text/javascript">
<!--
	<% if (!isFirstTime) { %>
	preparePagesAndResults();
	if (dataLength > 0) {
		showResults(0);
	}
	<% } %>
-->
</script>
</body>
</html>


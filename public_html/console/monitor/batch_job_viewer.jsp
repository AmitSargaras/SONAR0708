<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.component.user.app.bus.*,
				com.integrosys.base.techinfra.beanloader.BeanController,
				com.integrosys.component.user.app.constant.JNDIConstant,
				com.integrosys.cms.app.user.trx.*,
				com.integrosys.cms.app.user.proxy.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager
	"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
  
  
<html>
<head>
<title>View Batch Job Status</title>
<%@ include file="/console/console_include.jsp" %>

<%
	String status = request.getParameter("status");
	if ((status == null) || status.equals(""))
	{
		status = "SUCCESS";
	}

	int recordsPerPage = 100;

	String datasourcename = PropertyManager.getValue("dbconfig.db1.name", "CMSPool");
	String schema = "";

	long startIndex = 0;
	long endIndex = 10;	
	Properties connProperties = null;

    try {
		String queryStr = "select * from cms_batch_job where job_status = '" + status + "'";
		connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

%>
<script type="text/javascript">
<!--
	var recordsPerPage = <%=recordsPerPage%>;

	<%
		java.sql.ResultSet rs = (java.sql.ResultSet) connProperties.get("rs");
	%>

	var header = [<%=getJavascriptArrayStringForHeaderByResultSet(rs)%>];

	var data = [<%=getJavascriptArrayStringForDataByResultSet(rs)%>];

	var dataLength = data.length;

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
	};
-->
</script>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>View Batch Job Status</strong></td>
  </tr>
</table><br>





<form name="myform" action="batch_job_viewer.jsp" METHOD=POST>
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="80" align="left">Status:</td>
			<td align="left">
				<select name="status" size="1" onchange="javascript: document.myform.submit();">
					<option <%= ("SUCCESS".equals(status)) ? "selected" : "" %> value="SUCCESS">Success</option>
					<option <%= ("RUNNING".equals(status)) ? "selected" : "" %> value="RUNNING">Running</option>
					<option <%= ("FAILED".equals(status)) ? "selected" : "" %> value="FAILED">Failed</option>
				</select>
			</td>
		</tr>
	</table>
</form>

<hr><br>



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
	preparePagesAndResults();
	if (dataLength > 0) {
		showResults(0);
	}
-->
</script>
</body>
</html>


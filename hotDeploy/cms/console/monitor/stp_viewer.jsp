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
<title>STP Viewer</title>
<%@ include file="/console/console_include.jsp" %>

</head>

<body onload="window.scrollTo(0,99999); startNiceForm();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>View STP Status</strong></td>
  </tr>
</table><br>


<%
	String status = request.getParameter("status");
	if ((status == null) || status.equals(""))
	{
		status = "*";
	}
	
%>


<form name="myform" action="stp_viewer.jsp" class="niceform" METHOD=POST>
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="80" align="left">Status:</td>
			<td align="left">
				<select name="status" size="1">
					<option <%= ("LOADING".equals(status)) ? "selected" : "" %> value="LOADING">LOADING</option>
					<option <%= ("COMPLETE".equals(status)) ? "selected" : "" %> value="COMPLETE">COMPLETE</option>
					<option <%= ("RESET".equals(status)) ? "selected" : "" %> value="RESET">RESET</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="left">&nbsp;</td>
			<td align="left">
				<input type="submit" value=" Submit "/>
			</td>
		</tr>
	</table>
</form>

<hr><br>

<% 
	int i;
	int j;

	String datasourcename = PropertyManager.getValue("dbconfig.db1.name", "CMSPool");
	String schema = "";

	long startIndex = 0;
	long endIndex = 10;	
	Properties connProperties = null;

    try {
		String queryStr = "select * from stp_master_trans where status = '" + status + "'";
		connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

%>

	<center>
	<table class="sortable draggable" id="stpview" width="100%">
		<thead>
		  <tr>

<%	
		j = 0;
		StringBuffer headerString = new StringBuffer ();
		for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnName(i) + "</th>");

		out.println(headerString);
		out.println("			  </tr>");
		out.println("			</thead>");
		out.println("			<tbody>");

        while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
			StringBuffer resultString = new StringBuffer ();
			resultString.append("<tr onmouseleave=\"highlight_row(this,'')\" onmouseenter=\"highlight_row(this,'row-highlight')\">");
			for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
			{
				resultString.append("<td>" + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(i)) + "</td>");
			}
			resultString.append("</tr>");
        	out.println(resultString);
			j++;
        }
%>
		</tbody>
	</table>
	<br>
	</center>

<%
		if (j == 0)
			out.println("<font color='blue'><b>Sorry, there are no records found.</b></font><br><br>");
		else
			out.println("<font color='blue'><b>Total records found: " + j + "</b></font><br><br>");

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


</body>
</html>


<%@ include file="/console/console_template.jsp" %>

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.cms.ui.checklist.cc.CCCheckListForm,
				com.integrosys.cms.ui.checklist.security.SecurityCheckListForm,
				com.integrosys.cms.ui.common.SecurityTypeList,
				com.integrosys.cms.ui.common.SecuritySubTypeList,
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
<title>Verify JDBC Connection</title>
<%@ include file="/console/console_include.jsp" %>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Check JDBC Connection</td>
  </tr>
</table><br>


<%
	String datasourcename = request.getParameter("datasource");
	if ((datasourcename == null) || datasourcename.equals(""))
	{
		datasourcename = PropertyManager.getValue("dbconfig.db1.name", "CMSPool");
	}

	String tablename = request.getParameter("tablename");
	if ((tablename == null) || tablename.equals(""))
	{
		tablename = "COMMON_CODE_CATEGORY";
	}

	String fieldname = request.getParameter("fieldname");
	if ((fieldname == null) || fieldname.equals(""))
	{
		fieldname = "*";
	}

	String suffix = request.getParameter("suffix");
	if ((suffix == null) || suffix.equals(""))
	{
		if (tablename.equals("COMMON_CODE_CATEGORY"))
			suffix = "order by category_code";
	}

	String schema = request.getParameter("schema");
	if ((schema == null) || schema.equals(""))
	{
		schema = "";
	}


%>


<form action="testjdbc.jsp" class="niceform" METHOD=POST>
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="130" align="left">Datasource name:</td>
			<td align="left"><input type="text" size="30" value="<%= datasourcename %>" name="datasource" /></td>
		</tr>
		<tr>
			<td align="left">Table name:</td>
			<td align="left"><input type="text" size="30" value="<%= tablename %>" name="tablename" /></td>
		</tr>
		<tr>
			<td align="left">Field name:</td>
			<td align="left"><input type="text" size="30" value="<%= fieldname %>" name="fieldname" /></td>
		</tr>
		<tr>
			<td align="left">Order:</td>
			<td align="left"><input type="text" size="30" value="<%= suffix %>" name="suffix" /></td>
		</tr>
		<tr>
			<td align="left"></td>
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
	long startIndex = 0;
	long endIndex = 10;	
	Properties connProperties = null;

    try {
        out.println("Looking up DataSource<br>");

		String queryStr = "select " + fieldname + " from " + tablename + " " + suffix;
		connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);
%>
	<br>
	<center>
	<table class="sortable draggable" id="jdbc" width="100%">
		<thead>
		  <tr>

<%
		j = 0;

	if (connProperties.get("rs") != null)
	{
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
	}
	else
	{
		j = -1;
	}

%>
		</tbody>
	</table>
	<br>
	</center>

<%
		if (j == -1)
			out.println("<font color='red'><b>Query provided is not correct.</b></font><br>");
		else if (j == 0)
			out.println("<font color='blue'><b>Sorry, there are no records found.</b></font><br>");
		else
			out.println("<font color='blue'><b>Total records found: " + j + "</b></font><br>");

    } catch (Exception e) {
		e.printStackTrace(System.err);
		out.println("<font color='red'>Exception OCCURRED:" + e.getMessage() + "</font>");

    } finally {
     	out.println("<br>Calling Finally");
		closeDatabaseConnection(connProperties);
		connProperties = null;
    }
    out.println("<br>Done<br>");
    
%>

</body>
</html>


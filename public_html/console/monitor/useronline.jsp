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
<title>View Online Users</title>
<%@ include file="/console/console_include.jsp" %>

</head>

<%
	String status = request.getParameter("showUserListing");
	System.out.println("******* : " + status);
	
	if ((status == null) || "".equals(status))
	{
		status = "";
	}
	
%>


<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;<strong>Users Currently Online</strong></td>
  </tr>
</table><br>


<form name="myform" action="useronline.jsp" class="niceform" METHOD=POST>
	<input type="checkbox" name="showUserListing" id="showUserListing" value="yes" <%= ("yes".equals(status) ? "checked":"") %> /><label for="showUserListing" class="opt">Show User Listing</label>
</form>

<% 
	int i;
	int j;
	long onlineCount = 0;

	String datasourcename = PropertyManager.getValue("dbconfig.db1.name", "CMSPool");
	String schema = "";

	long startIndex = 0;
	long endIndex = 10;	
	Properties connProperties = null;

    try {
		String queryStr = "select count(*) from cms_user_session usr, cms_user s, cms_authentication ca where (usr.user_id = s.user_id) and (s.login_id = ca.login_id)";
		connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

		while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
			onlineCount = ((java.sql.ResultSet) connProperties.get("rs")).getLong(1);
			out.println("<font color='blue'><b>Total online users: " + onlineCount + "</b></font><br><br>");
		}
		closeDatabaseConnection(connProperties);

		if (onlineCount > 0 && ("yes".equals(status)))
		{
			queryStr = "select ca.last_login_time, ca.last_access_time, s.login_id, s.user_id, user_name, employee_id, position, department, organisation, country from cms_user_session usr, cms_user s, cms_authentication ca where (usr.user_id = s.user_id) and (s.login_id = ca.login_id)";
			connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);

%>

		<center>
		<table class="sortable draggable" id="onlineuser" width="100%">
			<thead>
			  <tr>

<%
			StringBuffer headerString = new StringBuffer ();
			for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
				headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnName(i) + "</th>");

			out.println(headerString);
			out.println("			  </tr>");
			out.println("			</thead>");
			out.println("			<tbody>");

			String bgcolor = "#FFFFFF";
			String mouseOver = "this.bgcolor='gold';";
			String mouseOut = "this.bgcolor='" + bgcolor + "';";

	        while (((java.sql.ResultSet) connProperties.get("rs")).next()) {
				StringBuffer resultString = new StringBuffer ();
				resultString.append("<tr onmouseleave=\"highlight_row(this,'')\" onmouseenter=\"highlight_row(this,'row-highlight')\">");
				for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++)
				{
					resultString.append("<td>" + formatText(((java.sql.ResultSet) connProperties.get("rs")).getString(i)) + "</td>");
				}
				resultString.append("</tr>");
				out.println(resultString);
	        }
%>

			</tbody>
		</table>
		<br>
		</center>

<%
			
			closeDatabaseConnection(connProperties);
		}
    } catch (Exception e) {
		e.printStackTrace(System.err);
		out.println("<font color='red'><b>Exception OCCURRED: </b></font><br>" + e.getMessage());

    } finally {
		closeDatabaseConnection(connProperties);
		connProperties = null;
    }
    
%>

	<center>
		<hr>
		<a href="javascript: document.myform.submit();"><img src="<%=request.getContextPath()%>/img/refresh1.gif" border="0"></a>
	</center>


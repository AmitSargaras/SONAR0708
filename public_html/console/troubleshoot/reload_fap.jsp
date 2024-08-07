<%@ include file="/console/console_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.cms.ui.common.CommonCodeList,
				com.integrosys.base.techinfra.propertyfile.PropertyManager,
				org.apache.commons.lang.StringUtils,
				com.integrosys.cms.app.accessprofile.proxy.AccessProfileProxyFactory,
				com.integrosys.cms.app.accessprofile.proxy.IAccessProfileProxy,
				java.io.*,
				java.sql.*,
				com.integrosys.base.techinfra.util.PropertyUtil
		"%>

<html>
<head>
<%@ include file="/console/console_include.jsp" %>

</head>

<body onload="sortables_init();startNiceForm();">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Reload FAP</td>
  </tr>
</table>

<%
	Properties connProperties = null;
	
	connProperties = getDatabaseQuery("CMSPool", "", "select action, count(*) from cms_function_access group by action", 0, 10);
	ResultSet actionResults = (ResultSet) connProperties.get("rs");

	String requestAction = request.getParameter("action");
	String requestEvent = request.getParameter("event");
	
	if (requestEvent == null || requestEvent.trim().equals("")) {
		requestEvent = "";
	}

%>

<form name="myform" action="reload_fap.jsp" class="niceform" METHOD=POST>
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="70" align="left">Event:</td>
			<td align="left">
				<select name="event" size="1" onchange="javascript: document.myform.submit();">
					<option <%= ("".equals(requestEvent)) ? "selected" : "" %> value="">Please Select</option>
					<option <%= ("show".equals(requestEvent)) ? "selected" : "" %> value="show">Show</option>
					<option <%= ("refresh".equals(requestEvent)) ? "selected" : "" %> value="refresh">Refresh All</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="left">Action:</td>
			<td align="left">
				<select name="action" size="1" onchange="javascript: document.myform.event.value='show';document.myform.submit();">
				<%
					while (actionResults.next()) {
						String action = actionResults.getString(1);
						String count = actionResults.getString(2);
						out.println("<option " + ((action.equals(requestAction)) ? "selected" : "") + " value=\"" + action + "\">" + action + " (" + count + ")" +"</option>");
					}

					closeDatabaseConnection(connProperties);
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td align="left">&nbsp;</td>
			<td>
				<input type="submit" value=" Submit "/>
			</td>
		</tr>
	</table>	
</form>

<hr>


<%
	int i=0;
	int j=0;

	String datasourcename = PropertyManager.getValue("dbconfig.db1.name", "CMSPool");
	String schema = "";

	long startIndex = 0;
	long endIndex = 10;	
	
	try {
		if ("refresh".equals(requestEvent)) {
			IAccessProfileProxy proxy = AccessProfileProxyFactory.getAccessProfileProxy();
			proxy.refreshFunctionAccess();
			out.println("<font color='blue'><b>FAP cache refreshed !</b></font><br>");
		}
	    else if ("show".equals(requestEvent))
		{
			String queryStr = "select * from cms_function_access ";
			if (requestAction != null && requestAction.length() > 0) {
				queryStr += " where action = '" + requestAction + "'";
			}

			connProperties = getDatabaseQuery(datasourcename, schema, queryStr, startIndex, endIndex);
%>
	<br>

	<table class="sortable draggable" id="fap" width="50%">
		<thead>
		  <tr>

		<%	
			j = 0;
			StringBuffer headerString = new StringBuffer ();
			for (i = 1; i <= ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnCount(); i++) {
				headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + ((java.sql.ResultSet) connProperties.get("rs")).getMetaData().getColumnName(i) + "</th>");
			}

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

<%
			if (j == 0)
				out.println("<font color='blue'><b>Sorry, there are no records found.</b></font><br>");
			else
				out.println("<font color='blue'><b>Total records found: " + j + "</b></font><br>");
	    }
    } catch (Exception e) {
		e.printStackTrace(System.err);
		out.println("<font color='red'>Exception OCCURRED:" + e.getMessage() + "</font>");

    } finally {
		out.println("<br>Calling Finally");
		closeDatabaseConnection(connProperties);
		connProperties = null;
    }

%>

</body>
</html>


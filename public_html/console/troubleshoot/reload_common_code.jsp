<%@ include file="/console/console_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.cms.ui.common.CommonCodeList,
				com.integrosys.base.techinfra.propertyfile.PropertyManager,
				org.apache.commons.lang.StringUtils,
				java.io.*,
				java.net.*,
				javax.net.ssl.HostnameVerifier,
				javax.net.ssl.HttpsURLConnection,
				javax.net.ssl.SSLContext,
				javax.net.ssl.SSLSession,
				javax.net.ssl.TrustManager,
				javax.net.ssl.X509TrustManager,
				com.integrosys.base.techinfra.util.PropertyUtil
		"%>

<html>
<head>

<%@ include file="/console/console_include.jsp" %>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Reload Common Code [via CommonCodeList]</td>
  </tr>
</table>

<%
	String reqEvent = null;
	String categoryCode = null;
	String realServerName = null;

	try {
		// Get Local IP Address
	    try {
			InetAddress thisIp = InetAddress.getLocalHost();
			realServerName = thisIp.getHostAddress().toLowerCase();
	    }
	    catch(Exception e) {
			e.printStackTrace();
	    }

		// Get Servlet Port     
	    int port = request.getServerPort();

	    System.out.println("----------------- Reload common code -------------------------");
		System.out.println("Locale: " + request.getLocale());
	    System.out.println("IP: " + realServerName);		
		System.out.println("Port: " + port);

		reqEvent = request.getParameter("event");
		if (reqEvent == null)
			reqEvent = "";
		System.out.println("		reqEvent : " + reqEvent);

		categoryCode = request.getParameter("code");
		if (categoryCode == null)
			categoryCode = "";
		System.out.println("		categoryCode : " + categoryCode);
	} 
	catch(Exception ee) {
		ee.printStackTrace(new java.io.PrintWriter(out));
	}
%>

<form action="reload_common_code.jsp" class="niceform" METHOD=POST>
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="70" align="left">Event:</td>
			<td align="left">
				<select name="event" size="1">
					<option <%= ("show".equals(reqEvent)) ? "selected" : "" %> value="show">Show</option>
					<option <%= ("refresh".equals(reqEvent)) ? "selected" : "" %> value="refresh">Refresh</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="left">Code:</td>
			<td align="left"><input type="text" name="code" size="40" value="<%= categoryCode %>" /></td>
			<td align="left"><a href="testjdbc.jsp?datasource=CMSPool&tablename=COMMON_CODE_CATEGORY&fieldname=category_id%2C+category_code%2C+category_name%2C+category_type%2C+active_status&suffix=order+by+category_code"><font size="-2">[See list of code category]</font></a></td>
		</tr>
		<tr>
			<td align="left"></td>
			<td align="left"><input type="submit" value=" Submit "/></td>
		</tr>
	</table>	
</form>

<hr>


<%
	try {
		if ("save".equals(reqEvent))
		{
			System.out.println("");
			System.out.println("	+ saving.....");
		}
		else if ("refresh".equals(reqEvent))
		{
			System.out.println("");
			System.out.println("	+ refresh.....");

			if ("".equals(categoryCode)) {
				System.out.println("		categoryCode is empty, skip refresh");
			}
			else if ("*".equals(categoryCode)) {
				System.out.println("		categoryCode is *, full refresh");
				CommonCodeList.refresh();
			}
			else
			{
				System.out.println("	** refresh categoryCode "+ categoryCode);
				CommonCodeList.refresh(categoryCode);
			}
			out.println ("Common Code Reloaded: <font color='blue'>" + categoryCode + "</font>");
	    }
	    else if ("show".equals(reqEvent))
		{
			System.out.println("");
	        System.out.println("	+ display.....");

			out.println ("<br>");
	        out.println ("IP: <font color='blue'>" + realServerName + "</font>");
			out.println ("<br>");
	        out.println ("Common Code selected: <font color='blue'>" + categoryCode + "</font>");
			out.println ("<br>");
	        //out.println ("List of Entry Code: <font color='blue'>" + CommonCodeList.getInstance(categoryCode).getLabelValueMap() + "</font>");
%>
	<br>

	<table class="sortable" id="jdbc" width="50%">
		<thead>
		  <tr>

<%
		int i;
		int j;
		
			j = 0;
			StringBuffer headerString = new StringBuffer ();
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + "Label" + "</th>");
			headerString.append("<th onmouseleave=\"mouseout(this,'header-over')\" onmouseenter=\"mouseover(this,'header-over')\">" + "Value" + "</th>");
			out.println(headerString);

			out.println("			  </tr>");
			out.println("			</thead>");
			out.println("			<tbody>");

			CommonCodeList commonCode = CommonCodeList.getInstance(null, null, categoryCode, false, null);
			for (i = 0; i < commonCode.getCommonCodeLabels().size(); i++)
			{
				String key = (String)((List)commonCode.getCommonCodeLabels()).get(i);
				String val = (String)((List)commonCode.getCommonCodeValues()).get(i);

				StringBuffer resultString = new StringBuffer ();
				resultString.append("<tr onmouseleave=\"highlight_row(this,'')\" onmouseenter=\"highlight_row(this,'row-highlight')\">");
				resultString.append("<td>" + key + "</td>");
				resultString.append("<td>" + val + "</td>");
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
	} 
	catch(Exception ee) {
		ee.printStackTrace(new java.io.PrintWriter(out));
	}

%>

</body>
</html>


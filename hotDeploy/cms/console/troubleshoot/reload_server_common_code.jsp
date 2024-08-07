<%@ include file="/console/console_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.cms.app.commoncodeentry.*,
				com.integrosys.cms.ui.common.*,
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
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Reload Server Common Code [via CommonCodeEntryUtil]</td>
  </tr>
</table>

<%
	String realServerName = null;
	String categoryCode = null;

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
	    int port=request.getServerPort();
	    System.out.println("----------------- Reload servers's common code -------------------------");
		System.out.println("Locale: " + request.getLocale());
	    System.out.println("IP: " + realServerName);		
		System.out.println("Port: " + port);

		categoryCode = request.getParameter("code");
		if (categoryCode == null)
			categoryCode = "";
		System.out.println("		categoryCode : " + categoryCode);
	}
	catch(Exception ee) {
		ee.printStackTrace(new java.io.PrintWriter(out));
	}
%>

<form action="reload_server_common_code.jsp" class="niceform" METHOD=POST>
	<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
		<tr>
			<td width="70" align="left">Code:</td>
			<td align="left"><input type="text" size="40" value="<%= categoryCode %>" name="code" /></td>
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
		if (!"".equals(categoryCode))
			CommonCodeEntryUtil.synchronizeCommonCode (categoryCode.trim());
	}
	catch(Exception ee) {
		ee.printStackTrace(new java.io.PrintWriter(out));
	}
%>

</body>
</html>


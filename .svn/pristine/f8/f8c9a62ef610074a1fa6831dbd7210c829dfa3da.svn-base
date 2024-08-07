<%@ include file="/console/console_template.jsp" %>

<%@ page import="java.util.*,
				com.integrosys.base.techinfra.propertyfile.PropertyManager,
				org.apache.commons.lang.StringUtils,
				java.io.*,
				java.net.*
		"%>

<html>
<head>
<title>Reload Property Manager</title>
<%@ include file="/console/console_include.jsp" %>

</head>		

<%!
	public String GetPropertyData(String propName, String descriptionText) {
		String startTag = "  <TD align='left'>";
		String endTag = "</TD>";

		StringBuffer result = new StringBuffer();
	
		result.append("<TR>");
		result.append(startTag + propName + endTag);
		result.append(startTag + " = " + endTag);
		result.append(startTag + PropertyManager.getValue(propName, "-") + endTag);
		result.append(startTag + "&nbsp;" + descriptionText + "&nbsp;" + endTag);
		result.append("</TR>");

		return (result.toString());
	}


	public boolean CheckAllowedProperty(String propName) {	
		if (propName == null) {
			return true;
		}
		else if ("".equals(propName)) {
			return true;
		}
		else {		
			if (
				propName.equalsIgnoreCase("authentication.manager.bean.name")
				|| propName.equalsIgnoreCase("integrosys.login.single.signon.enabled")
				|| propName.equalsIgnoreCase("integrosys.sme.login.enabled")
				|| propName.equalsIgnoreCase("integrosys.super_users")
				|| propName.equalsIgnoreCase("integrosys.authenticationmanager.sme.jndi")
				|| propName.equalsIgnoreCase("com.integrosys.cms.app.accessprofile.proxy.AccessProfileProxyFactory.proxy")
				|| propName.equalsIgnoreCase("console.func.troubleshoot.propertymanager.acl")
			) {
				//not authorised access
				return false;
			}

			if (propName.indexOf(".password") != -1) {
				//not authorised access
				return false;
			}

			return true;
		}
	}
%>


<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100%" height="35" align="left" class="banner">&nbsp;&nbsp;Reload Property Manager</td>
  </tr>
</table><br>

<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
<TR><TD width='100' align='left'>&nbsp;</TD><TD width='20'> </TD><TD> </TD></TR>
<%
	out.println (GetPropertyData("build.number", ""));
	out.println (GetPropertyData("build.model", ""));
	out.println (GetPropertyData("build.date", ""));
	out.println (GetPropertyData("build.env", ""));
%>
</table>

<br>

<form action="reload_pm.jsp" class="niceform" METHOD=POST>
<input type="hidden" name="task" value="load">
<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
	<TR>
		<TD width="150"><font color="brown">Filename: </font></TD>
		<TD><input type="text" size="60" name="propertyFile" /></TD>
		<TD><input type="submit" value=" Load File "/></TD>
	</TR>
</table>
</form>

<form action="reload_pm.jsp" class="niceform" METHOD=POST>
<input type="hidden" name="task" value="export">
<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
	<TR>
		<TD width="150"><font color="brown">Output File: </font></TD>
		<TD><input type="text" size="60" name="outputFile" /></TD>
		<TD><input type="submit" value="   Export  "/></TD>
	</TR>
</table>
</form>

<form action="reload_pm.jsp" class="niceform" METHOD=POST>
<input type="hidden" name="task" value="get">
<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
	<TR>
		<TD width="150"><font color="blue">Property name: </font></TD>
		<TD><input type="text" size="60" name="name" /></TD>
		<TD><input type="submit" value=" Get Value "/></TD>
	</TR>
</table>
</form>

<table border="1" width="100%">
<tr><td>
<br>
<form action="reload_pm.jsp" class="niceform" METHOD=POST>
<input type="hidden" name="task" value="update">
<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center" class="style1">
	<TR>
		<TD width="150"><font color="green">Property name: </font></TD>
		<TD><input type="text" size="60" name="name" /></TD>
		<TD>&nbsp;</TD>
	</TR>
	<TR>
		<TD width="150"><font color="green">Property value: </font></TD>
		<TD><input type="text" size="60" name="propdata" /></TD>
		<TD><input type="submit" value=" Set Value "/></TD>
	</TR>
</table>
</form>
</td></tr>
</table>
<%

	out.println("<br>");

	String task = request.getParameter("task");
	if ((task == null) || task.equals(""))
	{
		task = "";
	}
	
	String propname = request.getParameter("name");
	if ((propname == null) || propname.equals(""))
	{
		propname = "";
	}
	else
	{
		String result = PropertyManager.getValue(propname);
	
		out.println("<br><strong>Property Value</strong>");
		if (CheckAllowedProperty(propname) == false) {
			out.println("<br><b><font color='red'>" + propname + " is not a valid property</font>" + "</b><br>");
		}
		else if (result != null) {
			out.println("<br><font color='blue'>" + propname + "</font> = " + result + "<br>");
		}
		else {
			out.println("<br><font color='red'>" + propname + " is not a valid property</font>" + "<br>");
		}
		
		if (task.equals("get"))
			return;
	}

	String propvalue = request.getParameter("propdata");
	if ((propvalue == null) || propvalue.equals(""))
	{
		propvalue = "";
	}
	
	if (!propname.equals(""))
	{
		String result;

		if (CheckAllowedProperty(propname) == false) {
			//
			result = "!@# invalid #@!";
		}
		else {
			PropertyManager.setProperty(propname, propvalue);
			result = PropertyManager.getValue(propname);
		}

		out.println("<br><strong>Set Property Value</strong>");
		if (propvalue.equals(result))
			out.println("<br><font color='blue'>" + propname + "</font> = " + result + " <br>");
		else
			out.println("<br><font color='red'>" + propname + " cannot be set/update to " + propvalue + "</font>" + " <br>");

	}

	if (!task.equals("load") && !task.equals("export"))
		return;
	
	String outputFile = request.getParameter("outputFile");
	if ((outputFile == null) || outputFile.equals(""))
	{
		//do nothing
	}
	else
	{
		if (outputFile.indexOf(":") != -1) {

			if ((outputFile.indexOf("/") == -1) && (outputFile.indexOf("\\") == -1)) {
				out.println("<font color='red'>Warning:</font> Export file provided is not valid<br>");
				return;
			}

			if (outputFile.endsWith("\\") || outputFile.endsWith("/") || outputFile.endsWith(":") || outputFile.endsWith(".")) {
				out.println("<font color='red'>Warning:</font> Export file does not contain alphabet<br>");
				return;
			}
		}

		PropertyManager.dumpToFile(outputFile);

		ArrayList temp = new ArrayList();
		String myline;
		
		try
		{
			LineNumberReader in = new LineNumberReader(new FileReader(outputFile));
			while ((myline = in.readLine()) != null)
			{
				temp.add(myline);
			}
			in.close();
			Collections.sort(temp);

			out.println ("<br>");

			String dispStr;
			int eqIndex;
			Iterator i1 = temp.iterator();
			while (i1.hasNext()) {
				dispStr = (String) i1.next();
				eqIndex = dispStr.indexOf("=");
				if (eqIndex != -1)
					out.println ("<NOBR><font color='blue'>" + dispStr.substring(0, eqIndex) + "</font>" + "<font color='red'>=</font>" + dispStr.substring(eqIndex+1, dispStr.length()) + "</NOBR><br>");
				else
					out.println ("<NOBR>" + dispStr + "</NOBR><br>");
			}

			temp.clear();
			temp = null;
		}
		catch (Exception e)
		{	//catch exception if any
		    System.err.println("Error: " + e.getMessage());
		}
	}

	if (!task.equals("load"))
		return;
	
	String propertyFile = request.getParameter("propertyFile");
	if ((propertyFile == null) || propertyFile.equals(""))
	{
		out.println("<font color='red'>Warning:</font> Please provide a valid property file or property name<br>");
	}
	else
	{
		ClassLoader ctxClassLoader = Thread.currentThread().getContextClassLoader();
		URL propertyFileUrl = ctxClassLoader.getResource(propertyFile);

		if (propertyFile != null && propertyFileUrl != null) {
			System.out.println("reloading property file : [" + propertyFileUrl.getPath() + "]");

			Properties prop = new Properties();
			prop.load(propertyFileUrl.openStream());

			PropertyManager.getProperty().putAll(prop);

			out.println("Property manager reloaded with <strong>" + propertyFile + " </strong><br>");
		}
		else
			out.println("Property file provided is invalid <br>");
		
	}
%>


</body>
</html>

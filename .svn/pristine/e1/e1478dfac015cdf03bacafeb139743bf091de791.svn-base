<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager, com.integrosys.base.techinfra.crypto.CryptoManager,
				 com.integrosys.base.uiinfra.common.Constants,
                 java.util.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%
	String logout = request.getParameter("logout");
	if ("yes".equals(logout)) {
		session.removeAttribute("global.logon_username");
		session.removeAttribute("global.logon_password");

		//this is to allow console and app to run together
		if (session.getAttribute(Constants.SESSION_CHECK_USER_LOGIN_ID) == null)
			session.invalidate();

		RequestDispatcher dispatcher = application.getRequestDispatcher("/console/logon.jsp");
	    dispatcher.forward(request, response);
		return;
	}

	String username = request.getParameter("j_username");
	String password = request.getParameter("j_password");
	
	if ((username != null) && password != null)
	{
		session.setAttribute("global.logon_username", username);
		////session.setAttribute("global.logon_password", password);
	}

	username = (String) session.getAttribute("global.logon_username");
	////password = (String) session.getAttribute("global.logon_password");
	
	String cipherText = PropertyManager.getValue("console.user." + username + ".password");
	if (cipherText != null)
	{
		CryptoManager sec = new CryptoManager("Hex", PropertyManager.getValue("encryption.provider"));
		if (!cipherText.equals(sec.encrypt(password)))
		{
			password = null;
		}
	}	

	//System.out.println("^^^^^^^^^^^^^^ " + username + "    cipherText: " + cipherText);
	
	if (username == null || password == null || cipherText == null)
	{
		session.removeAttribute("global.logon_username");
		session.removeAttribute("global.logon_password");
		
		//this is to allow console and app to run together
		if (session.getAttribute(Constants.SESSION_CHECK_USER_LOGIN_ID) == null)
			session.invalidate();

		request.setAttribute("username", username);

		RequestDispatcher dispatcher = application.getRequestDispatcher("/console/logon.jsp");
		if (cipherText == null) {
		
			if ((username == null) || password == null || ("".equals(username)) || ("".equals(password))) {
				//nothing is entered, so do nothing

			}
			else {
				request.setAttribute("error_message", "User ID or Password is not correct");

			}
		}
		else {
			if (password == null) {
				request.setAttribute("error_message", "User ID or Password is not correct");
			}
		}

	    dispatcher.forward(request, response);
		return;
	}


%>



<html>
<head>
	<title>Maintenance Console</title> 	
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />
	
	<%@ include file="/template/stylesheet_template.jsp" %>
	<%@ include file="/console/console_include.jsp" %>

	<script type="text/javascript" src="javascripts/prototype.js"></script>
	<script type="text/javascript" src="javascripts/effects.js"></script>
	<script type="text/javascript" src="javascripts/window.js"></script>
	<script type="text/javascript" src="javascripts/window_effects.js"></script>
	<script type="text/javascript" src="javascripts/window_ext.js"></script>
	<script type="text/javascript" src="javascripts/debug.js"></script>
	<script type="text/javascript" src="javascripts/extended_debug.js"></script>

	<script type="text/javascript" src="javascripts/contextmenu.js"></script>
	<script type="text/javascript" src="javascripts/contextmenu_config.js"></script>
	<link href="css/contextmenu.css" rel="stylesheet" type="text/css"></link>
	
	<script type="text/javascript" src="scripts/debugutil.js"></script>
	<script type="text/javascript" src="scripts/cookies.js"></script>
	<script type="text/javascript" src="scripts/pages.js"></script>

	
<script type="text/javascript">
<!--
	var currentTheme;	//alphacube  darkX
	if (getCookie("theme")) 
		currentTheme = getCookie("theme");
	else
		currentTheme = "mac_os_x";
//-->


function setBrowserStatus()
{
	window.status = "";
	setTimeout("setBrowserStatus()", 5);
}

function refreshTheme(themeName)
{
	currentTheme = themeName;
	setCookie("theme", currentTheme, 31536000);
	
	reload_Theme();
}

function loadTheme()
{
	refreshTheme(currentTheme);
}


</script>

<link href="themes/default.css" rel="stylesheet" type="text/css"></link>
<link href="themes/debug.css" rel="stylesheet" type="text/css"></link>

<link href="themes/alert.css" rel="stylesheet" type="text/css"></link>
<link href="themes/alert_lite.css" rel="stylesheet" type="text/css"></link>

<!--  Add these to have a specific theme-->

<link href="themes/nuncio.css" rel="stylesheet" type="text/css" ></link>
<link href="themes/alphacube.css" rel="stylesheet" type="text/css" ></link>
<link href="themes/darkX.css" rel="stylesheet" type="text/css" ></link>
<link href="themes/spread.css" rel="stylesheet" type="text/css" ></link>
<link href="themes/mac_os_x.css" rel="stylesheet" type="text/css" ></link>
<link href="themes/theme1.css" rel="stylesheet" type="text/css" ></link>
<link href="themes/lighting.css" rel="stylesheet" type="text/css" ></link>

<style type="text/css">
.nolines {  font-size: 75.0%; border: 0px solid #CCCCFF;  }
.linesmost { font-size: 75.0%;   border-left: 0px; border-bottom: 0px; border-top: 1px solid #CCCCFF; border-right: 1px solid #CCCCFF;  background-color: #FFFFFF; padding-bottom: 12px}
.graytext { font-family: sans-serif; color: #666666; font-size: 104.0%;}
.desctext { font-family: sans-serif; color: #666666; font-size: 90.0%; line-height: 130%}
.bluebold { font-weight: bold; color: #0000F0; font-size: 107.0%; font-family: Helvetica,sans-serif;}
a .bluebold  {  text-decoration: underline; color: blue  }

body {
	margin-bottom: 0px;margin-left: 0px;margin-right: 0px; margin-top: 0px;
	overflow: hidden;
}
</style>

<script language="JavaScript" type="text/javascript">
<!--
initCountCookie("<%=username%>", "<%=session.getMaxInactiveInterval()%>");
window.onload = function() {
		countDownSession();
		extraOnLoadTask();
		initjsDOMenu();
}
//-->
</script>

</head>


<body onresize="handle_resize();">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" align="left" bgcolor="#F5F5F5" style="font-family:verdana;font-size:130%;font-weight:bold">&nbsp;&nbsp;Maintenance Console&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="-1">Welcome <b><%=username%></b></font>&nbsp;&nbsp;<a href="admin.jsp?logout=yes">[Logout]</a>
		<br><span class="gradient_557700_AADDAA" style="font-family:verdana;font-size:10px;font-weight:bold">&nbsp;&nbsp;&nbsp;&nbsp;<%= PropertyManager.getValue("reportSystemName", "Collateral Management System") %></span>
	</td>
	<td height="50" align="right"  bgcolor="#F5F5F5">
		<img alt='Console' title='Console' src='<%=request.getContextPath()%>/img/header<%= new Random().nextInt(2)+1 %>.gif' height="49" />
		<object>
		<param name="movie" value="swf/flash<%= new Random().nextInt(5) %>.swf">
		<embed src="swf/flash<%= new Random().nextInt(5) %>.swf" height="50" width="255"></embed>
		</object>
	</td>
  </tr>
</table>

<script type="text/javascript">

	showDebugBox();
	if (debugWindow != null) {
		Xwidth = WindowUtilities.getPageSize().windowWidth;
		Ywidth = WindowUtilities.getPageSize().windowHeight;

		debugWindow.setLocation(Ywidth-260, Xwidth-510);
	}
</script>


    <table bgcolor="#E8E8E8" border=0 cellpadding=5 cellspacing=0 width="100%" height="100%">
      <tr>
        <td align="left" VALIGN="top" WIDTH="100%"> 
	  </tr>

	</table>

<script type="text/javascript">
	setTimeout("loadTheme()", 300);	
	setTimeout("setBrowserStatus()", 10);
	
	debug("***** Admin page loaded *****");
	
</script>


</body>
</html>

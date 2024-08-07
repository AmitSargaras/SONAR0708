<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<%

	if (PropertyManager.getBoolean("integrosys.login.top.most.layer", true)) {
		System.out.println("----------------------------------------------------------------------------------------------");
		System.out.println("##### Main page not supported as top most HTML layer, forwarding to Login page");

		RequestDispatcher dispatcher = application.getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
		//this is needed for Websphere so that it will stop rendering immediately
		return;
	}
	else {
		System.out.println("///////////////////////////////// main.jsp /////////////////////////////////");
	}
%>

<HTML>
<HEAD>
<title><bean:message key="label.system.title" /></title>
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />

<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/icon.ico" type="image/x-icon"> 
<link rel="icon" href="<%=request.getContextPath()%>/img/icon.ico" type="image/x-icon"> 

<script type="text/javascript" src="console/javascripts/prototype.js"></script>
<script type="text/javascript" src="console/javascripts/effects.js"></script>
<script type="text/javascript" src="console/javascripts/window.js"></script>
<script type="text/javascript" src="console/javascripts/window_effects.js"></script>
<script type="text/javascript" src="console/javascripts/debug.js"></script>
<script type="text/javascript" src="console/javascripts/extended_debug.js"></script>

<script type="text/javascript" src="console/javascripts/contextmenu.js"></script>
<script type="text/javascript" src="console/javascripts/theme_contextmenu_config.js"></script>
<link href="console/css/contextmenu.css" rel="stylesheet" type="text/css"></link>

<script type="text/javascript" src="console/scripts/debugutil.js"></script>
<script type="text/javascript" src="console/scripts/cookies.js"></script>
<script type="text/javascript" src="console/scripts/misc.js"></script>
<script type="text/javascript" src="console/scripts/theme_pages.js"></script>


<script type="text/javascript">
<!--
	var currentTheme;	//alphacube  darkX  mac_os_x  nuncio  spread  bluelighting

	if (getCookie("theme")) {
		currentTheme = getCookie("theme");
	} else if ((location.href.indexOf("localhost") != -1) || (location.href.indexOf("http:") == -1)) {
		currentTheme = "mac_os_x";
	} else {
		currentTheme = "mac_os_x";
	}

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

//-->
</script>

<style type="text/css">
<!--
body {
	overflow: hidden;
	padding: 0px;
	margin: 0px;
	outline-style: none;
	outline-width: 0px;
}
-->
</style>

<link href="console/themes/default.css" rel="stylesheet" type="text/css"></link>
<link href="console/themes/debug.css" rel="stylesheet" type="text/css"></link>

<link href="console/themes/alert.css" rel="stylesheet" type="text/css"></link>
<link href="console/themes/alert_lite.css" rel="stylesheet" type="text/css"></link>

<link href="console/themes/no_border.css" rel="stylesheet" type="text/css" ></link>

<!--  Add these to have a specific theme-->
<link href="console/themes/nuncio.css" rel="stylesheet" type="text/css" ></link>
<link href="console/themes/alphacube.css" rel="stylesheet" type="text/css" ></link>
<link href="console/themes/darkX.css" rel="stylesheet" type="text/css" ></link>
<link href="console/themes/spread.css" rel="stylesheet" type="text/css" ></link>
<link href="console/themes/mac_os_x.css" rel="stylesheet" type="text/css" ></link>
<link href="console/themes/theme1.css" rel="stylesheet" type="text/css" ></link>
<link href="console/themes/lighting.css" rel="stylesheet" type="text/css" ></link>

<SCRIPT>
	<!--
	function mousebuttoninfo(e) {
		if (!e) {
		  var e = window.event;
		}
		cancel_DevMode(e);
	}
	//-->
</SCRIPT>

</HEAD>


<BODY marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" 
	style="LEFT:0px; WIDTH:100%; POSITION:absolute; TOP:0px; HEIGHT:100%" onresize="handle_resize();" onmousedown="mousebuttoninfo(event);">

	
<script type="text/javascript">
	<!--
	window.onload=function() {	
		// show Debug window
		showDebugBox();
		setBrowserStatus()

		show_main();
		initjsDOMenu();

		if (getCookie("bgimage")) {
			wallpaper = getCookie("bgimage");
			if (wallpaper.indexOf("/.jpg") == -1)
				document.body.style.backgroundImage = wallpaper;

			//document.body.style.backgroundColor = getCookie("bgcolor");
			document.body.style.backgroundColor="#038327";
		}
		else {
			changeBG("", "#038327");
		}

	}

	window.onunload=function() {
		debug("unloading.......");
		setCookie("bgcolor", getcssstyle(document.body, "backgroundColor", "background-color"), 31536000);
		setCookie("bgimage", getcssstyle(document.body, "backgroundImage", "background-image"), 31536000);
	}
	//-->
</script>


</BODY>
</HTML>

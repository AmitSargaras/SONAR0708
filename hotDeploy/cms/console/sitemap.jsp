<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager, java.util.*,
                 java.io.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
	<title>Maintenance Console</title> 
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />

	<link rel="stylesheet" type="text/css" href="sdmenu/sdmenu.css" />
	<script type="text/javascript" src="sdmenu/sdmenu.js"></script>
	
	<script type="text/javascript">
		// <![CDATA[
		var myMenu;
		window.onload = function() {
			myMenu = new SDMenu("console_menu");
			myMenu.speed = 5;			// Menu sliding speed (1 - 5 recomended)
			myMenu.oneSmOnly = true;	// One expanded submenu at a time
			myMenu.remember = false;	// Store menu states (expanded or collapsed) in cookie and restore later
			myMenu.init();
			myMenu.collapseAll();
		};
		// ]]>
	</script>

</head>

<%!
	public List splitList(String listStr) {
		List menu = new ArrayList();
		if (listStr != null)
		{
			StringTokenizer st = new StringTokenizer(listStr, "|");
			while (st.hasMoreTokens()) {
				menu.add(st.nextToken());
			}
		}
		return menu;
	}
%>


<body>

<script language=JavaScript>
<!--
var message="";
///////////////////////////////////
function clickIE() {if (document.all) {(message);return false;}}
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) {
if (e.which==2||e.which==3) {(message);return false;}}}
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}

document.oncontextmenu=new Function("return false")
// --> 
</script>

<div style="float: left" id="console_menu" class="sdmenu">
	<div>
		<span>Welcome</span>
		<a href="javascript:top.show_utilities()">Welcome Page</a>
	</div>
<%

	long childItemFound;
	String username = (String) session.getAttribute("global.logon_username");

	List funcList = splitList(PropertyManager.getValue("console.func"));

	Iterator menuItr = funcList.iterator();
	while (menuItr.hasNext())
	{
		String func = (String) menuItr.next();
		childItemFound = 0;

		List subFuncList = splitList(PropertyManager.getValue("console.func." + func));
		Iterator subfuncItr = subFuncList.iterator();
		while (subfuncItr.hasNext())
		{
			String subfunc = (String) subfuncItr.next();

			/* display url under func */
			String sfText = PropertyManager.getValue("console.func." + func + "." + subfunc + ".text");
			String sfLink = PropertyManager.getValue("console.func." + func + "." + subfunc + ".link");

			List sfDenyList = splitList(PropertyManager.getValue("console.func." + func + "." + subfunc + ".deny"));
			if (!sfDenyList.contains(username) && !sfDenyList.contains("*"))
			{
				List sfAclList = splitList(PropertyManager.getValue("console.func." + func + "." + subfunc + ".acl"));
				if (sfAclList.contains(username) || sfAclList.contains("*"))
				{
					if (childItemFound == 0)
					{
						out.println("	<div>");
						// display func heading
						out.println("		<span>" + PropertyManager.getValue("console.func." + func + ".text") + "</span>");
					}

%>
				<a href="javascript:top.show_utilities('<%= request.getContextPath() + "/console/" + func + "/" + sfLink %>', '<%= sfText %>')"><%= sfText %></a>

<%				
					childItemFound++;
				}
			}
		}
		
		if (childItemFound > 0)
		{
			out.println("	</div>");
		}
	}
%>

    </div>

<br>

</body>
</html>



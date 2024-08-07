<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 java.util.*"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%	
	/*
	for (Enumeration enum = session.getAttributeNames();enum.hasMoreElements();) {
		String sessionAttributeName = (String) enum.nextElement();
		System.out.println("Attribute name : " + sessionAttributeName);
	}
	*/

	/*
	String cmsUserName = (String) session.getAttribute("global.logon_username");
	if (cmsUserName == null || "".equals(cmsUserName)) {
		//session.invalidate();	
	}
	*/

	//orange FF6600, FFFF33
	//blue 006699, 99FFFF
	//green 669900, 99FF99
%>

<html>
<head>
	<title>Maintenance Console</title> 	
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="-1" />

	<%@ include file="/template/stylesheet_template.jsp" %>
	<%@ include file="/console/console_include.jsp" %>


<style>
.myBox
{
    margin: 0px auto;
	margin-top: 4px;
	overflow: hidden;
    border: 0px solid #000000;
    color: #0000f;
    width: 92%;
	height: 100%;
    padding: 12px;
    text-align: left;
    background-color: #ffffff;
    border-top: 3px solid #000000;
    border-bottom: 3px solid #000000;

    border-left: 3px solid #000000;
    border-right: 3px solid #000000;

    /* Do rounding (native in Firefox and Safari) */
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;

}

html, body 
{
	margin-bottom: 0px;margin-left: 0px;margin-right: 0px; margin-top: 0px;
	background-color: #f5f5f5;
	background-image: none;
	overflow: hidden;
	text-align: center;
}

</style>

</head>

<%

%>

<body>

	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="50" align="left" bgcolor="#F5F5F5" style="font-family:verdana;font-size:130%;font-weight:bold">&nbsp;&nbsp;Maintenance Console</td>
	    <td height="50" align="right"  bgcolor="#F5F5F5">
			<a href="<%=request.getContextPath()%>"><img alt='Back to CMS' title='Back to CMS' border="0" src='<%=request.getContextPath()%>/img/header<%= new Random().nextInt(2)+1 %>.gif' height="49" /></a>
		<!--
			<object>
			<param name="movie" value="swf/flash<%= new Random().nextInt(5) %>.swf">
			<embed src="swf/flash<%= new Random().nextInt(5) %>.swf" height="50" width="255"></embed>
			</object>
		-->
		</td>
	  </tr>
	</table>
	
	
<div class="myBox">
    <table bgcolor="#ffffff" border="0" cellpadding=5 cellspacing=0 width="100%" height="100%">
		<tr>
			<td align="left" VALIGN="top" WIDTH="90%"> 
				<form name="logonForm" action="<%=request.getContextPath()%>/console/admin.jsp" method="post" class="niceform">
		            <table border=0 cellpadding=0 cellspacing=0 >
						<tr> 
							<TD align="left" class="test" noWrap>
								<br>
								<p style="font-family:verdana;font-size:120%;">Welcome, enter your information.</p>

								<%	
									String errorMessage = (String) request.getAttribute("error_message");
									if (errorMessage != null)
										out.println("<font color='red' size='-1'>" + errorMessage + "</font><br>");
								%>
								<br>
							</TD>
						</tr>
						<tr>
			                <td align="left" valign=top width="33%" class="test" nowrap > 
			                  <label for="j_username"><font size="-1">User ID:</font></label>
			                </td>
		                </tr>
						<tr>
						  <td align="left">
							<%	
								String defaultUser;
								String prevUserName = (String) request.getAttribute("username");

								//System.out.println("*********** " + prevUserName);

								if (prevUserName != null)
									defaultUser = "value='" + prevUserName + "'";
								else
									defaultUser = "";
							%>
							<input TYPE="text" class="test" name="j_username" id="j_username" <%= defaultUser %> />
						  </td>
						</tr>
						<tr>
							<td align="left">
							  &nbsp;
							</td>
						</tr>
						<tr> 
							<td align="left" valign=top width="33%" class="test" nowrap > 
							  <label for="j_password"><font size="-1">Password:</font></label>
							</td>
						</tr>
						<tr>
							<td align="left">
							  <input TYPE="password" class="test" name="j_password" id="j_password"/>  
							</td>
						</tr>
						<tr>
							<td align="left">
							  &nbsp;
							</td>
						</tr>
						<tr>
							<td align="left" valign=top class="test" nowrap > 
							  <input TYPE="submit" name="action" class="buttons" id="other" alt='Log in' VALUE="Log in">
							</td>
						</tr>
						<tr>
							<td align="left" valign=top class="test" nowrap ><br></td>
						</tr>
						<tr>
							<td align="left" valign=top class="test" nowrap ><br></td>
						</tr>
						<tr>
							<td align="left" valign=top class="test" nowrap ><br></td>
						</tr>
						<tr>
							<td align="left" valign=top class="test" nowrap > 
								<p style="font-family:san serif;color:gray;font-size:7pt;">
									<strong>Server Name:</strong> <%= request.getServerName() %><br>
									<strong>Server Port:</strong> <%= request.getServerPort() %><br>
									<strong>Server Software:</strong> <%= application.getServerInfo() %><br>
									<br>
									<strong>Client IP:</strong> <%= request.getRemoteAddr() %><br>
									<strong>Client Name:</strong> <%= request.getRemoteHost() %><br>
								</p>
							</td>
						</tr>
		            </table>
				</form>
			</td>
	        <td VALIGN="top">
				<img src='<%=request.getContextPath()%>/img/smartlender_text.gif' title='Login image' alt='Login image'>
				<br>
				<center>
					<h2><span class="gradient_669900_99FF99">Collateral <br>Management <br>System</span></h2>
				</center>
			</td>
		</tr>
		<tr>
			<td align="center" VALIGN="middle" WIDTH="100%" COLSPAN="2">
				<p style="text-align:center;bgcolor:#F5F5F5">
					<object height="120" width="100%">
						<param name="wmode" value="transparent">
						<param name="movie" value="swf/flash<%= new Random().nextInt(5) %>.swf">
						<embed src="swf/flash<%= new Random().nextInt(5) %>.swf" height="120" width="100%" WMODE="transparent"></embed>
					</object>
				</p>		
			</td>
		</tr>

	</table>
</div>

</body>
</html>


<script type="text/JavaScript">

  function initCorners()
  {
    settings = {
          tl: { radius: 20 },
          tr: { radius: 20 },
          bl: { radius: 20 },
          br: { radius: 20 },
          antiAlias: true,
          autoPad: true,
          validTags: ["div"]
    }

	var myBoxObject = new curvyCorners(settings, "myBox");
  }

  initCorners();
</script>


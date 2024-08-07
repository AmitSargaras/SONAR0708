<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<title><bean:message key="label.system.title" /></title>

<%@ include file="/template/stylesheet_template.jsp" %>

<script language="JavaScript" type="text/javascript">
<!--
function promptCloseWindow() {
	window.close();
	var closecounter = setTimeout("promptCloseWindow()", 2000);
}

window.onload = function() {
	var closecounter = setTimeout("promptCloseWindow()", 2000);
}
//-->
</script>

</head>

<%
	String logout = (String) request.getParameter("logout");
	if ("yes".equals(logout)) {
		System.out.println("############ Session to be destroyed since multiple tabs from same browser used");
		session.invalidate();
	}
%>


<body bgcolor="#FFFFFF" text="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <%@ include file="/template/image_logo_template.jsp" %>

      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="48" width="100%">&nbsp;</td>
          <!-- <td height="48" bgcolor="#000000">&nbsp; </td> -->
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <%@ include file="/template/image_strip2_template.jsp" %>
  </tr>
</table>
<br/>
<br/>
<br/>
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" vspace="0" hspace="0">
    <tr> 
      <td width="21%">&nbsp;</td>
      <td width="79%"> 
        <div align='left'>
			<font color="#000000">
				<b>Multiple requests from same web browser identified.</b><br>
				<br>Please do not open multiple tab/window from the same web browser.<br>
				<br>If you have an existing tab that is still active, please continue to use it.<br>
				<br>If you do not have any active tab, please close and restart your web browser.<br>

			<%
				if ("yes".equals(logout)) {
					out.println("<br>");
					out.println("<br><b>Note:</b> The session in your existing tab could be made expired to perserve data integrity<br>");
				}
			%>
			</font>
		</div>
	  </td>
      <td width="0%">&nbsp;</td>
    </tr>
    <tr>
	  <td width="21%" height="60">&nbsp;</td>
      <td width="79%"> 
	    &nbsp;
	  </td>
      <td height="21">&nbsp;</td>
    </tr>
  </table>
  <p>&nbsp;</p>
</center>
</body>
</html>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head>
<title><bean:message key="label.system.title" /></title>

<%@ include file="/template/stylesheet_template.jsp" %>
</head>

<html>
<style type="text/css">
.test {  font-family: Verdana; font-size: 11px; color:#000000; text-decoration: none}
</style>

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
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="test">
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
        <div align='left'><font color="#000000"><b>Invalid session (multi terminal login identified).</b></font></div>
	  </td>
      <td width="0%">&nbsp;</td>
    </tr>
    <tr>
	  <td width="21%" height="60">&nbsp;</td>
      <td width="79%"> 
	    <div align='left'><font color="#000000">Please <a href="<%=request.getContextPath()%>/login.jsp"><font size="+1">log-in</font></a> again.</b></font></div>
	  </td>
      <td height="21">&nbsp;</td>
    </tr>
  </table>
  <p>&nbsp;</p>
</center>
</body>
</html>
</html>
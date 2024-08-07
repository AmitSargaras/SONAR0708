<%@ page import="java.util.Collection,
                 com.integrosys.base.techinfra.logger.DefaultLogger"%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: $
*
* Describe this JSP.
* Purpose: For generate the report online
* Description: generate report online by Maker
*
* @author $Author: KLYong$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String event = request.getParameter("event");
    DefaultLogger.debug(this, "event="+event);

    String buildUpID = (String) request.getParameter("buildupID");
    String countryCode = (String) request.getParameter("orig_country");
    DefaultLogger.debug(this, "buildUpID="+buildUpID);
    DefaultLogger.debug(this, "countryCode="+countryCode);
%>

<html>
<head>
<title>CMS</title>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script src="js/calendar.js"></script>
<script src="js/calDriver.js"></script>

 <!-- InstanceEndEditable -->

<script>
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

window.onload = function() {
   var strURL = 'ReportServlet?event=generateMISReport&flag=view&buildupID=<%=buildUpID%>&orig_country=<%=countryCode%>';
   displayReportFrame.location = strURL;
}
//-->
</script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<html:form action="BL_BuildUp.do">
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" id="custsearch">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>
</html:form>
<iframe name='displayReportFrame' src='refresh.gif' width='0' height='0' frameborder='0' scrolling='no'></iframe>
</body>
</html>
<%@ page import="java.util.Collection"%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: $
*
* Describe this JSP.
* Purpose: For generate the report online
* Description: generate report online by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>
<%
    String event = request.getParameter("event");
    String reportID = null;
    if(event.equals("gmra_report")){
      reportID = "TBR002";
    }else{
      reportID = "TBR001";
    }
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>


<html>
<head>
<title>Untitled Document</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>

 <!-- InstanceEndEditable -->

<script language="JavaScript" type="text/JavaScript">
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

function submitPage() {
    if(document.forms[0].searchDate.value == ''){
      alert("Date is Mandatory. Please key in the date.");
    }else{
      var strURL = 'ReportServlet?event=generateMISReport&flag=view&reportId=<%=reportID%>&param_date='+document.forms[0].searchDate.value+'&orig_country=MY';
      displayReportFrame.location=strURL;
      //document.forms[0].action = 'ReportServlet?event=generateMISReport&flag=view&reportId=<%=reportID%>&param_date='+document.forms[0].searchDate.value+'&orig_country=MY';
      //document.forms[0].submit()
    }
}

//-->
</script>





</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<html:form action="TradingBookReport.do?event=gmra_report">
<form name="TradingBookReportForm">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="50%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection"  id="custsearch">
  <tr>
    <td><table class="tblInput" id="custsearch" style="margin-top:25px" width="100%" border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <td colspan="2">Please enter search criteria</td>
          </tr>
        </thead>
        <tbody>
          <tr class="odd">
            <td width="37%" class="fieldname">Date :&nbsp;<font color="#0000FF">* </font></td>
            <td width="48%">
              <html:text property="searchDate" style="width:90px" size="15" maxlength="11" readonly="true" />
              <img src="img/calendara.gif"  name="Image721" border="0" id="Image2" onclick="return showCalendar('searchDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image721','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="searchDate"/>
           </td>
          </tr>
        </tbody>
      </table></td>
  </tr>
  <tr>
    <td>
    <br>
    &nbsp;</td>
  </tr>
  <tr>
    <td style="text-align:center"><input onclick="javascript:submitPage()" name="AddNew1" type="button" id="AddNew1" value="Go"  class="btnNormal" style="margin-right:5px;margin-left:10;width:50px" /></td>
  </tr>
</table>


</html:form>
<iframe name='displayReportFrame' src='refresh.gif' width='0' height='0' frameborder='0' scrolling='no'></iframe>
</body>
</html>

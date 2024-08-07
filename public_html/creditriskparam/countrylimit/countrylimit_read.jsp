<%@ page import="com.integrosys.cms.ui.creditriskparam.countrylimit.EventConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
 <head>
  <!-- InstanceBeginEditable name="doctitle" -->
  <title>Country Limit Parameter</title>
  <!-- InstanceEndEditable -->
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
  <!-- InstanceBeginEditable name="CssStyle" -->
  <!-- <link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" title="winter" />
  <!-- InstanceEndEditable -->
  <!-- InstanceBeginEditable name="head" -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>

  <script language="javascript">
   <!--
    
     function performBack(){
	    var url = 'Welcome.do';
        document.location.href = url;
     }

     -->
   </script>


 </head>
 <body>

 <html:form action="CountryLimitParam.do">
    <input type="hidden" name="event" value="" />
   
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
      
      <%@ include file="countrylimit_read_helper.jsp" %>

    </table>
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center"><a href="javascript:performBack()"><img src="img/return1.gif" name="Image51" border="0" id="Image5" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </html:form>
 </body>
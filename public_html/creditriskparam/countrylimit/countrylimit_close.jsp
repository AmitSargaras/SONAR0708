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
  <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css" />-->
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" title="winter" />
  <!-- InstanceEndEditable -->
  <!-- InstanceBeginEditable name="head" -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>
 </head>
 <body onload="MM_preloadImages('img/refresh2.gif','img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
   <script language="javascript">
     function submitPage()
     {
        document.forms[0].event.value = '<%=EventConstant.EVENT_CLOSE%>';
        document.forms[0].submit();
     }
   </script>
   <%
     String from_event = "close";
     boolean isProcess = false;
     boolean isTrack = false;
     String forward_event = (String)request.getParameter("event");
     if ("track".equals(forward_event) || "track_return".equals(forward_event)) 
     {
        from_event = "track";
        isTrack = true;
     }
   %>
   <html:form action="CountryLimitParam.do">
    <input type="hidden" name="event" value="" />
   
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
     
      <%@ include file="countrylimit_read_helper.jsp" %>    
    </table>
   
	<bean:define id="itrxValue" name="com.integrosys.cms.ui.creditriskparam.countrylimit.CountryLimitAction.countryLimitTrxObj" type="com.integrosys.cms.app.creditriskparam.trx.countrylimit.ICountryLimitTrxValue" scope="session"/>
     
    <%
    if (!isTrack) {
		%>
		<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
		  <tbody>
       &nbsp;
       &nbsp;
		  			<tr class="odd">
		  			        <td class="fieldname"><bean:message key="label.last.action.by"/></td>
		               	<td><%=itrxValue.getUserInfo()%>&nbsp;</td>    
		        </tr>
		        <tr class="even">
		               <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
		                <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td> 
		        </tr>
		  </tbody>
		</table>
		<%
		   }
		%>
		
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <% 
          if (isTrack) 
          { 
        %>
           <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
           <td>&nbsp;</td>
        <% 
          } 
          else 
          { 
        %>
           <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" border="0" id="Image8" /></a></td>
           <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
        <% 
          } 
        %>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </html:form>
 </body>
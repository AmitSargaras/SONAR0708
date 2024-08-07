<%@ page import="java.util.Collection,
                 java.util.Arrays,
                 java.util.Iterator,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.GlobalAccessControlCommand"%>
                 

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
 <head>

  <title>Marketability Factor Input</title>

  


  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>
 </head>
 <body onload="MM_preloadImages('img/refresh2.gif','img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
   <script language="javascript">
   <!--
     function submitPage()
     {
	    
        document.forms[0].event.value = 'track';
        document.forms[0].submit();
     }
     //-->
   </script>
   <%
     String from_event = "track";
     boolean isProcess = false;
     boolean isTrack = false;
     String forward_event = (String)request.getParameter("event");
     if ("track".equals(forward_event) || "track_return".equals(forward_event)) 
     {
        from_event = "track";
        isTrack = true;
     }
   %>
   <html:form action="MarketabilityFactor.do">
    <input type="hidden" name="event" value="" />
    <html:hidden property="MFTemplateName"/>
	<p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
      <thead>
    	<tr>
      	  <td>&nbsp;</td>
          <td>&nbsp;</td>
    	</tr>
    	<tr>
          <td>&nbsp;</td>
          <td style="text-align:right">&nbsp;</td>
    	</tr>
    	<tr>
      	  <td width="88%"> <h3><bean:message key="title.mfchecklist.detail"/></h3></td>
          <td width="12%" style="text-align:right">&nbsp;
          </td>
    	</tr>
    	<tr>
      	  <td colspan="2"> <hr/> </td>
    	</tr>
      </thead>
      <%@ include file="read_MFCheckList.jsp" %>    
    </table>
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
           <!--<td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image8" border="0" id="Image8" /></a></td>
           <td><a href="ToTrack.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
        -->
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
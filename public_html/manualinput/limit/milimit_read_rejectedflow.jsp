<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.component.bizstructure.app.bus.ITeam,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.manualinput.limit.LmtDetailForm" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
 <head>
  <!-- InstanceBeginEditable name="doctitle" -->
  <title>Untitled Document</title>
  <!-- InstanceEndEditable -->
  
  <!-- InstanceBeginEditable name="CssStyle" -->
  
  <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
  <!-- InstanceEndEditable -->
  <!-- InstanceBeginEditable name="head" -->
  <script type="text/javascript" src="js/emulation.js"></script>
  <script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
  <script language="JavaScript" src="js/itgCheckForm.js"></script>
  <script type="text/javascript" src="js/calendar.js"></script>
  <script type="text/javascript" src="js/calDriver.js"></script>
  <script type="text/javascript" src="js/imageNavigation.js"></script>


  <script language="javascript">
     function backToLimitList(sessionCriteria){
        	 document.location.href = "MICustomerSearch.do?event=rejectedFlow_list_limit&rejectedFlow=true&searchFlag=false&sessionCriteria="+sessionCriteria;
     }
   </script>


 </head>
 <body >
<%
String actionStr1 = "com.integrosys.cms.ui.manualinput.limit.LmtDetailAction";
String migratedFlag = "N";
	 migratedFlag = (String)session.getAttribute(actionStr1+".migratedFlag");
if(migratedFlag==null)
	 {
		 migratedFlag = "N"; 
	 }
String sessionCriteria = (String) request.getAttribute("sessionCriteria");
request.setAttribute("sessionCriteria", sessionCriteria);
System.out.println(">>>>>>>lmtlistcmd>>>>>>>>session criteria"+sessionCriteria); 
%>
   <html:form action="MILimit.do">
    <input type="hidden" name="event" value="<%= request.getAttribute("event")%>" />
    <html:hidden property="limitId" />
    
    
    <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>
    <table align="right" width="100%"  class="tblFormSection">
<tr >
<td width="25%" >
<%if(migratedFlag.equals("Y")){ %>
      (Migrated Record)
      <%}%>
</td>
<td >&nbsp;</td>
</tr>
</table>
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
      	  <td width="88%"> <h3><bean:message key="title.facility.details"/></h3></td>
           <%
          if(request.getAttribute("event").equals("custread")){ 
          %>
        	  <!--<td align="right">
        	  <input type="button" name="Button" value="Edit" class="btnNormal" style="width:50"
                  onclick="editLmtDetails()"/></td>
         --><% } %>     
    	</tr>
    	<tr>
      	  <td colspan="2"> <hr/> </td>
    	</tr>
      </thead>
      <%@ include file="milimit_read_helper_rejected.jsp" %>  
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr> 
      <tr>
        <td> <jsp:include page="view_audit_details.jsp"></jsp:include></td>
      </tr> 
    </table>
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" style="text-align:center"><a href="javascript:backToLimitList('<%=sessionCriteria%>')"><img src="img/return1.gif" name="Image51" border="0" id="Image5" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
     
        
    </table>
  </html:form>
 </body>
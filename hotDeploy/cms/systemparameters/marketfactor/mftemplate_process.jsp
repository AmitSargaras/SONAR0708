<%@ page import="com.integrosys.cms.ui.systemparameters.marketfactor.EventConstant" %>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
 <head>
  <!-- InstanceBeginEditable name="doctitle" -->
  <title>Maintain MF Template</title>
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
 </head>
 <body onload="MM_preloadImages('img/refresh2.gif','img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
   <script language="javascript">
   <!--
     function performApprove()
     {
		document.forms[0].event.value = '<%=EventConstant.EVENT_APPROVE%>';
        document.forms[0].submit();
     }

     function performReject()
     {
		document.forms[0].event.value = '<%=EventConstant.EVENT_REJECT%>';
        document.forms[0].submit();
     } 
     --> 
   </script>
   <html:form action="MaintainMFTemplate.do">	
    <input type="hidden" name="event" value="" />   
	
    <html:hidden property="MFTemplateID"/>
	
	<bean:define id="itrxValue" name="com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateAction.MFTemplateTrxObj" type="com.integrosys.cms.app.propertyparameters.trx.marketfactor.IMFTemplateTrxValue" scope="session"/>

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
      	  <td width="88%"> <h3><bean:message key="title.mftemplate.detail"/></h3></td>
          <td width="12%" style="text-align:right">&nbsp;
          </td>
    	</tr>
    	<tr>
      	  <td colspan="2"> <hr/> </td>
    	</tr>
      </thead>
      <%@ include file="mftemplate_read_helper.jsp" %>
      <tr><td>&nbsp;</td></tr>
      <tr><td>&nbsp;</td></tr>		
      <tr>
        <td>
	  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
              <tr>
                <td class="fieldname"><bean:message key="label.remarks"/></td>
                <td class="odd">
					<html:textarea property="remarks" rows="3" cols="120"/>&nbsp;
					<html:errors property="remarks"/>
                </td>
              </tr>
              <tr>
                <td class="fieldname"><bean:message key="label.last.action.by"/></td>
               	<td class="even"><%=itrxValue.getUserInfo()%>&nbsp;</td>
              </tr>
              <tr class="odd">
                <td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
                <td><integro:wrapper value="<%=itrxValue.getRemarks()%>"/>&nbsp;</td>
              </tr>
            </tbody>
          </table>
	</td>
      </tr>	    
    </table>
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td> 
      </tr>
      <tr>
        <td><a href ="javascript:performApprove()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
        <td><a href ="javascript:performReject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
        <td><a href="ToDo.do" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </html:form>
 </body>
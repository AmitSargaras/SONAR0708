<%@ page import="com.integrosys.cms.ui.systemparameters.marketfactor.EventConstant,
				com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.propertyparameters.trx.marketfactor.IMFTemplateTrxValue,
                 com.integrosys.cms.app.propertyparameters.trx.marketfactor.OBMFTemplateTrxValue" %>

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
     function performDelete()
     {
        document.forms[0].event.value = '<%=EventConstant.EVENT_DELETE%>';
        document.forms[0].submit();
     }

     function performBack()
     {
		var fromEvent = '<%= (String) request.getAttribute("fromEvent") %>';
		if (fromEvent == 'todo')   {
			document.location.href = 'ToDo.do';
		}
		else {
			document.location.href = 'MaintainMFTemplate.do?event=<%=EventConstant.EVENT_LIST%>';
		}
     }
   </script>
 <%             
	IMFTemplateTrxValue itrxValue = null;
    Object obj1 = session.getAttribute("com.integrosys.cms.ui.systemparameters.marketfactor.MFTemplateAction.MFTemplateTrxObj");
	String status = "";
    if( obj1 != null ) {
        itrxValue = (OBMFTemplateTrxValue)obj1;
		status = itrxValue.getStatus();
	}	
%>
   <html:form action="MaintainMFTemplate.do">
   <input type="hidden" name="event" value="" />
    
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

    </table>
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
	    <tr><td>&nbsp;</td></tr>
	    <% if ( status.equals( ICMSConstant.STATE_REJECTED_CREATE ) || 
				status.equals( ICMSConstant.STATE_REJECTED_UPDATE ) || 
				status.equals( ICMSConstant.STATE_REJECTED_DELETE ) ) { %>
	        <tr>
	            <td colspan="2">
	                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
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
	    <% } %>
	</table>
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
		<td><a href="javascript:performDelete()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/delete2.gif',1)"><img src="img/delete1.gif" name="Image8" border="0" id="Image8" /></a></td>
        <td><a href="javascript:performBack()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </html:form>
 </body>
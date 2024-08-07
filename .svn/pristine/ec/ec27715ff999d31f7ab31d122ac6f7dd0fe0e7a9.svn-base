<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.cms.ui.common.constant.IGlobalConstant,com.integrosys.component.bizstructure.app.bus.ITeam,com.integrosys.base.uiinfra.common.ICommonEventConstant,com.integrosys.cms.ui.manualinput.limit.LmtDetailForm" %>

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
 </head>
 <body onload="MM_preloadImages('img/refresh2.gif','img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
   <script language="javascript">
     function submitPage()
     {
        document.forms[0].event.value = 'close';
        document.forms[0].submit();
     }
   </script>
   <%
   	String from_event = "close";
   	boolean isProcess = false;
   	boolean isTrack = false;
   	String forward_event = (String) request.getParameter("event");
   	if ("track".equals(forward_event) || "track_return".equals(forward_event)) {
   		from_event = "track";
   		isTrack = true;
   	}   	
 %>
   <html:form action="MILimit.do">
    <input type="hidden" name="event"/>
    <input type="hidden" name="fromEvent" value="<%=request.getParameter("event") %>" />
    <html:hidden property="limitProfileID"/>	
	<html:hidden property="customerID"/>
    <html:hidden property="limitId"/>
    <p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;&nbsp;&nbsp;&nbsp;</p>
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
          <td width="12%" style="text-align:right">&nbsp;
          </td>
    	</tr>
    	<tr>
      	  <td colspan="2"> <hr/> </td>
    	</tr>
      </thead>
      <%@ include file="milimit_read_helper.jsp" %>    
       <%
           	if (isTrack) {
           			ILimitTrxValue iLimitTrxValue = (ILimitTrxValue) session
           					.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");
           %>
        	<tr>
				<td>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0" class="tblFormSection">
						<thead>
							<tr>
								<td colspan="2"><h3>Remarks</h3>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<hr />
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="2">
									<table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="0" class="tblInfo">
										<tbody>
											<tr>
												<td class="fieldname">Last Action By</td>
												<td class="even"><%=iLimitTrxValue.getUserInfo()%>&nbsp;</td>
											</tr>
											<tr class="odd">
												<td class="fieldname">Last Remarks Made</td>
												<td width="75%"><integro:empty-if-null value="<%=iLimitTrxValue.getRemarks()%>" /></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

			<%
				}
			%>  
    </table>
    
    <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <%
        	if (isTrack) {
        %>
           <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
           <td>&nbsp;</td>
        <%
        	} else {
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
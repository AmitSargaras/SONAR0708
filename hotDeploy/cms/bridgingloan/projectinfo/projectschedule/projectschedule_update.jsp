<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Add Project Schedule
* Description: This screen allows the adding new Project Schedule
* Click on the “Add New Progress Stage” button.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date: 2007/03/09 04:34:20 $
* Tag: $Name:  $
*/
%>

<%
    try {
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);
%>

<html>
<head>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<style type="text/css">
<!--
.style1 {color: #0000FF}
//-->
</style>
<script src="js/calendar.js"></script>
<script src="js/calDriver.js"></script>
<script>
function submitPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}
</script>
</head>

<body onload="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_ProjectSchedule.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="projectScheduleIndex" value="<%=request.getParameter("projectScheduleIndex")%>"/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td width="81%" ><h3><bean:message key="label.bridgingloan.proj.sche.title.add"/></h3></td>
            <td width="19%" style="text-align:right" valign="bottom" >&nbsp; </td>
        </tr>
        <tr>
            <td colspan="2"> <hr/> </td>
        </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr class="odd">
                    <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prgs.stg"/><span class="style1">*</span></td>
                    <td width="30%">
                        <html:text property="progressStage" /><html:errors property="progressStage"/>
                    </td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.prop.st.date"/></td>
                    <td>
                        <html:text property="startDate" readonly="true" />
                        <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="showCalendar('startDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                        <html:errors property="startDate"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.prop.end.date"/></td>
                    <td>
                        <html:text property="endDate" readonly="true" />
                        <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="showCalendar('endDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                        <html:errors property="endDate"/></td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.act.st.date"/></td>
                    <td>
                        <html:text property="actualStartDate" readonly="true" />
                        <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="showCalendar('actualStartDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                        <html:errors property="actualStartDate"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.act.end.date"/></td>
                    <td>
                        <html:text property="actualEndDate" readonly="true" />
                        <img src="img/calendara.gif"  name="Image723" border="0" id="Image723" onclick="showCalendar('actualEndDate', 'dd/mm/y')" onmouseover="MM_swapImage('Image723','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                        <html:errors property="actualEndDate"/></td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                    <td>
                        <html:textarea property="remarks" rows="3" cols="80" />&nbsp;
                        <html:errors property="remarks"/><html:errors property="remarks"/></td>
                </tr>
            </tbody>
            </table>
        </td>
    </tr>
    </tbody>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
    <tr>
        <td style="text-align:center">&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <%
            if (event.equals("maker_prepare_create") || event.equals("create")) { %>
                <a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0"/></a>
                <a href="javascript:gotoPage('BridgingLoan.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0"/></a>
            <% }
            else { %>
                <a href="javascript:submitPage('update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3"  border="0" id="Image3" /></a>
                <a href="javascript:gotoPage('BridgingLoan.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
            <% } %>
        </td>
    </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
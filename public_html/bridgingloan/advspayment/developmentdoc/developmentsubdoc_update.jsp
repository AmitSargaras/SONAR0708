<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.ui.bridgingloan.advspayment.DevelopmentDocForm"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Update Development Sub Documents
* Description: This screen allows the adding of new development sub documents.
* It can be reached by clicking on the “ADD DOCUMENT” tab on the top of the Add development documents screen.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
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

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_DevelopmentDoc.do" >
<input type="hidden" name="event" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="developmentDocIndex" value="<%=request.getParameter("developmentDocIndex")%>"/>
<input type="hidden" name="progressStage" value="<%=request.getParameter("progressStage")%>" />
<input type="hidden" name="projectScheduleIndex" value="<%=request.getParameter("projectScheduleIndex")%>" />

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="81%"><h3><bean:message key="label.bridgingloan.sub.dev.doc.title.add"/></h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
    <tr>
        <td >
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="even">
                <td width="26%" class="fieldname"><bean:message key="label.bridgingloan.doc.name"/><span class="style1">*</span> </td>
                <td width="74%">
                    <html:text property="docName" maxlength="40" /> <html:errors property="docName" />
                </td>
            </tr>
            <tr class="odd">
                <td class="fieldname" width="26%"><bean:message key="label.bridgingloan.doc.ref"/></td>
                <td width="74%">
                    <html:text property="docRef" maxlength="40" /> <html:errors property="docRef" />
                </td>
            </tr>
            <tr class="even">
                <td class="fieldname" width="26%"><bean:message key="label.bridgingloan.date.rcv"/><span class="style1">*</span></td>
                <td width="74%">
                    <html:text property="receiveDate" maxlength="40" readonly="true" />
                    <img src="img/calendara.gif"  name="Image5" border="0" id="Image5" onclick="return showCalendar('receiveDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image5','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="receiveDate" /></td>
            </tr>
            <tr class="odd">
                <td class="fieldname" width="26%"><bean:message key="label.bridgingloan.doc.date"/><span class="style1">*</span></td>
                <td width="74%">
                    <html:text property="docDate" maxlength="40" readonly="true" />
                    <img src="img/calendara.gif"  name="Image5" border="0" id="Image5" onclick="return showCalendar('docDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image5','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="docDate" /></td>
            </tr>
            <tr class="even">
                <td class="fieldname" width="26%"><bean:message key="label.bridgingloan.rem"/></td>
                <td width="74%">
                    <html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
                    <html:errors property="remarks"/>
                </td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td height="14" style="text-align:right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
        <td height="14" style="text-align:center" valign="bottom">
            <%
            if (event.equals("maker_prepare_create_item") || event.equals("create_item")) { %>
                <a href="javascript:submitPage('create_item')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0"/></a>
                <a href="javascript:gotoPage('BL_DevelopmentDoc.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0"/></a>
            <% }
            else { %>
                <a href="javascript:submitPage('update_item')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3"  border="0" id="Image3" /></a>
                <a href="javascript:gotoPage('BL_DevelopmentDoc.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
            <% } %>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
    </tbody>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
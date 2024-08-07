<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.ui.bridgingloan.advspayment.DevelopmentDocForm,
                 com.integrosys.cms.app.bridgingloan.bus.IProjectSchedule,
                 com.integrosys.cms.app.bridgingloan.bus.IDevelopmentDoc"%>

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
        String isEdit = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.isEdit");
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);
        String current_page = (String) request.getParameter("current_page");

        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        IProjectSchedule[] objProjectSchedule = (IProjectSchedule[]) objBridgingLoan.getProjectScheduleList();

        int projectScheduleIndex = 0;
        String scheduleIndex = request.getParameter("projectScheduleIndex");
        if (scheduleIndex != null || !scheduleIndex.equals("")) {
            projectScheduleIndex = Integer.parseInt(scheduleIndex);
        }

        IDevelopmentDoc[] objDevelopmentDoc = (IDevelopmentDoc[]) objProjectSchedule[projectScheduleIndex].getDevelopmentDocList();
        int developmentDocIndex = Integer.parseInt(request.getParameter("developmentDocIndex"));
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
<input type="hidden" name="current_page" value="<%=current_page%>" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="developmentDocIndex" value="<%=request.getParameter("developmentDocIndex")%>"/>
<input type="hidden" name="progressStage" value="<%=request.getParameter("progressStage")%>" />
<input type="hidden" name="projectScheduleIndex" value="<%=projectScheduleIndex%>" />

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
                <tr class="odd">
                    <td width="26%" class="fieldname"><bean:message key="label.bridgingloan.doc.name"/> </td>
                    <td width="74%"><integro:htmltext value="<%=objDevelopmentDoc[developmentDocIndex].getDocName()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname" width="26%"><bean:message key="label.bridgingloan.doc.ref"/></td>
                    <td width="74%"><integro:empty-if-null value="<%=objDevelopmentDoc[developmentDocIndex].getDocRef()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname" width="26%"><bean:message key="label.bridgingloan.date.rcv"/></td>
                    <td width="74%"><integro:date object="<%=objDevelopmentDoc[developmentDocIndex].getReceiveDate()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname" width="26%"><bean:message key="label.bridgingloan.doc.date"/></td>
                    <td width="74%"><integro:date object="<%=objDevelopmentDoc[developmentDocIndex].getDocDate()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname" width="26%"><bean:message key="label.bridgingloan.rem"/></td>
                    <td width="74%"><integro:htmltext value="<%=objDevelopmentDoc[developmentDocIndex].getRemarks()%>" />&nbsp;</td>
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
            if ((isEdit != null && isEdit.equals("true"))) {
                if (event.equals("maker_prepare_delete_item")) {
            %>
                    <a href="javascript:submitPage('delete_item')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                    <a href="javascript:submitPage('maker_prepare_update')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
            <%
                }
                else if (current_page.equals("update_page")) { %>
                    <a href="javascript:submitPage('maker_prepare_update')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
                }
                else {  %>
                    <a href="javascript:submitPage('view')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
                }
            }
            else if(event.equals("view_item")) { %>
                <a href="javascript:submitPage('view')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
            } else { %>
                <a href="javascript:submitPage('delete_item')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                <a href="javascript:submitPage('view')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
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
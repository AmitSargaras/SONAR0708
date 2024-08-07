<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IProjectSchedule"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: View Project Schedule
* Description: This screen allows viewing new Project Schedule
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
        int projectScheduleIndex = Integer.parseInt(request.getParameter("projectScheduleIndex"));

        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        IProjectSchedule[] objProjectSchedule = (IProjectSchedule[]) objBridgingLoan.getProjectScheduleList();
%>

<html>
<head>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script>
function submitPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}
</script>
</head>

<body onload="MM_preloadImages('img/return1.gif','img/delete1.gif','img/cancel1.gif')">
<html:form action="BL_ProjectSchedule.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="projectScheduleIndex" value="<%=projectScheduleIndex%>"/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
        <tr>
            <td width="81%" ><h3><bean:message key="label.bridgingloan.proj.sche.title.view"/></h3></td>
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
                    <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prgs.stg"/></td>
                    <td width="30%"><integro:htmltext value="<%=objProjectSchedule[projectScheduleIndex].getProgressStage()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.prop.st.date"/></td>
                    <td><integro:date object="<%=objProjectSchedule[projectScheduleIndex].getStartDate()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.prop.end.date"/></td>
                    <td><integro:date object="<%=objProjectSchedule[projectScheduleIndex].getEndDate()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.act.st.date"/></td>
                    <td><integro:date object="<%=objProjectSchedule[projectScheduleIndex].getActualStartDate()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.act.end.date"/></td>
                    <td><integro:date object="<%=objProjectSchedule[projectScheduleIndex].getActualEndDate()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                    <td width="30%"><integro:empty-if-null value="<%=objProjectSchedule[projectScheduleIndex].getRemarks()%>" />&nbsp;</td>
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
           <td >&nbsp;</td>
        </tr>
        <tr  style="text-align:center">
        <%
        if(event.equals("view")){
            %><td height="14" style="text-align:center" valign="bottom"><a href="javascript:goNextPage('projectinfo')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a></td><%
        }
        else{
            %>
            <td><a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
            <a href="javascript:goNextPage('projectinfo')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a></td>
            <%
        }
        %>
        </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
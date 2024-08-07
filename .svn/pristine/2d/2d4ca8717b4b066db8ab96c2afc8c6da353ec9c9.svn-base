<%@ page import="java.util.ArrayList,
                 com.integrosys.cms.app.bridgingloan.bus.IDevelopmentDoc,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
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
* Purpose: View Development Documents
* Description: This screen allows the view of Process Stage.
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

        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        IProjectSchedule[] objProjectSchedule = null;
        if (objBridgingLoan != null)
            objProjectSchedule = (IProjectSchedule[]) objBridgingLoan.getProjectScheduleList();

        String progressStage = String.valueOf(request.getParameter("progressStage"));
        int projectScheduleIndex = 0;
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
function JumpOnSelectactive(selectObj, index) {
    var selectIndex = selectObj.selectedIndex;
	if (selectObj.options[selectIndex].value == "view")
    	document.forms[0].event.value = "view_item";
    else if (selectObj.options[selectIndex].value == "update")
        document.forms[0].event.value = "maker_prepare_update_item";
    else if (selectObj.options[selectIndex].value == "delete")
        document.forms[0].event.value = "maker_prepare_delete_item";

    document.forms[0].developmentDocIndex.value = index;
    document.forms[0].submit();
}

function gotoPage(actionPage, event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif')">
<html:form action="BL_DevelopmentDoc.do" >
<input type="hidden" name="event" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="progressStage" value="<%=progressStage%>" />
<input type="hidden" name="developmentDocIndex"/>
<input type="hidden" name="projectScheduleIndex" value="<%=projectScheduleIndex%>" />

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="81%" ><h3><bean:message key="label.bridgingloan.dev.doc.title.add"/></h3></td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
    <tr>
        <td >
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr class="odd">
                    <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prgs.stg"/>  </td>
                    <td width="30%"><integro:htmltext value="<%=progressStage%>" />
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
        <td style="text-align:right" valign="bottom"></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:10px ">
                <thead>
                <tr>
                    <td class="fieldname" width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                    <td class="fieldname" width="*"><bean:message key="label.bridgingloan.doc.name"/></td>
                    <td class="fieldname" width="12%"><bean:message key="label.bridgingloan.date.rcv"/></td>
                    <td class="fieldname" width="12%"><bean:message key="label.bridgingloan.doc.date"/></td>
                    <td class="fieldname" width="10%"><bean:message key="label.bridgingloan.action"/> </td>
                </tr>
                </thead>
                <tbody>
                <%
                    int index=0;
                    if (objProjectSchedule != null) {
                        for (int i=0; i<objBridgingLoan.getProjectScheduleList().length; i++)
                            if (objProjectSchedule[i].getProgressStage().equals(progressStage))
                                projectScheduleIndex = i;

                    if (objProjectSchedule != null && objProjectSchedule[projectScheduleIndex].getDevelopmentDocList() != null && objProjectSchedule[projectScheduleIndex].getProgressStage().equals(progressStage)) {
                        IDevelopmentDoc[] objDevelopmentDoc = (IDevelopmentDoc[]) objProjectSchedule[projectScheduleIndex].getDevelopmentDocList();
                        for ( ; index<objDevelopmentDoc.length; index++) {
                            if (objDevelopmentDoc[index].getIsDeletedInd() != true) {
                %>
                <tr class='<%=(index%2==0?"even":"odd")%>'>
                    <td style="text-align:center" class="index"><%=(index+1)%></td>
                    <td><integro:empty-if-null value="<%=objDevelopmentDoc[index].getDocName()%>"/></td>
                    <td style="text-align:center"><integro:date object="<%=objDevelopmentDoc[index].getReceiveDate()%>"/></td>
                    <td style="text-align:center"><integro:date object="<%=objDevelopmentDoc[index].getDocDate()%>" /></td>
                    <td style="text-align:center">
                    <% if ((isEdit != null && isEdit.equals("true")) && (event.equals("maker_prepare_delete") || event.equals("delete_item"))) { %>
                        <a href="BL_DevelopmentDoc.do?event=maker_prepare_delete_item&current_page=view_page&progressStage=<%=progressStage%>&developmentDocIndex=<%=index%>&projectScheduleIndex=<%=projectScheduleIndex%>">Delete</a>
                    <% } else if (event.equals("view")) { %>
                        <a href="BL_DevelopmentDoc.do?event=view_item&current_page=view_page&progressStage=<%=progressStage%>&developmentDocIndex=<%=index%>&projectScheduleIndex=<%=projectScheduleIndex%>">View</a>
                    <% } %>
                    </td>
                </tr>
                <% } } } }
                if (index <= 0) { %>
                <tr class="odd">
                    <td colspan="10"><bean:message key="label.common.empty"/></td>
                </tr>
                <% } %>
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
            if(event.equals("view")) {
                %><a href="javascript:gotoPage('BL_AdvsPayment.do','list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
            }
            %>
        </td>
    </thead>
    <tbody>
    <tr>
        <td style="text-align:center">&nbsp;</td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
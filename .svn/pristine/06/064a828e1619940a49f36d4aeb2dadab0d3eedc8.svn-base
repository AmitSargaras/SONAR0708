<%@ page import="java.util.ArrayList,
                 com.integrosys.cms.app.bridgingloan.bus.IDevelopmentDoc,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IProjectSchedule,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Update Development Documents
* Description: This screen allows the adding of Process Stage
* Click on the “Add New Documents” button from ‘View Advances/ Payment Details Summary’ screen.
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

        int projectScheduleIndex = -1;
        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        String progressStage = String.valueOf(request.getParameter("progressStage"));

        IProjectSchedule[] objProjectSchedule = null;
        if (objBridgingLoan != null)
            objProjectSchedule = (IProjectSchedule[]) objBridgingLoan.getProjectScheduleList();

        if (event.equals("maker_refresh") || event.equals("maker_prepare_create") || event.equals("create") || event.equals("maker_prepare_update")) {
            if (request.getAttribute("progressStageLabels") == null || request.getAttribute("progressStageValues") == null) {
                pageContext.setAttribute("progressStageLabels", new ArrayList());
                pageContext.setAttribute("progressStageValues", new ArrayList());
            }
            else {
                pageContext.setAttribute("progressStageLabels", (List) request.getAttribute("progressStageLabels"));
                pageContext.setAttribute("progressStageValues", (List) request.getAttribute("progressStageValues"));
            }

            String scheduleIndex = (String) request.getParameter("projectScheduleIndex");
            if (scheduleIndex != null)
                projectScheduleIndex = Integer.parseInt(scheduleIndex);
            else {
                for (int i=0; i<objProjectSchedule.length; i++) {
                    if (objProjectSchedule[i].getProgressStage().equals(progressStage)) {
                        projectScheduleIndex = i;
                        break;
                    }
                }
            }
        }
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

    document.forms[0].current_page.value = "update_page";
    document.forms[0].developmentDocIndex.value = index;
    document.forms[0].submit();
}

function submitPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}

function gotoPage(actionPage, event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}

function selectProgressStage(selectObj) {
    var selectIndex = selectObj.selectedIndex;
    document.forms[0].projectScheduleIndex.value = selectIndex - 1;
    document.forms[0].event.value = "maker_refresh";
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_DevelopmentDoc.do" >
<input type="hidden" name="event" />
<input type="hidden" name="current_page" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="projectScheduleIndex" value="<%=projectScheduleIndex%>" />
<input type="hidden" name="developmentDocIndex" />

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
                    <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prgs.stg"/> <span class="style1">*</span> </td>
                    <td width="30%">
                        <html:select name="progressStage" property="progressStage" value="<%=progressStage%>" onchange="javascript:selectProgressStage(this);" >
                            <html:option value="">Please Select </html:option>
                            <html:options name="progressStageValues" labelName="progressStageLabels" />
                        </html:select>
                        <html:errors property="progressStage"/></td>
                </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:right" valign="bottom">
        <input type="button" name="button23" id="button" value="Add Document" class="btnNormal" onclick="submitPage('maker_prepare_create_item')" style="width:130px"/>
    </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>
            <table name="tbl1" id="tbl1"  width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:10px ">
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
                    if (projectScheduleIndex != ICMSConstant.INT_INVALID_VALUE && objProjectSchedule != null &&
                        objProjectSchedule[projectScheduleIndex].getDevelopmentDocList() != null &&
                        objProjectSchedule[projectScheduleIndex].getDevelopmentDocList().length > 0) {
                        IDevelopmentDoc[] objDevelopmentDoc = (IDevelopmentDoc[]) objProjectSchedule[projectScheduleIndex].getDevelopmentDocList();
                        if (objDevelopmentDoc != null) {
                            for (int index=0; index<objDevelopmentDoc.length; index++) {
                                if (objDevelopmentDoc[index].getIsDeletedInd() != true) {
                %>
                <tr class='<%=(index%2==0?"even":"odd")%>'>
                    <td style="text-align:center" class="index"><%=(index+1)%></td>
                    <td><integro:empty-if-null value="<%=objDevelopmentDoc[index].getDocName()%>"/></td>
                    <td style="text-align:center"><integro:date object="<%=objDevelopmentDoc[index].getReceiveDate()%>"/></td>
                    <td style="text-align:center"><integro:date object="<%=objDevelopmentDoc[index].getDocDate()%>" /></td>

                    <td style="text-align:center"><select name="select3" onChange="JumpOnSelectactive(this, <%=index%>)">
                            <option selected="selected">Please Select</option>
                            <option value="view">View</option>
                            <option value="update">Edit</option>
                            <option value="delete">Delete</option>
                        </select>
                    </td>
                </tr>
                <% } } } } else { %>
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
            <a href="javascript:gotoPage('BL_AdvsPayment.do','list_summary')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/return2.gif',1)"><img src="img/return1.gif" name="Image42" width="70" height="20" border="0"/></a>
        </td>
    </tr>
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
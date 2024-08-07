<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.bridgingloan.bus.*,
                 java.util.Arrays"%>

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
        OBProjectSchedule objStagingProjectSchedule = (OBProjectSchedule) request.getAttribute("objStagingProjectSchedule");
        OBProjectSchedule objActualProjectSchedule = (OBProjectSchedule) request.getAttribute("objActualProjectSchedule");
//        OBProjectSchedule objProjectSchedule = (objActualProjectSchedule == null ? objStagingProjectSchedule : objActualProjectSchedule);
        String progressStage = String.valueOf(request.getParameter("progressStage"));
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
<input type="hidden" name="developmentDocIndex" value="<%=request.getParameter("developmentDocIndex")%>"/>

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
                    <td width="30%"><integro:htmltext value="<%=progressStage%>" /></td>
                </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </td>
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
                    IDevelopmentDoc[] developmentDocActualList = null;
                    if (objActualProjectSchedule != null) //actual will be null if this is new record
                        developmentDocActualList = (IDevelopmentDoc[]) objActualProjectSchedule.getDevelopmentDocList();
                    IDevelopmentDoc[] developmentDocStagingList = (IDevelopmentDoc[]) objStagingProjectSchedule.getDevelopmentDocList();

                    if (developmentDocActualList != null || developmentDocStagingList != null) {
                        List compResult = CompareOBUtil.compOBArray(developmentDocStagingList, developmentDocActualList);
                        ArrayList list = new ArrayList(compResult);
                        pageContext.setAttribute("developmentDocList",list);
                    }
                    int index = 0;
                %>
                <logic:present name="developmentDocList">
                    <logic:iterate id="compResult" name="developmentDocList" type="com.integrosys.base.techinfra.diff.CompareResult">
                    <%
                        IDevelopmentDoc stagingParameter = (IDevelopmentDoc) compResult.getObj();
                        index++;
                    %>
                    <tr class='<%=(index%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="<bean:write name="compResult" property="key" />"><%=index%></td>
                        <td><integro:empty-if-null value="<%=stagingParameter.getDocName()%>"/></td>
                        <td style="text-align:center"><integro:date object="<%=stagingParameter.getReceiveDate()%>"/></td>
                        <td style="text-align:center"><integro:date object="<%=stagingParameter.getDocDate()%>" /></td>
                        <td style="text-align:center">
                            <a href="BL_DevelopmentDoc.do?event=checker_view_item&commonRef=<%=stagingParameter.getCommonRef()%>&progressStage=<%=progressStage%>">View</a>
                        </td>
                    </tr>
                    </logic:iterate>
                </logic:present>
                <logic:notPresent name="developmentDocList">
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                </logic:notPresent>
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
            <a href="javascript:gotoPage('BL_AdvsPayment.do','checker_list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
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
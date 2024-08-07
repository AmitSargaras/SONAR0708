<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.ui.bridgingloan.advspayment.DevelopmentDocForm,
                 com.integrosys.cms.app.bridgingloan.bus.IProjectSchedule,
                 com.integrosys.cms.app.bridgingloan.bus.IDevelopmentDoc,
                 com.integrosys.cms.app.bridgingloan.bus.OBDevelopmentDoc,
                 com.integrosys.base.techinfra.diff.CompareOBUtil"%>

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
        OBDevelopmentDoc objStagingDevelopmentDoc = (OBDevelopmentDoc) request.getAttribute("objDevelopmentDoc");
        OBDevelopmentDoc objActualDevelopmentDoc = (OBDevelopmentDoc) request.getAttribute("objActualDevelopmentDoc");
        OBDevelopmentDoc objDevelopmentDoc = ((objActualDevelopmentDoc != null && objStagingDevelopmentDoc != null) || objActualDevelopmentDoc == null ? objStagingDevelopmentDoc : objActualDevelopmentDoc);
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
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_DevelopmentDoc.do" >
<input type="hidden" name="event" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="developmentDocIndex" value="<%=request.getParameter("developmentDocIndex")%>"/>
<input type="hidden" name="progressStage" value="<%=request.getParameter("progressStage")%>"/>
<input type="hidden" name="commonRef" value="<%=request.getParameter("commonRef")%>"/>

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
                    <td width="26%" class="<%=CompareOBUtil.compOB(objStagingDevelopmentDoc, objActualDevelopmentDoc,"docName")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.doc.name"/> </td>
                    <td width="74%"><integro:htmltext value="<%=objDevelopmentDoc.getDocName()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objStagingDevelopmentDoc, objActualDevelopmentDoc,"docRef")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.doc.ref"/></td>
                    <td><integro:empty-if-null value="<%=objDevelopmentDoc.getDocRef()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objStagingDevelopmentDoc, objActualDevelopmentDoc,"receiveDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.date.rcv"/></td>
                    <td><integro:date object="<%=objDevelopmentDoc.getReceiveDate()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objStagingDevelopmentDoc, objActualDevelopmentDoc,"docDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.doc.date"/></td>
                    <td><integro:date object="<%=objDevelopmentDoc.getDocDate()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objStagingDevelopmentDoc, objActualDevelopmentDoc,"remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/></td>
                    <td><integro:htmltext value="<%=objDevelopmentDoc.getRemarks()%>" />&nbsp;</td>
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
        <td style="text-align:center">
            <a href="javascript:submitPage('checker_view')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
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
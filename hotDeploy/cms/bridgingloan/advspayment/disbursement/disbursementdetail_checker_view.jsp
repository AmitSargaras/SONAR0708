<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursement,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursementDetail,
                 com.integrosys.cms.app.bridgingloan.bus.OBDisbursementDetail,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.UIUtil"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Update Disbursement Detail
* Description: This screen allows the adding/update of new Disbursement Detail.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        OBDisbursementDetail objStagingDisbursementDetail = (OBDisbursementDetail) request.getAttribute("objStagingDisbursementDetail");
        OBDisbursementDetail objActualDisbursementDetail = (OBDisbursementDetail) request.getAttribute("objActualDisbursementDetail");
        OBDisbursementDetail objDisbursementDetail = ((objActualDisbursementDetail != null && objStagingDisbursementDetail != null) || objActualDisbursementDetail == null ? objStagingDisbursementDetail : objActualDisbursementDetail);
        String purpose = String.valueOf(request.getParameter("purpose"));
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
function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_DisbursementDetail.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="disbursementDetailIndex" />

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td width="81%" ><h3><bean:message key="label.bridgingloan.dis.detail.title.add"/></h3></td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr class="odd">
                    <td width="20%" class="<%=CompareOBUtil.compOB(objStagingDisbursementDetail, objActualDisbursementDetail,"disbursementDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.dis.date"/></td>
                    <td width="30%"><integro:date object="<%=objDisbursementDetail.getDisbursementDate()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td><bean:message key="label.bridgingloan.purp.dis"/></td>
                    <td><integro:htmltext value="<%=purpose%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objStagingDisbursementDetail, objActualDisbursementDetail,"subpurpose")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.sub.purp.dis"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail.getSubpurpose()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objStagingDisbursementDetail, objActualDisbursementDetail,"invoiceNumber")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.invoice.no"/></td>
                    <td><integro:empty-if-null value="<%=objDisbursementDetail.getInvoiceNumber()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <%
                        Amount stagingDisAmount = (objStagingDisbursementDetail == null) ? null : objDisbursementDetail.getInvoiceAmount();
                        Amount actualDisAmount = (objActualDisbursementDetail == null) ? null : objActualDisbursementDetail.getInvoiceAmount();
                    %>
                    <td class="<%=UIUtil.isAmountUnChanged(stagingDisAmount, actualDisAmount, true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.invoice.amt"/></td>
                    <td><integro:amount amount="<%=objDisbursementDetail.getInvoiceAmount()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objStagingDisbursementDetail, objActualDisbursementDetail,"disbursementMode")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.mode.dis"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail.getDisbursementMode()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objStagingDisbursementDetail, objActualDisbursementDetail,"payee")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.payee"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail.getPayee()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objStagingDisbursementDetail, objActualDisbursementDetail,"referenceNumber")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.ref.no"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail.getReferenceNumber()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objStagingDisbursementDetail, objActualDisbursementDetail,"glReferenceNumber")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.gl.ref.no"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail.getGlReferenceNumber()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objStagingDisbursementDetail, objActualDisbursementDetail,"remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail.getRemarks()%>" />&nbsp;</td>
                </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <a href="javascript:gotoPage('BL_Disbursement.do','checker_view')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
        </td>
    </tr>
    <tr>
        <td style="text-align:center">&nbsp;</td>
    </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
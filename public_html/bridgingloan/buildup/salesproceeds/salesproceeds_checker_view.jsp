<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.OBSalesProceeds,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.app.bridgingloan.bus.OBBuildUp"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Checker View Sale Proceeds
* Description: This is a screen checker to view the details of individual units sale proceed received.
*
* @author $Author: KLYong  $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>
<%
    try {
        OBSalesProceeds objStagingSalesProceeds = (OBSalesProceeds) request.getAttribute("objStagingSalesProceeds");
        OBSalesProceeds objActualSalesProceeds = (OBSalesProceeds) request.getAttribute("objActualSalesProceeds");
        OBSalesProceeds objSalesProceeds = ((objActualSalesProceeds != null && objStagingSalesProceeds != null) || objActualSalesProceeds == null ? objStagingSalesProceeds : objActualSalesProceeds);
        String amountToBeReceived = (String ) request.getParameter("amountToBeReceived");
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

</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_SalesProceeds.do">
<input type="hidden" name="event" />
<input type="hidden" name="salesProceedsIndex" value="<%=request.getParameter("salesProceedsIndex")%>"/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td><h3><bean:message key="label.bridgingloan.sale.prcd.title.add"/></td> </h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="even">
                <td width="35%" class="<%=CompareOBUtil.compOB(objStagingSalesProceeds, objActualSalesProceeds,"proceedsDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.date"/></td> </td>
                <td width="65%"><integro:date object="<%=objSalesProceeds.getProceedsDate()%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(objStagingSalesProceeds, objActualSalesProceeds,"purpose")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.purp.prcd"/></td> </td>
                <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_PUR).getCommonCodeLabel(objSalesProceeds.getPurpose())%>" />&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(objStagingSalesProceeds, objActualSalesProceeds,"purposePercent")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.purp.prcd.perc"/></td></td>
                <td><integro:empty-if-invalid displayForInvalid="-" value="<%=objSalesProceeds.getPurposePercent()%>" />&nbsp; % </td>
            </tr>
            <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(objStagingSalesProceeds, objActualSalesProceeds,"bankName")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.bnk.name"/></td></td>
                <td><integro:htmltext value="<%=objSalesProceeds.getBankName()%>" />&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(objStagingSalesProceeds, objActualSalesProceeds,"chequeNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.chq.no"/></td></td>
                <td><integro:htmltext value="<%=objSalesProceeds.getChequeNo()%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <%
                    Amount stagingSPAmount = (objStagingSalesProceeds == null) ? null : objSalesProceeds.getReceiveAmount();
                    Amount actualSPAmount = (objActualSalesProceeds == null) ? null : objActualSalesProceeds.getReceiveAmount();
                %>
                <td class="<%=UIUtil.isAmountUnChanged(stagingSPAmount, actualSPAmount, true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.amt.rcv"/></td></td>
                <td><integro:amount amount="<%=objSalesProceeds.getReceiveAmount()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.amt.to.be.rcv"/></td>
                <% if (amountToBeReceived != null) { %>
                    <td><integro:empty-if-null value="<%=amountToBeReceived%>" /></td>
                <% } else { %>
                    <td>-</td>
                <% } %>
            </tr>
            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(objStagingSalesProceeds, objActualSalesProceeds,"status")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.status"/></td> </td>
                <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_STAT).getCommonCodeLabel(objSalesProceeds.getStatus())%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(objStagingSalesProceeds, objActualSalesProceeds,"remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/></td></td>
                <td width="67%"><integro:htmltext value="<%=objSalesProceeds.getRemarks()%>" />&nbsp;</td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr>
                    <td colspan="3" ><bean:message key="label.bridgingloan.dis.pymt.rcv.title"/></td>
                </tr>
                </thead>
            <tbody>
            <tr class="odd">
                <td width="35%" class="<%=CompareOBUtil.compOB(objStagingSalesProceeds, objActualSalesProceeds,"distributeDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.date.pymt.dis"/> </td>
                <td width="65%" colspan="2"><integro:date object="<%=objSalesProceeds.getDistributeDate()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <%
                    stagingSPAmount = (objStagingSalesProceeds == null) ? null : objSalesProceeds.getDistributeAmount();
                    actualSPAmount = (objActualSalesProceeds == null) ? null : objActualSalesProceeds.getDistributeAmount();
                %>
                <td class="<%=UIUtil.isAmountUnChanged(stagingSPAmount, actualSPAmount, true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.amt.dis"/></td>
                <td colspan="2"><integro:amount amount="<%=objSalesProceeds.getDistributeAmount()%>" />&nbsp;</td>
            </tr>

            <tr>
                <%
                    boolean isUnChanged = true;
                    stagingSPAmount = (objStagingSalesProceeds == null) ? null : objSalesProceeds.getTL1Amount();
                    actualSPAmount = (objActualSalesProceeds == null) ? null : objActualSalesProceeds.getTL1Amount();
                    if (!CompareOBUtil.compOB(objSalesProceeds, objActualSalesProceeds, "isToTL1") ||
                            !UIUtil.isAmountUnChanged(stagingSPAmount, actualSPAmount, true)) {
                        isUnChanged = false;
                    }
                    stagingSPAmount = (objStagingSalesProceeds == null) ? null : objSalesProceeds.getOdAmount();
                    actualSPAmount = (objActualSalesProceeds == null) ? null : objActualSalesProceeds.getOdAmount();
                    if (!CompareOBUtil.compOB(objSalesProceeds, objActualSalesProceeds, "isToOD") ||
                            !UIUtil.isAmountUnChanged(stagingSPAmount, actualSPAmount, true)) {
                        isUnChanged = false;
                    }
                    stagingSPAmount = (objStagingSalesProceeds == null) ? null : objSalesProceeds.getFdrAmount();
                    actualSPAmount = (objActualSalesProceeds == null) ? null : objActualSalesProceeds.getFdrAmount();
                    if (!CompareOBUtil.compOB(objSalesProceeds, objActualSalesProceeds, "isToFDR") ||
                            !UIUtil.isAmountUnChanged(stagingSPAmount, actualSPAmount, true)) {
                        isUnChanged = false;
                    }
                    stagingSPAmount = (objStagingSalesProceeds == null) ? null : objSalesProceeds.getHdaAmount();
                    actualSPAmount = (objActualSalesProceeds == null) ? null : objActualSalesProceeds.getHdaAmount();
                    if (!CompareOBUtil.compOB(objSalesProceeds, objActualSalesProceeds, "isToHDA") ||
                            !UIUtil.isAmountUnChanged(stagingSPAmount, actualSPAmount, true)) {
                        isUnChanged = false;
                    }
                    stagingSPAmount = (objStagingSalesProceeds == null) ? null : objSalesProceeds.getOthersAmount();
                    actualSPAmount = (objActualSalesProceeds == null) ? null : objActualSalesProceeds.getOthersAmount();
                    if (!CompareOBUtil.compOB(objSalesProceeds, objActualSalesProceeds, "isToOthers") ||
                            !UIUtil.isAmountUnChanged(stagingSPAmount, actualSPAmount, true)) {
                        isUnChanged = false;
                    }
                %>
                <td rowspan="5" class="fieldname"><bean:message key="label.bridgingloan.dis.acc"/></td>
            </tr>
            <% if (objSalesProceeds.getTL1Amount() != null) { %>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.tl.ac"/> </td>
                <td><integro:amount amount="<%=objSalesProceeds.getTL1Amount()%>" />&nbsp;</td>
            </tr>
            <% } if (objSalesProceeds.getOdAmount() != null) { %>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.od.ac"/> </td>
                <td><integro:amount amount="<%=objSalesProceeds.getOdAmount()%>" />&nbsp;</td>
            </tr>
            <% } if (objSalesProceeds.getFdrAmount() != null) { %>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.sink.fund.fdr"/> </td>
                <td><integro:amount amount="<%=objSalesProceeds.getFdrAmount()%>" />&nbsp;</td>
            </tr>
            <% } if (objSalesProceeds.getHdaAmount() != null) { %>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.cr.hda"/> </td>
                <td><integro:amount amount="<%=objSalesProceeds.getHdaAmount()%>" />&nbsp;</td>
            </tr>
            <% } if (objSalesProceeds.getOthersAmount() != null) { %>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.common.other"/>
                <integro:empty-if-null value="<%=objSalesProceeds.getOthersAccount()%>" />&nbsp;</td>
                <td><integro:amount amount="<%=objSalesProceeds.getOthersAmount()%>" />&nbsp;</td>
            </tr>
            <% }             
            if (!objSalesProceeds.getIsToTL1() && !objSalesProceeds.getIsToOD() &&
                !objSalesProceeds.getIsToFDR() && !objSalesProceeds.getIsToHDA() &&
                !objSalesProceeds.getIsToOthers()) { %>
            <tr class="odd"><td rowspan="5">-&nbsp;</td></tr>
            <% } %>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td ></td>
    </tr>
    <tr>
        <td style="text-align:center">
            <a href="javascript:goNextPage('buildup')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
        </td>
    </tr>
    </thead>
    </tbody>
</table>
<p>&nbsp;</p>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); }%>
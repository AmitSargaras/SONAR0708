<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.ISettlement,
                 com.integrosys.cms.app.bridgingloan.bus.OBSettlement,
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
* Purpose: Update Disbursement
* Description: This screen allows the adding of new Disbursement.
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        OBSettlement objStagingSettlement = (OBSettlement) request.getAttribute("objStagingSettlement");
        OBSettlement objActualSettlement = (OBSettlement) request.getAttribute("objActualSettlement");
        OBSettlement objSettlement = ((objActualSettlement != null && objStagingSettlement != null) || objActualSettlement == null ? objStagingSettlement : objActualSettlement);
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

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_Settlement.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="settlementIndex" value="<%=request.getParameter("settlementIndex")%>"/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="81%" ><h3><bean:message key="label.bridgingloan.settle.title.add"/></h3></td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="odd">
                <td width="20%" class="<%=CompareOBUtil.compOB(objStagingSettlement, objActualSettlement,"settlementDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.date.settle"/></td>
                <td width="30%"><integro:date object="<%=objSettlement.getSettlementDate()%>" /></td>
            </tr>
            <tr class="even">
                <%
                    Amount stagingSettAmount = (objStagingSettlement == null) ? null : objSettlement.getSettledAmount();
                    Amount actualSettAmount = (objActualSettlement == null) ? null : objActualSettlement.getSettledAmount();
                %>
                <td class="<%=UIUtil.isAmountUnChanged(stagingSettAmount, actualSettAmount, true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.amt.settle"/></td>
                <td><integro:amount amount="<%=objSettlement.getSettledAmount()%>" /></td>
            </tr>
            <tr class="odd">
                <%
                    stagingSettAmount = (objStagingSettlement == null) ? null : objSettlement.getOutstandingAmount();
                    actualSettAmount = (objActualSettlement == null) ? null : objActualSettlement.getOutstandingAmount();
                %>
                <td class="<%=UIUtil.isAmountUnChanged(stagingSettAmount, actualSettAmount, true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.amt.outstd"/></td>
                <td><integro:amount amount="<%=objSettlement.getOutstandingAmount()%>" /></td>
            </tr>
            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(objStagingSettlement, objActualSettlement,"remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/></td>
                <td><integro:htmltext value="<%=objSettlement.getRemarks()%>" /></td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
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
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>

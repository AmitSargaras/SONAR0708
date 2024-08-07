<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IFDR,
                 com.integrosys.cms.app.bridgingloan.bus.OBFDR,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.base.businfra.currency.Amount"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: View FDR Register
* Description:
*
* @author $Author: KLYong  $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        OBFDR objStagingFDR = (OBFDR) request.getAttribute("objStagingFDR");
        OBFDR objActualFDR = (OBFDR) request.getAttribute("objActualFDR");
        OBFDR objFDR = ((objActualFDR != null && objStagingFDR != null) || objActualFDR == null ? objStagingFDR : objActualFDR);
        String amountAccumulated = String.valueOf(request.getParameter("amountAccumulated"));
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
    document.forms[0].event.value=event;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif')">
<html:form action="BL_FDR.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:right"></td>
    </tr>
    <tr>
        <td width="81%" ><h3><bean:message key="label.bridgingloan.fdr.reg.title.view"/></h3></td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
    <tr>
        <td >
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
            <tr >
                <td colspan="2" ><bean:message key="label.bridgingloan.adv.sec.title"/></td>
            </tr>
            </thead>
            <tbody>
                <tr class="odd">
                    <td width="20%" class="<%=CompareOBUtil.compOB(objFDR, objActualFDR,"fdrDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.date"/></td>
                    <td width="30%"><integro:date object="<%=objFDR.getFdrDate()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objFDR, objActualFDR,"accountNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.fdr.acc.no"/></td>
                    <td><integro:empty-if-null value="<%=objFDR.getAccountNo()%>"/>&nbsp;</td>
                </tr>
                <tr class="odd">
                    <%
                        Amount stagingFdrAmount = (objFDR == null) ? null : objFDR.getFdrAmount();
                        Amount actualFdrAmount = (objActualFDR == null) ? null : objActualFDR.getFdrAmount();
                    %>
                    <td class="<%=UIUtil.isAmountUnChanged(stagingFdrAmount, actualFdrAmount, true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.fdf.amt"/></td>
                    <td><integro:amount amount="<%=objFDR.getFdrAmount()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.ttl.fdf.accum.date"/></td>
                    <td><integro:empty-if-invalid displayForInvalid="-" value="<%=amountAccumulated%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objFDR, objActualFDR,"referenceNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.fdf.ref.no"/></td>
                    <td><integro:empty-if-null value="<%=objFDR.getReferenceNo()%>"/></td>
                </tr>
                <tr class="even">
                    <td class="<%=CompareOBUtil.compOB(objFDR, objActualFDR,"remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/></td>
                    <td><integro:htmltext value="<%=objFDR.getRemarks()%>"/></td>
                </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td ></td>
    </tr>
    </thead>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
    <tr>
        <td style="text-align:center">&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <a href="javascript:submitPage('checker_list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
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
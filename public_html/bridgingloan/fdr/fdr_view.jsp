<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IFDR"%>

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
        String event = request.getParameter("event");
        DefaultLogger.debug(this, "event="+event);
        int fdrIndex = Integer.parseInt(request.getParameter("fdrIndex"));
        String amountAccumulated = (String) request.getParameter("amountAccumulated");

        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        IFDR[] objFDR = (IFDR[]) objBridgingLoan.getFdrList();
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
<input type="hidden" name="fdrIndex" value="<%=request.getParameter("fdrIndex")%>"/>

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
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.date"/></td>
                <td width="30%"><integro:date object="<%=objFDR[fdrIndex].getFdrDate()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.fdr.acc.no"/></td>
                <td><integro:empty-if-null value="<%=objFDR[fdrIndex].getAccountNo()%>"/>&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.fdf.amt"/></td>
                <td><integro:amount amount="<%=objFDR[fdrIndex].getFdrAmount()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.ttl.fdf.accum.date"/></td>
                <td><integro:empty-if-null value="<%=amountAccumulated%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.fdf.ref.no"/></td>
                <td><integro:empty-if-null value="<%=objFDR[fdrIndex].getReferenceNo()%>"/>&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td><integro:htmltext value="<%=objFDR[fdrIndex].getRemarks()%>"/>&nbsp;</td>
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
            <%
            if(event.equals("view")){
                %><a href="javascript:submitPage('list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
            }
            else{ %>
                <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                <a href="javascript:submitPage('list_summary')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
            <% } %>
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
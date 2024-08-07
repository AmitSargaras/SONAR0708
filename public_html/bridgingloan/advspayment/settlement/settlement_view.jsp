<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.ISettlement"%>

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
    String event = request.getParameter("event");
    DefaultLogger.debug(this,"event="+event);

    int settlementIndex = Integer.parseInt(request.getParameter("settlementIndex"));
    IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
    ISettlement[] objSettlement = (ISettlement[]) objBridgingLoan.getSettlementList();
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
<input type="hidden" name="next_page"/>
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
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.date.settle"/></td>
                <td width="30%"><integro:date object="<%=objSettlement[settlementIndex].getSettlementDate()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.amt.settle"/></td>
                <td><integro:amount amount="<%=objSettlement[settlementIndex].getSettledAmount()%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.amt.outstd"/></td>
                <td><integro:amount amount="<%=objSettlement[settlementIndex].getOutstandingAmount()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td><integro:htmltext value="<%=objSettlement[settlementIndex].getRemarks()%>" />&nbsp;</td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td height="14" style="text-align:center" valign="bottom">
            <%
            if(event.equals("view")){
                %><a href="javascript:gotoPage('BL_AdvsPayment.do','list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
            }
            else{ %>
                <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                <a href="javascript:gotoPage('BL_AdvsPayment.do','list_summary')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
            <% } %>
        </td>
    </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>

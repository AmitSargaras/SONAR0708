<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.bridgingloan.fdr.FDRForm"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Update FDR Register
* Description:
*
* @author $Author: KLYong  $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    String event = request.getParameter("event");
    DefaultLogger.debug(this,"event="+event);

    String amountAccumulated = (String) request.getParameter("amountAccumulated");
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
<script src="js/calendar.js"></script>
<script src="js/calDriver.js"></script>
<script>
function submitPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}

function gotoPage(event) {
    document.forms[0].event.value = event;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_FDR.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="fdrIndex" value="<%=request.getParameter("fdrIndex")%>" />

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:right"><span class="style1">*</span> <bean:message key="label.common.mandatory"/></td>
    </tr>
    <tr>
        <td width="81%" ><h3><bean:message key="label.bridgingloan.fdr.reg.title"/></h3></td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="1" cellpadding="0" cellspacing="0" class="tblInfo">
            <thead>
            <tr>
                <td colspan="2" ><bean:message key="label.bridgingloan.adv.sec.title"/> </td>
            </tr>
            </thead>
            <tbody>
            <tr class="odd">
                <td width="35%" class="fieldname"><bean:message key="label.bridgingloan.fdr.date"/> <span class="style1">*</span> </td>
                <td width="65%">  
                    <html:text property="fdrDate" readonly="true" />
                    <img src="img/calendara.gif"  name="Image72" border="0" id="Image2" onclick="return showCalendar('fdrDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image72','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="fdrDate"/>
                </td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.fdr.acc.no"/> <span class="style1">*</span></td>
                <td><html:text property="accountNo" /><html:errors property="accountNo"/></td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.fdf.amt"/> <span class="style1">*</span></td>
                <td><html:select property="fdrCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="fdrCurrency"/>
                    <html:text property="fdrAmount" /><html:errors property="fdrAmount"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.ttl.fdf.accum.date"/></td>
                <td><integro:empty-if-null value="<%=amountAccumulated%>"/></td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.fdf.ref.no"/><span class="style1">*</span></td>
                <td><html:text property="referenceNo" /><html:errors property="referenceNo"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td><html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
                    <html:errors property="remarks"/></td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    </thead>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <%
            if (event.equals("maker_prepare_create") || event.equals("create")) { %>
                <a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0"/></a>
                <a href="javascript:gotoPage('list_summary')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0"/></a>
            <% }
            else { %>
                <a href="javascript:submitPage('update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3"  border="0" id="Image3" /></a>
                <a href="javascript:gotoPage('list_summary')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
            <% } %>
        </td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>&nbsp;</td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 java.util.ArrayList,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan"%>

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
        String event = String.valueOf(request.getParameter("event"));
        DefaultLogger.debug(this,"event="+event);

        String purpose = String.valueOf(request.getParameter("purpose"));
        ArrayList subPurposeLabels =(ArrayList) request.getAttribute("subPurposeLabels");

        boolean isSubpurpose = false;
        if (subPurposeLabels.size() > 0)
            isSubpurpose = true;

        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        DefaultLogger.debug(this, "objBridgingLoan: " + objBridgingLoan);

        String disbursementIndex = request.getParameter("disbursementIndex");
        if (disbursementIndex.equals("-1")) {
            disbursementIndex = Integer.toString(objBridgingLoan.getDisbursementList().length-1);
        }

        String disbursementDetailIndex = request.getParameter("disbursementDetailIndex");
        DefaultLogger.debug(this, "disbursementDetailIndex: " + disbursementDetailIndex);
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

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}

window.onload = function() {
    if(<%=isSubpurpose%>) { //Enabled sub purpose
        document.forms[0].subpurpose.style.display = "";
        document.getElementById('spanSubPurpose').innerHTML = "*";
    }
    else {                  //Hide sub purpose
        document.forms[0].subpurpose.style.display = "none";
        document.getElementById('spanSubPurpose').innerHTML = "";
    }
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_DisbursementDetail.do">
<input type="hidden" name="next_page"/>
<input type="hidden" name="event"/>
<input type="hidden" name="disbursementIndex" value="<%=disbursementIndex%>" />
<input type="hidden" name="disbursementDetailIndex" value="<%=request.getParameter("disbursementDetailIndex")%>" />
<input type="hidden" name="purpose" value="<%=purpose%>" />
<input type="hidden" name="isSubpurpose" value="<%=isSubpurpose%>" />

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:right"><span class="style1">*</span> <bean:message key="label.common.mandatory"/></td>
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
                    <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.dis.date"/><span class="style1">*</span></td>
                    <td width="30%">
                        <html:text property="disbursementDate" readonly="true" />
                        <img src="img/calendara.gif"  name="Image72" border="0" id="Image2" onclick="return showCalendar('disbursementDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image72','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                        <html:errors property="disbursementDate"/>
                    </td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.purp.dis"/></td>
                    <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_PURPOSE).getCommonCodeLabel(purpose)%>" />
                    </td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.sub.purp.dis"/><span id="spanSubPurpose" class="style1">*</span></td>
                    <td><html:select property="subpurpose" >
                            <html:option value="">Please Select </html:option>
                            <html:options name="subPurposeValues" labelName="subPurposeLabels"/>
                        </html:select>
                        <html:errors property="subpurpose"/>
                    </td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.invoice.no"/></td>
                    <td><html:text property="invoiceNumber" /><html:errors property="invoiceNumber"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.invoice.amt"/></td>
                    <td><html:select property="invoiceCurrency" >
                            <html:option value="">Please Select </html:option>
                            <html:options name="currencyValues" labelName="currencyLabels"/>
                        </html:select>
                        <html:errors property="invoiceCurrency"/>
                        <html:text property="invoiceAmount" /><html:errors property="invoiceAmount"/></td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.amt.dis"/><span class="style1">*</span></td>
                    <td><html:select property="disburseCurrency" >
                            <html:option value="">Please Select </html:option>
                            <html:options name="currencyValues" labelName="currencyLabels"/>
                        </html:select>
                        <html:errors property="disburseCurrency"/>
                        <html:text property="disburseAmount" /><html:errors property="disburseAmount"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.mode.dis"/><span class="style1">*</span></td>
                    <td><html:select property="disbursementMode" >
                            <html:option value="">Please Select </html:option>
                            <html:options name="disburseModeValues" labelName="disburseModeLabels"/>
                        </html:select>
                        <html:errors property="disbursementMode"/>
                    </td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.payee"/><span class="style1">*</span></td>
                    <td><html:text property="payee" /><html:errors property="payee"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.ref.no"/><span class="style1">*</span></td>
                    <td><html:text property="referenceNumber" /><html:errors property="referenceNumber"/></td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.gl.ref.no"/><span class="style1">*</span></td>
                    <td><html:text property="glReferenceNumber" /><html:errors property="glReferenceNumber"/></td>
                </tr>
                <tr class="odd">
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
<%--    </thead>
</table>

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>   --%>
    <tr>
        <td style="text-align:center">
            <%
            if (event.equals("maker_prepare_create") || event.equals("create")) { %>
                <a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0"/></a>
                <a href="javascript:gotoPage('BL_Disbursement.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0"/></a>
            <% }
            else {  %>
                <a href="javascript:submitPage('update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3"  border="0" id="Image3" /></a>
                <a href="javascript:gotoPage('BL_Disbursement.do','maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
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
<% } catch (Exception e) { e.printStackTrace(); } %>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.ui.bridgingloan.buildup.SalesProceedsForm,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
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
* Purpose: Update Sale Proceeds
* Description: This is a screen to input the details of individual units sale proceed received.
* It can be reached by clicking on the “ADD NEW” tab next to the TOTAL SALE PROCEEDS RECEIVED FOR PROGRESS PAYMENT.
*
* @author $Author: KLYong  $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        String event = String.valueOf(request.getParameter("event"));
        DefaultLogger.debug(this,"event="+event);
        String amountToBeReceived = (String) request.getParameter("amountToBeReceived");

        SalesProceedsForm objSalesProceedsForm = (SalesProceedsForm) request.getAttribute("BL_SalesProceedsForm");
        DefaultLogger.debug(this, "objSalesProceedsForm: " + objSalesProceedsForm);
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

function gotoPage(actionPage, event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_SalesProceeds.do">
<input type="hidden" name="event" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="buildUpIndex" value="<%=request.getParameter("buildUpIndex")%>"/>
<input type="hidden" name="salesProceedsIndex" value="<%=request.getParameter("salesProceedsIndex")%>"/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:right"><span class="style1">*</span><bean:message key="label.common.mandatory"/></td> </td>
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
            <tr class="odd">
                <td class="fieldname" width="35%"><bean:message key="label.bridgingloan.date"/> <span class="style1">*</span></td>
                <td width="65%"><html:text property="proceedsDate" readonly="true" />
                <img src="img/calendara.gif" name="Image5" border="0" id="Image5" onclick="return showCalendar('proceedsDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image5','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                <html:errors property="proceedsDate"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.purp.prcd"/> <span class="style1">*</span></td>
                <td><html:select property="purpose" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="salesProceedsValues" labelName="salesProceedsLabels"/>
                    </html:select>
                    <html:errors property="purpose"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.purp.prcd.perc"/></td></td>
                <td><html:text property="purposePercent" /> % <html:errors property="purposePercent"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.bnk.name"/><span class="style1">*</span></td>
                <td><html:text property="bankName" /><html:errors property="bankName"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.chq.no"/><span class="style1">*</span></td>
                <td><html:text property="chequeNo" /><html:errors property="chequeNo"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.amt.rcv"/><span class="style1">*</span></td>
                <td><html:select property="receiveCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="receiveCurrency"/>
                    <html:text property="receiveAmount" /><html:errors property="receiveAmount"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.amt.to.be.rcv"/></td>
                <td><integro:empty-if-null value="<%=amountToBeReceived%>" /></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.status"/><span class="style1">*</span></td>
                <td><html:select property="status" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="statusValues" labelName="statusLabels"/>
                    </html:select>
                    <html:errors property="status"/></td>
            </tr>

            <tr class="odd">
                <td class="fieldname" width="33%"><bean:message key="label.bridgingloan.rem"/></td>
                <td width="67%">
                    <html:textarea property="remarks" rows="3" cols="80"/>&nbsp;
                    <html:errors property="remarks"/></td>
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
                <td class="fieldname" width="35%"><bean:message key="label.bridgingloan.date.pymt.dis"/> </td>
                <td width="65%" colspan="2"><html:text property="distributeDate" readonly="true" />
                    <img src="img/calendara.gif"  name="Image5" border="0" id="Image5" onclick="return showCalendar('distributeDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image5','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
                    <html:errors property="distributeDate"/></td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.amt.dis"/></td>
                <td colspan="2"><html:select property="distributeCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="distributeCurrency"/>
                    <html:text property="distributeAmount" /><html:errors property="distributeAmount"/></td>
            </tr>

            <tr><td rowspan="6" class="fieldname"><bean:message key="label.bridgingloan.dis.acc"/></td></tr>
            <tr class="odd">
                <td><html:checkbox property="isToTL1" /><bean:message key="label.bridgingloan.tl.ac"/><html:errors property="isToTL1"/> </td>
                <td><html:select property="TL1Currency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="TL1Currency"/>
                    <html:text property="TL1Amount" /><html:errors property="TL1Amount" /></td>
            </tr>
           <tr class="even">
                <td><html:checkbox property="isToOD" /><bean:message key="label.bridgingloan.od.ac"/><html:errors property="isToOD"/> </td>
                <td><html:select property="odCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="odCurrency"/>
                    <html:text property="odAmount" /><html:errors property="odAmount"/></td>
            </tr>

            <tr class="odd">
                <td><html:checkbox property="isToFDR" /><bean:message key="label.bridgingloan.sink.fund.fdr"/><html:errors property="isToFDR"/> </td>
                <td><html:select property="fdrCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="fdrCurrency"/>
                    <html:text property="fdrAmount" /><html:errors property="fdrAmount"/></td>
            </tr>
            <tr class="even">
                <td><html:checkbox property="isToHDA" /><bean:message key="label.bridgingloan.cr.hda"/><html:errors property="isToHDA"/> </td>
                <td><html:select property="hdaCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="hdaCurrency"/>
                    <html:text property="hdaAmount" /><html:errors property="hdaAmount"/></td>
            </tr>

            <tr class="odd">
                <td><html:checkbox property="isToOthers" /><bean:message key="label.common.other"/><html:errors property="isToOthers"/>
                    <html:text property="othersAccount" /><html:errors property="othersAccount"/></td>
                <td><html:select property="othersCurrency" >
                        <html:option value="">Please Select </html:option>
                        <html:options name="currencyValues" labelName="currencyLabels"/>
                    </html:select>
                    <html:errors property="othersCurrency"/>
                    <html:text property="othersAmount" /><html:errors property="othersAmount"/></td>
            </tr>
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
    </tbody>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
    <tr>
        <td style="text-align:center">&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
        <%
        if (event.equals("maker_prepare_create") || event.equals("create")) { %>
            <a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0"/></a>
            <a href="javascript:gotoPage('BL_BuildUp.do', 'maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image42','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image42" width="70" height="20" border="0"/></a>
        <% }
        else { %>
            <a href="javascript:submitPage('update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3"  border="0" id="Image3" /></a>
            <a href="javascript:gotoPage('BL_BuildUp.do', 'maker_prepare_update')" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4" width="70" height="20" border="0" id="Image4" /></a>
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
<p>&nbsp;</p>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
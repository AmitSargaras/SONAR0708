<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.bridgingloan.buildup.BuildUpForm,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.ISalesProceeds,
                 com.integrosys.cms.app.bridgingloan.bus.IBuildUp,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.common.AmountConversionException,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.FrequencyList"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: Buildup view
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
        String isEdit = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.isEdit");
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);

        int buildUpIndex = Integer.parseInt(request.getParameter("buildUpIndex"));
        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        IBuildUp[] objBuildUp = (IBuildUp[]) objBridgingLoan.getBuildUpList();
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

function gotoPage(actionPage, event, buildUpIndex, salesProceedsIndex) {
    document.forms[0].event.value = event;
    document.forms[0].current_page.value = "view_page";
    document.forms[0].action = actionPage;
    document.forms[0].buildUpIndex.value = buildUpIndex;
    document.forms[0].salesProceedsIndex.value = salesProceedsIndex;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_BuildUp.do">
<input type="hidden" name="event" />
<input type="hidden" name="current_page"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="buildUpIndex" value=<%=buildUpIndex%> />
<input type="hidden" name="salesProceedsIndex" />
<input type="hidden" name="amountReceived"/>

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td><h3><bean:message key="label.bridgingloan.cmplt.unt.title.add"/></h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="odd">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prty.typ"/> &nbsp;</td>
                <td width="30%"><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.PROPERTY_TYPE).getCommonCodeLabel(objBuildUp[buildUpIndex].getPropertyType())%>" /></td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.unt.id.no"/> </td>
                <td width="30%"><integro:htmltext value="<%=objBuildUp[buildUpIndex].getUnitID()%>" /> &nbsp;</td>
            </tr>
            <tr class="even">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.block.no"/> </td>
                <td width="30%"><integro:htmltext value="<%=objBuildUp[buildUpIndex].getBlockNo()%>" />&nbsp;</td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.title.no"/> </td>
                <td width="30%"><integro:empty-if-null value="<%=objBuildUp[buildUpIndex].getTitleNo()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.unt.no"/> </td>
                <td><integro:htmltext value="<%=objBuildUp[buildUpIndex].getUnitNo()%>" />&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.unt.dischrg"/> </td>
                <td><integro:boolean-display style="yn" value="<%=objBuildUp[buildUpIndex].getIsUnitDischarged()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.aprx.area"/></td>
                <% if (objBuildUp[buildUpIndex].getApproxArea() != null) { %>
                    <td><%=objBuildUp[buildUpIndex].getApproxArea().getAreaSize()%>&nbsp;<%=CommonCodeList.getInstance(null, ICMSUIConstant.AREA_UOM).getCommonCodeLabel(objBuildUp[buildUpIndex].getApproxArea().getUnitOfMeasurement())%></td>
                <% } else { %>
                    <td>&nbsp;</td>
                <% } %>
                <td class="fieldname"><bean:message key="label.bridgingloan.aprx.area"/></td>
                <% if (objBuildUp[buildUpIndex].getApproxAreaSecondary() != null) { %>
                    <td><%=objBuildUp[buildUpIndex].getApproxAreaSecondary().getAreaSize()%>&nbsp;<%=CommonCodeList.getInstance(null, ICMSUIConstant.AREA_UOM).getCommonCodeLabel(objBuildUp[buildUpIndex].getApproxAreaSecondary().getUnitOfMeasurement())%></td>
                <% } else { %>
                    <td>&nbsp;</td>
                <% } %>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.redempt.amt"/> </td>
                <td><integro:amount amount="<%=objBuildUp[buildUpIndex].getRedemptionAmount()%>" />&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.snp.price"/> </td>
                <td><integro:amount amount="<%=objBuildUp[buildUpIndex].getSalesAmount()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.date.snp"/></td>
                <td><integro:date object="<%=objBuildUp[buildUpIndex].getSalesDate()%>"/>&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.name.prch"/> </td>
                <td><%=objBuildUp[buildUpIndex].getPurchaserName()%>&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.end.financ"/> </td>
                <td><%=objBuildUp[buildUpIndex].getEndFinancier()%>&nbsp;</td>
                <td class="fieldname">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td colspan="3"><integro:htmltext value="<%=objBuildUp[buildUpIndex].getBuRemarks()%>" />&nbsp;</td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    </thead>
</tbody>
</table>
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="81%"><h3><bean:message key="label.bridgingloan.rent.prcd.title.add"/></h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
    <tr>
        <td >
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="odd">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.tent.agrmt.date"/> </td>
                <td width="30%"><integro:date object="<%=objBuildUp[buildUpIndex].getTenancyDate()%>"/>&nbsp;</td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.tent.name"/> </td>
                <td width="30%"><integro:empty-if-null value="<%=objBuildUp[buildUpIndex].getTenantName()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.prd.tent"/> </td>
                <td width="30%"><integro:empty-if-invalid displayForInvalid="-" value="<%=objBuildUp[buildUpIndex].getTenancyPeriod()%>"/>&nbsp;<%=CommonCodeList.getInstance(null, ICMSUIConstant.TIME_FREQ).getCommonCodeLabel(objBuildUp[buildUpIndex].getTenancyPeriodUnit())%>&nbsp;</td>
                <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.expry.date"/> </td>
                <td width="30%"><integro:date object="<%=objBuildUp[buildUpIndex].getTenancyExpiryDate()%>"/>&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.rent.amt"/></td>
                <td><integro:amount amount="<%=objBuildUp[buildUpIndex].getRentalAmount()%>" />&nbsp;</td>
                <td class="fieldname"><bean:message key="label.bridgingloan.pymt.freq"/></td>
                <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.FREQ_TYPE).getCommonCodeLabel(objBuildUp[buildUpIndex].getPaymentFrequency())%>" />&nbsp;</td>
            </tr>
            </tbody>
            </table>
        </td>
    </tr>
    </thead>
    </tbody>
</table>
<br>
<table class="tblFormSection" width="95%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px" dwcopytype="CopyTableRow">
    <thead>
    <tr>
        <td width="84%"><h3><bean:message key="label.bridgingloan.ttl.sprpp.title"/> </h3></td>
        <td style="text-align:right" width="16%" valign="bottom"></td>
    </tr>
    </thead>
</table>
<table class="tblInfo" width="95%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
    <tr>
        <td width="4%"><bean:message key="label.bridgingloan.sn"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.date"/> </td>
        <td width="*"><bean:message key="label.bridgingloan.purp.prcd"/> </td>
        <td width="*"><bean:message key="label.bridgingloan.bnk.name"/> </td>
        <td width="10%"><bean:message key="label.bridgingloan.chq.no"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.amt.rcv"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.amt.to.be.rcv"/> </td>
        <td width="8%"><bean:message key="label.bridgingloan.status"/> </td>
        <td width="10%"><bean:message key="label.bridgingloan.action"/> </td>
    </tr>
    </thead>
    <tbody>
        <%
            Amount redemptionAmount = null;
            Amount amountReceived = null;
            Amount amountToBeReceived = null;
            boolean convertError = false;
            boolean balConvertError = false;
            if (objBridgingLoan != null)
                objBuildUp = (IBuildUp[]) objBridgingLoan.getBuildUpList();

            if (objBuildUp != null && objBuildUp[buildUpIndex].getSalesProceedsList() != null) {
                ISalesProceeds[] objSalesProceeds = (ISalesProceeds[]) objBuildUp[buildUpIndex].getSalesProceedsList();

                redemptionAmount = objBuildUp[buildUpIndex].getRedemptionAmount(); //Total amount for redemption amount
                if (objSalesProceeds != null) {
                    for (int index=0; index<objSalesProceeds.length; index++) {
                        if (objSalesProceeds[index].getIsDeletedInd() != true) {
                            if (!convertError) {
                                try {
                                    amountReceived = CommonUtil.addAmount(amountReceived, objSalesProceeds[index].getReceiveAmount());
                                } catch (AmountConversionException e) {
                                    if (e.toString().indexOf("AMT_CONV_EX")>-1) {
                                        convertError = true;
                                        amountReceived = null;
                                    }
                                }
                            }
                            if (!balConvertError) {
                                try {
                                    amountToBeReceived = CommonUtil.subtractAmount(redemptionAmount, amountReceived);  //Redemption amount - Amount received
                                } catch (AmountConversionException e) {
                                    if (e.toString().indexOf("AMT_CONV_EX")>-1) {
                                        balConvertError = true;
                                        amountToBeReceived = null;
                                    }
                                }
                            }
        %>
        <tr class='<%=(index%2==0?"even":"odd")%>'>
            <td style="text-align:center" class="index"><%=(index+1)%></td>
            <td style="text-align:center"><integro:date object="<%=objSalesProceeds[index].getProceedsDate()%>" />&nbsp;</td>
            <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_PUR).getCommonCodeLabel(objSalesProceeds[index].getPurpose())%>" />&nbsp;</td>
            <td><integro:htmltext value="<%=objSalesProceeds[index].getBankName()%>" />&nbsp;</td>
            <td><integro:htmltext value="<%=objSalesProceeds[index].getChequeNo()%>" />&nbsp;</td>
            <td style="text-align:right">
            <%
                if (!convertError) {
                    %><integro:amount param="all" amount="<%=objSalesProceeds[index].getReceiveAmount()%>" /><%
                }
                else {
                    %><bean:message key="label.common.error.no.conversion" /><%
                }
            %>
            </td>
            <td style="text-align:right">
            <%
                if (!balConvertError) {
                    %><integro:amount param="all" amount="<%=amountToBeReceived%>" /><%
                }
                else {
                    %><bean:message key="label.common.error.no.conversion" /><%
                }
            %>
            </td>
            <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_STAT).getCommonCodeLabel(objSalesProceeds[index].getStatus())%>" /></td>
            <td style="text-align:center">
            <% if ((isEdit != null && isEdit.equals("true")) && (event.equals("maker_prepare_delete") || event.equals("delete"))) { %>
                <a href="#" onclick="javascript:gotoPage('BL_SalesProceeds.do', 'delete', '<%=buildUpIndex%>', '<%=index%>');" >Delete</a>
            <% } else if (event.equals("view")) { %>
                <a href="#" onclick="javascript:gotoPage('BL_SalesProceeds.do', 'view', '<%=buildUpIndex%>', '<%=index%>');" >View</a>
            <% } %>
            </td>
            <input type="hidden" name="amountToBeReceived" value="<integro:amount param="all" amount="<%=amountToBeReceived%>"/>"/>
        </tr>
        <% } } } %>
        <tr>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total" style="text-align:right"><bean:message key="label.common.total"/></td>
            <td class="total" style="text-align:right">
            <%
                if (!convertError) {
                    %><integro:amount param="all" amount="<%=amountReceived%>" /><%
                }
                else {
                    %><bean:message key="label.common.error.no.conversion" /><%
                }
            %>
            </td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total">&nbsp;</td>
        </tr>
        <% } else { %>
        <tr class="odd">
            <td colspan="10"><bean:message key="label.common.empty"/></td>
        </tr>
        <% } %>
    </tbody>
</table>
<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <%
            if(event.equals("view")) { %>
                <a href="javascript:submitPage('list_summary')"><img src="img/return1.gif" border="0" /></a>
                <a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
            <% }
            else { %>
                <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                <a href="javascript:submitPage('list_summary')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
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
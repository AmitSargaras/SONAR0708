<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.OBBuildUp,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.bridgingloan.bus.ISalesProceeds,
                 java.util.ArrayList,
                 com.integrosys.cms.app.bridgingloan.bus.OBSalesProceeds,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.common.AmountConversionException,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
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
        OBBuildUp objStagingBuildUp = (OBBuildUp) request.getAttribute("objStagingBuildUp");
        OBBuildUp objActualBuildUp = (OBBuildUp) request.getAttribute("objActualBuildUp");
        OBBuildUp objBuildUp = ((objActualBuildUp != null && objStagingBuildUp != null) || objActualBuildUp == null ? objStagingBuildUp : objActualBuildUp);
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

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_BuildUp.do">
<input type="hidden" name="event" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="buildUpIndex" value="<%=request.getParameter("buildUpIndex")%>"/>
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
                <td width="20%" class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"propertyType")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.prty.typ"/> </td>
                <td width="30%" class="odd"><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.PROPERTY_TYPE).getCommonCodeLabel(objBuildUp.getPropertyType())%>" />&nbsp;</td>
                <td width="20%" class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"unitNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.unt.id.no"/> </td>
                <td width="30%"><integro:htmltext value="<%=objBuildUp.getUnitID()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td width="20%" class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"blockNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.block.no"/> </td>
                <td width="30%"><integro:htmltext value="<%=objBuildUp.getBlockNo()%>" />&nbsp;</td>
                <td width="20%" class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"titleNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.title.no"/> </td>
                <td width="30%" class="even"><integro:empty-if-null value="<%=objBuildUp.getTitleNo()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"unitNo")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.unt.no"/> </td>
                <td><integro:htmltext value="<%=objBuildUp.getUnitNo()%>" />&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"isUnitDischarged")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.unt.dischrg"/> </td>
                <td><integro:yesno-display value="<%=(objBuildUp.getIsUnitDischarged() == true ? "Yes" : "No")%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"approxArea") ?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.aprx.area"/>  </td>
                <% if (objBuildUp.getApproxArea() != null) { %>
                    <td><%=objBuildUp.getApproxArea().getAreaSize()%>&nbsp;<%=CommonCodeList.getInstance(null, ICMSUIConstant.AREA_UOM).getCommonCodeLabel(objBuildUp.getApproxArea().getUnitOfMeasurement())%></td>
                <% } else {%>
                    <td>-&nbsp;</td>
                <% } %>
                <td class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"approxAreaSecondary")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.aprx.area"/></td>
                <% if (objBuildUp.getApproxAreaSecondary() != null) { %>
                    <td><%=objBuildUp.getApproxAreaSecondary().getAreaSize()%>&nbsp;<%=CommonCodeList.getInstance(null, ICMSUIConstant.AREA_UOM).getCommonCodeLabel(objBuildUp.getApproxAreaSecondary().getUnitOfMeasurement())%></td>
                <% } else { %>
                    <td>-&nbsp;</td>
                <% } %>
            </tr>

            <tr class="odd">
                <%
                    Amount stagingBldAmount = (objStagingBuildUp == null) ? null : objBuildUp.getRedemptionAmount();
                    Amount actualBldAmount = (objActualBuildUp == null) ? null : objActualBuildUp.getRedemptionAmount();
                %>
                <td class="<%=UIUtil.isAmountUnChanged(stagingBldAmount, actualBldAmount, true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.redempt.amt"/> </td>
                <td><integro:amount amount="<%=objBuildUp.getRedemptionAmount()%>" />&nbsp;</td>
                <%
                    stagingBldAmount = (objStagingBuildUp == null) ? null : objBuildUp.getSalesAmount();
                    actualBldAmount = (objActualBuildUp == null) ? null : objActualBuildUp.getSalesAmount();
                %>
                <td class="<%=UIUtil.isAmountUnChanged(stagingBldAmount, actualBldAmount, true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.snp.price"/> </td>
                <td><integro:amount amount="<%=objBuildUp.getSalesAmount()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"salesDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.date.snp"/></td>
                <td><integro:date object="<%=objBuildUp.getSalesDate()%>"/>&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"purchaserName")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.name.prch"/></td>
                <td><integro:empty-if-null value="<%=objBuildUp.getPurchaserName()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"endFinancier")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.end.financ"/> </td>
                <td><integro:empty-if-null value="<%=objBuildUp.getEndFinancier()%>" />&nbsp;</td>
                <td class="fieldname">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"buRemarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/></td>
                <td colspan="3"><integro:htmltext value="<%=objBuildUp.getBuRemarks()%>" />&nbsp;</td>
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
            <tr class="even">
                <td width="20%" class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"tenancyDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.tent.agrmt.date"/> </td>
                <td width="30%"><integro:date object="<%=objBuildUp.getTenancyDate()%>"/>&nbsp;</td>
                <td width="20%" class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"tenantName")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.tent.name"/> </td>
                <td width="30%"><integro:empty-if-null value="<%=objBuildUp.getTenantName()%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td width="20%" class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"tenancyPeriod")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.prd.tent"/> </td>
                <td width="30%"><integro:empty-if-invalid displayForInvalid="-" value="<%=objBuildUp.getTenancyPeriod()%>" />&nbsp;<%=CommonCodeList.getInstance(null, ICMSUIConstant.TIME_FREQ).getCommonCodeLabel(objBuildUp.getTenancyPeriodUnit())%></td>
                <td width="20%" class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"tenancyExpiryDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.expry.date"/> </td>
                <td width="30%"><integro:date object="<%=objBuildUp.getTenancyExpiryDate()%>"/>&nbsp;</td>
            </tr>

            <tr class="even">
                <%
                    stagingBldAmount = (objStagingBuildUp == null) ? null : objBuildUp.getRentalAmount();
                    actualBldAmount = (objActualBuildUp == null) ? null : objActualBuildUp.getRentalAmount();
                %>
                <td class="<%=UIUtil.isAmountUnChanged(stagingBldAmount, actualBldAmount, true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rent.amt"/></td>
                <td><integro:amount amount="<%=objBuildUp.getRentalAmount()%>" />&nbsp;</td>
                <td class="<%=CompareOBUtil.compOB(objStagingBuildUp, objActualBuildUp,"paymentFrequency")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.pymt.freq"/></td>
                <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.FREQ_TYPE).getCommonCodeLabel(objBuildUp.getPaymentFrequency())%>" />&nbsp;</td>
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
    <tr class="even">
        <td width="4%"><bean:message key="label.bridgingloan.sn"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.date"/> </td>
        <td width="*"><bean:message key="label.bridgingloan.purp.prcd"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.bnk.name"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.chq.no"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.amt.rcv"/> </td>
        <td width="12%"><bean:message key="label.bridgingloan.amt.to.be.rcv"/> </td>
        <td width="10%"><bean:message key="label.bridgingloan.status"/> </td>
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
            if (objStagingBuildUp != null) {
                ISalesProceeds[] salesProceedsActualList = null;
                if (objActualBuildUp != null) //actual will be null if this is new record
                    salesProceedsActualList = objActualBuildUp.getSalesProceedsList();
                ISalesProceeds[] salesProceedsStagingList = objStagingBuildUp.getSalesProceedsList();

                if (salesProceedsActualList != null || salesProceedsStagingList != null) {
                    List compResult = CompareOBUtil.compOBArray(salesProceedsStagingList, salesProceedsActualList);
                    ArrayList List = new ArrayList(compResult);
                    pageContext.setAttribute("salesProceedsList", List);
                }
                DefaultLogger.debug(this, "salesProceedsStagingList: " + salesProceedsStagingList);
                DefaultLogger.debug(this, "salesProceedsActualList: " + salesProceedsActualList);
            }
            int index=0;
        %>
        <logic:present name="salesProceedsList">
            <logic:iterate id="compResult" name="salesProceedsList" type="com.integrosys.base.techinfra.diff.CompareResult">
            <%
                ISalesProceeds stagingParameter = (ISalesProceeds) compResult.getObj();
                index++;

                redemptionAmount = objStagingBuildUp.getRedemptionAmount(); //Total amount for redemption amount
                if (!convertError) {
                    try {
                        amountReceived = CommonUtil.addAmount(amountReceived, stagingParameter.getReceiveAmount());
                    } catch (AmountConversionException e) {
                        if (e.toString().indexOf("AMT_CONV_EX")>-1) {
                            convertError = true;
                            amountReceived = null;
                        }
                    }
                }
                if (!balConvertError) {
                    try {
                        DefaultLogger.debug(this, "redemptionAmount: " + redemptionAmount);
                        DefaultLogger.debug(this, "amountReceived: " + amountReceived);
                        amountToBeReceived = CommonUtil.subtractAmount(redemptionAmount, amountReceived);  //Redemption amount - Amount received
                        DefaultLogger.debug(this, "amountToBeReceived: " + amountToBeReceived);
                    } catch (AmountConversionException e) {
                        if (e.toString().indexOf("AMT_CONV_EX")>-1) {
                            balConvertError = true;
                            amountToBeReceived = null;
                        }
                    }
                }
            %>
            <tr class='<%=(index%2==0?"even":"odd")%>'>
                <td style="text-align:center" class="<bean:write name="compResult" property="key" />"><%=index%></td>
                <td style="text-align:center"><integro:date object="<%=stagingParameter.getProceedsDate()%>" />&nbsp;</td>
                <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_PUR).getCommonCodeLabel(stagingParameter.getPurpose())%>" />&nbsp;</td>
                <td><integro:htmltext value="<%=stagingParameter.getBankName()%>" />&nbsp;</td>
                <td style="text-align:right"><integro:htmltext value="<%=stagingParameter.getChequeNo()%>" />&nbsp;</td>
                <td style="text-align:right">&nbsp;
                <%
                    if (!convertError) {
                        %><integro:amount param="all" amount="<%=stagingParameter.getReceiveAmount()%>" /><%
                    }
                    else {
                        %><bean:message key="label.common.error.no.conversion" /><%
                    }
                %>
                </td>
                <td style="text-align:right">&nbsp;
                <%
                    if (!balConvertError) {
                        %><integro:amount param="all" amount="<%=amountToBeReceived%>" /><%
                    }
                    else {
                        %><bean:message key="label.common.error.no.conversion" /><%
                    }
                %>
                </td>
                <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_STAT).getCommonCodeLabel(stagingParameter.getStatus())%>" />&nbsp;</td>
                <td style="text-align:center"><a href="BL_SalesProceeds.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&buildUpIndex=<%=(index-1)%>&amountToBeReceived=<integro:amount param="all" amount="<%=amountToBeReceived%>"/>">View</a></td>
            </tr>
            </logic:iterate>
        </logic:present>
        <logic:notPresent name="salesProceedsList" >
            <tr class="even">
                <td colspan="10"><bean:message key="label.common.empty"/></td>
            </tr>
        </logic:notPresent>
        <% if (index > 0) { %>
        <tr class="total">
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
        <% } %>
    </tbody>
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
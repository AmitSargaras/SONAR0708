<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.ui.bridgingloan.buildup.SalesProceedsForm,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.ISalesProceeds,
                 com.integrosys.cms.app.bridgingloan.bus.IBuildUp,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant"%>

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
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);
        String current_page = (String) request.getParameter("current_page");
        String isEdit = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.isEdit");
        int buildUpIndex = Integer.parseInt(request.getParameter("buildUpIndex"));
        int salesProceedsIndex = Integer.parseInt(request.getParameter("salesProceedsIndex"));
        String amountToBeReceived = (String) request.getParameter("amountToBeReceived");

        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        DefaultLogger.debug(this, "objBridgingLoan: " + objBridgingLoan);
        IBuildUp[] objBuildUp = (IBuildUp[]) objBridgingLoan.getBuildUpList();
        ISalesProceeds[] objSalesProceeds = (ISalesProceeds[]) objBuildUp[buildUpIndex].getSalesProceedsList();
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
<html:form action="BL_SalesProceeds.do">
<input type="hidden" name="event" />
<input type="hidden" name="current_page" value="<%=current_page%>" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="buildUpIndex" value="<%=request.getParameter("buildUpIndex")%>"/>
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
                <td width="35%" class="fieldname"><bean:message key="label.bridgingloan.date"/></td> </td>
                <td width="65%"><integro:date object="<%=objSalesProceeds[salesProceedsIndex].getProceedsDate()%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.purp.prcd"/></td> </td>
                <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_PUR).getCommonCodeLabel(objSalesProceeds[salesProceedsIndex].getPurpose())%>" />&nbsp;</td>
            </tr> 

            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.purp.prcd.perc"/></td></td>
                <td><integro:empty-if-invalid displayForInvalid="-" value="<%=objSalesProceeds[salesProceedsIndex].getPurposePercent()%>" />&nbsp; % </td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.bnk.name"/></td></td>
                <td><integro:htmltext value="<%=objSalesProceeds[salesProceedsIndex].getBankName()%>" />&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.chq.no"/></td></td>
                <td><integro:htmltext value="<%=objSalesProceeds[salesProceedsIndex].getChequeNo()%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.amt.rcv"/></td></td>
                <td><integro:amount amount="<%=objSalesProceeds[salesProceedsIndex].getReceiveAmount()%>" />&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.amt.to.be.rcv"/></td>
                <td><integro:empty-if-null value="<%=amountToBeReceived%>" />&nbsp;</td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.status"/></td> </td>
                <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.SALES_PROCEED_STAT).getCommonCodeLabel(objSalesProceeds[salesProceedsIndex].getStatus())%>" />&nbsp;</td>
            </tr>

            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td><integro:htmltext value="<%=objSalesProceeds[salesProceedsIndex].getRemarks()%>" />&nbsp;</td>
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
                <td width="65%" colspan="2"><integro:date object="<%=objSalesProceeds[salesProceedsIndex].getDistributeDate()%>" />&nbsp;</td>
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.amt.dis"/></td>
                <td colspan="2"><integro:amount amount="<%=objSalesProceeds[salesProceedsIndex].getDistributeAmount()%>" />&nbsp;</td>
            </tr>
            <tr><td rowspan="5" class="fieldname"><bean:message key="label.bridgingloan.dis.acc"/></td></tr>
            <%
                DefaultLogger.debug(this, "getIsToTL1(): " + objSalesProceeds[salesProceedsIndex].getIsToTL1());
                DefaultLogger.debug(this, "getIsToOD(): " + objSalesProceeds[salesProceedsIndex].getIsToOD());
                DefaultLogger.debug(this, "getIsToFDR(): " + objSalesProceeds[salesProceedsIndex].getIsToFDR());
                DefaultLogger.debug(this, "getIsToHDA(): " + objSalesProceeds[salesProceedsIndex].getIsToHDA());
                DefaultLogger.debug(this, "getIsToOthers(): " + objSalesProceeds[salesProceedsIndex].getIsToOthers());
            %>
            <% if (objSalesProceeds[salesProceedsIndex].getIsToTL1()) { %>
            <tr class="odd">
                <td><bean:message key="label.bridgingloan.tl.ac"/> </td>
                <td><integro:amount amount="<%=objSalesProceeds[salesProceedsIndex].getTL1Amount()%>" />&nbsp;</td>
            </tr>
            <% }
            if (objSalesProceeds[salesProceedsIndex].getIsToOD()) { %>
            <tr class="odd">
                <td><bean:message key="label.bridgingloan.od.ac"/> </td>
                <td><integro:amount amount="<%=objSalesProceeds[salesProceedsIndex].getOdAmount()%>" />&nbsp;</td>
            </tr>
            <% }
            if (objSalesProceeds[salesProceedsIndex].getIsToFDR()) { %>
            <tr class="odd">
                <td><bean:message key="label.bridgingloan.sink.fund.fdr"/> </td>
                <td><integro:amount amount="<%=objSalesProceeds[salesProceedsIndex].getFdrAmount()%>" />&nbsp;</td>
            </tr>
            <% } if (objSalesProceeds[salesProceedsIndex].getIsToHDA()) { %>
            <tr class="odd">
                <td><bean:message key="label.bridgingloan.cr.hda"/> </td>
                <td><integro:amount amount="<%=objSalesProceeds[salesProceedsIndex].getHdaAmount()%>" />&nbsp;</td>
            </tr>
            <% } if (objSalesProceeds[salesProceedsIndex].getIsToOthers()) { %>
            <tr class="odd">
                <td><bean:message key="label.common.other"/>
                <integro:empty-if-null value="<%=objSalesProceeds[salesProceedsIndex].getOthersAccount()%>" />&nbsp;</td>
                <td><integro:amount amount="<%=objSalesProceeds[salesProceedsIndex].getOthersAmount()%>" />&nbsp;</td>
            </tr>
            <% } 
            if (!objSalesProceeds[salesProceedsIndex].getIsToTL1() && !objSalesProceeds[salesProceedsIndex].getIsToOD() &&
                !objSalesProceeds[salesProceedsIndex].getIsToFDR() && !objSalesProceeds[salesProceedsIndex].getIsToHDA() &&
                !objSalesProceeds[salesProceedsIndex].getIsToOthers()) { %>
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
        <td style="text-align:center">
            <%
            if ((isEdit != null && isEdit.equals("true"))) {
                if (event.equals("maker_prepare_delete")) {
            %>
                    <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                    <a href="javascript:gotoPage('BL_BuildUp.do', 'maker_prepare_update')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
            <%
                }
                else if (current_page.equals("update_page")) { %>
                    <a href="javascript:gotoPage('BL_BuildUp.do', 'maker_prepare_update')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
                }
                else {  %>
                    <a href="javascript:gotoPage('BL_BuildUp.do', 'view')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
                }
            }
            else if(event.equals("view")) { %>
                <a href="javascript:gotoPage('BL_BuildUp.do', 'view')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
            } else { %>
                <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                <a href="javascript:gotoPage('BL_BuildUp.do', 'view')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
            <% } %>
        </td>
    </thead>
    </tbody>
</table>
<p>&nbsp;</p>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); }%>
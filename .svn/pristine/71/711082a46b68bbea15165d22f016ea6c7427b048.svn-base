<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.*,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.common.AmountConversionException,
                 java.util.List,
                 java.util.ArrayList,
                 java.util.Arrays"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:  $
*
* Purpose: View Advances / Payment Details
* Description: This screen allows the viewing the summary of advances / payments.
* It can be reached by clicking on the “Advances/Payment Details” tab on the top of the screen
*
* @author $Author: KLYong $<br>
* @version $Revision:  $
* Date: $Date:  $
* Tag: $Name:  $
*/
%>

<%
    try {
        String isEdit = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.isEdit");
        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        DefaultLogger.debug(this,"objBridgingLoan="+objBridgingLoan);
        IProjectSchedule[] objProjectSchedule = null;

        if (objBridgingLoan != null)
            objProjectSchedule = (IProjectSchedule[]) objBridgingLoan.getProjectScheduleList();

        IDevelopmentDoc[] developmentDocSummary = null;
        IDisbursement[] disbursementSummary = (IDisbursement[]) request.getAttribute("disbursementSummary");
        ISettlement[] settlementSummary = (ISettlement[]) request.getAttribute("settlementSummary");

        if (disbursementSummary == null) {
            if (objBridgingLoan.getDisbursementList() != null)
                disbursementSummary = (IDisbursement[]) objBridgingLoan.getDisbursementList();
        }
        if (settlementSummary == null) {
            if (objBridgingLoan.getSettlementList() != null)
                settlementSummary = (ISettlement[]) objBridgingLoan.getSettlementList();
        }

        String countryCode = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.orig_country");
        DefaultLogger.debug(this, "orig_country: " + countryCode);
%>
<html>
<head>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script>
function JumpOnSelectactive(actionPage, selectObj, index, progressStage) {
    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].value == "view")
        document.forms[0].event.value = "view";
    if (selectObj.options[selectIndex].value == "update")
        document.forms[0].event.value = "maker_prepare_update";
    if (selectObj.options[selectIndex].value == "delete")
        document.forms[0].event.value = "maker_prepare_delete";

    if (actionPage == 'BL_DevelopmentDoc.do')
        document.forms[0].progressStage.value = progressStage;
    else if (actionPage == 'BL_Disbursement.do')
        document.forms[0].disbursementIndex.value = index;
    else if (actionPage == 'BL_Settlement.do')
        document.forms[0].settlementIndex.value = index;

    document.forms[0].action = actionPage;
    document.forms[0].submit();
}

function gotoPage(actionPage, event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}

function checkProjectSchedule() {
    <% if (objBridgingLoan.getProjectScheduleList() == null) { %>
        alert('Project Schedule was empty. Unable to add new Documents!');
        return;
    <% } else { %>
        gotoPage('BL_DevelopmentDoc.do','maker_prepare_create');
    <% } %>
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif')">
<html:form action="BL_AdvsPayment.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="progressStage"/>
<input type="hidden" name="disbursementIndex"/>
<input type="hidden" name="settlementIndex"/>
<input type="hidden" name="amountDisbursed"/>
<input type="hidden" name="amountSettled"/>
<input type="hidden" name="orig_country" value="<%=countryCode%> "/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="58%" ><h3><bean:message key="label.bridgingloan.adv.pymt.title"/></h3></td>
        <td width="42%" style="text-align:right" valign="bottom" >
        <% if (isEdit != null && isEdit.equals("true")) { %>
            <input type="button" name="button23" id="button1" value="Add New Documents" class="btnNormal" onclick="javascript:checkProjectSchedule()" style="width:130px"/>
        <% } %>
        </td>
    </tr>
    <tr>
        <td colspan="2"><hr /></td>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr>
                    <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="*"><bean:message key="label.bridgingloan.prgs.stg"/></td>
                    <td width="*"><bean:message key="label.bridgingloan.doc.name"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.date.rcv"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.doc.date"/></td>
                    <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
                </thead>
                <tbody>
                    <%
                        boolean isDevEmpty = true;
                        if (objProjectSchedule != null) {
                            int index=0;
                            for (int i=0; i<objProjectSchedule.length; i++) {
                                developmentDocSummary = objProjectSchedule[i].getDevelopmentDocList();
                                if (developmentDocSummary != null) {
                                    isDevEmpty = false;
                                    for (int j=0; j<developmentDocSummary.length; j++) {
                                        if (developmentDocSummary[j].getIsDeletedInd() != true) {
                                            String progressStage = objProjectSchedule[i].getProgressStage();
                    %>
                    <tr class='<%=(index%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="index" ><%=++index%></td>
                        <td><integro:empty-if-null value="<%=progressStage%>"/>&nbsp;</td>
                        <td><integro:htmltext value="<%=developmentDocSummary[j].getDocName()%>"/></td>
                        <td style="text-align:right" ><integro:date object="<%=developmentDocSummary[j].getReceiveDate()%>" />&nbsp;</td>
                        <td style="text-align:right" ><integro:date object="<%=developmentDocSummary[j].getDocDate()%>" />&nbsp;</td>

                        <td style="text-align:center">
                        <% if (isEdit != null && isEdit.equals("true")) { %>
                            <select name="select3" onChange="JumpOnSelectactive('BL_DevelopmentDoc.do', this, '', '<%=progressStage%>')">
                                <option selected="selected">Please Select</option>
                                <option value="view">View</option>
                                <option value="update">Edit</option>
                                <option value="delete">Delete</option>
                            </select>
                        <% } else { %>
                            <a href="BL_DevelopmentDoc.do?event=view&developmentDocIndex=<%=index%>&progressStage=<%=progressStage%>">View</a>
                        <% } %>
                        </td>
                    </tr>
                    <% } } } } }
                    if (isDevEmpty == true) { %>
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td><h3><bean:message key="label.bridgingloan.dis.title"/></h3></td>
        <td style="text-align:right" valign="bottom">
        <% if (isEdit != null && isEdit.equals("true")) { %>
            <input type="button" name="button23" id="button2" value="Add New Disburstment" class="btnNormal" onclick="gotoPage('BL_Disbursement.do','maker_prepare_create')" style="width:150px"/>
        <% } %>
        </td>
    <tr>
        <td colspan="2"><hr /></td>
    </tr>
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr>
                    <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="*" ><bean:message key="label.bridgingloan.purp.dis"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.ttl.amt.dis"/></td>
                    <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
                </thead>
                <tbody>
                    <%
                        Amount totalAmountDisbursed = null;
                        Amount amountDisbursed = null;
                        boolean disConvertError = false;
                        int disIndex=0;
                        if (disbursementSummary != null) {
                            for ( ; disIndex<disbursementSummary.length; disIndex++) {
                                if (disbursementSummary[disIndex].getIsDeletedInd() != true) { //Record not deleted
                                    amountDisbursed = null;
                                    if (disbursementSummary[disIndex].getDisbursementDetailList() != null) {
                                        IDisbursementDetail[] objDisbursementDetail = disbursementSummary[disIndex].getDisbursementDetailList();
                                        for (int i=0 ; i<objDisbursementDetail.length; i++) {
                                            if (objDisbursementDetail[i].getIsDeletedInd() != true) {
                                                amountDisbursed = objDisbursementDetail[i].getDisburseAmount();
                                                DefaultLogger.debug(this, "amountDisbursed: " + amountDisbursed);
                                                if (!disConvertError) {
                                                    try {
                                                        totalAmountDisbursed = CommonUtil.addAmount(totalAmountDisbursed, amountDisbursed);
                                                    } catch (AmountConversionException e) {
                                                        if (e.toString().indexOf("AMT_CONV_EX")>-1){
                                                            disConvertError = true;
                                                            totalAmountDisbursed = null;
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                    %>
                    <tr class='<%=(disIndex%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="index"><%=(disIndex+1)%></td>
                        <td><integro:empty-if-null value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_PURPOSE).getCommonCodeLabel(disbursementSummary[disIndex].getPurpose())%>"/>&nbsp;</td>
                        <td style="text-align:right"><integro:amount amount="<%=totalAmountDisbursed%>"/>&nbsp;</td>

                        <td style="text-align:center">
                        <% if (isEdit != null && isEdit.equals("true")) { %>
                            <select name="select3" onChange="JumpOnSelectactive('BL_Disbursement.do', this, '<%=disIndex%>', '')">
                                <option selected="selected">Please Select</option>
                                <option value="view">View</option>
                                <option value="update">Edit</option>
                                <option value="delete">Delete</option>
                            </select>
                        <% } else { %>
                            <a href="BL_Disbursement.do?event=view&disbursementIndex=<%=disIndex%>">View</a>
                        <% } %>
                        </td>
                    </tr>
                    <% } } } else { %>
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                    <% } %>
                    <% if (disIndex > 0) { %>
                    <tr>
                        <td class="total" >&nbsp;</td>
                        <td width="*" class="total" style="text-align:right"><bean:message key="label.common.total"/></td>
                        <td width="10%" class="total" style="text-align:right">
                        <%
                            if (!disConvertError) {
                                %><integro:amount param="all" amount="<%=totalAmountDisbursed%>" /><%
                            }
                            else {
                                %><bean:message key="label.common.error.no.conversion"/> <%
                            }
                        %>
                        </td>
                        <td class="total">&nbsp;</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </td>
    </tr>
	<tr>
        <td><h3>Settlement Details</h3></td>
        <td style="text-align:right" valign="bottom">
        <% if (isEdit != null && isEdit.equals("true")) { %>
            <input name="Submit22" type="button" class="btnNormal" value="Add New Settlement" onclick="gotoPage('BL_Settlement.do','maker_prepare_create')" style="width:130px"/>
        <% } %>
        </td>
    </tr>
	<tr>
        <td colspan="2"><hr /></td>
    </tr>
	<tr>
	    <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr>
                    <td width="4%"><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="*"><bean:message key="label.bridgingloan.date.settle"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.amt.settle"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.amt.outstd"/></td>
                    <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
                </thead>
                <tbody>
                    <%
                        Amount amountSettled = null;
                        boolean settConvertError = false;
                        if (settlementSummary != null) {
                            for (int index=0; index<settlementSummary.length; index++) {
                                if (settlementSummary[index].getIsDeletedInd() != true) { //Record not deleted
                                    if (!settConvertError) {
                                        try {
                                            amountSettled = CommonUtil.addAmount(amountSettled, settlementSummary[index].getSettledAmount());
                                        } catch (AmountConversionException e) {
                                            if (e.toString().indexOf("AMT_CONV_EX")>-1) {
                                                settConvertError = true;
                                                amountSettled = null;
                                            }
                                        }
                                    }
                    %>
                    <tr class='<%=(index%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="index"><%=(index+1)%></td>
                        <td style="text-align:center"><integro:date object="<%=settlementSummary[index].getSettlementDate()%>" />&nbsp;</td>
                        <td style="text-align:right"><integro:amount amount="<%=settlementSummary[index].getSettledAmount()%>"/>&nbsp;</td>
                        <td style="text-align:right"><integro:amount amount="<%=settlementSummary[index].getOutstandingAmount()%>"/>&nbsp;</td>

                        <td style="text-align:center">
                        <% if (isEdit != null && isEdit.equals("true")) { %>
                            <select name="select3" onChange="JumpOnSelectactive('BL_Settlement.do', this, '<%=index%>', '')">
                                <option selected="selected">Please Select</option>
                                <option value="view">View</option>
                                <option value="update">Edit</option>
                                <option value="delete">Delete</option>
                            </select>
                        <% } else { %>
                            <a href="BL_Settlement.do?event=view&settlementIndex=<%=index%>">View</a>
                        <% } %>
                        </td>
                    </tr>
                    <% } } %>
                    <tr>
                        <td class="total">&nbsp;</td>
                        <td class="total" style="text-align:right"><bean:message key="label.common.total"/></td>
                        <td class="total" style="text-align:right">
                        <%
                            if (!settConvertError) {
                                %><integro:amount param="all" amount="<%=amountSettled%>" /><%
                            }
                            else {
                                %><bean:message key="label.common.error.no.conversion"/> <%
                            }
                        %>
                        </td>
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
        </td>
    </tr>
	<tr>
	    <td colspan="2"></td>
    </tr>
    </tbody>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
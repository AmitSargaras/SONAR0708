<%@ page import="com.integrosys.cms.app.bridgingloan.bus.*,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.app.bridgingloan.trx.IBridgingLoanTrxValue,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.common.AmountConversionException"%>

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
        IBridgingLoanTrxValue bridgingLoanTrxValue = (IBridgingLoanTrxValue) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.bridgingLoanTrxValue");

        IProjectSchedule[] projectScheduleActualList = null;
        IProjectSchedule[] projectScheduleStagingList = null;

        IDisbursement[] disbursementActualList = null;
        IDisbursement[] disbursementStagingList = null;

        ISettlement[] settlementActualList = null;
        ISettlement[] settlementStagingList = null;

        if (bridgingLoanTrxValue != null) {
            if (bridgingLoanTrxValue.getBridgingLoan() != null) {
                if (bridgingLoanTrxValue.getBridgingLoan().getProjectScheduleList() != null) { //actual will be null if this is new record
                    projectScheduleActualList = bridgingLoanTrxValue.getBridgingLoan().getProjectScheduleList();
                }
                if (bridgingLoanTrxValue.getBridgingLoan().getDisbursementList() != null) {
                    disbursementActualList = bridgingLoanTrxValue.getBridgingLoan().getDisbursementList();
                }
                if (bridgingLoanTrxValue.getBridgingLoan().getSettlementList() != null) {
                    settlementActualList = bridgingLoanTrxValue.getBridgingLoan().getSettlementList();
                }
            }
            if (bridgingLoanTrxValue.getStagingBridgingLoan() != null) { //Staging
                projectScheduleStagingList = bridgingLoanTrxValue.getStagingBridgingLoan().getProjectScheduleList();
                disbursementStagingList = bridgingLoanTrxValue.getStagingBridgingLoan().getDisbursementList();
                settlementStagingList = bridgingLoanTrxValue.getStagingBridgingLoan().getSettlementList();
            }
        }
%>
<html>
<head>
<title>CMS</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script>
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif')">
<html:form action="BL_AdvsPayment.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="amountDisbursed"/>
<input type="hidden" name="amountSettled"/>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="58%" ><h3><bean:message key="label.bridgingloan.adv.pymt.title"/></h3></td>
        <td width="42%" >&nbsp;</td>
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
                        int devIndex = 0;
                        if (projectScheduleStagingList != null) {
                            for (int i=0; i<projectScheduleStagingList.length; i++) {
                                IDevelopmentDoc[] developmentDocActualList = null;
                                if (projectScheduleActualList != null)  //actual will be null if this is new record
                                    developmentDocActualList = projectScheduleActualList[i].getDevelopmentDocList();

                                IDevelopmentDoc[] developmentDocStagingList = projectScheduleStagingList[i].getDevelopmentDocList();
                                if (developmentDocActualList != null || developmentDocStagingList != null) {
                                    List compResult = CompareOBUtil.compOBArray(developmentDocStagingList, developmentDocActualList);
                                    ArrayList List = new ArrayList(compResult);
                                    pageContext.setAttribute("developmentDocList", List);
                                }

                    %>
                    <logic:present name="developmentDocList">
                        <logic:iterate id="compResult" name="developmentDocList" type="com.integrosys.base.techinfra.diff.CompareResult">
                        <%
                            IDevelopmentDoc stagingParameter = (IDevelopmentDoc) compResult.getObj();
                            devIndex++;
                        %>
                        <tr class='<%=(devIndex%2==0?"even":"odd")%>'>
                            <td style="text-align:center" class="<bean:write name="compResult" property="key" />"><%=devIndex%></td>
                            <td><integro:empty-if-null value="<%=projectScheduleStagingList[i].getProgressStage()%>"/></td>
                            <td><integro:empty-if-null value="<%=stagingParameter.getDocName()%>"/></td>
                            <td style="text-align:right" ><integro:date object="<%=stagingParameter.getReceiveDate()%>" /></td>
                            <td style="text-align:right" ><integro:date object="<%=stagingParameter.getDocDate()%>" /></td>
                            <td style="text-align:center"><a href="BL_DevelopmentDoc.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&progressStage=<%=projectScheduleStagingList[i].getProgressStage()%>&developmentDocIndex=<%=(devIndex-1)%>">View</a></td>
                        </tr>
                        </logic:iterate>
                    </logic:present>
                    <%  }
                    } %>
                    <logic:notPresent name="developmentDocList">
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                    </logic:notPresent>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td><h3><bean:message key="label.bridgingloan.dis.title"/></h3></td>
        <td>&nbsp;</td>
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
                        boolean disTtlConvertError = false;
                        if (disbursementActualList != null || disbursementStagingList != null) {
                            List compResult = CompareOBUtil.compOBArray(disbursementStagingList, disbursementActualList);
                            ArrayList List = new ArrayList(compResult);
                            pageContext.setAttribute("disbursementList", List);
                        }
                        int disIndex = 0;
                    %>
                    <logic:present name="disbursementList">
                        <logic:iterate id="compResult" name="disbursementList" type="com.integrosys.base.techinfra.diff.CompareResult">
                        <%
                            IDisbursement stagingParameter = (IDisbursement) compResult.getObj();
                            disIndex++;

                            IDisbursementDetail[] objDisbursementDetailStagingList = null;
                            objDisbursementDetailStagingList = (IDisbursementDetail[]) stagingParameter.getDisbursementDetailList();

                            amountDisbursed = null;
                            if (objDisbursementDetailStagingList != null) {
                                for (int index=0; index<objDisbursementDetailStagingList.length; index++) {
                                    if (!disConvertError) {
                                        try {
                                            amountDisbursed = CommonUtil.addAmount(amountDisbursed, objDisbursementDetailStagingList[index].getDisburseAmount());
                                        } catch (AmountConversionException e) {
                                            if (e.toString().indexOf("AMT_CONV_EX")>-1){
                                                disConvertError = true;
                                                amountDisbursed = null;
                                            }
                                        }
                                    }
                                    if (!disTtlConvertError) {
                                        try {
                                            totalAmountDisbursed = CommonUtil.addAmount(totalAmountDisbursed, objDisbursementDetailStagingList[index].getDisburseAmount());
                                        } catch (AmountConversionException e) {
                                            if (e.toString().indexOf("AMT_CONV_EX")>-1){
                                                disTtlConvertError = true;
                                                totalAmountDisbursed = null;
                                            }
                                        }
                                    }
                                }
                            }
                        %>
                        <tr class='<%=(disIndex%2==0?"even":"odd")%>'>
                            <td style="text-align:center" class="<bean:write name="compResult" property="key" />"><%=disIndex%></td>
                            <td><integro:empty-if-null value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_PURPOSE).getCommonCodeLabel(stagingParameter.getPurpose())%>"/></td>
                            <td style="text-align:right"><integro:amount amount="<%=amountDisbursed%>"/>&nbsp;</td>
                            <td style="text-align:center">
                            <% if (!disConvertError) { %>
                                <a href="BL_Disbursement.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&amountDisbursed=<integro:amount param="all" amount="<%=amountDisbursed%>" />">View</a>
                            <% } else { %>
                                <a href="BL_Disbursement.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>&amountDisbursed=<bean:message key="label.common.error.no.conversion"/>" />">View</a>
                            <% } %>
                            </td>
                        </tr>
                        </logic:iterate>
                    </logic:present>
                    <logic:notPresent name="disbursementList">
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                    </logic:notPresent>
                    <% if (disIndex > 0) { %>
                    <tr>
                        <td class="total" >&nbsp;</td>
                        <td width="*" class="total" style="text-align:right"><bean:message key="label.common.total"/></td>
                        <td width="10%" class="total" style="text-align:right">
                        <%
                            if (!disTtlConvertError) {
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
        <td>&nbsp;</td>
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
                        if (settlementActualList != null || settlementStagingList != null) {
                            List compResult = CompareOBUtil.compOBArray(settlementStagingList, settlementActualList);
                            ArrayList List = new ArrayList(compResult);
                            pageContext.setAttribute("settlementList", List);
                        }
                        int settIndex = 0;
                    %>
                    <logic:present name="settlementList">
                        <logic:iterate id="compResult" name="settlementList" type="com.integrosys.base.techinfra.diff.CompareResult">
                        <%
                            ISettlement stagingParameter = (ISettlement) compResult.getObj();
                            settIndex++;
                            if (!settConvertError) {
                                try {
                                    amountSettled = CommonUtil.addAmount(amountSettled, stagingParameter.getSettledAmount());
                                } catch (AmountConversionException e) {
                                    if (e.toString().indexOf("AMT_CONV_EX")>-1){
                                        settConvertError = true;
                                        amountSettled = null;
                                    }
                                }
                            }
                        %>
                        <tr class='<%=(settIndex%2==0?"even":"odd")%>'>
                            <td style="text-align:center" class="<bean:write name="compResult" property="key" />"><%=settIndex%></td>
                            <td style="text-align:center"><integro:date object="<%=stagingParameter.getSettlementDate()%>" /></td>
                            <td style="text-align:right"><integro:amount amount="<%=stagingParameter.getSettledAmount()%>"/></td>
                            <td style="text-align:right"><integro:amount amount="<%=stagingParameter.getOutstandingAmount()%>"/></td>
                            <td style="text-align:center">
                                <a href="BL_Settlement.do?event=checker_view&commonRef=<%=stagingParameter.getCommonRef()%>">View</a>
                            </td>
                        </tr>
                        </logic:iterate>
                    </logic:present>
                    <logic:notPresent name="settlementList">
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                    </logic:notPresent>
                    <% if (settIndex > 0) { %>
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
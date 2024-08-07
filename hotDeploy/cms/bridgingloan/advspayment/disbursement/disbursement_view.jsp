<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.List,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursement,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursementDetail,
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
* Purpose: View Disbursement
* Description: This screen allows the view of new Disbursement.
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
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);

        int disbursementIndex = Integer.parseInt(request.getParameter("disbursementIndex"));
        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        IDisbursement[] objDisbursement = (IDisbursement[]) objBridgingLoan.getDisbursementList();
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
    document.forms[0].event.value=event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif')">
<html:form action="BL_Disbursement.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="disbursementIndex" value="<%=request.getParameter("disbursementIndex")%>"/>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td width="81%" ><h3><bean:message key="label.bridgingloan.dis.title.add"/></h3></td>
    </tr>
    <tr>
        <td><hr/></td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.purp.dis"/></td>
                <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_PURPOSE).getCommonCodeLabel(objDisbursement[disbursementIndex].getPurpose())%>"/></td>   
            </tr>
            <tr class="even">
                <td class="fieldname"><bean:message key="label.bridgingloan.ttl.amt.dis"/></td>
                <td>
                <%
                    Amount amountDisbursed = null;
                    boolean convertError = false;

                    if (!convertError) {
                        %><integro:amount param="all" amount="<%=amountDisbursed%>" /><%
                    }
                    else {
                        %><bean:message key="label.common.error.no.conversion" /><%
                    }
                %>
                </td>
            </tr>
            <tr class="odd">
                <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                <td><integro:htmltext value="<%=objDisbursement[disbursementIndex].getDisRemarks()%>" /></td>
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
    <tr>
        <td colspan="2">
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <thead>
                <tr style="text-align:center">
                    <td width="4%" ><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.dis.date"/></td>
                    <td width="20%"><bean:message key="label.bridgingloan.sub.purp.dis"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.amt.dis"/></td>
                    <td width="*"><bean:message key="label.bridgingloan.mode.dis"/><br/></td>
                    <td width="16%"><bean:message key="label.bridgingloan.payee"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.ref.no"/></td>
                    <td width="12%"><bean:message key="label.bridgingloan.gl.ref.no"/></td>
                    <td width="10%"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
                </thead>
                <tbody>
                    <%
                        amountDisbursed = null; //Reset amount to null before attempt any calculation
                        convertError = false;
                        if (objDisbursement != null && objDisbursement[disbursementIndex].getDisbursementDetailList() != null) {
                            IDisbursementDetail[] objDisbursementDetail = (IDisbursementDetail[]) objDisbursement[disbursementIndex].getDisbursementDetailList();
                            if (objDisbursementDetail != null) {
                            for (int index=0; index<objDisbursementDetail.length; index++) {
                                if (objDisbursementDetail[index].getIsDeletedInd() != true) { //Record not deleted
                                    if(!convertError) {
                                        try {
                                            amountDisbursed = CommonUtil.addAmount(amountDisbursed, objDisbursementDetail[index].getDisburseAmount());
                                        } catch (AmountConversionException e) {
                                            if(e.toString().indexOf("AMT_CONV_EX")>-1){
                                                convertError = true;
                                                amountDisbursed = null;
                                            }
                                        }
                                    }
                    %>
                    <tr class='<%=(index%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="index"><%=(index+1)%></td>
                        <td style="text-align:center"><integro:date object="<%=objDisbursementDetail[index].getDisbursementDate()%>" /></td>
                        <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_SUBPURPOSE).getCommonCodeLabel(objDisbursementDetail[index].getSubpurpose())%>"/></td>
                        <td style="text-align:right"><integro:amount amount="<%=objDisbursementDetail[index].getDisburseAmount()%>"/></td>
                        <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_MODE).getCommonCodeLabel(objDisbursementDetail[index].getDisbursementMode())%>"/></td>
                        <td><integro:htmltext value="<%=objDisbursementDetail[index].getPayee()%>"/></td>
                        <td><integro:htmltext value="<%=objDisbursementDetail[index].getReferenceNumber()%>"/></td>
                        <td><integro:htmltext value="<%=objDisbursementDetail[index].getGlReferenceNumber()%>"/></td>
                        <td style="text-align:center">
                        <% if ((isEdit != null && isEdit.equals("true")) && (event.equals("maker_prepare_delete") || event.equals("delete"))) { %>
                            <a href="BL_DisbursementDetail.do?event=maker_prepare_delete&current_page=view_page&disbursementIndex=<%=disbursementIndex%>&disbursementDetailIndex=<%=index%>&purpose=<%=objDisbursement[disbursementIndex].getPurpose()%>">Delete</a>
                        <% } else if (event.equals("view")) { %>
                            <a href="BL_DisbursementDetail.do?event=view&current_page=view_page&disbursementIndex=<%=disbursementIndex%>&disbursementDetailIndex=<%=index%>&purpose=<%=objDisbursement[disbursementIndex].getPurpose()%>">View</a>
                        <% } %>
                        </td>
                    </tr>
                    <%  } } }
                    }
                    else { %>
                    <tr class="odd">
                        <td colspan="10"><bean:message key="label.common.empty"/></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td height="14" style="text-align:right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
        <td height="14" style="text-align:center" valign="bottom">
            <%
            if(event.equals("view")) {
                %><a href="javascript:gotoPage('BL_AdvsPayment.do', 'list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
            }
            else{ %>
                <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                <a href="javascript:gotoPage('BL_AdvsPayment.do', 'list_summary')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
            <% } %>
        </td>
    </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
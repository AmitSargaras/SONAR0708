<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.bridgingloan.bus.IBridgingLoan,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursement,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursementDetail,
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
        String isEdit = (String) session.getAttribute("com.integrosys.cms.ui.bridgingloan.BridgingLoanAction.isEdit");
        String event = request.getParameter("event");
        DefaultLogger.debug(this,"event="+event);
        String current_page = (String) request.getParameter("current_page");

        String purpose = String.valueOf(request.getParameter("purpose"));
        int disbursementIndex = Integer.parseInt(request.getParameter("disbursementIndex"));
        int disbursementDetailIndex = Integer.parseInt(request.getParameter("disbursementDetailIndex"));

        IBridgingLoan objBridgingLoan = (IBridgingLoan) request.getAttribute("objBridgingLoan");
        IDisbursement[] objDisbursement = (IDisbursement[]) objBridgingLoan.getDisbursementList();
        IDisbursementDetail[] objDisbursementDetail = (IDisbursementDetail[]) objDisbursement[disbursementIndex].getDisbursementDetailList();
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

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
}
</script>
</head>

<body onLoad="MM_preloadImages('img/submit2.gif','img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="BL_DisbursementDetail.do" >
<input type="hidden" name="event"/>
<input type="hidden" name="current_page" value="<%=current_page%>" />
<input type="hidden" name="next_page"/>
<input type="hidden" name="disbursementIndex" value="<%=request.getParameter("disbursementIndex")%>" />
<input type="hidden" name="disbursementDetailIndex" value="<%=request.getParameter("disbursementDetailIndex")%>" />

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
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
                    <td width="20%" class="fieldname"><bean:message key="label.bridgingloan.dis.date"/></td>
                    <td width="30%"><integro:date object="<%=objDisbursementDetail[disbursementDetailIndex].getDisbursementDate()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.purp.dis"/></td>
                    <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_PURPOSE).getCommonCodeLabel(purpose)%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.sub.purp.dis"/></td>
                    <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_SUBPURPOSE).getCommonCodeLabel(objDisbursementDetail[disbursementDetailIndex].getSubpurpose())%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.invoice.no"/></td>
                    <td><integro:empty-if-null value="<%=objDisbursementDetail[disbursementDetailIndex].getInvoiceNumber()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.invoice.amt"/></td>
                    <td><integro:amount amount="<%=objDisbursementDetail[disbursementDetailIndex].getInvoiceAmount()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.amt.dis"/></td>
                    <td><integro:amount amount="<%=objDisbursementDetail[disbursementDetailIndex].getDisburseAmount()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.mode.dis"/></td>
                    <td><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_MODE).getCommonCodeLabel(objDisbursementDetail[disbursementDetailIndex].getDisbursementMode())%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.payee"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail[disbursementDetailIndex].getPayee()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.ref.no"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail[disbursementDetailIndex].getReferenceNumber()%>" />&nbsp;</td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.gl.ref.no"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail[disbursementDetailIndex].getGlReferenceNumber()%>" />&nbsp;</td>
                </tr>
                <tr class="odd">
                    <td class="fieldname"><bean:message key="label.bridgingloan.rem"/></td>
                    <td><integro:htmltext value="<%=objDisbursementDetail[disbursementDetailIndex].getRemarks()%>" />&nbsp;</td>
                </tr>
            </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td >&nbsp;</td>
    </tr>
    <tr>
        <td height="14" style="text-align:right" valign="bottom">&nbsp;</td>
    </tr>
    <tr>
        <td height="14" style="text-align:center" valign="bottom">
            <%
            if ((isEdit != null && isEdit.equals("true"))) {
                if (event.equals("maker_prepare_delete")) {
            %>
                    <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                    <a href="javascript:gotoPage('BL_Disbursement.do', maker_prepare_update')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
            <%
                }
                else if (current_page.equals("update_page")) { %>
                    <a href="javascript:gotoPage('BL_Disbursement.do', 'maker_prepare_update')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
                }
                else { %>
                    <a href="javascript:gotoPage('BL_Disbursement.do', 'view')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
                }
            }
            else if(event.equals("view")) { %>
                <a href="javascript:gotoPage('BL_Disbursement.do', 'view')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a><%
            } else { %>
                <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
                <a href="javascript:gotoPage('BL_Disbursement.do', 'view')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
            <% } %>
        </td>
    </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
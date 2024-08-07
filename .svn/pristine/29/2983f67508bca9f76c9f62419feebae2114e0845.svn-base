<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.bridgingloan.bus.OBDisbursement,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursementDetail,
                 com.integrosys.cms.app.bridgingloan.bus.IDisbursement"%>

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
        OBDisbursement objStagingDisbursement = (OBDisbursement) request.getAttribute("objStagingDisbursement");
        OBDisbursement objActualDisbursement = (OBDisbursement) request.getAttribute("objActualDisbursement");
        OBDisbursement objDisbursement = ((objActualDisbursement != null && objStagingDisbursement != null) || objActualDisbursement == null ? objStagingDisbursement : objActualDisbursement);
        String amountDisbursed = String.valueOf(request.getParameter("amountDisbursed"));
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
                    <td width="20%" class="<%=CompareOBUtil.compOB(objStagingDisbursement, objActualDisbursement,"purpose")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.purp.dis"/></td>
                    <td width="30%"><integro:htmltext value="<%=CommonCodeList.getInstance(null, ICMSUIConstant.DISBURSE_PURPOSE).getCommonCodeLabel(objDisbursement.getPurpose())%>"/></td>
                </tr>
                <tr class="even">
                    <td class="fieldname"><bean:message key="label.bridgingloan.ttl.amt.dis"/></td>
                    <td><integro:empty-if-invalid displayForInvalid="-" value="<%=amountDisbursed%>" /></td>
                </tr>
                <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(objStagingDisbursement, objActualDisbursement,"disRemarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.bridgingloan.rem"/>Remarks</td>
                    <td><integro:htmltext value="<%=objDisbursement.getDisRemarks()%>"/></td>
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
                <tr class="even" style="text-align:center">
                    <td width="4%" class="fieldname"><bean:message key="label.bridgingloan.sn"/></td>
                    <td width="12%" class="fieldname"><bean:message key="label.bridgingloan.dis.date"/></td>
                    <td width="14%" class="fieldname"><bean:message key="label.bridgingloan.sub.purp.dis"/></td>
                    <td width="12%" class="fieldname"><bean:message key="label.bridgingloan.amt.dis"/></td>
                    <td width="*" class="fieldname"><bean:message key="label.bridgingloan.mode.dis"/><br/></td>
                    <td width="14%" class="fieldname"><bean:message key="label.bridgingloan.payee"/></td>
                    <td width="12%" class="fieldname"><bean:message key="label.bridgingloan.ref.no"/></td>
                    <td width="12%" class="fieldname"><bean:message key="label.bridgingloan.gl.ref.no"/></td>
                    <td width="10%" class="fieldname"><bean:message key="label.bridgingloan.action"/></td>
                </tr>
                </thead>
                <tbody>
                    <%
                        IDisbursementDetail[] disbursementDetailSummary = (IDisbursementDetail[]) request.getAttribute("disbursementDetailSummary");

                        if (disbursementDetailSummary != null) {
                            for (int index=0; index<disbursementDetailSummary.length; index++) {
                                if (disbursementDetailSummary[index].getIsDeletedInd() != true) { //Record not deleted
                    %>
                    <tr class='<%=(index%2==0?"even":"odd")%>'>
                        <td style="text-align:center" class="index"><%=(index+1)%></td>
                        <td style="text-align:center"><integro:date object="<%=disbursementDetailSummary[index].getDisbursementDate()%>" /></td>
                        <td style="text-align:right"><integro:htmltext value="<%=disbursementDetailSummary[index].getSubpurpose()%>"/></td>
                        <td style="text-align:right"><integro:amount amount="<%=disbursementDetailSummary[index].getDisburseAmount()%>"/></td> 
                        <td style="text-align:right"><integro:htmltext value="<%=disbursementDetailSummary[index].getDisbursementMode()%>"/></td>
                        <td style="text-align:right"><integro:htmltext value="<%=disbursementDetailSummary[index].getPayee()%>"/></td>
                        <td style="text-align:right"><integro:htmltext value="<%=disbursementDetailSummary[index].getReferenceNumber()%>"/></td>
                        <td style="text-align:right"><integro:htmltext value="<%=disbursementDetailSummary[index].getGlReferenceNumber()%>"/></td>
                        <td style="text-align:center"><a href="BL_DisbursementDetail.do?event=view&index=<%=index%>">View</a></td>
                    </tr>
                    <%  } }
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
        <td height="14">&nbsp;</td>
    </tr>
    <tr>
        <td style="text-align:center">
            <a href="javascript:gotoPage('BL_AdvsPayment.do', 'checker_list_summary')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
        </td>
    </tr>
    </thead>
</table>
</html:form>
</body>
</html>
<% } catch (Exception e) { e.printStackTrace(); } %>
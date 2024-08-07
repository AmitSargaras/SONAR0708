<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.OBPayment" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.OBAdvance" %>
<%@ page import="com.integrosys.cms.ui.common.UIUtil" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ page import="com.integrosys.cms.ui.contractfinancing.advspayment.PaymentForm" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function JumpOnSelect(selectObj) {
    var selectIndex = selectObj.selectedIndex;
    if (selectObj.options[selectIndex].value == 1)
        window.location.href =  "ContractFinancing.do?event=facility_view";
    if (selectObj.options[selectIndex].value == 2)
        window.location.href =  "ContractFinancing.do?event=facility_edit";
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<%
/**
* Copyright Integro Technologies Pte Ltd
*
* Purpose: contract financing - maker update page
*
* @author $Author: KienLeong $<br>
* @version $Revision: 1.2 $
* @since $Date: 2007/May/07 $
* Tag: $Name:  $
*/
%>

<%
    String event = request.getParameter("event");

    OBAdvance obAdvance = (OBAdvance)request.getAttribute("obAdvance");
    OBAdvance obActualAdvance = (OBAdvance)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.obActualAdvance");
    OBAdvance obAdvanceDetail = obAdvance;
    if(obAdvance.getAdvanceID()== ICMSConstant.LONG_INVALID_VALUE){
        obAdvanceDetail = obActualAdvance;  //use actual, when stage was deleted
    }

    OBPayment obPayment = (OBPayment)request.getAttribute("obPayment");
    OBPayment obActualPayment = (OBPayment)request.getAttribute("obActualPayment");
    PaymentForm aForm = (PaymentForm) request.getAttribute("CF_PaymentForm");
%>

<html:form action="CF_Payment.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="81%" >
            <h3>
            <%
            if(event.equals("view")){
                %><bean:message key="label.advancepayment.view"/><%
            }
            else{
                %><bean:message key="label.advancepayment.delete"/><%
            }
            %>
            </h3>
        </td>
    </tr>
    <tr>
        <td ><hr/></td>
    </tr>
</thead>
</table>

<%@ include file="advance_section_checker_helper.jsp" %>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr>
    <td >&nbsp;</td>
</tr>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr >
        <td colspan="2" ><bean:message key="label.advancepayment.payment.section"/></td>
    </tr>
</thead>
<tbody>
    <tr class="odd">
        <td width="20%" class="<%=CompareOBUtil.compOB(obPayment,obActualPayment,"receiveDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.date.payment.received"/></td>
        <td width="30%"><%=aForm.getReceiveDate()%></td>
    </tr>
    <tr class="even">
        <%
            stagingAmt = (obPayment == null) ? null : obPayment.getReceiveAmount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getReceiveAmount();
        %>
        <td class="<%=UIUtil.isAmountUnChanged(stagingAmt,actualAmt,true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.amount.received"/> </td>
        <td><%=aForm.getReceiveCurrency()%> <%=aForm.getReceiveAmount()%></td>
    </tr>
    <tr class="odd">
        <td class="<%=CompareOBUtil.compOB(obPayment,obActualPayment,"receiveFrom")?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.payment.received.from"/> </td>
        <td><integro:empty-if-null value="<%=aForm.getReceiveFrom()%>" />&nbsp;</td>
    </tr>
</tbody>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr>
    <td >&nbsp;</td>
</tr>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr >
        <td colspan="3"><bean:message key="label.advancepayment.distribution.payment.received"/></td>
    </tr>
</thead>
<tbody>
    <tr class="odd">
        <td width="20%" class="<%=CompareOBUtil.compOB(obPayment,obActualPayment,"distributeDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.date.payment.distributed"/></td>
        <td width="30%" colspan="2"><%=aForm.getDistributeDate()%></td>
    </tr>
    <tr class="even">
        <%
            stagingAmt = (obPayment == null) ? null : obPayment.getDistributeAmount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getDistributeAmount();
        %>
        <td class="<%=UIUtil.isAmountUnChanged(stagingAmt,actualAmt,true)?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.amount.distributed"/></td>
        <td colspan="2"><%=aForm.getDistributeCurrency()%> <%=aForm.getDistributeAmount()%></td>
    </tr>
    <tr class="odd">
        <%
            boolean isUnChanged = true;
            stagingAmt = (obPayment == null) ? null : obPayment.getFDRAmount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getFDRAmount();
            if (!CompareOBUtil.compOB(obPayment, obActualPayment, "isToFDR") ||
                    !UIUtil.isAmountUnChanged(stagingAmt, actualAmt, true)) {
                isUnChanged = false;
            }
            stagingAmt = (obPayment == null) ? null : obPayment.getRepoAmount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getRepoAmount();
            if (!CompareOBUtil.compOB(obPayment, obActualPayment, "isToRepo") ||
                    !UIUtil.isAmountUnChanged(stagingAmt, actualAmt, true)) {
                isUnChanged = false;
            }
            stagingAmt = (obPayment == null) ? null : obPayment.getAPGAmount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getAPGAmount();
            if (!CompareOBUtil.compOB(obPayment, obActualPayment, "isToAPG") ||
                    !UIUtil.isAmountUnChanged(stagingAmt, actualAmt, true)) {
                isUnChanged = false;
            }
            stagingAmt = (obPayment == null) ? null : obPayment.getTL1Amount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getTL1Amount();
            if (!CompareOBUtil.compOB(obPayment, obActualPayment, "isToTL1") ||
                    !UIUtil.isAmountUnChanged(stagingAmt, actualAmt, true)) {
                isUnChanged = false;
            }
            stagingAmt = (obPayment == null) ? null : obPayment.getTL2Amount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getTL2Amount();
            if (!CompareOBUtil.compOB(obPayment, obActualPayment, "isToTL2") ||
                    !UIUtil.isAmountUnChanged(stagingAmt, actualAmt, true)) {
                isUnChanged = false;
            }
            stagingAmt = (obPayment == null) ? null : obPayment.getTL3Amount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getTL3Amount();
            if (!CompareOBUtil.compOB(obPayment, obActualPayment, "isToTL3") ||
                    !UIUtil.isAmountUnChanged(stagingAmt, actualAmt, true)) {
                isUnChanged = false;
            }
            stagingAmt = (obPayment == null) ? null : obPayment.getCollectionAccountAmount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getCollectionAccountAmount();
            if (!CompareOBUtil.compOB(obPayment, obActualPayment, "isToCollectionAccount") ||
                    !UIUtil.isAmountUnChanged(stagingAmt, actualAmt, true)) {
                isUnChanged = false;
            }
            stagingAmt = (obPayment == null) ? null : obPayment.getBCAmount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getBCAmount();
            if (!CompareOBUtil.compOB(obPayment, obActualPayment, "isToBC") ||
                    !UIUtil.isAmountUnChanged(stagingAmt, actualAmt, true)) {
                isUnChanged = false;
            }
            stagingAmt = (obPayment == null) ? null : obPayment.getOthersAmount();
            actualAmt = (obActualPayment == null) ? null : obActualPayment.getOthersAmount();
            if (!CompareOBUtil.compOB(obPayment, obActualPayment, "isToOthers") ||
                    !UIUtil.isAmountUnChanged(stagingAmt, actualAmt, true)) {
                isUnChanged = false;
            }
        %>
        <td class="<%=isUnChanged?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.distributed.account"/></td>
        <td colspan="2">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
            <tbody>
                <%
                if (aForm.getFdrAmount()!=null) {
                    %><tr class="odd">
                    <td>FDR</td>
                    <td><%=aForm.getFdrCurrency()%> <%=aForm.getFdrAmount()%></td>
                    </tr><%
                }
                if (aForm.getRepoAmount()!=null) {
                    %><tr class="odd">
                    <td>REPO</td>
                    <td><%=aForm.getRepoCurrency()%> <%=aForm.getRepoAmount()%></td>
                    </tr><%
                }
                if (aForm.getApgAmount()!=null) {
                    %><tr class="odd">
                    <td>APG</td>
                    <td><%=aForm.getApgCurrency()%> <%=aForm.getApgAmount()%></td>
                    </tr><%
                }
                if (aForm.getTl1Amount()!=null) {
                    %><tr class="odd">
                    <td>TL1</td>
                    <td><%=aForm.getTl1Currency()%> <%=aForm.getTl1Amount()%></td>
                    </tr><%
                }
                if (aForm.getTl2Amount()!=null) {
                    %><tr class="odd">
                    <td>TL2</td>
                    <td><%=aForm.getTl2Currency()%> <%=aForm.getTl2Amount()%></td>
                    </tr><%
                }
                if (aForm.getTl3Amount()!=null) {
                    %><tr class="odd">
                    <td>TL3</td>
                    <td><%=aForm.getTl3Currency()%> <%=aForm.getTl3Amount()%></td>
                    </tr><%
                }
                if (aForm.getCollectionAccAmount()!=null) {
                    %><tr class="odd">
                    <td>Current Account</td>
                    <td><%=aForm.getCollectionAccCurrency()%> <%=aForm.getCollectionAccAmount()%></td>
                    </tr><%
                }
                if (aForm.getBcAmount()!=null) {
                    %><tr class="odd">
                    <td>Bankers Cheque</td>
                    <td><%=aForm.getBcCurrency()%> <%=aForm.getBcAmount()%></td>
                    </tr><%
                }
                if (aForm.getOthAmount()!=null) {
                    %><tr class="odd">
                    <td>Others</td>
                    <td><%=aForm.getOthCurrency()%> <%=aForm.getOthAmount()%></td>
                    </tr><%
                }
                %>
            </tbody>
            </table>
        </td>
    </tr>
    <tr class="odd">
        <td class="<%=CompareOBUtil.compOB(obPayment,obActualPayment,"remarks")?"fieldname":"fieldnamediff"%>"><bean:message key="label.advancepayment.remarks"/></td>
        <td colspan="2">
            <integro:htmltext value="<%=aForm.getRemarks()%>" lineLength="100" />&nbsp;
        </td>
    </tr>
</tbody>
</table>

<table border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="75">&nbsp;</td>
</tr>
<tr>
    <td>
        <a href="javascript:history.go(-1)" onmouseout="MM_swapImgRestore()"
               onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)">
                <img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a>
    </td>
</tr>
</table>

<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.OBPayment" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.OBAdvance" %>
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

function submitPage(event) {
    document.forms[0].event.value=event;
    document.forms[0].submit();
}

function gotoPage(actionPage,event) {
    document.forms[0].event.value = event;
    document.forms[0].action = actionPage;
    document.forms[0].submit();
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
    OBPayment obPayment = (OBPayment)request.getAttribute("obPayment");

    OBAdvance obAdvance = (OBAdvance)request.getAttribute("obAdvance");
%>

<html:form action="CF_SG_Payment.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
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

<%@ include file="SG_advance_section_helper.jsp" %>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr>
    <td >&nbsp;</td>
</tr>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr >
        <td colspan="2" ><bean:message key="label.advancepayment.payment.section"/></td>
    </tr>
</thead>
<tbody>
    <tr class="odd">
        <td width="20%" class="fieldname"><bean:message key="label.advancepayment.date.payment.received"/></td>
        <td width="30%"><integro:date object="<%=obPayment.getReceiveDate()%>" /></td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.advancepayment.amount.received"/></td>
        <td><integro:amount param="all" amount="<%=obPayment.getReceiveAmount()%>" /></td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.advancepayment.payment.received.from"/></td>
        <td><integro:empty-if-null value="<%=obPayment.getReceiveFrom()%>" />&nbsp;</td>
    </tr>
</tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr>
    <td >&nbsp;</td>
</tr>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr >
        <td colspan="3"><bean:message key="label.advancepayment.retention.section"/></td>
    </tr>
</thead>
<tbody>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.advancepayment.date.retention.distributed"/></td>
        <td width="30%" colspan="2"><integro:date object="<%=obPayment.getDistributeDate()%>" /></td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.advancepayment.retention.amount"/></td>
        <td colspan="2"><integro:amount param="all" amount="<%=obPayment.getDistributeAmount()%>" /></td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.advancepayment.retained.to"/></td>
        <td colspan="2">
            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
            <tbody>
                <%
                if (obPayment.getIsToFDR()) {
                    %><tr class="odd">
                    <td>FDR</td>
                    <td><integro:amount param="all" amount="<%=obPayment.getFDRAmount()%>" /></td>
                    </tr><%
                }
                if (obPayment.getIsToRepo()) {
                    %><tr class="odd">
                    <td>REPO</td>
                    <td><integro:amount param="all" amount="<%=obPayment.getRepoAmount()%>" /></td>
                    </tr><%
                }
                if (obPayment.getIsToAPG()) {
                    %><tr class="odd">
                    <td>APG</td>
                    <td><integro:amount param="all" amount="<%=obPayment.getAPGAmount()%>" /></td>
                    </tr><%
                }
                if (obPayment.getIsToTL1()) {
                    %><tr class="odd">
                    <td>TL1</td>
                    <td><integro:amount param="all" amount="<%=obPayment.getTL1Amount()%>" /></td>
                    </tr><%
                }
                if (obPayment.getIsToTL2()) {
                    %><tr class="odd">
                    <td>TL2</td>
                    <td><integro:amount param="all" amount="<%=obPayment.getTL2Amount()%>" /></td>
                    </tr><%
                }
                if (obPayment.getIsToTL3()) {
                    %><tr class="odd">
                    <td>TL3</td>
                    <td><integro:amount param="all" amount="<%=obPayment.getTL3Amount()%>" /></td>
                    </tr><%
                }
                if (obPayment.getIsToCollectionAccount()) {
                    %><tr class="odd">
                    <td>Current Account</td>
                    <td><integro:amount param="all" amount="<%=obPayment.getCollectionAccountAmount()%>" /></td>
                    </tr><%
                }
                if (obPayment.getIsToBC()) {
                    %><tr class="odd">
                    <td>Bankers Cheque</td>
                    <td><integro:amount param="all" amount="<%=obPayment.getBCAmount()%>" /></td>
                    </tr><%
                }
                if (obPayment.getIsToOthers()) {
                    %><tr class="odd">
                    <td>Others</td>
                    <td><integro:amount param="all" amount="<%=obPayment.getOthersAmount()%>" /></td>
                    </tr><%
                }
                %>
            </tbody>
            </table>
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.advancepayment.remarks"/></td>
        <td colspan="2">
            <integro:htmltext value="<%=obPayment.getRemarks()%>" lineLength="100" />&nbsp;
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
        <%
        String initAdvEvent = (String)session.getAttribute("com.integrosys.cms.ui.contractfinancing.ContractFinancingAction.initAdvEvent");
        if (initAdvEvent != null && initAdvEvent.equals("view")) {
            %><a href="javascript:gotoPage('CF_SG_AdvsPayment.do','view')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a><%
        } else {
            %><a href="javascript:gotoPage('CF_SG_AdvsPayment.do','maker_prepare_update')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/return1.gif" name="Image3311" border="0" id="Image3311"/></a><%
        }
        %>
    </td>
</tr>
</table>

<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>
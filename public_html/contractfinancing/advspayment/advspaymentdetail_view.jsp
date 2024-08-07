<%@ page import="com.integrosys.cms.app.contractfinancing.bus.IPayment"%>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.OBAdvance" %>
<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger" %>
<%@ page import="com.integrosys.cms.app.commodity.common.AmountConversionException" %>
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
    OBAdvance obAdvance = (OBAdvance)request.getAttribute("obAdvance");
    String advanceIndex = request.getParameter("advanceIndex");
%>

<html:form action="CF_AdvsPayment.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="advanceIndex" value="<%=advanceIndex%>" />

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

<%@ include file="advance_section_helper.jsp" %>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<tr>
    <td >&nbsp;</td>
</tr>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr class="even" align="center">
        <td colspan="3" class="fieldname"><bean:message key="label.advancepayment.payment.section"/> </td>
    </tr>
    <tr class="even" align="center">
        <td width="3%" class="fieldname"><bean:message key="label.contractfinancing.serialnumber"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.date.payment.received"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.amount.received"/></td>
    </tr>
</thead>
<tbody>
    <%
    IPayment[] paymentList = obAdvance.getPaymentList();    
    if(paymentList!=null) {
        for(int i=0;i<paymentList.length;i++) {
            %>
            <tr class='<%=(i%2==0?"even":"odd")%>'>
                <td class="index"><%=i+1%></td>
                <td style="text-align:center"><integro:date object="<%=paymentList[i].getReceiveDate()%>" />&nbsp;</td>
                <td style="text-align:left"><integro:amount param="all" amount="<%=paymentList[i].getReceiveAmount()%>" /></td>
            </tr>
            <%
        }
    }
    if(paymentList==null || paymentList.length==0){
        %>
        <tr class="odd">
            <td colspan="3"><bean:message key="label.global.not.found"/></td>
        </tr>
        <%
    }
    %>
</tbody>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr><td >&nbsp;</td></tr>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr class="even" align="center">
        <td colspan="7" class="fieldname"><bean:message key="label.advancepayment.distribution.payment.received"/></td>
    </tr>
    <tr class="even" align="center">
        <td width="3%" class="fieldname"><bean:message key="label.contractfinancing.serialnumber"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.date.payment.distributed"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.amount.distributed"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.balance.collection.account"/></td>
        <td class="fieldname"><bean:message key="label.advancepayment.balance.credited.current.account"/></td>
        <td class="fieldname"><bean:message key="label.contractfinancing.action"/></td>
    </tr>
</thead>
<tbody>
    <%
    if(paymentList!=null) {
        for(int i=0;i<paymentList.length;i++) {
            %>
            <tr class='<%=(i%2==0?"even":"odd")%>'>
                <td class="index"><%=i+1%></td>
                <td style="text-align:center"><integro:date object="<%=paymentList[i].getDistributeDate()%>" /></td>
                <td style="text-align:left"><integro:amount param="all" amount="<%=paymentList[i].getDistributeAmount()%>" /></td>
                <td style="text-align:left">
                    <%
                    try {
                        %><integro:amount param="all" amount="<%=obAdvance.getBalanceAmount()%>" /><%
                    } catch (AmountConversionException e) {
                        if(e.toString().indexOf("AMT_CONV_EX")>-1){
                            %><bean:message key="error.contractfinancing.no.conversion"/><%
                        }
                    }
                    %>
                </td>
                <td style="text-align:left"><integro:amount param="all" amount="<%=paymentList[i].getCollectionAccountAmount()%>" /></td>
                <td><center><a href="CF_Payment.do?event=view&paymentIndex=<%=i%>&facilityType=<%=request.getParameter("facilityType")%>">View</a></center></td>
            </tr>
            <%
        }
    }
    if(paymentList==null || paymentList.length==0){
        %>
        <tr class="odd">
            <td colspan="7"><bean:message key="label.global.not.found"/></td>
        </tr>
        <%
    }
    %>
</tbody>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <thead>
        <tr>
        <td colspan="2" ><bean:message key="label.advancepayment.collection.account.details"/></td>
        </tr>
    </thead>
    <tbody>
        <tr class="odd">
        <td width="20%" class="fieldname"><bean:message key="label.advancepayment.balance.collection.account"/></td>
            <td width="30%">
                <%
                try {
                    %><integro:amount param="all" amount="<%=obAdvance.getBalanceAmount()%>" /><%
                } catch (AmountConversionException e) {
                    if(e.toString().indexOf("AMT_CONV_EX")>-1){
                        %><bean:message key="error.contractfinancing.no.conversion"/><%
                    }
                }
                %>&nbsp;
            </td>
        </tr>
    </tbody>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
    <thead>
        <tr>
        <td colspan="2" ><bean:message key="label.advancepayment.outstanding.amount"/></td>
        </tr>
    </thead>
    <tbody>
        <tr class="odd">
        <td width="20%" class="fieldname"><bean:message key="label.advancepayment.amount.outstanding"/></td>
            <td width="30%">
                <%
                try {
                    %><integro:amount param="all" amount="<%=obAdvance.getOutstandingAmount()%>" /><%
                } catch (AmountConversionException e) {
                    if(e.toString().indexOf("AMT_CONV_EX")>-1){
                        %><bean:message key="error.contractfinancing.no.conversion"/><%
                    }
                }
                %>&nbsp;
            </td>
        </tr>
    </tbody>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr><td >&nbsp;</td></tr>
</table>

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr >
        <td colspan="2" ><bean:message key="label.advancepayment.unpaid.os"/></td>
    </tr>
</thead>
<tbody>
    <tr class="odd">
        <td width="20%" class="fieldname"><bean:message key="label.advancepayment.unpaid.os"/></td>
        <td width="30%">
           <%
            try {
                %><integro:amount param="all" amount="<%=obAdvance.getOperativeLimitZeroWhenFullPayment()%>" /><%
            }
            catch (AmountConversionException e) {
                if(e.toString().indexOf("AMT_CONV_EX")>-1){
                    %><bean:message key="error.contractfinancing.no.conversion"/><%
                }
            }
            %>&nbsp;
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
    if(event.equals("view")){
        %><a href="javascript:submitPage('list_summary')"><img src="img/return1.gif" border="0" /></a><%
    }
    else{
        %>
        <a href="javascript:submitPage('delete')"><img src="img/delete1.gif" name="Image3" width="75" height="22"  border="0" id="Image3" /></a>
        <a href="javascript:submitPage('list_summary')"><img src="img/cancel1.gif" width="70" height="20" border="0"></a>
        <%
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
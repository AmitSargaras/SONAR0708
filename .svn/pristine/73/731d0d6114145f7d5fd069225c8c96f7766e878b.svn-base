<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.OBAdvance" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.IPayment" %>
<%@ page import="com.integrosys.cms.app.commodity.common.AmountConversionException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.integrosys.cms.app.contractfinancing.bus.OBPayment" %>
<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

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

function goNextPage(nextPage){
    document.forms[0].next_page.value = nextPage;
    document.forms[0].event.value = "maker_navigate_tab";
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
    OBAdvance obAdvance = (OBAdvance)request.getAttribute("obAdvance");
    OBAdvance obActualAdvance = (OBAdvance)request.getAttribute("obActualAdvance");
    OBAdvance obAdvanceDetail = obAdvance;
    if(obAdvance.getAdvanceID()== ICMSConstant.LONG_INVALID_VALUE){
        obAdvanceDetail = obActualAdvance;  //use actual, when stage was deleted
    }

    IPayment[] paymentList = obAdvance.getPaymentList();
    IPayment[] paymentActualList = obActualAdvance.getPaymentList();
%>

<html:form action="CF_AdvsPayment.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>

<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="70%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td width="81%" >
            <h3><bean:message key="label.advancepayment.view"/></h3>
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
        if (paymentActualList != null || paymentList != null) {
            List compResult = CompareOBUtil.compOBArray(paymentList, paymentActualList);
            ArrayList list = new ArrayList(compResult);
            pageContext.setAttribute("paymentList", list);
        }
        int i = 0;
    %>
    <logic:present name="paymentList">
        <logic:iterate id="compResult" name="paymentList" type="com.integrosys.base.techinfra.diff.CompareResult">
            <%
                OBPayment stagingParameter = (OBPayment) compResult.getObj();
                i++;
            %>
            <tr class='<%=(i%2==0?"even":"odd")%>'>
                <td class='<bean:write name="compResult" property="key" />'><%=i%>
                </td>
                <td style="text-align:center"><integro:date object="<%=stagingParameter.getReceiveDate()%>"/>&nbsp;</td>
                <td style="text-align:left"><integro:amount param="all"
                                                            amount="<%=stagingParameter.getReceiveAmount()%>"/></td>
            </tr>
        </logic:iterate>
    </logic:present>
    <%
    if(i==0){
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
        i = 0;
    %>
    <logic:present name="paymentList">
        <logic:iterate id="compResult" name="paymentList" type="com.integrosys.base.techinfra.diff.CompareResult">
            <%
                OBPayment stagingParameter = (OBPayment) compResult.getObj();
                i++;
            %>
            <tr class='<%=(i%2==0?"even":"odd")%>'>
                <td class='<bean:write name="compResult" property="key" />'><%=i%>
                </td>
                <td style="text-align:center"><integro:date object="<%=stagingParameter.getDistributeDate()%>"/></td>
                <td style="text-align:left"><integro:amount param="all" amount="<%=stagingParameter.getDistributeAmount()%>"/></td>
                <td style="text-align:left"><integro:amount param="all" amount="<%=stagingParameter.getCollectionAccountAmount()%>"/></td>
                <td style="text-align:left"><integro:amount param="all" amount="<%=stagingParameter.getCollectionAccountAmount()%>"/></td>
                <td><center><a href="CF_Payment.do?event=checker_view&&commonRef=<%=stagingParameter.getCommonRef()%>&facilityType=<%=request.getParameter("facilityType")%>">View</a></center></td>
            </tr>
        </logic:iterate>
    </logic:present>
    <%
    if(i==0){
        %>
        <tr class="odd">
            <td colspan="6"><bean:message key="label.global.not.found"/></td>
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
        <tr>
        <td colspan="2" ><bean:message key="label.advancepayment.collection.account.details"/></td>
        </tr>
    </thead>
    <tbody>
        <tr class="odd">
            <%
            try {
                stagingAmt = (obAdvance == null) ? null : obAdvance.getBalanceAmount();
                actualAmt = (obActualAdvance == null) ? null : obActualAdvance.getBalanceAmount();
                %>
                <td width="20%" class="<%=UIUtil.isAmountUnChanged(stagingAmt,actualAmt,true)?"fieldname":"fieldnamediff"%>">
                    <bean:message key="label.advancepayment.balance.collection.account"/></td>
                <td width="30%">
                    <integro:amount param="all" amount="<%=obAdvanceDetail.getBalanceAmount()%>"/>&nbsp;
                </td>
                <%
            } catch (AmountConversionException e) {
                if (e.toString().indexOf("AMT_CONV_EX") > -1) {
                    %>
                    <td width="20%" class="fieldname">
                        <bean:message key="label.advancepayment.balance.collection.account"/></td>
                    <td width="30%">
                        <bean:message key="error.contractfinancing.no.conversion"/>
                    </td>
                    <%
                }
            }
            %>
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
            <%
            try {
                stagingAmt = (obAdvance == null) ? null : obAdvance.getOutstandingAmount();
                actualAmt = (obActualAdvance == null) ? null : obActualAdvance.getOutstandingAmount();
                %>
                <td width="20%" class="<%=UIUtil.isAmountUnChanged(stagingAmt,actualAmt,true)?"fieldname":"fieldnamediff"%>">
                    <bean:message key="label.advancepayment.amount.outstanding"/></td>
                <td width="30%">
                    <integro:amount param="all" amount="<%=obAdvanceDetail.getOutstandingAmount()%>"/>&nbsp;
                </td>
                <%
            } catch (AmountConversionException e) {
                if (e.toString().indexOf("AMT_CONV_EX") > -1) {
                    %>
                    <td width="20%" class="fieldname">
                        <bean:message key="label.advancepayment.amount.outstanding"/></td>
                    <td width="30%">
                        <bean:message key="error.contractfinancing.no.conversion"/>
                    </td>
                    <%
                }
            }
            %>
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
            <%
            try {
                stagingAmt = (obAdvance == null) ? null : obAdvance.getOperativeLimitZeroWhenFullPayment();
                actualAmt = (obActualAdvance == null) ? null : obActualAdvance.getOperativeLimitZeroWhenFullPayment();
                %>
                <td width="20%" class="<%=UIUtil.isAmountUnChanged(stagingAmt,actualAmt,true)?"fieldname":"fieldnamediff"%>">
                    <bean:message key="label.advancepayment.unpaid.os"/></td>
                <td width="30%">
                    <integro:amount param="all" amount="<%=obAdvanceDetail.getOperativeLimitZeroWhenFullPayment()%>"/>&nbsp;
                </td>
                <%
            } catch (AmountConversionException e) {
                if (e.toString().indexOf("AMT_CONV_EX") > -1) {
                    %>
                    <td width="20%" class="fieldname">
                        <bean:message key="label.advancepayment.unpaid.os"/></td>
                    <td width="30%">
                        <bean:message key="error.contractfinancing.no.conversion"/>
                    </td>
                    <%
                }
            }
            %>
        </tr>
    </tbody>
</table>

<table border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
    <td width="75">&nbsp;</td>
</tr>
<tr>
    <td>
        <a href="javascript:goNextPage('advspayment')"><img src="img/return1.gif" border="0" /></a><a href="javascript:history.go(-1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','img/return2.gif',1)"></a>
    </td>
</tr>
</table>

<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd -->
</html>
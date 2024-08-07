<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.contractfinancing.bus.OBAdvance"%>
<%@ page import="com.integrosys.cms.ui.contractfinancing.advspayment.SG_PaymentForm" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
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
    String facilityType = request.getParameter("facilityType");

    SG_PaymentForm aForm = (SG_PaymentForm) request.getAttribute("CF_SG_PaymentForm");

    OBAdvance obAdvance = (OBAdvance) request.getAttribute("obAdvance");
    if (obAdvance == null) {
        obAdvance = new OBAdvance();
    }
%>

<html:form action="CF_SG_Payment.do">
<input type="hidden" name="event"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="paymentIndex" value="<%=request.getParameter("paymentIndex")%>" />   <%--for edit--%>
<%
    //pass this facilityType to mapper
    if (facilityType!=null){
        %><input type="hidden" name="facilityType" value="<%=facilityType%>"/><%
    }
%>
<input type="hidden" name="moa" value="<%=request.getParameter("moa")%>"/>
<body>
<!-- InstanceBeginEditable name="Content" -->

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td align="right" colspan="2"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/></td>
    </tr>
    <tr>
        <td width="81%" >
            <h3>
            <%
            if(event.equals("maker_prepare_create")||event.equals("create")){
                %><bean:message key="label.advancepayment.add"/><%
            }
            else{
                %><bean:message key="label.advancepayment.edit"/><%
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
        <td width="20%" class="fieldname"><bean:message key="label.advancepayment.date.payment.received"/> <font color="#0000FF">*</font></td>
        <td width="30%">
            <html:text property="receiveDate" readonly="true" />
            <img id="sel44" onMouseOver="MM_swapImage('receiveDate','','img/calendarb.gif',1)" onClick="return showCalendar('receiveDate', 'dd/mm/y');" src  ="img/calendara.gif" border=0 name=sel44 >
            <html:errors property="receiveDate"/>
        </td>
    </tr>
    <tr class="even">
        <td class="fieldname"><bean:message key="label.advancepayment.amount.received"/> <font color="#0000FF">*</font></td>
        <td>
            <html:select property="receiveCurrency">
                <html:option value="">Please Select</html:option>
                <html:options name="currencyLabels" labelName="currencyLabels"/>
            </html:select>
            <html:errors property="receiveCurrency"/>

            <html:text property="receiveAmount" size="20" maxlength="15" />
            <html:errors property="receiveAmount"/>
        </td>
    </tr>
    <tr class="odd">
        <td class="fieldname"><bean:message key="label.advancepayment.payment.received.from"/></td>
        <td>
            <html:text property="receiveFrom" size="40" />
            <html:errors property="receiveFrom"/>
        </td>
    </tr>
</tbody>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<thead>
    <tr>
        <td colspan="3"><bean:message key="label.advancepayment.retention.section"/></td>
    </tr>
</thead>
<tbody>
<tr class="odd">
    <td class="fieldname"><bean:message key="label.advancepayment.date.retention.distributed"/> <font color="#0000FF">*</font></td>
    <td colspan="2">
        <html:text property="distributeDate" readonly="true"/>
        <img src="img/calendara.gif" name="Image7" border="0" id="Image2"
             onClick="return showCalendar('distributeDate', 'dd/mm/y');"
             onMouseOver="MM_swapImage('Image7','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()"/>
        <html:errors property="distributeDate"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.advancepayment.retention.amount"/> <font color="#0000FF">*</font></td>
    <td colspan="2">
        <html:select property="distributeCurrency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="distributeCurrency"/>
        <html:text property="distributeAmount" size="20" maxlength="15" />
        <html:errors property="distributeAmount"/>
    </td>
</tr>
<tr class="odd">
    <td rowspan="9" class="fieldname"><bean:message key="label.advancepayment.retained.to"/></td>
    <td>
        <html:checkbox property="fdrInd"/>
        <html:errors property="fdrInd"/>FDR
    </td>
    <td>
        <html:select property="fdrCurrency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="fdrCurrency"/>
        <html:text property="fdrAmount"/>
        <html:errors property="fdrAmount"/>
    </td>
</tr>
<tr class="even">
    <td>
        <html:checkbox property="repoInd"/>
        <html:errors property="repoInd"/>
        REPO
    </td>
    <td>
        <html:select property="repoCurrency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="repoCurrency"/>
        <html:text property="repoAmount"/>
        <html:errors property="repoAmount"/>
    </td>
</tr>
<tr class="odd">
    <td>
        <html:checkbox property="apgInd"/>
        <html:errors property="apgInd"/>
        APG
    </td>
    <td>
        <html:select property="apgCurrency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="apgCurrency"/>
        <html:text property="apgAmount"/>
        <html:errors property="apgAmount"/>
    </td>
</tr>
<tr class="even">
    <td>
        <html:checkbox property="tl1Ind"/>
        <html:errors property="tl1Ind"/>
        TL1
    </td>
    <td>
        <html:select property="tl1Currency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="tl1Currency"/>
        <html:text property="tl1Amount"/>
        <html:errors property="tl1Amount"/>
    </td>
</tr>
<tr class="odd">
    <td>
        <html:checkbox property="tl2Ind"/>
        <html:errors property="tl2Ind"/>
        TL2
    </td>
    <td>
        <html:select property="tl2Currency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="tl2Amount"/>
        <html:text property="tl2Amount"/>
        <html:errors property="tl2Amount"/>
    </td>
</tr>
<tr class="even">
    <td>
        <html:checkbox property="tl3Ind"/>
        <html:errors property="tl3Ind"/>
        TL3
    </td>
    <td>
        <html:select property="tl3Currency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="tl3Currency"/>
        <html:text property="tl3Amount"/>
        <html:errors property="tl3Amount"/>
    </td>
</tr>
<tr class="odd">
    <td>
        <html:checkbox property="collectionAccInd"/>
        <html:errors property="collectionAccInd"/>
        Current Account
    </td>
    <td>
        <html:select property="collectionAccCurrency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="collectionAccCurrency"/>
        <html:text property="collectionAccAmount"/>
        <html:errors property="collectionAccAmount"/>
    </td>
</tr>
<tr class="even">
    <td>
        <html:checkbox property="bcInd"/>
        <html:errors property="bcInd"/>
        Bankers Cheque
    </td>
    <td>
        <html:select property="bcCurrency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="bcCurrency"/>
        <html:text property="bcAmount"/>
        <html:errors property="bcAmount"/>
    </td>
</tr>
<tr class="odd">
    <td>
        <html:checkbox property="othInd"/>
        <html:errors property="othInd"/>
        Others
    </td>
    <td>
        <html:select property="othCurrency">
            <html:option value="">Please Select</html:option>
            <html:options name="currencyLabels" labelName="currencyLabels"/>
        </html:select>
        <html:errors property="othCurrency"/>
        <html:text property="othAmount"/>
        <html:errors property="othAmount"/>
    </td>
</tr>
<tr class="even">
    <td class="fieldname"><bean:message key="label.advancepayment.remarks"/></td>
    <td colspan="3">
        <html:textarea property="remarks" rows="5" style="width:100% "/>
        <html:errors property="remarks"/>
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
    if(event.equals("maker_prepare_create")||event.equals("create")){
        %><a href="javascript:submitPage('create')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a>
        <a href="javascript:gotoPage('CF_SG_AdvsPayment.do','maker_prepare_update')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a><%
    }
    else{
        %><a href="javascript:submitPage('update')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a>
        <a href="javascript:gotoPage('CF_SG_AdvsPayment.do','maker_prepare_update')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a><%
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
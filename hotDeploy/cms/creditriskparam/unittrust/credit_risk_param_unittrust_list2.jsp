<%@ page import="com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils,
                 com.integrosys.cms.app.creditriskparam.trx.ICreditRiskParamGroupTrxValue,
                 com.integrosys.cms.app.creditriskparam.bus.ICreditRiskParamGroup,
                 com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustForm,
                 com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction,
                 com.integrosys.cms.app.creditriskparam.bus.OBCreditRiskParam,
                 com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustMapper"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header:$
*
* credit_risk_param_unittrust_list2.jsp
*
* Describe this JSP.
* Purpose:
* Description:
*
* @author $Author$<br>
* @version $Revision$
* Date: $Date$
* Tag: $Name$
*/
%>

<%
/*
    Enumeration enum = session.getAttributeNames();
    while (enum.hasMoreElements()) {
        DefaultLogger.debug(this, "in session: " + enum.nextElement());
    }
*/
    // Get the unit trust feed group trx value from session.
    ICreditRiskParamGroupTrxValue paramGroupTrxValue = (ICreditRiskParamGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.creditRiskParamGroupTrxValue");

    String lastActionBy = paramGroupTrxValue.getUserInfo();
    String lastRemarksMade = paramGroupTrxValue.getRemarks();
    if (lastRemarksMade == null) {
        lastRemarksMade = "";
    }

    String status = paramGroupTrxValue.getStatus();
    boolean forApproveAndReject = status.equals(ICMSConstant.STATE_PENDING_UPDATE);

    forApproveAndReject = true;
    //boolean forClose = status.equals(ICMSConstant.STATE_REJECTED);

    // Get the staging feed group.
    ICreditRiskParamGroup stagingFeedGroup = paramGroupTrxValue.getStagingCreditRiskParamGroup();
    // Get the actual feed group.
    ICreditRiskParamGroup actualFeedGroup = paramGroupTrxValue.getCreditRiskParamGroup();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    CreditRiskParamUnitTrustForm actionForm = (CreditRiskParamUnitTrustForm)pageContext.findAttribute("CreditRiskParamUnitTrustForm");

    if (actionForm == null) {
        DefaultLogger.debug(this, "actionForm is null.");
    }

    String event = actionForm.getEvent();
    if (event.equals(CreditRiskParamUnitTrustAction.EVENT_READ_CHECKER_APPROVE_REJECT)) {
        event = CreditRiskParamUnitTrustAction.EVENT_LIST_CHECKER_APPROVE_REJECT;
//    } else if (event.equals(CreditRiskParamUnitTrustAction.EVENT_READ_MAKER_CLOSE)) {
//        event = CreditRiskParamUnitTrustAction.EVENT_LIST_MAKER_CLOSE;
    }

    // Get the record markers.
    //int offset = Integer.parseInt(actionForm.getOffset());
    //int length = Integer.parseInt(actionForm.getLength());
    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.length")).intValue();
    //int targetOffset = Integer.parseInt(actionForm.getTargetOffset());

    String cssClass = "odd";

    CurrencyList currencyList = CurrencyList.getInstance();
    HashMap currenciesMap = currencyList.getCurrencyList();

    List compareResultsList = (List)session.getAttribute("com.integrosys.cms.ui.creditriskparam.unittrust.CreditRiskParamUnitTrustAction.compareResultsList");
    pageContext.setAttribute("compareResultsList", compareResultsList);

    int totalEntries = compareResultsList.size();

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

    String countryLabel = (String)request.getParameter("countrylabel");   // get country name from dropdown list
    DefaultLogger.debug(this, "countryLabel : " + countryLabel);

    String countryName = countryLabel;

    if (countryName == null || ("").equals(countryName))
    {
        String countryCode = "";
        OBCreditRiskParam[] obCreditRiskParams = stagingFeedGroup.getFeedEntries();
        while (obCreditRiskParams != null && obCreditRiskParams.length > 0)
        {
            countryCode = obCreditRiskParams[0].getCountryCode();
            break;
        }

        CountryList countryList = CountryList.getInstance();
        countryName = countryList.getCountryName(countryCode);
    }

%>



<html><!-- InstanceBegin template="/Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="Cssstyle" -->


<!-- InstanceEndEditable --> <!-- InstanceParam name="showWinTitle" type="boolean" value="false" -->
<!-- InstanceParam name="showWinStatus" type="boolean" value="false" --> <!-- InstanceParam name="showContentMenuBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentTitleBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentToolBar" type="boolean" value="false" -->
<!-- InstanceParam name="showContentNavigatorBar" type="boolean" value="false" -->
<!-- InstanceParam name="contentWidth" type="text" value="100%" --> <!-- InstanceParam name="contentHeight" type="text" value="100%" -->
<!-- InstanceParam name="contentTitle" type="text" value="Untitled Document" -->
<!-- InstanceParam name="showGeneralPurposeBar" type="boolean" value="true" -->
<!-- InstanceBeginEditable name="head" -->
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

function MM_findObj(n, d) { //v4.01
var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function gotopage(aLocation) {
window.location = aLocation;
}

function approve() {
    document.forms[0].event.value = "<%=CreditRiskParamUnitTrustAction.EVENT_APPROVE%>"
    document.forms[0].submit();
}
function reject() {
    document.forms[0].event.value = "<%=CreditRiskParamUnitTrustAction.EVENT_REJECT%>"
    document.forms[0].submit();
}

function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=event%>"
    document.forms[0].targetOffset.value = targetOffset;

    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%--<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>--%>
<!-- InstanceBeginEditable name="menuScript" --><!-- InstanceEndEditable -->


<html:form action="CreditRiskParamUnitTrust.do">
<input type="hidden" name="event"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
<!--DWLayoutTable-->


<tr id="envCanvas">

<td width="100%" valign="top" id="envCanvasContent">
<table id="window" border="0" cellpadding="0" cellspacing="0">


<tr id="winCanvas">
<td>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" id="contentWindow">
<!--DWLayoutTable-->


<tr >
<td colspan="3" valign="top" style="height:100%;width:100%;">
<div id="contentCanvas" style="height:100%;width:100%;"> <!-- InstanceBeginEditable name="contentCanvas" -->

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
  <% if (countryName == null || ("").equals(countryName)) { %>
    <td height="34"> <h3><bean:message key="label.process.unit.trust"/></h3></td>
  <% } else { %>
    <td height="34"> <h3><bean:message key="label.process.unit.trust"/> - <%=countryName%></h3></td>
  <% } %>
</tr>
<tr>
<td colspan="2"><hr /> </td>
</tr>
</thead>
<tbody>
<tr>
<td colspan="2">
<table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
<tr>
    <td width="3%" rowspan="2"><bean:message key="label.global.sn"/></td>
    <td width="26%" rowspan="2"><bean:message key="label.fund.name"/></td>
    <td width="8%" rowspan="2"><bean:message key="label.isin"/></td>
    <td width="8%" rowspan="2"><bean:message key="label.ric"/></td>
    <td width="6%" rowspan="2"><bean:message key="label.ccy"/></td>
    <td width="14%" rowspan="2"><bean:message key="label.moa"/></td>
    <td width="14%" rowspan="2"><bean:message key="label.maximum.collateral.cap"/></td>
    <td width="11%" rowspan="2">
        <p><bean:message key="label.acceptable.or.unacceptable"/></p>
    </td>
    <td width="10%" rowspan="2">
        <p><bean:message key="label.suspend.for.internal.use"/></p>
    </td>
</tr>

</thead> <tbody>

<%
    // Check that offset + length cannot exceed the total.
    int iterateLength = 0;
    if (offset + length > totalEntries) {
        iterateLength = totalEntries - offset;
    } else {
        iterateLength = length;
    }
%>
<%--<logic:iterate id="feedEntry" name="stagingFeedGroup" property="feedEntries"--%>
<%--        offset="<%=String.valueOf(offset)%>"--%>
<%--        length="<%=String.valueOf(iterateLength)%>" indexId="counter"--%>
<%--        type="com.integrosys.cms.app.feed.bus.unittrust.IUnitTrustFeedEntry">--%>
<logic:iterate id="result" name="compareResultsList"
        indexId="counter"
        offset="<%=String.valueOf(offset)%>"
        length="<%=String.valueOf(iterateLength)%>"
        type="com.integrosys.base.techinfra.diff.CompareResult">
<%
    OBCreditRiskParam obParam = (OBCreditRiskParam)result.getObj();

    String originalMoa = null;
    String originalMaxCap = null;
    String originalIsIntSuspended = null;


    if (result.isAdded()) {
        originalMoa = "";
        originalMaxCap = "";
    } else if (result.isModified()) {
        // Get the original value from the original obj.
        originalMoa = String.valueOf(((OBCreditRiskParam)result.getOriginal()).getMarginOfAdvance());
        originalMaxCap = String.valueOf(((OBCreditRiskParam)result.getOriginal()).getMaximumCap());
        originalIsIntSuspended = ((OBCreditRiskParam)result.getOriginal()).getIsIntSuspend();
    } else if (result.isUnmodified()) {
        // Original value still the same.
        originalMoa = String.valueOf(obParam.getMarginOfAdvance());
        originalMaxCap = String.valueOf(obParam.getMaximumCap());
        originalIsIntSuspended = obParam.getIsIntSuspend();
    } else if (result.isDeleted()) {
        // The obj is the deleted entry itself, so original should come from that.
        originalMoa = String.valueOf(obParam.getMarginOfAdvance());
        originalMaxCap = String.valueOf(obParam.getMaximumCap());
        originalIsIntSuspended = obParam.getIsIntSuspend();
    }

    originalMoa = FeedUtils.padFractionDigits(originalMoa, 1, 2);
    originalMaxCap = FeedUtils.padFractionDigits(originalMaxCap, 1, 2);

    String updatedMoa = FeedUtils.padFractionDigits(String.valueOf(obParam.getMarginOfAdvance()), 1, 2);
    String updatedMaxCap = FeedUtils.padFractionDigits(String.valueOf(obParam.getMaximumCap()), 1, 2);
    String updatedIsIntSuspended = originalIsIntSuspended;

    if (result.isDeleted()) {
        updatedMoa = "";
        updatedMaxCap = "";
        updatedIsIntSuspended = "";
    }

    DefaultLogger.debug(this, "counter is now " + counter.intValue());

    DefaultLogger.debug(this, "ref id of getObj = " + obParam.getCreditRiskParamEntryRef());

    DefaultLogger.debug(this, "result is added ? " + result.isAdded());
    DefaultLogger.debug(this, "result is deleted ? " + result.isDeleted());
    DefaultLogger.debug(this, "result is modified ? " + result.isModified());
    DefaultLogger.debug(this, "result is unmodified ? " + result.isUnmodified());


%>
<tr class="<%=cssClass%>">
<td class="<%=result.getKey()%>" valign="top"><%=counter.intValue() + 1%></td>
<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=obParam.getName()%>"/>&nbsp;</td>
<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=obParam.getIsinCode()%>"/>&nbsp;</td>
<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=obParam.getRic()%>"/>&nbsp;</td>
<td style="{text-align: center}">&nbsp;<integro:empty-if-null value="<%=obParam.getCurrencyCode()%>"/>&nbsp;</td>
<td style="{text-align: center}" class="amount"><integro:empty-if-null value="<%=updatedMoa%>"/>&nbsp;%</td>
<td style="{text-align: center}" class="amount"><integro:empty-if-null value="<%=updatedMaxCap%>"/>&nbsp;%</td>
<td style="{text-align: center}">
 <%  if (obParam.getIsIntSuspend() != null && (ICMSConstant.TRUE_VALUE).equals(obParam.getIsIntSuspend())) { %>
        <bean:message key="label.unacceptable"/>
 <%  } else { %>
        <bean:message key="label.acceptable"/>
 <%  }  %>
</td>
<td style="{text-align: center}">&nbsp;<integro:yesno-display value="<%=obParam.getIsIntSuspend()%>"/>&nbsp;</td>

</tr>


<%
    if (cssClass.equals("odd")) {
        cssClass = "even";
    } else {
        cssClass = "odd";
    }
%>
</logic:iterate>
</tbody>
</table>
</td>
<tr>
<td colspan="2">&nbsp;</td>
</tr>




</tr>
<tr>
<td>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
<tbody>
<tr>
<td class="fieldname"><bean:message key="label.remarks"/></td>
<td class="odd"><html:textarea property="remarks" rows="4" style="width:90%"/>
<html:errors property="remarks"/></td>
</tr>
<tr>
<td class="fieldname"><bean:message key="label.last.action.by"/></td>
<td class="even">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
</tr>
<tr class="odd">
<td class="fieldname"><bean:message key="label.last.remarks.made"/></td>
<td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>"/></td>
</tr>
</tbody>
</table></td>

</tr>

</tbody>
</table>

<%if (forApproveAndReject) {
%>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
<tr>
<td><a href="#" onclick="approve()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
<td><a href="#" onclick="reject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70" height="20" border="0" id="Image9" /></a></td>
<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10" /></a></td>
</tr>
<tr>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
</table>
    <%
}%>



<!-- InstanceEndEditable --> </div>
</td>
</tr>

<tr>
<td>
<table id="generalPurposeBar" width="100%" style="margin-left:10px" border="0" cellspacing="0"
cellpadding="5" align="center">

<tr>
<td valign="middle">
<integro:pageindex pageIndex="<%=new PageIndex(offset, length, compareResultsList.size())%>"
 url="CreditRiskParamUnitTrust.do" submitFlag="true"/>
</td>
</tr>
</table>


</td>
</tr>

</table>

</td>
</tr>


</table>
</td>
</tr>


</table>


</html:form>

</body>
<!-- InstanceEnd --></html>

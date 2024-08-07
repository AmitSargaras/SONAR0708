<%@ page import="com.integrosys.cms.app.feed.bus.forex.IForexFeedGroup,
                 com.integrosys.cms.app.feed.trx.forex.IForexFeedGroupTrxValue,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.cms.ui.feed.exchangerate.list.ExchangeRateListForm,
                 com.integrosys.cms.ui.feed.exchangerate.list.ExchangeRateListAction,
                 com.integrosys.cms.ui.feed.exchangerate.item.ExchangeRateItemAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.forex.IForexFeedEntry,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    // Get the forex feed group trx value from session.
    IForexFeedGroupTrxValue feedGroupTrxValue = (IForexFeedGroupTrxValue) session.getAttribute("com.integrosys.cms.ui.feed.exchangerate.ForexAction.forexFeedGroupTrxValue");

    String lastActionBy = feedGroupTrxValue.getUserInfo();
    String lastRemarksMade = feedGroupTrxValue.getRemarks();
    if (lastRemarksMade == null) {
        lastRemarksMade = "";
    }

    String status = feedGroupTrxValue.getStatus();
    boolean forApproveAndReject = status.equals(ICMSConstant.STATE_PENDING_UPDATE);
    //boolean forClose = status.equals(ICMSConstant.STATE_REJECTED);

    // Get the staging feed group.
    IForexFeedGroup stagingFeedGroup = feedGroupTrxValue.getStagingForexFeedGroup();
    // Get the actual feed group.
    IForexFeedGroup actualFeedGroup = feedGroupTrxValue.getForexFeedGroup();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);


    ExchangeRateListForm actionForm = (ExchangeRateListForm) pageContext.findAttribute("exchangeRateListForm");

    if (actionForm == null) {
        DefaultLogger.debug(this, "actionForm is null.");
    }

    String event = actionForm.getEvent();
    if (event.equals(ExchangeRateListAction.EVENT_READ_CHECKER_APPROVE_REJECT)) {
        event = ExchangeRateListAction.EVENT_LIST_CHECKER_APPROVE_REJECT;
    } else if (event.equals(ExchangeRateListAction.EVENT_READ_MAKER_CLOSE)) {
        event = ExchangeRateListAction.EVENT_LIST_MAKER_CLOSE;
    }

    // Get the record markers.
    //int offset = Integer.parseInt(actionForm.getOffset());
    //int length = Integer.parseInt(actionForm.getLength());
    int offset = ((Integer) session.getAttribute(
            "com.integrosys.cms.ui.feed.exchangerate.ForexAction.offset")).intValue();
    int length = ((Integer) session.getAttribute(
            "com.integrosys.cms.ui.feed.exchangerate.ForexAction.length")).intValue();
    //int targetOffset = Integer.parseInt(actionForm.getTargetOffset());

    String cssClass = "odd";

    CurrencyList currencyList = CurrencyList.getInstance();

/*
    DefaultLogger.debug(this, "actual:");
    for (int r = 0; r < actualFeedGroup.getFeedEntries().length; r++) {
        DefaultLogger.debug(this, "buy rate " + r + " = " + String.valueOf(actualFeedGroup.getFeedEntries()[r].getBuyRate()));
        DefaultLogger.debug(this, "ref " + r + " = " + String.valueOf(actualFeedGroup.getFeedEntries()[r].getForexFeedEntryRef()));
    }
    DefaultLogger.debug(this, "staging:");
    for (int s = 0; s < stagingFeedGroup.getFeedEntries().length; s++) {
        DefaultLogger.debug(this, "buy rate " + s + " = " + String.valueOf(stagingFeedGroup.getFeedEntries()[s].getBuyRate()));
        DefaultLogger.debug(this, "ref " + s + " = " + String.valueOf(stagingFeedGroup.getFeedEntries()[s].getForexFeedEntryRef()));
    }

    DefaultLogger.debug(this, "control reached here.");
*/
    List compareResultsList = (List) session.getAttribute("com.integrosys.cms.ui.feed.exchangerate.ForexAction.compareResultsList");
    pageContext.setAttribute("compareResultsList", compareResultsList);

    int totalEntries = compareResultsList.size();

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);


%>


<html><!-- InstanceBegin template="/Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="Cssstyle" -->
 <!--<link href="css/smartlender.css" rel="stylesheet" type="text/css"/>-->

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
document.forms[0].event.value = "<%=ExchangeRateListAction.EVENT_APPROVE%>"
document.forms[0].submit();
}
function reject() {
document.forms[0].event.value = "<%=ExchangeRateListAction.EVENT_REJECT%>"
document.forms[0].submit();
}
function closeForm() {
document.forms[0].event.value = "<%=ExchangeRateListAction.EVENT_CLOSE%>"
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

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>


<html:form action="feed_exchange_rate_list.do">
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


<tr>
<td colspan="3" valign="top" style="height:100%;width:100%;">
<div id="contentCanvas" style="height:100%;width:100%;border:0"> <!-- InstanceBeginEditable name="contentCanvas" -->

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td height="34"><h3><bean:message key="label.process.exchange.rate"/></h3></td>
    </tr>
    <tr>
        <td colspan="2"><hr/></td>
    </tr>
</thead>
<tbody>
<tr>
    <td colspan="2">
        <table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
            <thead>
                <tr>
                    <td width="5%"><bean:message key="label.global.sno"/></td>
                    <td width="9%"><bean:message key="label.currency"/></td>
                    <td width="20%"><bean:message key="label.curr.desc"/></td>
                    <td width="13%"><bean:message key="label.close.curr.rate"/></td>
                    <td width="15%"><bean:message key="label.update.exchange.rate"/>&nbsp;<font color="#00AAFF">* </font></td>
                    <td width="15%"><bean:message key="label.unit.curr.against"/></td>
                    <td><bean:message key="label.predeal.last.updated.date"/></td>
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
            <logic:iterate id="result" name="compareResultsList"
                           indexId="counter"
                           offset="<%=String.valueOf(offset)%>"
                           length="<%=String.valueOf(iterateLength)%>"
                           type="com.integrosys.base.techinfra.diff.CompareResult">
                <%
                    IForexFeedEntry feedEntry = (IForexFeedEntry) result.getObj();

                    String originalUnitPrice = null;

                    if (result.isAdded()) {
                        originalUnitPrice = "";
                    } else if (result.isModified()) {
                        // Get the original value from the original obj.
                        originalUnitPrice = String.valueOf(((IForexFeedEntry) result.getOriginal()).getBuyRate());
                    } else if (result.isUnmodified()) {
                        // Original value still the same.
                        originalUnitPrice = String.valueOf(feedEntry.getBuyRate());
                    } else if (result.isDeleted()) {
                        // The obj is the deleted entry itself, so original should come from that.
                        originalUnitPrice = String.valueOf(feedEntry.getBuyRate());
                    }

                    originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);

                    String updatedPrice = FeedUtils.padFractionDigits(String.valueOf(feedEntry.getBuyRate()), 1, 2);

                    if (result.isDeleted()) {
                        updatedPrice = "";
                    }

                    DefaultLogger.debug(this, "counter is now " + counter.intValue());

                    DefaultLogger.debug(this, "ref id of getObj = " + feedEntry.getForexFeedEntryRef());
                %>
                <tr class="<%=cssClass%>">
                    <td class="<%=result.getKey()%>" valign="top"><%=counter.intValue() + 1%></td>
                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getBuyCurrency()%>"/></td>
                    <td>&nbsp;<integro:empty-if-null value="<%=currencyList.getCountryName(feedEntry.getBuyCurrency())%>"/></td>
                    <td class="amount">&nbsp;<integro:empty-if-null value="<%=originalUnitPrice%>"/></td>
                    <td class="amount">&nbsp;<integro:empty-if-null value="<%=updatedPrice%>"/></td>
                    <td style="text-align:center"><%=CommonUtil.getBaseExchangeCurrency()%> 1.00</td>
                    <td style="text-align:center">&nbsp;<integro:date object="<%=feedEntry.getEffectiveDate()%>"/></td>
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
                    <td class="odd"><html:textarea property="remarks" style="width:90%"/>
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
        </table>
    </td>

</tr>

</tbody>
</table>

<%if (forApproveAndReject) {%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="#" onclick="approve()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)"><img src="img/approve1.gif" name="Image8" width="80"
                                                                                                                                               height="20" border="0" id="Image8"/></a></td>
        <td><a href="#" onclick="reject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)"><img src="img/reject1.gif" name="Image9" width="70"
                                                                                                                                             height="20" border="0" id="Image9"/></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10"/></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
<%}%>

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
                                       url="feed_exchange_rate_list.do" submitFlag="true"/>
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
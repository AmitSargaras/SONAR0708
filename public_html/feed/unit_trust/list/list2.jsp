<%@ page import="com.integrosys.cms.app.feed.bus.unittrust.IUnitTrustFeedGroup,
                 com.integrosys.cms.app.feed.trx.unittrust.IUnitTrustFeedGroupTrxValue,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.cms.ui.feed.unittrust.list.UnitTrustListForm,
                 com.integrosys.cms.ui.feed.unittrust.list.UnitTrustListAction,
                 com.integrosys.cms.ui.feed.unittrust.item.UnitTrustItemAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.unittrust.IUnitTrustFeedEntry,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    /*
        Enumeration enum = session.getAttributeNames();
        while (enum.hasMoreElements()) {
            DefaultLogger.debug(this, "in session: " + enum.nextElement());
        }
    */
    // Get the unit trust feed group trx value from session.
    IUnitTrustFeedGroupTrxValue feedGroupTrxValue = (IUnitTrustFeedGroupTrxValue) session.getAttribute("com.integrosys.cms.ui.feed.unittrust.UnitTrustAction.unitTrustFeedGroupTrxValue");

    String lastActionBy = feedGroupTrxValue.getUserInfo();
    String lastRemarksMade = feedGroupTrxValue.getRemarks();
    if (lastRemarksMade == null) {
        lastRemarksMade = "";
    }

    String status = feedGroupTrxValue.getStatus();
    boolean forApproveAndReject = status.equals(ICMSConstant.STATE_PENDING_UPDATE);
    //boolean forClose = status.equals(ICMSConstant.STATE_REJECTED);

    // Get the staging feed group.
    IUnitTrustFeedGroup stagingFeedGroup = feedGroupTrxValue.getStagingUnitTrustFeedGroup();
    // Get the actual feed group.
    IUnitTrustFeedGroup actualFeedGroup = feedGroupTrxValue.getUnitTrustFeedGroup();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    UnitTrustListForm actionForm = (UnitTrustListForm) pageContext.findAttribute("unitTrustListForm");

    if (actionForm == null) {
        DefaultLogger.debug(this, "actionForm is null.");
    }

    String event = actionForm.getEvent();
    if (event.equals(UnitTrustListAction.EVENT_READ_CHECKER_APPROVE_REJECT)) {
        event = UnitTrustListAction.EVENT_LIST_CHECKER_APPROVE_REJECT;
    } else if (event.equals(UnitTrustListAction.EVENT_READ_MAKER_CLOSE)) {
        event = UnitTrustListAction.EVENT_LIST_MAKER_CLOSE;
    }

    // Get the record markers.
    //int offset = Integer.parseInt(actionForm.getOffset());
    //int length = Integer.parseInt(actionForm.getLength());
    int offset = ((Integer) session.getAttribute(
            "com.integrosys.cms.ui.feed.unittrust.UnitTrustAction.offset")).intValue();
    int length = ((Integer) session.getAttribute(
            "com.integrosys.cms.ui.feed.unittrust.UnitTrustAction.length")).intValue();
    //int targetOffset = Integer.parseInt(actionForm.getTargetOffset());

    String cssClass = "odd";

    CurrencyList currencyList = CurrencyList.getInstance();
    HashMap currenciesMap = currencyList.getCurrencyList();

    List compareResultsList = (List) session.getAttribute("com.integrosys.cms.ui.feed.unittrust.UnitTrustAction.compareResultsList");
    pageContext.setAttribute("compareResultsList", compareResultsList);

    int totalEntries = compareResultsList.size();

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

    CountryList countryList = CountryList.getInstance();
    String countryName = countryList.getCountryName(stagingFeedGroup.getSubType());
  int rowIdx = 0;
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
document.forms[0].event.value = "<%=UnitTrustListAction.EVENT_APPROVE%>"
document.forms[0].submit();
}
function reject() {
document.forms[0].event.value = "<%=UnitTrustListAction.EVENT_REJECT%>"
document.forms[0].submit();
}
function closeForm() {
document.forms[0].event.value = "<%=UnitTrustListAction.EVENT_CLOSE%>"
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


<html:form action="feed_unit_trust_list.do">
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
<div id="contentCanvas" style="height:100%;width:100%;border:0">

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td height="34"><h3>Process Unit Trust - <%=countryName%></h3></td>
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
                <td width="3%" rowspan="2">S/N</td>
                <td width="25%" rowspan="2">Name&nbsp;<font color="#0000FF">* </font></td>
                <!--<td width="6%" rowspan="2">Fund Code&nbsp;<font color="#0000FF">* </font></td>-->
                <td width="6%" rowspan="2">ISIN Code</td>
                <td width="6%" rowspan="2">RIC/Stock Code&nbsp;<font color="#0000FF">* </font></td>
                <td width="6%" rowspan="2">CCY&nbsp;<font color="#0000FF">* </font></td>
                <td width="6%" rowspan="2">Existing Bid/Offer/NAV/Pricing </td>
                <td width="6%" rowspan="2">Update Bid/Offer/NAV/Pricing&nbsp;<font color="#00AAFF">* </font> </td>
                <td width="8%" rowspan="2">Investment Product Code</td>
                <td colspan="2">Fund Manager</td>
                <td width="6%" rowspan="2">Last Updated Date</td>
            </tr>
            <tr>
                <td width="8%">Code</td>
                <td>Name</td>
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
                    IUnitTrustFeedEntry feedEntry = (IUnitTrustFeedEntry) result.getObj();

                    String originalUnitPrice = null;

                    if (result.isAdded()) {
                        originalUnitPrice = "";
                    } else if (result.isModified()) {
                        // Get the original value from the original obj.
                        originalUnitPrice = String.valueOf(((IUnitTrustFeedEntry) result.getOriginal()).getUnitPrice());
                    } else if (result.isUnmodified()) {
                        // Original value still the same.
                        originalUnitPrice = String.valueOf(feedEntry.getUnitPrice());
                    } else if (result.isDeleted()) {
                        // The obj is the deleted entry itself, so original should come from that.
                        originalUnitPrice = String.valueOf(feedEntry.getUnitPrice());
                    }

                    originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);

                    String updatedPrice = FeedUtils.padFractionDigits(String.valueOf(feedEntry.getUnitPrice()), 1, 2);

                    if (result.isDeleted()) {
                        updatedPrice = "";
                    }


                %>
               <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                    <td class="<%=result.getKey()%>" valign="top"><%=counter.intValue() + 1%></td>
                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getName()%>"/></td>
                    <!--<td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getFundCode()%>"/></td>-->
                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getIsinCode()%>"/></td>
                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getRic()%>"/></td>
                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getCurrencyCode()%>"/></td>
                        <%--<td class="amount">&nbsp;<integro:empty-if-null value="<%=actualFeedEntriesArr[counter.intValue()].getUnitPrice()%>"/></td>--%>
                    <td class="amount">&nbsp;<integro:empty-if-null value="<%=originalUnitPrice%>"/></td>
                    <td class="amount">&nbsp;<integro:empty-if-null value="<%=updatedPrice%>"/></td>
                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getProductCode()%>"/></td>
                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getFundManagerCode()%>"/></td>
                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getFundManagerName()%>"/></td>
                    <td style="text-align:center">&nbsp;<integro:date object="<%=feedEntry.getLastUpdatedDate()%>"/></td>
                </tr>
            </logic:iterate>

            <% if (iterateLength == 0) { %>
                 <tr>
                    <td colspan="12" class="odd">
                      <bean:message key="label.global.not.found"/>
                    </td>
                 </tr>
			<%  }%>
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
                    <td class="fieldname">Remarks</td>
                    <td class="odd"><html:textarea property="remarks" rows="4" style="width:90%"/>
                        <html:errors property="remarks"/></td>
                </tr>
                <tr>
                    <td class="fieldname">Last Action By</td>
                    <td class="even">&nbsp;<integro:empty-if-null value="<%=lastActionBy%>"/></td>
                </tr>
                <tr class="odd">
                    <td class="fieldname">Last Remarks Made</td>
                    <td>&nbsp;<integro:wrapper value="<%=lastRemarksMade%>"/></td>
                </tr>
            </tbody>
        </table>
    </td>

</tr>

</tbody>
</table>

<%  if (forApproveAndReject) {  %>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td><a href="#" onclick="approve()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/approve2.gif',1)">
            <img src="img/approve1.gif" alt= "Approve" name="Image8"  border="0" id="Image8"/></a></td>
        <td><a href="#" onclick="reject()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image9','','img/reject2.gif',1)">
            <img src="img/reject1.gif" alt= "Reject" name="Image9" border="0" id="Image9"/></a></td>
        <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" alt= "cancel" name="Image10" border="0" id="Image10"/></a>
        </td>
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
                                       url="feed_unit_trust_list.do" submitFlag="true"/>
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

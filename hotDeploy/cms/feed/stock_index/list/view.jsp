<%@ page import="com.integrosys.cms.app.feed.bus.stockindex.IStockIndexFeedGroup,
                 com.integrosys.cms.app.feed.trx.stockindex.IStockIndexFeedGroupTrxValue,
                 java.util.HashMap,
                 com.integrosys.cms.ui.feed.stockindex.list.StockIndexListForm,
                 com.integrosys.cms.ui.feed.stockindex.list.StockIndexListAction,
                 com.integrosys.cms.ui.feed.stockindex.item.StockIndexItemAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.stockindex.IStockIndexFeedEntry,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.common.CountryList,
                 java.util.Collection,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.Iterator,
                 com.integrosys.cms.ui.feed.FeedConstants,
                 com.integrosys.cms.ui.feed.stockindex.list.StockIndexListMapper,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
    Enumeration enum = session.getAttributeNames();
    while (enum.hasMoreElements()) {
        DefaultLogger.debug(this, enum.nextElement());
    }

    StockIndexListForm actionForm = (StockIndexListForm)pageContext.findAttribute("stockIndexListForm");

    String event = actionForm.getEvent();

    boolean forClose = event.equals(StockIndexListAction.EVENT_LIST_MAKER_CLOSE) ||
    					event.equals(StockIndexListAction.EVENT_READ_MAKER_CLOSE);
    					
   	boolean forRead = StockIndexListAction.EVENT_READ.equals(event) ||
   						StockIndexListAction.EVENT_LIST_READ.equals(event);
    
    // Get the stock feed group trx value from session.
    IStockIndexFeedGroupTrxValue feedGroupTrxValue = (IStockIndexFeedGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.feed.stockindex.StockIndexAction.stockIndexFeedGroupTrxValue");
    IStockIndexFeedGroup stagingFeedGroup = feedGroupTrxValue.getStagingStockIndexFeedGroup();
    IStockIndexFeedGroup actualFeedGroup = feedGroupTrxValue.getStockIndexFeedGroup();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;

    // Get the record markers.
    //int offset = Integer.parseInt(actionForm.getOffset());
    //int length = Integer.parseInt(actionForm.getLength());
    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.feed.stockindex.StockIndexAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.feed.stockindex.StockIndexAction.length")).intValue();

    //int targetOffset = Integer.parseInt(actionForm.getTargetOffset());

    int rowIdx = 0;

    CountryList countryList = CountryList.getInstance();
    String countryName = countryList.getCountryName(stagingFeedGroup.getSubType());

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);
%>
<html>
<head>
<title>Untitled Document</title>



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

function goPageIndex(targetOffset) {
	<% if (forClose) { %>
		document.forms[0].event.value = "<%=StockIndexListAction.EVENT_LIST_MAKER_CLOSE%>"
	<% } else if (forRead) { %>
		document.forms[0].event.value = "<%=StockIndexListAction.EVENT_LIST_READ%>"
	<% } else { %>	
    	document.forms[0].event.value = "<%=StockIndexListAction.EVENT_LIST_VIEW%>"
	<% } %>
    document.forms[0].targetOffset.value = targetOffset;

    document.forms[0].submit();
}

function closeForm() {
	document.forms[0].event.value = "<%=StockIndexListAction.EVENT_CLOSE%>"
	document.forms[0].submit();
}
//-->
</script>
</head>

<body onload="MM_preloadImages('img/next2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission</p>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->

<html:form action="feed_stock_index_list.do">
<input type="hidden" name="event"/>
<%-- note the this order is important. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
<td height="34"> <h3>Stock Exchange Index - <%=countryName%></h3></td>
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
<td width="8%">S/N</td>
<td width="27%">Index&nbsp;<font color="#00AAFF">* </font></td>
<td width="10%">ISIN Code</td>
<td width="10%">RIC</td>
<td width="15%">Previous Value</td>
<td width="15%">Update Value&nbsp;<font color="#00AAFF">* </font></td>
<td width="15%">Last Updated Date</td>
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
<% 
  if (iterateLength == 0) {
%>
 <tr>
 	<td colspan="7" class="odd">
	  <bean:message key="label.global.not.found"/>
	</td>
 </tr> 
<%
  }
%>
<logic:iterate id="feedEntry" name="stagingFeedGroup" property="feedEntries"
        offset="<%=String.valueOf(offset)%>"
        length="<%=String.valueOf(iterateLength)%>" indexId="counter"
        type="com.integrosys.cms.app.feed.bus.stockindex.IStockIndexFeedEntry">
<%
    DefaultLogger.debug(this, "counter is now " + counter.intValue());

    long ref = feedEntry.getStockIndexFeedEntryRef();
        String originalUnitPrice = "";
        IStockIndexFeedEntry[] entriesArr = actualFeedGroup.getFeedEntries();
    if (entriesArr != null) {
        DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
        for (int i = 0; i < entriesArr.length; i++) {
            if (ref == entriesArr[i].getStockIndexFeedEntryRef()) {
                originalUnitPrice = String.valueOf(entriesArr[i].getUnitPrice());
                originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);
                DefaultLogger.debug(this, "found staging ref in actual: ref = " + ref);
                break;
            }
        }
    }

%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
<td class="index" valign="top"><%=counter.intValue()+1%></td>
<td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getName()%>"/></td>
<td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getIsinCode()%>"/></td>
<td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getRic()%>"/></td>
<td class="amount">&nbsp;<integro:empty-if-null value="<%=originalUnitPrice%>"/></td>
<td class="amount"><integro:empty-if-null value="<%=FeedUtils.padFractionDigits(String.valueOf(feedEntry.getUnitPrice()), 1, 2)%>"/>
</td>
<td style="text-align:center">&nbsp;<integro:date object="<%=feedEntry.getLastUpdatedDate()%>"/></td>
</tr>
</logic:iterate>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>

<%if (forClose) {%>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
<tr>
<td><a href="#" onclick="closeForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image8','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image8" width="80" height="20" border="0" id="Image8" /></a></td>
<td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10" /></a></td>
</tr>
<tr>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
</table>
<% } else if (forRead) { %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
<tr>
<td width="100" valign="baseline" align="center">
<a href="feed_stock_index_list.do?event=select" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
</a></td>
</tr>
<tr>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
</table>

<% } else { %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
<tr>
<td width="100" valign="baseline" align="center">
<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
</a></td>
</tr>
<tr>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
</table>
<% } %>
</html:form>
</td>
</tr>
 <!-- End Content -->

   <!-- General Purpose Bar -->

<tr>
<td height="25">
	<table id="generalPurposeBar" width="100%" border="0" cellspacing="0"
	cellpadding="5" align="center">

	<tr>
	<td valign="middle">
	<integro:pageindex
	 pageIndex="<%=new PageIndex(offset, length, stagingFeedGroup.getFeedEntries().length)%>"
	 url="feed_stock_index_list.do" submitFlag="true"/>
	</td>
	</tr>
	</table>

</td>
</tr>

</table>



</body>
</html>
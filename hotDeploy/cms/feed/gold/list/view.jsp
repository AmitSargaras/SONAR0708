<%@ page import="com.integrosys.cms.app.feed.bus.gold.IGoldFeedGroup,
                 com.integrosys.cms.app.feed.trx.gold.IGoldFeedGroupTrxValue,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.cms.ui.feed.gold.list.GoldListForm,
                 com.integrosys.cms.ui.feed.gold.list.GoldListAction,
                 com.integrosys.cms.ui.feed.gold.item.GoldItemAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.gold.IGoldFeedEntry,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.gold.list.GoldListMapper,
                 com.integrosys.cms.ui.feed.FeedUtils,
				 com.integrosys.cms.ui.collateral.CategoryCodeConstant,
                 com.integrosys.component.commondata.app.CommonDataSingleton"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<%
    GoldListForm actionForm = (GoldListForm)pageContext.findAttribute("goldListForm");

    String event = actionForm.getEvent();

    boolean forClose = event.equals(GoldListAction.EVENT_READ_MAKER_CLOSE) ||
    					event.equals(GoldListAction.EVENT_LIST_MAKER_CLOSE);

	boolean forRead = GoldListAction.EVENT_READ.equals(event) ||
						GoldListAction.EVENT_LIST_READ.equals(event);

    // Get the gold feed group trx value from session.
    IGoldFeedGroupTrxValue feedGroupTrxValue = (IGoldFeedGroupTrxValue)session.
            getAttribute("com.integrosys.cms.ui.feed.gold.GoldAction.goldFeedGroupTrxValue");

    IGoldFeedGroup stagingFeedGroup = feedGroupTrxValue.getStagingGoldFeedGroup();
    IGoldFeedGroup actualFeedGroup = feedGroupTrxValue.getGoldFeedGroup();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;

    // Get the record markers.
    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.feed.gold.GoldAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.feed.gold.GoldAction.length")).intValue();

    CurrencyList currencyList = CurrencyList.getInstance();
    HashMap currenciesMap = currencyList.getCurrencyList();

    HashMap goldGradeCodeMap = new HashMap();
    HashMap goldUOMCodeMap = new HashMap();
    goldGradeCodeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(CategoryCodeConstant.CATEGORY_GOLD_GRADE);
    goldUOMCodeMap = CommonDataSingleton.getCodeCategoryValueLabelMap(CategoryCodeConstant.CATEGORY_GOLD_UOM);
    
    int rowIdx = 0;

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

%>

<html>
<head>
<title>Untitled Document</title>

<script language="JavaScript" src="js/defaultImageFunction.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function gotopage(aLocation) {
    window.location = aLocation;
}

function goPageIndex(targetOffset) {
	<% if (forClose) { %>
		document.forms[0].event.value = "<%=GoldListAction.EVENT_LIST_MAKER_CLOSE%>"
	<% } else if (forRead) { %>
		document.forms[0].event.value = "<%=GoldListAction.EVENT_LIST_READ%>"
	<% } else { %>
		document.forms[0].event.value = "<%=GoldListAction.EVENT_LIST_VIEW%>"
	<% } %>

    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}

function closeForm() {
	document.forms[0].event.value = "<%=GoldListAction.EVENT_CLOSE%>"
	document.forms[0].submit();
}

//-->
</script>
</head>

<body>
<%@ include file="/feed/common/feeds_mandatory_flag.jsp" %>
<br>

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<!-- Content -->


<html:form action="feed_gold_list.do">
<input type="hidden" name="event"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<tr>
<td height="34"> <h3>Gold</h3></td>
</tr>
<tr>
<td><hr /> </td>
</tr>
</thead>
<tbody>
<tr>
<td>
<table id="tblGold" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
<tr>
<td width="5%"><bean:message key="label.global.sn"/></td>
<td width="20%"><bean:message key="label.feed.gold.grade"/></td>
<td width="20%"><bean:message key="label.feed.gold.unit.of.measurement"/></td>
<td width="15%"><bean:message key="label.currency.code"/>&nbsp;<bean:message key="label.mandatory"/></td>
<td width="20%"><bean:message key="label.feed.gold.unit.price"/></td>
<td width="20%"><bean:message key="label.global.last.updated.date"/></td>

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
        type="com.integrosys.cms.app.feed.bus.gold.IGoldFeedEntry">
<%
    DefaultLogger.debug(this, "counter is now " + counter.intValue());

    long ref = feedEntry.getGoldFeedEntryRef();
    String originalUnitPrice = "";
    IGoldFeedEntry[] entriesArr = actualFeedGroup.getFeedEntries();
    if (entriesArr != null) {
        DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
        for (int i = 0; i < entriesArr.length; i++) {
            if (ref == entriesArr[i].getGoldFeedEntryRef()) {
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
<td >&nbsp;<integro:empty-if-null value="<%=goldGradeCodeMap.get(feedEntry.getGoldGradeNum())%>"/></td>
<td >&nbsp;<integro:empty-if-null value="<%=goldUOMCodeMap.get(feedEntry.getUnitMeasurementNum())%>"/></td>
<td >&nbsp;<integro:empty-if-null value="<%=feedEntry.getCurrencyCode()%>"/></td>
<td class="amount">&nbsp;<integro:empty-if-null value="<%=FeedUtils.padFractionDigits(String.valueOf(feedEntry.getUnitPrice()), 1, 2)%>"/></td>
<td style="text-align: center;"><integro:date object="<%=feedEntry.getLastUpdatedDate()%>"/>
</td>
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
<% } else if (!forRead) { %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
<tr>
<td width="100" valign="baseline" align="center">
<a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/return2.gif',1)"><img src="img/return1.gif" name="Image4411"  border="0" id="Image4411" /></a>
</td>
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


		<table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">

		<tr>
		<td valign="middle">
		<integro:pageindex
		 pageIndex="<%=new PageIndex(offset, length, stagingFeedGroup.getFeedEntries().length)%>"
		 url="feed_gold_list.do" submitFlag="true"/>
		</td>
		</tr>
		</table>

</td>
</tr>

</table>



</body>
</html>
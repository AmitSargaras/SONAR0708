<%@ page import="com.integrosys.cms.app.feed.bus.stock.IStockFeedGroup,
                 com.integrosys.cms.app.feed.trx.stock.IStockFeedGroupTrxValue,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.ui.feed.stock.list.StockListForm,
                 com.integrosys.cms.ui.feed.stock.list.StockListAction,
                 com.integrosys.cms.ui.feed.stock.item.StockItemAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.stock.IStockFeedEntry,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.feed.FeedConstants,
                 com.integrosys.cms.ui.feed.stock.list.StockListMapper,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils,
                 com.integrosys.cms.ui.common.StockExchangeList"%>
<%@ page import="com.integrosys.cms.app.common.util.DB2DateConverter"%>
<%@ page import="java.util.*"%>
<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>




<%@page import="java.text.DecimalFormat"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
<title>Untitled Document</title>


<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" type="text/javascript" src="js/itgCheckForm.js"></script>
<script language="JavaScript" type="text/javascript" src="js/calendar.js"></script>
<script language="JavaScript" type="text/javascript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/javascript" src="js/enableFields.js"></script>

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

function addNew() {
    document.forms[0].event.value = "<%=StockListAction.EVENT_ADD%>";
    document.forms[0].submit();
}
function remove() {
    document.forms[0].event.value = "<%=StockListAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=StockListAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
function save() {
    document.forms[0].event.value = "<%=StockListAction.EVENT_SAVE%>"
    document.forms[0].submit();
}
function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=StockListAction.EVENT_PAGINATE%>"
    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}
function cancel() {
	document.forms[0].event.value="<%=StockListAction.EVENT_SELECT_MAKER_EDIT%>";
	document.forms[0].submit();
}

function checkerCancel(){
	document.forms[0].event.value="<%=StockListAction.EVENT_SELECT_CHECKER_EDIT%>";
	document.forms[0].submit();
}

function uploadMasterFile() {
	document.forms[0].action="feed_stock_item.do?event=maker_prepare_upload_stockItem";
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


<%

    Locale locale = (Locale) session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE + "." + com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);

    StockListForm actionForm = (StockListForm)pageContext.findAttribute("stockListForm");
    String event = actionForm.getEvent();

    // Get the stock feed group trx value from session.
    IStockFeedGroupTrxValue feedGroupTrxValue = (IStockFeedGroupTrxValue)session.getAttribute("com.integrosys.cms.ui.feed.stock.StockAction.stockFeedGroupTrxValue");

    IStockFeedGroup stagingFeedGroup = feedGroupTrxValue.getStagingStockFeedGroup();
    IStockFeedGroup actualFeedGroup = feedGroupTrxValue.getStockFeedGroup();
    String stockType = stagingFeedGroup.getStockType();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;



    // Get the record markers.
    int offset = ((Integer)session.getAttribute( "com.integrosys.cms.ui.feed.stock.StockAction.offset")).intValue();
    int length = ((Integer)session.getAttribute( "com.integrosys.cms.ui.feed.stock.StockAction.length")).intValue();

    CurrencyList currencyList = CurrencyList.getInstance();
    HashMap currenciesMap = currencyList.getCurrencyList();

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

    String stockExchangeName = null;
    StockExchangeList stockExchangeList = StockExchangeList.getInstance();
    Collection labels = stockExchangeList.getStockExchangeLabels();
    Collection values = stockExchangeList.getStockExchangeValues();

    // Find the subtype among the values.
    int pos = 0;
    for (Iterator iter = values.iterator(); iter.hasNext(); pos++) {
        if (((String)iter.next()).equals(stagingFeedGroup.getSubType())) {
            break;
        }
    }
    if (pos == values.size()) {
        // Not found.
        stockExchangeName = "";
    } else {
        stockExchangeName = (String)(labels.toArray()[pos]);
    }

	int rowIdx = 0;
	String rowClass = "index";
	
    boolean NotGeneralStock = !(ICMSConstant.STOCK_FEED_STOCK_TYPE.equals(stagingFeedGroup.getStockType().trim())) ;
    String title;
    if(stagingFeedGroup.getStockType().trim().equals("001")){
    	title = "BSE";
    }else if(stagingFeedGroup.getStockType().trim().equals("002")){
    	title = "NSE";
    }else{
    	title = "Others";
    }
%>

<html:form action="feed_stock_list.do">
<input type="hidden" name="event"/>
<html:hidden property="stockType" value="<%=stockType %>"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
<%if(!event.equals(StockListAction.EVENT_CHECKER_SELECT_MARKETABLE_INSTRUMENT)){ %>
<tr>
<td height="34"> <h3><%=title%></h3></td>
<td align="right" valign="bottom">
<% if(!event.equals(StockListAction.EVENT_CHECKER_PREPARE)) { %>
<input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>&nbsp;
<input type="button" name="fileupload" value="Upload" class="btnNormal" onclick="uploadMasterFile()"/>&nbsp;
<%if (stagingFeedGroup.getFeedEntries().length != 0) {%>
    <input type="button" name="Submit2" value="Remove" class="btnNormal" onclick="remove()"/>
    <html:errors property="chkDeletes"/>
<%}%>
<% } %>
</td>
</tr>
<tr>
<td colspan="2"><hr /> </td>
</tr>
<%} %>
</thead>
<tbody>
<tr>
<td colspan="2">
<table id="tblExchange" width="100%" border="0" cellpadding="0" cellspacing="0" class="tblinfo" style="margin-top:0">
<thead>
    <tr>
        <td width="3%">S/N</td>
        <td width="5%">Scrip Code</td>
        <td >Scrip Name &nbsp;
        <br/><bean:message key="error.string.stockmutualfund.name"/></td>
        <td width="8%">Scrip Value&nbsp;</td>
        <td width="8%">Name of the Shares</td>
        <td width="5%">Face Value &nbsp;</td>
        <td width="9%">Last Updated Date</td>
        <% if(!event.equals(StockListAction.EVENT_CHECKER_PREPARE)) { %>
        <td width="5%">Delete</td>
        <%} %>
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

    String[] chkBlackListedsArr = actionForm.getChkBlackListeds();

    String[] chkSuspendedsArr = actionForm.getChkSuspendeds();
    int[] suspendedsArr = new int [chkSuspendedsArr == null ? 0 : chkSuspendedsArr.length];

    for (int i = 0; i < suspendedsArr.length; i++) {
        suspendedsArr[i] = Integer.parseInt(chkSuspendedsArr[i]);
    }

%>
<% 
  if (iterateLength == 0) {
%>
 <tr>
     <% if (NotGeneralStock){ %>
        <td colspan="12" class="odd">
      <% }else{ %>
             <td colspan="11" class="odd">
     <% } %>
      <bean:message key="label.global.not.found"/>
	</td>
 </tr> 
<%
  }
%>
<logic:iterate id="feedEntry" name="stagingFeedGroup" property="feedEntries"
        offset="<%=String.valueOf(offset)%>"
        length="<%=String.valueOf(iterateLength)%>" indexId="counter"
        type="com.integrosys.cms.app.feed.bus.stock.IStockFeedEntry">
<%
    //DefaultLogger.debug(this, "counter is now " + counter.intValue());
    long ref = feedEntry.getStockFeedEntryRef();
        String originalUnitPrice = "";
        IStockFeedEntry[] entriesArr = actualFeedGroup.getFeedEntries();
    if (entriesArr != null) {
        //DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
        for (int i = 0; i < entriesArr.length; i++) {
            if (ref == entriesArr[i].getStockFeedEntryRef()) {
                originalUnitPrice = String.valueOf(entriesArr[i].getUnitPrice());
                originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);
                //DefaultLogger.debug(this, "found staging ref in actual: ref = " + ref);
                break;
            }
        }
    }
    
    IStockFeedEntry[] actualFeedEntry = actualFeedGroup.getFeedEntries();
	for(int i = 0; i < actualFeedEntry.length; i++){
		IStockFeedEntry stockFeedEntry = (IStockFeedEntry) actualFeedEntry[i];
		
		if(feedEntry.getScriptCode().equals(stockFeedEntry.getScriptCode())){
				if(!(CompareOBUtil.compOB(feedEntry, stockFeedEntry, "scriptName") 
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "scriptValue")
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "faceValue")
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "stockExchangeName")))	{
				rowClass = "indexdiff";
			}else{
				rowClass = "index";
			}	
			
			break;
		}else{
			rowClass = "indexadd";
		}	
	}
    String stockName = null;
    if(stockType.equals("001")){
    	stockName = "BSE";
    }else if(stockType.equals("002")){
    	stockName = "NSE";
    }else{
    	stockName=feedEntry.getStockExchangeName();
    } 
%>
<tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
    <td class="<%=rowClass.equals("index")?"index":rowClass%>" valign="top"><%=counter.intValue()+1%></td>
    <td width="10%">&nbsp;<integro:empty-if-null value="<%=feedEntry.getScriptCode()%>"/><input type="hidden" name="tickerCodes" value="<%=feedEntry.getScriptCode()%>" /></td>
    <td width="30%">&nbsp;
    	<html:text property="scriptNameArr" value="<%=feedEntry.getScriptName()%>" size="55"/>
    	<br/>
        <html:errors property="<%=\"scriptNameError\"+String.valueOf(counter.intValue() - offset)%>"/>
    </td>
    <td width="10%">&nbsp;
    	<%if( feedEntry.getScriptValue() !=0 ){
			DecimalFormat f = new DecimalFormat("0.00");	
		%>			
			<html:text property="scriptValueArr" value="<%= UIUtil.formatWithCommaAndDecimal(f.format(new Double(feedEntry.getScriptValue())))%>" maxlength="10" size="16" styleId="<%=\"scriptValueArr\"+String.valueOf(counter.intValue()) %>" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
		<%}else { %>
    		<html:text property="scriptValueArr" value="<%=UIUtil.formatWithCommaAndDecimal(Double.toString(feedEntry.getScriptValue()))%>" maxlength="10" size="16" styleId="<%=\"scriptValueArr\"+String.valueOf(counter.intValue()) %>" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
    	<%} %>
    	<br/>
        <html:errors property="<%=\"scriptValueError\"+String.valueOf(counter.intValue() - offset)%>"/>
    </td>
    <% if(!stockType.equals("003")){ %>
    	<td width="30%">&nbsp;<integro:empty-if-null value="<%=stockName%>" /><html:hidden property="exchangeNameArr" value="<%=stockName%>" /></td>
    <%}else{ %>
    	<td width="30%">&nbsp;
    		<html:text property="exchangeNameArr" value="<%=stockName%>" size="55"/>
    		<br/>
       		<html:errors property="<%=\"stockExchangeNameError\"+String.valueOf(counter.intValue() - offset)%>"/>
    	</td>
    <%} %>
    <td class="amount" width="10%">&nbsp;
    	<%if( feedEntry.getFaceValue() !=0 ){
			DecimalFormat f = new DecimalFormat("0.00");			
		%>			
			<html:text property="faceValueArr" value="<%= UIUtil.formatWithCommaAndDecimal(f.format(new Double(feedEntry.getFaceValue())))%>" maxlength="8" size="13" styleId="<%=\"faceValueArr\"+String.valueOf(counter.intValue())%>" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
		<%}else { %>
    		<html:text property="faceValueArr" value="<%=UIUtil.formatWithCommaAndDecimal(Double.toString(feedEntry.getFaceValue()))%>" maxlength="8" size="13" styleId="<%=\"faceValueArr\"+String.valueOf(counter.intValue())%>" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
    	<%} %>    	
    	<br/>
        <html:errors property="<%=\"faceValueError\"+String.valueOf(counter.intValue() - offset)%>"/>
        
    	<input type="hidden" name="updatedUnitPrices" value="<%=feedEntry.getFaceValue() %>" />
    </td>
    <td >&nbsp;<integro:date object="<%=feedEntry.getLastUpdatedDate()%>"/></td>
    <% if(!event.equals(StockListAction.EVENT_CHECKER_PREPARE)) { %>
     <td style="text-align:center">
        <input type="checkbox" name="chkDeletes" value="<%=counter.intValue()%>"/>
    </td>
    <%} %>
</tr>
</logic:iterate>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>

<br><br>
	<%
		if (feedGroupTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED)) {
    String lastActionBy = feedGroupTrxValue.getUserInfo();
    String lastRemarksMade = feedGroupTrxValue.getRemarks();
    if (lastRemarksMade == null) {
        lastRemarksMade = "";
    }

	%>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
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
<% } %>

<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
	<% if(!event.equals(StockListAction.EVENT_CHECKER_PREPARE)) { %>
	<td width="75" valign="baseline" align="center">
	<a href="#" onclick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSubmit','','img/submit2.gif',1)"><img src="img/submit1.gif" name="ImageSubmit" width="75" height="22" border="0" id="ImageSubmit" />
	</a></td>
	<%
       	if( ! ( event.equals("readMakerEdit") || event.equals("submitNoop") )){
    %>
	<td width="75" valign="baseline" align="center">
	<a href="#" onclick="save()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageSave','','img/save2.gif',1)"><img src="img/save1.gif" name="ImageSave"  border="0" id="ImageSave" />
	</a></td>
	<% } %>
	
	
	<%
		if (feedGroupTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
			feedGroupTrxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
	%>
	<td colspan="2" width="75" valign="baseline" align="center">
	<a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel"  border="0" id="ImageCancel" /></a>
	</td>
	<%
		} else {
	%>
	<td colspan="2" width="75" valign="baseline" align="center">
	<a href="#" onclick="cancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel2"  border="0" id="ImageCancel2" /></a>
	</td>
	<% } %>
	
	<%}else{ %>

	<td width="75" valign="baseline" align="center">
		<a href="#" onclick="checkerCancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel2"  border="0" id="ImageCancel2" /></a>
	</td>
	<%} %>
	
</tr>
<tr>
<td valign="baseline" align="center">&nbsp;</td>
<td valign="baseline" align="center">&nbsp;</td>
</tr>
</table>

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
		 url="feed_stock_list.do" submitFlag="true"/>
		</td>
		</tr>
		</table>
</td>
</tr>

</table>



</body>
</html>

<%@ page import="com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,                 
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.util.DateUtil,                 
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.cms.ui.feed.mutualfunds.list.MutualFundsListForm"%>
<%@page import="com.integrosys.cms.app.feed.trx.mutualfunds.IMutualFundsFeedGroupTrxValue"%>
<%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.IMutualFundsFeedGroup"%>
<%@page import="com.integrosys.cms.ui.feed.mutualfunds.list.MutualFundsListAction"%>
<%@page import="com.integrosys.cms.ui.feed.mutualfunds.list.MutualFundsListMapper"%>
<%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.IMutualFundsFeedEntry"%>
<%@page import="com.integrosys.cms.ui.feed.stock.list.StockListAction"%>
<%@page import="com.integrosys.cms.ui.collateral.CategoryCodeConstant"%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
<head>
    <title>Untitled Document</title>
    
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>

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
    document.forms[0].event.value = "<%=MutualFundsListAction.EVENT_ADD%>";
    document.forms[0].submit();
}
function remove() {
    document.forms[0].event.value = "<%=MutualFundsListAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=MutualFundsListAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
function save() {
    document.forms[0].event.value = "<%=MutualFundsListAction.EVENT_SAVE%>"
    document.forms[0].submit();
}
function goBack() {
	document.forms[0].action="ToDo.do?event=prepare";
	document.forms[0].submit();
}
function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=MutualFundsListAction.EVENT_PAGINATE%>"
    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}


function setPhysInsp(dropdown){
	var curSel = "";

	var editRead = dropdown.alt;
	var editReadArr = editRead.split(',');

	for(i=0; i<dropdown.options.length; i++)
	 {
		if (dropdown.options[i].selected == true)
		{
		    curSel = dropdown.options[i].value;	
		}    	
	 }

	 if(curSel == "CLOSE"){
        document.getElementById(editReadArr[0]).style.display = "none";
        document.getElementById(editReadArr[1]).style.display = '';
        
     } else {
        document.getElementById(editReadArr[1]).style.display = "none";
        document.getElementById(editReadArr[0]).style.display = '';
    }
}

function cancel() {
	document.forms[0].action="feed_stock_list.do?event=selectMarketableInstrument";
	document.forms[0].submit();
}

function uploadMasterFile() {
	document.forms[0].action="feed_mutual_funds_item.do?event=maker_prepare_upload_mutualfundsItem";
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

<%
    MutualFundsListForm actionForm = (MutualFundsListForm) pageContext.findAttribute("mutualFundsListForm");

    String event = actionForm.getEvent();
    
    List schemeTypeList = (List)session.getAttribute("com.integrosys.cms.ui.feed.mutualfunds.list.MutualFundsListAction.schemeTypeList");

    // Get the bond feed group trx value from session.
    IMutualFundsFeedGroupTrxValue feedGroupTrxValue = (IMutualFundsFeedGroupTrxValue) session.getAttribute("com.integrosys.cms.ui.feed.mutualfunds.MutualFundsAction.mutualFundsFeedGroupTrxValue");

    IMutualFundsFeedGroup stagingFeedGroup = null;

    //if (MutualFundsListAction.EVENT_READ.equals(event) ||
    //            MutualFundsListAction.EVENT_REMOVE.equals(event) ||
    //            MutualFundsListAction.EVENT_SAVE_AND_LIST.equals(event)) {
    stagingFeedGroup = feedGroupTrxValue.getStagingMutualFundsFeedGroup();

    IMutualFundsFeedGroup actualFeedGroup = feedGroupTrxValue.getMutualFundsFeedGroup();

    //} else {
    //    stagingFeedGroup = feedGroupTrxValue.getStagingMutualFundsFeedGroup();
    //}

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;

    // Get the record markers.
    int offset = ((Integer) session.getAttribute( "com.integrosys.cms.ui.feed.mutualfunds.MutualFundsAction.offset")).intValue();
    int length = ((Integer) session.getAttribute( "com.integrosys.cms.ui.feed.mutualfunds.MutualFundsAction.length")).intValue();

    int rowIdx = 0;
    String rowClass = "index";

%>

<html:form action="feed_mutual_funds_list.do">
<input type="hidden" name="event"/>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td height="34"><h3>Mutual Funds</h3></td>
        <td align="center" valign="bottom">
            <table width="100" border="0" align="right" cellpadding="0" cellspacing="0">
            <%if(!event.equals(StockListAction.EVENT_CHECKER_SELECTMAKEREDIT)){ %>
            
                <tr>
                    <td valign="bottom" align="center"><input type="button" name="Submit" value="Add New" class="btnNormal" onClick="addNew()"/>
                    </td>
                     <td valign="bottom" align="right">
						&nbsp;&nbsp;<input type="button" name="fileupload" value="Upload" class="btnNormal" onclick="uploadMasterFile()" style="margin-left: 10px;"/>
					</td>
                        <%if (stagingFeedGroup.getFeedEntries().length != 0) {%>
                        <td valign="bottom" align="right">
                        &nbsp;&nbsp;<input type="button" name="Submit2" value="Remove" class="btnNormal" onClick="remove()" style="margin-left: 10px;"/>
                        <html:errors property="chkDeletes"/>
                        </td>
                        <%}%>
                </tr>
                <%} %>
            </table>
        </td>
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
        <td width="5%">S/N</td>
        <td width="8%">Scheme Code&nbsp;</td>
        <td width="20%">Scheme Name&nbsp;
        <br/><bean:message key="error.string.stockmutualfund.name"/></td>
        <td width="10%">Scheme Status&nbsp;</td>
        <td width="7%">Scheme Type&nbsp;</td>
        <td width="7%">Current NAV&nbsp;</td>
        <td width="12%">Start Date&nbsp;</td>
        <td width="12%">Expiry Date&nbsp;</td>
        <td width="9%">Last Updated Date</td>
        <td width="4%">Delete</td>
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

        String[] chkDeletesArr = actionForm.getChkDeletes();
        int[] deletesArr = new int[ chkDeletesArr == null ?
                0 : chkDeletesArr.length];

        for (int i = 0; i < deletesArr.length; i++) {
            deletesArr[i] = Integer.parseInt(chkDeletesArr[i]);
        }

    %>
    <%
        if (iterateLength == 0) {
    %>
    <tr>
        <td colspan="12" class="odd">
            <bean:message key="label.global.not.found"/>
        </td>
    </tr>
    <%
        }
    %>
    <logic:iterate id="feedEntry" name="stagingFeedGroup" property="feedEntries"
                   offset="<%=String.valueOf(offset)%>"
                   length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                   type="com.integrosys.cms.app.feed.bus.mutualfunds.IMutualFundsFeedEntry">
        <%
            //DefaultLogger.debug(this, "counter is now " + counter.intValue());
            long ref = feedEntry.getMutualFundsFeedEntryRef();
            String originalUnitPrice = "";
            String startCal = "ImageCal"+(counter.intValue() - offset);
            String expiryCal = "expiryCal"+(counter.intValue() - offset);
            
            String expiryRead = "expiryRead"+(counter.intValue() - offset);
            String expiryEdit = "expiryEdit"+(counter.intValue() - offset);
            DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
            IMutualFundsFeedEntry[] entriesArr = actualFeedGroup.getFeedEntries();
            
            List scriptTypeArr = new ArrayList();
            
            if (entriesArr != null) {
                //DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
                for (int i = 0; i < entriesArr.length; i++) {
                    if (ref == entriesArr[i].getMutualFundsFeedEntryRef()) {
                        originalUnitPrice = String.valueOf(entriesArr[i].getCurrentNAV());
                        originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);
                        scriptTypeArr.add(entriesArr[i].getSchemeType());
                        //DefaultLogger.debug(this, "found staging ref in actual: ref = " + ref);
                        break;
                    }
                }
            }
            
            IMutualFundsFeedEntry[] actualFeedEntry = actualFeedGroup.getFeedEntries();
        	for(int i = 0; i < actualFeedEntry.length; i++){
        		IMutualFundsFeedEntry stockFeedEntry = (IMutualFundsFeedEntry) actualFeedEntry[i];
        		
        		if(feedEntry.getSchemeCode().equals(stockFeedEntry.getSchemeCode())){
        			if(!(CompareOBUtil.compOB(feedEntry, stockFeedEntry, "schemeName") 
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "schemeType")
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "currentNAV")
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "startDate")
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "expiryDate")))	
        			{
        				rowClass = "indexdiff";
        			}else{
        				rowClass = "index";
        			}	
        			
        			break;
        		}else{
        			rowClass = "indexadd";
        		}	
        	}

        %>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=rowClass=="index"?"index":rowClass%>" valign="top"><%=counter.intValue() + 1%></td>
            <td width="5%">&nbsp;
            	<integro:empty-if-null value="<%=feedEntry.getSchemeCode()%>"/>
            	<html:hidden property="schemeCodes" value="<%=feedEntry.getSchemeCode()%>"/>
            </td>
            <td >&nbsp;
            	<html:text property="schemeNames"  size="30" maxlength="30" value="<%=feedEntry.getSchemeName() %>"/>            	
            	<br/>
            	<html:errors property="<%=\"schemeNamesError\"+String.valueOf(counter.intValue() - offset)%>"/>
            </td>
            
            <td >&nbsp;
            	<integro:empty-if-null value="<%=feedEntry.getSchemeType() %>"/>
            	<html:hidden property="schemeTypeList"  value="<%=feedEntry.getSchemeType() %>"/>
            </td>
            
            <td >&nbsp;
            	<html:select property="schemeTypeArr" onchange="setPhysInsp(this)" alt="<%=(expiryRead +','+ expiryEdit)%>" value="<%=feedEntry.getSchemeType() %>">
	                 <integro:common-code categoryCode="<%=CategoryCodeConstant.HDFC_SCRIPT_TYPE%>" 
	                 descWithCode="false" excludeList="<%=scriptTypeArr %>" />
	            </html:select>
	            <br/>
            	<html:errors property="<%=\"schemeTypeError\"+String.valueOf(counter.intValue() - offset)%>"/>
            </td>
            <td style="text-align:center">
            	<input type="text" name="updatedCurrentNAV" value="<%=UIUtil.formatWithCommaAndDecimal(Double.toString(feedEntry.getCurrentNAV()))%>" maxlength="9" id="updatedCurrentNAV[<%=counter.intValue() %>]" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
            	<br/>
            	<html:errors property="<%=\"currentNAVError\"+String.valueOf(counter.intValue() - offset)%>"/>
            </td>
            <td >
            	<input name="startDateArr" type="text" id="<%=startCal %>" style="width:90px" size="15" maxlength="11"
                       readonly="readonly" value="<%=feedEntry.getStartDate()==null?"":df.format(feedEntry.getStartDate())%>" />
                <img src="img/calendara.gif" name="<%=startCal %>" border="0" id="<%=startCal %>" onclick="return showCalendar('<%=startCal %>', 'dd/mm/y');"
                       onmouseover="MM_swapImage('ImageCal','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                <br/>
            	<html:errors property="<%=\"startDateError\"+String.valueOf(counter.intValue() - offset)%>"/>
            </td>
            <td>
            	<input name="expiryDateArr" type="text" id="<%=expiryCal %>" style="width:90px" size="15" maxlength="11"
                       readonly="readonly" value="<%=feedEntry.getExpiryDate()==null?"":df.format(feedEntry.getExpiryDate())%>" />
                <img src="img/calendara.gif" name="<%=expiryCal %>" border="0" id="<%=expiryCal %>" onclick="return showCalendar('<%=expiryCal %>', 'dd/mm/y');"
                       onmouseover="MM_swapImage('ImageCal2','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                <br/>
            	<html:errors property="<%=\"expiryDateError\"+String.valueOf(counter.intValue() - offset)%>"/>
            </td>
                                    
            <td style="text-align:center">&nbsp;<integro:date object="<%=feedEntry.getLastUpdatedDate()%>"/>
            <html:hidden property="lastUpdatedDate" value="<%=df.format(feedEntry.getLastUpdatedDate())%>"/></td>
            <td style="text-align:center">
                <input type="checkbox" name="chkDeletes"
                        <%=MutualFundsListMapper.inArray(counter.intValue(), deletesArr) ? "checked" : ""%>
                       value="<%=counter.intValue()%>"/>
            </td>
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

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="75" valign="baseline" align="center">
            <a href="#" onClick="submitForm()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75"
                                                                                                                                                 height="22" border="0" id="Image3"/>            </a></td>
        	<%
            	if( ! ( event.equals("readMakerEdit") ) ){
            %>
        <td width="75" valign="baseline" align="center">
            <a href="#" onClick="save()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3311" border="0"
                                                                                                                                            id="Image331"/>
            </a></td>
         <td>
         	<a href="#" onclick="cancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel2"  border="0" id="ImageCancel2" /></a>
         </td>
         <%} else {%>
         <td>
         	<a href="#" onclick="goBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ImageCancel2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="ImageCancel2"  border="0" id="ImageCancel2" /></a>
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
<tr>
    <td height="25">
        <table id="generalPurposeBar" width="100%" border="0" cellspacing="0"
               cellpadding="5" align="center">

            <tr>
                <td valign="middle">
                    <integro:pageindex
                            pageIndex="<%=new PageIndex(offset, length, stagingFeedGroup.getFeedEntries().length)%>"
                            url="feed_mutual_funds_list.do" submitFlag="true"/>
                </td>
            </tr>
        </table>
    </td>
</tr>

</table>


</body>
</html>
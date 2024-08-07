<%@ page import="com.integrosys.cms.app.feed.bus.bond.IBondFeedGroup,
                 com.integrosys.cms.app.feed.trx.bond.IBondFeedGroupTrxValue,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.cms.ui.feed.bond.list.BondListForm,
                 com.integrosys.cms.ui.feed.bond.list.BondListAction,
                 com.integrosys.cms.ui.feed.bond.item.BondItemAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.bond.IBondFeedEntry,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.feed.bond.list.BondListMapper,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.cms.ui.feed.stock.list.StockListAction"%>

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
    <script type="text/javascript" src="js/calendar.js"></script>
    <script type="text/javascript" src="js/calDriver.js"></script>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.integrosys.base.techinfra.diff.CompareOBUtil"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html>
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

function addNew() {
    document.forms[0].event.value = "<%=BondListAction.EVENT_ADD%>";
    document.forms[0].submit();
}
function remove() {
    document.forms[0].event.value = "<%=BondListAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=BondListAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
function save() {
    document.forms[0].event.value = "<%=BondListAction.EVENT_SAVE%>"
    document.forms[0].submit();
}
function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=BondListAction.EVENT_PAGINATE%>"
    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}

function cancel() {
	document.forms[0].action="feed_stock_list.do?event=selectMarketableInstrument";
	document.forms[0].submit();
}

function goBack() {
	document.forms[0].action="ToDo.do?event=prepare";
	document.forms[0].submit();
}

function uploadMasterFile() {
	document.forms[0].action="feed_bond_item.do?event=maker_prepare_upload_bondItem";
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
    BondListForm actionForm = (BondListForm) pageContext.findAttribute("bondListForm");


    String event = actionForm.getEvent();

    // Get the bond feed group trx value from session.
    IBondFeedGroupTrxValue feedGroupTrxValue = (IBondFeedGroupTrxValue) session.getAttribute("com.integrosys.cms.ui.feed.bond.BondAction.bondFeedGroupTrxValue");

    IBondFeedGroup stagingFeedGroup = null;

    //if (BondListAction.EVENT_READ.equals(event) ||
    //            BondListAction.EVENT_REMOVE.equals(event) ||
    //            BondListAction.EVENT_SAVE_AND_LIST.equals(event)) {
    stagingFeedGroup = feedGroupTrxValue.getStagingBondFeedGroup();

    IBondFeedGroup actualFeedGroup = feedGroupTrxValue.getBondFeedGroup();

    //} else {
    //    stagingFeedGroup = feedGroupTrxValue.getStagingBondFeedGroup();
    //}

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;

    // Get the record markers.
    int offset = ((Integer) session.getAttribute( "com.integrosys.cms.ui.feed.bond.BondAction.offset")).intValue();
    int length = ((Integer) session.getAttribute( "com.integrosys.cms.ui.feed.bond.BondAction.length")).intValue();

    int rowIdx = 0;
    String rowClass = "index";

%>

<html:form action="feed_bond_list.do">
<input type="hidden" name="event"/>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td height="34"><h3>Bond</h3></td>
        <td align="center" valign="bottom">
            <table width="100" border="0" align="right" cellpadding="0" cellspacing="0">
                <%if(!event.equals(StockListAction.EVENT_CHECKER_SELECT_MARKETABLE_INSTRUMENT)){%>           
                <tr>
                    <td  valign="bottom" align="center"><input type="button" name="Submit" value="Add New" class="btnNormal" onClick="addNew()"/>
                    </td>
                      <td  valign="bottom" align="right">
						&nbsp;&nbsp;<input type="button" name="fileupload" value="Upload" class="btnNormal" onclick="uploadMasterFile()"  style="margin-left: 10px;"/>
					 </td>
                        <%if (stagingFeedGroup.getFeedEntries().length != 0) {%>
                        <td  valign="bottom" align="right">
                        &nbsp;&nbsp;<input type="button" name="Submit2" value="Remove" class="btnNormal" onClick="remove()"  style="margin-left: 10px;"/>
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
        <td width="8%">Bond Code</td>
        <td width="6%">Bond Name&nbsp;<font color="#00AAFF">* </font>
        <br/><bean:message key="error.string.bond.name"/></td>
        <td width="7%">ISIN Code&nbsp;<font color="#00AAFF">* </font></td>
        <td width="12%">Current Unit Price&nbsp;<font color="#00AAFF">* </font></td>
        <td width="15%">Issue Date</td>
        <td width="15%">Maturity Date</td>
        <td width="9%">Bond Rating</td>
        <td width="9%">Coupon Rate (%)</td>
        <td width="15%">Last Update Date</td>
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
                   type="com.integrosys.cms.app.feed.bus.bond.IBondFeedEntry">
        <%
            //DefaultLogger.debug(this, "counter is now " + counter.intValue());
            long ref = feedEntry.getBondFeedEntryRef();
            String originalUnitPrice = "";
            IBondFeedEntry[] entriesArr = actualFeedGroup.getFeedEntries();
            if (entriesArr != null) {
                //DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
                for (int i = 0; i < entriesArr.length; i++) {
                    if (ref == entriesArr[i].getBondFeedEntryRef()) {
                        originalUnitPrice = String.valueOf(entriesArr[i].getUnitPrice());
                        originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);
                        //DefaultLogger.debug(this, "found staging ref in actual: ref = " + ref);
                        break;
                    }
                }
            }
            
            IBondFeedEntry[] actualFeedEntry = actualFeedGroup.getFeedEntries();
        	for(int i = 0; i < actualFeedEntry.length; i++){
        		IBondFeedEntry stockFeedEntry = (IBondFeedEntry) actualFeedEntry[i];
        		
        		if(feedEntry.getBondCode().equals(stockFeedEntry.getBondCode())){
        			if(!(CompareOBUtil.compOB(feedEntry, stockFeedEntry, "name") 
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "rating")
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "unitPrice")
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "maturityDate")
        				&& CompareOBUtil.compOB(feedEntry, stockFeedEntry, "couponRate")))	
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

            DateFormat df = new SimpleDateFormat("dd/MMM/yyyy");
            String expiryRead = "expiryRead"+(counter.intValue() - offset);
            String maturityCal = "maturityCal"+(counter.intValue() - offset);

        %>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="<%=rowClass=="index"?"index":rowClass%>" valign="top"><%=counter.intValue() + 1%></td>
            <td width="10%">&nbsp;<integro:empty-if-null value="<%=feedEntry.getBondCode()%>"/><html:hidden property="bondCodes" value="<%=feedEntry.getBondCode() %>"/></td>
            <td width="30%">&nbsp;<html:text property="bondNames" value="<%=feedEntry.getName()%>" size="50"/>
            	<br/>
            	<html:errors property="<%=\"bondNameError\"+String.valueOf(counter.intValue() - offset)%>"/>
            </td>
            <td width="10%">&nbsp;<%=feedEntry.getIsinCode()%>
            <html:hidden property="isinCode" value="<%=feedEntry.getIsinCode()%>"/></td>
            
            <td width="10%" class="amount">
            	<%if( feedEntry.getUnitPrice() !=0 ){
				DecimalFormat f = new DecimalFormat("0.00");			
			%>			
				<html:text property="updatedUnitPrices" value="<%= UIUtil.formatWithCommaAndDecimal(f.format(new Double(feedEntry.getUnitPrice())))%>" styleId="<%=\"updatedUnitPrices\"+String.valueOf(counter.intValue()) %>" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
			<%}else { %>
	    		<html:text property="updatedUnitPrices" value="<%=UIUtil.formatWithCommaAndDecimal(Double.toString(feedEntry.getUnitPrice()))%>" styleId="<%=\"updatedUnitPrices\"+String.valueOf(counter.intValue()) %>" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
	    	<%} %>
            	<br/>
            	<html:errors property="<%=\"currentUnitPriceError\"+String.valueOf(counter.intValue() - offset)%>"/>
            </td >
            
            <td width="10%">&nbsp;<integro:date object="<%=feedEntry.getIssueDate()%>"></integro:date> </td>
            
            <td id="<%=expiryRead %>" width="15%">
            	<input name="maturityDateArr" type="text" id="<%=maturityCal %>" style="width:90px" size="15" maxlength="11"
                       readonly="readonly" value="<%=feedEntry.getMaturityDate()==null?"":df.format(feedEntry.getMaturityDate())%>" />
                <img src="img/calendara.gif" name="<%=maturityCal %>" border="0" id="<%=maturityCal %>" onclick="return showCalendar('<%=maturityCal %>', 'dd/mm/y');"
                       onmouseover="MM_swapImage('ImageCal2','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()"/>
                <br/>
            	<html:errors property="<%=\"maturityDate\"+String.valueOf(counter.intValue() - offset)%>"/>
            </td>
             <td class="amount" >
             	<%
                    String ratingitem = actionForm.getRatingArr(counter.intValue() - offset);
                    if (ratingitem == null) {
                        ratingitem = "";
                    }

                %>
                <html:text property="ratingArr"
                       value="<%=ratingitem%>"
                       size="20" maxlength="30"/>
                 <br/>
            	<html:errors property="<%=\"ratingError\"+String.valueOf(counter.intValue() - offset)%>"/>      
             </td>
            
            <td width="30%">&nbsp;
            <html:text property="couponRate" size="14" maxlength="6" value="<%=Double.toString(feedEntry.getCouponRate())%>"/>
            <br/><html:errors property="<%=\"couponRate\"+String.valueOf(counter.intValue() - offset)%>"/> 
            </td>          

			<td width="30%"><integro:date object="<%= feedEntry.getLastUpdateDate() %>"></integro:date> 
			<html:hidden property="lastUpdateDate" value="<%=df.format(feedEntry.getLastUpdateDate())%>"/></td>            
            <td style="text-align:center">
                <input type="checkbox" name="chkDeletes"
                        <%=BondListMapper.inArray(counter.intValue(), deletesArr) ? "checked" : ""%>
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
                                                                                                                                                 height="22" border="0" id="Image3"/>
            </a></td>
            <%
            	if( ! ( event.equals("readMakerEdit") || event.equals("submitNoop") ) ){
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
                            url="feed_bond_list.do" submitFlag="true"/>
                </td>
            </tr>
        </table>
    </td>
</tr>

</table>


</body>
</html>
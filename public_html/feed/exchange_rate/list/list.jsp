<%@ page import="com.integrosys.cms.app.feed.bus.forex.IForexFeedGroup,
                 com.integrosys.cms.app.feed.trx.forex.IForexFeedGroupTrxValue,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 java.math.BigDecimal,
                 com.integrosys.cms.ui.feed.exchangerate.list.ExchangeRateListForm,
                 com.integrosys.cms.ui.feed.exchangerate.list.ExchangeRateListAction,
                 com.integrosys.cms.ui.feed.exchangerate.item.ExchangeRateItemAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.forex.IForexFeedEntry,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.exchangerate.list.ExchangeRateListMapper,
                 com.integrosys.cms.ui.feed.FeedUtils,
				 com.integrosys.cms.ui.common.UIUtil" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>


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

function addNew() {
    document.forms[0].event.value = "<%=ExchangeRateListAction.EVENT_ADD%>";
    document.forms[0].submit();
}
function remove() {
    document.forms[0].event.value = "<%=ExchangeRateListAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=ExchangeRateListAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
function save() {
    document.forms[0].event.value = "<%=ExchangeRateListAction.EVENT_SAVE%>"
    document.forms[0].submit();
}
function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=ExchangeRateListAction.EVENT_PAGINATE%>"
    document.forms[0].targetOffset.value = targetOffset;
    document.forms[0].submit();
}
function searchPage(){
	var currencyCodeSearch= document.getElementById("currencyCodeSearch").value;
	var currencyIsoCodeSearch= document.getElementById("currencyIsoCodeSearch").value;
	var statusSearch= document.getElementById("statusSearch").value;

	document.forms[0].action="feed_exchange_rate_list.do?event=search&currencyCodeSearch="+currencyCodeSearch+"&currencyIsoCodeSearch="+currencyIsoCodeSearch+"&statusSearch="+statusSearch;
	document.forms[0].submit();


}	
function uploadMasterFile() {
	document.forms[0].action="feed_exchange_rate_item.do?event=maker_prepare_upload_exchangeRateItem";
    document.forms[0].submit();
}

function goBack(){
	document.forms[0].action="Welcome.do?event=prepare";
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

    ExchangeRateListForm actionForm = (ExchangeRateListForm) pageContext.findAttribute("exchangeRateListForm");

    String event = actionForm.getEvent();

    // Get the forex feed group trx value from session.
    IForexFeedGroupTrxValue feedGroupTrxValue = (IForexFeedGroupTrxValue) session.
            getAttribute("com.integrosys.cms.ui.feed.exchangerate.ForexAction.forexFeedGroupTrxValue");

    IForexFeedGroup stagingFeedGroup = feedGroupTrxValue.getStagingForexFeedGroup();

    IForexFeedGroup actualFeedGroup = feedGroupTrxValue.getForexFeedGroup();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;

    // Get the record markers.
    int offset = ((Integer) session.getAttribute(
            "com.integrosys.cms.ui.feed.exchangerate.ForexAction.offset")).intValue();
    int length = ((Integer) session.getAttribute(
            "com.integrosys.cms.ui.feed.exchangerate.ForexAction.length")).intValue();

    int rowIdx = 0;

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);
%>

<html:form action="feed_exchange_rate_list.do">
<input type="hidden" name="event"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td height="34"><h3>Exchange Rate</h3></td>
        </tr>
        <!--<tr>
        <td align="right" valign="bottom">
        <TABLE width="70%" class=tblinfo id=custsearch border="0" align="left" cellpadding="0" cellspacing="0" style="margin-top:15px">
                     <THEAD>
                      <TR>
                        <TD colSpan=3 width="100%">Please enter search criteria</TD></TR></THEAD>
                      <TBODY>
                      <TR class="odd">
                        <TD class="fieldname">Currency Code :</TD>
                        <TD><input type="text" id="currencyCodeSearch">
						</TD>              
						<td>&nbsp;
						</td>          
                      </TR>
                      <TR class="even">
                        <TD class="fieldname" width="20%">Currency ISO Code :</TD>
                        <TD><input type="text" id="currencyIsoCodeSearch">
						</TD>
                        <TD><input class=btnNormal id=Search3 style="margin-left: 10px; WIDTH: 50px; MARGIN-RIGHT: 5px" onclick="searchPage()" type="button" value="Go" name="Search3">
                        </TD></TR>
                      <TR class="odd">
                        <TD class="fieldname" width="20%">Status </TD>
                        <TD><select id="statusSearch">
                        <option  value="ENABLE" >ENABLE</option>
                        <option  value="DISABLE">DISABLE </option>
                        
                        </select>
						</TD>
                        <TD>&nbsp;
                        </TD></TR>
                      </TBODY>
                    </TABLE>
        
        </td></tr>-->
        <tr>
        <td>
            <table width="50" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100" valign="bottom" align="center">
                        <input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
                    </td>
                    <td>&nbsp;</td>
                    <td  valign="bottom" align="right">
						<input type="button" name="fileupload" value="Upload" class="btnNormal" onclick="uploadMasterFile()"/>
					</td>
                    <td>&nbsp;</td>
                    <td width="100" valign="bottom" align="center">
                        <%if (stagingFeedGroup.getFeedEntries().length != 0) {%>
                        &nbsp;
                        <input type="button" name="Submit2" value="ENABLE/DISABLE" class="btnNormal" onclick="remove()"/>
                        <html:errors property="chkDeletes"/>
                        <%}%>
                    </td>
                </tr>
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
                        <td width="9%">System Code&nbsp;</td>
                        <td width="15%">Currency ISO Code</td>
                        <td width="20%">Currency Description
                        <br/><bean:message key="error.string.currency.name"/></td>
                        
                        <td width="12%">Updated Exchange Rate&nbsp;</td>
                        <!--<td width="15%">Unit of Currency Against</td>
                        --><td width="15%">Last Updated Date</td>
                        <td width="15%">Restriction Type</td>
                         <td width="15%">Status</td>
                        <td width="12%">Action</td>
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
                    <td colspan="8" class="odd">
                        <bean:message key="label.global.not.found"/>
                    </td>
                </tr>
                <%
                    }
                %>
                <logic:iterate id="feedEntry" name="stagingFeedGroup" property="feedEntries"
                               offset="<%=String.valueOf(offset)%>"
                               length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                               type="com.integrosys.cms.app.feed.bus.forex.IForexFeedEntry">
                    <%
                        //DefaultLogger.debug(this, "counter is now " + counter.intValue());					
						
						
                        long ref = feedEntry.getForexFeedEntryRef();
                        String originalUnitPrice = "";
                        IForexFeedEntry[] entriesArr = actualFeedGroup.getFeedEntries();
                        if (entriesArr != null) {
                            //DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
                            for (int i = 0; i < entriesArr.length; i++) {
                                if (ref == entriesArr[i].getForexFeedEntryRef()) {								
								
									originalUnitPrice = UIUtil.formatBigDecimalToStr(entriesArr[i].getBuyRate());
                                    originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);
                                    //DefaultLogger.debug(this, "found staging ref in actual: ref = " + ref);
                                    break;
                                }
                            }
                        }
                    %>
                    <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
                        <td class="index" valign="top"><%=counter.intValue() + 1%></td>
                        <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getSystemCode()%>"/>
                        <input type="hidden" name="systemCode" value="<%=feedEntry.getSystemCode()%>" />
                        	<input type="hidden" name="buyCurrencies" value="<%=feedEntry.getBuyCurrency()%>" /></td>
                        	
                        <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getCurrencyIsoCode()%>"/>
                        	</td>
                        	
                        		
                        <td>&nbsp;
                        <input name="updatedCurrencyDescription" type="text"
                                   value="<%=feedEntry.getCurrencyDescription().trim()%>"
                                   size="20" maxlength="50"/>
                          <html:errors property="<%=\"currencyDescriptionError\"+String.valueOf(counter.intValue() - offset)%>"/>
                        
                        </td>
                        

                        <td class="amount">
                            <input name="updatedUnitPrices" type="text"
                                   value="<%=UIUtil.formatWithCommaAndDecimal(FeedUtils.padFractionDigits(actionForm.getUpdatedUnitPrices(counter.intValue()-offset), 1, 2))%>"
                                   size="14" class="currency" maxlength="15" id="updatedUnitPrices[<%= counter.intValue()%>]" onblur="javascript:formatAmountAsCommaSeparated(this)"/>
                            <html:errors property="<%=\"updatedUnitPrices.\"+String.valueOf(counter.intValue() - offset)%>"/>
                        </td>
                        <!--<td style="text-align:center"><%=CommonUtil.getBaseExchangeCurrency()%> 1.00</td>
                        --><td style="text-align:center">&nbsp;<integro:date object="<%=feedEntry.getEffectiveDate()%>"/></td>
                        <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getRestrictionType()%>"/></td>
                        <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getStatus()%>"/></td>
                        <td style="text-align:center">
                            <input type="checkbox" name="chkDeletes"
                                    <%=ExchangeRateListMapper.inArray(counter.intValue(), deletesArr) ? "checked" : ""%>
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

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="75" valign="baseline" align="center">
            <a href="#" onclick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75"
                                                                                                                                                 height="22" border="0" id="Image3"/>
            </a>
       </td>
            <td><a href="ToDo.do?event=prepare" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image10','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image10" border="0" id="Image10" /></a></td>
<!--        <td width="75" valign="baseline" align="center">-->
<!--            <a href="#" onclick="save()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3311" border="0"-->
<!--                                                                                                                                            id="Image331"/>-->
<!--            </a></td>-->
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
<% }else{ %>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td width="75" valign="baseline" align="center">
            <a href="#" onclick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image3" width="75"
                                                                                                                                                 height="22" border="0" id="Image3"/>
            </a>
       </td>
            <td width="75" valign="baseline" align="center">
            <a href="#" onclick="goBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3" width="75"
                                                                                                                                                 height="22" border="0" id="Image3"/>
            </a>
        </td>
<!--        <td width="75" valign="baseline" align="center">-->
<!--            <a href="#" onclick="save()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)"><img src="img/save1.gif" name="Image3311" border="0"-->
<!--                                                                                                                                            id="Image331"/>-->
<!--            </a></td>-->
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>


<%} %>


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
                            url="feed_exchange_rate_list.do" submitFlag="true"/>
                </td>
            </tr>
        </table>

    </td>
</tr>

</table>

</body>
</html>
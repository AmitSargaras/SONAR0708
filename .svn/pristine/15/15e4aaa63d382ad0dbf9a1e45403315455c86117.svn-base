<%@ page import="com.integrosys.cms.app.feed.bus.propertyindex.IPropertyIndexFeedGroup,
                 com.integrosys.cms.app.feed.trx.propertyindex.IPropertyIndexFeedGroupTrxValue,
                 com.integrosys.cms.app.feed.bus.propertyindex.IPropertyIndexFeedEntry,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.feed.propertyindex.list.PropertyIndexListForm,
                 com.integrosys.cms.ui.feed.propertyindex.list.PropertyIndexListAction,
                 com.integrosys.cms.ui.feed.propertyindex.list.PropertyIndexListMapper,
                 com.integrosys.cms.ui.feed.propertyindex.item.PropertyIndexItemAction,
                 com.integrosys.cms.ui.feed.FeedUtils,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.*"
        %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    /**
     * Copyright Integro Technologies Pte Ltd
     *  $Header: /home/cms2/cvsroot/cms2/public_html/feed/property_index/list/list.jsp,v 1.20 2006/10/27 08:44:14 hmbao Exp $
     *
     * List Property Index
     * Purpose: List Property Indexes
     * Description:
     *
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.20 $
     * Date: $Date: 2006/10/27 08:44:14 $
     * Tag: $Name:  $
     */
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

function addNew() {
    document.forms[0].event.value = "<%=PropertyIndexListAction.EVENT_ADD%>";
    document.forms[0].submit();
}
function remove() {
    document.forms[0].event.value = "<%=PropertyIndexListAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=PropertyIndexListAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
function save() {
    document.forms[0].event.value = "<%=PropertyIndexListAction.EVENT_SAVE%>"
    document.forms[0].submit();
}
function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=PropertyIndexListAction.EVENT_PAGINATE%>"

    document.forms[0].targetOffset.value = targetOffset;

    document.forms[0].submit();
}

function cancel() {
	document.forms[0].event.value="<%=PropertyIndexListAction.EVENT_SELECT_MAKER_EDIT%>";
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
    Enumeration enum = session.getAttributeNames();
    while (enum.hasMoreElements()) {
        DefaultLogger.debug(this, enum.nextElement());
    }

    PropertyIndexListForm actionForm = (PropertyIndexListForm) pageContext.findAttribute("propertyIndexListForm");
    String event = actionForm.getEvent();

    // Get the property index feed group trx value from session.
    IPropertyIndexFeedGroupTrxValue feedGroupTrxValue = (IPropertyIndexFeedGroupTrxValue) session.getAttribute("com.integrosys.cms.ui.feed.propertyindex.PropertyIndexAction.propertyIndexFeedGroupTrxValue");
    IPropertyIndexFeedGroup stagingFeedGroup = null;

    stagingFeedGroup = feedGroupTrxValue.getStagingPropertyIndexFeedGroup();
    IPropertyIndexFeedGroup actualFeedGroup = feedGroupTrxValue.getPropertyIndexFeedGroup();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;
    int offset = ((Integer) session.getAttribute("com.integrosys.cms.ui.feed.propertyindex.PropertyIndexAction.offset")).intValue();
    int length = ((Integer) session.getAttribute("com.integrosys.cms.ui.feed.propertyindex.PropertyIndexAction.length")).intValue();

    String cssClass = "odd";

    CountryList countryList = CountryList.getInstance();
    String countryName = countryList.getCountryName(stagingFeedGroup.getSubType());

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

%>

<html:form action="feed_property_index_list.do">
<input type="hidden" name="event"/>
<%-- Fake value. --%>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td height="34">
            <h3><%=countryName%></h3>
        </td>
        <td align="right" valign="bottom">
            <table width="150" border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100" valign="bottom" align="center"><input type="button" name="Submit" value="Add New" class="btnNormal" onclick="addNew()"/>
                    </td>
                    <td width="100" valign="bottom" align="center">
                        <% if (stagingFeedGroup.getFeedEntries().length != 0) {%>
                        <input type="button" name="Submit2" value="Remove" class="btnNormal" onclick="remove()"/>
                        <html:errors property="chkDeletes"/>
                        <% } %>
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
                        <td width="6%">S/N</td>
                        <td width="25%">Type</td>
                        <td width="17%">Region</td>
                        <td width="13%"><p>Existing Index</p></td>
                        <td width="12%"><p>Updated Index&nbsp;<font color="#0000FF">* </font></p></td>
                        <td width="13%">Last Updated Date</td>
                        <td width="16%">Delete</td>
                    </tr>
                </thead>
                <tbody>

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
                    <logic:iterate id="feedEntry" name="stagingFeedGroup" property="feedEntries"
                                   offset="<%=String.valueOf(offset)%>"
                                   length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                                   type="com.integrosys.cms.app.feed.bus.propertyindex.IPropertyIndexFeedEntry">
                        <%
                            DefaultLogger.debug(this, "counter is now " + counter.intValue());

                            long ref = feedEntry.getPropertyIndexFeedEntryRef();
                            String originalUnitPrice = "";
                            IPropertyIndexFeedEntry[] entriesArr = actualFeedGroup.getFeedEntries();
                            if (entriesArr != null) {
                                DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
                                for (int i = 0; i < entriesArr.length; i++) {
                                    if (ref == entriesArr[i].getPropertyIndexFeedEntryRef()) {
                                        originalUnitPrice = String.valueOf(entriesArr[i].getUnitPrice());
                                        originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);
                                        DefaultLogger.debug(this, "found staging ref in actual: ref = " + ref);
                                        break;
                                    }
                                }
                            }
                        %>
                        <tr class="<%=cssClass%>">
                            <td class="index" valign="top">
                                <%=counter.intValue() + 1%>
                            </td>
                            <td>&nbsp;
                                <integro:empty-if-null value="<%=feedEntry.getType()%>"/>
                            </td>
                            <td>&nbsp;
                                <integro:empty-if-null value="<%=feedEntry.getRegion()%>"/>
                            </td>
                            <td class="amount">&nbsp;
                                <integro:empty-if-null value="<%=originalUnitPrice%>"/>
                            </td>
                            <td class="amount">
                                <input name="updatedUnitPrices" type="text"
                                       value="<%=FeedUtils.padFractionDigits(actionForm.getUpdatedUnitPrices(counter.intValue()-offset), 1, 2)%>"
                                       size="14" class="currency" maxlength="15"/>
                                <html:errors property="<%=\"updatedUnitPrices.\"+String.valueOf(counter.intValue() - offset)%>"/>
                            </td>
                            <td style="text-align:center">&nbsp;
                                <integro:date object="<%=feedEntry.getLastUpdatedDate()%>"/>
                            </td>
                            <td style="text-align:center">
                                <input type="checkbox" name="chkDeletes"
                                        <%=PropertyIndexListMapper.inArray(counter.intValue(), deletesArr) ? "checked" : ""%>
                                       value="<%=counter.intValue()%>"/>
                            </td>
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
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td width="100" valign="baseline" align="center">
            <a href="#" onclick="submitForm()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3','','img/submit2.gif',1)">
                <img src="img/submit1.gif" name="Image3" width="75" height="22" border="0" id="Image3"/>
            </a>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="#" onclick="save()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/save2.gif',1)">
                <img src="img/save1.gif" name="Image3311" width="75" height="22" border="0" id="Image331"/>
            </a>
        </td>
        <td width="75" valign="baseline" align="center">
            <%
                if (feedGroupTrxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
                        feedGroupTrxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
            %>
            <a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image3311" border="0" id="Image331"/>
            </a>
            <% } else { %>
            <a href="#" onclick="cancel()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)">
                <img src="img/cancel1.gif" name="Image3311" border="0" id="Image331"/>
            </a>
            <% } %>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
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
                    <integro:pageindex pageIndex="<%=new PageIndex(offset, length, stagingFeedGroup.getFeedEntries().length)%>"
                                       url="feed_property_index_list.do" submitFlag="true"/>
                </td>
            </tr>
        </table>
    </td>
</tr>
</table>
</body>
</html>
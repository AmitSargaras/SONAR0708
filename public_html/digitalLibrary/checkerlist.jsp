<%@ page import="com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.cms.ui.feed.bond.item.BondItemAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.bond.IBondFeedEntry,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@page import="com.integrosys.cms.ui.feed.stock.list.StockListAction"%>
<%@page import="com.integrosys.cms.ui.digitalLibrary.DigitalLibraryAction"%>
<%@page import="com.integrosys.cms.ui.digitalLibrary.DigitalLibraryForm"%>
<%@page import="com.integrosys.cms.app.digitalLibrary.trx.IDigitalLibraryTrxValue"%>
<%@page import="com.integrosys.cms.app.digitalLibrary.bus.IDigitalLibraryGroup"%>
<%@page import="com.integrosys.cms.app.digitalLibrary.bus.IDigitalLibraryEntry"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%>
<%@page import="com.integrosys.cms.ui.limit.CategoryCodeConstant"%>
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
    document.forms[0].event.value = "<%=DigitalLibraryAction.EVENT_ADD%>";
    document.forms[0].submit();
}
function remove() {
    document.forms[0].event.value = "<%=DigitalLibraryAction.EVENT_REMOVE%>"
    document.forms[0].submit();
}
function submitForm() {
    document.forms[0].event.value = "<%=DigitalLibraryAction.EVENT_SUBMIT%>"
    document.forms[0].submit();
}
function goPageIndex(targetOffset) {
    document.forms[0].event.value = "<%=DigitalLibraryAction.EVENT_PAGINATE%>"
    document.forms[0].targetOffset.value = targetOffset;
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

<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
<td valign="top">

<%
    DigitalLibraryForm actionForm = (DigitalLibraryForm) pageContext.findAttribute("digitalLibraryForm");

    String event = actionForm.getEvent();

    // Get the bond feed group trx value from session.
    IDigitalLibraryTrxValue feedGroupTrxValue = (IDigitalLibraryTrxValue) session.getAttribute("com.integrosys.cms.ui.digitalLibrary.DigitalLibraryAction.digitalLibraryTrxValue");

    IDigitalLibraryGroup stagingFeedGroup = null;

    //if (DigitalLibraryAction.EVENT_READ.equals(event) ||
    //            DigitalLibraryAction.EVENT_REMOVE.equals(event) ||
    //            DigitalLibraryAction.EVENT_SAVE_AND_LIST.equals(event)) {
    stagingFeedGroup = feedGroupTrxValue.getStagingDigitalLibraryGroup();

    IDigitalLibraryGroup actualFeedGroup = feedGroupTrxValue.getDigitalLibraryGroup();

    //} else {
    //    stagingFeedGroup = feedGroupTrxValue.getStagingDigitalLibrary();
    //}

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

    int totalEntries = stagingFeedGroup.getFeedEntries().length;

    // Get the record markers.
    int offset = ((Integer) session.getAttribute( "com.integrosys.cms.ui.digitalLibrary.DigitalLibraryAction.offset")).intValue();
    int length = ((Integer) session.getAttribute( "com.integrosys.cms.ui.digitalLibrary.DigitalLibraryAction.length")).intValue();

    int rowIdx = 0;

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

%>

<html:form action="digital_library_list.do">
<input type="hidden" name="event"/>
<input type="hidden" name="targetOffset" value="<%=offset%>"/>


<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
<thead>
    <tr>
        <td height="34"><h3>Update Digital Library Document Category Mapping</h3></td>
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
        <td width="20%">CLIMS Document Category</td>
        <td width="20%">Digital Library Document Category</td>
        
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
                   type="com.integrosys.cms.app.digitalLibrary.bus.IDigitalLibraryEntry">
        <%
            //DefaultLogger.debug(this, "counter is now " + counter.intValue());
            long ref = feedEntry.getDigitalLibraryEntryRef();
            String originalUnitPrice = "";
            IDigitalLibraryEntry[] entriesArr = actualFeedGroup.getFeedEntries();
            /*if (entriesArr != null) {
                //DefaultLogger.debug(this, "number of actual feed entries = " + entriesArr.length);
                for (int i = 0; i < entriesArr.length; i++) {
                    if (ref == entriesArr[i].getDigitalLibraryEntryRef()) {
                        originalUnitPrice = String.valueOf(entriesArr[i].getUnitPrice());
                        originalUnitPrice = FeedUtils.padFractionDigits(originalUnitPrice, 1, 2);
                        //DefaultLogger.debug(this, "found staging ref in actual: ref = " + ref);
                        break;
                    }
                }
            }*/

        %>
        <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
            <td class="index" valign="top"><%=counter.intValue() + 1%></td>
            <td>&nbsp;
           <%--  <%=feedEntry.getClimsDocCategory()%> --%>
             <html:textarea disabled="true" rows="3" cols="100" property="climsDocCategory" value="<%=feedEntry.getClimsDocCategory() %>"></html:textarea>
            </td>
            <td>&nbsp;
		         <integro:common-code-single categoryCode="<%=CategoryCodeConstant.DIGITAL_LIBRARY_DOCUMENT_CATEGORY_CODE %>" 
			     entryCode="<%=feedEntry.getDigiLibDocCategory()%>"  display="true" descWithCode="false"/>
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
            <a href="#" onclick="goBack()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
           <img src="img/cancel1.gif" name="Image1"  id="Image1" />
            </a>
        </td>
       
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
                            url="digital_library_list.do" submitFlag="true"/>
                </td>
            </tr>
        </table>
    </td>
</tr>

</table>


</body>
</html>
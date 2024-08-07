<%@ page import="com.integrosys.cms.app.feed.bus.bond.IBondFeedGroup,com.integrosys.cms.app.feed.trx.bond.IBondFeedGroupTrxValue,com.integrosys.cms.ui.common.CurrencyList,java.util.HashMap,com.integrosys.cms.ui.feed.bond.list.BondListForm,com.integrosys.cms.ui.feed.bond.list.BondListAction,com.integrosys.cms.ui.feed.bond.item.BondItemAction,com.integrosys.base.techinfra.logger.DefaultLogger,java.util.Enumeration,com.integrosys.cms.app.common.constant.ICMSConstant,com.integrosys.cms.app.feed.bus.bond.IBondFeedEntry,com.integrosys.base.techinfra.diff.CompareOBUtil,java.util.List,com.integrosys.base.techinfra.util.DateUtil,com.integrosys.base.uiinfra.tag.PageIndex,com.integrosys.cms.ui.feed.FeedUtils" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
	// Get the bond feed group trx value from session.
	IGeneralParamGroupTrxValue feedGroupTrxValue = (IGeneralParamGroupTrxValue) session
			.getAttribute("com.integrosys.cms.ui.generalparam.GeneralParamListAction.generalParamGroupTrxValue");
	String lastActionBy = feedGroupTrxValue.getUserInfo();
	String lastRemarksMade = feedGroupTrxValue.getRemarks();
	if (lastRemarksMade == null) {
		lastRemarksMade = "";
	}

	String status = feedGroupTrxValue.getStatus();
	boolean forApproveAndReject = status
			.equals(ICMSConstant.STATE_PENDING_UPDATE);
	//boolean forClose = status.equals(ICMSConstant.STATE_REJECTED);

	// Get the staging feed group.
	IGeneralParamGroup stagingFeedGroup = feedGroupTrxValue
			.getStagingGeneralParamGroup();
	// Get the actual feed group.
	IGeneralParamGroup actualFeedGroup = feedGroupTrxValue
			.getGeneralParamGroup();

	pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);

	GeneralParamListForm actionForm = (GeneralParamListForm) pageContext
			.findAttribute("generalParamListForm");

	if (actionForm == null) {
		DefaultLogger.debug(this, "actionForm is null.");
	}

	String event = actionForm.getEvent();
	if (event
			.equals(GeneralParamListAction.EVENT_READ_CHECKER_APPROVE_REJECT)) {
		event = GeneralParamListAction.EVENT_LIST_CHECKER_APPROVE_REJECT;
	} else if (event
			.equals(GeneralParamListAction.EVENT_READ_MAKER_CLOSE)) {
		event = GeneralParamListAction.EVENT_LIST_MAKER_CLOSE;
	}

	// Get the record markers.
	int offset = ((Integer) session
			.getAttribute("com.integrosys.cms.ui.generalparam.GeneralParamListAction.offset"))
			.intValue();
	int length = ((Integer) session
			.getAttribute("com.integrosys.cms.ui.generalparam.GeneralParamListAction.length"))
			.intValue();

	String cssClass = "odd";

	List compareResultsList = (List) session
			.getAttribute("com.integrosys.cms.ui.generalparam.GeneralParamListAction.compareResultsList");
	pageContext.setAttribute("compareResultsList", compareResultsList);

	int totalEntries = compareResultsList.size();

%>



<%@page import="com.integrosys.cms.app.generalparam.trx.IGeneralParamGroupTrxValue"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamGroup"%>
<%@page import="com.integrosys.cms.app.generalparam.bus.IGeneralParamEntry"%>
<%@page import="com.integrosys.cms.ui.generalparam.GeneralParamListForm"%>
<%@page import="com.integrosys.cms.ui.generalparam.GeneralParamListAction"%><html><!-- InstanceBegin template="/Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
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
document.forms[0].event.value = "<%=GeneralParamListAction.EVENT_APPROVE%>"
document.forms[0].submit();
}
function reject() {
document.forms[0].event.value = "<%=GeneralParamListAction.EVENT_REJECT%>"
document.forms[0].submit();
}
function closeForm() {
document.forms[0].event.value = "<%=GeneralParamListAction.EVENT_CLOSE%>"
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

<html:form action="general_param_list.do">
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
        <td height="34"><h3>Process GeneralParam</h3></td>
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
                    <td width="4%">S/N</td>
					<td width="7%">Param Code</td>
					<td width="20%">Param Name</td>
					<td width="9%">Param Value</td>
					<td width="9%">Last Updated Date</td>
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
                	IGeneralParamEntry feedEntry = (IGeneralParamEntry) result
                					.getObj();

                			String originalUnitPrice = null;

                			if (result.isAdded()) {
                				originalUnitPrice = "";
                			} else if (result.isModified()) {
                				// Get the original value from the original obj.
                				originalUnitPrice = String
                						.valueOf(((IGeneralParamEntry) result
                								.getOriginal()).getParamValue());
                			} else if (result.isUnmodified()) {
                				// Original value still the same.
                				originalUnitPrice = String.valueOf(feedEntry
                						.getParamValue());
                			} else if (result.isDeleted()) {
                				// The obj is the deleted entry itself, so original should come from that.
                				originalUnitPrice = String.valueOf(feedEntry
                						.getParamValue());
                			}

                			originalUnitPrice = FeedUtils.padFractionDigits(
                					originalUnitPrice, 1, 2);

                			String updatedPrice = FeedUtils.padFractionDigits(String
                					.valueOf(feedEntry.getParamValue()), 1, 2);

                			if (result.isDeleted()) {
                				updatedPrice = "";
                			}
                			if(feedEntry.getUiView().equalsIgnoreCase("Y")){
			                %>
			                <tr class="<%=cssClass%>">
			                    <td class="<%=result.getKey()%>" valign="top"><%=counter.intValue() + 1%></td>
			                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getParamCode()%>"/></td>
			                    <td>&nbsp;<integro:empty-if-null value="<%=feedEntry.getParamName()%>"/></td>
			                    <td>&nbsp;<integro:empty-if-null value="<%= feedEntry.getParamValue()%>"/></td>
			                    <td style="text-align:center">&nbsp;<integro:date object="<%=feedEntry.getLastUpdatedDate()%>"/></td>
			                </tr>
			
			                <%
		               	 	}
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
                    <td class="fieldname">Remarks</td>
                    <td class="odd"><html:textarea property="remarks" rows="4" style="width:90%"/>
                    <BR/>
                        <html:errors property="remarksError"/></td>
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

<%
	if (forApproveAndReject) {
%>
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
<%
	}
%>

</div>
</td>
</tr>

<tr>
    <td>
        <table id="generalPurposeBar" width="100%" style="margin-left:10px" border="0" cellspacing="0"
               cellpadding="5" align="center">

            <tr>
                <td valign="middle">
                    <integro:pageindex pageIndex="<%=new PageIndex(offset, length, compareResultsList.size())%>"
                                       url="feed_mutual_funds_list.do" submitFlag="true"/>
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
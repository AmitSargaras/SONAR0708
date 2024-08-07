<%@ page import="com.integrosys.cms.app.feed.bus.bond.IBondFeedGroup,
                 com.integrosys.cms.app.feed.trx.bond.IBondFeedGroupTrxValue,
                 com.integrosys.cms.ui.common.CurrencyList,
                 java.util.HashMap,
                 com.integrosys.cms.ui.feed.bond.list.BondListForm,
                 com.integrosys.cms.ui.feed.bond.list.BondListAction,
                 com.integrosys.cms.ui.feed.bond.item.BondItemAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.feed.bus.bond.IBondFeedEntry,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.feed.FeedUtils" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%

    // Get the bond feed group trx value from session.
    IApprovalMatrixTrxValue feedGroupTrxValue = (IApprovalMatrixTrxValue) session.getAttribute("com.integrosys.cms.ui.approvalmatrix.ApprovalMatrixAction.approvalMatrixTrxValue");

    String lastActionBy = feedGroupTrxValue.getUserInfo();
    String lastRemarksMade = feedGroupTrxValue.getRemarks();
    if (lastRemarksMade == null) {
        lastRemarksMade = "";
    }

    String status = feedGroupTrxValue.getStatus();
    boolean forApproveAndReject = status.equals(ICMSConstant.STATE_PENDING_UPDATE);
    //boolean forClose = status.equals(ICMSConstant.STATE_REJECTED);

    // Get the staging feed group.
    IApprovalMatrixGroup stagingFeedGroup = feedGroupTrxValue.getStagingApprovalMatrixGroup();
    // Get the actual feed group.
    IApprovalMatrixGroup actualFeedGroup = feedGroupTrxValue.getApprovalMatrixGroup();

    pageContext.setAttribute("stagingFeedGroup", stagingFeedGroup);


	ApprovalMatrixForm actionForm = (ApprovalMatrixForm) pageContext.findAttribute("approvalMatrixForm");

    if (actionForm == null) {
        DefaultLogger.debug(this, "actionForm is null.");
    }

    String event = actionForm.getEvent();
    if (event.equals(ApprovalMatrixAction.EVENT_READ_CHECKER_APPROVE_REJECT)) {
        event = ApprovalMatrixAction.EVENT_LIST_CHECKER_APPROVE_REJECT;
    } else if (event.equals(ApprovalMatrixAction.EVENT_READ_MAKER_CLOSE)) {
        event = ApprovalMatrixAction.EVENT_LIST_MAKER_CLOSE;
    }

    // Get the record markers.
    int offset = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.approvalmatrix.ApprovalMatrixAction.offset")).intValue();
    int length = ((Integer)session.getAttribute(
            "com.integrosys.cms.ui.approvalmatrix.ApprovalMatrixAction.length")).intValue();

    String cssClass = "odd";

    CurrencyList currencyList = CurrencyList.getInstance();


    List compareResultsList = (List) session.getAttribute("com.integrosys.cms.ui.approvalmatrix.ApprovalMatrixAction.compareResultsList");
    pageContext.setAttribute("compareResultsList", compareResultsList);

    int totalEntries = compareResultsList.size();

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

    int rowIdx = 0;
    String rowClass = "index";
%>



<%@page import="com.integrosys.cms.app.approvalmatrix.trx.IApprovalMatrixTrxValue"%>
<%@page import="com.integrosys.cms.app.approvalmatrix.bus.IApprovalMatrixEntry"%>
<%@page import="com.integrosys.cms.app.approvalmatrix.bus.IApprovalMatrixGroup"%>
<%@page import="com.integrosys.cms.ui.approvalmatrix.ApprovalMatrixForm"%>
<%@page import="com.integrosys.cms.ui.approvalmatrix.ApprovalMatrixAction"%>
<%@page import="com.integrosys.cms.ui.common.UIUtil"%><html><!-- InstanceBegin template="/Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
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
document.forms[0].event.value = "<%=ApprovalMatrixAction.EVENT_APPROVE%>"
document.forms[0].submit();
}
function reject() {
document.forms[0].event.value = "<%=ApprovalMatrixAction.EVENT_REJECT%>"
document.forms[0].submit();
}
function closeForm() {
document.forms[0].event.value = "<%=ApprovalMatrixAction.EVENT_CLOSE%>"
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

<html:form action="approval_matrix_list.do">
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
        <td height="34"><h3>Process Approval Matrix</h3></td>
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
			        <td width="20%">Risk Grade</td>
			        <td width="20%">Level 1 </td>
			        <td width="20%">Level 2 </td>
			        <td width="20%">Level 3 </td>
			        <td width="20%">Level 4 </td>
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
                    IApprovalMatrixEntry feedEntry = (IApprovalMatrixEntry) result.getObj();
				
                IApprovalMatrixEntry[] actualFeedEntry = actualFeedGroup.getFeedEntries();
                for(int i = 0; i < actualFeedEntry.length; i++){
                	IApprovalMatrixEntry approvalMatrixEntry = (IApprovalMatrixEntry) actualFeedEntry[i];
            		
            		if(feedEntry.getRiskGrade() == approvalMatrixEntry.getRiskGrade()){
            				if(!(CompareOBUtil.compOB(feedEntry, approvalMatrixEntry, "level1")
    	            				&& CompareOBUtil.compOB(feedEntry, approvalMatrixEntry, "level2")
    	            				&& CompareOBUtil.compOB(feedEntry, approvalMatrixEntry, "level3")
    	            				&& CompareOBUtil.compOB(feedEntry, approvalMatrixEntry, "level4")))	{
            				rowClass = "indexdiff";
            			}else{
            				rowClass = "index";
            			}	
            			
            			break;
            		}else{
            			rowClass = "indexadd";
            		}	
            	}
                
                    String originalUnitPrice = null;
                %>
                <tr class="<%=(rowIdx++)%2==0?"even":"odd"%>">
		            <td class="<%=rowClass.equals("index")?"index":rowClass%>" valign="top"><%=counter.intValue() + 1%></td>
		            <td>&nbsp;<%=feedEntry.getRiskGrade()%><input type="hidden" name="riskGrade" value="<%=feedEntry.getRiskGrade() %>" /></td>
		            <td>&nbsp;<%=UIUtil.formatWithCommaAndDecimal(feedEntry.getLevel1())%></td>
		            <td>&nbsp;<%=UIUtil.formatWithCommaAndDecimal(feedEntry.getLevel2())%></td>
		            <td>&nbsp;<%=UIUtil.formatWithCommaAndDecimal(feedEntry.getLevel3()) %></td>
		            <td>&nbsp;<%=UIUtil.formatWithCommaAndDecimal(feedEntry.getLevel4()) %></td>
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
                    <br/>
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

<%if (forApproveAndReject) {%>
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
<%}%>

<% //if (forClose) {%>
<!--<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
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
</table> -->
<%//}%>

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
                                       url="approval_matrix_list.do" submitFlag="true"/>
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
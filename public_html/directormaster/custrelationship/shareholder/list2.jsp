<%@ page import="com.integrosys.cms.app.custrelationship.bus.ICustShareholder,
                 com.integrosys.cms.app.custrelationship.trx.shareholder.ICustShareholderTrxValue,
                 com.integrosys.cms.app.custrelationship.trx.shareholder.OBCustShareholderTrxValue,
                 java.util.HashMap,
                 java.util.List,
                 com.integrosys.cms.ui.custrelationship.shareholder.ShareHolderListForm,
                 com.integrosys.cms.ui.custrelationship.shareholder.ShareHolderListAction,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 java.util.Enumeration,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.ui.custrelationship.shareholder.ShareHolderListMapper,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.ui.common.constant.ICMSUIConstant,
                 com.integrosys.cms.ui.custrelationship.CustRelUtils,
                 com.integrosys.cms.ui.custrelationship.CustRelConstants,
                 com.integrosys.cms.ui.common.CountryList" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%
    // Get the forex feed group trx value from session.
    ICustShareholderTrxValue custShareHolderTrxValue = (ICustShareholderTrxValue) session.
    	getAttribute("com.integrosys.cms.ui.custrelationship.CustRelAction.CustShareHolderTrxValue");
	
	String lastActionBy = custShareHolderTrxValue.getUserInfo();
    String lastRemarksMade = custShareHolderTrxValue.getRemarks();
    if (lastRemarksMade == null) {
        lastRemarksMade = "";
    }

    String status = custShareHolderTrxValue.getStatus();
    boolean forApproveAndReject = status.equals(ICMSConstant.STATE_PENDING_UPDATE) ||
    								status.equals(ICMSConstant.STATE_PENDING_CREATE);

    // Get the array of cust shareholder.
    ICustShareholder[] stagingCustShareHolderArr = custShareHolderTrxValue.getStagingCustShareholder();
    // Get the array of cust shareholder.
    ICustShareholder[] actualCustShareHolderArr = custShareHolderTrxValue.getCustShareholder();

    //pageContext.setAttribute("stagingCustShareHolderArr", stagingCustShareHolderArr);
    DefaultLogger.debug(this, "stagingCustShareHolderArr : " + stagingCustShareHolderArr);
    
    ShareHolderListForm actionForm = (ShareHolderListForm) pageContext.findAttribute("ShareHolderListForm");

    if (actionForm == null) {
        DefaultLogger.debug(this, "actionForm is null.");
    }
    
    String event = actionForm.getEvent();
    if (event.equals(ShareHolderListAction.EVENT_READ_CHECKER_APPROVE_REJECT)) {
        event = ShareHolderListAction.EVENT_LIST_CHECKER_APPROVE_REJECT;
    } else if (event.equals(ShareHolderListAction.EVENT_READ_MAKER_CLOSE)) {
        event = ShareHolderListAction.EVENT_LIST_MAKER_CLOSE;
    }

    System.out.println("******************");
    
    // Get the record markers.
    //int offset = Integer.parseInt(actionForm.getOffset());
    //int length = Integer.parseInt(actionForm.getLength());
    Integer offsetInt = (Integer)session.getAttribute(
    					"com.integrosys.cms.ui.custrelationship.CustRelAction.offset");
    Integer lengthInt = (Integer)session.getAttribute(
						"com.integrosys.cms.ui.custrelationship.CustRelAction.length");
    //int targetOffset = Integer.parseInt(actionForm.getTargetOffset());
    
    // Get the record markers.
    int offset = (offsetInt != null) ? offsetInt.intValue() : 0;
    int length = (lengthInt != null) ? lengthInt.intValue() : 0;
    
    String cssClass = "odd";

    List compareResultsList = (List) session.getAttribute("com.integrosys.cms.ui.custrelationship.CustRelAction.compareResultsList");
    pageContext.setAttribute("compareResultsList", compareResultsList);

    int totalEntries = compareResultsList.size();

    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

    CommonCodeList commonCode = CommonCodeList .getInstance(null, null, ICMSUIConstant.ENTITY_REL, null);
    
    CommonCodeList commonCodeLeType = CommonCodeList .getInstance(null, null, ICMSUIConstant.COMMON_CODE_REF_LE_ID_TYPE, null);
%>

<html><!-- InstanceBegin template="/Templates/ContentWinLayout.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Untitled Document</title>
    <!-- InstanceEndEditable -->
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <!-- InstanceBeginEditable name="Cssstyle" -->
    <link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

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
document.forms[0].event.value = "<%=ShareHolderListAction.EVENT_APPROVE%>"
document.forms[0].submit();
}
function reject() {
document.forms[0].event.value = "<%=ShareHolderListAction.EVENT_REJECT%>"
document.forms[0].submit();
}
function closeForm() {
document.forms[0].event.value = "<%=ShareHolderListAction.EVENT_CLOSE%>"
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

<html:form action="CRShareHolder.do">
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

<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
<thead>
    <tr>
        <td height="34"><h3>Process Shareholder Information</h3></td>
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
                        <td width="5%"><bean:message key="label.global.sn" /></td>
                        <td width="20%"><bean:message key="label.global.name"/>&nbsp;</td>
                        <td width="9%"><bean:message key="label.group.leid.source"/></td>
                        <td width="8%"><bean:message key="label.customer.id" /></td>
                        <td width="15%"><bean:message key="label.col.owner.id.no" /></td>
                        <td width="12%"><bean:message key="label.cust.relationship.id.country" /></td>
                        <td width="15%"><bean:message key="label.group.percentowned" /></td>
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
	
	            %>                
            	<logic:iterate id="result" name="compareResultsList"
                           indexId="counter"
                           offset="<%=String.valueOf(offset)%>"
                           length="<%=String.valueOf(iterateLength)%>"
                           type="com.integrosys.base.techinfra.diff.CompareResult">                
                 <%
                 ICustShareholder custShareHolder = (ICustShareholder) result.getObj();
					
                 	Double percentageOwn = null;
                    String percentageOwnStr = null;
                    
                    if (result.isAdded()) {
                        percentageOwn = custShareHolder.getPercentageOwn();
                        percentageOwnStr = CustRelUtils.formatDouble("#0.00", percentageOwn);
                    } else if (result.isModified()) {
                        // Get the original value from the original obj.
                        //percentageOwn = ((ICustShareholder) result.getOriginal()).getPercentageOwn();
                        percentageOwn = custShareHolder.getPercentageOwn();
                        percentageOwnStr = CustRelUtils.formatDouble("#0.00", percentageOwn);

                    } else if (result.isUnmodified()) {
                        // Original value still the same.
                        percentageOwn = custShareHolder.getPercentageOwn();
                        percentageOwnStr = CustRelUtils.formatDouble("#0.00", percentageOwn);

                    } else if (result.isDeleted()) {
                    	
                        percentageOwn = custShareHolder.getPercentageOwn();
                        percentageOwnStr = CustRelUtils.formatDouble("#0.00", percentageOwn);
                    }
                    
                    DefaultLogger.debug(this, "counter is now " + counter.intValue());
                    DefaultLogger.debug(this, "ref id of getObj = " + custShareHolder.getCustRelationshipID());
                    
					String customerName = "";
					String sourceId = "";
					String lEReference = "";
					String legalRegNumber = "";
					String legalRegCountry = "";
					
					if (custShareHolder.getCustomerDetails() != null &&
							custShareHolder.getCustomerDetails().getCMSLegalEntity() != null) {
						sourceId = custShareHolder.getCustomerDetails().getCMSLegalEntity().getSourceID();
						sourceId = (sourceId == null) ? "" : commonCodeLeType.getCommonCodeLabel(sourceId);
						
						customerName = custShareHolder.getCustomerDetails().getCustomerName();
						lEReference = custShareHolder.getCustomerDetails().getCMSLegalEntity().getLEReference();
						legalRegNumber = custShareHolder.getCustomerDetails().getCMSLegalEntity().getLegalRegNumber();
						legalRegCountry = custShareHolder.getCustomerDetails().getCMSLegalEntity().getLegalRegCountry();
					}
                    
                %>
                    <tr class="<%=cssClass%>">
                        <td class="<%=result.getKey()%>" valign="top"><%=counter.intValue() + 1%></td>
                        <td>&nbsp;<integro:empty-if-null value="<%=customerName%>"/></td>
                        <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=sourceId%>" /></td>
                        <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=lEReference%>" /></td>
                        <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=legalRegNumber%>" /></td>
                        
                        <%
                            String cty = null;
                            if (!(legalRegCountry == null || legalRegCountry.equals(""))) {
                                cty = CountryList.getInstance().getCountryName(legalRegCountry);
                            }
                        %> 
                        
                        <td style="text-align:center">&nbsp;<integro:empty-if-null value="<%=cty%>"/></td>
                        <td class="amount">&nbsp;<integro:empty-if-null value="<%=percentageOwnStr%>" /></td>                        
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
	<tr>
        <td colspan="2">&nbsp;</td>
    </tr>
<tr>
    <td>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
            <tbody>
                <tr>
                    <td class="fieldname">Remarks</td>
                    <td class="odd"><html:textarea property="remarks" style="width:90%"/>
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

<%if (forApproveAndReject) { %>
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
                                       url="CRShareHolder.do" submitFlag="true"/>
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
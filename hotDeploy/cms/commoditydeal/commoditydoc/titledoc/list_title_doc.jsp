<!--Modified by Pratheepa for CR129-->
<%@ page import="com.integrosys.cms.ui.commoditydeal.commoditydoc.CommDocAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.TitleDocAction,
                 java.util.Collection,
                 com.integrosys.cms.app.commodity.deal.bus.doc.ICommodityTitleDocument,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.ITitleDocument,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList,
                 com.integrosys.base.techinfra.diff.CompareResult,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.ProcessStageList,
                 com.integrosys.cms.app.common.constant.ICMSConstant"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/titledoc/list_title_doc.jsp,v 1.12 2006/10/27 08:39:09 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.12 $
* Date: $Date: 2006/10/27 08:39:09 $
* Tag: $Name:  $
*/
%>
<%
    Collection nonNegTitleDoc = (Collection)request.getAttribute("nonNegTitleDoc");
    Collection negTitleDoc = (Collection)request.getAttribute("negTitleDoc");
    String from_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.from_event");
//    boolean isProcess = false;
    boolean isEditable = false;
/*
    if (from_event.equals(TitleDocAction.EVENT_PROCESS)) {
        isProcess = true;
*/
    if (from_event.equals(TitleDocAction.EVENT_PREPARE_UPDATE) ||
            from_event.equals(TitleDocAction.EVENT_PROCESS_UPDATE) ||
            from_event.equals(TitleDocAction.EVENT_PREPARE_ADD_DEAL)) {
        isEditable = true;
    }
/*
    ICommodityTitleDocument actualTitleDoc = null;
    ICommodityTitleDocument stageTitleDoc = null;
    if (isProcess) {
        actualTitleDoc = (ICommodityTitleDocument)request.getAttribute("actualWRTitleDoc");
        stageTitleDoc = (ICommodityTitleDocument)request.getAttribute("stagingWRTitleDoc");
    }
*/
    ProcessStageList processStageList = ProcessStageList.getInstance();
%>
<html>



<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
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

function viewItem(index) {
    document.forms[0].event.value="<%=TitleDocAction.EVENT_READ%>";
    document.forms[0].indexID.value = index;
    document.forms[0].submit();
}

function editItem(index) {
    document.forms[0].event.value="<%=TitleDocAction.EVENT_PREPARE_UPDATE_SUB%>";
    document.forms[0].indexID.value = index;
    document.forms[0].submit();
}

function returnPage(strEvent) {
    document.forms[0].event.value = strEvent;
    document.forms[0].return_page.value = "";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/return2.gif')">
<html:form action="TitleDoc.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=TitleDocAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="return_page" value="<%=CommDocAction.EVENT_LIST_TITLE_DOC%>"/>
<input type="hidden" name="next_page"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="77%">
      <h3>Title Documents - Non-Negotiable</h3>
    </td>
    <td valign="bottom" colspan="2">
      <table width="80"  border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="80" valign="baseline" align="center">&nbsp; </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="7%">S/N</td>
          <td width="8%">Date of Transaction</td>
          <td width="12%">Process Stage</td>
          <td width="31%">Documentation Description</td>
          <td width="9%">Eligibility of Advance (%)</td>
          <td width="8%">Document No.</td>
          <td width="12%">Secured Status</td>
          <td width="13%" class="tblInput">Action</td>
        </tr>
        </thead>
        <tbody>
        <%
            ICommodityTitleDocument[] titleDocList = null;
            
            if (nonNegTitleDoc != null) {
            	System.out.println("Non-neg length:" +nonNegTitleDoc.size());
                titleDocList = (ICommodityTitleDocument[])nonNegTitleDoc.toArray(new ICommodityTitleDocument[0]);
            }
            if (titleDocList == null || titleDocList.length == 0) {
        %>
        <tr class="odd"><td colspan="8">There is no Non-Negotiable Title Document.</td></tr>
        <%
            } else {
                for (int i = 0; i < titleDocList.length; i++) {
                    ICommodityTitleDocument titleDocObj = titleDocList[i];
                    ITitleDocument titleDocType = titleDocObj.getTitleDocType();
                    boolean isTitleDocWR_NN = false;
                    
                    String key = "index";
/*
                    if (isProcess && titleDocType.getName().equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT)) {
                        ICommodityTitleDocument[] actualList = new ICommodityTitleDocument[1];
                        actualList[0] = actualTitleDoc;
                        ICommodityTitleDocument[] stageList = new ICommodityTitleDocument[1];
                        stageList[0] = stageTitleDoc;
                        List res = CompareOBUtil.compOBArray(stageList,actualList);
                        if (res != null) {
                            CompareResult compResult = (CompareResult)res.get(0);
                            key = compResult.getKey();
                        }
                    }
*/
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="<%=key%>" style="text-align:center" width="7%"><%=i + 1%></td>
          <td style="text-align:center" width="11%"><integro:date object="<%=titleDocObj.getTransactionDate()%>"/></td>
          <td style="text-align:center" width="11%"><integro:empty-if-null value="<%=processStageList.getProcessStageItem(titleDocObj.getProcessStageCode())%>"/></td>
          <td width="25%">
          <%        String docDesc = null;
                    if (titleDocType != null) {
                        docDesc = titleDocType.getName();
                        if (docDesc.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT)){
                                isTitleDocWR_NN = true;
                        }
                    }
          %>
            <integro:empty-if-null value="<%=docDesc%>"/>
          </td>
          <td width="10%" style="text-align:center">
            <%=titleDocObj.getAdvEligibilityPct() >=0 ?String.valueOf((int)titleDocObj.getAdvEligibilityPct()):"-"%>
          </td>
          <td style="text-align:center" width="13%">
          <%
                    String documentNo = null;
                    if (titleDocType != null && titleDocType.getName() != null) {
                    	String docName = titleDocType.getName();
                        if ((docName.equals(CommodityDealConstant.DOC_TYPE_BILL_LADING))||
                           (docName.equals(CommodityDealConstant.DOC_TYPE_BILL_LADING_N))){
                            documentNo = titleDocObj.getBLNo();
                        } else if ((docName.equals(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT))||
                                  (docName.equals(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT_NN))){
                            documentNo = titleDocObj.getTRNo();
                        } else if ((!(docName.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT)))||
                                  (!(docName.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT_N)))) {
                            documentNo = titleDocObj.getOtherDocNo();
                        }
                    }
          %>
          <integro:empty-if-null value="<%=documentNo%>"/>&nbsp;
          </td>
          <td style="text-align:center" width="13%">
          <%        String isSecured = "No";
                    if (titleDocObj.getIsSecured() != null &&
                            titleDocObj.getIsSecured().equals(ICMSConstant.TRUE_VALUE)) {
                        isSecured = "Yes";
                    }
          %>
          <%=isSecured%>
          </td>
          <td style="text-align:center" width="15%">
          <%
                    if (isTitleDocWR_NN && isEditable) {
          %>
              <a href="javascript:editItem(<%=titleDocObj.getRefID()%>)">
              View/Edit</a>
          <% } else { %>
              <a href="javascript:viewItem(<%=titleDocObj.getRefID()%>)">
              View</a>
          <% } %>
          </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td>
      <h3>Title Documents - Negotiable</h3>
    </td>
    <td valign="bottom">
      <table width="80"  border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="80" valign="baseline" align="center">&nbsp; </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="22" colspan="2">
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="7%">S/N</td>
          <td width="8%">Date of Transaction </td>
          <td width="13%">Process Stage</td>
          <td width="30%">Documentation Description</td>
          <td width="9%">Eligibility of Advance (%)</td>
          <td width="8%">Document No.</td>
          <td width="12%">Secured Status</td>
          <td width="13%" class="tblInput">Action</td>
        </tr>
        </thead>
        <tbody>
        <%
            titleDocList = null;
            
            if (negTitleDoc != null) {
            	System.out.println("Neg length:" +negTitleDoc.size());
                titleDocList = (ICommodityTitleDocument[])negTitleDoc.toArray(new ICommodityTitleDocument[0]);
            }
            if (titleDocList == null || titleDocList.length == 0) {
        %>
        <tr class="odd"><td colspan="8">There is no Negotiable Title Document.</td></tr>
        <%
            } else {
                for (int i = 0; i < titleDocList.length; i++) {
                    ICommodityTitleDocument titleDocObj = titleDocList[i];
                    ITitleDocument titleDocType = titleDocObj.getTitleDocType();
                    boolean isTitleDocWR_N = false;
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" style="text-align:center" width="7%"><%=i + 1%></td>
          <td style="text-align:center" width="11%"><integro:date object="<%=titleDocObj.getTransactionDate()%>"/></td>
          <td style="text-align:center" width="11%"><integro:empty-if-null value="<%=processStageList.getProcessStageItem(titleDocObj.getProcessStageCode())%>"/></td>
          <td width="25%">
          
          <%     String docDesc = null;
	      if (titleDocType != null) {
		  docDesc = titleDocType.getName();
		  if (docDesc.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT_N)){
		      isTitleDocWR_N= true;
		  }
	      }
          %>
            <integro:empty-if-null value="<%=docDesc%>"/>
          </td>
          <td width="10%" style="text-align:center">
            <%=titleDocObj.getAdvEligibilityPct() >=0 ?String.valueOf((int)titleDocObj.getAdvEligibilityPct()):"-"%>
          </td>
          <td style="text-align:center" width="13%">
          <%
                    String documentNo = null;
                    if (titleDocType != null && titleDocType.getName() != null) {
                    	String titleDocName = titleDocType.getName();
                        if ((titleDocName.equals(CommodityDealConstant.DOC_TYPE_BILL_LADING))||
                           (titleDocName.equals(CommodityDealConstant.DOC_TYPE_BILL_LADING_N))){
                            documentNo = titleDocObj.getBLNo();
                        } else if ((titleDocName.equals(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT))||
                                  (titleDocName.equals(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT_NN))){
                            documentNo = titleDocObj.getTRNo();
                        } else if ((!(titleDocName.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT)))||
                                  (!(titleDocName.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT_N)))){
                            documentNo = titleDocObj.getOtherDocNo();
                        }
                    }
          %>
          <integro:empty-if-null value="<%=documentNo%>"/>&nbsp;
          </td>
          <td style="text-align:center" width="13%">
          <%        String isSecured = "No";
                    if (titleDocObj.getIsSecured() != null &&
                            titleDocObj.getIsSecured().equals(ICMSConstant.TRUE_VALUE)) {
                        isSecured = "Yes";
                    }
          %>
          <%=isSecured%>
          </td>
          <td style="text-align:center" width="15%">
	            <%
	                      if (isTitleDocWR_N && isEditable) {
	            %>
	                <a href="javascript:editItem(<%=titleDocObj.getRefID()%>)">
	                View/Edit</a>
	            <% } else { %>
	                <a href="javascript:viewItem(<%=titleDocObj.getRefID()%>)">
	                View</a>
	            <% } %>
          </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
      </table>
    </td>
  </tr></tbody>
</table>

<table width="83" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="83">&nbsp;</td>
  </tr>
  <tr>
    <%
        if (from_event.equals(CommodityDealAction.EVENT_PREPARE_ADD_DEAL) ||
                from_event.equals(CommodityDealAction.EVENT_PREPARE_UPDATE) ||
                from_event.equals(CommodityDealAction.EVENT_PROCESS_UPDATE)) {
    %>
    <td><a href="javascript:returnPage('<%=TitleDocAction.EVENT_CANCEL%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
    <%
        } else {
    %>
    <td><a href="javascript:returnPage('<%=TitleDocAction.EVENT_VIEW_RETURN%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1" width="70" height="22" border="0" id="Image1" /></a></td>
    <% } %>
  </tr>
  <tr>
    <td style="text-align:center" width="83">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

<!--Modified by Pratheepa for CR129-->
<%@ page import="com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.CommDocAction,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.CommDocForm,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.commodity.deal.bus.doc.IFinancingDoc,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.financingdoc.SalesDocTypeList,
                 com.integrosys.cms.app.commodity.deal.bus.doc.ICommodityTitleDocument,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.ITitleDocument,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.ProcessStageList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/commodity_doc_view.jsp,v 1.20 2006/11/20 09:07:20 jzhan Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: jzhan $<br>
* @version $Revision: 1.20 $
* Date: $Date: 2006/11/20 09:07:20 $
* Tag: $Name: DEV_20061123_B286V1 $
*/
%>
<%
    CommDocForm aForm = (CommDocForm)request.getAttribute("CommodityDocForm");
    String from_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.from_event");
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    ICommodityDeal dealObj;
    
    if (from_event.equals(CommDocAction.EVENT_READ)) {
        dealObj = trxValue.getCommodityDeal();
    } else {
        dealObj = trxValue.getStagingCommodityDeal();
    }
    System.out.println("DealObj:" +dealObj);
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

function submitPage(num) {

    if (num == 1) {
        document.forms[0].action = "CommodityDeal.do";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_LIST%>";
    }
    if (num == 2) {
        document.forms[0].action="CommDealSearch.do";
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_LIST%>";
        document.forms[0].dealNo.value="<%=dealObj.getDealNo()%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=CommDocAction.EVENT_LIST_TITLE_DOC%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=CommDocAction.EVENT_VIEW_SECURITY_DOC%>";
    }
    if (num == 5) {
        document.forms[0].action="CommodityDeal.do";
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_LIST_CLOSED%>";
    }
    document.forms[0].submit();
}

function viewItem(index, type) {
    document.forms[0].event.value = type+"_"+"<%=CommDocAction.EVENT_VIEW%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/return2.gif','img/cancel2.gif')">
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<html:form action="CommodityDoc.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=CommDocAction.EVENT_FORWARD%>">
<input type="hidden" name="indexID"/>
<input type="hidden" name="return_page" value="<%=CommDocAction.EVENT_MAIN_PAGE%>"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="dealNo"/>
<%
    String collateralID = (dealObj.getCollateralID() > 0)?String.valueOf(dealObj.getCollateralID()):"";
%>
<input type="hidden" name="securityID" value="<%=collateralID%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <thead>
  <tr>
    <td>
      <h3>Financing Documents</h3>
    </td>
    <td valign="bottom">
    </td>
  </tr>
  <tr>
    <td height="22" colspan="2">
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
            <td width="3%">S/N</td>
            <td width="15%">Sales Document Description</td>
            <td width="10%">Sales Document No.</td>
            <td width="8%">Expiry Date</td>
            <td width="10%">Export LC Issuing Bank</td>
            <td width="8%">LC Reference</td>
            <td width="8%">LC Expiry Date</td>
            <td width="8%">Due Date to Receive Letters of Credit</td>
            <td width="14%" class="tblInput">Counter-Party</td>
            <td width="16%" class="tblInput">Action</td>
        </tr>
        </thead>
        <tbody>
        <%
            IFinancingDoc[] finDocList = dealObj.getFinancingDocs();
            SalesDocTypeList docTypeList = SalesDocTypeList.getInstance();
            if (finDocList == null || finDocList.length == 0) {
        %>
        <tr class="odd"><td colspan="10">There is no Financng Document.</td></tr>
        <%
            } else {
                for (int i = 0; i < finDocList.length; i++) {
                    IFinancingDoc finDocObj = finDocList[i];
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" style="text-align:center" width="3%"><%=i + 1%></td>
          <td width="15%"><integro:empty-if-null value="<%=docTypeList.getSalesDocTypeItem(finDocObj.getDocTypeCode())%>"/>&nbsp;</td>
          <td style="text-align:center" width="10%"><integro:empty-if-null value="<%=finDocObj.getDocumentNo()%>"/>&nbsp;</td>
          <td width="8%" style="text-align:center">
          <% if (finDocObj.getOrderExpDate() != null) { %>
          <integro:date object="<%=finDocObj.getOrderExpDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="10%"><integro:empty-if-null value="<%=finDocObj.getBankName()%>"/>&nbsp;</td>
          <td style="text-align:center" width="8%"><integro:empty-if-null value="<%=finDocObj.getLCRefNo()%>"/>&nbsp;</td>
          <td style="text-align:center" width="8%">
          <% if (finDocObj.getLCExpDate() != null) { %>
          <integro:date object="<%=finDocObj.getLCExpDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="8%">
          <% if (finDocObj.getLOCDueDate() != null) { %>
              <integro:date object="<%=finDocObj.getLOCDueDate()%>"/>
          <% } else { %> - <% } %>&nbsp;
          </td>
          <td style="text-align:center" width="14%"><integro:empty-if-null value="<%=finDocObj.getCounterParty()%>"/>&nbsp;</td>
          <td style="text-align:center" width="16%">
            <a href="javascript:viewItem(<%=i%>, '<%=CommodityDealConstant.FINANCING_DOCUMENT%>')">View</a>
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
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td> <h3>Document Status Confirmation </h3></td>
    </tr>
    <tr>
      <td><hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="even">
              <td width="77%" class="fieldname">Confirmation that necessary cash
                pledge/set-off document&nbsp;<font color="#0000FF">* </font></td>
              <td width="23%">
              <%  String isPledgeRequired = null;
                  if (dealObj.getIsPledgeDocumentRequired() != null) {
                      if (dealObj.getIsPledgeDocumentRequired().equals(ICMSConstant.TRUE_VALUE)) {
                          isPledgeRequired = "Yes";
                      } else if (dealObj.getIsPledgeDocumentRequired().equals(ICMSConstant.FALSE_VALUE)) {
                          isPledgeRequired = "No";
                      }
                  }
              %>
              <integro:empty-if-null value="<%=isPledgeRequired%>"/>
              </td>
            </tr>
            <tr class="odd">
            <td width="77%" class="fieldname">SCC Issued</td>
            <td width="23%">
                <%  boolean isIssued = false;
                    if (aForm.getSccIssuedDate() != null && aForm.getSccIssuedDate().length() > 0) {
                        isIssued = true;
                    }
                %>
                <integro:boolean-display style="yn" value="<%=isIssued%>"/>
            </td>
            </tr>
            <tr class="even">
            <td width="77%" class="fieldname">Date Issued</td>
            <td width="23%"><bean:write name="CommodityDocForm" property="sccIssuedDate"/>&nbsp;</td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <tr>
    <td width="77%">&nbsp;</td>
    <td align="right" valign="bottom" width="23%">&nbsp;</td>
  </tr>
  <thead>
  <tr>
    <td width="77%">
      <h3>Security Document List - Completed Documents</h3>
    </td>
    <td align="right" valign="bottom" width="23%">
      <input name="Submit4" type="button" class="btnNormal" value="View Security Documents" onclick="submitPage(4)"/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <hr/>
    </td>
  </tr>
  <tr>
    <td colspan="2">Click on 'View Security Documents' to view all the security
      documents.</td>
  </tr>
  </thead> <tbody> </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="53%">
      <h3>Title Documents</h3>
    </td>
    <td valign="bottom" colspan="2" width="47%">
      <table width="160"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
          <td width="160" valign="baseline" align="center">
            <input name="Submit" type="button" class="btnNormal" value="View Historical Documents" onClick="submitPage(3)"/>
          </td>
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
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="11%">Date of Transaction</td>
          <td width="11%">Process Stage</td>
          <td width="25%">Documentation Description</td>
          <td width="10%">Eligibility of Advance (%)</td>
          <td width="13%">Document No.</td>
          <td width="13%">Secured Status</td>
          <td width="15%" class="tblInput">Action</td>
        </tr>
        </thead>
        <tbody>
        <%
            ProcessStageList processStageList = ProcessStageList.getInstance();
            ICommodityTitleDocument[] latestTitleDoc = null;  
            latestTitleDoc = dealObj.getTitleDocsLatest();
            if (latestTitleDoc == null || latestTitleDoc.length == 0) {
        %>
        <tr class="odd"><td colspan="7">There is not Title Document.</td></tr>
        <%
            } else {
                for (int i = 0; i < latestTitleDoc.length; i++) {
                    ICommodityTitleDocument titleDocObj = latestTitleDoc[i];
                    ITitleDocument titleDocType = titleDocObj.getTitleDocType();
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td style="text-align:center" width="11%"><integro:date object="<%=titleDocObj.getTransactionDate()%>"/></td>
          <td style="text-align:center" width="11%"><integro:empty-if-null value="<%=processStageList.getProcessStageItem(titleDocObj.getProcessStageCode())%>"/></td>
          <td width="25%">
          <%        String docDesc = null;
                    if (titleDocType != null) {
                        docDesc = titleDocType.getName();
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
                                  (!(docName.equals(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT_N)))){
                            documentNo = titleDocObj.getOtherDocNo();
                        }
                    }
          %>
          <integro:empty-if-null value="<%=documentNo%>"/>
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
              <a href="javascript:viewItem(<%=i%>, '<%=CommodityDealConstant.TITLE_DOCUMENT%>')">
              View</a>
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
<%
    if (!from_event.equals(CommDocAction.EVENT_USER_PROCESS)) {
%>
<table width="82" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <%
        if (from_event.equals(CommDocAction.EVENT_PREPARE_CLOSE)) {
    %>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%  } else if (from_event.equals(CommDocAction.EVENT_TRACK)) { %>
    <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
        } else {
            String previous_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.previous_event");
            if (previous_event.equals(CommDocAction.EVENT_LIST)) {
    %>
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } else if (previous_event.equals(GeneralInfoAction.EVENT_LIST_CLOSED)) { %>
        <td colspan="2"><a href="javascript:submitPage(5)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
            } else {                
    %>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } } %>

  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
<% } %>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd -->
</html>

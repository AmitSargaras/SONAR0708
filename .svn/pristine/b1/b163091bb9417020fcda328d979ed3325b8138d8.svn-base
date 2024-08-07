<!--Modified by Pratheepa for CR129-->
<%@ page import="com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.TitleDocAction,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.TitleDocForm,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.warehouse.TitleDocWarehouseAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commodity.deal.bus.doc.ICommodityTitleDocument,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.ITitleDocument,
                 com.integrosys.cms.app.commodity.deal.bus.doc.IWarehouseReceipt,
                 com.integrosys.cms.app.commodity.deal.bus.doc.WarehouseReceiptComparator,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.ProcessStageList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/titledoc/view_title_doc.jsp,v 1.18 2006/10/27 08:39:09 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.18 $
* Date: $Date: 2006/10/27 08:39:09 $
* Tag: $Name:  $
*/
%>
<%
    String indexID = (String)request.getParameter("indexID");
    String return_event = request.getParameter("return_page");
    ICommodityTitleDocument titleDocObj = (ICommodityTitleDocument)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.serviceTitleDocObj");
    TitleDocForm aForm = (TitleDocForm)request.getAttribute("TitleDocForm");
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

function viewWarehouse(ind) {
    document.forms[0].action = "TitleDocWarehouse.do";
    document.forms[0].event.value = "<%=TitleDocWarehouseAction.EVENT_READ%>";
    document.forms[0].warehouseIndexID.value = ind;
    document.forms[0].submit();
}

function returnPage() {
    document.forms[0].event.value = "<%=TitleDocAction.EVENT_VIEW_RETURN%>";
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
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="warehouseIndexID"/>
<input type="hidden" name="return_page" value="<%=return_event%>"/>
<input type="hidden" name="next_page"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Title Documents- View </h3>
   
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
      <tbody>
        <tr class="even">
          <td width="44%" class="fieldname">Process Stage&nbsp;<font color="#0000FF">* </font></td>
          <td width="56%"><integro:empty-if-null value="<%=ProcessStageList.getInstance().getProcessStageItem(aForm.getProcessStage())%>"/>&nbsp;</td>
        </tr>
        <%
            String strDocType = null;
            if (ITitleDocument.NEGOTIABLE.equals(titleDocObj.getTitleDocType().getType())) {
                strDocType = "Negotiable";
            } else if (ITitleDocument.NON_NEGOTIABLE.equals(titleDocObj.getTitleDocType().getType())) {
                strDocType = "Non-Negotiable";
            }
        %>
        <tr class="odd">
          <td width="44%" class="fieldname">Documentation Type</td>
          <td width="56%"><integro:empty-if-null value="<%=strDocType%>"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td width="44%" class="fieldname">Documentation Description&nbsp;<font color="#0000FF">* </font></td>
          <td width="56%"><bean:write name="TitleDocForm" property="docDesc"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Eligibility of Advance</td>
          <td width="56%"><bean:write name="TitleDocForm" property="eligibilityAdv"/>&nbsp;%</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">Secured&nbsp;<font color="#0000FF">* </font></td>
          <td width="56%"><% if (aForm.getSecured()!= null) { %>
            <%=aForm.getSecured().equals(ICMSConstant.TRUE_VALUE)?"Yes":"No"%>
            <% } %>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Date of Transaction&nbsp;<font color="#0000FF">* </font></td>
          <td width="56%">
          <bean:write name="TitleDocForm" property="transactionDate"/>&nbsp;
          </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<%
    ITitleDocument titleDocument = titleDocObj.getTitleDocType();
    String strTitleDocument = null;
    if (titleDocument != null) {
        strTitleDocument = titleDocument.getName();
    }
%>
<%
    if ((strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT))||
       (strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT_N))) {
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="53%">
      <h3>Warehouse Receipts</h3>
    </td>
    <td valign="bottom" colspan="2" width="47%">&nbsp;
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <hr/>
    </td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="12%">Issued On</td>
          <td width="12%">Original Paper Receipt No.</td>
          <td width="24%">Paper Receipt No.</td>
          <td width="12%">Title Holder</td>
          <td width="12%">Title Holder No.</td>
          <td width="13%">Product</td>
          <td width="15%" class="tblInput">Action</td>
        </tr>
        </thead>
        <tbody>
        <%
            IWarehouseReceipt[] receiptList = titleDocObj.getWarehouseReceipts();
            if (receiptList == null || receiptList.length == 0) {
        %>
        <tr class="odd"><td colspan="8">There is no Warehouse Receipt.</td></tr>
        <%
            } else {
	    		
	        for (int i = 0 ; i < receiptList.length; i++) {
                    IWarehouseReceipt receiptObj = receiptList[i];
        %>
        <tr class="<%=i%2==0?"even":"odd"%>">
          <td style="text-align:center" width="12%"><integro:date object="<%=receiptObj.getIssueDate()%>"/></td>
          <td style="text-align:center" width="12%"><integro:empty-if-null value="<%=receiptObj.getOrigReceiptNo()%>"/></td>
          <td width="24%"><integro:empty-if-null value="<%=receiptObj.getPaperReceiptNo()%>"/></td>
          <td width="12%" style="text-align:center"><integro:empty-if-null value="<%=receiptObj.getTitleHolderName()%>"/></td>
          <td style="text-align:center" width="12%"><integro:empty-if-null value="<%=receiptObj.getTitleHolderNo()%>"/></td>
          <td style="text-align:center" width="13%"><integro:empty-if-null value="<%=receiptObj.getProductName()%>"/></td>
          <td style="text-align:center" width="15%">
            <a href="javascript:viewWarehouse(<%=i%>)">View</a>
          </td>
        </tr>
        <% } } %>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<br>
<% } else if ((strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_BILL_LADING))||
              (strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_BILL_LADING_N))){ %>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
  <thead>
    <tr>
    <td>
      <h3>Bill of Lading</h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td class="fieldname" width="44%">Shipping Company</td>
          <td width="56%"><bean:write name="TitleDocForm" property="shippingCompany"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">Bill of Lading No.</td>
          <td width="56%"><bean:write name="TitleDocForm" property="billLadingNo"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Bill of Lading Date </td>
          <td width="56%"><bean:write name="TitleDocForm" property="billLadingDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">Remarks</td>
          <td width="56%"><integro:wrapper value="<%=aForm.getBillLadingRemarks()%>"/>&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<% } else if ((strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT))||
             (strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT_NN))){ %>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
  <thead>
    <tr>
    <td>
      <h3>Trust Receipts</h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="even">
          <td class="fieldname" width="44%"> TR No.</td>
          <td width="56%"><bean:write name="TitleDocForm" property="trNo"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Bill of Lading Ref. No.</td>
          <td width="56%"><bean:write name="TitleDocForm" property="billLadingRefNo"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">TR Amount</td>
          <td width="56%"><bean:write name="TitleDocForm" property="trAmtCcy"/>&nbsp;
              <bean:write name="TitleDocForm" property="trAmtVal"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">TR Date</td>
          <td width="56%"><bean:write name="TitleDocForm" property="trDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">TR Maturity Date</td>
          <td width="56%"><bean:write name="TitleDocForm" property="trMaturityDate"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Remarks</td>
          <td width="56%"><integro:wrapper value="<%=aForm.getTrRemarks()%>"/>&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<% } else if (strTitleDocument != null) {%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
  <thead>
    <tr>
    <td>
      <h3>Others</h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td class="fieldname" width="44%"> Document No.</td>
          <td width="56%"><bean:write name="TitleDocForm" property="documentNo"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">Document Description</td>
          <td width="56%"><bean:write name="TitleDocForm" property="documentDesc"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Document Date</td>
          <td width="56%"><bean:write name="TitleDocForm" property="documentDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">Document Due Date</td>
          <td width="56%"><bean:write name="TitleDocForm" property="documentDueDate"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Remarks</td>
          <td width="56%"><integro:wrapper value="<%=aForm.getDocumentRemarks()%>"/>&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<% } %>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>

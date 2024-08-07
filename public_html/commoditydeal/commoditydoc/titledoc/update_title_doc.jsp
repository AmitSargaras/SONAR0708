<!--Modified by Pratheepa for CR129-->
<%@ page import="com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.TitleDocAction,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.TitleDocForm,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commodity.deal.bus.doc.ICommodityTitleDocument,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.ProcessStageList,
                 com.integrosys.cms.app.commodity.deal.bus.doc.IWarehouseReceipt,
                 com.integrosys.cms.app.commodity.main.bus.titledocument.ITitleDocument,
                 com.integrosys.cms.app.commodity.deal.bus.doc.WarehouseReceiptComparator,
                 java.util.Collection"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/titledoc/update_title_doc.jsp,v 1.23 2006/10/27 08:39:09 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.23 $
* Date: $Date: 2006/10/27 08:39:09 $
* Tag: $Name:  $
*/
%>
<%
    String indexID = (String)request.getParameter("indexID");
    String title = indexID.equals("-1")?"Add New":"Edit";
    String return_event = request.getParameter("return_page");
    
    String docType =request.getParameter("docType");
    ICommodityTitleDocument titleDocObj = (ICommodityTitleDocument)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.serviceTitleDocObj");
    
    boolean negError =false;
    boolean nonnegError = false;
    String neg = null;
    String nonneg = null;
    
    Collection selectedWRList = (Collection)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.selectedWRList");    
                         
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

function addWarehouse() {
    document.forms[0].event.value = "<%=TitleDocAction.EVENT_PRE_ADD_WAREHOUSE%>";
    document.forms[0].warehouseIndexID.value = "-1";
    document.forms[0].submit();
}

function editWarehouse(ind) {
    document.forms[0].event.value = "<%=TitleDocAction.EVENT_PRE_EDIT_WAREHOUSE%>";
    document.forms[0].warehouseIndexID.value = ind;
    document.forms[0].submit();
}

function deleteWarehouseReceipt() {
        var delObj = document.forms[0].deleteWarehouse;
		if(typeof(delObj)=='undefined')
		{
		   alert('At least one warehouse receipt must be checked');
           return false;
		}				
        var valid = false;
        if (!delObj.length) {
            valid = delObj.checked;
        } else {
            for (i = 0; i < delObj.length; i++) {
                if (delObj[i].checked) {
                    valid = true;
                }
            }
        }
        if (!valid) {
            alert('At least one warehouse receipt must be checked');
            return false;
        }

        document.forms[0].event.value = "<%=TitleDocAction.EVENT_REMOVE%>";
        document.forms[0].submit();
}

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=TitleDocAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=TitleDocAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=TitleDocAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=TitleDocAction.EVENT_REFRESH%>";
    }
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onLoad="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="TitleDoc.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=TitleDocAction.EVENT_FORWARD%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="warehouseIndexID"/>
<input type="hidden" name="return_page" value="<%=return_event%>"/>
<input type="hidden" name="next_page"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Title Documents- <%=title%> </h3>
  
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
          <td width="56%">
          <%
              if (indexID.equals("-1")) {
          %>
              <html:select property="processStage">
	              <option value="" >Please Select </option>
	              <html:options name="processStageID" labelName="processStageValue"/>
              </html:select>
              <html:errors property="processStage"/>
           <%
              } else {
           %>
           <integro:empty-if-null value="<%=ProcessStageList.getInstance().getProcessStageItem(titleDocObj.getProcessStageCode())%>"/>
           <html:hidden property="processStage"/>
           <% } %>
          </td>
        </tr>
        <tr class="odd">
          <td width="44%" class="fieldname">Documentation Type&nbsp;<font color="#0000FF">* </font></td>
          <td width="56%">
          <%
              if (indexID.equals("-1")) {
          %>
          <html:radio property="docType" value="<%=ITitleDocument.NEGOTIABLE%>" onclick="submitPage(4)"/>Negotiable
          &nbsp;&nbsp;
          <html:radio property="docType" value="<%=ITitleDocument.NON_NEGOTIABLE%>" onclick="submitPage(4)"/>Non-Negotiable
          <html:errors property="docType"/>
          <% } else {
                  String strDocType = null;
                  if (ITitleDocument.NEGOTIABLE.equals(titleDocObj.getTitleDocType().getType())) {
                      strDocType = "Negotiable";
                  } else if (ITitleDocument.NON_NEGOTIABLE.equals(titleDocObj.getTitleDocType().getType())) {
                      strDocType = "Non-Negotiable";
                  }
          %>
          <integro:empty-if-null value="<%=strDocType%>"/>&nbsp;
          <html:hidden property="docType"/>
          <% } %>
          </td>
        </tr>
        <tr class="even">
          <td width="44%" class="fieldname">Documentation Description&nbsp;<font color="#0000FF">* </font></td>
          <td width="56%">
          <%
              if (indexID.equals("-1")) {
          %>
              <html:select property="docDesc" onchange="submitPage(4)">
	              <option value="" >Please Select </option>
	              <html:options name="titleDocTypeID" labelName="titleDocTypeValue"/>
              </html:select>
              <html:messages id = "negerror" property="docDesc_N" >
	                    <%neg =(String)negerror;%>
	      </html:messages>
	      <html:messages id = "nonnegerror" property="docDesc_NN" >
	      	                    <%nonneg=(String)nonnegerror;%>
	      </html:messages>
              
              <%if ("neg".equals(docType) && neg!=null){
              negError = true;
              %>
              
              
              <%}else if("non_neg".equals(docType) && nonneg!=null){
              nonnegError = true;
              %>
               
              
              <%}%>
              
              <html:errors property="docDesc"/>
              <html:errors property="docDesc_N"/>
              <html:errors property="docDesc_NN"/>

          <% } else { %>
          <integro:empty-if-null value="<%=titleDocObj.getTitleDocType().getName()%>"/>
          <html:hidden property="docDesc"/>
          <% } %>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Eligibility of Advance&nbsp;<font color="#0000FF">* </font></td>
          <td width="56%">
          <% if (indexID.equals("-1")) { %>
            <html:text property="eligibilityAdv" maxlength="3" size="5"/>&nbsp;%
            <html:errors property="eligibilityAdv"/>
          <% } else { %>
          <%=(int)titleDocObj.getAdvEligibilityPct()%>%
          <html:hidden property="eligibilityAdv"/>
          <% } %>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">Secured&nbsp;<font color="#0000FF">* </font></td>
          <td width="56%">
          <%
              if (indexID.equals("-1")) {
          %>
              <html:radio property="secured" value="<%=ICMSConstant.TRUE_VALUE%>" />Yes
              &nbsp;&nbsp;
              <html:radio property="secured" value="<%=ICMSConstant.FALSE_VALUE%>" />No
              <html:errors property="secured"/>
              <%
              } else {
                  String isSecured = null;
                  if (titleDocObj.getIsSecured() != null) {
                      if (titleDocObj.getIsSecured().equals(ICMSConstant.TRUE_VALUE)) {
                          isSecured = "Yes";
                      } else {
                          isSecured = "No";
                      }
                  }
              %>
              <integro:empty-if-null value="<%=isSecured%>"/>
              <html:hidden property="secured"/>
              <% } %>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Date of Transaction&nbsp;<font color="#0000FF">* </font></td>
          <td width="56%">
          <% if (indexID.equals("-1")) { %>
			  <html:text property="transactionDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('transactionDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="transactionDate"/>
          <% } else { %>
          <integro:date object="<%=titleDocObj.getTransactionDate()%>"/>
          <html:hidden property="transactionDate"/>
          <% } %>
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
    if ((strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT)) ||
         (strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_WAREHOUSE_RECEIPT_N)))
    {
    	    	
    	if((!negError && !nonnegError) || (("non_neg".equals(docType)) && !nonnegError) || (("neg".equals(docType)) && !negError) )
	  {
%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="53%">
      <h3>Warehouse Receipts</h3>
    </td>
    <td valign="bottom" colspan="2" width="47%">
      <table width="160"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
          <td width="80">&nbsp; </td>
          <td width="160" valign="baseline" align="center">
            <input name="Submit23" type="button" align="right" class="btnNormal" value="Add Warehouse Details" onClick="addWarehouse()"/>
          </td>
		  <td width="80" valign="baseline" align="right">
            <input name="Submit2" type="button" class="btnNormal" value="Delete" onClick="deleteWarehouseReceipt()"/>
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
  </thead>
  <tbody>
  <tr>
    <td colspan="3">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="10%">Issued On</td>
          <td width="10%">Original Paper Receipt No.</td>
          <td width="24%">Paper Receipt No.</td>
          <td width="9%">Title Holder</td>
          <td width="11%">Title Holder No.</td>
          <td width="12%">Product</td>
          <td width="15%" class="tblInput">Action</td>
          <td width="9%" class="tblInput">Remove</td>
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
          <td style="text-align:center" width="10%"><integro:date object="<%=receiptObj.getIssueDate()%>"/></td>
          <td style="text-align:center" width="10%"><integro:empty-if-null value="<%=receiptObj.getOrigReceiptNo()%>"/>&nbsp;</td>
          <td width="24%"><integro:empty-if-null value="<%=receiptObj.getPaperReceiptNo()%>"/>&nbsp;</td>
          <td width="9%" style="text-align:center"><integro:empty-if-null value="<%=receiptObj.getTitleHolderName()%>"/>&nbsp;</td>
          <td style="text-align:center" width="11%"><integro:empty-if-null value="<%=receiptObj.getTitleHolderNo()%>"/>&nbsp;</td>
          <td style="text-align:center" width="12%"><integro:empty-if-null value="<%=receiptObj.getProductName()%>"/>&nbsp;</td>
          <td style="text-align:center" width="15%">
            <a href="javascript:editWarehouse(<%=i%>)">View/Edit</a>
          </td>
          <td style="text-align:center" width="9%" >
          <%
                    if (selectedWRList != null &&
                            !selectedWRList.contains(String.valueOf(receiptObj.getRefID()))) {
          %>
            <html:multibox property="deleteWarehouse" value="<%=String.valueOf(i)%>"/>
          <% } else { %>&nbsp;<% } %>
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
<% }} else if ((strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_BILL_LADING)) ||
             (strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_BILL_LADING_N))) 
{ %>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
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
        <td width="56%">
            <html:text property="shippingCompany" maxlength="150"/>
            <html:errors property="shippingCompany"/>
        </td>
        </tr>
        <tr class="even">
        <td class="fieldname" width="44%">Bill of Lading No.</td>
        <td width="56%">
            <html:text property="billLadingNo" maxlength="150"/>
            <html:errors property="billLadingNo"/>
        </td>
        </tr>
        <tr class="odd">
        <td class="fieldname" width="44%">Bill of Lading Date </td>
        <td width="56%">
	        <html:text property="billLadingDate" readonly="true" size="15" maxlength="11" />
            <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('billLadingDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
            <html:errors property="billLadingDate"/>
        </td>
        </tr>
        <tr class="even">
        <td class="fieldname" width="44%">Remarks</td>
        <td width="56%">
           <html:textarea property="billLadingRemarks" rows="3" cols="80"/>&nbsp;
           <html:errors property="billLadingRemarks"/>
        </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<% } else if ((strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT)) ||
              (strTitleDocument != null && strTitleDocument.equalsIgnoreCase(CommodityDealConstant.DOC_TYPE_TRUST_RECEIPT_NN))) 
{ %>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
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
        <td width="56%">
            <html:text property="trNo" maxlength="150"/>
            <html:errors property="trNo"/>
        </td>
        </tr>
        <tr class="odd">
        <td class="fieldname" width="44%">Bill of Lading Ref. No.</td>
        <td width="56%">
            <html:text property="billLadingRefNo" maxlength="150"/>
            <html:errors property="billLadingRefNo"/>
        </td>
        </tr>
        <tr class="even">
        <td class="fieldname" width="44%">TR Amount</td>
        <td width="56%">
              <html:select property="trAmtCcy">
	              <option value="" >Please Select </option>
	              <html:options name="currencyCode" labelName="currencyCode"/>
              </html:select>
              <html:errors property="trAmtCcy"/>
            <html:text property="trAmtVal" maxlength="27"/>
            <html:errors property="trAmtVal"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">TR Date</td>
          <td width="56%">
			  <html:text property="trDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('trDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="trDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">TR Maturity Date</td>
          <td width="56%">
			  <html:text property="trMaturityDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('trMaturityDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="trMaturityDate"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Remarks</td>
          <td width="56%">
            <html:textarea property="trRemarks" rows="3" cols="80"/>&nbsp;
            <html:errors property="trRemarks"/>
          </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<% } else if (strTitleDocument != null) {%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
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
          <td width="56%">
            <html:text property="documentNo" maxlength="150"/>
            <html:errors property="documentNo"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">Document Description</td>
          <td width="56%">
            <html:text property="documentDesc" maxlength="150"/>
            <html:errors property="documentDesc"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Document Date</td>
          <td width="56%">
			  <html:text property="documentDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('documentDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="documentDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="44%">Document Due Date</td>
          <td width="56%">
			  <html:text property="documentDueDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onClick="return showCalendar('documentDueDate', 'dd/mm/y');" onMouseOver="MM_swapImage('Image724','','img/calendarb.gif',1)" onMouseOut="MM_swapImgRestore()" />
              <html:errors property="documentDueDate"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="44%">Remarks</td>
          <td width="56%">
            <html:textarea property="documentRemarks" rows="3" cols="80"/>&nbsp;
            <html:errors property="documentRemarks"/>
          </td>
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
        <td width="75" valign="baseline" align="center">
        <%
            if (indexID.equals("-1")) {
        %>
            <a href="javascript:submitPage(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } else { %>
            <a href="javascript:submitPage(2)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } %>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
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

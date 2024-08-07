<%@ page import="com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.warehouse.TitleDocWarehouseAction,
                 com.integrosys.cms.app.commodity.deal.bus.doc.ICommodityTitleDocument,
                 com.integrosys.cms.app.commodity.deal.bus.doc.IWarehouseReceipt,
                 java.util.Collection"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/titledoc/warehouse/update_titledoc_warehouse.jsp,v 1.14 2006/10/27 08:39:16 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.14 $
* Date: $Date: 2006/10/27 08:39:16 $
* Tag: $Name:  $
*/
%>
<%
    String indexID = (String)request.getParameter("indexID");
    String warehouseIndexID = request.getParameter("warehouseIndexID");
//    System.out.println("warehouseID: "+warehouseIndexID);
//    String title = warehouseIndexID.equals("-1")?"Add":"Edit";
    String return_event = request.getParameter("return_page");
    ICommodityTitleDocument titleDocObj = (ICommodityTitleDocument)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.serviceTitleDocObj");
    IWarehouseReceipt receipt = null;
    if (!warehouseIndexID.equals("-1")) {
        receipt = titleDocObj.getWarehouseReceipts()[Integer.parseInt(warehouseIndexID)];
    }
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

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=TitleDocWarehouseAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=TitleDocWarehouseAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=TitleDocWarehouseAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value = "<%=TitleDocWarehouseAction.EVENT_REFRESH%>";
    }
    for (i = 0; i < document.forms[0].elements.length; i++) {
		document.forms[0].elements[i].disabled = false;
	}

    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/ok2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="TitleDocWarehouse.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<input type="hidden" name="event" value="<%=TitleDocWarehouseAction.EVENT_FORWARD%>"/>
<input type="hidden" name="warehouseIndexID" value="<%=warehouseIndexID%>"/>
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="return_page" value="<%=return_event%>"/>
<input type="hidden" name="next_page"/>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Electronic Negotiable Warehouse (ERW) Receipt Number</h3>
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
        <tr class="even">
          <td class="fieldname" width="21%">Warehouse Name</td>
          <td width="79%">
              <html:select property="warehouseName">
	              <option value="" >Please Select </option>
	              <html:options name="warehouseID" labelName="warehouseValue"/>
              </html:select>
              <html:errors property="warehouseName"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Issued On</h3>
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
        <tr class="even">
          <td class="fieldname" width="20%">Issued On</td>
          <td width="30%">
			  <html:text property="issuedOn" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('issuedOn', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="issuedOn"/>
          </td>
          <td class="fieldname" width="20%">Last Modified On</td>
          <td width="30%">
			  <html:text property="lastModified" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('lastModified', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="lastModified"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Status</td>
          <td width="30%">
            <html:text property="status" maxlength="50"/>
            <html:errors property="status"/>
          </td>
          <td class="fieldname" width="20%">Exchange ID</td>
          <td width="30%">
            <html:text property="exchangeID" maxlength="50"/>
            <html:errors property="exchangeID"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Original Paper receipt No.&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
            <html:text property="origPaperRecNo" maxlength="50"/>
            <html:errors property="origPaperRecNo"/>
          </td>
          <td class="fieldname" width="20%">Converted to EWR On</td>
          <td width="30%">
			  <html:text property="convertEWRDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('convertEWRDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="convertEWRDate"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Paper Receipt No.</td>
          <td width="30%">
          <html:text property="paperRecNo" maxlength="50"/>
          <html:errors property="paperRecNo"/>
          </td>
          <td class="fieldname" width="20%">Converted to PWR On</td>
          <td width="30%">
			  <html:text property="convertPWRDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('convertPWRDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="convertPWRDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Title Holder</td>
          <td width="30%">
            <html:text property="titleHolder" maxlength="150"/>
            <html:errors property="titleHolder"/>
          </td>
          <td class="fieldname" width="20%">Title Holder No.</td>
          <td width="30%">
              <html:text property="titleHolderNo" maxlength="50"/>
              <html:errors property="titleHolderNo"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Beneficiary</h3>
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
        <tr class="even">
          <td class="fieldname" width="20%">Beneficiary</td>
          <td width="30%">
            <html:text property="beneficiary" maxlength="150"/>
            <html:errors property="beneficiary"/>
          </td>
          <td class="fieldname" width="20%">Beneficiary No.</td>
          <td width="30%">
            <html:text property="beneficiaryNo" maxlength="150"/>
            <html:errors property="beneficiaryNo"/>
          </td>
        </tr>
        <tr class="odd">
        <td class="fieldname" width="20%">Title Holder Changed On</td>
        <td width="30%">
			  <html:text property="titleHolderChangedDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('titleHolderChangedDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="titleHolderChangedDate"/>
        </td>
        <td class="fieldname" width="20%">Beneficiary Changed On</td>
        <td width="30%">
			  <html:text property="beneficiaryChangedDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('beneficiaryChangedDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="beneficiaryChangedDate"/>
        </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Warehouse Location &amp; Store No.</td>
          <td width="30%">
              <html:text property="warehouseLocStoreNo" maxlength="50"/>
              <html:errors property="warehouseLocStoreNo"/>
          </td>
          <td class="fieldname" width="20%">Cargo No.</td>
          <td width="30%">
            <html:text property="cargoNo" maxlength="50"/>
            <html:errors property="cargoNo"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Product</h3>
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
        <tr class="even">
          <td class="fieldname" width="20%">Product</td>
          <td width="80%">
            <html:text property="product" maxlength="150"/>
            <html:errors property="product"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Origin</h3>
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
        <tr class="even">
          <td class="fieldname" width="20%">Origin</td>
          <td width="30%">
            <html:text property="origin" maxlength="50"/>
            <html:errors property="origin"/>
          </td>
          <td class="fieldname" width="20%">Crop Year</td>
          <td width="30%"><html:text property="cropYear" maxlength="12" size="12"/>
              <html:errors property="cropYear"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Description</td>
          <td width="30%">
            <html:text property="description" maxlength="150"/>
            <html:errors property="description"/>
          </td>
          <td class="fieldname" width="20%">&nbsp;</td>
          <td width="30%">&nbsp;</td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Container Number</h3>
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
        <tr class="even">
          <td class="fieldname" width="20%">Container No.</td>
          <td width="30%">
            <html:text property="containerNo" maxlength="50"/>
            <html:errors property="containerNo"/>
          </td>
          <td class="fieldname" width="20%">Seal No.</td>
          <td width="30%">
            <html:text property="sealNo" maxlength="50"/>
            <html:errors property="sealNo"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Quantity</h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
  <%
      boolean allowEditQty = true;
      if (selectedWRList != null && receipt != null &&
              selectedWRList.contains(String.valueOf(receipt.getRefID()))) {
          allowEditQty = false;
      }
  %>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="even">
          <td class="fieldname" width="20%"> Quantity&nbsp;<font color="#0000FF">* </font></td>
          <td width="80%">
            <html:text property="quantity" maxlength="27" disabled="<%=!allowEditQty%>"/>
            <html:errors property="quantity"/>
            &nbsp;&nbsp;Click <a href="#" onclick="javascript:submitPage(4)">here</a> to refresh the page
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Quantity Units</h3>
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
        <tr class="even">
          <td class="fieldname" width="20%">Quantity Units</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="quantityUnit"/>&nbsp;
          <html:hidden property="quantityUnit"/>
          </td>
          <td class="fieldname" width="20%">Packaging Type</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="packagingType"/>&nbsp;
          <html:hidden property="packagingType"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>ICO Mark</h3>
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
        <tr class="even">
          <td class="fieldname" width="20%">ICO Mark</td>
          <td width="30%">
            <html:text property="icoMark" maxlength="50"/>
            <html:errors property="icoMark"/>
          </td>
          <td class="fieldname" width="20%">Addtional Marks</td>
          <td width="30%">
            <html:text property="additionalMark" maxlength="50"/>
            <html:errors property="additionalMark"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
  <thead>
    <tr>
    <td>
      <h3>Vessel Name</h3>
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
        <tr class="even">
          <td class="fieldname" width="20%">Vessel Name</td>
          <td width="30%">
            <html:text property="vesselName" maxlength="150"/>
            <html:errors property="vesselName"/>
          </td>
          <td class="fieldname" width="20%">Carrier</td>
          <td width="30%">
            <html:text property="carrier" maxlength="150"/>
            <html:errors property="carrier"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Voyage No.</td>
          <td width="30%">
            <html:text property="voyageNo" maxlength="50"/>
            <html:errors property="voyageNo"/>
          </td>
          <td class="fieldname" width="20%">Bill of Lading No.</td>
          <td width="30%">
            <html:text property="billLadingNo" maxlength="50"/>
            <html:errors property="billLadingNo"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Bill of Lading Date</td>
          <td width="30%">
			  <html:text property="billLadingDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('billLadingDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="billLadingDate"/>
          </td>
          <td class="fieldname" width="20%">Date of Assignment</td>
          <td width="30%">
			  <html:text property="dateAssignment" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('dateAssignment', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="dateAssignment"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Date of Bank Release</td>
          <td width="30%">
			  <html:text property="dateBankRelease" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('dateBankRelease', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="dateBankRelease"/>
          </td>
          <td class="fieldname" width="20%">Delivery Order</td>
          <td width="30%">
            <html:text property="deliverOrder" maxlength="50"/>
            <html:errors property="deliverOrder"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Free Time Expiry</td>
          <td width="30%">
			  <html:text property="freeTimeExpiry" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('freeTimeExpiry', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="freeTimeExpiry"/>
          </td>
          <td class="fieldname" width="20%">Grade Certificate</td>
          <td width="30%">
            <html:text property="gradeCert" maxlength="50"/>
            <html:errors property="gradeCert"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Weight Note</td>
          <td width="30%">
            <html:text property="weightNote" maxlength="50"/>
            <html:errors property="weightNote"/>
          </td>
          <td class="fieldname" width="20%">FDA/Customs Entry No.</td>
          <td width="30%">
            <html:text property="fdaCustomerEntryNo" maxlength="50"/>
            <html:errors property="fdaCustomerEntryNo"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Remarks</h3>
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
        <tr class="even">
          <td class="fieldname" width="20%">Remarks</td>
          <td width="80%">
            <html:textarea property="warehouseRemarks" rows="3" cols="100"/>&nbsp;
            <html:errors property="warehouseRemarks"/>
          </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="96">&nbsp;</td>
    <td width="54">&nbsp;</td>
  </tr>
  <tr>
        <td width="75" valign="baseline" align="center">
        <%
            if (warehouseIndexID.equals("-1")) {
        %>
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } else { %>
            <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } %>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
        </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

<%@ page import="com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.warehouse.TitleDocWarehouseAction,
                 com.integrosys.cms.ui.commoditydeal.commoditydoc.titledoc.warehouse.TitleDocWarehouseForm"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/commoditydoc/titledoc/warehouse/view_titledoc_warehouse.jsp,v 1.7 2006/10/27 08:39:16 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.7 $
* Date: $Date: 2006/10/27 08:39:16 $
* Tag: $Name:  $
*/
%>
<%
    String indexID = (String)request.getParameter("indexID");
    String warehouseIndexID = request.getParameter("warehouseIndexID");
    String return_event = request.getParameter("return_page");
    TitleDocWarehouseForm aForm = (TitleDocWarehouseForm)request.getAttribute("TitleDocWarehouseForm");
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

function returnPage() {
    document.forms[0].event.value = "<%=TitleDocWarehouseAction.EVENT_RETURN%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
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
          <td width="79%"><bean:write name="TitleDocWarehouseForm" property="warehouseName"/>&nbsp;
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<br/>

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
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="issuedOn"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Last Modified On</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="lastModified"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Status</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="status"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Exchange ID</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="exchangeID"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Original Paper receipt No.&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="origPaperRecNo"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Converted to EWR On</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="convertEWRDate"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Paper Receipt No.</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="paperRecNo"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Converted to PWR On</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="convertPWRDate"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Title Holder</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="titleHolder"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Title Holder No.</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="titleHolderNo"/>&nbsp;
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
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="beneficiary"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Beneficiary No.</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="beneficiaryNo"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
        <td class="fieldname" width="20%">Title Holder Changed On</td>
        <td width="30%"><bean:write name="TitleDocWarehouseForm" property="titleHolderChangedDate"/>&nbsp;
        </td>
        <td class="fieldname" width="20%">Beneficiary Changed On</td>
        <td width="30%"><bean:write name="TitleDocWarehouseForm" property="beneficiaryChangedDate"/>&nbsp;
        </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Warehouse Location &amp; Store No.</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="warehouseLocStoreNo"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Cargo No.</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="cargoNo"/>&nbsp;
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
          <td width="80%"><bean:write name="TitleDocWarehouseForm" property="product"/>&nbsp;
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
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="origin"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Crop Year</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="cropYear"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Description</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="description"/>&nbsp;
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
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="containerNo"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Seal No.</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="sealNo"/>&nbsp;
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
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="even">
          <td class="fieldname" width="20%"> Quantity&nbsp;<font color="#0000FF">* </font></td>
          <td width="80%"><bean:write name="TitleDocWarehouseForm" property="quantity"/>&nbsp;
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
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="quantityUnit"/>&nbsp;</td>
          <td class="fieldname" width="20%">Packaging Type</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="packagingType"/>&nbsp;</td>
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
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="icoMark"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Addtional Marks</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="additionalMark"/>&nbsp;
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
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="vesselName"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Carrier</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="carrier"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Voyage No.</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="voyageNo"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Bill of Lading No.</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="billLadingNo"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Bill of Lading Date</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="billLadingDate"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Date of Assignment</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="dateAssignment"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Date of Bank Release</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="dateBankRelease"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Delivery Order</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="deliverOrder"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="20%">Free Time Expiry</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="freeTimeExpiry"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">Grade Certificate</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="gradeCert"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="20%">Weight Note</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="weightNote"/>&nbsp;
          </td>
          <td class="fieldname" width="20%">FDA/Customs Entry No.</td>
          <td width="30%"><bean:write name="TitleDocWarehouseForm" property="fdaCustomerEntryNo"/>&nbsp;
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
          <td width="80%"><integro:wrapper value="<%=aForm.getWarehouseRemarks()%>"/>&nbsp;
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
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
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

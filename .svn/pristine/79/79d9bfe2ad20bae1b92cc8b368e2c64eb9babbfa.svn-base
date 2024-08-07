<%@ page import="com.integrosys.cms.ui.commoditydeal.finance.purchasesale.PurchaseSaleAction,
                 com.integrosys.cms.ui.commoditydeal.finance.purchasesale.PurchaseSaleForm,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.commodity.deal.bus.purchasesales.IPurchaseAndSalesDetails,
                 com.integrosys.cms.app.commodity.deal.bus.purchasesales.IPurchaseDetails,
                 com.integrosys.cms.app.commodity.deal.bus.purchasesales.ISalesDetails,
                 com.integrosys.cms.app.commodity.common.Quantity,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commodity.main.bus.profile.ISupplier,
                 com.integrosys.cms.app.commodity.main.bus.profile.IBuyer"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/finance/purchasesale/chk_view_purchase_sale.jsp,v 1.13 2006/10/27 08:39:58 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.13 $
* Date: $Date: 2006/10/27 08:39:58 $
* Tag: $Name:  $
*/
%>
<%
    PurchaseSaleForm aForm = (PurchaseSaleForm)request.getAttribute("PurchaseSaleForm");
    IPurchaseAndSalesDetails actualPurchaseSale = (IPurchaseAndSalesDetails) request.getAttribute("actualPurchaseSale");
    IPurchaseAndSalesDetails stagePurchaseSale = (IPurchaseAndSalesDetails) request.getAttribute("stagePurchaseSale");
    IPurchaseDetails actualPurchase = null;
    IPurchaseDetails stagePurchase = null;
    ISalesDetails actualSales = null;
    ISalesDetails stageSales = null;
    if (actualPurchaseSale != null) {
        actualPurchase = actualPurchaseSale.getPurchaseDetails();
        actualSales = actualPurchaseSale.getSalesDetails();
    }
    if (stagePurchaseSale != null) {
        stagePurchase = stagePurchaseSale.getPurchaseDetails();
        stageSales = stagePurchaseSale.getSalesDetails();
    }
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
    document.forms[0].event.value = "<%=PurchaseSaleAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}


//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<html:form action="PurchaseSale.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=PurchaseSaleAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3>Purchase &amp; Sales Details</h3>
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
        <tr class="odd">
          <td width="20%" class="fieldname">&nbsp;</td>
          <td width="30%" class="fieldname">Purchase</td>
          <td width="30%" class="fieldname">Sales </td>
        </tr>
        <tbody>
        <%
            boolean isSame = true;
            if (stagePurchase != null && actualPurchase == null &&
                    stagePurchase.getSupplier() == null) {
                isSame = true;
            } else {
                ISupplier actualSupplier = null;
                ISupplier stageSupplier = null;
                if (stagePurchase != null) {
                    stageSupplier = stagePurchase.getSupplier();
                }
                if (actualPurchase != null) {
                    actualSupplier = actualPurchase.getSupplier();
                }
                isSame = CompareOBUtil.compOB(stageSupplier, actualSupplier, "supplierID");
            }
            if (isSame) {
                isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "otherSupplierName");
            }
            if (isSame) {
                if (stageSales != null && actualSales == null &&
                        stageSales.getBuyer() == null) {
                    isSame = true;
                } else {
                    IBuyer actualBuyer = null;
                    IBuyer stageBuyer = null;
                    if (actualSales != null) {
                        actualBuyer = actualSales.getBuyer();
                    }
                    if (stageSales != null) {
                        stageBuyer = stageSales.getBuyer();
                    }
                    isSame = CompareOBUtil.compOB(stageBuyer, actualBuyer, "buyerID");
                }
            }
            if (isSame) {
                isSame = isSame && CompareOBUtil.compOB(stageSales, actualSales, "otherBuyerName");
            }
        %>
        <tr class="odd">
          <td width="20%" class="<%=isSame?"fieldname":"fieldnamediff"%>">Name of Supplier(Purchase) / Buyer(Sales)</td>
          <td width="30%">
          <%
              if (aForm.getPurSupplier().equals(ICMSConstant.NOT_AVAILABLE_VALUE)) {
          %>
          <bean:write name="PurchaseSaleForm" property="purSupplierOth"/>
          <% } else  { %>
          <bean:write name="PurchaseSaleForm" property="purSupplier"/>
          <% } %>&nbsp;
          </td>
          <td width="30%">
          <%
              if (aForm.getSalesBuyer().equals(ICMSConstant.NOT_AVAILABLE_VALUE)) {
          %>
          <bean:write name="PurchaseSaleForm" property="salesBuyerOth"/>
          <% } else { %>
          <bean:write name="PurchaseSaleForm" property="salesBuyer"/>	      
          <% } %> &nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Description of Goods</td>
          <td><bean:write name="PurchaseSaleForm" property="purDescGood"/>&nbsp;
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesDescGood"/>&nbsp;
          </td>
        </tr>
        <%
            Quantity actualSalesQty = null;
            Quantity stageSalesQty = null;
            if (actualSales != null) {
                actualSalesQty = actualSales.getQuantity();
            }
            if (stageSales != null) {
                stageSalesQty = stageSales.getQuantity();
            }
            Quantity actualPurQty = null;
            Quantity stagePurQty = null;
            if (actualPurchase != null) {
                actualPurQty = actualPurchase.getQuantity();
            }
            if (stagePurchase != null) {
                stagePurQty = stagePurchase.getQuantity();
            }
            isSame = true;
            isSame = CompareOBUtil.compOB(stageSalesQty, actualSalesQty, "quantity");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stagePurQty, actualPurQty, "quantity");
            }
        %>
        <tr class="odd">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Qty&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="PurchaseSaleForm" property="purQty"/>&nbsp;
          <bean:write name="PurchaseSaleForm" property="salesQtyUOM"/>
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesQty"/>&nbsp;
            <bean:write name="PurchaseSaleForm" property="salesQtyUOM"/>
          </td>
        </tr>
        <%
            Amount actualPurUnitPrice = null;
            Amount stagePurUnitPrice = null;
            if (actualPurchase != null) {
                actualPurUnitPrice = actualPurchase.getUnitPrice();
            }
            if (stagePurchase != null) {
                stagePurUnitPrice = stagePurchase.getUnitPrice();
            }
            Amount actualSalesUnitPrice = null;
            Amount stageSalesUnitPrice = null;
            if (actualSales != null) {
                actualSalesUnitPrice = actualSales.getUnitPrice();
            }
            if (stageSales != null) {
                stageSalesUnitPrice = stageSales.getUnitPrice();
            }
            isSame = CompareOBUtil.compOB(stageSalesUnitPrice, actualSalesUnitPrice, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSalesUnitPrice, actualSalesUnitPrice, "amountAsBigDecimal");
            }
            if (isSame) {
                isSame = CompareOBUtil.compOB(stagePurUnitPrice, actualPurUnitPrice, "currencyCode");
            }
            if (isSame) {
                isSame = CompareOBUtil.compOB(stagePurUnitPrice, actualPurUnitPrice, "amountAsBigDecimal");
            }
        %>
        <tr class="even">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Unit Price&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="PurchaseSaleForm" property="purUnitPriceCcy"/>&nbsp;
          <bean:write name="PurchaseSaleForm" property="purUnitPriceAmt"/>
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesUnitPriceCcy"/>&nbsp;
          <bean:write name="PurchaseSaleForm" property="salesUnitPriceAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Total Value</td>
          <td><bean:write name="PurchaseSaleForm" property="purTotalVal"/>&nbsp;
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesTotalVal"/>&nbsp;
          </td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "shipDate");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "shipDate");
            }
        %>
        <tr class="even">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Shipment Date</td>
          <td><bean:write name="PurchaseSaleForm" property="purShipmentDate"/>&nbsp;</td>
          <td><bean:write name="PurchaseSaleForm" property="salesShipmentDate"/>&nbsp;</td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "expiryDate");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "expiryDate");
            }
        %>
        <tr class="odd">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Expiry Date</td>
          <td><bean:write name="PurchaseSaleForm" property="purExpiryDate"/>&nbsp;</td>
          <td><bean:write name="PurchaseSaleForm" property="salesExpiryDate"/>&nbsp;</td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "shipmentSource");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "shipmentSource");
            }
        %>
        <tr class="even">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Shipment Route (From)</td>
          <td><bean:write name="PurchaseSaleForm" property="purShipmentFrom"/>&nbsp;
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesShipmentFrom"/>&nbsp;
          </td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "shipmentDestination");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "shipmentDestination");
            }
        %>
        <tr class="odd">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Shipment Route (To) </td>
          <td><bean:write name="PurchaseSaleForm" property="purShipmentTo"/>&nbsp;
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesShipmentTo"/>&nbsp;
          </td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "transportationDocumentNo");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "transportationDocumentNo");
            }
        %>
        <tr class="even">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Transport Document</td>
          <td><bean:write name="PurchaseSaleForm" property="purTransportDoc"/>&nbsp;
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesTransportDoc"/>&nbsp;
          </td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "paymentMode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "paymentMode");
            }
        %>
        <tr class="odd">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Payment By</td>
          <td><bean:write name="PurchaseSaleForm" property="purPayment"/>&nbsp;
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesPayment"/>&nbsp;
          </td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "bankName");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "bankName");
            }
        %>
        <tr class="even">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Corresponding Bank</td>
          <td><bean:write name="PurchaseSaleForm" property="purCorrBank"/>&nbsp;
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesCorrBank"/>&nbsp;
          </td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "isClaimAllowed");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "isClaimAllowed");
            }
            if (isSame) {
                isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "noDaysClaimed");
            }
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "noDaysClaimed");
            }
        %>
        <tr class="odd">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">TT Claim Allowed</td>
          <td><integro:boolean-display style="yn" value="<%=Boolean.valueOf(aForm.getPurIsTTClaim()).booleanValue()%>"/>&nbsp;
          <bean:write name="PurchaseSaleForm" property="purTTClaimDay"/>&nbsp;Days
          </td>
          <td><integro:boolean-display style="yn" value="<%=Boolean.valueOf(aForm.getSalesIsTTClaim()).booleanValue()%>"/>&nbsp;
          <bean:write name="PurchaseSaleForm" property="salesTTClaimDay"/>&nbsp;Days
          </td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "referenceNo");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "referenceNo");
            }
        %>
        <tr class="even">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Reference No.</td>
          <td><bean:write name="PurchaseSaleForm" property="purRefNo"/>&nbsp;
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesRefNo"/>&nbsp;
          </td>
        </tr>
        <%
            isSame = CompareOBUtil.compOB(stagePurchase, actualPurchase, "remarks");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageSales, actualSales, "remarks");
            }
        %>
        <tr class="odd">
          <td class="<%=isSame?"fieldname":"fieldnamediff"%>">Remarks</td>
          <td><integro:wrapper value="<%=aForm.getPurRemarks()%>"/>&nbsp;
          </td>
          <td><integro:wrapper value="<%=aForm.getSalesRemarks()%>"/>&nbsp;
          </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="153" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="72">&nbsp;</td>
    <td width="81">&nbsp;</td>
  </tr>
  <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
  </tr>
  <tr>
    <td width="72">&nbsp;</td>
    <td width="81">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

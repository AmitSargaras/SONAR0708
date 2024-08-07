<%@ page import="com.integrosys.cms.ui.commoditydeal.finance.purchasesale.PurchaseSaleAction,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commoditydeal.finance.purchasesale.PurchaseSaleForm"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/finance/purchasesale/update_purchase_sale.jsp,v 1.18 2006/10/27 08:39:58 hmbao Exp $
*
* Purpose: Commodity deal
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.18 $
* Date: $Date: 2006/10/27 08:39:58 $
* Tag: $Name:  $
*/
%>
<%
    PurchaseSaleForm aForm = (PurchaseSaleForm)request.getAttribute("PurchaseSaleForm");
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
    for (i = 0; i < document.forms[0].elements.length; i++) {
		document.forms[0].elements[i].disabled = false;
	}

    if (num == 1) {
        document.forms[0].event.value = "<%=PurchaseSaleAction.EVENT_UPDATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=PurchaseSaleAction.EVENT_CANCEL%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=PurchaseSaleAction.EVENT_REFRESH%>";
    }
    document.forms[0].submit();
}

function changeSupplier() {
    if (document.forms[0].purSupplier.value == '<%=ICMSConstant.NOT_AVAILABLE_VALUE%>') {
        document.forms[0].purSupplierOth.disabled = false;
    } else {
        document.forms[0].purSupplierOth.value = '';
        document.forms[0].purSupplierOth.disabled = true;
    }
}

function changeBuyer() {
    if (document.forms[0].salesBuyer.value == '<%=ICMSConstant.NOT_AVAILABLE_VALUE%>') {
        document.forms[0].salesBuyerOth.disabled = false;
    } else {
        document.forms[0].salesBuyerOth.value = '';
        document.forms[0].salesBuyerOth.disabled = true;
    }
}

function purchaseClaimYes() {
    document.forms[0].purTTClaimDay.disabled = false;
}

function purchaseClaimNo() {
    document.forms[0].purTTClaimDay.disabled = true;
    document.forms[0].purTTClaimDay.value = '';
}

function salesClaimYes() {
    document.forms[0].salesTTClaimDay.disabled = false;
}

function salesClaimNo() {
    document.forms[0].salesTTClaimDay.disabled = true;
    document.forms[0].salesTTClaimDay.value = '';
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
    <td align="right" valign="bottom">
        <input type="button" name="button3" id="refresh" value="Refresh" class="btnNormal" onclick="submitPage(3)"/>
    </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td width="20%" class="fieldname">&nbsp;</td>
          <td width="30%" class="fieldname">Purchase</td>
          <td width="30%" class="fieldname">Sales </td>
        </tr>
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname">Name of Supplier(Purchase) / Buyer(Sales)</td>
          <td width="30%">
              <html:select property="purSupplier" onchange="changeSupplier()">
	              <option value="" >Please Select </option>
	              <html:options name="supplierID" labelName="supplierValue"/>
              </html:select>
              <html:errors property="purSupplier"/>
			<br/>
            <%
                boolean isEditable = false;
                if (aForm.getPurSupplier() != null && 
                        aForm.getPurSupplier().equals(ICMSConstant.NOT_AVAILABLE_VALUE)) {
                    isEditable = true;
                }
            %>
            <html:text property="purSupplierOth" maxlength="150" size="25" disabled="<%=!isEditable%>"/>
            <html:errors property="purSupplierOth"/>
          </td>
          <td width="30%">
              <html:select property="salesBuyer" onchange="changeBuyer()">
	              <option value="" >Please Select </option>
	              <html:options name="buyerID" labelName="buyerValue"/>                  
              </html:select>
              <html:errors property="salesBuyer"/>
			<br/>
            <%
                isEditable = false;
                if (aForm.getSalesBuyer() != null &&
                        aForm.getSalesBuyer().equals(ICMSConstant.NOT_AVAILABLE_VALUE)) {
                    isEditable = true;
                }
            %>
            <html:text property="salesBuyerOth" maxlength="150" size="25" disabled="<%=!isEditable%>"/>
            <html:errors property="salesBuyerOth"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Description of Goods</td>
          <td><bean:write name="PurchaseSaleForm" property="purDescGood"/>&nbsp;
            <html:hidden property="purDescGood"/>
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesDescGood"/>&nbsp;
            <html:hidden property="salesDescGood"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Qty&nbsp;<font color="#0000FF">* </font></td>
          <td><html:text property="purQty" maxlength="27"/>&nbsp;
          <bean:write name="PurchaseSaleForm" property="salesQtyUOM"/>
            <html:errors property="purQty"/>
          </td>
          <td>
            <html:text property="salesQty" maxlength="27"/>
            <bean:write name="PurchaseSaleForm" property="salesQtyUOM"/>
            <html:hidden property="salesQtyUOM"/>
            <html:errors property="salesQty"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Unit Price&nbsp;<font color="#0000FF">* </font></td>
          <td>
              <html:select property="purUnitPriceCcy">
	              <option value="" >Please Select </option>
	              <html:options name="currencyCode" labelName="currencyCode"/>
              </html:select>
              <html:errors property="purUnitPriceCcy"/>
            <html:text property="purUnitPriceAmt" maxlength="27"/>
            <html:errors property="purUnitPriceAmt"/>
          </td>
          <td>
              <html:select property="salesUnitPriceCcy">
	              <option value="" >Please Select </option>
	              <html:options name="currencyCode" labelName="currencyCode"/>
              </html:select>
              <html:errors property="salesUnitPriceCcy"/>
            <html:text property="salesUnitPriceAmt" maxlength="27"/>
            <html:errors property="salesUnitPriceAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Total Value</td>
          <td><bean:write name="PurchaseSaleForm" property="purTotalVal"/>&nbsp;
            <html:hidden property="purTotalVal"/>
          </td>
          <td><bean:write name="PurchaseSaleForm" property="salesTotalVal"/>&nbsp;
            <html:hidden property="salesTotalVal"/>
<!--            &nbsp;&nbsp;
            Click <a href="#" onclick="javascript:submitPage(3)">here</a> to refresh the page -->
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Shipment Date</td>
          <td>
			  <html:text property="purShipmentDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('purShipmentDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="purShipmentDate"/>
          </td>
          <td>
			  <html:text property="salesShipmentDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('salesShipmentDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="salesShipmentDate"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Expiry Date</td>
          <td>
			  <html:text property="purExpiryDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('purExpiryDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="purExpiryDate"/>
          </td>
          <td>
			  <html:text property="salesExpiryDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('salesExpiryDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="salesExpiryDate"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Shipment Route (From)</td>
          <td>
            <html:text property="purShipmentFrom" maxlength="150"/>
            <html:errors property="purShipmentFrom"/>
          </td>
          <td>
            <html:text property="salesShipmentFrom" maxlength="150"/>
            <html:errors property="salesShipmentFrom"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Shipment Route (To) </td>
          <td>
            <html:text property="purShipmentTo" maxlength="150"/>
            <html:errors property="purShipmentTo"/>
          </td>
          <td>
            <html:text property="salesShipmentTo" maxlength="150"/>
            <html:errors property="salesShipmentTo"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Transport Document</td>
          <td>
            <html:text property="purTransportDoc" maxlength="150"/>
            <html:errors property="purTransportDoc"/>
          </td>
          <td>
            <html:text property="salesTransportDoc" maxlength="150"/>
            <html:errors property="salesTransportDoc"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Payment By</td>
          <td>
            <html:text property="purPayment" maxlength="150"/>
            <html:errors property="purPayment"/>
          </td>
          <td>
            <html:text property="salesPayment" maxlength="150"/>
            <html:errors property="salesPayment"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Corresponding Bank</td>
          <td>
            <html:text property="purCorrBank" maxlength="150"/>
            <html:errors property="purCorrBank"/>
          </td>
          <td>
            <html:text property="salesCorrBank" maxlength="150"/>
            <html:errors property="salesCorrBank"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">TT Claim Allowed</td>
          <td>
          <%
              boolean ttclaim = false;
              if (aForm.getPurIsTTClaim() != null && aForm.getPurIsTTClaim().length() > 0) {
                  ttclaim = Boolean.valueOf(aForm.getPurIsTTClaim()).booleanValue();
              }
          %>
              <html:radio property="purIsTTClaim" value="true" onclick="purchaseClaimYes()" />Yes
              &nbsp;&nbsp;
              <html:radio property="purIsTTClaim" value="false" onclick="purchaseClaimNo()" />No
            <html:text property="purTTClaimDay" maxlength="3" disabled="<%=!ttclaim%>"/> Days
            &nbsp;
            <html:errors property="purIsTTClaim"/>
            <html:errors property="purTTClaimDay"/>
          </td>
          <%
              ttclaim = false;
              if (aForm.getSalesIsTTClaim() != null && aForm.getSalesIsTTClaim().length() > 0) {
                  ttclaim = Boolean.valueOf(aForm.getSalesIsTTClaim()).booleanValue();
              }
          %>
          <td>
              <html:radio property="salesIsTTClaim" value="true" onclick="salesClaimYes()" />Yes
              &nbsp;&nbsp;
              <html:radio property="salesIsTTClaim" value="false" onclick="salesClaimNo()" />No
            <html:text property="salesTTClaimDay" maxlength="3" disabled="<%=!ttclaim%>"/> Days
            &nbsp;
            <html:errors property="salesIsTTClaim" />
            <html:errors property="salesTTClaimDay"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Reference No.</td>
          <td>
            <html:text property="purRefNo" maxlength="150"/>
            <html:errors property="purRefNo"/>
          </td>
          <td>
            <html:text property="salesRefNo" maxlength="150"/>
            <html:errors property="salesRefNo"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Remarks</td>
          <td>
            <html:textarea property="purRemarks" rows="3" cols="45"/>&nbsp;
            <html:errors property="purRemarks"/>
          </td>
          <td>
            <html:textarea property="salesRemarks" rows="3" cols="45"/>&nbsp;
            <html:errors property="salesRemarks"/>
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
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
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

<%@ page import="com.integrosys.cms.ui.commoditydeal.finance.FinanceAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.ui.commoditydeal.CommDealSearchAction,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commodity.deal.bus.finance.ISettlement,
                 com.integrosys.cms.app.commodity.deal.bus.finance.ISettleWarehouseReceipt,
                 com.integrosys.cms.app.commodity.common.Quantity,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.app.commodity.deal.bus.finance.IReceiptRelease"%>
<%@ page import="com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/finance/finance_view.jsp,v 1.25 2006/10/27 08:39:32 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.25 $
* Date: $Date: 2006/10/27 08:39:32 $
* Tag: $Name:  $
*/
%>
<%
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    String from_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.from_event");
    ICommodityDeal dealObj;
    if (from_event.equals(FinanceAction.EVENT_READ)) {
        dealObj = trxValue.getCommodityDeal();
    } else {
        dealObj = trxValue.getStagingCommodityDeal();
    }

    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
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

function viewPS() {
    document.forms[0].event.value="<%=CommodityDealConstant.PURCHASE_SALE%>"+"_"+"<%=FinanceAction.EVENT_VIEW%>";
    document.forms[0].submit();
}

function viewHedging() {
    document.forms[0].event.value="<%=CommodityDealConstant.HEDGING%>"+"_"+"<%=FinanceAction.EVENT_VIEW%>";
    document.forms[0].submit();
}

function gotopage (aLocation) {
	window.open(aLocation);
}

function viewSettlement(index) {
    document.forms[0].event.value = "<%=CommodityDealConstant.SETTLEMENT%>"+"_"+"<%=FinanceAction.EVENT_VIEW%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

function viewRelease(index) {
    document.forms[0].event.value = "<%=CommodityDealConstant.RELEASE%>"+"_"+"<%=FinanceAction.EVENT_VIEW%>";
    document.forms[0].indexID.value = index;

    document.forms[0].submit();
}

function submitPage(num) {
    if (num == 1) {
        document.forms[0].action = "CommodityDeal.do";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_LIST%>";
    }
    if (num == 2) {
        document.forms[0].action="CommDealSearch.do";
        document.forms[0].event.value="<%=CommDealSearchAction.EVENT_LIST%>";
        document.forms[0].dealNo.value="<%=dealObj.getDealNo()%>";                
    }
    if (num == 3) {
        document.forms[0].action="CommodityDeal.do";
        document.forms[0].event.value="<%=CommodityDealAction.EVENT_LIST_CLOSED%>";
    }
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/cancel2.gif','img/return2.gif')">
<html:form action="Finance.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=FinanceAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="indexID"/>
<input type="hidden" name="dealNo"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3>Purchase &amp; Sales Details</h3></td>
      <td valign="bottom"><table width="80"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="80" valign="baseline" align="center"></td>
            <td width="80" valign="baseline" align="center">&nbsp;</td>
            <td width="80" valign="baseline" align="center"><input name="Submit23" type="button" class="btnNormal" value="View Details" onclick="viewPS()"/>
            </td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td height="22" colspan="2"><hr/>
      </td>
    </tr>
  </thead>
  <thead>
  </thead>
  <tr>
    <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
          <tr>
            <td colspan="3" style="text-align:left" height="32">Purchase</td>
            <td colspan="3" style="text-align:left" height="32">Sales</td>
            <td width="13%" class="tblInput" height="32"><br />
            </td>
          </tr>
          <tr>
            <td width="16%">Description of Goods</td>
            <td width="13%">Name of Supplier</td>
            <td width="15%">Purchase Value</td>
            <td width="16%">Description of Goods</td>
            <td width="13%">Name of Buyer</td>
            <td width="15%">Sales Value</td>
            <td width="12%" class="tblInput">Click button below <br />
              to View &amp; Print Approval Sheet </td>
          </tr>
        </thead>
        <tr class="odd">
          <td width="16%"><bean:write name="FinanceForm" property="goodsDesc"/>&nbsp;</td>
          <td style="text-align:center" width="13%"><bean:write name="FinanceForm" property="supplierName"/>&nbsp;</td>
          <td width="15%" style="text-align:center"><bean:write name="FinanceForm" property="purchaseValue"/>&nbsp;</td>
          <td width="16%"><bean:write name="FinanceForm" property="goodsDesc"/>&nbsp;</td>
          <td style="text-align:center" width="13%"><bean:write name="FinanceForm" property="buyerName"/>&nbsp;</td>
          <td style="text-align:center" width="15%"><bean:write name="FinanceForm" property="salesValue"/>&nbsp;</td>
          <%
              String viewApprovalSheet = "Finance.do?event="+FinanceAction.EVENT_PRINT_APPROVAL_SHEET;
          %>
          <td style="text-align:center" width="12%">
            <input type="button" name="Button22" value="View" class="btnNormal" style="width:60" onclick="gotopage('<%=viewApprovalSheet%>')"/>
          </td>
        </tr>
    </table></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:20px">
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td width="53%">
      <h3>Hedging</h3>
    </td>
    <td valign="bottom" colspan="2" width="47%">
      <table width="80"  border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td width="80">
            <input name="Submit5" type="button" class="btnNormal" value="View Hedged Details" onclick="viewHedging()"/>
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
          <td width="16%">Hedging Price</td>
          <td width="13%">Total Quantity of Goods Hedged</td>
          <td width="12%">Margin (%)</td>
          <td width="30%">Commodity Market Price (From Feed or Manual)</td>
          <td width="29%" class="tblInput">Profit/(Loss)</td>
        </tr>
        </thead>
        <tbody>
        <tr class="even">
          <td style="text-align:left" width="16%"><bean:write name="FinanceForm" property="hedgingPrice"/>&nbsp;</td>
          <td style="text-align:left" width="13%"><bean:write name="FinanceForm" property="totalQtyGoodsHedge"/>&nbsp;</td>
          <td width="12%"><bean:write name="FinanceForm" property="margin"/>&nbsp;%</td>
          <td width="30%"><bean:write name="FinanceForm" property="hedgeMarketPrice"/>&nbsp;
          </td>
          <td style="text-align:center" width="29%">
          <bean:write name="FinanceForm" property="hedgeProfitLoss"/>&nbsp;
          </td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <thead>
  <tr>
    <td>
      <h3><a name="Settlement" id="Settlement"></a>Settlement Details</h3>
    </td>
    <td valign="bottom">
      <table width="80"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
		<td width="120" valign="baseline" align="center">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="22" colspan="2">
      <hr/>
    </td>
  </tr>
  </thead>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="8%">S/N</td>
          <td width="38%">Date of Payment</td>
          <td width="38%">Payment Amount</td>
          <td width="16%" class="tblInput">Action</td>
        </tr>
        </thead>
        <tbody>
        <%
            ISettlement[] settlementList = dealObj.getSettlements();
            if (settlementList == null || settlementList.length == 0) {
        %>
        <tr class="odd"><td colspan="4">There is no Settlement Details.</td></tr>
        <%
            } else {
                for (int i = 0; i < settlementList.length; i++) {
                    ISettlement settlementObj = settlementList[i];
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" style="text-align:center" width="8%"><%=i + 1%></td>
          <td width="38%"><integro:date object="<%=settlementObj.getPaymentDate()%>"/>&nbsp;</td>
          <%        String paymentAmt = null;
                    if (settlementObj.getPaymentAmt() != null && settlementObj.getPaymentAmt().getAmount()>= 0) {
                        paymentAmt = UIUtil.formatAmount(settlementObj.getPaymentAmt(), 2, locale);
                    }
          %>
          <td style="text-align:center" width="38%"><integro:empty-if-null value="<%=paymentAmt%>"/></td>
          <td style="text-align:center" width="16%"><a href="javascript:viewSettlement(<%=i%>)">View</a></td>
        </tr>
        <%
                }
            }
        %>
        <tr class="total">
          <td class="total" style="text-align:center" width="8%">&nbsp;</td>
          <td width="38%" class="total" >Total Payment</td>
          <td width="38%" class="total" >
            <bean:write name="FinanceForm" property="totalSettlePayment"/>&nbsp;
            <html:hidden property="totalSettlePayment"/>
          </td>
          <td class="Total" width="16%">&nbsp;</td>
        </tr>
        <tr class="total">
          <td class="total" style="text-align:center" width="8%">&nbsp;</td>
          <td width="38%" class="total" >Original Outstanding</td>
          <td width="38%" class="total" >
            <bean:write name="FinanceForm" property="dealFinanceAmt"/>&nbsp;
          </td>
          <td class="Total" width="16%">&nbsp;</td>
        </tr>
        <tr class="total">
          <td class="total" style="text-align:center" width="8%">&nbsp;</td>
          <td width="38%" class="total" >Balance Outstanding</td>
          <td width="38%" class="total" >
          <bean:write name="FinanceForm" property="settleBalanceOutstanding"/>&nbsp;
          <html:hidden property="settleBalanceOutstanding"/>
          </td>
          <td class="Total" width="16%">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px" dwcopytype="CopyTableRow">
  <thead>
  <tr>
    <td>
      <h3><a name="Release" id="Release"></a>Release Details</h3>
    </td>
    <td valign="bottom">
      <table width="80"  border="0" align="right" cellpadding="2" cellspacing="0">
        <tr>
		<td width="120" valign="baseline" align="center">
        <%
            String authorisationRel = "Finance.do?event="+FinanceAction.EVENT_PRINT_AUTHORISATION_RELEASE;
        %>
            <input type="button" name="Button222" value="Authorisation for Release" class="btnNormal" style="width:150" onclick="gotopage('<%=authorisationRel%>')"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="22" colspan="2">
      <hr/>
    </td>
  </tr>
  </thead>
  <tr>
    <td colspan="2">
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <thead>
        <tr>
          <td width="7%">S/N</td>
          <td width="14%">Date of Release</td>
          <td width="14%">Warehouse Receipt No.</td>
          <td width="12%">Actual Qty</td>
          <td width="12%">Qty Released</td>
          <td width="13%" class="tblInput">Action</td>
        </tr>
        </thead>
        <tbody>
        <%
            IReceiptRelease[] releaseList = dealObj.getReceiptReleases();
            if (releaseList == null || releaseList.length == 0) {
        %>
        <tr class="odd"><td colspan="6">There is no Release Details.</td></tr>
        <%
            } else {
                for (int i = 0; i < releaseList.length; i++) {
                    IReceiptRelease releaseObj = releaseList[i];
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td class="index" style="text-align:center" width="7%"><%=i + 1%></td>
          <td width="14%" style="text-align:center">
          <integro:date object="<%=releaseObj.getReleaseDate()%>"/>&nbsp;
          </td>
          <td style="text-align:center" width="14%">
          <%
                    if (releaseObj.getSettleWarehouseReceipts() != null) {
                        ISettleWarehouseReceipt[] swrList = releaseObj.getSettleWarehouseReceipts();
                        for (int j = 0; j < swrList.length; j++) {
                            if (swrList[j].getWarehouseReceipt() != null) {
                                if (j > 0) {
          %>     <br/>
          <% } %>
            <integro:empty-if-null value="<%=swrList[j].getWarehouseReceipt().getOrigReceiptNo()%>"/>
          <%
                            }
                        }
                    } else {
          %> - <% } %>
          </td>
          <td style="text-align:center" width="12%">
          <%
                    if (releaseObj.getSettleWarehouseReceipts() != null) {
                        ISettleWarehouseReceipt[] swrList = releaseObj.getSettleWarehouseReceipts();
                        for (int j = 0; j < swrList.length; j++) {
                            if (swrList[j].getWarehouseReceipt() != null) {
                                if (j > 0) {
          %>     <br/>
          <% } %>
          <%
                                Quantity actualQty = swrList[j].getWarehouseReceipt().getQuantity();
                                if (actualQty != null) {
          %>
            <integro:empty-if-null value="<%=UIUtil.formatNumber(actualQty.getQuantity(), 4, locale)%>"/>&nbsp;
          <%
                                }
                            }
                        }
                    } else {
          %> - <% } %>
          </td>
          <td style="text-align:center" width="12%">
          <%
                    if (releaseObj.getSettleWarehouseReceipts() != null) {
                        ISettleWarehouseReceipt[] swrList = releaseObj.getSettleWarehouseReceipts();
                        for (int j = 0; j < swrList.length; j++) {
                            if (swrList[j].getWarehouseReceipt() != null) {
                                if (j > 0) {
          %>     <br/>
          <% } %>
          <%
                                Quantity releaseQty = swrList[j].getReleasedQty();
                                if (releaseQty != null) {
          %>
            <integro:empty-if-null value="<%=UIUtil.formatNumber(releaseQty.getQuantity(), 4, locale)%>"/>&nbsp;
          <%
                                }
                            }
                        }
                    } else {
          %> - <% } %>
          </td>
          <td style="text-align:center" width="13%"><a href="javascript:viewRelease(<%=i%>)">View</a></td>
        </tr>
        <%
                }
            }
        %>
        <tr class="total">
          <td class="total" style="text-align:center" width="7%">&nbsp;</td>
          <td class="total"  width="14%">&nbsp;</td>
          <td  width="14%" class="total" >Total Qty Released</td>
          <td class="total"  width="12%">&nbsp;</td>
          <td class="total"  width="12%">
          <bean:write name="FinanceForm" property="totalSettleQtyRel"/>&nbsp;
          <html:hidden property="totalSettleQtyRel"/>
          </td>
          <td class="Total" width="13%">&nbsp;</td>
        </tr>
        <tr class="total">
          <td class="total" style="text-align:center" width="7%">&nbsp;</td>
          <td class="total"  width="14%">&nbsp;</td>
          <td  width="14%" class="total" >Original Stock (Total)</td>
          <td class="total"  width="12%">&nbsp;</td>
          <td class="total"  width="12%">
          <bean:write name="FinanceForm" property="actualQty"/>&nbsp;
          <html:hidden property="actualQty"/>
          </td>
          <td class="Total" width="13%">&nbsp;</td>
        </tr>
        <tr class="total">
          <td class="total" style="text-align:center" width="7%">&nbsp;</td>
          <td class="total"  width="14%">&nbsp;</td>
          <td  width="14%" class="total" >Qty Balance Outstanding</td>
          <td class="total"  width="12%">&nbsp;</td>
          <td class="total"  width="12%">
          <bean:write name="FinanceForm" property="settleQtyBalanceOutstanding"/>&nbsp;
          <html:hidden property="settleQtyBalanceOutstanding"/>
          </td>
          <td class="Total" width="13%">&nbsp;</td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  <tr>
    <td>
      <h3>Deal Total</h3>
    </td>
    </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="even">
          <td width="100%" style="padding-top:5px;padding-bottom:5px" >
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo"  id="divfloat" name="divfloat">
              <tbody>
              <tr class="odd">
              <td class="fieldname" wodtj="30%">Original Face Value</td>
              <td><bean:write name="FinanceForm" property="originalFaceValue"/>&nbsp;
              <html:hidden property="originalFaceValue"/>
              </td>
              </tr>
              <tr class="even">
              <td class="fieldname" width="30%">Percentage of Financing</td>
              <td><bean:write name="FinanceForm" property="percentageFinancing"/>&nbsp;%
              <html:hidden property="percentageFinancing"/>
              </td>
              </tr>
              <tr class="odd">
              <td class="fieldname">Deal Finance Amount</td>
              <td><bean:write name="FinanceForm" property="dealFinanceAmt"/>&nbsp;
              <html:hidden property="dealFinanceAmt"/>
              </td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="30%">Actual Deal CMV</td>
                <td ><bean:write name="FinanceForm" property="actualDealCMV"/>&nbsp;
                <html:hidden property="actualDealCMV"/>
                </td>
              </tr>
              <tr class="odd">
                <td class="fieldname" width="30%">Actual Deal FSV</td>
                <td ><bean:write name="FinanceForm" property="actualDealFSV"/>&nbsp;
                <html:hidden property="actualDealFSV"/>
                </td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="30%">Adjusted Deal CMV</td>
                <td ><bean:write name="FinanceForm" property="dealCMV"/>&nbsp;
                <html:hidden property="dealCMV"/>
                </td>
              </tr>
              <tr class="odd">
                <td class="fieldname" width="30%">Adjusted Deal FSV</td>
                <td ><bean:write name="FinanceForm" property="dealFSV"/>&nbsp;
                <html:hidden property="dealFSV"/>
                </td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        </tbody>
      </table>
    </td>
  </tr>
  </tbody>
</table>
<%
    if (!from_event.equals(FinanceAction.EVENT_USER_PROCESS)) {
%>
<table width="82" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <%
        if (from_event.equals(FinanceAction.EVENT_PREPARE_CLOSE)) {
    %>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%  } else if (from_event.equals(FinanceAction.EVENT_TRACK)) { %>
    <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
        } else {
            String previous_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.previous_event");
            if (previous_event.equals(FinanceAction.EVENT_LIST)) {
    %>
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } else if (previous_event.equals(GeneralInfoAction.EVENT_LIST_CLOSED)) { %>
      <td colspan="2"><a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
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
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd -->
</html>

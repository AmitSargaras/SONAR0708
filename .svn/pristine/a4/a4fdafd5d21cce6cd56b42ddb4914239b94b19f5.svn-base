<%@ page import="com.integrosys.cms.ui.commoditydeal.dealinfo.DealInfoAction,
                 com.integrosys.cms.ui.commoditydeal.dealinfo.DealInfoForm,
                 com.integrosys.cms.ui.commoditydeal.CommDealSearchAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,
                 com.integrosys.cms.app.commodity.deal.bus.PriceType,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commodity.common.*,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.commoditydeal.dealinfo.PriceTypeList,
                 com.integrosys.cms.ui.reassignment.ReassignmentConstant"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/dealinfo/deal_info_process.jsp,v 1.26 2006/10/27 08:39:24 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.26 $
* Date: $Date: 2006/10/27 08:39:24 $
* Tag: $Name:  $
*/
%>
<%
    DealInfoForm aForm = (DealInfoForm)request.getAttribute("DealInfoForm");
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    ICommodityDeal actual = trxValue.getCommodityDeal();
    ICommodityDeal staging = trxValue.getStagingCommodityDeal();
    IProfile actualProfile = (IProfile)request.getAttribute("actualProfile");
    IProfile stageProfile = (IProfile)request.getAttribute("stageProfile");
    String previous = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.previous_event");
    Amount latestPriceAmt = (Amount)request.getAttribute("latestPrice");
    Date latestPriceDate = (Date)request.getAttribute("latestPriceUpdatedDate");
    Date marketPriceDate = (Date)request.getAttribute("marketPriceUpdatedDate");
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

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/cancel2.gif','img/calendarb.gif')">
<html:form action="DealInfo.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=DealInfoAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:20px">
  <tr>
    <td>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
        <thead>
          <tr>
            <td> <h3>Commodity</h3></td>
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
                <td class="fieldname"><bean:message key="label.cmdt.profile.cmdt.sub.type"/></td>
                <td> <bean:write name="DealInfoForm" property="conCommCategory"/>&nbsp;
                </td>
                <td class="<%=CompareOBUtil.compOB(stageProfile, actualProfile, "productType")?"fieldname":"fieldnamediff"%>"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>&nbsp;<font color="#0000FF">* </font></td>
                <td><bean:write name="DealInfoForm" property="conCommProductType"/>&nbsp;
                </td>
              </tr>
              <tr class="even">
                <td width="20%" class="<%=CompareOBUtil.compOB(stageProfile, actualProfile, "profileID")?"fieldname":"fieldnamediff"%>"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/>&nbsp;<font color="#0000FF">* </font></td>
                <td width="30%"><bean:write name="DealInfoForm" property="conCommProductSubType"/>&nbsp;
                </td>
                <%
                    PriceType actualPriceType = null;
                    PriceType stagePriceType = null;
                    if (actual != null) {
                        actualPriceType = actual.getContractPriceType();
                    }
                    if (staging != null) {
                        stagePriceType = staging.getContractPriceType();
                    }
                %>
                <td width="30%" class="<%=CompareOBUtil.compOB(stagePriceType, actualPriceType, "name")?"fieldname":"fieldnamediff"%>">Price Type</td>
                <td width="30%"><integro:empty-if-null value="<%=PriceTypeList.getPriceTypeItem(aForm.getConCommPriceType())%>"/>&nbsp;
                </td>
              </tr>
              <tr class="odd">
                <td class="fieldname">RIC</td>
                <td><bean:write name="DealInfoForm" property="conRIC"/>&nbsp;
                </td>
                  <td width="20%" class="fieldname">Latest Price</td>
                  <td width="30%">
                    <%  if (aForm.getConCommPriceType() != null) {
                        if ((aForm.getConCommPriceType().equals(PriceType.EOD_PRICE.getName())) ||
                            (aForm.getConCommPriceType().equals(PriceType.FLOATING_FUTURES_PRICE.getName()))) {
                    %>
                    <logic:present name="latestPrice">
                        <logic:empty name="latestPrice"> - </logic:empty>
                        <logic:notEmpty name="latestPrice">
                            <integro:amount amount="<%=latestPriceAmt%>" decimal="6"/>&nbsp&nbsp (Updated:<integro:date object="<%=latestPriceDate%>" simpleDateFormat="dd/MM/yyyy hh:mm a"/>)
                        </logic:notEmpty>
                    </logic:present>
                    <logic:notPresent name="latestPrice"> - </logic:notPresent>
                    <%      } else { %> - <% }
                   } else { %> - <% }
                    %>
                  </td>
              </tr>
            </table>
          </td>
          </tr>
        </tbody>
      </table>
      </td>
    </tr>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:20px">
  <tr>
    <td><fieldset>
      <h3>
        <legend>Contracted Deal</legend>
      </h3>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
        <thead>
          <tr>
            <td> <h3>Quantity</h3></td>
          </tr>
          <tr>
            <td> <hr/> </td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
                <tbody>
                <%
                    Quantity actualConQty = null;
                    Quantity stageConQty = null;
                    UOMWrapper actualConQtyUOM = null;
                    UOMWrapper stageConQtyUOM = null;
                    if (actual != null) {
                        actualConQty = actual.getContractQuantity();
                        if (actualConQty != null) {
                            actualConQtyUOM = actualConQty.getUnitofMeasure();
                        }
                    }
                    if (staging != null) {
                        stageConQty = staging.getContractQuantity();
                        if (stageConQty != null) {
                            stageConQtyUOM = stageConQty.getUnitofMeasure();
                        }
                    }
                %>
                  <tr class="odd">
                    <td class="<%=CompareOBUtil.compOB(stageConQty, actualConQty, "quantity")?"fieldname":"fieldnamediff"%>">Volume&nbsp;<font color="#0000FF">* </font></td>
                    <td><bean:write name="DealInfoForm" property="conQtyVolume"/>&nbsp;
                    </td>
                    <td class="<%=CompareOBUtil.compOB(stageConQtyUOM, actualConQtyUOM, "iD")?"fieldname":"fieldnamediff"%>">Unit of Measure&nbsp;<font color="#0000FF">* </font></td>
                    <td><bean:write name="DealInfoForm" property="conQtyUOM"/>&nbsp;
                    </td>
                  </tr>
                  <tr class="even">
                    <td width="20%" class="fieldname">Conversion to Market Unit</td>
                    <td width="30%"><bean:write name="DealInfoForm" property="conQtyMarketUnit"/>&nbsp;
                    </td>
                <td width="30%" class="fieldname">Conversion to Metric Unit </td>
                    <td width="30%"><bean:write name="DealInfoForm" property="conQtyMetricUnit"/>&nbsp;
                    </td>
                  </tr>
                </tbody>
              </table></td>
          </tr>
        </tbody>
      </table>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
        <thead>
        <tr>
          <td>
            <h3>Deal Differential</h3>
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
              <thead>
              <tr class="odd">
                <td colspan="4" style="text-align:left;padding-left:5px">Quantity
                  Differential</td>
              </tr>
              </thead> <tbody>
              <%
                  QuantityDifferential actualConQtyDiff = null;
                  QuantityDifferential stageConQtyDiff = null;
                  DifferentialSign actualSign = null;
                  DifferentialSign stageSign = null;
                  Quantity actualQty = null;
                  Quantity stageQty = null;
                  if (actual != null) {
                      actualConQtyDiff = actual.getContractQuantityDifferential();
                      if (actualConQtyDiff != null) {
                          actualSign = actualConQtyDiff.getSign();
                          actualQty = actualConQtyDiff.getQuantity();
                      }
                  }
                  if (staging != null) {
                      stageConQtyDiff = staging.getContractQuantityDifferential();
                      if (stageConQtyDiff != null) {
                          stageSign = stageConQtyDiff.getSign();
                          stageQty = stageConQtyDiff.getQuantity();
                      }
                  }
              %>
              <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(stageSign, actualSign, "name")?"fieldname":"fieldnamediff"%>">(+) or (-)</td>
                <td>
            <% if (aForm.getConQtyDiffPlusmn() != null) {
                if (aForm.getConQtyDiffPlusmn().equals(ICMSConstant.SIMPLE_SIGN_MINUS)) { %>
            -
            <% } else if (aForm.getConQtyDiffPlusmn().equals(ICMSConstant.SIMPLE_SIGN_PLUS)) { %>
            +
            <% } else if (aForm.getConQtyDiffPlusmn().equals(ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
                </td>
                <td class="fieldname">Unit of Measure</td>
                <td><bean:write name="DealInfoForm" property="conQtyDiffUOM"/>&nbsp;
                </td>
              </tr>
              <tr class="even">
                <td width="20%" class="<%=CompareOBUtil.compOB(stageQty, actualQty, "quantity")?"fieldname":"fieldnamediff"%>">Differential Value</td>
                <td width="30%"><bean:write name="DealInfoForm" property="conQtyDiffValue"/>&nbsp;
                </td>
                <td width="30%" class="fieldname">&nbsp;</td>
                <td width="30%">&nbsp;</td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
              <thead>
              <tr class="odd">
                <td colspan="4" style="text-align:left;padding-left:5px">Price
                  Differential</td>
              </tr>
              </thead> <tbody>
              <%
                  PriceDifferential actualPriceDiff = null;
                  PriceDifferential stagePriceDiff = null;
                  actualSign = null;
                  stageSign = null;
                  Amount actualAmt = null;
                  Amount stageAmt = null;
                  if (actual != null) {
                      actualPriceDiff = actual.getContractPriceDifferential();
                      if (actualPriceDiff != null) {
                          actualSign = actualPriceDiff.getSign();
                          actualAmt = actualPriceDiff.getPrice();
                      }
                  }
                  if (staging != null) {
                      stagePriceDiff = staging.getContractPriceDifferential();
                      if (stagePriceDiff != null) {
                          stageSign = stagePriceDiff.getSign();
                          stageAmt = stagePriceDiff.getPrice();
                      }
                  }
              %>
              <tr class="even">
                <td class="<%=CompareOBUtil.compOB(stageSign, actualSign, "name")?"fieldname":"fieldnamediff"%>" width="18%">(+) or (-)</td>
                <td width="27%">
            <% if (aForm.getConPriceDiffPlusmn() != null) {
                if (aForm.getConPriceDiffPlusmn().equals(ICMSConstant.SIMPLE_SIGN_MINUS)) { %>
            -
            <% } else if (aForm.getConPriceDiffPlusmn().equals(ICMSConstant.SIMPLE_SIGN_PLUS)) { %>
            +
            <% } else if (aForm.getConPriceDiffPlusmn().equals(ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
                </td>
                <td class="fieldname" width="27%">&nbsp;</td>
                <td width="28%">&nbsp;</td>
              </tr>
              <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal")?"fieldname":"fieldnamediff"%>" width="18%">Buyer / Seller Agreed Differential</td>
                <td width="27%"><bean:write name="DealInfoForm" property="conBuyerSellerAgreeDiff"/>&nbsp;
                </td>
                <%
                    actualAmt = null;
                    if (actual != null) {
                        actualAmt = actual.getContractPrice();
                    }

                    stageAmt = null;
                    if(staging != null ) {
                        stageAmt = staging.getContractPrice();
                    }
                    boolean isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
                    if (isSame) {
                        isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
                    }
                %>
                <td width="27%" class="<%=isSame?"fieldname":"fieldnamediff"%>">Contracted Price</td>
                <td width="28%"><bean:write name="DealInfoForm" property="conContractedPriceCcy"/>&nbsp;
                <bean:write name="DealInfoForm" property="conContractedPriceAmt"/>
                </td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        </tbody>
      </table>
      </fieldset></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:20px">
  <tr>
  <tr>
    <td><fieldset>
      <h3> <legend>Actual Deal</legend> </h3>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
        <thead>
        <tr>
          <td>
            <h3>Quantity</h3>
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
              <%
                  actualQty = null;
                  stageQty = null;
                  if (actual != null) {
                      actualQty = actual.getActualQuantity();
                  }
                  if (staging != null) {
                      stageQty = staging.getActualQuantity();
                  }
              %>
              <tr class="odd">
                <td class="<%=CompareOBUtil.compOB(stageQty, actualQty, "quantity")?"fieldname":"fieldnamediff"%>">Volume</td>
                <td><bean:write name="DealInfoForm" property="actQtyVolume"/>&nbsp;
                </td>
                <td class="fieldname">Unit of Measure</td>
                <td><bean:write name="DealInfoForm" property="actQtyUOM"/>&nbsp;
                </td>
              </tr>
              <tr class="even">
                <td width="20%" class="fieldname">Conversion to Market Unit</td>
                <td width="30%"><bean:write name="DealInfoForm" property="actQtyMarketUnit"/>&nbsp;
                </td>
                <td width="30%" class="fieldname">Conversion to Metric Unit </td>
                <td width="30%"><bean:write name="DealInfoForm" property="actQtyMetricUnit"/>&nbsp;
                </td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        </tbody>
      </table>
      <%
          actualAmt = null;
          stageAmt = null;
          if (actual != null) {
              actualAmt = actual.getActualPrice();
          }
          if (staging != null) {
              stageAmt = staging.getActualPrice();
          }
          boolean isAmtSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
          if (isAmtSame) {
              isAmtSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
          }

          actualPriceDiff = null;
          stagePriceDiff = null;
          actualSign = null;
          stageSign = null;
          actualAmt = null;
          stageAmt = null;
          if (actual != null) {
              actualPriceDiff = actual.getActualCommonDifferential();
              if (actualPriceDiff != null) {
                  actualSign = actualPriceDiff.getSign();
                  actualAmt = actualPriceDiff.getPrice();
              }
          }
          if (staging != null) {
              stagePriceDiff = staging.getActualCommonDifferential();
              if (stagePriceDiff != null) {
                  stageSign = stagePriceDiff.getSign();
                  stageAmt = stagePriceDiff.getPrice();
              }
          }
          boolean isCommonDiffSame = CompareOBUtil.compOB(stageSign, actualSign, "name");
          if (isCommonDiffSame) {
              isCommonDiffSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
          }
      %>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
      <%
          if (aForm.getConCommPriceType() != null) {
            if (aForm.getConCommPriceType().equals(PriceType.EOD_PRICE.getName()) ||
                aForm.getConCommPriceType().equals(PriceType.MANUAL_EOD_PRICE.getName())) {
      %>
        <tr>
          <td>
            <h3> Price Type - EOD</h3>
          </td>
        </tr>
        <tr>
          <td>
            <hr/>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="diveod" name="diveod">
              <tbody>
              <tr class="even">
                <td class="<%=CompareOBUtil.compOB(staging, actual, "actualMarketPriceDate")?"fieldname":"fieldnamediff"%>">Date</td>
                <td><bean:write name="DealInfoForm" property="actEODDate"/>&nbsp;
                <td class="fieldname"> Commodity Market Price (from feed)</td>
                <td><bean:write name="DealInfoForm" property="actEODMarketPrice"/>&nbsp;
                    <logic:notEmpty name="DealInfoForm" property="actEODMarketPrice">
                        <logic:present name="marketPriceUpdatedDate">
                            <logic:notEmpty name="marketPriceUpdatedDate">
                                (Updated:<integro:date object="<%=marketPriceDate%>" simpleDateFormat="dd/MM/yyyy hh:mm a"/>)
                            </logic:notEmpty>
                        </logic:present>
                    </logic:notEmpty>
                </td>
              </tr>
              <tr class="odd">
                <td width="20%" class="<%=isAmtSame?"fieldname":"fieldnamediff"%>" height="21"> Commodity Market
                  Price (manual)</td>
                <td width="30%" height="21"><bean:write name="DealInfoForm" property="actEODMarketPriceCcy"/>&nbsp;
                <bean:write name="DealInfoForm" property="actEODMarketPriceAmt"/>
                </td>
                <%
                    actualPriceDiff = null;
                    stagePriceDiff = null;
                    actualSign = null;
                    stageSign = null;
                    actualAmt = null;
                    stageAmt = null;
                    if (actual != null) {
                        actualPriceDiff = actual.getActualEODCustomerDifferential();
                        if (actualPriceDiff != null) {
                            actualSign = actualPriceDiff.getSign();
                            actualAmt = actualPriceDiff.getPrice();
                        }
                    }
                    if (staging != null) {
                        stagePriceDiff = staging.getActualEODCustomerDifferential();
                        if (stagePriceDiff != null) {
                            stageSign = stagePriceDiff.getSign();
                            stageAmt = stagePriceDiff.getPrice();
                        }
                    }
                boolean isDiffSame = CompareOBUtil.compOB(stageSign, actualSign, "name");
                if (isDiffSame) {
                    isDiffSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amount");
                }
                %>
                <td width="30%" class="<%=isDiffSame?"fieldname":"fieldnamediff"%>" height="21">Customer Differential</td>
                <td width="30%" height="21">
            <% if (aForm.getActEODCustDiffSign() != null) {
                if (aForm.getActEODCustDiffSign().equals(ICMSConstant.SIMPLE_SIGN_MINUS)) { %>
            -
            <% } else if (aForm.getActEODCustDiffSign().equals(ICMSConstant.SIMPLE_SIGN_PLUS)) { %>
            +
            <% } else if (aForm.getActEODCustDiffSign().equals(ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
                <bean:write name="DealInfoForm" property="actEODCustDiff"/>&nbsp;
                </td>
              </tr>
              <tr class="even">
                <td width="20%" class="<%=isCommonDiffSame?"fieldname":"fieldnamediff"%>" height="21">Commodity Differential</td>
                <td width="30%" height="21">
            <% if (aForm.getActEODCommDiffSign() != null) {
                if (aForm.getActEODCommDiffSign().equals(ICMSConstant.SIMPLE_SIGN_MINUS)) { %>
            -
            <% } else if (aForm.getActEODCommDiffSign().equals(ICMSConstant.SIMPLE_SIGN_PLUS)) { %>
            +
            <% } else if (aForm.getActEODCommDiffSign().equals(ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
                <bean:write name="DealInfoForm" property="actEODCommDiff"/>&nbsp;
                </td>
                <td width="30%" class="fieldname" height="21">Adjusted Pricing</td>
                <td width="30%" height="21"><bean:write name="DealInfoForm" property="actEODAdjustPrice"/>&nbsp;
                </td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <%
          } else if (aForm.getConCommPriceType().equals(PriceType.FLOATING_FUTURES_PRICE.getName()) ||
                  aForm.getConCommPriceType().equals(PriceType.MANUAL_FLOATING_FUTURES_PRICE.getName())) {
        %>
        <tr>
          <td>
            <h3> Price Type - Floating Futures Contract</h3>
          </td>
        </tr>
        <tr>
          <td>
            <hr/>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="diveod" name="diveod">
              <tbody>
              <tr class="even">
                <td class="<%=CompareOBUtil.compOB(staging, actual, "actualMarketPriceDate")?"fieldname":"fieldnamediff"%>">Date</td>
                <td><bean:write name="DealInfoForm" property="actFloatDate"/>&nbsp;
                <td class="fieldname">Market Price</td>
                <td><bean:write name="DealInfoForm" property="actFloatMarketPrice"/>&nbsp;
                    <logic:notEmpty name="DealInfoForm" property="actFloatMarketPrice">
                        <logic:present name="marketPriceUpdatedDate">
                            <logic:notEmpty name="marketPriceUpdatedDate">
                                (Updated:<integro:date object="<%=marketPriceDate%>" simpleDateFormat="dd/MM/yyyy hh:mm a"/>)
                            </logic:notEmpty>
                        </logic:present>
                    </logic:notEmpty>
                </td>
              </tr>
              <tr class="odd">
                <td width="20%" class="<%=isAmtSame?"fieldname":"fieldnamediff"%>" height="21">Commodity Market
                  Price (manual)</td>
                <td width="30%" height="21"><bean:write name="DealInfoForm" property="actFloatMarketPriceCcy"/>&nbsp;
                <bean:write name="DealInfoForm" property="actFloatMarketPriceAmt"/>
                </td>
                <td width="30%" class="fieldname" height="21">&nbsp;</td>
                <td width="30%" height="21">&nbsp;</td>
              </tr>
              <tr class="even">
                <td width="20%" class="fieldname" height="21">Buyer/Seller Agreed
                  Differential</td>
                <td width="30%" height="21">
            <% if (aForm.getConPriceDiffPlusmn() != null) {
                if (aForm.getConPriceDiffPlusmn().equals(ICMSConstant.SIMPLE_SIGN_MINUS)) { %>
            -
            <% } else if (aForm.getConPriceDiffPlusmn().equals(ICMSConstant.SIMPLE_SIGN_PLUS)) { %>
            +
            <% } else if (aForm.getConPriceDiffPlusmn().equals(ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
            <bean:write name="DealInfoForm" property="conBuyerSellerAgreeDiff"/>
                </td>
                <td width="30%" class="fieldname" height="21">Adjusted Pricing</td>
                <td width="30%" height="21"><bean:write name="DealInfoForm" property="actFloatAdjustPrice"/>&nbsp;
                </td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <%
          } else if (aForm.getConCommPriceType().equals(PriceType.FIXED_FUTURES_PRICE.getName())) {
        %>
        <tr>
          <td>
            <h3> Price Type - Fixed Futures Contract</h3>
          </td>
        </tr>
        <tr>
          <td>
            <hr/>
          </td>
        </tr>
        <tr>
          <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo" id="diveod" name="diveod">
              <tbody>
              <tr class="even">
                <td class="<%=isAmtSame?"fieldname":"fieldnamediff"%>" width="18%">Buyer/Seller Fixed Price</td>
                <td width="82%"><bean:write name="DealInfoForm" property="actFixBuySellFixPriceCcy"/>&nbsp;
                    <bean:write name="DealInfoForm" property="actFixBuySellFixPriceAmt"/>
                </td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <%
            } else if (aForm.getConCommPriceType().equals(PriceType.NON_RIC_PRICE.getName())){
		%>
				<%@ include file="view_price_type_non_ric.jsp" %>
	    <%	            
            } else if (aForm.getConCommPriceType().equals(PriceType.MANUAL_NON_RIC_PRICE.getName())) {
	    %>
	    		<%@ include file="process_price_type_non_ric.jsp" %>
	    <%
            }
          }
        %>
        <tr>
          <td>&nbsp;</td>
        </tr>
        </tbody>
      </table>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
        <tbody> </tbody>
      </table>
      </fieldset></td>
  </tr>
</table>
<table width="82" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
        <%
            if (previous != null && previous.equals(ReassignmentConstant.TASK_EVENT)) {
        %>
        <td colspan="2"><a href="Reassignment.do?event=search&reassignmentType=<%=ReassignmentConstant.TASK_TYPE_DEAL%>&searchType=<%=ReassignmentConstant.TASK_SEARCH_KEY%>&dealNo=<%=staging.getDealNo()%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)">
            <img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a>
        </td>
        <% } else { %>
        <td colspan="2"><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
        <% } %>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

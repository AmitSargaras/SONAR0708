<%@ page import="com.integrosys.cms.ui.commoditydeal.dealinfo.DealInfoAction,
                 com.integrosys.cms.ui.commoditydeal.dealinfo.DealInfoForm,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.CommDealSearchAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.commodity.deal.bus.ICommodityDeal,                 
                 com.integrosys.cms.app.commodity.deal.bus.PriceType,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.ui.commoditydeal.dealinfo.PriceTypeList"%>
<%@ page import="com.integrosys.cms.ui.commoditydeal.generalinfo.GeneralInfoAction"%>
<%@ page import="com.integrosys.base.businfra.currency.Amount"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/dealinfo/deal_info_view.jsp,v 1.25 2006/10/27 08:39:24 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.25 $
* Date: $Date: 2006/10/27 08:39:24 $
* Tag: $Name:  $
*/
%>
<%
    DealInfoForm aForm = (DealInfoForm)request.getAttribute("DealInfoForm");
    String from_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.from_event");
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    Amount latestPriceAmt = (Amount)request.getAttribute("latestPrice");
    Date latestPriceDate = (Date)request.getAttribute("latestPriceUpdatedDate");
    Date marketPriceDate = (Date)request.getAttribute("marketPriceUpdatedDate");

    ICommodityDeal dealObj;
    if (from_event.equals(DealInfoAction.EVENT_READ)) {
        dealObj = trxValue.getCommodityDeal();
    } else {
        dealObj = trxValue.getStagingCommodityDeal();
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
<body onload="MM_preloadImages('img/cancel2.gif','img/calendarb.gif')">
<html:form action="DealInfo.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=DealInfoAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="dealNo"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
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
                <td class="fieldname"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>&nbsp;<font color="#0000FF">* </font></td>
                <td><bean:write name="DealInfoForm" property="conCommProductType"/>&nbsp;
                </td>
              </tr>
              <tr class="even">
                <td width="20%" class="fieldname"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/>t&nbsp;<font color="#0000FF">* </font></td>
                <td width="30%"><bean:write name="DealInfoForm" property="conCommProductSubType"/>&nbsp;
                </td>
                <td width="30%" class="fieldname">Price Type</td>
                <td width="30%"><integro:empty-if-null value="<%=PriceTypeList.getPriceTypeItem(aForm.getConCommPriceType())%>"/>&nbsp;
                </td>
              </tr>
              <tr class="odd">
                <td class="fieldname">RIC</td>
                <td><bean:write name="DealInfoForm" property="conRIC"/>&nbsp;
                </td>
                <td width="30%" class="fieldname">Latest Price</td>
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
                  <tr class="odd">
                    <td class="fieldname">Volume&nbsp;<font color="#0000FF">* </font></td>
                    <td><bean:write name="DealInfoForm" property="conQtyVolume"/>&nbsp;
                    </td>
                    <td class="fieldname">Unit of Measure&nbsp;<font color="#0000FF">* </font></td>
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
              <tr class="odd">
                <td class="fieldname">(+) or (-)</td>
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
                <td width="20%" class="fieldname">Differential Value</td>
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
              <tr class="odd">
                <td class="fieldname" width="18%">(+) or (-)</td>
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
                <td class="fieldname" width="27%">Currency</td>
                <td width="28%">&nbsp;</td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="18%">Buyer / Seller Agreed Differential</td>
                <td width="27%"><bean:write name="DealInfoForm" property="conBuyerSellerAgreeDiff"/>&nbsp;
                </td>
                <td width="27%" class="fieldname">Contracted Price</td>
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
              <tr class="odd">
                <td class="fieldname">Volume</td>
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
                <td class="fieldname">Date
                <%if(aForm.getConCommPriceType().equals(PriceType.MANUAL_EOD_PRICE.getName())){%>
                        <font color="#0000FF">* </font>
                <%}%> </td> 

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
                <td width="20%" class="fieldname" height="21"> Commodity Market
                  Price (manual)
                <%if(aForm.getConCommPriceType().equals(PriceType.MANUAL_EOD_PRICE.getName())){%>
                        <font color="#0000FF">* </font>
                <%}%> </td> 

                <td width="30%" height="21"><bean:write name="DealInfoForm" property="actEODMarketPriceCcy"/>&nbsp;
                <bean:write name="DealInfoForm" property="actEODMarketPriceAmt"/>
                </td>
                <td width="30%" class="fieldname" height="21">Customer Differential</td>
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
                <td width="20%" class="fieldname" height="21">Commodity Differential</td>
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
                <td class="fieldname">Date
                <%if(aForm.getConCommPriceType().equals(PriceType.MANUAL_FLOATING_FUTURES_PRICE.getName())){%>
                        <font color="#0000FF">* </font>
                <%}%> </td> 

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
                <td width="20%" class="fieldname" height="21">Commodity Market
                  Price (manual)
                <%if(aForm.getConCommPriceType().equals(PriceType.MANUAL_FLOATING_FUTURES_PRICE.getName())){%>
                        <font color="#0000FF">* </font>
                <%}%> </td> 

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
              <!--EOD-->
              <tbody>
              <tr class="even">
                <td class="fieldname" width="18%">Buyer/Seller Fixed Price</td>
                <td width="82%"><bean:write name="DealInfoForm" property="actFixBuySellFixPriceCcy"/>&nbsp;
                    <bean:write name="DealInfoForm" property="actFixBuySellFixPriceAmt"/>
                </td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <%
            } else if (aForm.getConCommPriceType().equals(PriceType.NON_RIC_PRICE.getName())||
            		  aForm.getConCommPriceType().equals(PriceType.MANUAL_NON_RIC_PRICE.getName())) {
	    %>
	    		<%@ include file="view_price_type_non_ric.jsp" %>
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
<%
    if (!from_event.equals(DealInfoAction.EVENT_USER_PROCESS)) {
%>
<table width="82" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <%
        if (from_event.equals(DealInfoAction.EVENT_PREPARE_CLOSE)) {
    %>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%  } else if (from_event.equals(DealInfoAction.EVENT_TRACK)) { %>
    <td><a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/return2.gif',1)"><img src="img/return1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
        } else {
            String previous_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.previous_event");
            if (previous_event.equals(DealInfoAction.EVENT_LIST)) {
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
<!-- InstanceEnd --></html>

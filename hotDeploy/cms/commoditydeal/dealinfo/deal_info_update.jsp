<%@ page import="com.integrosys.cms.ui.commoditydeal.dealinfo.DealInfoAction,
                 com.integrosys.cms.ui.commoditydeal.dealinfo.DealInfoForm,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealConstant,
                 com.integrosys.cms.ui.commoditydeal.CommDealSearchAction,
                 com.integrosys.cms.ui.commoditydeal.CommodityDealAction,
                 com.integrosys.cms.app.commodity.deal.bus.PriceType,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.cms.app.commodity.deal.trx.ICommodityDealTrxValue,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ICommodityCollateral,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.commodity.main.bus.profile.IProfile,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 java.util.Date"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/dealinfo/deal_info_update.jsp,v 1.37 2006/10/27 08:39:24 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.37 $
* Date: $Date: 2006/10/27 08:39:24 $
* Tag: $Name:  $
*/
%>
<%
    ICommodityDealTrxValue trxValue = (ICommodityDealTrxValue)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.commodityDealTrxValue");
    ICommodityCollateral dealCollateral = (ICommodityCollateral)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.dealCollateral");
    IProfile profile = (IProfile)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.profileService");
    
    DealInfoForm aForm = (DealInfoForm)request.getAttribute("DealInfoForm");
    Amount latestPriceAmt = (Amount)request.getAttribute("latestPrice");
    Date latestPriceDate = (Date)request.getAttribute("latestPriceUpdatedDate");
    Date marketPriceDate = (Date)request.getAttribute("marketPriceUpdatedDate");

    boolean isNewDeal = false;
    if (trxValue.getCommodityDeal() == null) {
        isNewDeal = true;
    }
%>
<% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>
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
        document.forms[0].action="CommodityDeal.do";
        document.forms[0].event.value = "<%=CommodityDealAction.EVENT_LIST%>";
    }
    if (num == 2) {
        document.forms[0].action="CommDealSearch.do";
        document.forms[0].event.value="<%=CommDealSearchAction.EVENT_LIST%>";
    }

    document.forms[0].submit();
}


function refreshPage(num) {
    for (i = 0; i < document.forms[0].elements.length; i++) {
		document.forms[0].elements[i].disabled = false;
	}

    document.forms[0].event.value="<%=CommodityDealAction.EVENT_REFRESH%>";
    if (num == 0) {
        document.forms[0].conCommPriceTypeChange.value="<%=ICMSConstant.TRUE_VALUE%>";
    }
    if (num ==1) {
        document.forms[0].conCommPriceType.value="";    
        document.forms[0].conCommPriceTypeChange.value="<%=ICMSConstant.TRUE_VALUE%>";
	}
    if (num == 2) {
        document.forms[0].conCommProductSubType.value="";
    }
    document.forms[0].submit();
}

function changeUOM() {
    var UOM = document.forms[0].conQtyUOM.value;
    document.forms[0].conQtyDiffUOM.value = UOM;
    document.forms[0].actQtyUOM.value = UOM;
}
//-->
</script>

	
<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/cancel2.gif','img/calendarb.gif')">
<html:form action="DealInfo.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=DealInfoAction.EVENT_EDIT%>"/>
<input type="hidden" name="next_page"/>
<input type="hidden" name="conCommPriceTypeChange"/>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:20px">
  <tr>
    <td>
      <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
        <thead>
          <tr>
            <td> <h3>Commodity</h3></td>
            <td align="right" valign="bottom">
                <input type="button" name="button3" id="refresh" value="Refresh" class="btnNormal" onclick="refreshPage(3)"/>
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
                <td class="fieldname" width="20%"><bean:message key="label.cmdt.profile.cmdt.sub.type"/></td>
                <td width="30%"> <bean:write name="DealInfoForm" property="conCommCategory"/>&nbsp;
                <html:hidden property="conCommCategory"/>
                </td>
                <td width="20%" class="fieldname"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>&nbsp;<font color="#0000FF">* </font></td>
                <td width="30%">
                <html:select property="conCommProductType" onchange="refreshPage(2)" disabled="<%=!isNewDeal%>">
	              <option value="" >Please Select </option>
	              <html:options name="productTypeID" labelName="productTypeValue"/>
                </html:select>
                <html:errors property="conCommProductType"/>
                </td>
              </tr>
              <tr class="even">
                <td width="20%" class="fieldname"><bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/>&nbsp;<font color="#0000FF">* </font></td>
                <td width="30%">
                <html:select property="conCommProductSubType" onchange="refreshPage(1)" disabled="<%=!isNewDeal%>">
	              <option value="" >Please Select </option>
	              <html:options name="productSubTypeID" labelName="productSubTypeValue"/>
                </html:select>
                <html:errors property="conCommProductSubType"/>
                </td>
                <td width="20%" class="fieldname">Price Type</td>
                <td width="30%">
                <html:select property="conCommPriceType" onchange="refreshPage(0)" >
	              <option value="" >Please Select </option>
	              <html:options name="priceTypeID" labelName="priceTypeValue"/>
                </html:select>
                <html:errors property="conCommPriceType"/>
                </td>
              </tr>
              <tr class="odd">
                <td class="fieldname">RIC</td>
                <td ><bean:write name="DealInfoForm" property="conRIC"/>&nbsp;
                <html:hidden property="conRIC"/>
                <html:errors property="conRIC"/>
                </td>
                <td width="20%" class="fieldname">Latest Price</td>
                <td width="30%">
                <%  if (aForm.getConCommPriceType() != null) {
                        if ((aForm.getConCommPriceType().equals(PriceType.EOD_PRICE.getName())) ||
                            (aForm.getConCommPriceType().equals(PriceType.FLOATING_FUTURES_PRICE.getName()))||
                            (aForm.getConCommPriceType().equals(PriceType.NON_RIC_PRICE.getName()))) {
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
              <tbody> </tbody>
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
                    <td>
                        <html:text property="conQtyVolume" maxlength="27"/>
                        <html:errors property="conQtyVolume"/>
                    </td>
                    <td class="fieldname">Unit of Measure&nbsp;<font color="#0000FF">* </font></td>
                    <td>
                    <html:select property="conQtyUOM" onchange="changeUOM()" >
	                  <option value="" >Please Select </option>
	                  <html:options name="uomID" labelName="uomValue"/>
                    </html:select>
                    <html:errors property="conQtyUOM"/>
                    </td>
                  </tr>
                  <tr class="even">
                    <td width="20%" class="fieldname">Conversion to Market Unit</td>
                    <td width="30%"><bean:write name="DealInfoForm" property="conQtyMarketUnit"/>
                    &nbsp;<html:hidden property="conQtyMarketUnit"/>
                    </td>
                <td width="20%" class="fieldname">Conversion to Metric Unit </td>
                    <td width="30%"><bean:write name="DealInfoForm" property="conQtyMetricUnit"/>
                    &nbsp;<html:hidden property="conQtyMetricUnit"/>
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
                <td width="20%" class="fieldname">(+) or (-)</td>
                <td width="30%">
                <html:radio property="conQtyDiffPlusmn" value="<%=ICMSConstant.SIMPLE_SIGN_PLUS%>">+</html:radio>
                &nbsp;&nbsp;
                <html:radio property="conQtyDiffPlusmn" value="<%=ICMSConstant.SIMPLE_SIGN_MINUS%>">-</html:radio>
                &nbsp;&nbsp;
                <html:radio property="conQtyDiffPlusmn" value="<%=ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS%>" disabled="true">&plusmn;</html:radio>
                &nbsp;
                <html:errors property="conQtyDiffPlusmn"/>
                </td>
                <td width="20%" class="fieldname">Unit of Measure</td>
                <td width="30%">
                    <html:select property="conQtyDiffUOM" disabled="true">
	                  <option value="" >Please Select </option>
	                  <html:options name="uomID" labelName="uomValue"/>
                    </html:select>
                    <html:errors property="conQtyDiffUOM"/>
                </td>
              </tr>
              <tr class="even">
                <td width="20%" class="fieldname">Differential Value</td>
                <td width="30%">
                  <html:text property="conQtyDiffValue" maxlength="27"/>
                  <html:errors property="conQtyDiffValue"/>
                </td>
                <td width="20%" class="fieldname">&nbsp;</td>
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
                <html:radio property="conPriceDiffPlusmn" value="<%=ICMSConstant.SIMPLE_SIGN_PLUS%>">+</html:radio>
                &nbsp;&nbsp;
                <html:radio property="conPriceDiffPlusmn" value="<%=ICMSConstant.SIMPLE_SIGN_MINUS%>">-</html:radio>
                &nbsp;&nbsp;
                <html:radio property="conPriceDiffPlusmn" value="<%=ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS%>" disabled="true">&plusmn;</html:radio>
                &nbsp;
                <html:errors property="conPriceDiffPlusmn"/>
                </td>
                <td class="fieldname" width="20%">&nbsp;</td>
                <td width="30%">&nbsp;</td>
              </tr>
              <tr class="even">
                <td class="fieldname" width="20%">Buyer / Seller Agreed Differential</td>
                <td width="30%">
                    <html:text property="conBuyerSellerAgreeDiff" maxlength="20"/>
                    <html:errors property="conBuyerSellerAgreeDiff"/>
                </td>
                <td width="20%" class="fieldname">Contracted Price</td>
                <td width="30%">
                    <html:select property="conContractedPriceCcy">
	                  <option value="" >Please Select </option>
	                  <html:options name="currencyCode" labelName="currencyCode"/>
                    </html:select>
                    <html:errors property="conContractedPriceCcy"/>
                  <html:text property="conContractedPriceAmt" maxlength="27"/>
                  <html:errors property="conContractedPriceAmt"/>
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
                <td>
                  <html:text property="actQtyVolume" maxlength="27"/>
                  <html:errors property="actQtyVolume"/>
                </td>
                <td class="fieldname">Unit of Measure</td>
                <td>
                    <html:select property="actQtyUOM" disabled="true">
	                  <option value="" >Please Select </option>
	                  <html:options name="uomID" labelName="uomValue"/>
                    </html:select>
                    <html:errors property="actQtyUOM"/>
                </td>
              </tr>
              <tr class="even">
                <td width="20%" class="fieldname">Conversion to Market Unit</td>
                <td width="30%"><bean:write name="DealInfoForm" property="actQtyMarketUnit"/>&nbsp;
                <html:hidden property="actQtyMarketUnit"/>
                </td>
                <td width="30%" class="fieldname">Conversion to Metric Unit </td>
                <td width="30%"><bean:write name="DealInfoForm" property="actQtyMetricUnit"/>&nbsp;
                <html:hidden property="actQtyMetricUnit"/>
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
                boolean isManual = false;
                if (aForm.getConCommPriceType().equals(PriceType.MANUAL_EOD_PRICE.getName())) {
                    isManual = true;
                }
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

                <td>
             <html:text property="actEODDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" <%=isManual?"onclick=\"return showCalendar('actEODDate', 'dd/mm/y');\"":""%> onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="actEODDate"/>
                <td class="fieldname"> Commodity Market Price (from feed)</td>
                <td><bean:write name="DealInfoForm" property="actEODMarketPrice"/>&nbsp;&nbsp;
                <logic:notEmpty name="DealInfoForm" property="actEODMarketPrice">
                    <logic:present name="marketPriceUpdatedDate">
                        <logic:notEmpty name="marketPriceUpdatedDate">
                            (Updated:<integro:date object="<%=marketPriceDate%>" simpleDateFormat="dd/MM/yyyy hh:mm a"/>)
                        </logic:notEmpty>
                    </logic:present>
                </logic:notEmpty>
                <html:hidden property="actEODMarketPrice"/>
                </td>
              </tr>
              <tr class="odd">
                <td width="20%" class="fieldname" height="21"> Commodity Market
                  Price (manual)
                <%if(aForm.getConCommPriceType().equals(PriceType.MANUAL_EOD_PRICE.getName())){%>
                        <font color="#0000FF">* </font>
                <%}%> </td> 

                </td>
                <td width="30%" height="21">
                    <html:select property="actEODMarketPriceCcy" disabled="<%=!isManual%>">
	                  <option value="" >Please Select </option>
	                  <html:options name="currencyCode" labelName="currencyCode"/>
                    </html:select>
                    <html:errors property="actEODMarketPriceCcy"/>
                    <html:text property="actEODMarketPriceAmt" maxlength="27" disabled="<%=!isManual%>"/>
                    <html:errors property="actEODMarketPriceAmt"/>
                </td>
              <%
                if (dealCollateral != null &&
                        (aForm.getActEODCustDiffSign() == null || aForm.getActEODCustDiffSign().length() == 0)) {
                    aForm.setActEODCustDiffSign(dealCollateral.getApprovedCustomerDifferentialSign());
                }
                if (dealCollateral != null && dealCollateral.getApprovedCustomerDifferential() != null &&
                        (aForm.getActEODCustDiff() == null || aForm.getActEODCustDiff().length() == 0)) {
                    aForm.setActEODCustDiff(UIUtil.formatNumber(dealCollateral.getApprovedCustomerDifferential(), 6, locale));
                }
              %>
                <td width="30%" class="fieldname" height="21">Customer Differential</td>
                <td width="30%" height="21">
                <html:radio property="actEODCustDiffSign" value="<%=ICMSConstant.SIMPLE_SIGN_PLUS%>">+</html:radio>
                &nbsp;&nbsp;
                <html:radio property="actEODCustDiffSign" value="<%=ICMSConstant.SIMPLE_SIGN_MINUS%>">-</html:radio>
                &nbsp;&nbsp;
                <html:radio property="actEODCustDiffSign" value="<%=ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS%>" disabled="true">&plusmn;</html:radio>
                &nbsp;&nbsp;
                <html:errors property="actEODCustDiffSign"/>
                <html:text property="actEODCustDiff" maxlength="27"/>
                <html:errors property="actEODCustDiff"/>
                </td>
              </tr>
              <%
                if (profile != null && 
                        (aForm.getActEODCommDiffSign() == null || aForm.getActEODCommDiffSign().length() == 0)) {
                    aForm.setActEODCommDiffSign(profile.getDifferentialSign());
                }
                if (profile != null && profile.getPriceDifferential() != null &&
                        (aForm.getActEODCommDiff() == null || aForm.getActEODCommDiff().length() == 0)) {
                    aForm.setActEODCommDiff(UIUtil.formatNumber(profile.getPriceDifferential(), 6, locale));
                }
              %>
              <tr class="even">
                <td width="20%" class="fieldname" height="21">Commodity Differential</td>
                <td width="30%" height="21">
                <html:radio property="actEODCommDiffSign" value="<%=ICMSConstant.SIMPLE_SIGN_PLUS%>">+</html:radio>
                &nbsp;&nbsp;
                <html:radio property="actEODCommDiffSign" value="<%=ICMSConstant.SIMPLE_SIGN_MINUS%>">-</html:radio>
                &nbsp;&nbsp;
                <html:radio property="actEODCommDiffSign" value="<%=ICMSConstant.SIMPLE_SIGN_PLUS_OR_MINUS%>" disabled="true">&plusmn;</html:radio>
                &nbsp;&nbsp;
                <html:errors property="actEODCommDiffSign"/>
                  <html:text property="actEODCommDiff" maxlength="27"/>
                  <html:errors property="actEODCommDiff"/>
                </td>
                <td width="30%" class="fieldname" height="21">Adjusted Pricing</td>
                <td width="30%" height="21"><bean:write name="DealInfoForm" property="actEODAdjustPrice"/>&nbsp;
                <html:hidden property="actEODAdjustPrice"/>
                </td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <%
          } else if (aForm.getConCommPriceType().equals(PriceType.FLOATING_FUTURES_PRICE.getName()) ||
                  aForm.getConCommPriceType().equals(PriceType.MANUAL_FLOATING_FUTURES_PRICE.getName())) {
              boolean isManual = false;
              if (aForm.getConCommPriceType().equals(PriceType.MANUAL_FLOATING_FUTURES_PRICE.getName())) {
                  isManual = true;
              }
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
                <%if(isManual){%>
                        <font color="#0000FF">* </font>
                <%}%> </td> 

                <td>
			  <html:text property="actFloatDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" <%=isManual?"onclick=\"return showCalendar('actFloatDate', 'dd/mm/y');\"":""%> onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="actFloatDate"/>
                <td class="fieldname">Market Price</td>
                <td><bean:write name="DealInfoForm" property="actFloatMarketPrice"/>&nbsp;&nbsp;
                <logic:notEmpty name="DealInfoForm" property="actFloatMarketPrice">
                    <logic:present name="marketPriceUpdatedDate">
                        <logic:notEmpty name="marketPriceUpdatedDate">
                            (Updated:<integro:date object="<%=marketPriceDate%>" simpleDateFormat="dd/MM/yyyy hh:mm a"/>)
                        </logic:notEmpty>
                    </logic:present>
                </logic:notEmpty>
                <html:hidden property="actFloatMarketPrice"/>
                </td>
              </tr>
              <tr class="odd">
                <td width="20%" class="fieldname" height="21">Commodity Market
                  Price (manual)

                <%if(isManual){%>
                        <font color="#0000FF">* </font>
                <%}%> </td> 

                <td width="30%" height="21">
                    <html:select property="actFloatMarketPriceCcy" disabled="<%=!isManual%>">
	                  <option value="" >Please Select </option>
	                  <html:options name="currencyCode" labelName="currencyCode"/>
                    </html:select>
                    <html:errors property="actFloatMarketPriceCcy"/>
                  <html:text property="actFloatMarketPriceAmt" maxlength="27" disabled="<%=!isManual%>" />
                  <html:errors property="actFloatMarketPriceAmt"/>
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
                <html:hidden property="actFloatAdjustPrice"/>
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
                <td class="fieldname" width="18%">Buyer/Seller Fixed Price</td>
                <td width="82%">
                    <html:select property="actFixBuySellFixPriceCcy">
	                  <option value="" >Please Select </option>
	                  <html:options name="currencyCode" labelName="currencyCode"/>
                    </html:select>
                    <html:errors property="actFixBuySellFixPriceCcy"/>
                  <html:text property="actFixBuySellFixPriceAmt" maxlength="27"/>
                  <html:errors property="actFixBuySellFixPriceAmt"/>
                </td>
              </tr>
              </tbody>
            </table>
          </td>
        </tr>
        <%
            } else if(aForm.getConCommPriceType().equals(PriceType.NON_RIC_PRICE.getName())||
            		  aForm.getConCommPriceType().equals(PriceType.MANUAL_NON_RIC_PRICE.getName())) {
	            boolean isManual = false;
                if (aForm.getConCommPriceType().equals(PriceType.MANUAL_NON_RIC_PRICE.getName())) {
                    isManual = true;
                }
        %>        		
        
				<%@ include file="update_price_type_non_ric.jsp" %>
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
    <td width="82">&nbsp;</td>
  </tr>
  <tr>
    <%
        if (trxValue.getStatus().equals(ICMSConstant.STATE_REJECTED) ||
                trxValue.getStatus().equals(ICMSConstant.STATE_DRAFT)) {
    %>
    <td><a href="ToDo.do" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
        } else {
            String previous_event = (String)session.getAttribute("com.integrosys.cms.ui.commoditydeal.CommodityDealAction.previous_event");
            if (previous_event.equals(DealInfoAction.EVENT_LIST)) {
    %>
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <%
            } else {
    %>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image1"border="0" id="Image1" /></a></td>
    <% } } %>
  </tr>
  <tr>
    <td style="text-align:center" width="82">&nbsp;</td>
  </tr>
</table>
</html:form>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

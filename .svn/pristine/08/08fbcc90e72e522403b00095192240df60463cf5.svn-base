<%@ page import="com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.ui.common.ForexHelper,
                 com.integrosys.cms.app.commodity.deal.bus.OBCommodityDealSearchResult,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.app.customer.bus.ICMSCustomer,
                 com.integrosys.cms.app.customer.bus.OBCustomerSearchResult,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.cms.app.collateral.bus.OBCollateral,
                 java.util.*,
                 com.integrosys.cms.app.commodity.deal.bus.PriceType,
                 com.integrosys.cms.ui.common.constant.IGlobalConstant,
                 com.integrosys.cms.app.limit.bus.ILimitProfile,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.app.common.util.CommonUtil,
                 com.integrosys.cms.app.commodity.deal.proxy.ICommodityDealProxy,
                 com.integrosys.cms.app.commodity.deal.proxy.CommodityDealProxyFactory,
                 com.integrosys.cms.app.commodity.deal.bus.CommodityDealException,
                 com.integrosys.cms.app.commodity.common.AmountConversionException"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/Commodity_exposure_summary.jsp,v 1.37 2006/10/27 08:30:40 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.37 $
* Date: $Date: 2006/10/27 08:30:40 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("from_page");
    SearchResult rs = (SearchResult) request.getAttribute("dealList");
	SearchResult outerCustomerResult = (SearchResult) request.getAttribute("outerLimitBCAList");
    ICMSCustomer customerOB = (ICMSCustomer)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.cms.ui.common.constant.IGlobalConstant.GLOBAL_CUSTOMER_OBJ);
    ILimitProfile limitProfileOB =  (ILimitProfile)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.cms.ui.common.constant.IGlobalConstant.GLOBAL_LIMITPROFILE_OBJ);
    Collection col ;
    Collection outerCustomerCol = null;
    if (outerCustomerResult != null) {
	    outerCustomerCol = outerCustomerResult.getResultList();
    }
    
    if(rs!=null)
     col = (Collection) rs.getResultList();
    else col=null;
     OBCollateral obCol = new OBCollateral();
    double USDColHeldAmt =0;
    double USDspTxnAmt =0;
    double USDcolPoolEODAmt =0;
    double USDcolPoolFutureAmt =0;
    double USDcshSetOffAmt =0;
    double USDcshReqAmt =0;
    double USDcshComfortAmt = 0;
    double USDfaceValueAmt = 0;
    double USDeligibleValueAmt = 0;
    ForexHelper fr = new ForexHelper();
    CurrencyCode usd= new CurrencyCode(CommonUtil.getBaseCurrency());
    
    CountryList countryList = CountryList.getInstance();
%>
<% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %> <% if(col!=null && col.size()!=0)  {%>
       <%
             OBCommodityDealSearchResult deal[] = (OBCommodityDealSearchResult[])col.toArray(new OBCommodityDealSearchResult[0]);
             if(deal!=null && deal.length!=0)
               {

                                     %>
      <%
            for (int i = 0 ; i < deal.length; i++) {
                try {      // Grand Total - Face Value
                                    if(USDfaceValueAmt!=ICMSConstant.LONG_INVALID_VALUE)
                                    {
                                        if(deal[i].getFaceValueAmt()!=null)
                                        {
                                        USDfaceValueAmt = USDfaceValueAmt + fr.convertAmount(deal[i].getFaceValueAmt(),usd);
                                        }
                                    }
                                } catch(Exception e) {
                                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                                        USDfaceValueAmt = ICMSConstant.LONG_INVALID_VALUE;
                                     }
                try {      // Grand Total - Eligible Value
                                    if(USDeligibleValueAmt!=ICMSConstant.LONG_INVALID_VALUE)
                                    {
                                        if(deal[i].getEligibleFaceValue()!=null)
                                        {
                                        USDeligibleValueAmt = USDeligibleValueAmt + fr.convertAmount(deal[i].getEligibleFaceValue(),usd);
                                        }
                                    }
                                } catch(Exception e) {
                                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                                        USDeligibleValueAmt = ICMSConstant.LONG_INVALID_VALUE;
                                     }
                try {      // Total Amount Collateral Held
                                    if(USDColHeldAmt!=ICMSConstant.LONG_INVALID_VALUE)
                                    {
                                        if(deal[i].getDealCMV()!=null)
                                        {
                                        USDColHeldAmt = USDColHeldAmt + fr.convertAmount(deal[i].getDealCMV(),usd);
                                        }
                                    }
                                } catch(Exception e) {
                                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                                        USDColHeldAmt = ICMSConstant.LONG_INVALID_VALUE;
                                     }


                  try {      // Total Specific Transactions
                    if(USDspTxnAmt!=ICMSConstant.LONG_INVALID_VALUE)
                    {
                        if(deal[i].getDealTypeCode()!=null && deal[i].getDealTypeCode().equals(ICMSConstant.DEAL_TYPE_SPECIFIC_TRANSACTION))
                        {
                        USDspTxnAmt = USDspTxnAmt + fr.convertAmount(deal[i].getDealAmt(),usd);
                        }
                    }
                } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDspTxnAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }


                try {        // Total Collateral Pool /EOD
                                   if(USDcolPoolEODAmt!=ICMSConstant.LONG_INVALID_VALUE)
                                   {
                                       if(deal[i].getDealTypeCode()!=null && deal[i].getDealTypeCode().equals(ICMSConstant.DEAL_TYPE_COLLATERAL_POOL))
                                       {
                                           if(deal[i].getPriceType()!=null && (deal[i].getPriceType().equals(PriceType.EOD_PRICE.getName()) || deal[i].getPriceType().equals(PriceType.MANUAL_EOD_PRICE.getName())))   {
                                                USDcolPoolEODAmt = USDcolPoolEODAmt + fr.convertAmount(deal[i].getDealAmt(),usd);
                                           }
                                       }
                                   }
                               } catch(Exception e) {
                                       DefaultLogger.error(this, "Caught Forex Exception!", e);
                                       USDcolPoolEODAmt = ICMSConstant.LONG_INVALID_VALUE;
                                    }
                try {     //Total Collateral Pool/Futures
                                                   if(USDcolPoolFutureAmt!=ICMSConstant.LONG_INVALID_VALUE)
                                                   {
                                                       if(deal[i].getDealTypeCode()!=null && deal[i].getDealTypeCode().equals(ICMSConstant.DEAL_TYPE_COLLATERAL_POOL))
                                                       {
                                                          if(deal[i].getPriceType()!=null && (deal[i].getPriceType().equals(PriceType.FIXED_FUTURES_PRICE.getName()) ||  deal[i].getPriceType().equals(PriceType.FLOATING_FUTURES_PRICE.getName()) || deal[i].getPriceType().equals(PriceType.MANUAL_FLOATING_FUTURES_PRICE.getName())) )
                                                           {
                                                                USDcolPoolFutureAmt = USDcolPoolFutureAmt + fr.convertAmount(deal[i].getDealAmt(),usd);
                                                           }
                                                       }
                                                   }
                                               } catch(Exception e) {
                                                       DefaultLogger.error(this, "Caught Forex Exception!", e);
                                                       USDcolPoolFutureAmt = ICMSConstant.LONG_INVALID_VALUE;
                                                    }

                     try {      // Total Cash (for Set-off)
                    if(USDcshSetOffAmt!=ICMSConstant.LONG_INVALID_VALUE)
                    {
                        if(deal[i].getActualCashSetOffRecdAmt()!=null)
                        {
                        USDcshSetOffAmt = USDcshSetOffAmt + fr.convertAmount(deal[i].getActualCashSetOffRecdAmt(),usd);
                        }
                    }
                } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDcshSetOffAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }
                try {      //Total Cash (for Comfort)
                                 if(USDcshComfortAmt!=ICMSConstant.LONG_INVALID_VALUE)
                                 {
                                     if(deal[i].getActualCashComfortRecdAmt()!=null)
                                     {
                                     USDcshComfortAmt = USDcshComfortAmt + fr.convertAmount(deal[i].getActualCashComfortRecdAmt(),usd);
                                     }
                                 }
                             } catch(Exception e) {
                                     DefaultLogger.error(this, "Caught Forex Exception!", e);
                                     USDcshComfortAmt = ICMSConstant.LONG_INVALID_VALUE;
                                  }
                try {      //Total Cash (for Requirement)
                                                if(USDcshReqAmt!=ICMSConstant.LONG_INVALID_VALUE)
                                                {
                                                    if(deal[i].getActualCashReqRecdAmt()!=null)
                                                    {
                                                    USDcshReqAmt = USDcshReqAmt + fr.convertAmount(deal[i].getActualCashReqRecdAmt(),usd);
                                                    }
                                                }
                                            } catch(Exception e) {
                                                    DefaultLogger.error(this, "Caught Forex Exception!", e);
                                                    USDcshReqAmt = ICMSConstant.LONG_INVALID_VALUE;
                                                 }




            } // end of for
          }       // end of if(deal!=null && deal.length!=0)
        }
          Amount USDColHeldAmount = new Amount(USDColHeldAmt,usd);
          Amount USDspTxnAmount  = new Amount(USDspTxnAmt,usd);
          Amount USDcolPoolEODAmount  = new Amount(USDcolPoolEODAmt,usd);
          Amount USDcolPoolFutureAmount  = new Amount(USDcolPoolFutureAmt,usd);
          Amount USDcshSetOffAmount =  new Amount(USDcshSetOffAmt,usd);
          Amount USDcshComfortAmount = new Amount(USDcshComfortAmt,usd);
          Amount USDcshReqAmount =    new Amount(USDcshReqAmt,usd);
          Amount USDfaceValueAmount =  new Amount(USDfaceValueAmt,usd);
          Amount USDeligibleValueAmount = new Amount(USDeligibleValueAmt,usd);

      %>




<html>
<head>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function returnPage(returnEvent) {
    if (returnEvent == "<%=CommodityMainAction.EVENT_READ%>") {
        document.forms[0].event.value = "<%=CommodityMainAction.EVENT_READ_RETURN%>";
    }
    if (returnEvent == "<%=CommodityMainAction.EVENT_PREPARE_UPDATE%>") {
        document.forms[0].event.value = "<%=CommodityMainAction.EVENT_UPDATE_RETURN%>";
    }
    if (returnEvent == "<%=CommodityMainAction.EVENT_PROCESS%>") {
        document.forms[0].event.value = "<%=CommodityMainAction.EVENT_PROCESS_RETURN%>";
    }
    if (returnEvent == "<%=CommodityMainAction.EVENT_PREPARE_CLOSE%>") {
        document.forms[0].event.value = "<%=CommodityMainAction.EVENT_CLOSE_RETURN%>";
    }
    if (returnEvent == "<%=CommodityMainAction.EVENT_TRACK%>") {
        document.forms[0].event.value = "<%=CommodityMainAction.EVENT_TRACK_RETURN%>";
    }
    document.forms[0].submit();
}
//-->
</script>

</head>

<body>
<html:form action="CommodityMain.do">
<input type="hidden" name="event"/>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
      <tr>
        <td width="100%">
			<h3><legend><bean:message key="label.security.exposure.summary"/></legend></h3>
		</td>
      </tr>
      <tr>
        <td> <h3><bean:message key="label.security.col.summary"/></h3></td>
      </tr>
      <tr>
        <td><hr/></td>
      </tr>
      <tr>
        <td>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:message key="label.security.cust.id"/></td>
          <td width="30%"><%if (customerOB!=null &&  customerOB.getCMSLegalEntity()!=null) {%><integro:empty-if-null value="<%=customerOB.getCMSLegalEntity().getLEReference()%>"/>
           <%}else {%> -
          <%}%>&nbsp;</td>
           <td width="20%" class="fieldname"><bean:message key="label.customer.name"/></td>
          <td width="30%"><%if (customerOB!=null) {%>
         <integro:empty-if-null value="<%=customerOB.getCustomerName()%>"/>
            <%}else {%> -
          <%}%>&nbsp;</td>
        </tr>
        <thead> </thead> <tbody>
        <tr class="even">
          <td class="fieldname" width="26%"><bean:message key="label.security.total.col.pool.eod"/></td>
          <td width="23%">
            <%
                if(USDcolPoolEODAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDcolPoolEODAmount%>" param="amount" locale="<%=locale%>"/>
              <% } else { %>
                Forex Error
              <% } %>
          </td>
          <td class="fieldname" width="26%"><bean:message key="label.security.total.col.pool.futures"/></td>
          <td width="25%">
        <%
            if(USDcolPoolFutureAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDcolPoolFutureAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname" width="26%"><bean:message key="label.security.totla.spec.transac"/></td>
          <td width="23%">
          <%
                if(USDspTxnAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDspTxnAmount%>" param="amount" locale="<%=locale%>"/>
              <% } else { %>
                Forex Error
              <% } %>

          </td>
          <td class="fieldname" width="26%"><bean:message key="label.security.total.cash"/></td>
          <td width="25%">
              <%  if(USDcshSetOffAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDcshSetOffAmount%>" param="amount" locale="<%=locale%>"/>
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="26%">Total Cash (for Comfort)</td>
          <td width="25%">
              <%  if(USDcshComfortAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDcshComfortAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>
          </td>
          <td class="fieldname" width="26%"><bean:message key="label.security.total.cash.req"/></td>
          <td width="25%">
              <%  if(USDcshReqAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDcshReqAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                Forex Error
              <% } %>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="26%"><bean:message key="label.security.total.amt.col.held"/></td>
          <td width="23%">
            <%
                if(USDColHeldAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDColHeldAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                Forex Error
              <% } %>

          </td>
          <td class="fieldname" width="26%">&nbsp;</td>
          <td width="25%">&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname" width="26%"><bean:message key="label.security.grand.total.face"/> </td>
          <td width="23%">
           <%
                if(USDfaceValueAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDfaceValueAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                Forex Error
              <% } %>
          </td>
          <td class="fieldname" width="26%"><bean:message key="label.security.grand.total.eligible"/></td>
          <td width="25%">
                <%
                if(USDeligibleValueAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDeligibleValueAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>
          </td>
        </tr>
        </tbody>
      </table>
    </td>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table><br><bean:message key="label.security.note"/> <br>
<bean:message key="label.security.grand.total.face.summ.individual"/>
<br>
<bean:message key="label.security.grand.total.eligible.summ.individual"/> <br>
 <br>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
      <tr>
        <td width="100%"> <h3><bean:message key="label.security.deal.summ"/></h3></td>
      </tr>
      <tr>
        <td><hr/></td>
      </tr>
      <tr>
        <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
        <tr>
          <td width="3%"><bean:message key="label.global.sn"/></td>
          <td width="7%"><bean:message key="label.security.commodity.type"/></td>
          <td width="8%"><bean:message key="label.cmdt.profile.cmdt.prd.type"/>/<bean:message key="label.cmdt.profile.cmdt.prd.sub.type"/></td>
          <td width="7%"><bean:message key="label.security.tp.deal.ref"/></td>
          <td width="13%"><bean:message key="label.security.deal.no"/></td>
          <td width="12%"><bean:message key="label.security.deal.amt"/></td>
          <td width="5%"><bean:message key="label.gmra.deal.market.price"/></td>
          <td width="6%"><bean:message key="label.security.qty"/></td>
          <td width="6%"><bean:message key="label.security.deal.cmv"/></td>
          <td width="7%"><bean:message key="label.security.deal.fsv"/></td>
          <td width="6%"><bean:message key="label.security.deal.secure.status"/></td>
          <td width="13%"><bean:message key="label.security.cash.reqmt.amt"/></td>
        </tr>
        </thead>

        <tbody>
       <%    if(col!=null && col.size()!=0){%>
          <% double USDdealAmt =0;
             double USDdealCMV =0;
             double USDdealFSV =0;
             double USDcadshReqAmt=0;
           %>
        <% if(col!=null && col.size()!=0)  {%>
       <%
            OBCommodityDealSearchResult deal[] = (OBCommodityDealSearchResult[])col.toArray(new OBCommodityDealSearchResult[0]);
            if(deal!=null && deal.length!=0)
               {

                                     %>
      <%
            for (int i = 0 ; i < deal.length; i++) {
                if(deal[i]!=null) {
          %>
            <tr class="<%=i%2==0?"odd":"even"%>">
            <td class="index" width="2%"><%=i + 1%></td>
            <td width="5%">
            <% if(deal[i].getDealTypeCode()!=null){%>
            <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.DEAL_TYPE, deal[i].getDealTypeCode())%>"/>
        <%} else {%>-
         <%}%>&nbsp;</td>
            <td width="6%">
             <% if(deal[i].getProdTypeCode()!=null && deal[i].getCategoryCode()!=null)  {%>
               <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommProductItem(deal[i].getCategoryCode(), deal[i].getProdTypeCode())%>"/>
             <%} else {%>
              -
           <% }%>
        &nbsp;/<integro:empty-if-null value="<%=deal[i].getProdSubtypeCode()%>"/>&nbsp;
            </td>
            <td width="5%"><integro:empty-if-null value="<%=deal[i].getDealReferenceNo()%>"/>&nbsp;</td>
            <td width="7%"><integro:empty-if-null value="<%=deal[i].getDealNo()%>"/>&nbsp;</td>
            <td class="amount" width="10%"><integro:amount amount="<%=deal[i].getDealAmt()%>" locale="<%=locale%>" />&nbsp;</td>
            <td class="amount" width="6%"><integro:amount amount="<%= deal[i].getMarketPrice()%>" locale="<%=locale%>" decimal="6" />&nbsp;</td>
            <td class="amount" width="9%">
             <% if((deal!=null) && (deal[i].getQuantity()!=null) && (deal[i].getQuantity().getUnitofMeasure()!=null) &&
                     (deal[i].getQuantity().getQuantity() != null &&
                     deal[i].getQuantity().getQuantity().doubleValue() >0) ) {%>
              <%=UIUtil.formatNumber(deal[i].getQuantity().getQuantity(),4, locale)%>&nbsp;
            <%} else { %>
                     -
            <%}%>
            <% if((deal!=null) && (deal[i].getQuantity()!=null) && (deal[i].getQuantity().getUnitofMeasure()!=null) && (deal[i].getQuantity().getUnitofMeasure().getLabel()!=null) ) {%>
            <%=deal[i].getQuantity().getUnitofMeasure().getLabel()%>
            <%}%>
            </td>
            <td class="amount" width="10%"><integro:amount amount="<%=deal[i].getDealCMV()%>" locale="<%=locale%>" />&nbsp;</td>
            <td class="amount" width="6%"><integro:amount amount="<%=deal[i].getDealFSV()%>" locale="<%=locale%>" />&nbsp;</td>
              <td width="5%" style="text-align:center"><integro:boolean-display style="yn" value="<%=deal[i].getIsDealSecured()%>"/>&nbsp;</td>

            <td class="amount" width="8%">
            <%if(deal[i].getActualCashReqRecdAmt()!=null && deal[i].getActualCashReqRecdAmt().getAmount()==ICMSConstant.DOUBLE_INVALID_VALUE && deal[i].getActualCashReqRecdAmt().getCurrencyCode().equals("")) {%>
            <bean:message key="label.security.forex.err"/>
            <%} else {%>
            <integro:amount amount="<%=deal[i].getActualCashReqRecdAmt()%>" locale="<%=locale%>" />&nbsp;
            <%}%></td>

          </tr>
          <%
                }  //   if(deal[i]!=null)
          %>

          <%
                try {
                    if(USDdealAmt!=ICMSConstant.LONG_INVALID_VALUE)
                        USDdealAmt = USDdealAmt + fr.convertAmount(deal[i].getDealAmt(),usd);
                } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDdealAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }

                try {
                 if(USDdealCMV!=ICMSConstant.LONG_INVALID_VALUE)
                        USDdealCMV = USDdealCMV + fr.convertAmount(deal[i].getDealCMV(),usd);
                  } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDdealCMV = ICMSConstant.LONG_INVALID_VALUE;
                     }
                try {
                if(USDdealFSV!=ICMSConstant.LONG_INVALID_VALUE)
                        USDdealFSV = USDdealFSV + fr.convertAmount(deal[i].getDealFSV(),usd);

                 } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDdealFSV = ICMSConstant.LONG_INVALID_VALUE;
                     }
                 try {
               if(USDcadshReqAmt!=ICMSConstant.LONG_INVALID_VALUE)
               {    if(deal[i].getActualCashReqRecdAmt()!=null)
                        USDcadshReqAmt = USDcadshReqAmt + fr.convertAmount(deal[i].getActualCashReqRecdAmt(),usd);
               }

               } catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDcadshReqAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }

            } %>
           <% Amount USDdealAmount = new Amount(USDdealAmt,usd);
              Amount USDdealCMVAmount = new Amount(USDdealCMV,usd);
              Amount USDdealFSVAmount = new Amount(USDdealFSV,usd);
              Amount USDcadshReqAmount = new Amount(USDcadshReqAmt,usd);
           %>
                 <tr class="odd">
            <td class="total" >&nbsp;</td>
            <td class="total">&nbsp;</td>
            <td class="total" >&nbsp;</td>
            <td class="total" >&nbsp;</td>                                    
            <td class="total" ><bean:message key="label.security.total"/></td>
            <td class="total" style="text-align:left" width="9%">
             <%
                if(USDdealAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDdealAmount%>" param="amount" locale="<%=locale%>"/>
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>

            </td>
            <td class="total" width="5%">&nbsp;</td>
            <td width="8%" class="total">&nbsp;</td>
            <td width="9%" class="total">
             <%
                if(USDdealCMVAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDdealCMVAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>
            </td>
            <td class="total" style="text-align:right" width="9%">
            <%
                if(USDdealFSVAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDdealFSVAmount%>" param="amount" locale="<%=locale%>"/>
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>
            </td>
            <td class="total" style="text-align:right" width="4%">&nbsp;</td>
            <td class="total" style="text-align:right" width="8%">
             <%
                if(USDcadshReqAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USDcadshReqAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>
            </td>
          </tr>
        <%     }       // end  of    if(deal!=null && deal.length!=0)
             }
          %>
<% }else{%>
        <tr class="odd"><td colspan="16"><bean:message key="label.security.deal.none"/></td></tr>
<% } %>
          </tbody>

      </table>
    </td>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>
     <%  int count=0;
      int sno=0;
     %>
  <logic:present name="limitObList" property="limits" >
           <logic:iterate id="subObj" name="limitObList" property="limits" type="com.integrosys.cms.app.limit.bus.OBLimit" >
           <%
               count=1;
           %>
         </logic:iterate>
</logic:present><br> <br>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection" dwcopytype="CopyTableRow">
  <thead>
    <tr>
      <td>
      <h3><bean:message key="label.security.limit.summ"/></h3>
    </td>
    </tr>
    <tr>
      <td><hr /></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table  width="100%" class="tblinfo" style="margin-top:0" border="0" cellspacing="0" cellpadding="0">
        <thead>
        <tr>
          <td width="3%"><bean:message key="label.global.sn"/></td>
          <td width="7%"><bean:message key="label.limit.id"/></td>
          <td width="7%"><bean:message key="label.global.outer.limit.id"/></td>
          <td width="10%"><bean:message key="label.security.le.id"/>/<br><bean:message key="label.customer.name"/></td>
          <td width="7%"><bean:message key="label.security.bca.ref"/>/<br><bean:message key="label.security.bca.booking.loc"/></td>
          <td width="10%"><bean:message key="label.product.desc"/></td>
          <td width="7%"><bean:message key="label.limit.booking.location"/></td>
          <td width="7%"><bean:message key="label.limit.approved.limit"/></td>
          <td width="7%"><bean:message key="label.security.activated.limit"/> </td>
          <td width="7%"><bean:message key="label.limit.operational.limit"/></td>
          <td width="7%"><bean:message key="label.security.id"/></td>
          <td width="7%" nowrap><bean:message key="label.security.type"/>/<br/>
            <bean:message key="label.security.subtype"/></td>
          <td width="7%"><bean:message key="label.security.loc"/></td>
		  <td width="7%"><bean:message key="label.org.code "/></td>
        </tr>
        </thead>
               <%if(count==1){%>
        <tbody>
         <% double USDappAmt =0;
            double USDactAmt =0;
            double USDopAmt =0;

            Iterator itrCustomer = outerCustomerCol.iterator();
           %>
          <logic:present name="limitObList" property="limits" >
           <logic:iterate id="subObj" name="limitObList" property="limits" type="com.integrosys.cms.app.limit.bus.OBLimit" >

            <%
               String rowClass="";
       				sno++;
      				if(sno%2!=0){
          				 rowClass="odd";
      				 }else{
          				 rowClass="even";
      				 }
                    Amount appAmtLimit = subObj.getApprovedLimitAmount();
                    Amount actAmtLimit = subObj.getActivatedLimitAmount();
                    ICommodityDealProxy dealproxy = CommodityDealProxyFactory.getProxy();
                    Amount opAmtLimit = new Amount();
                    String opAmtLimitForexErr ="";
                    try {
                      opAmtLimit  = dealproxy.getOuterOperationalLimit(limitProfileOB,subObj);
                    }catch(CommodityDealException e)
                    {
                        opAmtLimitForexErr="Forex Error";

                    } catch(Exception e){
                          opAmtLimitForexErr="Forex Error";
                    }

                     String outerLimitRef ="0";
                     String limitRef = subObj.getLimitRef();
                     boolean isInnerLimit = (subObj.getOuterLimitRef()!=null && 
                     	(!subObj.getOuterLimitRef().equals("")) &&
                     	(!subObj.getOuterLimitRef().equals("0")));
                     if(subObj.getOuterLimitRef()!=null && (!subObj.getOuterLimitRef().equals("")))
                        outerLimitRef = subObj.getOuterLimitRef();
                     String collaterallocation="-";
                     String limitbookinglocation="-";
                     try {
                         if(outerLimitRef.equals("0"))
                         {
                    if((subObj.getLimitStatus()!=null) && (!subObj.getLimitStatus().equals(ICMSConstant.STATE_DELETED)))
                        {

                         if(USDappAmt!=ICMSConstant.LONG_INVALID_VALUE)
                        USDappAmt = USDappAmt + fr.convertAmount(appAmtLimit,usd);
                    }
                 }
                     }
                     catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDappAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }
                     try {
                          if(outerLimitRef.equals("0"))
                         {
                         if(USDactAmt!=ICMSConstant.LONG_INVALID_VALUE)
                            USDactAmt = USDactAmt + fr.convertAmount(actAmtLimit,usd);
                          }
                     }
                     catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex EXception!", e);
                        USDactAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }
                 try {
                        if(outerLimitRef.equals("0"))
                         {
                            if(opAmtLimitForexErr!=null && !(opAmtLimitForexErr.equals("Forex Error")))
                            {
                          if(USDopAmt!=ICMSConstant.LONG_INVALID_VALUE)
                            USDopAmt = USDopAmt + fr.convertAmount(opAmtLimit,usd);
                            }else {
                                     USDopAmt =ICMSConstant.LONG_INVALID_VALUE;
                            }
                        }
                     }
                     catch(Exception e) {
                        DefaultLogger.error(this, "Caught Forex Exception!", e);
                        USDopAmt = ICMSConstant.LONG_INVALID_VALUE;
                     }
                String prodDesc= "-";
                if(subObj.getProductDesc()!=null)
                     {
                         if(CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, subObj.getProductDesc().toString())!=null)
                        prodDesc=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.PRODUCT_DESCRIPTION, subObj.getProductDesc().toString());
                     }
                     
                     OBCustomerSearchResult obCustomer = (OBCustomerSearchResult)itrCustomer.next();
                     %>

             <tr class="<%=rowClass%>">
             <td class="index"  valign="top"  width="3%" ><%=sno%></td>
             <td   valign="top" ><%=limitRef%>&nbsp; <br>
        <%if((subObj.getLimitStatus()!=null) && (subObj.getLimitStatus().equals(ICMSConstant.STATE_DELETED)))
            {%>
              <font color="#FF0000" size="1">Deleted</font>
              <%}%>

             </td>
          <td <%=subObj.getIsInnerOuterSameBCA()?"":"class=outerlimit"%> valign="top"><integro:empty-if-null value="<%=isInnerLimit?subObj.getOuterLimitRef():null%>"/></td>
		  <td valign="top">
		  <% if (obCustomer != null) { %>
		  <integro:empty-if-null value="<%=obCustomer.getLegalReference()%>"/>
		  <br>
		  <integro:empty-if-null value="<%=obCustomer.getLegalName()%>"/>
		  <% } else { %>-<% } %>&nbsp;
		  </td>
		  <td valign="top">
		  <% if (obCustomer != null) { %>
		  <integro:empty-if-null value="<%=obCustomer.getInstructionRefNo()%>"/>
		  <br>
		  <integro:empty-if-null value="<%=countryList.getCountryName(obCustomer.getOrigLocCntry())%>"/>
		  <% } else { %>-<% } %>&nbsp;
		  </td>
              <td  nowrap="nowrap" valign="top" ><%=prodDesc%>&nbsp;</td>
              <td  nowrap="nowrap" valign="top" >
              <integro:empty-if-null value="<%=countryList.getCountryName(subObj.getBookingLocation().getCountryCode())%>"/>&nbsp;
              </td>

              <td valign="top" class="amount">&nbsp;
               <%if(appAmtLimit!=null && appAmtLimit.getCurrencyCode()!=null) {%>
            <%=appAmtLimit.getCurrencyCode()%>&nbsp;
            <%}%>
              <%if(outerLimitRef.equals("0")){%>
               <integro:amount amount="<%=appAmtLimit%>" param="amount" locale="<%=locale%>" /></td>
               <%} else {%>
                (<integro:amount amount="<%=appAmtLimit%>" param="amount" locale="<%=locale%>" />)</td>
                <%}%>
              <td  valign="top" class="amount">&nbsp;
                <%if(actAmtLimit!=null && actAmtLimit.getCurrencyCode()!=null) {%>
            <%=actAmtLimit.getCurrencyCode()%>&nbsp;
            <%}%>
               <%if(outerLimitRef.equals("0")){%>
               <integro:amount amount="<%=actAmtLimit%>" param="amount" locale="<%=locale%>" /></td>
               <%} else {%>
                (<integro:amount amount="<%=actAmtLimit%>" param="amount" locale="<%=locale%>" />)</td>
                <%}%>
               <td valign="top">
               <%if(opAmtLimitForexErr!=null && opAmtLimitForexErr.equals("Forex Error")) {%>
                                <%=opAmtLimitForexErr%>&nbsp;
               <%}else {    %>
                <%if(opAmtLimit!=null && opAmtLimit.getCurrencyCode()!=null) {%>
               <%=opAmtLimit.getCurrencyCode()%>&nbsp;
               <%}%>
               <%if(outerLimitRef.equals("0")){%>
                <integro:amount amount="<%=opAmtLimit%>" param="amount" locale="<%=locale%>" />&nbsp;
                <%} else {%>
                (<integro:amount amount="<%=opAmtLimit%>" param="amount" locale="<%=locale%>" /> )&nbsp;
                 <%}
               }%>
              </td>
               <td valign="top">
              <%int numberOfCol=0;%>
                 <logic:present name="subObj"  property="collateralAllocations">
                              <logic:iterate id="subObj1" name="subObj" property="collateralAllocations" type="com.integrosys.cms.app.limit.bus.OBCollateralAllocation" >
                            <%=subObj1.getCollateral().getSCISecurityID()%>&nbsp;   <br>
                            <%numberOfCol=1;%>
                </logic:iterate>
                </logic:present>
                <%if(numberOfCol==0){%>
                -&nbsp;<%}%>

              </td>
              <td nowrap="nowrap" valign="top">
                  <% numberOfCol=0;%>
              <logic:present name="subObj"  property="collateralAllocations">
                              <logic:iterate id="subObj1" name="subObj" property="collateralAllocations" type="com.integrosys.cms.app.limit.bus.OBCollateralAllocation" >
                            <%=subObj1.getCollateral().getCollateralType().getTypeName()%>/
                            <%=subObj1.getCollateral().getCollateralSubType().getSubTypeName()%>&nbsp;<br>
                             <%numberOfCol=1;%>
                </logic:iterate>
                </logic:present>
                  <%if(numberOfCol==0){%>
                -&nbsp;<%}%>

                </td>
              <td nowrap="nowrap" valign="top">
                 <% numberOfCol=0;%>
                 <logic:present name="subObj"  property="collateralAllocations">
                              <logic:iterate id="subObj1" name="subObj" property="collateralAllocations" type="com.integrosys.cms.app.limit.bus.OBCollateralAllocation" >
                <integro:empty-if-null value="<%=countryList.getCountryName(subObj1.getCollateral().getCollateralLocation())%>"/>&nbsp;   <br>
                            <%numberOfCol=1;%>
                </logic:iterate>
                </logic:present>
                 <%if(numberOfCol==0){%>
                -&nbsp;<%}%>
              </td>
			      <td nowrap="nowrap" valign="top">
                 <% numberOfCol=0;%>
                 <logic:present name="subObj"  property="collateralAllocations">
                              <logic:iterate id="subObj1" name="subObj" property="collateralAllocations" type="com.integrosys.cms.app.limit.bus.OBCollateralAllocation" >
                <integro:empty-if-null value="<%=subObj1.getCollateral().getSecurityOrganization()%>"/>
				&nbsp;   <br>
                            <%numberOfCol=1;%>
                </logic:iterate>
                </logic:present>
                 <%if(numberOfCol==0){%>
                -&nbsp;<%}%>
              </td>
            </tr>
             </logic:iterate>
            </logic:present>
              <% Amount USapprovedAmount = new Amount(USDappAmt,usd);
                 Amount USactivatedAmount = new Amount(USDactAmt,usd);
                 Amount USopAmount = new Amount(USDopAmt,usd);
              %>

            <tr class="odd">
              <td class="total" valign="top" >&nbsp;</td>
              <td valign="top" class="total" >&nbsp;</td>
              <td class="total" >&nbsp;</td>
              <td class="total" >&nbsp;</td>              
              <td valign="top" class="total" >&nbsp;</td>
              <td valign="top" class="total" >&nbsp;</td>
              <td valign="top" class="total" style="text-align:right;padding-right:3px">Total</td>
              <td valign="top" class="total" style="text-align:right;padding-right:3px">
              <%
                if(USapprovedAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
              %>
                <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USapprovedAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>
              </td>
              <td valign="top" class="total" style="text-align:right;padding-right:3px">
              <%
               if(USactivatedAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
               %>
               <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USactivatedAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>     </td>
              <td class="total" >
              <%
               if(USopAmount.getAmount() != ICMSConstant.LONG_INVALID_VALUE) {
               %>
               <%=CommonUtil.getBaseCurrency()%>&nbsp;<integro:amount amount="<%=USopAmount%>" param="amount" locale="<%=locale%>" />
              <% } else { %>
                <bean:message key="label.security.forex.err"/>
              <% } %>
              </td>
              <td class="total" >&nbsp;</td>
              <td class="total" >&nbsp;</td>
              <td valign="top" class="total">&nbsp;</td>
              <td class="total">&nbsp;</td>
            </tr>
          </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>

<%}
else {   %>
                    <table width="460" height="210" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
  <thead>
  </thead>
  <tbody>
    <tr class="odd">
      <td style="text-align:center" valign="middle"><table width="400" height="150" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td class="even" style="text-align:center" valign="middle">
                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                  <tr class="even">
                    <td style="border:none;text-align:center"><strong><img src="img/info.gif" /></strong></td>
                  </tr>
                  <tr class="even">
                    <td style="border:none;text-align:center">
                      <strong><font size="2"><br /><bean:message key="label.global.not.found"/></font></strong>
                    </td>
                  </tr>
                </table> </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
         <%       }        %>

<table width="54" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="54">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="javascript:returnPage('<%=from_event%>')" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/return2.gif',1)"><img src="img/return1.gif" name="Image51" border="0" id="Image5" /></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
  </table>

</html:form>

</body>
</html>

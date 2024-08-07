<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.techinfra.propertyfile.PropertyManager,
                 com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.cms.app.collateral.bus.OBCollateralSearchResult,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.ui.collateral.SecuritySubTypeUtil,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.customer.CategoryCodeConstant,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.businfra.search.SearchResult,
                 com.integrosys.cms.app.commodity.deal.bus.OBCommodityDealSearchResult,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 java.util.*,
                 com.integrosys.cms.ui.common.UIUtil"%>
 <%
   /**
     * Copyright Integro Technologies Pte Ltd
     * $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/deal_list.jsp,v 1.20 2006/10/27 08:38:43 hmbao Exp $
     * @author $Author: hmbao $<br>
     * @version $Revision: 1.20 $
     * @since $Date: 2006/10/27 08:38:43 $
     * Tag: $Name:  $
     */
 %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%

    com.integrosys.cms.ui.commoditydeal.CommDealSearchForm aForm = (com.integrosys.cms.ui.commoditydeal.CommDealSearchForm) request.getAttribute("CommDealSearchForm");
    Vector v = new Vector();
    v = (Vector)aForm.getSearchResult();
    if(v!=null) {
       pageContext.setAttribute("dealList",v);

    }

 %>
 <% Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY); %>




<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
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

function gotopage(aLocation) {
	window.location = aLocation;
}

//-->
</script>


<SCRIPT language="JavaScript">

</script>

<!-- InstanceEndEditable -->
</head>
<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif');">
<html:form action="CommDealSearch.do?event=list">
<%    if(v.size()!=0){%>
  <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
    <thead>
      <tr>
        <td width="100%"><h3>
            <legend></legend>
          </h3></td>
      </tr>
      <tr>
        <td> <h3> Deal Found</h3></td>
      </tr>
      <tr>
        <td><hr/></td>
      </tr>
      <tr>
        <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
          <tr>
            <td width="6%">Type</td>
            <td width="8%">Commodity Product Type/Sub-Type</td>
            <td width="6%">TP Deal Reference</td>
            <td width="12%">Deal No</td>
            <td width="10%">Deal Amount</td>
            <td width="6%">Market Price</td>
            <td width="9%">Qty</td>
            <td width="10%">Deal CMV</td>
            <td width="6%">Deal FSV</td>
            <td width="5%">Deal <br>
              Secure Status</td>
            <td width="3%">Deal<br>
               Closed </td>
            <td width="12%">Cash Reqmt Amount</td>
            <td width="7%">Action</td>
          </tr>

          </thead> <tbody>

          <% if(v!=null && v.size()!=0)  {%>
            <%
             OBCommodityDealSearchResult deal = (OBCommodityDealSearchResult)v.elementAt(0);
             if(deal!=null)
               {
                                     %>
		    <tr class="odd">
            <td width="6%">
            <% if(deal.getDealTypeCode()!=null){%>
            <integro:empty-if-null value="<%=CommonDataSingleton.getCodeCategoryLabelByValue( CategoryCodeConstant.DEAL_TYPE, deal.getDealTypeCode())%>"/>
        <%} else {%>-
         <%}%>&nbsp;</td>
            <td width="8%">
            <% if(deal.getProdTypeCode()!=null && deal.getCategoryCode()!=null)  {%>
               <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommProductItem(deal.getCategoryCode(), deal.getProdTypeCode())%>"/>
             <%} else {%>
              -
           <% }%>
           &nbsp;/<integro:empty-if-null value="<%=deal.getProdSubtypeCode()%>"/>&nbsp;</td>
            <td width="6%"><integro:empty-if-null value="<%=deal.getDealReferenceNo()%>"/>&nbsp;</td>
            <td width="12%"><integro:empty-if-null value="<%=deal.getDealNo()%>"/>&nbsp;</td>
            <td class="amount" width="10%"><integro:amount amount="<%=deal.getDealAmt()%>" locale="<%=locale%>" decimal="2"/>&nbsp;</td>
            <td class="amount" width="6%"><integro:amount amount="<%=deal.getMarketPrice()%>" locale="<%=locale%>" decimal="6" />&nbsp;</td>
            <td width="9%">
             <% if((deal!=null) && (deal.getQuantity()!=null) && (deal.getQuantity().getUnitofMeasure()!=null) &&
                     (deal.getQuantity().getQuantity() != null && deal.getQuantity().getQuantity().doubleValue() > 0) ) {%>
              <%=UIUtil.formatNumber(deal.getQuantity().getQuantity(),4,locale)%>&nbsp;
             <%} else { %>
                     -
            <%}%>
            <% if((deal!=null) && (deal.getQuantity()!=null) && (deal.getQuantity().getUnitofMeasure()!=null) && (deal.getQuantity().getUnitofMeasure().getLabel()!=null) ) {%>
            <%=deal.getQuantity().getUnitofMeasure().getLabel()%>
            <%}%>

            </td>
            <td class="amount" width="10%"><integro:amount amount="<%=deal.getDealCMV()%>" locale="<%=locale%>" />&nbsp;</td>
            <td class="amount" width="6%"><integro:amount amount="<%=deal.getDealFSV()%>" locale="<%=locale%>" />&nbsp;</td>
            <td class="amount" width="5%" style="text-align:center"><integro:boolean-display style="yn" value="<%=deal.getIsDealSecured()%>"/>&nbsp;</td>
            <td class="amount" width="3%" style="text-align:center"><integro:boolean-display style="yn" value="<%=deal.getIsDealClosed()%>"/>&nbsp;</td>
            <td class="amount" width="12%"><integro:amount amount="<%=deal.getCashReqAmt()%>" locale="<%=locale%>" />&nbsp;</td>
            <%
                   String path ="CommodityDeal.do?event=read&previous=search&dealID=";
                    if(deal.getDealID()>0)
                  path ="CommodityDeal.do?event=read&previous=search&dealID="+deal.getDealID();%>
                   <td style="text-align:center" width="7%"><a href="<%=path%>">
              View</a></td>
          </tr>

          </tbody>
        </table>
      </td>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>

  <%}
   }
}else{%>

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
                 <%}                       %>
</html:form>
</body>
</html>


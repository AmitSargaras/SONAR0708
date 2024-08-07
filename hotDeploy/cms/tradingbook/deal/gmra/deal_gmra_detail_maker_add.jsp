<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.CommonCodeList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 java.util.*,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 com.integrosys.cms.ui.tradingbook.deal.gmra.ProductTypeList,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADeal,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADealVal,
                 com.integrosys.cms.app.tradingbook.bus.OBCPAgreementDetail"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: $
*
* Describe this JSP.
* Purpose: For Maker to add new the GMRA Deal detail
* Description: add new the GMRA Deal detail value by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    Collection currencyCode = CurrencyList.getInstance().getCountryValues();
    pageContext.setAttribute("currencyCode", currencyCode);

    CountryList list = CountryList.getInstance();
    Collection countryValues = list.getCountryValues ();
    Collection countryLabels = list.getCountryLabels ();
    pageContext.setAttribute("countryValues", countryValues);
    pageContext.setAttribute("countryLabels", countryLabels);

    ProductTypeList list1 = ProductTypeList.getInstance();
    Collection productCode = list1.getProductTypeListID ();
    Collection productLabel = list1.getProductTypeListValue ();
    pageContext.setAttribute("productCode", productCode);
    pageContext.setAttribute("productLabel", productLabel);

    String event = request.getParameter("event");
    IGMRADealVal[] parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealAction.CPAgreementDetail");
    com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealForm aForm = (com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealForm) request.getAttribute("GMRADealForm");
    OBCPAgreementDetail obTrxValue = null;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.OBGMRADealSummary");
        obTrxValue = (OBCPAgreementDetail)obj;
   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'OBGMRADealSummary' ");
   }

   HashMap hm = new HashMap();

    if("maker_add_deal_confirm".equals(event)){
       String dealCountry = aForm.getDealCountry();
       if(! (dealCountry.equals(null) || dealCountry.equals("")) ){
         CommonCodeList commonCode = CommonCodeList.getInstance(dealCountry, ICMSConstant.CATEGORY_CODE_BKGLOC, true);
         pageContext.setAttribute("dealBranchListID", commonCode.getCommonCodeValues());
         pageContext.setAttribute("dealBranchListValue", commonCode.getCommonCodeLabels());

       }

    }
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function gotoPreviousPage() {
    document.forms[0].action = "GMRADeal.do?event=view_gmra_deal_detail&agreementID=<%=obTrxValue.getAgreementID()%>&limitProfileID=<%=obTrxValue.getLimitProfileID()%>";
    document.forms[0].submit();
}

function submitPage() {
    document.forms[0].action = "GMRADeal.do?event=maker_add_deal_confirm";
    document.forms[0].submit();
}

function changeMbbBranch() {
    document.forms[0].action = "GMRADeal.do?event=refresh_maker_add_deal";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="GMRADeal.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#FF0000">*</font> <bean:message key="label.deal.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>

<html:hidden property="limitProfileID" value="<%=String.valueOf(obTrxValue.getLimitProfileID())%>"/>
<html:hidden property="agreementID" value="<%=String.valueOf(obTrxValue.getAgreementID())%>"/>

<%@ include file="../deal_detail_common_page.jsp"%> 

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="label.gmra.deal.add.title"/></h3></td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname"><bean:message key="label.gmra.deal.id"/></td>
              <td>&nbsp;</td>
              <td class="fieldname"><bean:message key="label.gmra.deal.product.type"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="productType">
                  <option value="" >Please Select </option>
                  <html:options name="productCode" labelName="productLabel"/>
                </html:select>
                <html:errors property="productType"/>&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.gmra.deal.security"/> &nbsp;<font color="#0000FF">* </font></td>
              <td colspan="3"><html:text property="secDesc" maxlength="100" size="80" /> <html:errors property="secDesc" />&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.gmra.deal.isin.code"/> &nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="isinCode" maxlength="20" size="40"/> <html:errors property="isinCode" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.gmra.deal.cusip"/></td>
              <td><html:text property="cusipCode" maxlength="20" size="40"/> <html:errors property="cusipCode" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.gmra.deal.trade.price"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="dealCurCode">
                  <option value="" >Please Select </option>
                  <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>
                <html:text property="dealPrice" maxlength="40" size="40"/>
                <html:errors property="dealPrice"/>&nbsp;
              </td>
              <td class="fieldname"><bean:message key="label.gmra.deal.notinal"/></td>
              <td>
                <html:select property="notionalCurCode">
                  <option value="" >Please Select </option>
                  <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>
                <html:text property="notional" maxlength="40" size="40"/>
                <html:errors property="notional"/>&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.gmra.deal.haircut"/> &nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="haircut" maxlength="40" /> % <html:errors property="haircut" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.gmra.deal.deal.rate"/> &nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="dealRate" maxlength="40" /> % <html:errors property="dealRate" />&nbsp;</td>
            </tr>
			
            <tr class="odd">
              <td class="fieldname"><bean:message key="label.gmra.deal.repoStartAmt"/> &nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="repoStartAmt" maxlength="40" size="40"/> <html:errors property="repoStartAmt" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.gmra.deal.repoEndAmt"/> &nbsp;<font color="#0000FF">* </font></td>
              <td><html:text property="repoEndAmt" maxlength="40" size="40"/> <html:errors property="repoEndAmt" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.gmra.deal.tenor.start.date"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:text property="tradeDate" readonly="true" />
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('tradeDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="tradeDate"/>
              </td>
              <td class="fieldname"><bean:message key="label.gmra.deal.tenor.maturity.date"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:text property="maturityDate" readonly="true" />
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('maturityDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="maturityDate"/>
              </td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.gmra.deal.country"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="dealCountry" onchange="changeMbbBranch()">
                  <option value="" >Please Select </option>
                  <html:options name="countryValues" labelName="countryLabels"/>
                </html:select>
                <html:errors property="dealCountry"/>&nbsp;
              </td>
              <td class="fieldname"><bean:message key="label.gmra.deal.mbb.branch"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="dealBranch">
                  <option value="" >Please Select </option>
                  <%if(request.getAttribute("dealBranchListID") != null || pageContext.getAttribute("dealBranchListID") != null ){%>
                  <html:options name="dealBranchListID" labelName="dealBranchListValue"/>
                  <%}%>
                </html:select>
                <html:errors property="dealBranch"/>&nbsp;
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

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><a href="javascript:submitPage()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
    <td><a href="javascript:gotoPreviousPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>

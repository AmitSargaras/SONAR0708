<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADeal,
                 com.integrosys.cms.app.tradingbook.bus.IGMRADealVal,
                 com.integrosys.cms.app.tradingbook.trx.OBGMRADealValTrxValue"%>
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
* Purpose: For Maker and Checker to view the GMRA Deal valuation
* Description: view the GMRA Deal valuation value by Maker and Checker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String TrxId = request.getParameter("TrxId");
    String agreementID = request.getParameter("agreementID");
    String limitProfileID = request.getParameter("limitProfileID");
    String limitProfileId = request.getParameter("limitProfileID");
    String event = request.getParameter("event");
    IGMRADealVal[] parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.GMRADealValTrxValue");
    com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValForm aForm = (com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValForm) request.getAttribute("GMRADealValForm");
    OBGMRADealValTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    int totalEntries = 0;
    String propertyName = null;

    if( obj!=null ) {
        DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP got session.GMRADealValTrxValue");
        obTrxValue = (OBGMRADealValTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );
        DefaultLogger.debug(this,  "event = " +event );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( request.getParameter("event").equalsIgnoreCase("maker_close_input_valuation") || "to_track".equals(event)) {
           parametersArray = obTrxValue.getStagingGMRADealValuation();
           propertyName = "stagingGMRADealValuation";
        } else {
           parametersArray = obTrxValue.getGMRADealValuation();
           propertyName = "GMRADealValuation";
        }
        pageContext.setAttribute("OBGMRADealVal", obTrxValue);

        totalEntries = parametersArray.length;
        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+parametersArray.length);
        }
    }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'GMRADealValTrxValue' ");
    }

    int offset = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.offset")).intValue();
    int length = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.length")).intValue();

    String classEvent = "odd";
    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);
%>

<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function closeEditRejected() {
    document.forms[0].action = "GMRADealVal.do?event=maker_close_input_valuation_confirm";
    document.forms[0].submit();
}

function goPageIndex(targetOffset) {
    document.forms[0].action = "GMRADealVal.do?event=<%=event%>&targetOffset="+targetOffset+"&TrxId=<%=TrxId%>&agreementID=<%=agreementID%>&limitProfileID=<%=limitProfileID%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<html:form action="GMRADealVal.do">
<!-- InstanceBeginEditable name="Content" -->

<%@ include file="../cp_agreement_common_page.jsp"%> 

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="tblInfo">
              <td width="3%" rowspan="2"><bean:message key="label.gmra.deal.sn"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.id"/></td>
              <td width="15%" rowspan="2"><bean:message key="label.gmra.deal.security"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.isin.code"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.notinal"/></td>
              <td width="10%" rowspan="2"><bean:message key="label.gmra.deal.trade.price"/></td>
              <td width="15%" rowspan="2"><bean:message key="label.gmra.deal.market.price"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.haircut"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.deal.rate"/></td>
              <td width="10%" colspan="2"><bean:message key="label.gmra.deal.tenor"/></td>
            </tr>
            <tr class="tblInfo">
              <td><bean:message key="label.gmra.deal.start.date"/>Start Date</td>
              <td><bean:message key="label.gmra.deal.maturity.date"/>Maturity Date</td>
            </tr>
          </thead>
          <tbody>
            <%
              // Check that offset + length cannot exceed the total.
              int iterateLength = 0;
              if (offset + length > totalEntries) {
                iterateLength = totalEntries - offset;
              } else {
                iterateLength = length;
              }

            %>
            <%if(iterateLength == 0){%>
            <tr class="odd">
              <td colspan="10"><bean:message key="label.global.not.found"/></td>
            </tr>

            <%}%>
            <logic:iterate id="gmraDeal" name="OBGMRADealVal" property="<%=propertyName%>"
                    offset="<%=String.valueOf(offset)%>"
                    length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                    type="com.integrosys.cms.app.tradingbook.bus.IGMRADealVal">
            <%
              DefaultLogger.debug(this, "counter is now " + counter.intValue());

            %>
            <tr class="<%=classEvent%>">
              <td class="index"><%=counter.intValue()+1%></td>
                <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getDealID()%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getSecDesc()%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getISINCode()%>"/>&nbsp;</td>
                <td><integro:amount param="all" amount="<%=gmraDeal.getGMRADealDetail().getNotionalAmount()%>" decimal="4"/>&nbsp;</td>
                <td><integro:amount param="all" amount="<%=gmraDeal.getGMRADealDetail().getDealAmount()%>" decimal="4"/>&nbsp;</td>
                <td><integro:amount param="all" amount="<%=gmraDeal.getMarketValue()%>" decimal="4"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getHaircut()%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=gmraDeal.getGMRADealDetail().getDealRate()%>"/>&nbsp;</td>
                <td><integro:date object="<%=gmraDeal.getGMRADealDetail().getTradeDate()%>"/>&nbsp;</td>
                <td><integro:date object="<%=gmraDeal.getGMRADealDetail().getMaturityDate()%>"/>&nbsp;</td>
            </tr>
            <%
              if (classEvent.equals("odd")) {
                classEvent = "even";
              } else {
                classEvent = "odd";
              }
            %>
            </logic:iterate>

          </tbody>
        </table>
      </td>
    </tr>

    <tr>
      <td>&nbsp;</td>
    </tr>

  <tr>
    <td><font color="#0000FF">*</font>&nbsp;Updating of Market Price will always be based on previous system day till report generation. 
        After the reports has been generated, system will auto-update to current system date and any updating of 
        market price will be based on current system date.
    </td>
  </tr>
  </tbody>
</table>

<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
   <%if("to_track".equals(event)){%>
       <td width="100%" valign="baseline" align="center"> <a href="ToDo.do?event=totrack" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
   <%}else if("maker_close_input_valuation".equals(event)){%>
         <td width="50%" valign="baseline" align="center"><a href="javascript:closeEditRejected();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/close2a.gif',1)"><img src="img/close1a.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
         <td width="50%" valign="baseline" align="center"> <a href="ToDo.do?" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}else if("view".equals(event)){%>
         <td width="50%" valign="baseline" align="center"> <a href="GMRADeal.do?event=view_gmra_deal_detail&agreementID=<%=obTrxValue.getAgreementID()%>&limitProfileID=<%=limitProfileId%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
   <%}%>

  </tr>
</table>
<!-- InstanceEndEditable -->
</html:form>
</td>
</tr>

  <tr>
    <td height="25">
      <table id="generalPurposeBar" width="100%" border="0" cellspacing="0" cellpadding="5" align="center">
        <tr>
          <td valign="middle">
            <integro:pageindex
              pageIndex="<%=new PageIndex(offset, length, parametersArray.length)%>"
              url="GMRADeal.do" submitFlag="true"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>

<!-- InstanceEnd -->
</html>

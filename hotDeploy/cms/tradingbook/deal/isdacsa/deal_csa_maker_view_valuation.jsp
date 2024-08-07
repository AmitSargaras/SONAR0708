<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.*,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.tradingbook.bus.IISDACSADeal,
                 com.integrosys.cms.app.tradingbook.bus.IISDACSADealVal,
                 com.integrosys.cms.app.tradingbook.trx.OBISDACSADealValTrxValue"%>
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
* Purpose: For Maker and Checker to view the ISDA CSA Deal Valuation
* Description: view the ISDA CSA Deal valuation value by Maker and Checker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String TrxId = request.getParameter("TrxId");
    String limitProfileId = request.getParameter("limitProfileID");
    String event = request.getParameter("event");
    IISDACSADealVal[]  parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.ISDACSADealTrxValue");
    com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealForm aForm = (com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealForm) request.getAttribute("ISDACSADealForm");
    OBISDACSADealValTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    int totalEntries = 0;
    String propertyName = null;

    if( obj!=null ) {
        DefaultLogger.debug(this, "@@@Debug:::1 FROM JSP got session.OBISDACSADealValTrxValue");
        obTrxValue = (OBISDACSADealValTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );
        DefaultLogger.debug(this,  "event = " +event );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( request.getParameter("event").equalsIgnoreCase("maker_close_input_valuation") || "to_track".equals(event)) {
           parametersArray = obTrxValue.getStagingISDACSADealValuation();
           propertyName = "stagingISDACSADealValuation";
        } else {
           parametersArray = obTrxValue.getISDACSADealValuation();
           propertyName = "ISDACSADealValuation";
        }
        pageContext.setAttribute("OBISDACSADealVal", obTrxValue);

        totalEntries = parametersArray.length;

        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parameters = "+parametersArray.length);
        }
    }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'OBISDACSADealValTrxValue' ");
    }

    int offset = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.offset")).intValue();
    int length = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.length")).intValue();

    String classEvent = "odd";
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
    document.forms[0].action = "ISDACSADealVal.do?event=maker_close_input_valuation_confirm";
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
<!-- InstanceBeginEditable name="Content" -->
<html:form action="ISDACSADealVal.do">

<%@ include file="../cp_agreement_common_page.jsp"%> 

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="tblInfo">
              <td width="3%"><bean:message key="label.isda.deal.sn"/></td>
              <td width="15%"><bean:message key="label.isda.deal.id"/></td>
              <td width="10%"><bean:message key="label.isda.deal.currency"/></td>
              <td width="10%"><bean:message key="label.isda.deal.trade.date"/></td>
              <td width="10%"><bean:message key="label.isda.deal.maturity.date"/></td>
              <td width="10%"><bean:message key="label.isda.deal.value.date"/></td>
              <td width="10%"><bean:message key="label.isda.deal.product.type"/></td>
              <td width="19%"><bean:message key="label.isda.deal.base.currency.npv"/></td>
              <td width="13%"><bean:message key="label.isda.deal.reference.currency.npv"/></td>
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
            <logic:iterate id="isdaCsaDeal" name="OBISDACSADealVal" property="<%=propertyName%>"
                    offset="<%=String.valueOf(offset)%>"
                    length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                    type="com.integrosys.cms.app.tradingbook.bus.IISDACSADealVal">
            <%
              DefaultLogger.debug(this, "counter is now " + counter.intValue());

            %>
            <tr class="<%=classEvent%>">
              <td class="index"><%=counter.intValue()+1%></td>
                <td><integro:empty-if-null value="<%=isdaCsaDeal.getISDACSADealDetail().getDealID()%>"/>&nbsp;</td>
                <td><integro:amount param="currency" amount="<%=isdaCsaDeal.getISDACSADealDetail().getDealAmount()%>" decimal="4"/>&nbsp;</td>
                <td><integro:date object="<%=isdaCsaDeal.getISDACSADealDetail().getTradeDate()%>"/>&nbsp;</td>
                <td><integro:date object="<%=isdaCsaDeal.getISDACSADealDetail().getMaturityDate()%>"/>&nbsp;</td>
                <td><integro:date object="<%=isdaCsaDeal.getISDACSADealDetail().getValueDate()%>"/>&nbsp;</td>
                <td><integro:empty-if-null value="<%=isdaCsaDeal.getISDACSADealDetail().getProductType()%>"/>&nbsp;</td>
                <td><integro:amount param="amount" amount="<%=isdaCsaDeal.getMarketValue()%>" decimal="4"/>&nbsp;</td>
                <td><integro:amount param="all" amount="<%=isdaCsaDeal.getISDACSADealDetail().getNPVAmount()%>" decimal="4"/>&nbsp;</td>
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
         <td width="50%" valign="baseline" align="center"> <a href="ISDACSADealVal.do?event=view_isda_deal_detail&agreementID=<%=obTrxValue.getAgreementID()%>&limitProfileID=<%=limitProfileId%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>
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
              url="ISDACSADealVal.do" submitFlag="true"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>

<!-- InstanceEnd -->
</html>

<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CountryList,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.component.commondata.app.CommonDataSingleton,
                 java.util.*,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.businfra.currency.Amount,
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
* Purpose: For Maker to edit the GMRA Deal valuation
* Description: edit the GMRA Deal valuation value by Maker
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

    String targetOffset = request.getParameter("targetOffset");
    if(targetOffset == null){
      targetOffset = "0";
    }
    String limitProfileId = request.getParameter("limitProfileID");
    String event = request.getParameter("event");
    String preEvent = request.getParameter("preEvent");
    IGMRADealVal[] parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.GMRADealValTrxValue");
    com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValForm aForm = (com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValForm) request.getAttribute("GMRADealValForm");
    OBGMRADealValTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    int totalEntries = 0;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.OBGMRADealSummary");
        obTrxValue = (OBGMRADealValTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );//true;

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( event.equalsIgnoreCase("maker_edit_valuation_reject") ) {
           parametersArray = obTrxValue.getStagingGMRADealValuation();
        } else {
           parametersArray = obTrxValue.getGMRADealValuation();
        }

        pageContext.setAttribute("OBGMRADealVal", obTrxValue);

        totalEntries = parametersArray.length;

        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parametersArray = "+parametersArray.length);
        }
   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'OBGMRADealSummary' ");
   }

    int offset = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.offset")).intValue();
    int length = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.gmra.GMRADealValAction.length")).intValue();

    String classEvent = "odd";
    DefaultLogger.debug(this, "preEvent = " + preEvent);
    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);

    if(limitProfileId == null || limitProfileId.equals("")){
      limitProfileId = String.valueOf(obTrxValue.getLimitProfileID());
    }
    DefaultLogger.debug(this, "limitProfileId = " + limitProfileId);
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

function gotoPreviousPage() {
    document.forms[0].action = "GMRADeal.do?event=view_gmra_deal_detail&agreementID=<%=obTrxValue.getAgreementID()%>&limitProfileID=<%=limitProfileId%>";
    document.forms[0].submit();
}

function submitPage() {
    if( "<%=event%>" == "maker_edit_valuation_reject" ){
      document.forms[0].action = "GMRADealVal.do?event=maker_edit_reject_confirm&targetOffset=<%=targetOffset%>";
    } else if( "<%=event%>" == "paginate" ) {
      if( "<%=preEvent%>" == "maker_edit_valuation_reject" ){
        document.forms[0].action = "GMRADealVal.do?event=maker_edit_reject_confirm&targetOffset=<%=targetOffset%>";
      }else{
        document.forms[0].action = "GMRADealVal.do?event=maker_update_valuation_confirm&targetOffset=<%=targetOffset%>";
      }
    } else {
      document.forms[0].action = "GMRADealVal.do?event=maker_update_valuation_confirm&targetOffset=<%=targetOffset%>";
    }
    document.forms[0].submit();
}

function goPageIndex(targetOffset) {
    if("<%=event%>" == "paginate"){
      document.forms[0].action = "GMRADealVal.do?event=paginate&preEvent=<%=preEvent%>&targetOffset="+targetOffset;
    }else{
      document.forms[0].action = "GMRADealVal.do?event=paginate&preEvent=<%=event%>&targetOffset="+targetOffset;
    }
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<html:form action="GMRADealVal.do">

<%@ include file="../cp_agreement_common_page.jsp"%> 

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <%if(request.getAttribute("isEmpty") != null && request.getAttribute("isEmpty").equals("isEmpty")){%>
    <tr>
      <td><font color="#FF0000">Please fill in all the market value.</font>&nbsp;
      </td>
    </tr>
    <%}%>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <thead>
            <tr class="tblInfo">
              <td width="3%" rowspan="2"><bean:message key="label.gmra.deal.sn"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.id"/></td>
              <td width="15%" rowspan="2"><bean:message key="label.gmra.deal.security"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.isin.code"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.notinal"/></td>
              <td width="9%" rowspan="2"><bean:message key="label.gmra.deal.trade.price"/></td>
              <td width="22%" rowspan="2"><bean:message key="label.gmra.deal.market.price"/></td>
              <td width="8%" rowspan="2"><bean:message key="label.gmra.deal.haircut"/></td>
              <td width="8%" rowspan="2"><bean:message key="label.gmra.deal.deal.rate"/></td>
              <td width="8%" colspan="2"><bean:message key="label.gmra.deal.tenor"/></td>
            </tr>
            <tr class="tblInfo">
              <td><bean:message key="label.gmra.deal.start.date"/></td>
              <td><bean:message key="label.gmra.deal.maturity.date"/></td>
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
              DefaultLogger.debug(this, "iterateLength " + iterateLength);

            %>
            <%if(iterateLength == 0){%>
            <tr class="odd">
              <td colspan="11"><bean:message key="label.global.not.found"/></td>
            </tr>

            <%}
            String propertyName = null;
            if( event.equals("maker_edit_valuation_reject") ||  event.equals("paginate") ) {
              propertyName = "stagingGMRADealValuation";
            }else {
              propertyName = "GMRADealValuation";
            }%>
            <logic:iterate id="gmraDealVal" name="OBGMRADealVal" property="<%=propertyName%>"
                    offset="<%=String.valueOf(offset)%>"
                    length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                    type="com.integrosys.cms.app.tradingbook.bus.IGMRADealVal">
            <%
              DefaultLogger.debug(this, "counter is now " + counter.intValue());

            %>
            <tr class="<%=classEvent%>">
              <html:hidden property="dealID" value="<%=aForm.getDealID(counter.intValue())%>"/>
              <td class="index"><%=counter.intValue()+1%></td>
              <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getDealID()%>"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getSecDesc()%>"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getISINCode()%>"/>&nbsp;</td>
              <td><integro:amount param="all" amount="<%=gmraDealVal.getGMRADealDetail().getNotionalAmount()%>" decimal="4"/>&nbsp;</td>
              <td><integro:amount param="all" amount="<%=gmraDealVal.getGMRADealDetail().getDealAmount()%>" decimal="4"/>&nbsp;</td>
              <td>
                <%if(aForm.getMarketPriceCurCode(counter.intValue()) != null && !aForm.getMarketPriceCurCode(counter.intValue()).equals("") ){%>
                <html:select property="marketPriceCurCode" value="<%=aForm.getMarketPriceCurCode(counter.intValue())%>">
                  <option value="" >Please Select </option>
                  <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>
                <%}else{%>
                <html:select property="marketPriceCurCode" value="">
                  <option value="" >Please Select </option>
                  <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>
                <%}%>
                <%if(aForm.getMarketPrice(counter.intValue()) != null && !aForm.getMarketPrice(counter.intValue()).equals("") ){%>
                <html:text property="marketPrice" value="<%=aForm.getMarketPrice(counter.intValue())%>" maxlength="30" size="30" />
                <%}else{%>
                <html:text property="marketPrice" value="" maxlength="30" size="30" />
                <%}%>
                <%String errorString = "marketPrice" + String.valueOf(counter.intValue()); %>
                <html:errors property="<%=errorString%>"/>&nbsp;
              </td>
              <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getHaircut()%>"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=gmraDealVal.getGMRADealDetail().getDealRate()%>"/>&nbsp;</td>
              <td><integro:date object="<%=gmraDealVal.getGMRADealDetail().getTradeDate()%>"/>&nbsp;</td>
              <td><integro:date object="<%=gmraDealVal.getGMRADealDetail().getMaturityDate()%>"/>&nbsp;</td>
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
      <td>
        <%if(isRejected ) {
    String paramUID = obTrxValue.getUserInfo();
    String paramRemarks = obTrxValue.getRemarks();
            if( paramRemarks==null || paramRemarks.trim().equalsIgnoreCase("null") ) {
                paramRemarks=" ";
            }%>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
          <tr>
            <td width="43%" class="fieldname">Remarks</td>
            <td width="57%" class="odd"><textarea name="remarks" rows="4" style="width:90%"></textarea></td>
          </tr>
          <tr>
            <td class="fieldname">Last Action By</td>
            <td class="even"> <%=paramUID==null?"-":paramUID%> &nbsp; </td>
          </tr>
          <tr class="odd">
            <td class="fieldname">Last Remarks Made</td>
            <td><integro:wrapper value='<%=(paramRemarks==null || paramRemarks.equals("null")?" ":paramRemarks)%>' />&nbsp;&nbsp;</td>
          </tr>
        </tbody>
        </table>
      <%}%>
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

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
  <tr>
    <td align="right"><a href="javascript:submitPage()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
    <td><a href='<%=isRejected?"ToDo.do":"javascript:gotoPreviousPage()"%>' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
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
              url="GMRADealVal.do" submitFlag="true"/>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>

<!-- InstanceEnd -->
</html>

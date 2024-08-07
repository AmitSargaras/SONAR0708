<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.base.businfra.currency.Amount,
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
* Purpose: For Maker to edit the ISDA CSA Deal Valuation
* Description: edit the ISDA CSA Deal valuation value by Maker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String targetOffset = request.getParameter("targetOffset");
    if(targetOffset == null){
      targetOffset = "0";
    }

    String limitProfileId = request.getParameter("limitProfileID");
    String event = request.getParameter("event");
    String preEvent = request.getParameter("preEvent");
    IISDACSADealVal[] parametersArray = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.ISDACSADealTrxValue");
    com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealForm aForm = (com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealForm) request.getAttribute("ISDACSADealForm");
    OBISDACSADealValTrxValue obTrxValue = null;
    boolean entries_editable = false;
    boolean isRejected = false;
    int totalEntries = 0;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.OBISDACSADealVal");
        obTrxValue = (OBISDACSADealValTrxValue)obj;
        DefaultLogger.debug(this,  "ob.getStatus() = " +obTrxValue.getStatus() );

        // check whether the currentStatus is REJECTED
        isRejected = ICompConstant.STATE_REJECTED.equals( obTrxValue.getStatus() );//true;

        // Entries are editable only if the record is ACTIVE.
        if( ICompConstant.STATE_ACTIVE.equals( obTrxValue.getStatus() ) || isRejected ) {
            entries_editable = true;
        }

        if( event.equalsIgnoreCase("maker_edit_valuation_reject") ) {
           parametersArray = obTrxValue.getStagingISDACSADealValuation();
          DefaultLogger.debug(this,  "parametersArray getStagingISDACSADealValuation = " +parametersArray );
        } else {
           parametersArray = obTrxValue.getISDACSADealValuation();
          DefaultLogger.debug(this,  "parametersArray getISDACSADealValuation = " +parametersArray );
        }

        pageContext.setAttribute("OBISDACSADealVal", obTrxValue);

        totalEntries = parametersArray.length;

        if( parametersArray!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP parametersArray = "+parametersArray.length);
        }
   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'OBISDACSADealVal' ");
   }

    int offset = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.offset")).intValue();
    int length = ((Integer)session.getAttribute("com.integrosys.cms.ui.tradingbook.deal.isdacsa.ISDACSADealAction.length")).intValue();

    String classEvent = "odd";
    DefaultLogger.debug(this, "preEvent = " + preEvent);
    DefaultLogger.debug(this, "offset = " + offset);
    DefaultLogger.debug(this, "length = " + length);
    DefaultLogger.debug(this, "total entries = " + totalEntries);
    DefaultLogger.debug(this, "request.getAttribute(isEmpty) = " + request.getAttribute("isEmpty"));
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
    document.forms[0].action = "ISDACSADealVal.do?event=view_isda_deal_detail&limitProfileID=<%=limitProfileId%>&agreementID=<%=obTrxValue.getAgreementID()%>";
    document.forms[0].submit();
}

function submitPage() {
    if( "<%=event%>" == "maker_edit_valuation_reject" ){
      document.forms[0].action = "ISDACSADealVal.do?event=maker_edit_reject_confirm&targetOffset=<%=targetOffset%>";
    } else if( "<%=event%>" == "paginate" ) {
      if( "<%=preEvent%>" == "maker_edit_valuation_reject" ){
        document.forms[0].action = "ISDACSADealVal.do?event=maker_edit_reject_confirm&targetOffset=<%=targetOffset%>";
      }else{
        document.forms[0].action = "ISDACSADealVal.do?event=maker_input_valuation_confirm&targetOffset=<%=targetOffset%>";
      }
    } else {
      document.forms[0].action = "ISDACSADealVal.do?event=maker_input_valuation_confirm&targetOffset=<%=targetOffset%>";
    }
    document.forms[0].submit();
}

function goPageIndex(targetOffset) {
    if("<%=event%>" == "paginate"){
      document.forms[0].action = "ISDACSADealVal.do?event=paginate&preEvent=<%=preEvent%>&limitProfileID=<%=limitProfileId%>&targetOffset="+targetOffset;
    }else{
      document.forms[0].action = "ISDACSADealVal.do?event=paginate&preEvent=<%=event%>&limitProfileID=<%=limitProfileId%>&targetOffset="+targetOffset;
    }
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<!--html:hidden property="lEID" value="<!--%=String.valueOf(obTrxValue.getLEID())%>"/-->
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
   <td valign="top">
<html:form action="ISDACSADealVal.do">
<!-- InstanceBeginEditable name="Content" -->

<%@ include file="../cp_agreement_common_page.jsp"%> 

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <%if(request.getAttribute("isEmpty") != null && request.getAttribute("isEmpty").equals("isEmpty")){%>
    <tr>
      <td><font color="#FF0000">Please fill in all the Base Currency NPV.</font>&nbsp;
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
              DefaultLogger.debug(this, "iterateLength " + iterateLength);

            %>
            <%if(iterateLength == 0){%>
            <tr class="odd">
              <td colspan="11"><bean:message key="label.global.not.found"/></td>
            </tr>

            <%}
            String propertyName = null;
            if( event.equals("maker_edit_valuation_reject") ||  event.equals("paginate") ) {
              propertyName = "stagingISDACSADealValuation";
            }else {
              propertyName = "ISDACSADealValuation";
            }%>
            <logic:iterate id="isdaCsaDealVal" name="OBISDACSADealVal" property="<%=propertyName%>"
                    offset="<%=String.valueOf(offset)%>"
                    length="<%=String.valueOf(iterateLength)%>" indexId="counter"
                    type="com.integrosys.cms.app.tradingbook.bus.IISDACSADealVal">
            <%
              DefaultLogger.debug(this, "counter is now " + counter.intValue());

            %>
            <tr class="<%=classEvent%>">
              <html:hidden property="dealID" value="<%=aForm.getDealID(counter.intValue())%>"/>
              <td class="index"><%=counter.intValue()+1%></td>
              <td><integro:empty-if-null value="<%=String.valueOf(isdaCsaDealVal.getISDACSADealDetail().getDealID())%>"/>&nbsp;</td>
              <td><integro:amount param="all" amount="<%=isdaCsaDealVal.getISDACSADealDetail().getDealAmount()%>" decimal="4"/>&nbsp;</td>
              <td><integro:date object="<%=isdaCsaDealVal.getISDACSADealDetail().getTradeDate()%>"/>&nbsp;</td>
              <td><integro:date object="<%=isdaCsaDealVal.getISDACSADealDetail().getMaturityDate()%>"/>&nbsp;</td>
              <td><integro:date object="<%=isdaCsaDealVal.getISDACSADealDetail().getValueDate()%>"/>&nbsp;</td>
              <td><integro:empty-if-null value="<%=isdaCsaDealVal.getISDACSADealDetail().getProductType()%>"/>&nbsp;</td>
              <td>
                <%if(aForm.getMarketValue(counter.intValue()) != null && !aForm.getMarketValue(counter.intValue()).equals("") ){%>
                <html:text property="marketValue" value="<%=aForm.getMarketValue(counter.intValue())%>" maxlength="30" size="30" />
                <%}else{%>
                <html:text property="marketValue" value="" maxlength="30" size="30" />
                <%}%>
                <%String errorString = "marketValue" + String.valueOf(counter.intValue()); %>
                <html:errors property="<%=errorString%>"/>&nbsp;
              </td>
              <td><integro:amount param="all" amount="<%=isdaCsaDealVal.getISDACSADealDetail().getNPVAmount()%>" decimal="4"/>&nbsp;</td>
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
  </tbody>
</table>

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="75">&nbsp;</td>
    <td width="74">&nbsp;</td>
  </tr>
<%if(parametersArray.length != 0){%>
  <tr>
    <td align="right"><a href="javascript:submitPage()"  onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/submit2.gif',1)"><img src="img/submit1.gif" name="Image1" width="75" height="22" border="0" id="Image1" /></a></td>
    <td align="left"><a href='<%=isRejected?"ToDo.do":"javascript:gotoPreviousPage()"%>' onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  </tr>
<%}%>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
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
<!-- InstanceEndEditable -->
</body>

<!-- InstanceEnd -->
</html>

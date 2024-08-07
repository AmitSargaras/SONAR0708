<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 com.integrosys.cms.ui.common.AgreementTypeList,
                 com.integrosys.cms.ui.common.InterestRateTypeList,
                 com.integrosys.cms.ui.manualinput.aa.RatingList,
                 com.integrosys.cms.ui.manualinput.aa.RatingTypeList,
                 com.integrosys.cms.app.limit.bus.*,
                 com.integrosys.cms.app.limit.trx.*"%>
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
* Purpose: For Maker and Checker to view trading agreement detail
* Description: view trading agreement detail value by Maker and Checker
*
* @author $Author: Jerlin$<br>
* @version $Revision:$
* Date: $Date: $
* Tag: $Name$
*/
%>

<%
    String aaID = request.getParameter("aaID");
    String event = request.getParameter("event");
    String preEvent = request.getParameter("preEvent");
    String trxId = request.getParameter("TrxId");
    String customerID = request.getParameter("customerID");

    ITradingAgreement parameters = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.tradingAgreementVal");
    com.integrosys.cms.ui.manualinput.aa.TradingAgreementForm aForm = (com.integrosys.cms.ui.manualinput.aa.TradingAgreementForm) request.getAttribute("TradingAgreementForm");
    OBTradingAgreement obTradingAgreement = null;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.lmtProfileTrxValue");
        obTradingAgreement = (OBTradingAgreement)obj;
   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'TradingAgreementTrxValue' ");
   }

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

function goToPage() {
    document.forms[0].action = "ThresholdRating.do?event=view&preEvent=<%=preEvent%>&indexChange=0&TrxId=<%=trxId%>&aaID=<%=aaID%>&customerID=<%=customerID%>";
    document.forms[0].submit();
}

function goPreviousPage() {
    if('<%=preEvent%>' == 'maker_close_aadetail' ||
    '<%=preEvent%>' == 'maker_delete_aadetail' ||
    '<%=preEvent%>' == 'maker_delete_aadetail_reject' ){
      document.forms[0].action = "MIAADetail.do?event=<%=preEvent%>&TrxId=<%=trxId%>&aaID=<%=aaID%>&customerID=<%=customerID%>";
    }else if('<%=preEvent%>' == 'to_track'){
      document.forms[0].action = "MIAADetail.do?event=to_track&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else{
      document.forms[0].action = "MIAADetail.do?event=view&aaID=<%=aaID%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="TradingAgreement.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.agreement.title"/></h3></td>
            <td width="40%" valign="baseline" align="right"> <input type="button" value="Threshold Rating" class="btnNormal" onclick="goToPage()"/>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td><hr />
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname" width="30%"><bean:message key="label.agreement.type"/></td>
              <td width="20%">
                <%String agreementType = null;
                  if(! (obTradingAgreement.getAgreementType().equals(null) || obTradingAgreement.getAgreementType().equals("")) ){
                    agreementType = AgreementTypeList.getInstance().getAgreementTypeName(obTradingAgreement.getAgreementType());
                  }%>
                <integro:empty-if-null value="<%=agreementType%>" />&nbsp;
              </td>
              <td class="fieldname" width="30%">&nbsp;</td>
              <td width="20%">&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.counterparty.branch"/></td>
              <td><integro:empty-if-null value="<%=obTradingAgreement.getCounterPartyBranch()%>" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.agreement.min.transfer.amt"/></td>
              <td><integro:amount param="all" amount="<%=obTradingAgreement.getMinTransferAmount()%>" decimal="2"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.agreement.counterparty.rating.type"/></td>
              <td>
                <%String ratingType = null;
                  String rating = null;
                  String cptRatingType = null;
                  String cptRating = null;
                  IExternalRating counterPartyRating = null;
                  if(obTradingAgreement.getCounterPartyExtRating() != null){
                    counterPartyRating = obTradingAgreement.getCounterPartyExtRating();
                    cptRatingType = counterPartyRating.getRatingType();
                    cptRating = counterPartyRating.getRating();
                    if(! (cptRatingType.equals(null) || cptRatingType.equals("")) ){
                      ratingType = RatingTypeList.getInstance().getRatingTypeName(cptRatingType);
                      if(! (cptRating.equals(null) || cptRating.equals("")) ){
                        rating = RatingList.getInstance(cptRatingType).getRatingName(cptRating);
                      }
                    }
                  }%>
                <integro:empty-if-null value="<%=ratingType%>" />&nbsp;
              </td>
              <td class="fieldname"><bean:message key="label.agreement.counterparty.rating"/></td>
              <td>
                <integro:empty-if-null value="<%=rating%>" />&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.counterparty.threshold.amt"/></td>
              <td><integro:amount param="all" amount="<%=obTradingAgreement.getCounterPartyThresholdAmount()%>" decimal="4"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.maybank.rating.type"/></td>
              <td>
                <%ratingType = null;
                  rating = null;
                  String mbbRatingType = null;
                  String mbbRating = null;
                  IExternalRating maybankRating = null;
                  if(obTradingAgreement.getMbbExtRating() != null){
                    maybankRating = obTradingAgreement.getMbbExtRating();
                    mbbRatingType = maybankRating.getRatingType();
                    mbbRating = maybankRating.getRating();
                    if(! (mbbRatingType.equals(null) || mbbRatingType.equals("")) ){
                      ratingType = RatingTypeList.getInstance().getRatingTypeName(mbbRatingType);
                      if(! (mbbRating.equals(null) || mbbRating.equals("")) ){
                        rating = RatingList.getInstance(mbbRatingType).getRatingName(mbbRating);
                      }
                    }
                  }%>
                <integro:empty-if-null value="<%=ratingType%>" />&nbsp;
              </td>
              <td class="fieldname"><bean:message key="label.agreement.maybank.rating"/></td>
              <td>
                <integro:empty-if-null value="<%=rating%>" />&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.maybank.threshold.amt"/></td>
              <td><integro:amount param="all" amount="<%=obTradingAgreement.getMbbThresholdAmount()%>" decimal="4"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.agreement.eligible.margin"/></td>
              <td>Cash &nbsp;</td>
              <td class="fieldname"><bean:message key="label.agreement.agreed.interest.rate"/></td>
              <td>
                <%String intRateType = null;
                  if(! (obTradingAgreement.getAgreeIntRateType().equals(null) || obTradingAgreement.getAgreeIntRateType().equals("")) ){
                    intRateType = InterestRateTypeList.getInstance().getInterestRateTypeName(obTradingAgreement.getAgreeIntRateType());
                  }%>
                <integro:empty-if-null value="<%=intRateType%>" />&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.base.currency"/></td>
              <td><integro:empty-if-null value="<%=obTradingAgreement.getBaseCurrency()%>" />&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
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

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="label.agreement.title.settlement.bank"/></h3></td>
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
              <td class="fieldname"><bean:message key="label.agreement.agent.bank.nm"/></td>
              <td colspan="3"><integro:empty-if-null value="<%=obTradingAgreement.getAgentBankName()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.address"/></td>
              <td colspan="3"><integro:htmltext value="<%=obTradingAgreement.getAgentBankAddress()%>" lineLength="120" />&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.agreement.bank.clearance.id"/></td>
              <td><integro:empty-if-null value="<%=obTradingAgreement.getBankClearanceID()%>" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.agreement.order.acc.id"/></td>
              <td><integro:empty-if-null value="<%=obTradingAgreement.getBankAccountID()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.clearing"/></td>
              <td><integro:empty-if-null value="<%=obTradingAgreement.getClearingDesc()%>" />&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
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

<table class="tblFormSection" width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td><h3><bean:message key="label.agreement.title.time.zone"/></h3></td>
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
              <td class="fieldname"><bean:message key="label.agreement.notification.time"/></td>
              <td><integro:empty-if-null value="<%=obTradingAgreement.getNotificationTime()%>" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.agreement.valuation.time"/></td>
              <td><integro:empty-if-null value="<%=obTradingAgreement.getValuationTime()%>" />&nbsp;</td>
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
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
       <td width="100%" valign="baseline" align="center"> <a href="javascript:goPreviousPage();" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a></td>   
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>

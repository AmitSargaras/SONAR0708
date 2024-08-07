<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 java.util.*,
                 java.math.*,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyCode,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.ui.common.CurrencyList,
                 com.integrosys.cms.ui.common.AgreementTypeList,
                 com.integrosys.cms.ui.common.InterestRateTypeList,
                 com.integrosys.cms.ui.manualinput.aa.RatingTypeList,
                 com.integrosys.cms.ui.manualinput.aa.RatingList,
                 com.integrosys.cms.app.limit.bus.ITradingAgreement"%>
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
* Purpose: For Maker edit trading agreement
* Description: edit trading agreement value by Maker
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

    AgreementTypeList agreementList = AgreementTypeList.getInstance();
    Collection agreementTypeListID = agreementList.getAgreementTypeListID ();
    Collection agreementTypeListValue = agreementList.getAgreementTypeListValue ();
    pageContext.setAttribute("agreementTypeListID", agreementTypeListID);
    pageContext.setAttribute("agreementTypeListValue", agreementTypeListValue);

    InterestRateTypeList list = InterestRateTypeList.getInstance ();
    Collection interestRateTypeListID = list.getInterestRateTypeListID ();
    Collection interestRateTypeListValue = list.getInterestRateTypeListValue ();
    pageContext.setAttribute("interestRateTypeListID", interestRateTypeListID);
    pageContext.setAttribute("interestRateTypeListValue", interestRateTypeListValue);

    RatingTypeList ratingTypeList = RatingTypeList.getInstance ();
    Collection ratingTypeListID = ratingTypeList.getRatingTypeListID ();
    Collection ratingTypeListValue = ratingTypeList.getRatingTypeListValue ();
    pageContext.setAttribute("ratingTypeListID", ratingTypeListID);
    pageContext.setAttribute("ratingTypeListValue", ratingTypeListValue);

    ITradingAgreement parameters = null ;
    Object obj = session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.tradingAgreementVal");
    com.integrosys.cms.ui.manualinput.aa.TradingAgreementForm aForm = (com.integrosys.cms.ui.manualinput.aa.TradingAgreementForm) request.getAttribute("TradingAgreementForm");
    ITradingAgreement obTradingAgreement = null;
    boolean entries_editable = false;
    boolean isRejected = false;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.TradingAgreementTrxValue");
        obTradingAgreement = (ITradingAgreement)obj;

        if( obTradingAgreement!=null ) {
            DefaultLogger.debug(this, "@@@Debug:::2 FROM JSP obTradingAgreement = "+obTradingAgreement);
        }
   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'TradingAgreementTrxValue' ");
   }

    String trxId = request.getParameter("TrxId");
    String event = request.getParameter("event");
    String preEvent = request.getParameter("preEvent");
    if(preEvent.substring(0,7).equals("refresh")){
      preEvent = preEvent.substring(8,preEvent.length());
    }
    String indexChange = request.getParameter("indexChange");
    int ind = Integer.parseInt(indexChange) + 1;
    String customerID = request.getParameter("customerID");

    if("maker_update_agreement_confirm".equals(event)){
       String cptRatingType = aForm.getCountRatingType();
       if(! (cptRatingType.equals(null) || cptRatingType.equals("")) ){
         RatingList ratingCpt = RatingList.getInstance (cptRatingType);
         pageContext.setAttribute("ratingCptListID", ratingCpt.getRatingListID());
         pageContext.setAttribute("ratingCptListValue", ratingCpt.getRatingListValue());
       }

       String mbbRatingType = aForm.getMaybankRatingType();
       if(! (mbbRatingType.equals(null) || mbbRatingType.equals("")) ){
         RatingList ratingMbb = RatingList.getInstance (mbbRatingType);
         pageContext.setAttribute("ratingMbbListID", ratingMbb.getRatingListID());
         pageContext.setAttribute("ratingMbbListValue", ratingMbb.getRatingListValue());
       }

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
    document.forms[0].action = "TradingAgreement.do?event=prepare_update_threshold&preEvent=<%=preEvent%>&indexChange=<%=indexChange%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    document.forms[0].submit();
}

function submitPage() {
    document.forms[0].action = "TradingAgreement.do?event=maker_update_agreement_confirm&preEvent=<%=preEvent%>&indexChange=<%=ind%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    document.forms[0].submit();
}

function returnPage() {
    if('<%=preEvent%>' == 'maker_edit_aadetail_reject'){
      document.forms[0].action = "TradingAgreement.do?event=cancel&preEvent=<%=preEvent%>&indexChange=<%=ind%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }else{
      document.forms[0].action = "TradingAgreement.do?event=cancel&preEvent=<%=preEvent%>&indexChange=<%=ind%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    }
    document.forms[0].submit();
}

function changeCountRating(ratingType) {
    document.forms[0].action = "TradingAgreement.do?event=refresh_maker_update_agreement&preEvent=<%=preEvent%>&indexChange=<%=indexChange%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    document.forms[0].submit();
}

function changeMaybankRating(ratingType) {
    document.forms[0].action = "TradingAgreement.do?event=refresh_maker_update_agreement&preEvent=<%=preEvent%>&indexChange=<%=indexChange%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    document.forms[0].submit();
}

function displayThresholdRatingAmt() {
    document.forms[0].action = "TradingAgreement.do?event=refresh_maker_update_agreement&preEvent=<%=preEvent%>&indexChange=<%=indexChange%>&TrxId=<%=trxId%>&customerID=<%=customerID%>";
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="TradingAgreement.do">
<input type="hidden" name="agreementID"/>
<input type="hidden" name="limitProfileID"/>
<input type="hidden" name="counterPartyThresholdAmt" value="<%=aForm.getCounterPartyThresholdAmt() == null? "" : aForm.getCounterPartyThresholdAmt()%>"/>
<input type="hidden" name="mbbThresholdAmt" value="<%=aForm.getMbbThresholdAmt() == null? "" : aForm.getMbbThresholdAmt()%>"/>
<body>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.agreement.mandatory.for.submission"/>&nbsp;&nbsp;&nbsp;&nbsp;</p>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td width="60%"><h3><bean:message key="label.agreement.title.edit"/></h3></td>
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
    <tr>
      <td><html:errors property="counterPartyThresholdAmt"/>&nbsp;<html:errors property="mbbThresholdAmt"/>&nbsp;
      </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
          <tbody>
            <tr class="even">
              <td class="fieldname" width="20%"><bean:message key="label.agreement.type"/> &nbsp;<font color="#0000FF">* </font></td>
              <td width="30%">
                <html:select property="agreementType">
                  <option value="" >Please Select </option>
                  <html:options name="agreementTypeListID" labelName="agreementTypeListValue"/>
                </html:select>
                <html:errors property="agreementType"/>&nbsp;
              </td>
              <td class="fieldname" width="20%">&nbsp;</td>
              <td width="30%">&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname" width="20%"><bean:message key="label.agreement.counterparty.branch"/></td>
              <td width="30%"><html:text property="counterPartyBranch" maxlength="100" size="70" /> <html:errors property="counterPartyBranch" />&nbsp;</td>
              <td class="fieldname" width="20%"><bean:message key="label.agreement.min.transfer.amt"/> &nbsp;<font color="#0000FF">* </font></td>
              <td width="30%">
                <html:select property="minTransCurCode">
                  <option value="" >Please Select </option>
                  <html:options name="currencyCode" labelName="currencyCode"/>
                </html:select>
                <html:text property="minTransfer" maxlength="40" />
                <html:errors property="minTransfer"/>&nbsp;
              </td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.agreement.counterparty.rating.type"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="countRatingType" onchange="changeCountRating()" >
                  <option value="" >Please Select </option>
                  <html:options name="ratingTypeListID" labelName="ratingTypeListValue"/>
                </html:select>
                <html:errors property="countRatingType"/>&nbsp;
              </td>
              <td class="fieldname"><bean:message key="label.agreement.counterparty.rating"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="counterpartyRating" onchange="displayThresholdRatingAmt()" >
                  <option value="" >Please Select </option>
                  <%if(request.getAttribute("ratingCptListID") != null || pageContext.getAttribute("ratingCptListID") != null){%>
                  <html:options name="ratingCptListID" labelName="ratingCptListValue"/>
                  <%}%>
                </html:select>
                <html:errors property="counterpartyRating"/>&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.counterparty.threshold.amt"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <%if( aForm.getCounterPartyThresholdAmt()!= null && !aForm.getCounterPartyThresholdAmt().equals("") ){
                    //Amount countThresholdAmt = new Amount(new BigDecimal( aForm.getCounterPartyThresholdAmt().substring(4,aForm.getCounterPartyThresholdAmt().length()) ),
                                                /*new CurrencyCode(aForm.getCounterPartyThresholdAmt().substring(0,3)) );*/%>
                <integro:empty-if-null value="<%=aForm.getCounterPartyThresholdAmt()%>"/>&nbsp;
                <%}%>&nbsp;
                <%if(request.getAttribute("cpAmountError") != null && request.getAttribute("cpAmountError").equals("true")){%>
                <bean:message key="error.no.conversion"/>
                <%}%>
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.agreement.maybank.rating.type"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="maybankRatingType" onchange="changeMaybankRating()" >
                  <option value="" >Please Select </option>
                  <html:options name="ratingTypeListID" labelName="ratingTypeListValue"/>
                </html:select>
                <html:errors property="maybankRatingType"/>&nbsp;
              </td>
              <td class="fieldname"><bean:message key="label.agreement.maybank.rating"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="maybankRating" onchange="displayThresholdRatingAmt()">
                  <option value="" >Please Select </option>
                  <%if(request.getAttribute("ratingMbbListID") != null || pageContext.getAttribute("ratingMbbListID") != null){%>
                  <html:options name="ratingMbbListID" labelName="ratingMbbListValue"/>
                  <%}%>
                </html:select>
                <html:errors property="maybankRating"/>&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.maybank.threshold.amt"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <%if( aForm.getMbbThresholdAmt()!= null && !aForm.getMbbThresholdAmt().equals("") ){
                    //Amount mbbThresholdAmt = new Amount(Double.parseDouble( aForm.getMbbThresholdAmt().substring(4,aForm.getMbbThresholdAmt().length()) ),
                                                /*aForm.getMbbThresholdAmt().substring(0,3) );*/%>
                <integro:empty-if-null value="<%=aForm.getMbbThresholdAmt()%>"/>&nbsp;
                <%}%>&nbsp;
                <%if(request.getAttribute("mbbAmountError") != null && request.getAttribute("mbbAmountError").equals("true")){%>
                <bean:message key="error.no.conversion"/>
                <%}%>
              </td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.agreement.eligible.margin"/></td>
              <td>Cash &nbsp;</td>
              <td class="fieldname"><bean:message key="label.agreement.agreed.interest.rate"/>&nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="agreeIntRateType">
                  <option value="" >Please Select </option>
                  <html:options name="interestRateTypeListID" labelName="interestRateTypeListValue"/>
                </html:select>
                <html:errors property="agreeIntRateType"/>&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.base.currency"/> &nbsp;<font color="#0000FF">* </font></td>
              <td>
                <html:select property="baseCurrency" onchange="displayThresholdRatingAmt()">
                  <option value="" >Please Select </option>
                  <html:options name="currencyCode" labelName="currencyCode" />
                </html:select>
                <html:errors property="baseCurrency"/>&nbsp;
              </td>
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
              <td colspan="3"><html:text property="agentBankName" maxlength="40" /> <html:errors property="agentBankName" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.address"/></td>
              <td colspan="3">
                <html:textarea property="agentBankAddress" rows="3" cols="120"/> <html:errors property="agentBankAddress" />&nbsp;
              </td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.agreement.bank.clearance.id"/></td>
              <td><html:text property="bankClearanceId" maxlength="40" /> <html:errors property="bankClearanceId" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.agreement.order.acc.id"/></td>
              <td><html:text property="bankAccountId" maxlength="40" /> <html:errors property="bankAccountId" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="fieldname"><bean:message key="label.agreement.clearing"/></td>
              <td><html:text property="clearingDesc" maxlength="40" /> <html:errors property="clearingDesc" />&nbsp;</td>
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
              <td><html:text property="notificationTime" maxlength="40" /> <html:errors property="notificationTime" />&nbsp;</td>
              <td class="fieldname"><bean:message key="label.agreement.valuation.time"/></td>
              <td><html:text property="valuationTime" maxlength="40" /> <html:errors property="valuationTime" />&nbsp;</td>
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
    <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/save2.gif',1)"><img src="img/save1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
    <td><a href="javascript:returnPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image51" /></a></td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>

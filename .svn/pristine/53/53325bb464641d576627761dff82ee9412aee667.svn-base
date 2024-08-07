<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
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
    String event = request.getParameter("event");
    String preEvent = request.getParameter("preEvent");
    String trxId = request.getParameter("TrxId");

    OBLimitProfileTrxValue obTrxValue = null;
    Object obj = session.getAttribute("com.integrosys.cms.ui.manualinput.aa.AADetailAction.limitProfileTrxVal");
    com.integrosys.cms.ui.manualinput.aa.TradingAgreementForm aForm = (com.integrosys.cms.ui.manualinput.aa.TradingAgreementForm) request.getAttribute("TradingAgreementForm");
    ILimitProfile  parametersLimitProfile = null ;
    ILimitProfile  stagingParametersLimitProfile = null ;
    ITradingAgreement tradingAgreement = null;
    ITradingAgreement stagingTradingAgreement = null;
    boolean entries_editable = false;
    boolean isRejected = false;

    if( obj!=null ) {
        DefaultLogger.debug(this,  "@@@Debug:::1 FROM JSP got session.limitProfileTrxVal");
        obTrxValue = (OBLimitProfileTrxValue)obj;

        parametersLimitProfile = obTrxValue.getLimitProfile();

        if(parametersLimitProfile != null){
          tradingAgreement = parametersLimitProfile.getTradingAgreement();
        }

        stagingParametersLimitProfile = obTrxValue.getStagingLimitProfile();

        if(stagingParametersLimitProfile != null){
          stagingTradingAgreement = stagingParametersLimitProfile.getTradingAgreement();
        }

   }else {
        DefaultLogger.debug(this, "@@@Debug::: FROM JSP got NULL in session.'limitProfileTrxVal' ");
   }

   boolean isProcess = true;
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
    document.forms[0].action = "ThresholdRating.do?event=checker_view_threshold&preEvent=<%=preEvent%>&indexChange=0&TrxId=<%=trxId%>";
    document.forms[0].submit();
}

function goPreviousPage() {
    document.forms[0].action = "MIAADetail.do?event=checker_edit_aadetail&TrxId=<%=trxId%>";
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
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"agreementType")?"fieldname":"fieldnamediff"%>" width="30%"><bean:message key="label.agreement.type"/></td>
              <td width="20%">
                <%String agreementType = null;
                  if(! (stagingTradingAgreement.getAgreementType().equals(null) || stagingTradingAgreement.getAgreementType().equals("")) ){
                    agreementType = AgreementTypeList.getInstance().getAgreementTypeName(stagingTradingAgreement.getAgreementType());
                  }%>
                <integro:empty-if-null value="<%=agreementType%>" />&nbsp;
              </td>
              <td class="fieldname" width="30%">&nbsp;</td>
              <td width="20%">&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"counterPartyBranch")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.counterparty.branch"/></td>
              <td><integro:empty-if-null value="<%=stagingTradingAgreement.getCounterPartyBranch()%>" />&nbsp;</td>
            <%  
                boolean changed = false;
                Amount oldMinTransAmt = tradingAgreement!=null?tradingAgreement.getMinTransferAmount():null;
                Amount newMinTransAmt = stagingTradingAgreement.getMinTransferAmount();
                if (isProcess) {
                    if (newMinTransAmt != null && oldMinTransAmt == null) {
                        if (newMinTransAmt.getAmount() != 0) {
                            changed = true;
                        }
                    } else if (newMinTransAmt != null && oldMinTransAmt != null) {
                        changed = !CompareOBUtil.compOB(newMinTransAmt,oldMinTransAmt,"Amount");
                        if(!changed){
                          changed = !CompareOBUtil.compOB(newMinTransAmt,oldMinTransAmt,"CurrencyCode");
                        }
                    }
                }
            %>
              <td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.agreement.min.transfer.amt"/></td>
              <td><integro:amount param="all" amount="<%=stagingTradingAgreement.getMinTransferAmount()%>" decimal="4"/>&nbsp;</td>
            </tr>

            <tr class="even">
              <%  
                changed = false;
                IExternalRating oldCptRate = tradingAgreement!=null?tradingAgreement.getCounterPartyExtRating():null;
                IExternalRating newCptRate = stagingTradingAgreement.getCounterPartyExtRating();
                if (newCptRate != null && oldCptRate == null) {
                  if ( newCptRate.getRatingType() != null ) {
                      changed = true;
                  }
                } else if (newCptRate != null && oldCptRate != null) {
                  changed = !CompareOBUtil.compOB(newCptRate,oldCptRate,"ratingType");
                }
                %>
              <td class="<%=!changed?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.counterparty.rating.type"/></td>
              <td>
                <%String ratingType = null;
                  if(newCptRate != null){
                    if(! (newCptRate.getRatingType().equals(null) || newCptRate.getRatingType().equals("")) ){
                      ratingType = RatingTypeList.getInstance().getRatingTypeName(newCptRate.getRatingType());
                    }
                  }%>
                <integro:empty-if-null value="<%=ratingType%>" />&nbsp;
              </td>
                <%
                  changed = false;
                  if (newCptRate != null && oldCptRate == null) {
                    if ( newCptRate.getRating() != null ) {
                        changed = true;
                    }
                  } else if (newCptRate != null && oldCptRate != null) {
                    changed = !CompareOBUtil.compOB(newCptRate,oldCptRate,"rating");
                  }
                %>
              <td class="<%=!changed?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.counterparty.rating"/></td>
              <td>
                <%String rating = null;
                  if(newCptRate != null){
                    if(! (newCptRate.getRating().equals(null) || newCptRate.getRating().equals("")) ){
                      rating = RatingList.getInstance(newCptRate.getRatingType()).getRatingName(newCptRate.getRating());
                    }
                  }%>
                <integro:empty-if-null value="<%=rating%>" />&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <%  
                changed = false;
                Amount oldCounterpartyAmt = tradingAgreement!=null?tradingAgreement.getCounterPartyThresholdAmount():null;
                Amount newCounterpartyAmt = stagingTradingAgreement.getCounterPartyThresholdAmount();
                if (isProcess) {
                    if (newCounterpartyAmt != null && oldCounterpartyAmt == null) {
                        if (newCounterpartyAmt.getAmount() != 0) {
                            changed = true;
                        }
                    } else if (newCounterpartyAmt != null && oldCounterpartyAmt != null) {
                        changed = !CompareOBUtil.compOB(newCounterpartyAmt,oldCounterpartyAmt,"Amount");
                        if(!changed){
                          changed = !CompareOBUtil.compOB(newCounterpartyAmt,oldCounterpartyAmt,"CurrencyCode");
                        }
                    }
                }
              %>
              <td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.agreement.counterparty.threshold.amt"/></td>
              <td><integro:amount param="all" amount="<%=stagingTradingAgreement.getCounterPartyThresholdAmount()%>" decimal="4"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

            <tr class="even">
              <%  
                changed = false;
                IExternalRating oldMbbRate = tradingAgreement!=null?tradingAgreement.getMbbExtRating():null;
                IExternalRating newMbbRate = stagingTradingAgreement.getMbbExtRating();
                if (newMbbRate != null && oldMbbRate == null) {
                  if ( newMbbRate.getRatingType() != null ) {
                      changed = true;
                  }
                } else if (newMbbRate != null && oldMbbRate != null) {
                  changed = !CompareOBUtil.compOB(newMbbRate,oldMbbRate,"ratingType");
                }
                %>
              <td class="<%=!changed?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.maybank.rating.type"/></td>
              <td>
                <%ratingType = null;
                  if(newMbbRate != null){
                    if(! (newMbbRate.getRatingType().equals(null) || newMbbRate.getRatingType().equals("")) ){
                      ratingType = RatingTypeList.getInstance().getRatingTypeName(newMbbRate.getRatingType());
                    }
                  }%>
                <integro:empty-if-null value="<%=ratingType%>" />&nbsp;
              </td>
              <%  
                changed = false;
                if (newMbbRate != null && oldMbbRate == null) {
                  if ( newMbbRate.getRating() != null ) {
                      changed = true;
                  }
                } else if (newMbbRate != null && oldMbbRate != null) {
                  changed = !CompareOBUtil.compOB(newMbbRate,oldMbbRate,"rating");
                }
                %>
              <td class="<%=!changed?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.maybank.rating"/></td>
              <td>
                <%rating = null;
                  if(newMbbRate != null){
                    if(! (newMbbRate.getRating().equals(null) || newMbbRate.getRating().equals("")) ){
                      rating = RatingList.getInstance(newMbbRate.getRatingType()).getRatingName(newMbbRate.getRating());
                    }
                  }%>
                <integro:empty-if-null value="<%=rating%>" />&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <%  
                changed = false;
                Amount oldMbbAmt = tradingAgreement!=null?tradingAgreement.getMbbThresholdAmount():null;
                Amount newMbbAmt = stagingTradingAgreement.getMbbThresholdAmount();
                if (isProcess) {
                    if (newMbbAmt != null && oldMbbAmt == null) {
                        if (newMbbAmt.getAmount() != 0) {
                            changed = true;
                        }
                    } else if (newMbbAmt != null && oldMbbAmt != null) {
                        changed = !CompareOBUtil.compOB(newMbbAmt,oldMbbAmt,"Amount");
                        if(!changed){
                          changed = !CompareOBUtil.compOB(newMbbAmt,oldMbbAmt,"CurrencyCode");
                        }
                    }
                }
              %>
              <td class="<%=isProcess?(!changed?"fieldname":"fieldnamediff"):"fieldname"%>"><bean:message key="label.agreement.maybank.threshold.amt"/></td>
              <td><integro:amount param="all" amount="<%=stagingTradingAgreement.getMbbThresholdAmount()%>" decimal="4"/>&nbsp;</td>
              <td class="fieldname">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="fieldname"><bean:message key="label.agreement.eligible.margin"/></td>
              <td>Cash &nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"agreeIntRateType")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.agreed.interest.rate"/></td>
              <td>
                <%String intRateType = null;
                  if(! (stagingTradingAgreement.getAgreeIntRateType().equals(null) || stagingTradingAgreement.getAgreeIntRateType().equals("")) ){
                    intRateType = InterestRateTypeList.getInstance().getInterestRateTypeName(stagingTradingAgreement.getAgreeIntRateType());
                  }%>
                <integro:empty-if-null value="<%=intRateType%>" />&nbsp;
              </td>
            </tr>

            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"baseCurrency")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.base.currency"/></td>
              <td><integro:empty-if-null value="<%=stagingTradingAgreement.getBaseCurrency()%>" />&nbsp;</td>
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
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"agentBankName")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.agent.bank.nm"/></td>
              <td colspan="3"><integro:empty-if-null value="<%=stagingTradingAgreement.getAgentBankName()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"agentBankAddress")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.address"/></td>
              <td colspan="3"><integro:htmltext value="<%=stagingTradingAgreement.getAgentBankAddress()%>" lineLength="120" />&nbsp;</td>
            </tr>

            <tr class="even">
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"bankClearanceID")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.bank.clearance.id"/></td>
              <td><integro:empty-if-null value="<%=stagingTradingAgreement.getBankClearanceID()%>" />&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"bankAccountID")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.order.acc.id"/></td>
              <td><integro:empty-if-null value="<%=stagingTradingAgreement.getBankAccountID()%>" />&nbsp;</td>
            </tr>

            <tr class="odd">
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"clearingDesc")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.clearing"/></td>
              <td><integro:empty-if-null value="<%=stagingTradingAgreement.getClearingDesc()%>" />&nbsp;</td>
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
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"notificationTime")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.notification.time"/></td>
              <td><integro:empty-if-null value="<%=stagingTradingAgreement.getNotificationTime()%>" />&nbsp;</td>
              <td class="<%=CompareOBUtil.compOB(stagingTradingAgreement,tradingAgreement,"valuationTime")?"fieldname":"fieldnamediff"%>"><bean:message key="label.agreement.valuation.time"/></td>
              <td><integro:empty-if-null value="<%=stagingTradingAgreement.getValuationTime()%>" />&nbsp;</td>
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

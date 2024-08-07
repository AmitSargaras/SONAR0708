<%@ page import="com.integrosys.cms.ui.collateral.commodity.hedgedcontract.HedgedConForm,
                 com.integrosys.cms.ui.collateral.commodity.hedgedcontract.HedgedConAction,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.collateral.bus.type.commodity.IHedgingContractInfo,
                 com.integrosys.base.businfra.currency.Amount"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/hedgedcontract/chk_view_hedgedcon.jsp,v 1.13 2006/10/27 08:31:03 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.13 $
* Date: $Date: 2006/10/27 08:31:03 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("from_page");
    HedgedConForm aForm = (HedgedConForm)request.getAttribute("HedgedConForm");

    String actualSecID = (String)request.getAttribute("actualSecID");
    String stageSecID = (String)request.getAttribute("stageSecID");

    IHedgingContractInfo actualHedgedCon = (IHedgingContractInfo)request.getAttribute("actualHedgedCon");
    IHedgingContractInfo stageHedgedCon = (IHedgingContractInfo)request.getAttribute("stageHedgedCon");
%>

<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" --><head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<!-- InstanceBeginEditable name="CssStyle" -->

<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />

<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function returnPage() {
    document.forms[0].event.value = "<%=HedgedConAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}

//-->
</script>

</head>
<body>
<html:form action="HedgedContract.do">
<input type="hidden" name="event" value="<%=HedgedConAction.EVENT_READ_RETURN%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.title.process.commodity"/></h3></td>
    </tr>
    <tr>

    <td>
      <h3><bean:message key="label.security.hedging.contract.infor"/></h3>
    </td>
    </tr>
    <tr>
      <td> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
        <%
            boolean isSecSame = false;
            if (actualSecID != null && stageSecID != null &&
                    actualSecID.equals(stageSecID)) {
                isSecSame = true;
            }
        %>
          <td width="20%" class="<%=isSecSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.id"/>&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%"><bean:write name="HedgedConForm" property="securityID"/>&nbsp;</td>
          <td width="20%" class="<%=CompareOBUtil.compOB(stageHedgedCon, actualHedgedCon, "globalTreasuryReference")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.global.treasury.ref.no"/>&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%"><bean:write name="HedgedConForm" property="globalTreasuryRef"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(stageHedgedCon, actualHedgedCon, "dateOfDeal")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.date.deal"/>&nbsp;<font color="#0000FF">* </font></td>
          <td class="even"><bean:write name="HedgedConForm" property="dealDate"/>&nbsp;</td>
          <td class="<%=CompareOBUtil.compOB(stageHedgedCon, actualHedgedCon, "nameOfTheCounterParty")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.name.counterparty"/></td>
          <td><integro:wrapper lineLength="30" value="<%=aForm.getCounterParty()%>"/>&nbsp;</td>
        </tr>
        <tr class="odd">
        <%
            Amount actualAmt = null;
            Amount stageAmt = null;
            if (actualHedgedCon != null) {
                actualAmt = actualHedgedCon.getDealAmount();
            }
            if (stageHedgedCon != null) {
                stageAmt = stageHedgedCon.getDealAmount();
            }
            boolean isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "currencyCode");
            if (isSame) {
                isSame = CompareOBUtil.compOB(stageAmt, actualAmt, "amountAsBigDecimal");
            }
        %>
          <td  class="<%=isSame?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.amount.deal"/></td>
          <td><bean:write name="HedgedConForm" property="dealAmtCcy"/>&nbsp;
          <bean:write name="HedgedConForm" property="dealAmt"/>
          </td>
          <td class="<%=CompareOBUtil.compOB(stageHedgedCon, actualHedgedCon, "hedgingAgreement")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.hedging.agreement.ref"/>&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="HedgedConForm" property="hedgedAgreeRef"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(stageHedgedCon, actualHedgedCon, "hedgingAgreementDate")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.date.hedging.agreement"/></td>
          <td><bean:write name="HedgedConForm" property="hedgedAgreeDate"/>&nbsp;</td>
          <td class="<%=CompareOBUtil.compOB(stageHedgedCon, actualHedgedCon, "margin")?"fieldname":"fieldnamediff"%>"><bean:message key="label.security.margin"/>&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="HedgedConForm" property="margin"/>&nbsp;%</td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td>
    <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
  </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

</body>
</html>

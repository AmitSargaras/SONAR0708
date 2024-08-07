<%@ page import="com.integrosys.cms.ui.commoditydeal.generalinfo.cashdeposit.CashDepositAction,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.cashdeposit.CashDepositForm,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.commodity.deal.bus.cash.IDealCashDeposit,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.cms.ui.commoditydeal.generalinfo.cashdeposit.CashTypeList,
                 com.integrosys.cms.ui.common.CountryList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/generalinfo/cashdeposit/chk_view_cash_deposit.jsp,v 1.10 2006/10/27 08:40:53 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.10 $
* Date: $Date: 2006/10/27 08:40:53 $
* Tag: $Name:  $
*/
%>
<%
    IDealCashDeposit actualCashDeposit = (IDealCashDeposit)request.getAttribute("actualCashDep");
    IDealCashDeposit stageCashDeposit = (IDealCashDeposit)request.getAttribute("stageCashDep");

    CashDepositForm aForm = (CashDepositForm)request.getAttribute("CashDepositForm");
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
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function returnPage() {
    document.forms[0].event.value = "<%=CashDepositAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="MM_preloadImages('img/save2.gif','img/cancel2.gif','img/calendarb.gif')">
<!-- InstanceBeginEditable name="Content" -->
<html:form action="DealCashDeposit.do">
<%@ include file="/commoditydeal/commodity_deal_frame.jsp"%>
<input type="hidden" name="event" value="<%=CashDepositAction.EVENT_FORWARD%>"/>
<input type="hidden" name="next_page"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table class="tblFormSection" width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      <h3>Deposit Information - View</h3>
    </td>
    </tr>
    <tr>
      <td><hr/></td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tr class="odd">
          <td width="61%" class="<%=CompareOBUtil.compOB(stageCashDeposit, actualCashDeposit, "depositType")?"fieldname":"fieldnamediff"%>">Type of Cash Holding&nbsp;<font color="#0000FF">* </font></td>
          <td width="39%"><integro:empty-if-null value="<%=CashTypeList.getInstance().getCashTypeItem(aForm.getTypeCashHolding())%>"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td width="61%" class="<%=CompareOBUtil.compOB(stageCashDeposit, actualCashDeposit, "referenceNo")?"fieldname":"fieldnamediff"%>">Deposit/Source Ref Number&nbsp;<font color="#0000FF">* </font></td>
          <td width="39%"><bean:write name="CashDepositForm" property="depositNumber"/>&nbsp;
          </td>
        </tr>
        <%
            Amount actualAmount = null;
            Amount stageAmount = null;
            if (actualCashDeposit != null) {
                actualAmount = actualCashDeposit.getAmount();
            }
            if (stageCashDeposit != null) {
                stageAmount = stageCashDeposit.getAmount();
            }
        %>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(stageAmount, actualAmount, "currencyCode")?"fieldname":"fieldnamediff"%>">CCY&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="CashDepositForm" property="depositCcy"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(stageAmount, actualAmount, "amountAsBigDecimal")?"fieldname":"fieldnamediff"%>">Deposit Amount&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="CashDepositForm" property="depositAmt"/>&nbsp;
          </td>
        </tr>
        <tr class="odd">
          <td class="<%=CompareOBUtil.compOB(stageCashDeposit, actualCashDeposit, "locationCountryCode")?"fieldname":"fieldnamediff"%>">Cash Location&nbsp;<font color="#0000FF">* </font></td>
          <td><integro:empty-if-null value="<%=CountryList.getInstance().getCountryName(aForm.getCashLocation())%>"/>&nbsp;
          </td>
        </tr>
        <tr class="even">
          <td class="<%=CompareOBUtil.compOB(stageCashDeposit, actualCashDeposit, "maturityDate")?"fieldname":"fieldnamediff"%>">Deposit Maturity Date&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="CashDepositForm" property="depositMaturityDate"/>&nbsp;
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150"  border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" width="100" valign="baseline" align="center">
            <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        </td>
    </tr>
    <tr>
        <td valign="baseline" align="center">&nbsp;</td>
        <td valign="baseline" align="center">&nbsp;</td>
    </tr>
</table>

<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>

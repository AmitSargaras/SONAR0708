<%@ page import="com.integrosys.cms.ui.commoditydeal.generalinfo.cashdeposit.CashDepositAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/commoditydeal/generalinfo/cashdeposit/update_cash_deposit.jsp,v 1.9 2006/10/27 08:40:53 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.9 $
* Date: $Date: 2006/10/27 08:40:53 $
* Tag: $Name:  $
*/
%>
<%
    String indexID = (String)request.getParameter("indexID");
    String title = indexID.equals("-1")?"Add New":"Edit";
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

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=CashDepositAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=CashDepositAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=CashDepositAction.EVENT_CANCEL%>";
    }
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
<input type="hidden" name="indexID" value="<%=indexID%>"/>
<input type="hidden" name="next_page"/>
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<table class="tblFormSection" width="50%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px">
  <thead>
    <tr>
      <td>
      <h3>Deposit Information - <%=title%></h3>
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
          <td width="61%" class="fieldname">Type of Cash Holding&nbsp;<font color="#0000FF">* </font></td>
          <td width="39%">
              <html:select property="typeCashHolding">
	              <option value="" >Please Select </option>
	              <html:options name="cashTypeID" labelName="cashTypeValue"/>
              </html:select>
              <html:errors property="typeCashHolding"/>
          </td>
        </tr>
        <tr class="even">
          <td width="61%" class="fieldname">Deposit/Source Ref Number&nbsp;<font color="#0000FF">* </font></td>
          <td width="39%">
            <html:text property="depositNumber" maxlength="15"/>
            <html:errors property="depositNumber"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">CCY&nbsp;<font color="#0000FF">* </font></td>
          <td>
              <html:select property="depositCcy">
	              <option value="" >Please Select </option>
	              <html:options name="currencyCode" labelName="currencyCode"/>
              </html:select>
              <html:errors property="depositCcy"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Deposit Amount&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:text property="depositAmt" maxlength="27"/>
            <html:errors property="depositAmt"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname">Cash Location&nbsp;<font color="#0000FF">* </font></td>
          <td>
              <html:select property="cashLocation">
	              <option value="" >Please Select </option>
	              <html:options name="countryValues" labelName="countryLabels"/>
              </html:select>
              <html:errors property="cashLocation"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname">Deposit Maturity Date&nbsp;<font color="#0000FF">* </font></td>
          <td>
			  <html:text property="depositMaturityDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('depositMaturityDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="depositMaturityDate"/>
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
        <td width="75" valign="baseline" align="center">
        <%
            if (indexID.equals("-1")) {
        %>
            <a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } else { %>
            <a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image3311','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image3311"  border="0" id="Image3311" /></a>
        <% } %>
        </td>
        <td width="75" valign="baseline" align="center">
            <a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image4411','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image4411"  border="0" id="Image4411" /></a>
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

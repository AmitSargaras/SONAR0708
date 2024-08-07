<%@ page import="com.integrosys.cms.ui.collateral.commodity.hedgedcontract.HedgedConForm,
                 com.integrosys.cms.ui.collateral.commodity.hedgedcontract.HedgedConAction,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/hedgedcontract/update_hedgedcon.jsp,v 1.12 2006/10/27 08:31:03 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.12 $
* Date: $Date: 2006/10/27 08:31:03 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("event");
    if (request.getParameter("from_page") != null) {
        from_event = request.getParameter("from_page");
    }

    String title = "Add New";

    HedgedConForm aForm = (HedgedConForm)request.getAttribute("HedgedConForm");
    String index = request.getParameter("indexID");

    boolean is_add = false;
    if (index.equals("-1")) {
        is_add = true;
    }
    if (!is_add) {
        title = "Edit";
    }
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

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=HedgedConAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=HedgedConAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=HedgedConAction.EVENT_CANCEL%>";
    }
    document.forms[0].submit();
}

//-->
</script>

</head>
<body>
<html:form action="HedgedContract.do">
<input type="hidden" name="event" value="<%=HedgedConAction.EVENT_UPDATE%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="secIndexID" value="<%=request.getParameter("secIndexID")%>"/>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.commodity"/></h3></td>
    </tr>
    <tr>

    <td>
      <h3><bean:message key="label.security.hedging.contract.infor"/> - <%=title%></h3>
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
          <td width="20%" class="fieldname"><bean:message key="label.security.id"/>&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
          <%
              if (is_add) {
          %>
            <html:select property="securityID">
	        <option value="" ><bean:message key="label.please.select"/></option>
	        <html:options name="secID" labelName="secValue"/>
            </html:select>&nbsp;
            <html:errors property="securityID"/>
          <%
              } else {
          %>
          <integro:empty-if-null value="<%=aForm.getSecurityID()%>"/>
          <html:hidden property="securityID"/>
          <% } %>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.global.treasury.ref.no"/>&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
            <html:text property="globalTreasuryRef" maxlength="50" size="30"/>&nbsp;
            <html:errors property="globalTreasuryRef"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.date.deal"/>&nbsp;<font color="#0000FF">* </font></td>
          <td class="even">
			  <html:text property="dealDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('dealDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="dealDate"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.name.counterparty"/></td>
          <td>
            <html:text property="counterParty" maxlength="150" size="30"/>&nbsp;
            <html:errors property="counterParty"/>
          </td>
        </tr>
        <tr class="odd">
          <td  class="fieldname"><bean:message key="label.security.amount.deal"/></td>
          <td>
                <html:select property="dealAmtCcy">
	                <option value="" ><bean:message key="label.please.select"/> </option>
	                <html:options name="currencyCode" labelName="currencyCode"/>
                 </html:select>&nbsp;
                 <html:text property="dealAmt" maxlength="27"/>
                <html:errors property="dealAmtCcy"/>
                <html:errors property="dealAmt"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.hedging.agreement.ref"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:text property="hedgedAgreeRef" maxlength="30"/>&nbsp;
            <html:errors property="hedgedAgreeRef"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.date.hedging.agreement"/></td>
          <td>
			  <html:text property="hedgedAgreeDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('hedgedAgreeDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="hedgedAgreeDate"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.margin"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:text property="margin" maxlength="3" size="4"/>&nbsp;%
            <html:errors property="margin"/>
          </td>
        </tr>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="96">&nbsp;</td>
    <td width="54">&nbsp;</td>
  </tr>
  <tr>
    <%
        if (is_add) {
    %>
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image41" width="60" height="22" border="0" id="Image4" /></a></td>
    <% }  else { %>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image41" width="60" height="22" border="0" id="Image4" /></a></td>
    <% } %>
    <td><a href="javascript:submitPage(3)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

</body>
</html>

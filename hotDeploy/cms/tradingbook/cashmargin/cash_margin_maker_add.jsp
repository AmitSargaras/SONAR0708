<%@ page import="com.integrosys.base.techinfra.logger.DefaultLogger,
                 com.integrosys.component.common.constant.ICompConstant,
                 com.integrosys.cms.ui.common.UIUtil,
                 com.integrosys.cms.ui.common.ConvertFloatToString,
                 com.integrosys.cms.app.tradingbook.bus.ICashMargin,
                 com.integrosys.cms.app.tradingbook.trx.OBCashMarginTrxValue"%>
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
* Purpose: For Maker add new Cash Margin
* Description: add new Cash Margin value by Maker
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
    String agreementID = request.getParameter("agreementID");
    String TrxId = request.getParameter("TrxId");
    String indexChanged = request.getParameter("indexChanged");
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
<script type="text/javascript" src="js/emulation.js"></script>
<script language="JavaScript" src="js/itgPrjConfigSetup.js"></script>
<script language="JavaScript" src="js/itgCheckForm.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<script type="text/javascript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script type="text/javascript" src="js/enableFields.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function goPreviousPage() {
    document.forms[0].action = "CashMargin.do?event=<%=preEvent%>&agreementID=<%=agreementID%>&TrxId=<%=TrxId%>&indexChanged=<%=indexChanged%>&index=1";
    document.forms[0].submit();
}

function submitPage() {
  if('maker_create_editreject' == '<%=event%>'){
    document.forms[0].action = "CashMargin.do?event=maker_create_editreject_confirm&preEvent=<%=preEvent%>&agreementID=<%=agreementID%>&TrxId=<%=TrxId%>&indexChanged=<%=indexChanged%>";
  }else{
    document.forms[0].action = "CashMargin.do?event=maker_create_cashmargin_confirm&preEvent=<%=preEvent%>&agreementID=<%=agreementID%>&TrxId=<%=TrxId%>&indexChanged=<%=indexChanged%>";
  }
    document.forms[0].submit();
}

//-->
</script>
<!-- InstanceEndEditable -->
</head>
<html:form action="CashMargin.do">
<body>
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td width="100%" valign="bottom">
        <table width="100%"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td><h3><bean:message key="label.cash.margin.title"/></h3></td>
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
              <td class="fieldname"><bean:message key="label.cash.margin.transaction.date"/></td>
              <td>
                <html:text property="trxDate" readonly="true" />
                <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('trxDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
                <html:errors property="trxDate"/>
              </td>
              <td  class="fieldname"><bean:message key="label.cash.margin.net.act.principal"/></td>
              <td>
                <html:radio property="napSignAddValue" value="Y">+</html:radio>
                <html:radio property="napSignAddValue" value="N">-</html:radio>
                <html:text property="napValue" maxlength="40" />
                <html:errors property="napValue"/>&nbsp;
              &nbsp;</td>
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
    <td><a href="javascript:submitPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
    <td><a href="javascript:goPreviousPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image2','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image2" width="70" height="20" border="0" id="Image2" /></a></td>
  </tr>
</table>
<!-- InstanceEndEditable -->
</body>
</html:form>

<!-- InstanceEnd -->
</html>

<%@ page import="com.integrosys.cms.ui.collateral.commodity.loanagency.loanschedule.LoanScheduleAction,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ILoanSchedule,
                 com.integrosys.cms.ui.collateral.commodity.loanagency.loanschedule.LoanScheduleForm,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ILoanAgency"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/loanagency/loanschedule/update_loan_schedule.jsp,v 1.14 2006/10/27 08:31:21 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.14 $
* Date: $Date: 2006/10/27 08:31:21 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("from_page");
    LoanScheduleForm aForm = (LoanScheduleForm)request.getAttribute("LoanScheduleForm");
    ILoanAgency loanAgencyObj = (ILoanAgency)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.serviceLoanAgency");
    String currencyCode = null;
    if (loanAgencyObj != null && loanAgencyObj.getPrincipleAmount() != null) {
        currencyCode = loanAgencyObj.getPrincipleAmount().getCurrencyCode();
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
<script type="text/javascript" src="js/dateext.js"></script>
<script type="text/javascript" src="js/emulation.js"></script>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--


function submitPage(num) {
    if(num == 1) {
        document.forms[0].event.value="<%=LoanScheduleAction.EVENT_UPDATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value="<%=LoanScheduleAction.EVENT_CANCEL%>";
    }
    if (num ==3) {
        document.forms[0].event.value="<%=LoanScheduleAction.EVENT_REFRESH%>";
    }
    document.forms[0].submit();
}

function setActualDate(cal, date) {
    cal.sel.value = date;
    var name = cal.sel.name;
    var num = parseInt(name.substring(11, name.length));

    if (document.forms[0].paymentDate.length+'' == 'undefined') {
        document.forms[0].paymentDate.value = date;
    } else {
        document.forms[0].paymentDate[num].value = date;
    }
}

//-->
</script>

</head>

<body>
<html:form action="LoanSchedule.do">
<input type="hidden" name="event" value="<%=LoanScheduleAction.EVENT_UPDATE%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="secIndexID" value="<%=request.getParameter("secIndexID")%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td colspan="2">
      <h3><bean:message key="label.security.title.edit.syndicated.facility"/></h3>
    </td>
    </tr>
    <tr>
    <td>
      <h3><bean:message key="label.security.title.edit.non.loan.schedule"/></h3>
    </td>
    <td width="0" valign="baseline" align="right">
        <input type="button" name="Button" value="Refresh" class="btnNormal" onclick="submitPage(3)"/>
    </td>
    </tr>
    <tr>
      <td colspan="2"> <hr/> </td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <thead>
		<tr>
          <td width="4%"><b><bean:message key="label.global.sn"/></b></td>
          <td width="19%"><b><bean:message key="label.security.payment.date"/></b></td>
          <td width="21%"><b><bean:message key="label.security.amount.principal.due"/></b></td>
          <td width="25%"><b><bean:message key="label.security.amount.interest.due"/></b></td>
          <td width="31%"><b><bean:message key="label.security.total.payment.due"/></b></td>
        </tr>
		</thead>
        <tbody>
        <%
            String[] paymentDate = aForm.getPaymentDate();
            String[] principalDue = aForm.getPrincipalAmtDue();
            String[] interestDue = aForm.getInterestAmtDue();
            String[] totalPaymentDue = aForm.getTotalPaymentDue();
            if (paymentDate == null || paymentDate.length == 0) {
        %>
        <tr class="odd"><td colspan="5"><bean:message key="label.security.none.loan.schedule"/></td></tr>
        <%
            }  else {
                for (int i = 0; i < paymentDate.length ;i++) {
        %>
        <tr class="<%=i%2==0?"odd":"even"%>">
          <td width="4%" class="index"><%=i + 1%></td>
          <td width="19%">
			  <html:text property="paymentDate" readonly="true" size="15" maxlength="11" value="<%=paymentDate[i]%>"/>
              <% String paymentDateStr = "paymentDate"+String.valueOf(i); %>
              <input type="hidden" name="<%=paymentDateStr%>"/>
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendarWithCustomHandling('<%=paymentDateStr%>', 'dd/mm/y', setActualDate);" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />

              <html:errors property="<%=paymentDateStr%>"/>
          </td>
          <td width="21%">
            <integro:empty-if-null value="<%=currencyCode%>"/>&nbsp;
            <html:text property="principalAmtDue" value="<%=principalDue[i]%>" maxlength="27"/>&nbsp;
            <% String strErr1 = "principalAmtDue"+String.valueOf(i); %>

            <html:errors property="<%=strErr1%>"/>
          </td>
          <td width="25%">
            <integro:empty-if-null value="<%=currencyCode%>"/>&nbsp;
            <html:text property="interestAmtDue" value="<%=interestDue[i]%>" maxlength="27"/>&nbsp;
            <% String strErr2 = "interestAmtDue"+String.valueOf(i); %>

            <html:errors property="<%=strErr2%>"/>
          </td>
          <td width="31%">
          <integro:empty-if-null value="<%=currencyCode%>"/>&nbsp;
          <integro:empty-if-null value="<%=totalPaymentDue[i]%>"/>
          <html:hidden property="totalPaymentDue" value="<%=totalPaymentDue[i]%>"/>
          </td>
        </tr>
        <% }} %>
        </tbody>
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
    <td><a href="javascript:submitPage(1)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/ok2.gif',1)"><img src="img/ok1.gif" name="Image41" width="60" height="22" border="0" id="Image4" /></a></td>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/cancel2.gif',1)"><img src="img/cancel1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

</body>
</html>
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
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/loanagency/loanschedule/view_loan_schedule.jsp,v 1.12 2006/10/27 08:31:21 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.12 $
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
    String event = request.getParameter("event");
    String indexID = request.getParameter("indexID");
    String secIndexID = request.getParameter("secIndexID");
%>
<html>


<!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<!-- InstanceBeginEditable name="CssStyle" -->


<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

function returnPage() {
    document.forms[0].event.value="<%=LoanScheduleAction.EVENT_RETURN%>";
    document.forms[0].submit();
}

function submitPage(num) {
    if (num == 2) {
        document.forms[0].event.value="<%=LoanScheduleAction.EVENT_CANCEL%>";
    }
    document.forms[0].submit();
}

function printPage() {
    var strPath = "LoanSchedule.do?event=<%=LoanScheduleAction.EVENT_PRINT_EQUAL_PAYMENT%>";
    strPath = strPath+"&from_page=<%=from_event%>";
    strPath = strPath+"&indexID=<%=indexID%>";
    strPath = strPath+"secIndexID=<%=secIndexID%>";
    window.open(strPath);
}
//-->
</script>

</head>

<body>
<html:form action="LoanSchedule.do">
<input type="hidden" name="event" value="<%=LoanScheduleAction.EVENT_RETURN%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="secIndexID" value="<%=request.getParameter("secIndexID")%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3><bean:message key="label.security.title.view.syndicated.facility"/></h3>
    </td>
    </tr>
    <tr>
      <td>
      <h3><%=loanAgencyObj.getIsEqualInstalments()?"Equal":"Non-Equal"%>&nbsp; <bean:message key="label.security.title.view.loan.schedule"/></h3>
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
          <td width="19%"><integro:empty-if-null value="<%=paymentDate[i]%>"/>&nbsp;</td>
          <td width="21%">
            <integro:empty-if-null value="<%=currencyCode%>"/>&nbsp;
            <integro:empty-if-null value="<%=principalDue[i]%>"/>
          </td>
          <td width="25%">
            <integro:empty-if-null value="<%=currencyCode%>"/>&nbsp;
            <integro:empty-if-null value="<%=interestDue[i]%>"/>
          </td>
          <td width="31%">
          <integro:empty-if-null value="<%=currencyCode%>"/>&nbsp;
          <integro:empty-if-null value="<%=totalPaymentDue[i]%>"/>
          </td>
        </tr>
        <% }} %>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<%
    if (event != null && !event.equals(LoanScheduleAction.EVENT_PRINT_EQUAL_PAYMENT)) {
%>
<table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="96">&nbsp;</td>
    <td width="54">&nbsp;</td>
  </tr>
  <tr>
  <%
      if (from_event.equals(LoanScheduleAction.EVENT_PREPARE_UPDATE) ||
              from_event.equals(LoanScheduleAction.EVENT_PROCESS_UPDATE)) {
  %>
    <td><a href="javascript:printPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/print2.gif',1)"><img src="img/print1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
    <td><a href="javascript:submitPage(2)" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image51','','img/return2.gif',1)"><img src="img/return1.gif" name="Image51" width="70" height="20" border="0" id="Image5" /></a></td>
  <% } else { %>
    <td colspan="2"><a href="javascript:returnPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/return2.gif',1)"><img src="img/return1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
  <% } %>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<% } %>
</html:form>

</body>
</html>
<%@ page import="com.integrosys.cms.ui.collateral.commodity.loanagency.loanschedule.LoanScheduleAction,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ILoanSchedule,
                 com.integrosys.cms.ui.collateral.commodity.loanagency.loanschedule.LoanScheduleForm,
                 com.integrosys.cms.app.collateral.bus.type.commodity.ILoanAgency,
                 java.util.List,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 java.util.ArrayList,
                 com.integrosys.cms.app.common.constant.ICMSConstant,
                 com.integrosys.base.uiinfra.mapper.MapperUtil,
                 java.util.Locale,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.math.BigDecimal,
                 com.integrosys.cms.ui.common.UIUtil"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/loanagency/loanschedule/chk_view_loan_schedule.jsp,v 1.9 2006/10/27 08:31:21 hmbao Exp $
*
* Purpose: Commodity - Security
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.9 $
* Date: $Date: 2006/10/27 08:31:21 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("from_page");
    LoanScheduleForm aForm = (LoanScheduleForm)request.getAttribute("LoanScheduleForm");
    ILoanAgency loanAgencyObj = (ILoanAgency)session.getAttribute("com.integrosys.cms.ui.collateral.commodity.CommodityMainAction.serviceLoanAgency");
    String currencyCode = (loanAgencyObj.getPrincipleAmount()!=null?loanAgencyObj.getPrincipleAmount().getCurrencyCode():null);
    ILoanAgency actual = (ILoanAgency) request.getAttribute("actualLoanAgency");
    ILoanAgency staging = (ILoanAgency) request.getAttribute("stageLoanAgency");
    Locale locale = (Locale)session.getAttribute(ICommonEventConstant.GLOBAL_SCOPE+"."+com.integrosys.base.uiinfra.common.Constants.GLOBAL_LOCALE_KEY);
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

//-->
</script>

</head>

<body>
<html:form action="LoanSchedule.do">
<input type="hidden" name="event" value="<%=LoanScheduleAction.EVENT_RETURN%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>

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
      <h3><%=loanAgencyObj.getIsEqualInstalments()?"Equal":"Non-Equal"%>&nbsp; <bean:message key="label.security.title.edit.loan.schedule"/></h3>
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
            ILoanSchedule[] actualSchedule = null;
            ILoanSchedule[] stageSchedule = null;
            if (loanAgencyObj.getIsEqualInstalments()) {
                actualSchedule = loanAgencyObj.getLoanSchedules();
                stageSchedule = loanAgencyObj.getLoanSchedules();
            } else {
                if (actual != null && staging != null &&
                    actual.getIsEqualInstalments() != staging.getIsEqualInstalments()) {
                    actualSchedule = loanAgencyObj.getLoanSchedules();
                    stageSchedule = loanAgencyObj.getLoanSchedules();
                } else {
                    if (actual != null) {
                        actualSchedule = actual.getLoanSchedules();
                    }
                    if (staging != null) {
                        stageSchedule = staging.getLoanSchedules();
                    }
                }
            }
            List res = CompareOBUtil.compOBArray(stageSchedule, actualSchedule);
            ArrayList list = new ArrayList(res);
            pageContext.setAttribute("scheduleList",list);
            if (list == null || list.size() == 0) {
        %>
        <tr class="odd"><td colspan="5">There is no loan schedule.</td></tr>
        <%
            }  else {
                int counter = 0;
        %>
		<logic:present name="scheduleList" >
        <logic:iterate id="compResult" name="scheduleList"  type="com.integrosys.base.techinfra.diff.CompareResult"  >
        <%
            ILoanSchedule schedule = (ILoanSchedule)compResult.getObj();
        %>
        <tr class="<%=counter%2==0?"odd":"even"%>">
          <td class="<bean:write name="compResult" property="key" />" width="4%"><%=counter + 1%></td>
          <td width="19%"><integro:date object="<%=schedule.getPaymentDate()%>"/>&nbsp;</td>
          <td width="21%">
            <integro:empty-if-null value="<%=currencyCode%>"/>&nbsp;
            <%
                String strAmt = null;
                BigDecimal total = null;
                if (schedule.getPrincipalDueAmount() != null) {
                    strAmt = UIUtil.formatNumber(schedule.getPrincipalDueAmount().getAmountAsBigDecimal(), 2, locale);
                    total = schedule.getPrincipalDueAmount().getAmountAsBigDecimal();
                }
            %>
            <integro:empty-if-null value="<%=strAmt%>"/>
          </td>
          <td width="25%">
            <integro:empty-if-null value="<%=currencyCode%>"/>&nbsp;
            <%
                strAmt = null;
                if (schedule.getInterestDueAmount() != null) {
                    strAmt = UIUtil.formatNumber(schedule.getInterestDueAmount().getAmountAsBigDecimal(), 2, locale);
                    if (total != null) {
                        total = total.add(schedule.getInterestDueAmount().getAmountAsBigDecimal());
                    } else {
                        total = schedule.getInterestDueAmount().getAmountAsBigDecimal();
                    }
                }
            %>
            <integro:empty-if-null value="<%=strAmt%>"/>
          </td>
          <td width="31%">
          <integro:empty-if-null value="<%=currencyCode%>"/>&nbsp;
          <%
              strAmt = null;
              if (total != null) {
                  strAmt = UIUtil.formatNumber(total, 2, locale);
              }
          %>
          <integro:empty-if-null value="<%=strAmt%>"/>
          </td>
        </tr>
        <%
            counter++;
        %>
        </logic:iterate>
        </logic:present>
        <%
            }
        %>
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
    <td colspan="2"><a href="javascript:returnPage()" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image41','','img/return2.gif',1)"><img src="img/return1.gif" name="Image41" width="70" height="20" border="0" id="Image4" /></a></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

</body>
</html>
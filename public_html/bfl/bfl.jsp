<%@ page import="com.integrosys.cms.app.customer.bus.OBCMSCustomer,
                 com.integrosys.cms.app.limit.bus.OBLimit,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.cms.app.limit.bus.OBLimitSearchResult,
                 com.integrosys.base.businfra.currency.Amount,
                 com.integrosys.base.businfra.currency.CurrencyManager,
                 java.util.Collection,
                 java.util.Vector,
                 com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 com.integrosys.base.uiinfra.tag.PageIndex,
                 com.integrosys.cms.app.limit.bus.OBLimitSearchResult,
                 com.integrosys.cms.app.limit.bus.OBLimitCollateralSearchResult"%>
                 
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblFormSection tbody tr {
	height : 16px ;
}
</style>


<!-- InstanceEndEditable -->
</head>

<body>
<form name="BflForm" method="POST" action="/cms/Bfl.do?event=bfl">

<!-- InstanceBeginEditable name="Content" -->
<table width="22%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px;padding-left:6px">
  <thead>
  </thead>
  <tbody>
    <tr>
      <td colspan="2" nowrap style="padding-left:5px">&nbsp;</td>
    </tr>
    <tr>
      <td width="10" nowrap valign="top">-</td>
      <td width="164" height="18"><a href="CustDetails(ajax,mode=view).htm" target="mainFrame" title="View Customer Details">
        <bean:message key="title.customer.view"/></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td height="18">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18"><a href="Bfl.do?event=issue_draft_bfl" title="Issue Draft BFL">
        <bean:message key="title.bfl.issuedraftbfl"/></a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="Bfl.do?event=send_draft_bfl" title="Send Draft BFL">
        <bean:message key="title.bfl.senddraftbfl"/></a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="Bfl.do?event=recv_draft_bfl_ack" title="Receive Draft BFL">
        <bean:message key="title.bfl.recvdraftbflack"/></a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="Bfl.do?event=issue_clean_type_bfl" title="Issue Clean-Type BFL">
        <bean:message key="title.bfl.issue.clean.type"/></a></td>
    </tr>
    <tr>
      <td nowrap valign="top">-</td>
      <td height="18" nowrap><a href="Bfl.do?event=special_issue_clean_type_bfl" title="Special Issue Clean-Type BFL">
        <bean:message key="title.bfl.special.issue.clean.type"/></a></td>
    </tr>
    <tr>
      <td nowrap="nowrap" valign="top">-</td>
      <td height="18" nowrap="nowrap"><a href="Bfl.do?event=issue_final_bfl" title="Issue Final BFL"><bean:message key="title.bfl.issuefinalbfl"/></a></td>
    </tr>
    <tr>
      <td nowrap valign="top">&nbsp;</td>
      <td height="18" nowrap="nowrap" wrap >&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">&nbsp;</td>
      <td height="18" nowrap="nowrap" wrap >&nbsp;</td>
    </tr>
    <tr>
      <td nowrap valign="top">&nbsp;</td>
      <td height="18" nowrap="nowrap" wrap >&nbsp;</td>
    </tr>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</body>
<!-- InstanceEnd --></html>

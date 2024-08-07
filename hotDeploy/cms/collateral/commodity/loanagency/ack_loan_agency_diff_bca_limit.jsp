<%@ page import="com.integrosys.cms.ui.collateral.commodity.loanagency.LoanAgencyAction"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%
    String from_event = request.getParameter("from_page");
%>
<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/loanagency/ack_loan_agency_diff_bca_limit.jsp,v 1.5 2006/10/27 08:31:13 hmbao Exp $
*
* Purpose: Read the data of the Collateral
* Description: Type - Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.5 $
* Date: $Date: 2006/10/27 08:31:13 $
* Tag: $Name:  $
*/
%>
<script type="text/javascript" src="js/imageNavigation.js"></script>
<script language="JavaScript" type="text/JavaScript">
<!--

function returnPage(num) {
    if (num == 0) {
        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_CANCEL%>";
    } else {
        document.forms[0].event.value = "<%=LoanAgencyAction.EVENT_READ_RETURN%>";
    }
    document.forms[0].submit();
}

//-->
</script>



<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<!-- InstanceBeginEditable name="CssStyle" -->

 <!-- InstanceBeginEditable name="head" --> 
</head>
<body>
<html:form action="LoanAgency.do">
<input type="hidden" name="event"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>

<!-- InstanceBeginEditable name="Content" -->
<table width="460" height="260" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInfo" style="margin-top:30px">
  <thead>
  </thead>
  <tbody>
    <tr class="odd">
      <td style="text-align:center" valign="middle"><table width="400" height="200" border="0" cellpadding="10" cellspacing="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr>
              <td class="even" style="text-align:center" valign="middle">
                <table width="300" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
                  <tr class="even">
                      <td style="border:none;text-align:right;padding-right:8px" width="100"><strong><img src="img/noentry.gif" width="50" height="50" /></strong></strong></td>
                      <td style="border:none" width="200"><strong><font size="2"><%=from_event.equals(LoanAgencyAction.EVENT_PREPARE_UPDATE)?"View/Edit":"View"%> <bean:message key="label.security.not.allow.syndicate.facility"/></font></strong></td>
                    </tr>
                    <tr class="even">
                    <td colspan="2" style="border:none;text-align:center"><br />
                    <bean:message key="label.security.limit.msg"/>
                    </td>
                    </tr>
                </table> </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </tbody>
</table>
<table width="142" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="76">&nbsp;</td>
    <td width="66">&nbsp;</td>
  </tr>
  <tr>
  <%
      if (from_event.equals(LoanAgencyAction.EVENT_PREPARE_UPDATE)) {
  %>
    <td width="76"><a href="javascript:returnPage(0)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image511','','img/return2.gif',1)"><img src="img/return1.gif" name="Image511" border="0" id="Image5" /></a></td>
  <%
      } else {
  %>
    <td width="76"><a href="javascript:returnPage(1)" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image511','','img/return2.gif',1)"><img src="img/return1.gif" name="Image511" border="0" id="Image5" /></a></td>
  <% } %>
  </tr>
  <tr>
    <td style="text-align:center" width="76">&nbsp;</td>
    <td style="text-align:center" width="66">&nbsp;</td>
  </tr>
</table>
</html:form>

</body>
</html>
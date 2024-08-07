<%@ page import="com.integrosys.cms.ui.collateral.commodity.approvedcommodity.ApprovedCommAction,
                 com.integrosys.cms.ui.collateral.commodity.approvedcommodity.ApprovedCommForm,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/approvedcommodity/view_approvedcomm.jsp,v 1.10 2006/10/27 08:30:48 hmbao Exp $
*
* Purpose: Commodity - Approved Commodity
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.10 $
* Date: $Date: 2006/10/27 08:30:48 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("from_page");
    ApprovedCommForm aForm = (ApprovedCommForm)request.getAttribute("ApprovedCommForm");

    String title = "View";
    if (from_event.equals(CommodityMainAction.EVENT_PREPARE_CLOSE)) {
        title = "Close";
    }

    CommodityCategoryList categoryList = CommodityCategoryList.getInstance();
%>



<html>
<head>
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
    document.forms[0].event.value = "<%=ApprovedCommAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}

function updateReturnPage() {
    document.forms[0].event.value = "<%=ApprovedCommAction.EVENT_CANCEL%>";
    document.forms[0].submit();
}
//-->
</script>

</head>

<body>
<html:form action="ApprovedComm.do">
<input type="hidden" name="event" value="<%=ApprovedCommAction.EVENT_READ_RETURN%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>

<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font><bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<br/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3><%=title%> <bean:message key="label.security.title.commodity"/></h3>
    </td>
  </tr>
  </thead> <tbody>

  </tbody>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
    <td>
      <h3><bean:message key="label.security.approved.commodity.product.type"/></h3>
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
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:message key="label.security.id"/&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%"><bean:write name="ApprovedCommForm" property="securityID"/>&nbsp;</td>
          <td width="20%" class="fieldname"><bean:message key="label.security.sub.type"/></td>
          <td width="30%">
          <integro:empty-if-null value="<%=categoryList.getCommCategoryItem(aForm.getSecuritySubType())%>"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.approved.commodity.product"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
          <integro:empty-if-null value="<%=categoryList.getCommProductItem(aForm.getSecuritySubType(), aForm.getProductType())%>"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.commodity.prod.subtype"/>&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="ApprovedCommForm" property="productSubType"/>&nbsp;</td>
        </tr>
        </tbody>
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
  <%
      if (from_event.equals(CommodityMainAction.EVENT_PREPARE_UPDATE)) {
  %>
    <a href="javascript:updateReturnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
  <% } else { %>
    <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
  <% } %>
  </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

</body>
</html>
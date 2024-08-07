<%@ page import="com.integrosys.cms.ui.collateral.commodity.approvedcommodity.ApprovedCommAction,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.collateral.commodity.approvedcommodity.ApprovedCommForm,
                 com.integrosys.cms.app.collateral.bus.type.commodity.IApprovedCommodityType"%>

<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/approvedcommodity/update_approvedcomm.jsp,v 1.9 2006/10/27 08:30:48 hmbao Exp $
*
* Purpose: Commodity - Approved Commodity
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.9 $
* Date: $Date: 2006/10/27 08:30:48 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("event");
    if (request.getParameter("from_page") != null) {
        from_event = request.getParameter("from_page");
    }

    ApprovedCommForm aForm = (ApprovedCommForm)request.getAttribute("ApprovedCommForm");
    String securitySubType = "";
    if (request.getParameter("event").equals(ApprovedCommAction.EVENT_REFRESH)) {
        securitySubType = (String)request.getAttribute("securitySubType");
    } else if (request.getParameter("event").equals(ApprovedCommAction.EVENT_CREATE) ||
            request.getParameter("event").equals(ApprovedCommAction.EVENT_UPDATE)) {
        securitySubType = request.getParameter("securitySubType");
    } else {
        securitySubType = aForm.getSecuritySubType();
    }
    String index = request.getParameter("indexID");

    boolean is_add = false;
    if (index.equals("-1")) {
        is_add = true;
    }
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

function submitPage(num) {
    if (num == 1) {
        document.forms[0].event.value = "<%=ApprovedCommAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=ApprovedCommAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=ApprovedCommAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value= "<%=ApprovedCommAction.EVENT_REFRESH%>";
    }
    document.forms[0].submit();
}

//-->
</script>

</head>

<body>
<html:form action="ApprovedComm.do">
<input type="hidden" name="event" value="<%=ApprovedCommAction.EVENT_UPDATE%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="secIndexID" value="<%=request.getParameter("secIndexID")%>"/>
<!-- InstanceBeginEditable name="Content" -->
<p class="required"><font color="#0000FF">*</font> Mandatory for Submission&nbsp;</p><br>
<br/>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.security.commodity"/></h3>
    </td>
  </tr>
  </thead>
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
          <td width="20%" class="fieldname"><bean:message label.security.id"/>&nbsp;<font color="#0000FF">* </font></td>
          <td width="30%">
          <%
              if (is_add) {
          %>
            <html:select property="securityID" onchange="submitPage(4)">
	        <option value="" ><bean:message key="label.please.select"/></option>
	        <html:options name="secID" labelName="secValue"/>
            </html:select>&nbsp;
            <html:errors property="securityID"/>
          <% } else { %>
          <integro:empty-if-null value="<%=aForm.getSecurityID()%>"/>
          <html:hidden property="securityID"/>
          <% } %>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.sub.type"/></td>
          <td width="30%">
          <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommCategoryItem(securitySubType)%>"/>
          <input type="hidden" name="securitySubType" value="<%=securitySubType%>"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.approved.commodity.product"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:select property="productType" onchange="submitPage(4)">
	        <option value="" ><bean:message key="label.please.select"/></option>
	        <html:options name="productID" labelName="productValue"/>
            </html:select>&nbsp;
            <html:errors property="productType"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.commodity.prod.subtype"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:select property="productSubType">
	        <option value="" ><bean:message key="label.please.select"/></option>
	        <html:options name="productSubID" labelName="productSubValue"/>
            </html:select>&nbsp;
            <html:errors property="productSubType"/>
          </td>
        </tr>
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
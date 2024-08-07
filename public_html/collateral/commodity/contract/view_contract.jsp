<%@ page import="com.integrosys.cms.ui.collateral.commodity.contract.ContractAction,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.cms.app.commodity.CommodityConstant,
                 com.integrosys.cms.ui.collateral.commodity.contract.ContractForm,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.commodityglobal.commodityuom.MarketUOMList,
                 com.integrosys.cms.ui.collateral.TimeFreqList"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/contract/view_contract.jsp,v 1.11 2006/10/27 08:30:55 hmbao Exp $
*
* Purpose: Commodity - Contract
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.11 $
* Date: $Date: 2006/10/27 08:30:55 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("from_page");
    ContractForm aForm = (ContractForm)request.getAttribute("ContractForm");

    String title = "View";
    if (from_event.equals(CommodityMainAction.EVENT_PREPARE_CLOSE)) {
        title = "Close";
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

function returnPage() {
    document.forms[0].event.value = "<%=ContractAction.EVENT_READ_RETURN%>";
    document.forms[0].submit();
}
//-->
</script>

</head>
<body>
<html:form action="Contract.do">
<input type="hidden" name="event" value="<%=ContractAction.EVENT_READ_RETURN%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><%=title%> <bean:message key="label.security.title.commodity"/></h3></td>
    </tr>
    <tr>
      <td> <h3><bean:message key="label.security.title.view.contract.infor"/></h3></td>
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
          <td width="30%"><bean:write name="ContractForm" property="securityID"/>&nbsp;</td>
          <td width="20%" class="fieldname"><bean:message key="label.security.sub.type"/></td>
          <td width="30%">
          <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommCategoryItem(aForm.getSecuritySubType())%>"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.approved.commodity.product"/>&nbsp;<font color="#0000FF">* </font></td>
          <td><integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommProductItem(aForm.getSecuritySubType(), aForm.getProductType())%>"/></td>
          </td>
          <td class="fieldname"><bean:message key="label.security.approved.commodity.prod"/>&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="ContractForm" property="productSubType"/>&nbsp;</td>
        </tr>
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:message key="label.security.supplier"/></td>
          <td width="30%"><bean:write name="ContractForm" property="supplier"/>&nbsp;</td>
          <td width="20%" class="fieldname"><bean:message key="label.security.maturity.date.contract"/></td>
          <td width="30%"><bean:write name="ContractForm" property="contractMaturityDate"/>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.min.shipping.freq"/></td>
          <td><bean:write name="ContractForm" property="minShippingFreq"/>&nbsp;
              <integro:empty-if-null value="<%=TimeFreqList.getInstance().getTimeFreqItem(aForm.getMinShippingFreqUOM())%>"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.last.shipment.date"/></td>
          <td><bean:write name="ContractForm" property="lastShipmentDate"/>&nbsp;</td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.main.contract.no"/>&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="ContractForm" property="mainContractNo"/>&nbsp;</td>
          <td class="fieldname"><bean:message key="label.security.main.contract.price"/>&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="ContractForm" property="mainContractPriceCcy"/>&nbsp;
          <bean:write name="ContractForm" property="mainContractPrice"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.contract.quantity"/>&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="ContractForm" property="contractQty"/>&nbsp;</td>
          <td class="fieldname"><bean:message key="label.security.unit.measure"/>&nbsp;<font color="#0000FF">* </font></td>
          <td><bean:write name="ContractForm" property="contractUOM"/>&nbsp;</td>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.main.contract.amount"/></td>
          <td><bean:write name="ContractForm" property="mainContractAmtCcy"/>&nbsp;
          <bean:write name="ContractForm" property="mainContractAmt"/>
          </td>
          <td class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.remarks"/></td>
          <td colspan="3">
            <integro:wrapper value="<%=aForm.getContractRemarks()%>" />&nbsp;
          </td>
        </tr>
        </tbody>
      </table>
    </td>
    </tr>
  </tbody>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
    <td>
      <h3><bean:message key="label.security.contract.quantity.diff"/></h3>
    </td>
  </tr>
  <tr>
    <td>
      <hr/>
    </td>
  </tr>
  </thead> <tbody>
  <tr>
    <td>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tblInfo">
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:message key="label.cash.margin.plus.minus"/></td>
          <td width="30%">
            <%  if (aForm.getDiffQuantitysign() != null) {
                if (aForm.getDiffQuantitysign().equals(CommodityConstant.SIGN_MINUS)) { %>
            -
            <% } else if (aForm.getDiffQuantitysign().equals(CommodityConstant.SIGN_PLUS)) { %>
            +
            <% } else if (aForm.getDiffQuantitysign().equals(CommodityConstant.SIGN_PLUS_OR_MINUS)) { %>
            &plusmn;
            <% } } %>&nbsp;
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.quantity.diff"/></td>
          <td width="30%">
            <bean:write name="ContractForm" property="quantityDiff"/>&nbsp;%
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
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td>
    <a href="javascript:returnPage()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3311','','img/return2.gif',1)"><img src="img/return1.gif" name="Image3311"  border="0" id="Image3311" /></a>
  </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</html:form>

</body>
</html>

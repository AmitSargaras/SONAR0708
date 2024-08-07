<%@ page import="com.integrosys.cms.ui.collateral.commodity.contract.ContractAction,
                 com.integrosys.cms.ui.collateral.commodity.CommodityMainAction,
                 com.integrosys.cms.app.commodity.CommodityConstant,
                 com.integrosys.cms.ui.commodityglobal.CommodityCategoryList,
                 com.integrosys.cms.ui.collateral.commodity.contract.ContractForm,
                 com.integrosys.cms.app.collateral.bus.type.commodity.IContract,
                 java.util.Collection,
                 java.util.Iterator"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
/**
* Copyright Integro Technologies Pte Ltd
* $Header: /home/cms2/cvsroot/cms2/public_html/collateral/commodity/contract/update_contract.jsp,v 1.15 2006/10/27 08:30:55 hmbao Exp $
*
* Purpose: Commodity - Contract
* Description: Commodity
*
* @author $Author: hmbao $<br>
* @version $Revision: 1.15 $
* Date: $Date: 2006/10/27 08:30:55 $
* Tag: $Name:  $
*/
%>
<%
    String from_event = request.getParameter("event");
    if (request.getParameter("from_page") != null) {
        from_event = request.getParameter("from_page");
    }

    String title = "Add New";

    ContractForm aForm = (ContractForm)request.getAttribute("ContractForm");
    String securitySubType = "";
    String event = request.getParameter("event");
    if (event.equals(ContractAction.EVENT_REFRESH) ||
            event.equals(ContractAction.EVENT_PREPARE)) {
        securitySubType = (String)request.getAttribute("securitySubType");
    } else if (event.equals(ContractAction.EVENT_CREATE) ||
            event.equals(ContractAction.EVENT_UPDATE)) {
        securitySubType = request.getParameter("securitySubType");
    } else {
        securitySubType = aForm.getSecuritySubType();
    }

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
        document.forms[0].event.value = "<%=ContractAction.EVENT_CREATE%>";
    }
    if (num == 2) {
        document.forms[0].event.value = "<%=ContractAction.EVENT_UPDATE%>";
    }
    if (num == 3) {
        document.forms[0].event.value = "<%=ContractAction.EVENT_CANCEL%>";
    }
    if (num == 4) {
        document.forms[0].event.value= "<%=ContractAction.EVENT_REFRESH%>";
    }
    document.forms[0].submit();
}
//-->
</script>

</head>
<body>
<html:form action="Contract.do">
<input type="hidden" name="event" value="<%=ContractAction.EVENT_UPDATE%>"/>
<input type="hidden" name="from_page" value="<%=from_event%>"/>
<input type="hidden" name="indexID" value="<%=request.getParameter("indexID")%>"/>
<input type="hidden" name="secIndexID" value="<%=request.getParameter("secIndexID")%>"/>
<p class="required"><font color="#0000FF">*</font> <bean:message key="label.global.mandatory.for.submission"/>&nbsp;</p><br>
<!-- InstanceBeginEditable name="Content" -->
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
    <tr>
      <td><h3><bean:message key="label.security.commodity"/></h3></td>
    </tr>
    <tr>
      <td> <h3><%=title%><bean:message key="label.security.contract.infor"/></h3></td>
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
            <html:select property="securityID" onchange="submitPage(4)">
	        <option value="" ><bean:message key="label.please.select"/> </option>
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
          <td width="20%" class="fieldname"><bean:message key="label.security.sub.type"/></td>
          <td width="30%">
            <integro:empty-if-null value="<%=CommodityCategoryList.getInstance().getCommCategoryItem(securitySubType)%>"/>
            <html:hidden property="securitySubType" value="<%=securitySubType%>"/>
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
          <td class="fieldname"><bean:message key="label.security.approved.commodity.prod"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:select property="productSubType" onchange="submitPage(4)">
	        <option value="" ><bean:message key="label.please.select"/></option>
	        <html:options name="productSubID" labelName="productSubValue"/>
            </html:select>&nbsp;
            <html:errors property="productSubType"/>
          </td>
        </tr>
        <tbody>
        <tr class="odd">
          <td width="20%" class="fieldname"><bean:message key="label.security.supplier"/></td>
          <td width="30%">
            <html:select property="supplier">
	        <option value="" ><bean:message key="label.please.select"/></option>
	        <html:options name="supplierID" labelName="supplierValue"/>
            </html:select>&nbsp;
            <html:errors property="supplier"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.maturity.date.contract"/></td>
          <td width="30%">
			  <html:text property="contractMaturityDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('contractMaturityDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="contractMaturityDate"/>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.min.shipping.freq"/> </td>
          <td>
            <html:text property="minShippingFreq" maxlength="3" size="4"/>
            <html:select property="minShippingFreqUOM">
	        <option value="" ><bean:message key="label.please.select"/></option>
	        <html:options name="timeFreqID" labelName="timeFreqValue"/>
            </html:select>&nbsp;
            <html:errors property="minShippingFreqUOM"/>
            <html:errors property="minShippingFreq"/>
            <html:errors property="minShippingFreqUOM"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.last.shipment.date"/></td>
          <td>
			  <html:text property="lastShipmentDate" readonly="true" size="15" maxlength="11" />
              <img src="img/calendara.gif"  name="Image724" border="0" id="Image724" onclick="return showCalendar('lastShipmentDate', 'dd/mm/y');" onmouseover="MM_swapImage('Image724','','img/calendarb.gif',1)" onmouseout="MM_swapImgRestore()" />
              <html:errors property="lastShipmentDate"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.main.contract.no"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:text property="mainContractNo" maxlength="50"/>
            <html:errors property="mainContractNo"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.main.contract.price"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:select property="mainContractPriceCcy">
	        <option value="" ><bean:message key="label.please.select"/> </option>
	        <html:options name="currencyCode" labelName="currencyCode"/>
            </html:select>&nbsp;
            <html:text property="mainContractPrice" maxlength="27"/>
            <html:errors property="mainContractPriceCcy"/>
            <html:errors property="mainContractPrice"/>
          </td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.security.contract.quantity"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:text property="contractQty" maxlength="27"/>&nbsp;
            <html:errors property="contractQty"/>
          </td>
          <td class="fieldname"><bean:message key="label.security.unit.measure"/>&nbsp;<font color="#0000FF">* </font></td>
          <td>
            <html:select property="contractUOM">
	        <option value="" ><bean:message key="label.please.select"/></option>
	        <html:options name="unitOfMeasureID" labelName="unitOfMeasureValue"/>
            </html:select>&nbsp;
            <html:errors property="contractUOM"/>
          </td>
        </tr>
        <tr class="odd">
          <td class="fieldname"><bean:message key="label.security.main.contract.amount"/></td>
          <td><bean:write name="ContractForm" property="mainContractAmtCcy"/>&nbsp;
          <bean:write name="ContractForm" property="mainContractAmt"/>
            <html:hidden property="mainContractAmtCcy"/>
            <html:hidden property="mainContractAmt"/>
          </td>
          <td class="fieldname">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr class="even">
          <td class="fieldname"><bean:message key="label.remarks"/></td>
          <td colspan="3">
            <html:textarea property="contractRemarks" rows="3" cols="100" style="width:100%" />
              &nbsp; <html:errors property="contractRemarks" />
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
            <html:radio property="diffQuantitysign" value="<%=CommodityConstant.SIGN_PLUS%>">+</html:radio>
            &nbsp;&nbsp;
            <html:radio property="diffQuantitysign" value="<%=CommodityConstant.SIGN_MINUS%>">-</html:radio>
            &nbsp;&nbsp;
            <html:radio property="diffQuantitysign" value="<%=CommodityConstant.SIGN_PLUS_OR_MINUS%>" disabled="true">&plusmn;</html:radio>
            <html:errors property="diffQuantitySign"/>
          </td>
          <td width="20%" class="fieldname"><bean:message key="label.security.quantity.diff"/></td>
          <td width="30%">
            <html:text property="quantityDiff" maxlength="3" size="4"/>&nbsp;%&nbsp;
            <html:errors property="quantityDiff"/>
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

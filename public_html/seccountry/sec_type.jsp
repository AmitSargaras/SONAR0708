
<%@ page import="java.util.ArrayList,
                 com.integrosys.base.techinfra.util.DateUtil,
                 com.integrosys.base.techinfra.diff.CompareOBUtil,
                 com.integrosys.cms.app.chktemplate.trx.OBDocumentItemTrxValue,
                 com.integrosys.cms.app.chktemplate.bus.IDocumentItem,
                 com.integrosys.cms.app.chktemplate.bus.OBDocumentItem,
                 java.util.Collection,
                 com.integrosys.cms.ui.seccountry.SecurityCountryForm"%>
<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/seccountry/sec_type.jsp,v 1.6 2006/10/27 08:47:26 hmbao Exp $
 * @author $Author: hmbao $<br>
 * @version $Revision: 1.6 $
 * @since $Date: 2006/10/27 08:47:26 $
 * Tag: $Name:  $
 */
 %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
    ArrayList secLabel = new ArrayList((Collection) request.getAttribute("secTypeLabel"));
    ArrayList secValue = new ArrayList((Collection) request.getAttribute("secTypeValue"));
    String countryName = (String) request.getAttribute("countryName");
    if (countryName == null || countryName.equals("")) {
        SecurityCountryForm aForm = (SecurityCountryForm) request.getAttribute("SecurityCountryForm");
        countryName = aForm.getCountryName();
    }
    String formNumber = "1";
    String frame = (String) session.getAttribute("com.integrosys.cms.ui.seccountry.SecurityCountryAction.frame");
    if (!"true".equals(frame)) {
        formNumber = "0";
    }

%>



<html><!-- InstanceBegin template="/Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->


<!-- InstanceEndEditable -->
<SCRIPT LANGUAGE="JavaScript">
function loadPage(secType) {
    formObj = document.forms[<%=formNumber%>];
    if(formObj==undefined){
        formObj = document.forms[0];
    }
	formObj.secType.value=secType;
	formObj.event.value="country_sec_list";
	formObj.submit();
}
</SCRIPT></head>

<body>
<html:form action="SecurityCountry">
<input type="hidden" name="event" />
<input type="hidden" name="secType" />
<html:hidden property="countryCode" />
<input type="hidden" name="secTypeDesc" />
<input type="hidden" name="countryName" value="<%=countryName%>" />
<!-- InstanceBeginEditable name="Content" -->
<table width="25%" border="0" align="left" cellpadding="0" cellspacing="0" class="tblFormSection" style="margin-top:10px">
  <thead>
  </thead>
  <tbody>
    <tr>
      <td colspan="3" nowrap="nowrap" style="padding-left:5px">&nbsp;</td>
    </tr>
    <tr>
      <td nowrap="NOWRAP">&nbsp;</td>
      <td height="16" colspan="2" nowrap="NOWRAP"><strong>&nbsp;<%=countryName%></strong></td>
    </tr>
    <tr>
      <td nowrap="NOWRAP">&nbsp;</td>
      <td nowrap="NOWRAP">&nbsp;</td>
      <td height="16" nowrap="NOWRAP">&nbsp;</td>
    </tr>
    <%
        if(secValue!=null && secLabel!=null) {
            for(int i=0;i<secValue.size();i++){
    %>
    <tr>
      <td width="11" nowrap="NOWRAP">&nbsp;</td>
      <td width="9" nowrap="NOWRAP">-</td>
      <td height="16" nowrap="NOWRAP"><a href="#" onClick="loadPage('<%=(String)secValue.get(i)%>')"><%=(String)secLabel.get(i) %></a></td>
    </tr>
    <% }}%>
  </tbody>
</table>
<!-- InstanceEndEditable -->
</html:form>
</body>
<!-- InstanceEnd --></html>

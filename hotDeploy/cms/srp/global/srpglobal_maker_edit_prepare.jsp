<%@ page import="com.integrosys.cms.ui.srp.global.SRPGlobalAction,
                 java.util.*,
                 org.apache.struts.util.LabelValueBean,
                 com.integrosys.cms.ui.srp.global.SRPGlobalForm,
                 com.integrosys.cms.ui.srp.global.SRPGlobalConstants"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%
	String event = request.getParameter("event");
%>



<html><!-- InstanceBegin template="Templates/ContentPage.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="CssStyle" -->

<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" -->
<style>
table.tblInput tbody tr td.fieldname {
	width : 150px;
}
</style>

<script type="text/javascript" src="js/imageNavigation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--

function submitPage() {
	<% if ("maker_prepare_srpglobal".equals(event) ||
		"maker_edit_srpglobal_read".equals(event)) { %>
    	document.forms[0].event.value="maker_edit_srpglobal_read";
    <% } else { %>
    	document.forms[0].event.value="<%=SRPGlobalAction.EVENT_VIEW%>";
    <% } %>
    document.forms[0].submit();
}
//-->
</script>
<!-- InstanceEndEditable -->
</head>
<body>
	
<!-- InstanceBeginEditable name="Content" -->
<html:form action="<%=SRPGlobalConstants.ACTION_URL%>">
<input type="hidden" name="event"/>

<%@include file="/common/mandatory_for_submission_note.jsp" %><br>

  <table width="40%" border="0" align="center" cellpadding="0" cellspacing="0">	
    <tr>    	
      <td>
      	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblInput">
      	  <thead>
      	  	<tr>
			  <td colspan="2"><bean:message key="label.global.enterSearchCriteria"/></td>
			</tr>
      	  </thead>	
          <tbody>
            <tr class="odd">
              <td class="fieldname">
              	<bean:message key="label.security.type"/>&nbsp;<font color="#0000FF">*</font>
              </td>
              <td>
                <html:select property="securityTypeCode">
                    <option value="">Please Select</option>
                    <html:options
                        collection="com.integrosys.cms.ui.srp.global.SRPGlobalAction.collateral.types.list"
                        property="typeCode" labelProperty="typeName"/>
                </html:select>
                <html:errors property="securityTypeCode"/>
              </td>
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
	<% if ("maker_prepare_srpglobal".equals(event) ||
		"maker_edit_srpglobal_read".equals(event)) { %>    
      <td align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/edit2.gif',1)"
        onClick="javascript:submitPage()"><img src="img/edit1.gif" name="Image1"  border="0" id="Image1" /></a></td>
    <% } else { %>
      <td align="center"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image1','','img/view2.gif',1)"
        onClick="javascript:submitPage()"><img src="img/view1.gif" name="Image1"  border="0" id="Image1" /></a></td>
    <% } %>
    </tr>
  </table>
</form>
<!-- InstanceEndEditable -->
</body>
</html:form>
<!-- InstanceEnd --></html>

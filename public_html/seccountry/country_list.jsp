<%@ page import="java.util.List,
                 com.integrosys.base.techinfra.util.DateUtil"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>

<%
    boolean viewOnly = false;
  if(request.getParameter("view")!=null &&request.getParameter("view").equals("view")){
      viewOnly=true;
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
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
function showType(){
//    alert(secTypeDesc);
	if(document.forms[0].countryCode.value!="") {
	    document.forms[0].event.value="country_sec_list";
		document.forms[0].submit();
	}
}
</script>
<!-- InstanceEndEditable -->
</head>

<body>
<html:form action="SecurityCountry">
<%if(viewOnly){%>
<input type="hidden" name="view" value="view">
<%}%>
<input type="hidden" name="event">
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3>Security Doc Template</h3></td>
  </tr>
  <tr>
    <td><hr /></td>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblInfo">
          <thead>
          </thead>
          <tbody>
            <tr class="odd">
              <td class="fieldname">Country</td>
              <td><html:select property="countryCode" onchange="showType()" >
				<integro:country-list/>
			  </html:select></td>
            </tr>
          </tbody>
        </table></td>
  </tr>
  </tbody>  
</table>
<!-- InstanceEndEditable --> 
</html:form>
</body>
<!-- InstanceEnd --></html>

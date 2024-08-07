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



<html>
<head>

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
	    document.forms[0].event.value="country_law_list";
		document.forms[0].submit();
	}
}
</script>

</head>

<body>
<html:form action="CCCountry">
<input type="hidden" name="event">
<%if(viewOnly){%>
<input type="hidden" name="view" value="view">
<%}%>
<!-- InstanceBeginEditable name="Content" -->
<table width="60%" border="0" align="center" cellpadding="0" cellspacing="0" class="tblFormSection">
  <thead>
  <tr>
      <td><h3>Constitutional / Contractual Doc (Country) Template </h3></td>
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

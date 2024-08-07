<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>
<optionlist>

<%
String estateType = (String)request.getAttribute("estateType");
String commRealEstateType = (String)request.getAttribute("commRealEstateType");
String prioritySector = (String)request.getAttribute("prioritySector");
System.out.println(estateType+"--------"+commRealEstateType+"----------"+prioritySector);
 %>
<critranch estateType='<%=estateType %>' commRealEstateType='<%=commRealEstateType %>' prioritySector='<%=prioritySector %>' /> 
</optionlist>
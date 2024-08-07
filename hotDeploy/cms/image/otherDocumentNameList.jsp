<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
String type = (String) request.getAttribute("type");
%>
<?xml version="1.0"?>
<optionlist>
<%if("Facility".equals(type)) {%>
 	<logic:iterate id="curOp" indexId="curInd" name="filteredOtherDocList" scope="request" type="java.lang.String">
   		<option label="<%= curOp %>" value="<%= curOp %>"></option>	
 	</logic:iterate>
 <%}else if("Security".equals(type)){ %>
 	 <logic:iterate id="curOp" indexId="curInd" name="filteredOtherSecDocList" scope="request" type="java.lang.String">
   		<option label="<%= curOp %>" value="<%= curOp %>"></option>	
 	</logic:iterate>
 <%} %> 
</optionlist>
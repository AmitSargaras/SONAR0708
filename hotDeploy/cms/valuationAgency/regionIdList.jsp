<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
	
	
	System.out.println("fhghsjdhgsjkhgjks k============ ");
%>
<?xml version="1.0"?>
<optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="regionList" scope="request" type="org.apache.struts.util.LabelValueBean">
   <option label="<%= curOp.getLabel() %>" value="<%= curOp.getValue() %>"></option>	
 </logic:iterate> 
</optionlist>
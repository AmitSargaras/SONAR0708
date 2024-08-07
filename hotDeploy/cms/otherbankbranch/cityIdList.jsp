<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>
<%
List list =(ArrayList) request.getAttribute("cityList");


System.out.println("************************************ "
		+ list.size());

%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%><optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="cityList" scope="request" type="org.apache.struts.util.LabelValueBean">
   <option label="<%= curOp.getLabel() %>" value="<%= curOp.getValue() %>"></option>	
 </logic:iterate> 
</optionlist>
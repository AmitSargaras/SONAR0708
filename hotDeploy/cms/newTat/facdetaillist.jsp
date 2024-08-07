<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>

<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%><optionlist>

 
<logic:iterate id="curOp" indexId="curInd" name="facDetailList" scope="request" type="com.integrosys.cms.app.limit.bus.OBLimit">
 <%System.out.println("$$$$$$$$$$$$$$$$$$$$$$$ curOp.getLineNo() $$$$$$$$$$$$$$$$$$$$$$$$$$$$ :"+curOp.getLineNo()); 
%>
   <option  lineNumber="<%= curOp.getLineNo() %>" ></option>
 </logic:iterate> 
 <%
 List serialList = (List)request.getAttribute("serialList");
 serialList.removeAll(Collections.singleton(null));
 pageContext.setAttribute("serialList",serialList);

 %>
 <logic:iterate id="curOp1" indexId="curInd1" name="serialList" scope="request" type="org.apache.struts.util.LabelValueBean">
 <%if(curOp1.getLabel()!= null){ %>
   <option label="<%= curOp1.getLabel() %>" value="<%= curOp1.getValue() %>"></option>	
   <% }%>
   <%System.out.println("$$$$$$$$$$$$$$$$$$$$$$$ curOp.getserialNo() $$$$$$$$$$$$$$$$$$$$$$$$$$$$ :"+curOp1.getValue()); %>
 </logic:iterate> 
 

</optionlist>
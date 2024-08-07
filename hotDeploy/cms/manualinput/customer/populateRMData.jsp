<%@page import="com.hdfcbank.xsd.isd.panval.PopulateRMDataResponseType"%>
<%
String relationshipMgr = (String) request.getAttribute("relationshipMgr");
String rmRegion = (String)request.getAttribute("rmRegion");

out.println("relationshipMgr:"+relationshipMgr+";");
out.println("rmRegion:"+rmRegion);

%>
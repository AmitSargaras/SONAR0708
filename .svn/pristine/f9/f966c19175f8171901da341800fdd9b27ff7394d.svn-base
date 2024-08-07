<%@ page import="com.integrosys.cms.ui.collateral.SecuritySubTypeUtil"%>

<% String subtypeCode = (String)request.getAttribute("subtypeCode");
	String event = (String)request.getParameter("event");
	String trxID = (String)request.getParameter("trxID");
	
	SecuritySubTypeUtil subTypeUtil = new SecuritySubTypeUtil();
	String forwardURL = "//"+subTypeUtil.getUrl(subtypeCode, event) +"&trxID="+trxID;

%>

<jsp:include  page="<%=forwardURL%>" />


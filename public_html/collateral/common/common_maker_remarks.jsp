<%@ page import="com.integrosys.cms.app.common.constant.ICMSConstant" %>

<%
	String trxStatus = request.getParameter("trxStatus");
%>

<% if (ICMSConstant.STATE_REJECTED.equals(trxStatus) || ICMSConstant.STATE_REJECTED_CREATE.equals(trxStatus)) { %>
<%@ include file="common_remarks.jsp" %>
<% } %>
<%
	String from_event = request.getParameter("from_event");

	if (from_event == null) {
%>
<%@ include file="/collateral/pledge/edit_pledge_content.jsp" %>
<% 
	} else if (from_event.equals("process")) {  
%>
<%@ include file="/collateral/pledge/chk_view_pledge_detail.jsp" %>
<% } else { %>
<%@ include file="/collateral/pledge/view_pledge_detail_content.jsp" %>
<% } %>
<%@ include file="/template/charset_template.jsp" %>
<%     
    System.out.println("----------------- Session Reloaded -------------------------");
%>


<%-- Broadcast check --%>

<jsp:include page="/template/check_broadcast.jsp" >
	<jsp:param name="showBroadcastStatus" value="true"/>
</jsp:include>

<%-- end of Broadcast check --%> 

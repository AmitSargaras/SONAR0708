<%@ include file="/console/console_template.jsp" %>

<%@ page import="com.integrosys.base.techinfra.propertyfile.PropertyManager,
				java.util.*
	"%>

<%
    String token = (String)request.getAttribute("ssltoken");
    String userID = (String)request.getAttribute("ofaUserLoginID");
    String maxAgePasswordWarn = (String)request.getAttribute("maxAgePasswordWarn");
    String maxAgePasswordChange = (String)request.getAttribute("maxAgePasswordChange");
    String url = "https://"+request.getServerName() + ":" + request.getServerPort()+request.getContextPath()+PropertyManager.getValue("login.ssl.verify.url");
    String ofaRoleID = (String)request.getAttribute("ofaRoleID");
    String realm = (String)request.getAttribute("realm");
    
    System.out.println("login.ssl.verify.url: " + url);
    System.out.println("Token: " + token);
    System.out.println("userID: " + userID);
    response.sendRedirect(url + "?event=verify&ofaUserLoginID=" + userID + "&ssltoken=" + token + "&maxAgePasswordChange=" + maxAgePasswordChange + "&maxAgePasswordWarn=" + maxAgePasswordWarn + "&ofaRoleID=" + ofaRoleID + "&realm=" + realm);
%>
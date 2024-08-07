<%@ page import="java.io.ByteArrayOutputStream" %>
<%
	String fileName = (String)request.getAttribute("fileName") ;
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition","attachment;filename="+fileName);
	response.setHeader("Pragma", "public");
	response.setHeader("Cache-Control", "public") ;
	ByteArrayOutputStream stream=(ByteArrayOutputStream)request.getAttribute("output");	
	out.clear();
	out.print(new String(stream.toByteArray()));
	out.close();
%>
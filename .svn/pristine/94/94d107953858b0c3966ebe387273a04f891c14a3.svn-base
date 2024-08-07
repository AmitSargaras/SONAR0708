<%@ page import="java.io.ByteArrayOutputStream" %><%
response.setContentType("application/vnd.ms-excel");
response.setHeader("Pragma", "public");
response.setHeader("Cache-Control", "public") ;
String fileName = (String)request.getAttribute("fileName") ;
response.setHeader("Content-disposition","attachment;filename="+fileName);
ByteArrayOutputStream stream=(ByteArrayOutputStream)request.getAttribute("output");
//ByteArrayOutputStream stream=(ByteArrayOutputStream)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.output");
ServletOutputStream servletstream=response.getOutputStream();
servletstream.write(stream.toByteArray());
response.flushBuffer();
%>
<%@ page import="java.io.ByteArrayOutputStream" %><%
response.setContentType("application/pdf");
response.setHeader("Pragma", "public");
String pID = (String)request.getAttribute("pID");
String status = (String)request.getAttribute("status");
String count = (String)request.getAttribute("count");
String category = (String)request.getAttribute("category");
String imageName = (String)request.getAttribute("imageName");
String index = (String)request.getAttribute("index");
String event = (String)request.getAttribute("event");
String id = (String)request.getAttribute("id");
System.out.println("  pID is  = "+pID+"   status is =  "+status+"   count is = "+count+" imagename is = "+imageName+" category is ="+category);
System.out.println("  id is ***************  = "+id);
response.setHeader("Cache-Control", "public") ;
String fileName = "abc.pdf";//(String)request.getAttribute("fileName") ;
//response.setHeader("Content-disposition","attachment;filename="+fileName);
ByteArrayOutputStream stream=(ByteArrayOutputStream)request.getAttribute("output");
//ByteArrayOutputStream stream=(ByteArrayOutputStream)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.output");
ServletOutputStream servletstream=response.getOutputStream();
servletstream.write(stream.toByteArray());
response.flushBuffer();
out.clear();
out = pageContext.pushBody();
%>


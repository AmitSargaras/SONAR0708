<%@ page import="java.io.ByteArrayOutputStream" %><%
String fileName = (String)request.getAttribute("fileName") ;
if(fileName !=null){
if(fileName.toUpperCase().endsWith(".JPEG")||fileName.toUpperCase().endsWith(".JPG")){
	response.setContentType("application/JPEG");	
}else if (fileName.toUpperCase().endsWith(".TIF")||fileName.toUpperCase().endsWith(".TIFF")){
	response.setContentType("application/TIF");	
}else if(fileName.toUpperCase().endsWith(".PDF")){
	response.setContentType("application/PDF");	
}else if(fileName.toUpperCase().endsWith(".ZIP")){
	response.setContentType("application/zip");	
}
}else{
response.setContentType("application/JPeG");
}
response.setHeader("Pragma", "public");
response.setHeader("Cache-Control", "public") ;

System.out.println("fileName :"+fileName);
response.setHeader("Content-disposition","attachment;filename="+fileName);
ByteArrayOutputStream stream=(ByteArrayOutputStream)request.getAttribute("output");
ServletOutputStream servletstream=response.getOutputStream();
servletstream.write(stream.toByteArray());
response.flushBuffer();
%>
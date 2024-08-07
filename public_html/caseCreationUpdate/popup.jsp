<%@ page import="java.io.ByteArrayOutputStream" %><%
String imageName = (String)request.getAttribute("imageName") ;
if(imageName !=null){
if(imageName.toUpperCase().endsWith(".JPEG")||imageName.toUpperCase().endsWith(".JPG")){
	response.setContentType("application/JPEG");	
}else if (imageName.toUpperCase().endsWith(".TIF")||imageName.toUpperCase().endsWith(".TIFF")){
	response.setContentType("application/TIF");	
}else if(imageName.toUpperCase().endsWith(".PDF")){
	response.setContentType("application/PDF");	
}
}else{
response.setContentType("application/JPeG");
}
response.setHeader("Pragma", "public");
response.setHeader("Cache-Control", "public") ;

System.out.println("fileName :"+imageName);
response.setHeader("Content-disposition","attachment;filename="+imageName);
ByteArrayOutputStream stream=(ByteArrayOutputStream)request.getAttribute("output");
//ByteArrayOutputStream stream=(ByteArrayOutputStream)session.getAttribute("com.integrosys.cms.ui.poi.report.ReportAction.output");
ServletOutputStream servletstream=response.getOutputStream();
servletstream.write(stream.toByteArray());
response.flushBuffer();
%>
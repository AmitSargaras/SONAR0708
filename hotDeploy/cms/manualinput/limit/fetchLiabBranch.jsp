<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
%>
<% 	
	String fcubsLiabBranch=(String)request.getAttribute("fcubsLiabBranch");
	String fcubsLiabResponce=(String)request.getAttribute("fcubsLiabResponce");

	
if(fcubsLiabResponce.isEmpty()){
	out.println("fcubsLiabBranch:"+fcubsLiabBranch);
}else {
	out.println("fcubsLiabResponce:"+fcubsLiabResponce);
}
	
%>


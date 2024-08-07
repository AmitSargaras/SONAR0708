<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
%>
<% 	
	String fcubsCoBorrowerName=(String)request.getAttribute("fcubsCoBorrowerName");
String event=(String)request.getAttribute("event");
String fromEvent=(String)request.getAttribute("fromEvent");

String facilityType=(String)request.getAttribute("facilityType");
String fcubsCoBorrowerResponce=(String)request.getAttribute("fcubsCoBorrowerResponce");


//fcubsResponce="failed deta";
//fcubsUtilizedAmt="200.00";
if(fcubsCoBorrowerResponce.isEmpty()){
	out.println("fcubsCoBorrowerName:"+fcubsCoBorrowerName);
}else{
	out.println("fcubsCoBorrowerResponce:"+fcubsCoBorrowerResponce);
}
	
	
%>


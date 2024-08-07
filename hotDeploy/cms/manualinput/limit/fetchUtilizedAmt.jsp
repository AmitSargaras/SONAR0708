<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
%>
<% 	
	String fcubsUtilizedAmt=(String)request.getAttribute("fcubsUtilizedAmt");
String event=(String)request.getAttribute("event");
String fromEvent=(String)request.getAttribute("fromEvent");

String facilityType=(String)request.getAttribute("facilityType");
String fcubsResponce=(String)request.getAttribute("fcubsResponce");


//fcubsResponce="failed deta";
//fcubsUtilizedAmt="200.00";
if(fcubsResponce.isEmpty()){
	out.println("utilizedAmt:"+fcubsUtilizedAmt);
}else{
	out.println("fcubsResponce:"+fcubsResponce);
}
	
	
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/UdfTag.tld" prefix="udf"%>
<%@page import="com.integrosys.cms.ui.manualinput.limit.XRefDetailForm"%>
<% 	
XRefDetailForm value = (XRefDetailForm) request.getAttribute("XRefDetailForm");
	request.setAttribute("XRefDetailForm",value);
	
	String udfTab = request.getParameter("udfTab");
	
%>
<html>
<bean:define id="formObj" name="XRefDetailForm" scope="request" type="com.integrosys.cms.ui.manualinput.limit.XRefDetailForm"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/udf.js"></script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<jsp:include page="udf_limit_hidden_error.jsp"></jsp:include>
	<jsp:include page="hidden_release_line_detail.jsp"></jsp:include>
	
	<%if("udf_2".equals(udfTab) ){  
  %>
		<udf:udfDisplay2 module="4" action="view" refId="<%=value.getUdfAllowed_2()%>"  refId2="<%=value.getUdfAllowed()%>"/>
	
		<%} else{  %>
	<udf:udfDisplay module="3" action="view" refId="<%=value.getUdfAllowed()%>"  refId2="<%=value.getUdfAllowed_2()%>"/>
	
	<%} %>
	
	
</body>

<!-- Uma:Added below for IE11 -->
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/UdfTag.tld" prefix="udf"%>
<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<% 	
	ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
	request.setAttribute("ManualInputCustomerInfoForm",value);
%>
<html>
<bean:define id="formObj" name="ManualInputCustomerInfoForm" scope="request" type="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
</script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<jsp:include page="non_cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="udf_hidden_details.jsp"></jsp:include>
	<udf:udfDisplay module="1" action="view"/>
</body>

<!-- Uma:Added below for IE11 -->
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" styleId="cifId"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" styleId="pan"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="status" styleId="status"/>
</html>
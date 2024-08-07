<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@page import="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"%>
<%@ taglib uri="/WEB-INF/UdfTag.tld" prefix="udf"%>
<%@page import="java.util.*"%>

<%@page import=""%>
<% 	
	ManualInputCustomerInfoForm value = (ManualInputCustomerInfoForm) request.getAttribute("ManualInputCustomerInfoForm");
	request.setAttribute("ManualInputCustomerInfoForm",value);
	
	String[] revisedArr1 = value.getRevisedEmailIdsArray();
	 String[] revisedArr = value.getRevisedEmailIdsArray();
	 int len = 0;
	 
	 value.setRevisedEmailIdsArray(value.getRevisedEmailIdsArray());
	 
	if(value != null){
		if(value.getRevisedEmailIdsArray() != null){
			for(int i=0; i<value.getRevisedEmailIdsArray().length;i++){
				System.out.println("cibil details=>+++++value.getRevisedEmailIdsArray()--=======>"+value.getRevisedEmailIdsArray()[i].toString()+" ** value.getRevisedEmailIdsArray().length=>"+value.getRevisedEmailIdsArray().length);
			}
		}
	}
	
	
	List revisedArr22 = value.getRevisedArrayListN();
	 
	
	if(value != null){
		if(value.getRevisedEmailIdsArray() != null){
			len = revisedArr1.length;
			revisedArr = new String[len];
			for(int i=0; i<value.getRevisedEmailIdsArray().length;i++){
				revisedArr[i] = revisedArr1[i];
				System.out.println("I="+i+" ** revisedArr[i]===>"+revisedArr[i]);
			}
		}
	}  
	
	System.out.println("Revised ArrayList create cibil method =>"+value.getRevisedArrayListN());
	/* List arr12 = value.getRevisedArrayListN();
	System.out.println("arr12.size()=>"+arr12.size());
	pageContext.setAttribute("arr12",arr12); */
	pageContext.setAttribute("revisedArr",revisedArr);
	int cnt = 0;
	
%>
<html>
<bean:define id="formObj" name="ManualInputCustomerInfoForm" scope="request" type="com.integrosys.cms.ui.manualinput.customer.ManualInputCustomerInfoForm"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="all" href="css/calendar-blue.css" />
<script language="JavaScript" src="js/calendar.js"></script>
<script language="JavaScript" src="js/calDriver.js"></script>
<script type="text/javascript" src="js/udf.js"></script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<jsp:include page="non_cri_hidden_details.jsp"></jsp:include>
	<jsp:include page="cri_hidden_details.jsp"></jsp:include>

	<jsp:include page="udf_cam_hidden_error.jsp"></jsp:include>
	
	<udf:udfDisplay module="1" action="add"/>
	
	<logic:present name="revisedArr">
									<logic:iterate id="ob" name="revisedArr" 
											scope="page"
											>
										<% 
										String str = revisedArr1[cnt].toString();
										System.out.println("++**++*+*+*+ str=>"+str);
										%>
										
											<html:hidden name="ManualInputCustomerInfoForm" property="revisedEmailIdsArray" value="<%=str%>"/>
										
										<%cnt++;
										%>
									</logic:iterate>
								</logic:present>		
	
</body>

<!-- Uma:Added below for IE11 -->
	<html:hidden name="ManualInputCustomerInfoForm" property="cifId" styleId="cifId"/>
	<html:hidden name="ManualInputCustomerInfoForm" property="pan" styleId="pan"/>
</html>
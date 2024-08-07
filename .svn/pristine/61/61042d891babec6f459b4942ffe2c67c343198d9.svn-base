<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>
<%@ taglib uri="/WEB-INF/UdfTag.tld" prefix="udf"%>
<%@page import="com.integrosys.cms.ui.manualinput.limit.XRefDetailForm"%>
<%@page import="com.integrosys.cms.app.limit.trx.ILimitTrxValue"%>
<%@page import="com.integrosys.cms.app.limit.bus.ILimitSysXRef"%>
<%@page import="com.integrosys.cms.app.customer.bus.ICustomerSysXRef"%>
<% 	
XRefDetailForm value = (XRefDetailForm) request.getAttribute("XRefDetailForm");
	request.setAttribute("XRefDetailForm",value);
	
	String udfTab = request.getParameter("udfTab");

	ILimitTrxValue lmtTrxObj = (ILimitTrxValue) session.getAttribute("com.integrosys.cms.ui.manualinput.limit.LmtDetailAction.lmtTrxObj");
	 
	 String status = (String)request.getAttribute("status");
	 String isModify="NO";
	 System.out.println("<<<<<<<<<status of read udf>>>>>>>>"+status);
	 ICustomerSysXRef obj=null;
	 
	 //SimpleDateFormat sdf = new SimpleDateFormat("dd-Mon-yy"); 
	 if(lmtTrxObj!= null && lmtTrxObj.getLimit()!= null){
 		System.out.println("111");
 		boolean flag = false;
 		long SID=0;
 		ILimitSysXRef[] refArr = lmtTrxObj.getLimit().getLimitSysXRefs();
 		ILimitSysXRef[] refStageArr = lmtTrxObj.getStagingLimit().getLimitSysXRefs();

 		if(null!=refStageArr){
			for(int k=0;k<refStageArr.length;k++){
		 		System.out.println("<<<<<<<<<refStageArr[k].getCustomerSysXRef().getAction()>>>>>>>>"+refStageArr[k].getCustomerSysXRef().getAction());	
		 		if(null!=refStageArr[k].getCustomerSysXRef() && 
				 	"PENDING_UPDATE".equals(refStageArr[k].getCustomerSysXRef().getStatus())){
			 		SID=refStageArr[k].getSID();
		 		}
			}
 		}
	
		if (refArr != null) {
			for(int i=0;i<refArr.length;i++){
				if(refArr[i].getCustomerSysXRef()!=null && refArr[i].getSID()==SID){
					isModify="YES";
					obj=refArr[i].getCustomerSysXRef();
					request.setAttribute("ICustomerSysXRef",obj);
				}
			}
		}
 	}	
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
	<%if("udf_2".equals(udfTab) ){    %>
	<%if("YES".equals(isModify) && "PENDING_UPDATE".equals(status)){ %>
			<udf:udfDisplay2 module="4" action="view" refId="<%=value.getUdfAllowed_2()%>" refId2="<%=value.getUdfAllowed()%>" oldUdf="<%=obj.getUdfAllowed_2()%>"/>
	<%}else{ %>
		<udf:udfDisplay2 module="4" action="view" refId="<%=value.getUdfAllowed_2()%>" refId2="<%=value.getUdfAllowed()%>"/>
	<%} %>
	<%} else{   %>
	<%if("YES".equals(isModify) && "PENDING_UPDATE".equals(status)){ %>
		<udf:udfDisplay module="3" action="view" refId="<%=value.getUdfAllowed()%>" refId2="<%=value.getUdfAllowed_2()%>"  oldUdf="<%=obj.getUdfAllowed()%>"/>
	<%}else{ %>
		<udf:udfDisplay module="3" action="view" refId="<%=value.getUdfAllowed()%>"  refId2="<%=value.getUdfAllowed_2()%>"/>
	<%} %>
	<%} %>
	
</body>

<!-- Uma:Added below for IE11 -->
</html>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import=" java.text.DateFormat,
            java.util.Date"  %>
<?xml version="1.0"?>
<%@page import="java.util.HashMap"%>
<optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="camList" scope="request" type="com.integrosys.cms.app.limit.bus.OBLimitProfile">
<%
String camDate="-";
String expiryDate="-";
DateFormat defaultDf = DateFormat.getDateTimeInstance();

if(null!=curOp){
	if(null!=curOp.getNextAnnualReviewDate()){
		expiryDate = defaultDf.format(curOp.getNextAnnualReviewDate());
		expiryDate=expiryDate.substring(0,12);
	}
	
	if(null!=curOp.getApprovalDate()){
		camDate = defaultDf.format(curOp.getApprovalDate());
		camDate=camDate.substring(0,12);
	}
}
System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> curOp.getCamType() "+curOp.getCamType());
%>
 
   <option camType="<%= curOp.getCamType() %>" camDate="<%= camDate %>"  expiryDate="<%=expiryDate %>"   ></option>
  
</logic:iterate>
</optionlist>

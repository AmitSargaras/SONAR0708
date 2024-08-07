<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import=" java.text.DateFormat,
            java.util.Date"  %>
<?xml version="1.0"?>
<%@page import="java.util.HashMap"%>
<%System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ON JSP"); %>

<%@page import="com.integrosys.cms.ui.common.UIUtil"%><optionlist>
 <logic:iterate id="curOp" indexId="curInd" name="currencyList" scope="request" type="com.integrosys.cms.batch.forex.OBForex">
<%

System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> exchangeRate "+String.valueOf( curOp.getRate()));
%>
 
   <option exchangeRateINR="<%=UIUtil.formatWithCommaAndDecimal(String.valueOf( curOp.getRate())) %>"    ></option>
  
</logic:iterate>
</optionlist>




  

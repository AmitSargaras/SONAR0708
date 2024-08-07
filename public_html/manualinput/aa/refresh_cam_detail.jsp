
<%@page import="com.crystaldecisions.enterprise.ocaframework.idl.OCA.property"%><%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<% 
String annualReviewDate = (String)request.getAttribute("annualReviewDate");
System.out.print("strAnnualReviewDate==========="+annualReviewDate);
%>

<html:hidden property ="annualReviewDate" value="<%=annualReviewDate %>"/>
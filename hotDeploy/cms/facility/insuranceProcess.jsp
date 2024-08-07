<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro"%>

<% 
	boolean isProcess = true;
%>

<jsp:include page="/facility/insuranceView.jsp" >
	<jsp:param name="isProcess" value="<%=isProcess %>"/>
</jsp:include>
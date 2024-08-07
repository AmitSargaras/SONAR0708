<%@page import="com.integrosys.base.uiinfra.common.AbstractCommonMapper"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@page import="com.integrosys.cms.ui.collateral.guarantees.GuaranteesAction,
				com.integrosys.cms.ui.collateral.guarantees.linedetail.ILineDetailConstants"%>

<?xml version="1.0"?>
<%
	String dropdownName = (String) request.getAttribute(ILineDetailConstants.REQUEST_DROPDOWN_NAME);
	String requestList = null;
	if(ILineDetailConstants.DROPDOWN_FACILITY_ID.equals(dropdownName)){
		requestList = GuaranteesAction.class.getName() + "." + ILineDetailConstants.SESSION_FAC_ID_LIST;
	}else if(ILineDetailConstants.DROPDOWN_LINE_NO.equals(dropdownName)){
		requestList = GuaranteesAction.class.getName() + "." + ILineDetailConstants.SESSION_FAC_LINE_NO_LIST;
	}
		
	if(!AbstractCommonMapper.isEmptyOrNull(dropdownName)){
%>
	<optionlist>
	 <logic:iterate id="curOp" indexId="curInd" name="<%=requestList%>" scope="session" type="org.apache.struts.util.LabelValueBean">
	 	<option label="<%=curOp.getLabel() %>" value="<%=curOp.getValue()%>"></option>	
	 </logic:iterate> 
	</optionlist>
<%
	}
%> 
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.MarketableSecAction"%>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.IMarketableEquityLineDetailConstants"%>
<%@page import="com.integrosys.base.techinfra.logger.DefaultLogger"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="/WEB-INF/IntegroTag.tld" prefix="integro" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<?xml version="1.0"?>

<%
	String dropdownName = (String) request.getAttribute(IMarketableEquityLineDetailConstants.REQUEST_DROPDOWN_NAME);
	String requestList = null;
	if(IMarketableEquityLineDetailConstants.DROPDOWN_FACILITY_ID.equals(dropdownName)){
		requestList = MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_FAC_ID_LIST;
	}else if(IMarketableEquityLineDetailConstants.DROPDOWN_LINE_NO.equals(dropdownName)){
		requestList = MarketableSecAction.class.getName() + "." + IMarketableEquityLineDetailConstants.SESSION_FAC_LINE_NO_LIST;
	}
		
	if(dropdownName!=null&&!dropdownName.trim().equals("")){
%>		
	<optionlist>
	 <logic:iterate id="curOp" indexId="curInd" name="<%=requestList%>" scope="session" type="org.apache.struts.util.LabelValueBean">
	 	<option label="<%=curOp.getLabel()%>" value="<%=curOp.getValue()%>"></option>	
	 </logic:iterate> 
	</optionlist>
<%	
	}
%>
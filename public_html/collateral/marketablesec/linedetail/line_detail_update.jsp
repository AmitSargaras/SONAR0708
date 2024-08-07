<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.MarketableEquityLineDetailAction"%>
<%
	String subtype = (String) request.getAttribute("subtype");
	String path = "/collateral/marketablesec/";
	if("MarksecBondLocal".equals(subtype)){
		path += "bond/";
	}
	path += "linedetail/line_detail.jsp";
%>
<jsp:include page="<%=path%>">
	<jsp:param name="editMode" value="true"/>
	<jsp:param name="pageMode" value="Update"/>
	<jsp:param name="submitEvent" value="<%=MarketableEquityLineDetailAction.EVENT_EDIT_LINE_DETAIL%>"/>
</jsp:include>
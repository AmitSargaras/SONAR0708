<%@page import="com.integrosys.cms.ui.collateral.guarantees.linedetail.LineDetailAction"%>
<jsp:include page="/collateral/guarantees/linedetail/line_detail.jsp">
	<jsp:param name="editMode" value="true"/>
	<jsp:param name="pageMode" value="Add"/>
	<jsp:param name="submitEvent" value="<%=LineDetailAction.EVENT_CREATE_LINE_DETAIL%>"/>
</jsp:include>
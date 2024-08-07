<%
	String subtype = (String) request.getAttribute("subtype");
	String path = "/collateral/marketablesec/";
	if("MarksecBondLocal".equals(subtype)){
		path += "bond/";
	}
	path += "linedetail/line_detail.jsp";
%>
<jsp:include page="<%=path%>">
	<jsp:param name="editMode" value="false"/>
	<jsp:param name="pageMode" value="View"/>
</jsp:include>
<%@page import="com.integrosys.cms.ui.collateral.marketablesec.linedetail.MarketableEquityLineDetailAction"%>
<%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.IMutualFundsFeedEntry"%>
<%@page import="com.integrosys.cms.app.feed.bus.mutualfunds.OBMutualFundsFeedEntry"%>
<%
IMutualFundsFeedEntry obMutualFundsEntry = null;
if(request.getAttribute("fundsFeedEntry")!= null){
obMutualFundsEntry = (OBMutualFundsFeedEntry)request.getAttribute("fundsFeedEntry");
System.out.println("In Line_detail_create.jsp "+obMutualFundsEntry);
System.out.println("In Line_detail_create.jsp "+obMutualFundsEntry.getSchemeType());
}else{
	System.out.println("In Line_detail_create.jsp object is null");
}
	String subtype = (String) request.getAttribute("subtype");
	String path = "/collateral/marketablesec/";
	if("MarksecBondLocal".equals(subtype)){
		path += "bond/";
	}
	path += "linedetail/line_detail.jsp";
%>
<jsp:include page="<%=path%>">
	<jsp:param name="editMode" value="true"/>
	<jsp:param name="pageMode" value="Add"/>
	<jsp:param name="submitEvent" value="<%=MarketableEquityLineDetailAction.EVENT_CREATE_LINE_DETAIL%>"/>
</jsp:include>
                 

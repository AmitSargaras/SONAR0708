<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.Map"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%

    Map map = (Map) request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
	String rightPath = (String)map.get(ICommonEventConstant.RIGHT_FRAME);
	String rightPathTab = (String)map.get(ICommonEventConstant.RIGHT_FRAME_TAB);
    String leftPath = (String)map.get(ICommonEventConstant.LEFT_FRAME);
    System.out.println("///////////////////////////////// Right Frame is ///////////////////////////// " + rightPath);
    System.out.println("///////////////////////////////// Right Frame Tab is ///////////////////////////// " + rightPathTab);
	System.out.println("///////////////////////////////// Left Frame is ///////////////////////////// " + leftPath);

%>
<template:insert template='/template/common_frame_tab_container.jsp'>
	<template:put name='leftContainer' content='<%=leftPath%>'/>
	<template:put name='rightContainerTab' content='<%=rightPathTab%>' />
	<template:put name='rightContainer' content='<%=rightPath%>' />
</template:insert>
<%@ include file="/template/charset_template.jsp" %>

<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.HashMap"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%
    HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
    System.out.println(map);
    String rightPath = (String)map.get(ICommonEventConstant.RIGHT_FRAME);
    String rightPathTab = (String)map.get(ICommonEventConstant.RIGHT_FRAME_TAB);
    System.out.println("///////////////////////////////// Right Frame is ///////////////////////////// " + rightPath);
    System.out.println("///////////////////////////////// Right Frame Tab is ///////////////////////////// " + rightPathTab);
%>
<template:insert template='/template/common_tab_container.jsp'>
    <template:put name='rightContainerTab' content='<%=rightPathTab%>'/>
    <template:put name='rightContainer' content='<%=rightPath%>'/>
</template:insert>
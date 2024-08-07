<%@ include file="/template/charset_template.jsp" %>

<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/template/common_view_template.jsp,v 1.3 2003/12/04 09:59:51 phtan Exp $
 * @author $Author: phtan $<br>
 * @version $Revision: 1.3 $
 * @since $Date: 2003/12/04 09:59:51 $
 * Tag: $Name:  $
 */
 %>

<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.HashMap"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%

    HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
    //System.out.println(map);
	String rightPath = (String)map.get(ICommonEventConstant.RIGHT_FRAME);
    String leftPath = (String)map.get(ICommonEventConstant.LEFT_FRAME);
	
    System.out.println("///////////////////////////////// Right Frame is /////////////////////////////" + rightPath);

%>
<template:insert template='/template/common_basic_frame_container.jsp'>
	<template:put name='leftContainer' content='<%=leftPath%>'/>
	<template:put name='rightContainer' content='<%=rightPath%>'/>
</template:insert>
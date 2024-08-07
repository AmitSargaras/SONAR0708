<%@ include file="/template/charset_template.jsp" %>

<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/template/common_frame_template.jsp,v 1.5 2003/12/04 09:59:51 phtan Exp $
 * @author $Author: phtan $<br>
 * @version $Revision: 1.5 $
 * @since $Date: 2003/12/04 09:59:51 $
 * Tag: $Name:  $
 */
 %>

<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.HashMap"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%

    HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
	String rightPath = (String)map.get(ICommonEventConstant.RIGHT_FRAME);
    String leftPath = (String)map.get(ICommonEventConstant.LEFT_FRAME);
    System.out.println("///////////////////////////////// Right Frame is /////////////////////////////" + rightPath);
	System.out.println("///////////////////////////////// Left Frame is /////////////////////////////" + leftPath);

%>
<template:insert template='/template/common_frame_container.jsp'>
	<template:put name='leftContainer' content='<%=leftPath%>'/>
	<template:put name='rightContainer' content='<%=rightPath%>' />
</template:insert>
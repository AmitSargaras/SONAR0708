<%
/**
 * Copyright Integro Technologies Pte Ltd
 * $Header: /home/cms2/cvsroot/cms2/public_html/ccglobal/sc_maker_frame_template.jsp,v 1.1 2003/07/21 04:00:07 elango Exp $
 * @author $Author: elango $<br>
 * @version $Revision: 1.1 $
 * @since $Date: 2003/07/21 04:00:07 $
 * Tag: $Name:  $
 */
 %>

<%@ page import="com.integrosys.base.uiinfra.common.ICommonEventConstant,
                 java.util.HashMap"%>

<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>
<%

    HashMap map = (HashMap)request.getAttribute(ICommonEventConstant.ACTION_PROPERTIES);
    System.out.println(map);
	String rightPath = (String)map.get(ICommonEventConstant.RIGHT_FRAME);
    String leftPath = (String)map.get(ICommonEventConstant.LEFT_FRAME);
    System.out.println("///////////////////////////////// Rigth Frame is /////////////////////////////"+rightPath);
	System.out.println("///////////////////////////////// Left Frame is /////////////////////////////"+leftPath);

%>
<template:insert template='/ccglobal/sc_maker_frame_container.jsp'>
	<template:put name='leftContainer' content='<%=leftPath%>'/>
	<template:put name='rightContainer' content='<%=rightPath%>'/>
</template:insert>